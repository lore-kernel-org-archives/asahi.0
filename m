Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96FE19B581
	for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 11:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597371; cv=none; b=HwET8HN6pP6XOA6Z627pOWNqFjKOLw01wdSaFTf/eES3xi533K4uMwyL/CStNXK2tn/a/iZd2IjBAgRZSuxY5FtMsE0yTh9EzsED6YS5kHOVWOSGfluxfDd3xBUmR4YBWhTlqbLdKmgsUKrJ7zGAk6UzFDZ0Lia4FPZlxBOMV7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597371; c=relaxed/simple;
	bh=raa66sydrVS7SYiJ0GgKYuUMIZ/xbMw6qo8atNjsO8s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FZObv3DWwWMRspBWmBpiyIHe0DDxiP4ulED3HJqND71hzTFak6riKBA2Q8S53msuDQUFlpPqr0VbZqrp/xlcvLOnXzZ9p5/txPwKF0YjUkEi0liLglX3AIdRGth3LF8zY6YwgZ0MsEGqdeb+v6DqMW0cZPpV57CF/XIebHupGlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HeP51S6A; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HeP51S6A"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5c9388a00cfso6029709a12.3
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 04:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729597367; x=1730202167; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8b6GJXioy/QHHMfPsIPiSHRGT4MhlfXPQwWNMxqLwkI=;
        b=HeP51S6A92ypD4oGp8i1QXQOwgel7H4DN0cZE77IpznW0bvmmWIZc6NPkgjsuwX/wi
         TFpKO9UtiKJr1wsiY1YH7ceNog7XxNDaq8RxxtkQ+cvjl1v709a7IV4iPgbM840JWcLF
         YdjfXtxZ+GniXLO4dZ3/4MCc4EcBjHW0L5C4TPwUmd70ASheuSW61lS7iriqTC7SY2Lq
         yQGCdY/sYKMSKVMoilmlpDmNt+XiuAbA6cPpMwDEkBNm6M53/T+fOl0t8+8xfzKkuOcO
         18gxDBr5F02dDMLIS0KZ5YcnTslPv0zAVQ6jfzA81ut/g2h8xz/FcqkKI2DYKhhNT7Q8
         xgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729597367; x=1730202167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8b6GJXioy/QHHMfPsIPiSHRGT4MhlfXPQwWNMxqLwkI=;
        b=APthfYlgKdDHyxYQJmTWXTXjjfk0Mrl1WyR9E3XiYQdrJdUO6z6ps6KdmN3pnBjYKz
         MENxXYIKwgdZllu4x+KGjeRdkDnYHdaMooy0d2k72TkkEQlNTCfD4QZdqzuSC5Ga0cJX
         hsugOV/MWjTE83EK7Ae/RR609Weu5m8TAshsHLyqlI6s24EC5FqY6iKEqip0/mzL7yJw
         Qawry9ImGPUjnvyiLHgLt4UNtslB2GDt+oXHlhFPBjzsIO3o1nn2yfyuF8Di+XIxKuso
         u7fjcNcLBm4rP2MDAHn0rxC+rfS1hnFTMyBRquDnoublApCZACKpLMT7/5u1DbnKW7sN
         Vw2w==
X-Forwarded-Encrypted: i=1; AJvYcCVQqJkMWqg1Nc3DMzwhl5cNSnsePuCCxW+01sGTfPiETuiHE5IwuYQaVYjqc5PQiwMou37V7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCov8N0qZVfY1cHngjYiRsc1E+PrgyE4qK6HWtWa86MqyQux7O
	hNJp+Y9ZfJ8t7Q8OxIXgaiQndFmVDe/c7R0+ZexiEA1eTBxMSTvG89YtGizQzSY=
X-Google-Smtp-Source: AGHT+IG2HVAkARznKGeXSSOz3pYHmzdRrakg/LgoenOtPU5eMNDOO3eQvdGmwFfjp7NcnbHTBiLBcg==
X-Received: by 2002:a17:907:7d9e:b0:a99:f8e2:edec with SMTP id a640c23a62f3a-a9a69a7dc95mr1691628266b.21.1729597367082;
        Tue, 22 Oct 2024 04:42:47 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9155a1c9sm328599966b.129.2024.10.22.04.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 04:42:46 -0700 (PDT)
Message-ID: <df619b5f-998a-4c6f-af80-b2923264d16c@suse.com>
Date: Tue, 22 Oct 2024 13:42:45 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/19] gendwarfksyms: Expand structure types
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-30-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-30-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> Recursively expand DWARF structure types, i.e. structs, unions, and
> enums. Also include relevant DWARF attributes in type strings to
> encode structure layout, for example.
> 
> Example output with --dump-dies:
> 
>   subprogram (
>     formal_parameter structure_type &str {
>       member pointer_type {
>         base_type u8 byte_size(1) encoding(7)
>       } data_ptr data_member_location(0) ,
>       member base_type usize byte_size(8) encoding(7) length data_member_location(8)
>     } byte_size(16) alignment(8) msg
>   )
>   -> base_type void
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>

Looks ok to me, feel free to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
