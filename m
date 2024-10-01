Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3231CBEA8
	for <asahi@lists.linux.dev>; Tue,  1 Oct 2024 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727792031; cv=none; b=f4oI61H1oySuI3zzqC32CbQU7WC3trZw/ytqM8jf7fvmboNGqDYCaUgyQDOKLFSSx2qP+0PyB+dV4SEV3QS7AMkU84hczvIYgBeaRoc6UL4WRJaalGgqKlYxfbASQ/dJiFzuL7bizr9S+O3Fe6o2NkgZID75dUIqimwIZR/PtXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727792031; c=relaxed/simple;
	bh=XY8ZzKIJln9Dg1OjlPScukFH2zoKtdG7bx31O314oeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PDXCgc/+SJMHzO6Q9irBEsOpIYpbL48VWSM7ygvzLKfJGdxqmCRWpKO3VjiyGPIG10ZoEl2Rr3F4nqXv1IiWt1rEsS9pfC4XdZX9KmGj7CyhtX3ZZTi5LHks/EDItPSSnYxCUVOI1kRImlCj3KcaK8JvyvwMIEKSX2uOtiyWb9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P7OEg+A8; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P7OEg+A8"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c883459b19so5159136a12.2
        for <asahi@lists.linux.dev>; Tue, 01 Oct 2024 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727792027; x=1728396827; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+AC5fWKlNBJp4jGjiPsZYEshdzlIiLPjFPjK9CcGHI=;
        b=P7OEg+A8Jzwm/61kngCsBH/L7evBuKoyYl88BiPfVWdBE/eswxHlucqh2bGw6SXl8Q
         Y68GKO+ua2VTq6uzHl4Jf1Odqz8zuqwilYyi4eBMYlKPPZLDV/mQze0f9yiewtg34Klp
         islFU/kgakQoiYlvNBOzdWQhcQRg1Sjf6fMxq+jGvtGSORwOdCPgfFSDstfYcKmTXF+Z
         bhL+A79HMoBWCfiW80o1pEI0QVwD1ythxvSva/63qNflAAHHvar5CBOTg5Fq4iTxpme0
         xlr/ogtHeg1crFHKs2cxaHolIgN7Joapl3fa/qeE/ZAi7zqPc4OxBIx5wutqz+SwLMxD
         Q8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727792027; x=1728396827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n+AC5fWKlNBJp4jGjiPsZYEshdzlIiLPjFPjK9CcGHI=;
        b=GrBI4Cq0cArbwxH5/yrenm5eZXSQbKgKP9yFx8vnzmglYkYwBUkXTcrzKsJ88NJ69g
         TWwoHuy1zCarSxd3vJKQwnl4R97HKU0cc1l4/aNJ8IbnYGrdsopgJAE0h7tcqhltSuYw
         HgRtvN6o6GSmBZrHyKPgPPdDafX4S/cfWyujAUj6KQLNvPmzve0VkJoUkFjl/Mdg7Dhl
         OVdVV04Qu3Zr0cz9mWjfxnQf0RhLd3fgMFEl/zZobOKADG4Z7wiBGNxquGPjrC87DTWF
         B/kAxG9pGoDb9h7/PzqvC+sGv1GONOXs/U9RaIhtuolXJwVnwKQZOT343Fba2x77v4IX
         P3tA==
X-Forwarded-Encrypted: i=1; AJvYcCXhGAnncTcdR2AzcpKfDm66jF8UhZTbZ3lqZKYq4W1/6v0kjDf1+1igqXA4JsSmZHd3UssHng==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWUiyO61qg5XT7arc2KFGcz63YfcxyA0+a4ikd0S1ekl98B84u
	4q3pQXPA47vL7K3yIxG24oQKU26hBQG8xU8zyS0MZZY+sQG9iX7fLLqSGAWGzf8=
X-Google-Smtp-Source: AGHT+IEMZmc8txKJvmq0HUIkU/EyEg0oAsdYMXagzUOgzgVDeHf+VoEn9MCuGw/Fb5bAjra+vroY0Q==
X-Received: by 2002:a17:907:6e92:b0:a93:c2b0:f965 with SMTP id a640c23a62f3a-a93c4ab2afamr1666487066b.41.1727792026569;
        Tue, 01 Oct 2024 07:13:46 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27776a1sm721237366b.8.2024.10.01.07.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 07:13:46 -0700 (PDT)
Message-ID: <e39f5979-50a4-4897-8199-1672ae7b8c06@suse.com>
Date: Tue, 1 Oct 2024 16:13:45 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/20] gendwarfksyms: Expand array_type
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20240923181846.549877-22-samitolvanen@google.com>
 <20240923181846.549877-31-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240923181846.549877-31-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/24 20:18, Sami Tolvanen wrote:
> Add support for expanding DW_TAG_array_type, and the subrange type
> indicating array size.
> 
> Example source code:
> 
>   const char *s[34];
> 
> Output with --dump-dies:
> 
>   variable array_type[34] {
>     pointer_type {
>       const_type {
>         base_type char byte_size(1) encoding(6)
>       }
>     } byte_size(8)
>   }
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [...]

Looks ok to me, feel free to add:
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
