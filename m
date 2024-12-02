Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F7D1714D7
	for <asahi@lists.linux.dev>; Mon,  2 Dec 2024 16:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733156070; cv=none; b=NAl/je2WTHLwOdMVQ7Jj6V2PXOA4lMutlitUcOapc+Jn+w7zKj9CW246lU9TDwLXO2+eM9c0A5IaFdUl6Ptd0tgxlzx/f6/dnFvUhghplZF6CLgGIya/pUIlUThyv5N12RwYdp+azvOeDa+GyRf/LeB0alYA+V4kTZwOofr9icA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733156070; c=relaxed/simple;
	bh=OwIXuOkl98ecBMfXkAdimvKCgH93U2DB6vsnaTQrIw4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EYp9GBNgxOvvVxW+rxVjvY+RPA1HSclDu1Tj8wCQzaYZ3rcxYYmJC44HtdXpZ7IIuDoIfYncdgBG4Bdf1rT1rUviL1GGOnT4DYo+HIfAXSUqHa9pWXPCPh9E3ctH5Q9rxmrNkjMbgwFHX6y2Dp+7iFTen2M2wgfglky4DZu/Jjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HWB3IY/Z; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HWB3IY/Z"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4349f160d62so37819125e9.2
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 08:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733156066; x=1733760866; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JkqtF7gf3rzskqYkgv0SBovnNKd2qwXos1/as7nPpuk=;
        b=HWB3IY/ZWniHtueS6rFjVUrD70rQh7l9MYbMsvbVDgPy+aCl+6lNZq/bjCi4e5VQMG
         KJsSBHFWWTW0ZYonCAj2k1c8O2wOBXXqXD+5R/OlV6kURloPvUuFEDT3NVVORL7KZXEw
         jmLem1OiwBqk/MnEJz2cEnknHMRyzXi1/sxrJD7AKB+kzLcgnEteMiQJlY49TJ0cuwBj
         J4S4eGUs40wWJ8D9b6MF5sQsPlXHZCYmPx11w64zMvgu8FUUnIei7irD1XMMrF87xeFJ
         +ID2oKc6UMF/bxaUuHjZytPHvlmFqlI5+gUmU62tNjQLDpea4GrrXYB3dEjOn4ROmFOX
         F1xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733156066; x=1733760866;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JkqtF7gf3rzskqYkgv0SBovnNKd2qwXos1/as7nPpuk=;
        b=eHVwSITE/pGL5LAn63n/9xJRHuie/tLuJBSJUsmvFuXQf91yInwMrwoD7nCM6ix43O
         uYtTkwHbZx649JyqvSkP059ehyL3M1WKcb/gmpsdnP8+kwmG4f3H68Dn1AC/71B2IY37
         9L9LwJy31jWA6t1GhjQG52RBdY9zdbQVvxiGM+Wj57qvQPggp683xENoe/0JFtxmcqW5
         BoKcQZbJsnlhEFQFsO/J+wy5wVG0kr3nX4yKEZo28TtmqdtOMW/1OUlvvEKzEoTdMG2n
         z3R8DcW4r4+55xXvNT93bhUv522mgnV8EKUZXY+VeUGSgaDWx3OeeevXxwypT1lQfDcE
         5nEg==
X-Forwarded-Encrypted: i=1; AJvYcCXP7sgC4hoty+9Z8rOJ94g3hvDbOliM2aLxWKX9nXdGNZngwmA9UnH0yRbIps/OffXKY9ND5w==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTIN1IaV+5zP9dmOipiumnc42RxqNrNbZ0VtyOOsmimdgHuH49
	m9A4TvKHik3AdfakzTTzALMHO8iO8q+oo1w5guSK4AwPRh8R7i7Skg6ffveRDOA=
X-Gm-Gg: ASbGncs6pbWvseZXi7vf/HMOdh3LutMsDUf1kRiQfNwgbV5Glhoo+y6RqZCoyCf77Fn
	8Rea8SztM/bJZTHi7AYk8N6ZWSk/CF1PrCSDM8T/7lMwzJ4bUjCSWVwJByeDAzUXMifkSwmZfJm
	aDRnuYN0viwE6TWQqJjbGXf8BCY1JAVlNoqSEBnAtKvPCZbwDSjwB+gn586SbKma/qe2oXdtsAC
	rf85Gs6KP/StB6LBemQZJ6t647kAdCVsJzg7SyMRjPl3EJZX5Xl/Q==
