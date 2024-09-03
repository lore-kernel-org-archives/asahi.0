Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3F818786D
	for <asahi@lists.linux.dev>; Tue,  3 Sep 2024 15:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725376541; cv=none; b=Gm7AbFISxw712XcCBeFforHg9BFQDVyRwKNGzmNPE/XgzpaMF/Oo5K6c0jKiFwJHLW3LlavbfHU/L1n98ZgC5D4Avr1nfMGzg2WcU1RzA0StyW2kH7FdOcEvFdO4hds/2hAy+sYR+s3ymuXvj892NYfiytoBuD5pIdqtwwXO6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725376541; c=relaxed/simple;
	bh=VQoch2Jnk1OtZ5AtE+c96J0cQy86KkHUvIBG+sr4F1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecgm5sZZ6LCIAouOFmFlfMHdKKn194cxeaoeQJEml33MAzfTO9bQf9jFsdLfXeDbsKzGB5kHisvv/I0tjpra4JSlzNgxiFv8ziaEsDxFEykejMU+YLr+TnThIDHnJ68Q+pzFhwgnx5uqwloyodK68BmVqe87ZJPK6TfXmvcUhNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JxVVCC/N; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JxVVCC/N"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53438aa64a4so6641254e87.3
        for <asahi@lists.linux.dev>; Tue, 03 Sep 2024 08:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725376538; x=1725981338; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+e0U/aRCvU8DuFYoeV8O/KmFptz8b7Txjch+YXTIjA=;
        b=JxVVCC/Ndy6jkdgigUiw98FaP6+7qFydt0oy8Qh+m5IUt51nfGazu7KTofp56lSLgs
         2phQUww2I4S2yuUFCHBbpTTqoiw0Ry2fFl1fqn/CJThnIW21KMZ+xQdpclM4CAJUDtor
         kkOgLQw9VXNf4pD2LXNnZhX+PCZRJBNKIRqCn4LPmGe8EDn1bNW2X8wUcqT9wlOU+J9T
         YN9MhWChCgJdjTXb4v2oFlqVCWFPAgHNf9IGETO/N/ZWQmazzXt0+Jc1hfhSov/Tudul
         Bu15OO/6PH7g2Ct8C2dlI2lxP4HGUvWqbAfJQH+7CGdslEdGP41fKKH9ItTsnjnYaAql
         jElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725376538; x=1725981338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+e0U/aRCvU8DuFYoeV8O/KmFptz8b7Txjch+YXTIjA=;
        b=ZRvXC49fGASSntGRbIadEAjFOL2HSn+oGuN7DKlVOaXtsTuCXw2TRevA2/BB0Qvwi7
         gbFyk/sLuKXVOStNJ/l3tH9jbAwxNRhq8QSZE5KeJReStj8B0jiQTgkuMLG8et9MPRJb
         vyNCqRkrHjTnJy54C1N+fiLAP/TZCxrHQ3Nwr4t+It1KdxlcQhLK4nHDSmGGKAhnulf1
         IU9d9fPg1AUur5uZANSAB3awQ1Kevgf5by2lCSKKITAGvnI5AJBcgB5Ml7yLUJWa/Sjj
         7AZsq/0FzZRxfbD392pfvZE2l83yg3wNk3hiy4rMl7Y5R8zQWMFjwqXov6e7YVlhOcdC
         jiPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVr0YE532e4c+WK3Fzz9U4gopKL950dqWmTP58CadXJNasMi6WTNR99A9IrVD2l2gIxS7k41Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YygAHB8M8l4MJRie8IPZ4wm4Z4p3biQgYpuTtq7+FHFQdGJmBkN
	LRDuAb7dxEjs3wsoUaH5Nn+A6ZWufqQiiaK8kdwERU0Wr8IPaw+YRoI5oRstRQM=
X-Google-Smtp-Source: AGHT+IGdZTw/KUyMiDlZSkuc9mANPu7vBYcf24gYwin1fZw518o/l8XDosnXT/1xrZtFfnHMtfr7sg==
X-Received: by 2002:a05:6512:2383:b0:52c:9468:c991 with SMTP id 2adb3069b0e04-53546b03ffamr9361946e87.14.1725376537413;
        Tue, 03 Sep 2024 08:15:37 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6a2fdsm6520881a12.13.2024.09.03.08.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 08:15:37 -0700 (PDT)
Message-ID: <47bc562d-b9c7-464b-a2e2-dbb8c14d146b@suse.com>
Date: Tue, 3 Sep 2024 17:15:36 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/19] gendwarfksyms: Limit structure expansion
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-32-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240815173903.4172139-32-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 19:39, Sami Tolvanen wrote:
> Expand each structure type only once per exported symbol. This
> is necessary to support self-referential structures, which would
> otherwise result in infinite recursion, but is still sufficient for
> catching ABI changes.
> 
> For pointers to structure types, limit type expansion inside the
> pointer to two levels. This should be plenty for detecting ABI
> differences, but it stops us from pulling in half the kernel for
> types that contain pointers to large kernel data structures, like
> task_struct, for example.

I'm quite worried about this optimization for pointer types. It could
result in some kABI changes not being recognized.

I assume the goal of the optimization is to speed up the tool's runtime.
How much does it improve the processing time and is there any other way
how it could be done?

> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index 92b6ca4c5c91..2f1601015c4e 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> [...]
> @@ -651,6 +742,7 @@ static int process_exported_symbols(struct state *state, struct die *cache,
>  		else
>  			check(process_variable(state, &state->die));
>  
> +		cache_clear_expanded(&state->expansion_cache);
>  		return 0;
>  	default:
>  		return 0;

I wonder if it would make sense to share the cache between processing
individual exported symbols.

The hard case looks to be the following:
s#A struct A { int ; }
s#B struct B { s#A ; }
foo void foo ( s#B )
bar void bar ( s#A , s#B )

When processing foo, the code would cache s#B with expanded s#A.
However, when processing bar and reaching s#B, the cache should report
a miss because s#B with unexpanded s#A is required.

So the code would need to track which types were already expanded and
have each cache entry accordingly tagged with similar data.

Hm, it might be that doing all this additional tracking would then be
actually slower than processing the types repeatedly for each symbol.
I'm not sure.

-- 
Thanks,
Petr
