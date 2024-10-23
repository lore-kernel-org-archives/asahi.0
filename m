Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B76A1CC8AA
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 14:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729695547; cv=none; b=EEPdc4KdpbGF3drrVkbBWsJp2U2gX3BjNZ62+7C9X+/t7tqq/LL+oMszSU9miqfISrSESq2O+SvcO1K73gzdOpP44OyX15RmR5aqzEJY2FHkoytjSgyoTJyqwkw6fxKnt8MtS2Lw7qf1kFBcBPKM+Lrl0GgvKHN4T1Mmzyf2UUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729695547; c=relaxed/simple;
	bh=qVcZMLHwHyQhq7MBDvAiHcGYCqm+ZH0H3VY5fyTsc+Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2lwaa5FKgfSwDpRU0kvRsl5dK87nnjIHhF8mv4XjSuUD6TrSSHdi222rDSfj6IXoGFQ+by2OBnVPczfQikrXzX0wGictGYrUBymp9kWQALYGT6g1PQr9cFMn0wRoFZhqIMJfCPa+EcKifedDbnj+BOVBquhrA0Z4SQUwf/4HAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZDzgl7LK; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZDzgl7LK"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso915428966b.2
        for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 07:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729695542; x=1730300342; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QdfhAg7XOG6KB9fpE58iZth2jLApIcWYhDgoIBS8gtw=;
        b=ZDzgl7LKIEjv5BQh5c2lzyRki1lhvrBXkwkRBRuncEJjFMCAI1t1ubg/fh6JeBrsQu
         D6WEpVjhKAHTYm3bFq9Erae3oI8nX2Mb/vkY1tv91bub729DuxAsxbbun4x5NnPypyaX
         aKX7cwI6iBM75lCTewP6+cXOVdSRL8X9cs5lpGWcQNnOxcCgaUXvXy6w1pYZrhUFS8O4
         JgtO32o18k+iRZmjGdx+eH/iziZB1xE4o+WPuzZP99QTisIkZo2kf23ArSrjrfTLrChY
         tItocBr/xVLZkhJp6Siz7wwgFyMz483dkkjQz49C0kakw/XRwrFvHde560VQ/HNRAm3L
         FwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729695542; x=1730300342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QdfhAg7XOG6KB9fpE58iZth2jLApIcWYhDgoIBS8gtw=;
        b=PDDzF227wwKm6VhPisNSrdu2tSEnCiZzj1CLqRQ/Rbiumgx1VtuThAo7d4f0N68KYN
         Z5IrvqIiH25ZwmTg2P53uz+hVURsUGfo0xFIQVSmEP+40LVvPW+RmTxWTX/nvOMO1/xB
         aB8rId3Qui0kGCFxNW9A/rrIle/ID4G2Jo9CqScTE86R6bJ2SJQsQE3xNbIrsUYYT+CP
         wrkvOyzUGF0XWP7/MuxVH66WQR6FDMTOaC2KDZ/8o9qp2bPROPY9AlO89rgv5JG/eWT+
         e/ybr8w24p5OUnjGtYrUZQ8fuQlmme26Io4pqmkHwSzQj7IS0qBcF9jrEEgjVWgQuE91
         Gwwg==
X-Forwarded-Encrypted: i=1; AJvYcCW04DNzqCviNPWOcucTbqoMT/VCXyTtCJmGWWvS4RSeR0bBJX2cDr0LaFSa1WtSw6XA3Ivd/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvNBq7OgVjweN4gZrJi6SXIGzk029bqOoQTpXzRNu42BREXw8A
	rtGYj7QKIS2bMglXebkYn3oHpZ7UIkNH+QaD00adldCJ8mfQ2oUXr7T+qAnHlDg=
X-Google-Smtp-Source: AGHT+IFC1aic+ZWmPBAnotFGoZ7s0fl8OisT/L75WyZvmDcXyVbJaWz0S1S/NSTReRarLlppasFQew==
X-Received: by 2002:a17:906:794c:b0:a9a:4a:284a with SMTP id a640c23a62f3a-a9abf8792bbmr287818566b.26.1729695542525;
        Wed, 23 Oct 2024 07:59:02 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d6234sm486571666b.24.2024.10.23.07.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 07:59:02 -0700 (PDT)
