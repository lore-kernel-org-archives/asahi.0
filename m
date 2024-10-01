Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1A61C689D
	for <asahi@lists.linux.dev>; Tue,  1 Oct 2024 14:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791693; cv=none; b=OXaXUgePPB3eX5/KXfUsaRx2qkNf/GwKAA8ErABx6t5uvpSpCSkvsmIF0izYE0oXHKnyAxBC5qE8fYdpWjh9ik4vupmYb4LtGbfNngI3OVwHWXZ8XviIMty60O9XwR648TKmMzyVfBvzCjtTSDQyraMDvpqc+Oe2ytcri6S/vak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791693; c=relaxed/simple;
	bh=BomYIPLYM5BI9NRjik6sw8fZV0AIRi6SbLd8MV+XBg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Up54FN4Qp0GOEsUofJzjvvW3kzD1+amjVI54uA9ktcu6fG2CdMBWsnE3nyQLM1lekzQ7jGOGgR9hqcoUfEEmbfnegVTDwiInSMH6fwEBrXF/YdKvNGfJpxAD3pd3KWllTBHY884aU/+awI59n76GCfKt29v+XXRi4jxiHFzVzAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SK7W8x2C; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SK7W8x2C"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8d2b4a5bf1so768771266b.2
        for <asahi@lists.linux.dev>; Tue, 01 Oct 2024 07:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727791690; x=1728396490; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuxy9H0NBJRRS74N6JfR6UfMk8p+Pp8gRC0GHyWlDK4=;
        b=SK7W8x2C7hfyeBHEznKoBQOI0mXHH7c61Z7q5kbTmxOMr90WebbPv5jFWJBevzfqE1
         qJmJ3YMKXeX06pXIel0dLLSnCp8s2SCXdukMaickgjU50jZB8v83uOjpltb1IuNqb64V
         wsZRDtJmpeEllhRAKDW8D92l6giWOSXVFq/cnrcYhWl9+D5wBWHLIwXQhF2qIaxV9Osd
         x9f52mg5VoUfWnjqLeK5XNSJHJS9XXx2YijeeFBnnUFYBvUnppfYgckLcaC83t2IpTkT
         xJdnYb7z2n+oY/tMeAschFsr463zv1L010GuqDa2pXrqONoJR/4A7IgECuIvXykZnv93
         7bKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791690; x=1728396490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tuxy9H0NBJRRS74N6JfR6UfMk8p+Pp8gRC0GHyWlDK4=;
        b=dcz7h1O9CW/YUdXZs7AzEudjhoBFcahStxaoO2j+5I2YIDAijKU/KtiT+VQ6ZeBAgT
         nSoc0eFKvgqGcE9Yp7KBRsOBNP/8rOWg70miWEpVy640TlhvI5wzMJjkkeD+AqcneMQ/
         +GQYC7rYhASpIUsL/GDgKcljCmpeshS8Ixkq6U0dd1S8Z/6xUpiRi2HXucIFZh8Dnvvp
         rsDsqt1iFimFWnuCKP5rgwUFQ0ifPymFtIr0tZEsf8emgOJU6jraxxVKUIkgbAhHtxI9
         o10NK7DSXOPhaXlLCdHhRBwGdrZVBLQxj5ffshn6qWZk3M2o2qEJU8jXS+NlFj+kR6rO
         4B6g==
X-Forwarded-Encrypted: i=1; AJvYcCXdztgTCPefC4ORyzdAMTUeHeDmYhSTVRxbQQH3EghC6/3CXTN4UqYYc3G9ZQUI2wiSl8q99g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn/VJFHtMV6jyzHbrJjzBAj/k0UNAMJ3wrHTeU8DC0H4YWM+mP
	3zLCGOiG/aG3hhXrhBlBmZW4FYiMST85mDlNBDkW7XEPVhyULIS7y5CpzIzL2pg=
X-Google-Smtp-Source: AGHT+IGtCaqW1iYqY0ka6u8nR5cuIhkkzcw74TSNyxlTUt01ZQat8MsCjI7LNjjDnGVwTilgDCrZfQ==
X-Received: by 2002:a17:907:7ba3:b0:a77:eb34:3b49 with SMTP id a640c23a62f3a-a93c492a5d1mr1614882866b.37.1727791690027;
        Tue, 01 Oct 2024 07:08:10 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2775c22sm715531166b.20.2024.10.01.07.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 07:08:09 -0700 (PDT)
Message-ID: <6d0a36f0-6534-4301-bc4e-929a2e779e1c@suse.com>
Date: Tue, 1 Oct 2024 16:08:08 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/20] gendwarfksyms: Expand base_type
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
 <20240923181846.549877-27-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240923181846.549877-27-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/24 20:18, Sami Tolvanen wrote:
> Start making gendwarfksyms more useful by adding support for
> expanding DW_TAG_base_type types and basic DWARF attributes.
> 
> Example:
> 
>   $ echo loops_per_jiffy | \
>       scripts/gendwarfksyms/gendwarfksyms \
>         --debug --dump-dies vmlinux.o
>   ...
>   gendwarfksyms: process_symbol: loops_per_jiffy
>   variable base_type unsigned long byte_size(8) encoding(7)
>   ...
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [...]

Looks ok to me, feel free to add:
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
