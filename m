Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E360817D0
	for <asahi@lists.linux.dev>; Wed, 11 Jan 2023 05:10:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id BE7A742165;
	Wed, 11 Jan 2023 05:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1673413848; bh=8p9ORD/j7MyhO+y0jemuohQe4qSH/sbLWaipDi0ZxtU=;
	h=Date:To:Cc:References:From:Subject:In-Reply-To;
	b=eJbjeLpx3locQgq2Ide2Gy2Z0NuQpOwqetqb56fj/QmKJ9+7f4TsjLb2AhTZqfHUA
	 vxKhqktsYfv7PKp0T23pA+W93fFKXKCATCDQkTNgcefNPX4TlewQCn/6Sm4YXl55IO
	 JBMYoNdDNvUUD0BQbHkfzai2owStuKyfJjP4lhSUOLHQLfmCoq5dsSuaFl/iMpgO92
	 mfSDZFctS2RoOfPIeMKmOSEWmz7iONmzp+hMoet/z2KyLos3AA8rVfKOCfxHNsGyJ5
	 ugfVZEEmGIsGCRgJ9QbQxm2eLty+mEHe8KeqZAGa6pzSbUBl4smDQTXpF9VrQdB+Mn
	 pgQe5J3y8KfLQ==
Message-ID: <fc2e03ea-5404-e768-0cab-e95adcde6da7@marcan.st>
Date: Wed, 11 Jan 2023 14:10:42 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
 Sagi Grimberg <sagi@grimberg.me>, Eric Curtin <ecurtin@redhat.com>,
 Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20230111043614.27087-1-marcan@marcan.st>
 <20230111043614.27087-2-marcan@marcan.st> <20230111045402.GB15520@lst.de>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 1/2] nvme-apple: Do not try to shut down the controller
 twice
In-Reply-To: <20230111045402.GB15520@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/01/2023 13.54, Christoph Hellwig wrote:
> On Wed, Jan 11, 2023 at 01:36:13PM +0900, Hector Martin wrote:
>> The blamed commit stopped explicitly disabling the controller when we do
>> a controlled shutdown, but apple_nvme_reset_work was only checking for
>> the disable bit before deciding to issue another disable. Check for the
>> shutdown state too, to avoid breakage.
>>
>> This issue does not affect nvme-pci, since it only issues controller
>> shutdowns when the system is actually shutting down anyway.
> 
> There's a few other places where nvme-pci does a shutdown like
> probe/reset failure and most notably and mostly notably various
> power management scenarios.
> 
> What path is causing a problem here for nvme-apple?  I fear we're
> missing some highler level check here and getting further out of
> sync.
> 

OK, so the first question is who is responsible for resetting the
controller after a shutdown? The spec requires a reset in order to bring
it back up from that state. Indeed the PCIe code does an explicit
disable right now (though, judging by the comment, it probably wasn't
done with the intent of resetting after a shutdown, it just happens to
work for that too :))

Right now, apple_nvme_reset_work() tries to check for the condition of
an enabled controller (under the assumption that it's coming from a live
controller, not considering shutdown/sleep) and issue an
apple_nvme_disable(). However, this doesn't work when resuming because
at that point the firmware coprocessor is shut down, so the device isn't
usable (can't even get a disable command to complete properly). Perhaps
a better conditional here would be to check for
apple_rtkit_is_running(), since apple_nvme_disable() can't work otherwise.

But then, even if we get past that, once apple_nvme_reset_work actually
resets the firmware CPU and kicks things back online, the controller is
still logically in the shutdown state. So something has to disable it in
order for nvme_enable_ctrl() to work.

An alternate patch would be to change the gate for apple_nvme_disable()
in apple_nvme_reset_work() to check for apple_rtkit_is_running() on top
of the controller enable state, and then add a further direct call to
nvme_disable_ctrl(..., false) later in apple_nvme_reset_work, once the
firmware is back up, to ensure we can enable it after. Thoughts?

Alternatively, we could just revert to the prior behavior of always
issuing a disable after a shutdown. We need to disable at some point to
come back anyway, so it might as well be done early (before we shut down
firmware, so it works).

- Hector