X-Google-Smtp-Source: AGHT+IFYutETRRcXML+QIddm9XhVvanLL6JGdMr2H3NcnNfxeBujp0ZUmjFwG3N6uzej8qITOTWbNA==
X-Received: by 2002:a05:600c:5253:b0:434:9e1d:7629 with SMTP id 5b1f17b1804b1-434a9e07911mr188863885e9.33.1733156065599;
        Mon, 02 Dec 2024 08:14:25 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa781200sm187506945e9.25.2024.12.02.08.14.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 08:14:25 -0800 (PST)
Message-ID: <409987f4-d124-48f7-b49c-dd61a4798bef@suse.com>
Date: Mon, 2 Dec 2024 17:14:24 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/18] gendwarfksyms: Limit structure expansion
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
 <20241121204220.2378181-29-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241121204220.2378181-29-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/24 21:42, Sami Tolvanen wrote:
> Expand each structure type only once per exported symbol. This
> is necessary to support self-referential structures, which would
> otherwise result in infinite recursion, and it's sufficient for
> catching ABI changes.
> 
> Types defined in .c files are opaque to external users and thus
> cannot affect the ABI. Consider type definitions in .c files to
> be declarations to prevent opaque types from changing symbol
> versions.

Thanks for adding support for skipping types defined in .c files. That
is a useful feature that genksyms has.

I was also recently thinking that it would be great if genksyms could
skip definitions that are in internal header files, for example,
kernel/events/internal.h. Perhaps something that could be added in the
future..

I've noted one nit below, but the patch looks sensible to me, feel free
to use:
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

> @@ -79,6 +80,55 @@ static bool match_export_symbol(struct state *state, Dwarf_Die *die)
>  	return !!state->sym;
>  }
>  
> +/* DW_AT_decl_file -> struct srcfile */
> +static struct cache srcfile_cache;
> +
> +static bool is_definition_private(Dwarf_Die *die)
> +{
> +	Dwarf_Word filenum;
> +	Dwarf_Files *files;
> +	Dwarf_Die cudie;
> +	const char *s;
> +	int res;
> +
> +	/*
> +	 * Definitions in .c files cannot change the public ABI,
> +	 * so consider them private.
> +	 */
> +	if (!get_udata_attr(die, DW_AT_decl_file, &filenum))
> +		return false;
> +
> +	res = cache_get(&srcfile_cache, filenum);
> +	if (res >= 0)
> +		return !!res;
> +
> +	if (!dwarf_cu_die(die->cu, &cudie, NULL, NULL, NULL, NULL, NULL, NULL))
> +		error("dwarf_cu_die failed: '%s'", dwarf_errmsg(-1));
> +
> +	if (dwarf_getsrcfiles(&cudie, &files, NULL))
> +		error("dwarf_getsrcfiles failed: '%s'", dwarf_errmsg(-1));
> +
> +	s = dwarf_filesrc(files, filenum, NULL, NULL);
> +	if (!s)
> +		error("dwarf_filesrc failed: '%s'", dwarf_errmsg(-1));
> +
> +	s = strrchr(s, '.');
> +	res = s && !strcmp(s, ".c");
> +	cache_set(&srcfile_cache, filenum, res);
> +
> +	return !!res;
> +}
> +
> +static bool is_declaration(Dwarf_Die *die)
> +{
> +	bool value;
> +
> +	if (get_flag_attr(die, DW_AT_declaration, &value) && value)
> +		return true;
> +
> +	return is_definition_private(die);
> +}

Nit: When I read the is_declaration() function in isolation, it is not
clear to me what determining if a definition is private has to do with
the type being a declaration. I think this and related logic in
__process_structure_type() would be easier to follow if the return value
of is_declaration() was negated and the function renamed, for example,
to is_kabi_definition().

-- 
Thanks,
Petr
