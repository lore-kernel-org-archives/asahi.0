Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBE51C9EB0
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729695314; cv=none; b=CW5OxBFDqpVdH0dEk8JO0SnUQAJ48pjc6zRJNoBKrjC3+0UFxycwz9fVRoeitSy+AjQgGNhIYaCRN2LqYQwMxEIz12EuFyyZZY5Z9R9Dk8JJKrXXMjpx+Cv2qJBDsRJqn6O4zLGApj69Xqle3bUhjR+stU+As1P0vtMaV7L9OPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729695314; c=relaxed/simple;
	bh=ryoYcQggY/kP3u+FVq17nFJ4+xrseLriosS64MBSjiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMw+w/gpjM2FTYwcduGAwiHwJHP00C5buFq8cNLcHr7wGsRC2JXJ3tREF0LY49D2tV0mmb330DWiQJ67XsrDbIQsZIbLqTEn1hNTXIMz793GKTyHuaHiAmMOBSnObzFT7BBNafrteAzhgu668FKfY3UGiFeAJHq4hXayiNP7bM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Un4kgrli; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Un4kgrli"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1e63so7965903a12.0
        for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 07:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729695311; x=1730300111; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gxca2+tKQUchr19uflxCnLEeCJ07Xy8uJKlCwApgGuc=;
        b=Un4kgrlitfF6DIzkfYzyUKZMkDztT2KFyNekTcxTxLPfHkrzklIw7KhMdKSFmcZ349
         YR+Autc7zfSGk8E5JOoT0W+l2lEtPGTc/oYmXjyK7dZkSEJSZuctQXGhEakUg2Ty773g
         hC0jnhfxQkdp2fPT1t3MRK4G1fHH7gaIY32f3l9zENa6uu7lxvHia8GXBzD06zBrwuXu
         AyvWJLRHB1KHe8Ry8MnqQRHETrMMGFnU8XjTfOtzSxy/0e5FyI1+ePYP0/3E6NIbq0JW
         /kISjoqqFWlOocz6Iy8pK6LXispyJ3L5U+Z9MH9oZcs0IlrB+paDYuBaDaoH/SLe19Un
         lPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729695311; x=1730300111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gxca2+tKQUchr19uflxCnLEeCJ07Xy8uJKlCwApgGuc=;
        b=gaUJkVSjxcbDTZPZLvGBHaqhx0n4/CY1jUkrbEp58mFuz7d1pjy5w5KvRliJj/b/qm
         VDber+7EALh1UWPaK14UFTc22ff59x1TkZHqvVOQPEa4K8ne4cxzBra8b6Yh9ZVL1eKW
         dFZqUEiNQ5gDeGzlP/MZAex2Y3/k1A/dcUNm7c2PAu6LDr+S2rBwWc8bg3ACc7CUL+JN
         SlYlrktzQ/C3yXP1UKYNqPuRvXG2b81ZKqkDttoa8W7ojU9FYOzCBJcX09fF8klHaNs1
         RcN9raHyysqSAi1TP36G3T6p5rRNxkBN8jCUTbLAJNEAhfcpcBMRLaMwws584bWXIAtw
         wLGA==
X-Forwarded-Encrypted: i=1; AJvYcCWH34r85A1XpE2ipr2T53ryTwJriqAryNxFRD5xHePoDsSMfuubIS4lRXQsdR8eUStNjDVmkA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAWclWZuxObTM2MYPr+wr05xBSVW50D4axE/KqdYD88DfT9ESC
	BbLdptUREzi6QHfl79Fr7iZOWnuA4S8glurW1d2tXGfMAurk8LF7Ugtn0n+A9Ow=
X-Google-Smtp-Source: AGHT+IFF5GkyZ/SIiWUhNMG76ItfLSNQ1wsWrDDpfsA7r7xDzkAJuk4mXSah2g/qB/JAMfOt/g1vYQ==
X-Received: by 2002:a17:906:dace:b0:a9a:684e:9a64 with SMTP id a640c23a62f3a-a9abf96bd4dmr274083666b.61.1729695311081;
        Wed, 23 Oct 2024 07:55:11 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9157170esm494220166b.144.2024.10.23.07.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 07:55:10 -0700 (PDT)
Message-ID: <ba3199bd-e891-46af-832a-9194b64a3d39@suse.com>
Date: Wed, 23 Oct 2024 16:55:09 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/19] gendwarfksyms: Add support for symbol type
 pointers
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
 <20241008183823.36676-37-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-37-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> The compiler may choose not to emit type information in DWARF for
> external symbols. Clang, for example, does this for symbols not
> defined in the current TU.
> 
> To provide a way to work around this issue, add support for
> __gendwarfksyms_ptr_<symbol> pointers that force the compiler to emit
> the necessary type information in DWARF also for the missing symbols.
> 
> Example usage:
> 
>   #define GENDWARFKSYMS_PTR(sym) \
>       static typeof(sym) *__gendwarfksyms_ptr_##sym __used  \
>           __section(".discard.gendwarfksyms") = &sym;
> 
>   extern int external_symbol(void);
>   GENDWARFKSYMS_PTR(external_symbol);
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>

Looks ok to me, feel free to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
