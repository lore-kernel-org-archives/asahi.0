Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6E319EEA1
	for <asahi@lists.linux.dev>; Thu, 12 Sep 2024 10:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726136904; cv=none; b=Rkb8cLHD+8gn26ozdTTrIwlk5sS/Cv15zAqDio86J3PzaZl0IjTbmX8Ltu30P/GRtknyqmJtKYZDC2yszMwP26wJ2C72xwlKFUWPArXpCTdnvQ2DtZ60tF8c5dnJ4jktP741xdZ1msQclh3q+gtm5zI7Ymtj8EgdXzzioywVgjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726136904; c=relaxed/simple;
	bh=PAV4FkicyGirycpFelMM9rAtqpx8O1P09tyQ5d3LSJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wu9Gvt+TtoMGw9LnqXcLyMbNh5cLpYu8GKVL8Ytr+GvJK/o5Dtw/6O5u5ZLCLyYFioJW2XTlZtNskMo28DkEdX9igfxblxXeEX5iGYWuojjeuGu0zcOC4T6MSAvuiNAHonWxDrfa7ybxH8UES3B7+5qsXpRwAxeyy6GqCoNJhcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gmqjLtOh; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gmqjLtOh"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8d2b24b7a8so359879666b.1
        for <asahi@lists.linux.dev>; Thu, 12 Sep 2024 03:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726136901; x=1726741701; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4hMMIAeIq6ngig/u7/oyMUwjRb0NTBFMbk8f4JUhPjk=;
        b=gmqjLtOhPxauigJCRJLQeWEO6E1svldHRqIYVeLWZIH9CVnrnbwyWMhpqTCfCNAOOB
         W+5G74A278hmW6aml9YrPHdJuUtWj9rgdRb+uMk+uOeMIvjns9Conegd1o9UUyOOvoy+
         abk/GCCoeqs1HI0N3sOjHg473maTV/ltiZ3tfevBc0wrZ6eQQapZLVX61v2VXmKTmJ4t
         79qZ9D6zt8XmDUbyuBGm0v33cpSLtWOXes4TOGkNa/8hw8efJJIF83Kjc4s5QVq1ifpo
         MynWeaP3oDVXOgvtM5CH+cA9AVweRZiTqYEKUQlSF4H3IO9KNlBHLqI8pw87IXkpEQW1
         juow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726136901; x=1726741701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4hMMIAeIq6ngig/u7/oyMUwjRb0NTBFMbk8f4JUhPjk=;
        b=I1tRmHb6uTj1U9vHcEbE5CkhwxpAHkjx85bSO89Yc1MCqFv20ibZcf8egLnEDviO8F
         4YpFB6GO9PLEAHjYXhKpQsBKh5z9MkVxLtgFHSBEfN1gOQQrCcPc0qbVd2r6gzh4LUog
         VReW28QpEybJnLLqFurcUS+59QMj3BIXRwh6aqnB6XEzrdOx556ExokbiTOceS381r88
         LeZp5P52jT2WI8LHcTbfb0nt7cjrzmJU8MVlugD/EAerav7x1Dg4VJ2tTiZQj3YNEUnh
         GJAIhxVTQC6Rzw4Zb2Wv8bFZyq9nEW5w5UJ2tYgmzEt+0PZJRHSshSl0cIB/8byxe0DN
         2XRA==
X-Forwarded-Encrypted: i=1; AJvYcCWkjYLx2BA2UHroWoNNnFfD82yJMvhEMLpPa/VR+KkYPICxgo+J2gajHWzushrpdVdVikbcWg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwLNjAm/E4VQzwlhv8nZ/iMjVuC4WjrQkshUbMHrOzUw6irwtFy
	Auftfzhduz1l3J91Q5uy4AduWP7kPU2FV7sX84dune6uNGmUkTAXUClm92X0MMU=
X-Google-Smtp-Source: AGHT+IEewD5Ol7roADv6Jj0UYR3y7brfrq1xLM2ZFdqn9+fQwDXCvDx/TUxbpqTHHJAxgNiQXUxpWw==
X-Received: by 2002:a17:907:7ea7:b0:a8a:cc5a:7f30 with SMTP id a640c23a62f3a-a902a8c26ffmr254441166b.25.1726136900343;
        Thu, 12 Sep 2024 03:28:20 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25835d87sm729255566b.6.2024.09.12.03.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 03:28:20 -0700 (PDT)
Message-ID: <5625ef4f-324d-4bc9-ac5f-2374d29a0543@suse.com>
Date: Thu, 12 Sep 2024 12:28:19 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/19] gendwarfksyms: Add symbol versioning
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
 Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-35-samitolvanen@google.com>
 <286b1cc5-1757-4f0a-bb66-0875f4608c7e@suse.com>
 <CABCJKudJR13PJgjr9-5Ff9Dzmb7=pSx7JWM5qTyR8oYRdtSDDA@mail.gmail.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <CABCJKudJR13PJgjr9-5Ff9Dzmb7=pSx7JWM5qTyR8oYRdtSDDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/11/24 18:03, Sami Tolvanen wrote:
> On Wed, Sep 11, 2024 at 3:08 AM Petr Pavlu <petr.pavlu@suse.com> wrote:
>> On 8/15/24 19:39, Sami Tolvanen wrote:
>> More importantly, it made me think which names are included in the CRC
>> calculation and which ones are omitted.
>>
>> If I'm looking correctly, names of structs, enums and enumerators make
>> it into the calculation. On the other hand, names of struct members,
>> function parameters and exports (functions/variables) are missing.
>>
>> I think the names of struct members and function parameters should be
>> added as well. If the code changes 'struct A { int cols; int rows; }' to
>> 'struct A { int rows; int cols; }' then that should be recognized as
>> a different API/ABI. The same applies to function parameters.
> 
> I did leave out member names because typically renaming a member
> doesn't change the ABI, but you're right, it might help capture these
> types of changes where fields with identical types are reordered for
> some reason. I'll add names.
> 
>> I'm not sure about export names. I would probably include them as well,
>> if only for consistency.
> 
> I would rather leave out the symbol names to have consistent CRCs
> between symbols that have identical types. Or is there an actual
> benefit in including the symbol name in the CRC? The names are already
> rather explicitly involved when symbol versions are checked.

Ok with me. I can't think of a strong argument to do it one way or the
other.

-- Petr