Message-ID: <8017c328-f039-46c3-b472-f203cd6e2cfe@suse.com>
Date: Wed, 23 Oct 2024 16:59:00 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/19] kbuild: Add gendwarfksyms as an alternative to
 genksyms
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
 <20241008183823.36676-39-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-39-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> When MODVERSIONS is enabled, allow selecting gendwarfksyms as the
> implementation, but default to genksyms.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>
> ---
>  kernel/module/Kconfig  | 25 ++++++++++++++++++++++++-
>  scripts/Makefile       |  2 +-
>  scripts/Makefile.build | 39 +++++++++++++++++++++++++++++++--------
>  3 files changed, 56 insertions(+), 10 deletions(-)
> 
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index f9e5f82fa88b..e6b2427e5c19 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -169,13 +169,36 @@ config MODVERSIONS
>  	  make them incompatible with the kernel you are running.  If
>  	  unsure, say N.
>  
> +choice
> +	prompt "Module versioning implementation"
> +	depends on MODVERSIONS
> +	default GENKSYMS
> +	help
> +	  Select the tool used to calculate symbol versions for modules.
> +
> +	  If unsure, select GENKSYMS.
> +
> +config GENKSYMS
> +	bool "genksyms (from source code)"
> +	help
> +	  Calculate symbol versions from pre-processed source code using
> +	  genksyms.
> +
> +	  If unsure, say Y.
> +
>  config GENDWARFKSYMS
> -	bool
> +	bool "gendwarfksyms (from debugging information)"
>  	depends on DEBUG_INFO
>  	# Requires full debugging information, split DWARF not supported.
>  	depends on !DEBUG_INFO_REDUCED && !DEBUG_INFO_SPLIT
>  	# Requires ELF object files.
>  	depends on !LTO
> +	help
> +	  Calculate symbol versions from DWARF debugging information using
> +	  gendwarfksyms. Requires DEBUG_INFO to be enabled.
> +
> +	  If unsure, say N.
> +endchoice
>  
>  config ASM_MODVERSIONS
>  	bool
> diff --git a/scripts/Makefile b/scripts/Makefile
> index d7fec46d38c0..8533f4498885 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -53,7 +53,7 @@ hostprogs += unifdef
>  targets += module.lds
>  
>  subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
> -subdir-$(CONFIG_MODVERSIONS) += genksyms
> +subdir-$(CONFIG_GENKSYMS) += genksyms
>  subdir-$(CONFIG_GENDWARFKSYMS) += gendwarfksyms
>  subdir-$(CONFIG_SECURITY_SELINUX) += selinux
>  subdir-$(CONFIG_SECURITY_IPE) += ipe
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 8f423a1faf50..ae13afb71123 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -107,18 +107,28 @@ cmd_cpp_i_c       = $(CPP) $(c_flags) -o $@ $<
>  $(obj)/%.i: $(obj)/%.c FORCE
>  	$(call if_changed_dep,cpp_i_c)
>  
> +gendwarfksyms := scripts/gendwarfksyms/gendwarfksyms
> +getexportsymbols = $(NM) $(1) | sed -n 's/.* __export_symbol_\(.*\)/$(2)/p'
> +
>  genksyms = scripts/genksyms/genksyms		\
>  	$(if $(1), -T $(2))			\
>  	$(if $(KBUILD_PRESERVE), -p)		\
>  	-r $(or $(wildcard $(2:.symtypes=.symref)), /dev/null)
>  
>  # These mirror gensymtypes_S and co below, keep them in synch.
> +ifdef CONFIG_GENDWARFKSYMS
> +symtypes_dep_c = $(obj)/%.o
> +cmd_gensymtypes_c = $(if $(skip_gendwarfksyms),,			\
> +	$(call getexportsymbols,$(2:.symtypes=.o),\1) |			\
> +	$(gendwarfksyms) $(2:.symtypes=.o) $(if $(1), --symtypes $(2)))

Is it possible to pass options to gendwarfksyms that apply to the entire
build, specifically, how can one say to use the --stable option? If not
then I think it would be good to add something as
KBUILD_GENDWARFKSYMS_STABLE (similar to KBUILD_PRESERVE), or maybe
a generic GENDWARFKSYMSFLAGS?

-- 
Thanks,
Petr
