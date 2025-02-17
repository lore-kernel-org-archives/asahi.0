Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A50A168B1
	for <asahi@lists.linux.dev>; Mon, 17 Feb 2025 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739782236; cv=none; b=UUmlZGlO6cbFmJpY18Za1NEE3CeXiDjGzqlz9Zgq/N5lc9gDh4wK0OrZ+mwDYmeweqJ+Qzdi7ou2ulMK7IG2X/DY/6a1KLeBb9eLdVZN6AK1I8jprurbHY16Ct5cgToDfkMEI6GAP2qUDUq2DFsYEZn6jlVv8yIKZAr+PIa/l6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739782236; c=relaxed/simple;
	bh=LDZvrvnajfFCiVKShOMNVT6PzhqmK7Xm5kz/f3v1gs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jJPwUpz7qk55/K6Aql12ONbHSLIR2ln4h1NA8qYr96AZRwCJaDd5XmtWweNZNiqAlvAOubzUsm3YXL+wriZf6o+q1zjHUz8j690mfO6yS9rlbCUiXvIqSSUWxljjyzTKfiYSzCQL/87aT2ToUG0t+9UDBXLo3P66gwIufEh4UjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ed7xkxnw; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ed7xkxnw"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54527a7270eso2814107e87.0
        for <asahi@lists.linux.dev>; Mon, 17 Feb 2025 00:50:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739782232; x=1740387032; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15sJlkRAVyPj2yXL2m25UxKAU72+1zx1kf/yxV8oK1Q=;
        b=Ed7xkxnwbVtnjuM2lcV6y0jZDcH7P7YFZUZ96F1EPRikZMUHCTkCrkAZQ5ebCfmNzg
         vztVfyesM94pNnerNMzQfsRt5a7O+DyM6OgNzTkWekpoL6J7r/YeVz2mXZIGCLHLoR73
         kbKH8UFiCLxKWC9Dcr5+aQ5ICJDTy9h236jWRLUSTufAKvuDzsPM/zpwCa9noQIIg4pH
         ItwMcN/BxCwbonfaaeRBX6Qm1vbcmSSUMOYdHXuFuhhYuqndKIzi7piqUJOZ4uD+M7Wh
         qJSegs1ZnzdzmHGrqi5TlmGDJvnb8SEP3JmE8/sFmrqDKOKXGb+Rw+dvsMkyReHKKA/v
         1eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739782232; x=1740387032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15sJlkRAVyPj2yXL2m25UxKAU72+1zx1kf/yxV8oK1Q=;
        b=EZ3VxfoiUuwgsCNJo+1kTneTwG1o+VTndB14ndWYHlHRZXHc19fMO2ZWj058Oh8EtX
         6MiyX2vYc3j+dAdItbNo5vDAFq/1q+AwqPT4amDATSQdSr66/m+EnFphaDYWcJxbASNO
         erz3/Ou25W/gnq8i7MHf0s5AQP1VFRW+Y8oEBNcSMMy4uK1SYKSsFgJGEhYnrzEUD63I
         Z8ZAM5SiFhlWQuqR8iYalbM6RfoqyaUegsuwLtsUoAirzGY4rHDeE/kxEnwky6Q7yZ9X
         LGINY8yQK+cPFNVPIMNxU8Ot64qclDHlfnYuErIuP6pK0g1e/Fk7hrVSvCrZWAxkxOq2
         bM2A==
X-Forwarded-Encrypted: i=1; AJvYcCXM4GXLLVpghZHSw/2wdslviYVYuuRX7pbZpw38HGPE9L+MN8pAQK5ejcxQnj6XKm7eH0jnoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlhJw7r2MH2IPNOg9JP81j0CHgX3NiSUKYKsB40jvd3EAFQs37
	mzHyUhP4jtRRJGFQQKbVpq8D0NRPq6TswDs7ZwyZEJ822UN2f9LS
X-Gm-Gg: ASbGnctWjggSvWC9J4+2Jb+nGm1XRymUdYgyzlp5RdTBPet4gZT4vv1S3r4z8/g0XMh
	b/0nO/soPXQQ46WyIyo8V2O0d1Q5vv1YrVm4lYk5Xu9S71UZCesVkZFkT5TeBPQD5BF02NwXaw5
	xBThzGsdt4gdgnIQdfw5d/D0hKaSz/mzMHY84FMVHs5Y13aXjascdCKOGs3UxAgT/EwcNGs3/ZL
	tEp1LJwepwjAprmIImnrsk4uwyqerHwm00y0SE6ttF7ZnprLn/ZhD4Eo6lZukjnN/9rMuW9G1M5
	vAFPg5FwKGoxC+FaSIO1cpMJg9eQhzbhFOka/Typ/BCFS56UopfHF/3/jkAu6A==
X-Google-Smtp-Source: AGHT+IGaHheOILe7K9w5EI0RYI4+HeNtuOVz2eplb4wa4gUOP8nsm97KcUdOF6JMLYez9m6RmnpboA==
X-Received: by 2002:a05:6512:2214:b0:540:2da2:f282 with SMTP id 2adb3069b0e04-5452fe80876mr2283974e87.42.1739782232234;
        Mon, 17 Feb 2025 00:50:32 -0800 (PST)
Received: from [192.168.1.146] (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5461ad64b81sm601243e87.107.2025.02.17.00.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 00:50:30 -0800 (PST)
Message-ID: <a204824d-2280-4402-b870-9db3e2e15aba@gmail.com>
Date: Mon, 17 Feb 2025 10:50:28 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
To: Asahi Lina <lina@asahilina.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>,
 Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Valentin Obst <kernel@valentinobst.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 airlied@redhat.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 Danilo Krummrich <dakr@kernel.org>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CY4TvZwLkWmB3I@pollux>
 <a3551d7d-14c7-40a0-90ff-1fcce93be62a@asahilina.net>
 <cae5503e-4330-4c44-8a50-1ebf63ea5a24@asahilina.net>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <cae5503e-4330-4c44-8a50-1ebf63ea5a24@asahilina.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/02/2025 21:47, Asahi Lina wrote:
> 
> Given the discussion in the other subthreads, it looks like this is not
> the best approach for page table management and using it for crash dumps
> of arbitrary physical memory pages raises some eyebrows, so I'm going to
> abandon this series.
> 
> Abdiel, if the first two patches are helpful to your work, please feel
> free to incorporate them into a v4. Otherwise, just go ahead with
> whatever works for you!
> 

Thanks you for improving the series, much appreciated! I will try to 
incorporate your improvements.

Btw, I'll most probably pick this up again once I'm finished with the 
rust dma coherent allocator bindings.

Kind regards,
Abdiel
