Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9BB1E411D
	for <asahi@lists.linux.dev>; Tue,  3 Dec 2024 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733226852; cv=none; b=Sb9UZXgfBACyRyHOBBxOtG44TY5mlzXf8GENTzue4nhdomjEo2K2RMbhCg2oma/q8a+QypYbvg/mFn5AJ3K3kIJhQSbw1Hr7WtVdv/GVbyUcZJVSCIkfnr7wkbWep9ZHtxVbV6xBtgqA0zRtKp6sV/PaU0Bg8LnQ1hRZ/PqR8TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733226852; c=relaxed/simple;
	bh=iZ6iZsYDGgn6+nosV/i7U3c9sBZT+1+wu183Z3mPfA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UmARPqkc54ElvJiJDNiqllzp2y87Y29mFTIW1KiAnEEjQYmfxN90Ducuk6WlO2IdV6XT3Ds1dBZ3nKq32Jp0ubmy5hOXPnDoB4vMnZ2f43tzIejpxT4Ag4TZYkORvrSG2uUVbq+VpNESiogSPu1x2trEzePIAV1ZdKYoDMBpzHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UpqbBpAa; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UpqbBpAa"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385eaecc213so1406242f8f.1
        for <asahi@lists.linux.dev>; Tue, 03 Dec 2024 03:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733226848; x=1733831648; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZR6c9RoUjrM3dk40cs7PLYguaqe6xp835zylMe9vPV0=;
        b=UpqbBpAaXMcaNSn4oCZqPlLRj28n9EkWT0kXjbGWa/VkVR+OxgZPfAPkJXrkMcRRk9
         VPqW2zGZOqrZB8ubS4g2A5ymisqS1fU6JH6CmNaFvY9lq/LWJ5ouRTL4HymJ3L9qSfV4
         X4BV81DJA5Sq+a6HJqL4WzKs2aL/Wu+aI0tEWFhVTf9fcp/9TLQgEAvwJ1mSmN0e/QrC
         a3Q7eIJRjV7vWB9UdSQQHud/HmoIkVYXaqpiVT9lGnE9Cr9G7KqFIzqWHVaAxuNMgbeT
         P4FDFAm426GU4fgyj6x0u0PU2pMrkIn35gsuW91YfMnMlXgbZ9y/jiN8oPQKSdLS9Et5
         v7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733226848; x=1733831648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR6c9RoUjrM3dk40cs7PLYguaqe6xp835zylMe9vPV0=;
        b=vzntndqw6VRxRR+96f3MZkComnIo0QxeZY/6AFsFxjscGO3+zzAjSU3VKloIMaqri1
         14UVE6Bx2R7gFUZAEabBSGy65AAOVxXUPzb40KwiJ1GpEmqhJNgbQD8q11ygjwCadiZx
         RCKqJCfg0IUG4sAK9xO8weFRaXUzrIZBfjIJiGfOE9CpU721Y1tY1HwYe3nkQWCU6hqc
         CZij+43Ju534y2EflIUmxw6yeTwXf3Dx9K/p2F3ff8TCSpsu7+DDddEXOYmPqOEyOaMX
         v/YwP2sRGiMvoerTLsQhxYrLnbYTK9V1uLR8+/rC4ZNRI6mmdf75sJFv+UvJYL9NhMFc
         Dtwg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1Skmffmm2iJmLVcfuO6tE+DexG5sCkC0nNEy4AUtm8mJ3EDod3AdBaSHynri+5jnrYvUrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzykL6BTPQk1Ch+ENypJ+EwaCB2NiI/Xi1lgoNXvcRERrGTp8E+
	9sMm4QVZuexRs9hlcmWXyLPbY0vj9hz+t6+AM2BE6ub7DzcDDdKwqzEWRPA5EqE=
X-Gm-Gg: ASbGncsuNPU8+4mp6vnvoJhioTw7DVxiEIlZBvIa1M6hwTKcnzXHKOdfWS3OiZ31ux7
	k5HdTnApzdmD7Wo4kugVVkAjr4oquCYTsU4ZpRkszBJD1G/GnXUKNge7YlkWCFgcnJVHrFACHR1
	LLpxxNffx8uPxSpZZ7aWVTDWE25Mo5P1Ywgb3mekOrN7JMFiBjboTTgEeh0NwitEyJPMBcLuNdG
	/lIpEOJCN21F32Qqsn4uvqevOz5U5d9sq+onNEqDYwWH5AjMGo8cw==
X-Google-Smtp-Source: AGHT+IF3C+gAe9enWE6coDrJOE0PJBinw+OtrvrTgQQOl+8HAIq0aTYlzIw7cnuVNYgk8Zd7vO+IRQ==
X-Received: by 2002:a05:6000:2c2:b0:385:e8e7:d09a with SMTP id ffacd0b85a97d-385fd969071mr2152487f8f.2.1733226848550;
        Tue, 03 Dec 2024 03:54:08 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385fa330ca0sm3064430f8f.11.2024.12.03.03.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 03:54:08 -0800 (PST)
Message-ID: <32fdbc0a-ba70-4d99-93c8-15ec8ebe6f70@suse.com>
Date: Tue, 3 Dec 2024 12:54:07 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/18] gendwarfksyms: Add symtypes output
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
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <20241121204220.2378181-31-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241121204220.2378181-31-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/24 21:42, Sami Tolvanen wrote:
> Add support for producing genksyms-style symtypes files. Process
> die_map to find the longest expansions for each type, and use symtypes
> references in type definitions. The basic file format is similar to
> genksyms, with two notable exceptions:
> 
>   1. Type names with spaces (common with Rust) in references are
>      wrapped in single quotes. E.g.:
> 
>      s#'core::result::Result<u8, core::num::error::ParseIntError>'
> 
>   2. The actual type definition is the simple parsed DWARF format we
>      output with --dump-dies, not the preprocessed C-style format
>      genksyms produces.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
