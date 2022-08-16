Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3880D1C32
	for <asahi@lists.linux.dev>; Tue, 16 Aug 2022 05:37:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 8F51B447D8;
	Tue, 16 Aug 2022 05:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1660628259; bh=klFJScQtPdSGYcjCrTuLd0vmp+BxBQY7IprafXE1WXI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UYrY0eQvg03ffFpSW8MPibeWDmSlQ/yIUpjNy0a6r8M5yYDkXuuY2mgbvXGRIvUKV
	 GKz0u6P8fP347aqNjdqhKCYZ0hFw97bxhf4/fNsEOEsk0hKwi3mcerFSmxESOJtObT
	 ehE5TDjXiRASB0Tulir8a5ysB6oWfFiNPMGbPFaEHIkqpw3cbHaGwhpgxXXTL8zzPZ
	 Rk7YU9AniJOpzHeMzqoGsi2OYvQ/6Rcogj3a4cY18e2p+OdyQYoMJRUkxaqMCUj3Q8
	 sR2f1ZuFZuhOHeN4Zq5QAjXQLlzT+m6x0uN6nV8Fbd17jp7/ETXkceDCDFThJLdMRQ
	 HVN0NlTWFLFlw==
Message-ID: <923f9638-d443-cb8e-104f-41a7f34fa25c@marcan.st>
Date: Tue, 16 Aug 2022 14:37:33 +0900
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
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: tj@kernel.org, will@kernel.org, peterz@infradead.org,
 jirislaby@kernel.org, maz@kernel.org, mark.rutland@arm.com,
 boqun.feng@gmail.com, catalin.marinas@arm.com, oneukum@suse.com,
 roman.penyaev@profitbricks.com, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <YvsZvwxACuGw3KIt@gondor.apana.org.au>
From: Hector Martin <marcan@marcan.st>
In-Reply-To: <YvsZvwxACuGw3KIt@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/08/2022 13.14, Herbert Xu wrote:
> Hector Martin <marcan@marcan.st> wrote:
>>
>> This has been broken since the dawn of time, and it was incompletely
>> fixed by 346c09f80459, which added the necessary barriers in the work
>> execution path but failed to account for the missing barrier in the
>> test_and_set_bit() failure case. Fix it by switching to
>> atomic_long_fetch_or(), which does have unconditional barrier semantics
>> regardless of whether the bit was already set or not (this is actually
>> just test_and_set_bit() minus the early exit path).
> 
> test_and_set_bit is supposed to contain a full memory barrier.
> If it doesn't then your arch is broken and needs to be fixed.
> 
> Changing this one spot is pointless because such assumptions
> are all over the kernel.

Documentation/atomic_bitops.txt and the asm-generic implementaton
disagree with you, so this isn't quite as simple as "your arch is
broken" :-)

- Hector
