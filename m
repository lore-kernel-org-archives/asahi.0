Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8860A53B0
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 17:21:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 03A7241A42;
	Tue, 16 Aug 2022 17:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1660670515; bh=b4EG0LTa8HIU16A9LTbhnmpSiFXMqiYjr5/PwslTjn8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NDT/wfyLBeksVX2whoG656IQBELw8GrtdHHV+e91oqOaTh4aoCoJMqrimcMRgCKMm
	 jcPpxORLtiwU3jdv6kY4lb55rhK3SnU5u1d+ViIbpE214Gx0s6jL3euXb1ZUcCmhqN
	 hP6mAI8e2e2qYlB9F3LLuUKfbb02+QKOr+/idlac/vUYib2MgR6/sPAWyHNQsMJTy4
	 M/dk7OBEaK4kb2/93j6+4ny+f0Hd4mctuYhUIj/zJacFroP12Rh3t19U58un/RGvRB
	 Zoi8N98LHEmAz3ocSL2lfxyODbctXAaeyrzL81rVK9vPMT1CMn58xSMgum03QxIQ+r
	 lfGz7DmjJG3uQ==
Message-ID: <b7a0082b-1bda-9a46-a979-8414d24d7dd2@marcan.st>
Date: Wed, 17 Aug 2022 02:21:48 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] workqueue: Fix memory ordering race in queue_work*()
Content-Language: es-ES
To: Tejun Heo <tj@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, will@kernel.org,
 peterz@infradead.org, jirislaby@kernel.org, maz@kernel.org,
 mark.rutland@arm.com, boqun.feng@gmail.com, catalin.marinas@arm.com,
 oneukum@suse.com, roman.penyaev@profitbricks.com, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <YvqaK3hxix9AaQBO@slm.duckdns.org>
 <YvsZ6vObgLaDeSZk@gondor.apana.org.au> <YvvFQwBVh1s23gbR@slm.duckdns.org>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <YvvFQwBVh1s23gbR@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/08/2022 01.26, Tejun Heo wrote:
> Hello,
> 
> On Tue, Aug 16, 2022 at 12:15:38PM +0800, Herbert Xu wrote:
>> Tejun Heo <tj@kernel.org> wrote:
>>>
>>> Oh, tricky one and yeah you're absolutely right that it makes no sense to
>>> not guarantee barrier semantics when already pending. I didn't even know
>>> test_and_set_bit() wasn't a barrier when it failed. Thanks a lot for hunting
>>> down and fixing this. Applied to wq/for-6.0-fixes.
>>
>> Please revert this as test_and_set_bit was always supposed to be
>> a full memory barrier.  This is an arch bug.
> 
> Alright, reverting.

FYI, Linus applied the alternate fix directly to his tree already, so
this is fixed on M1 either way. However, you may want to pay attention
to the discussion about the subtlety of the workqueue code pairing
test_and_set_bit() not with clear_bit(), but rather atomic_long_set(),
since it *could* imply it is still broken or might be broken in the
future, on other architectures.

- Hector
