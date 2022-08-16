Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACE81FAC
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 06:29:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id AAA75447D4;
	Tue, 16 Aug 2022 06:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1660631338; bh=ckiDupmPBCFt5SMzFxURk+watAFEoPDuoc/9452gvXQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Ar5abDx7A0c+SPmkDgRjZvHgyC3acBWOhO1cnDNxSe1PiunFA2WMG2wwfUHYow0pb
	 /kok3Crx9W64fVR5DXxsBmJKq7RoPPI1d6gDVGnARbs1M0QAFeXWKbMtyIB4uJNEib
	 ZHnKnuuED1+ByvC3nmXwOvwI74o92uHcrhz7WfQg0XBz35JLo5xLvmAOFVjP765eqA
	 NCVgsON2k+Q5nky+RyZU96b9dqN4aXKKxWgSagg8/u2nM5MBmI7Ao9q4/Sf0aOT4r2
	 YYPsxNKXe0/qeD16deX+5sDbKSdaeRmE+Bh1Vj2lN6rtgJbpqEA/kCPJW66t1EprpL
	 Y/kHN5S5EUsfA==
Message-ID: <24c88c4f-aea5-1fb7-0ead-95c88629d72b@marcan.st>
Date: Tue, 16 Aug 2022 15:28:50 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Will Deacon <will@kernel.org>,
 Tejun Heo <tj@kernel.org>, peterz@infradead.org, jirislaby@kernel.org,
 maz@kernel.org, mark.rutland@arm.com, boqun.feng@gmail.com,
 catalin.marinas@arm.com, oneukum@suse.com, roman.penyaev@profitbricks.com,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <YvqaK3hxix9AaQBO@slm.duckdns.org>
 <YvsZ6vObgLaDeSZk@gondor.apana.org.au>
 <CAHk-=wgSNiT5qJX53RHtWECsUiFq6d6VWYNAvu71ViOEan07yw@mail.gmail.com>
 <cd51b422-89f3-1856-5d3b-d6e5b0029085@marcan.st>
 <CAHk-=wjfLT7nL8pV8RWATpjgm0zDtUwT8UMtroqnGcXRjN8tgw@mail.gmail.com>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <CAHk-=wjfLT7nL8pV8RWATpjgm0zDtUwT8UMtroqnGcXRjN8tgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2022/08/16 14:52, Linus Torvalds wrote:
> I think I understand *why* it's broken - it looks like a "harmless"
> optimization. After all, if the bitop doesn't do anything, there's
> nothing to order it with.
> 
> It makes a certain amount of sense - as long as you don't think about
> it too hard.
> 
> The reason it is completely and utterly broken is that it's not
> actually just "the bitop doesn't do anything". Even when it doesn't
> change the bit value, just the ordering of the read of the old bit
> value can be meaningful, exactly for that case of "I added more work
> to the queue, I need to set the bit to tell the consumers, and if I'm
> the first person to set the bit I may need to wake the consumer up".

This is the same reason I argued queue_work() itself needs to have a
similar guarantee, even when it doesn't queue work (and I updated the
doc to match). If test_and_set_bit() is used in this kind of context
often in the kernel, clearly the current implementation/doc clashes with
that.

As I said, I don't have any particular beef in this fight, but this is
horribly broken on M1/2 right now, so I'll send a patch to change the
bitops instead and you all can fight it out over which way is correct :)

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
