Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCCA1DE2D7
	for <asahi@lists.linux.dev>; Thu, 17 Oct 2024 14:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729174132; cv=none; b=Fw/Vk9k+0Ayh7RT7v+V1QAEe7GCjFfxCYZH9hI3j37jVLt51hFIzBjXHF0FmFEyR6MWGAWwP9TZSjg6RH8W5gOFFUVlI0iGKRIr95C9TDPTNs6KkEx4/PcDewnAaOEt8r5y8bCR6SB6/QkpWPBCY/p6OTodckYp5UuVIren2p00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729174132; c=relaxed/simple;
	bh=l0NsmYgkaQLaTjYdBXqJw5xZOdd2f3pd3mREd4Ix4AA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=khm4kurO2uluXx1Iqm+oW/l7zpwpHlG6TgTA8JTJObDUq+VWOVsRRVfa4lSI5Plk3HhJk0s4BL6Fh9Zgatt2WRpSbb/XeF1cC9n+4H7ucq8vKVLlziF/FWIYb33xU81oc32haOspyYld2sKoxIMEsi/32oPi9FwIIhLZ5XcGXt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RTkv22hc; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RTkv22hc"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a2209bd7fso117139966b.2
        for <asahi@lists.linux.dev>; Thu, 17 Oct 2024 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729174125; x=1729778925; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxqmzyeuFlO3l4tRAe1C7/koqses/L5E0Mtm51tHiq8=;
        b=RTkv22hcUxnRi8VeaYxZlT5rQiQxf8XW5ivcZqT1A+9OPjbyW8aiFTKTtXIV2chF40
         QfyyB8b3Ni/WA2f8MYmChkvxL7dkGhkKESorW3PIy3SNZl2Lwv6woQN376tbhV2e3Xyt
         1X1wyaRIyj4Olp2pxlzOLrxxKDYP1w7IC8J6cl0Eh6sQqxh+6DtBtnTErTDKf1zlS86z
         htlBvk1UIWW0z2q4M1kCBsp2dwdETuIYjKsWv+qC6jkoMD9HUWSrUD/cYAvlkq8R/o1+
         i3w1/oqdxTbdXBYw55AiehOJih2QjoWM5EZSuyLiKh/ezE4GTLOfLZK7TK6mdmKuOAQY
         KQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729174125; x=1729778925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxqmzyeuFlO3l4tRAe1C7/koqses/L5E0Mtm51tHiq8=;
        b=WwGAXcIV95VyfDYzz4AcQh+86mylwltBR+mWzR1FQA9MI62/7e0g5VezWOi8HfNBjh
         HTP05acP2AFe0kuivNvm3KUyUmYi+IR/4Lv6oY5VfxdYNSKLz9HZbPQJpseZTV9L8W3U
         kfmBSrcHcXjcQ2c56TEPxkpM4Pae6pfLvmzqmlVjshe7fUySYjs8TjliCCaM5a72fmU0
         ENSCTqKqFiKsxPYyh6tgxRvvx8/wi2+04UrboJZzPf9LiC8zLK5duee6+jXEqkwxxsQN
         QxH1R2CtHcfRWweWEM8c/WX2k5CBjHyyHMm5th6XxEorhzxzSnUQExnEhR6HhHr7mnnn
         Dqlg==
X-Forwarded-Encrypted: i=1; AJvYcCUaPWM0HQ37Re0+zYUxxfQDOoDc/zg/oy4pHB7F017iArSAprRRKN56+PBAiiada2ua+S4LVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyNMfns2ew7ERJPdblXdu2VF92n5yTfiMz0I4skpnk/+Whb4Lbj
	LEWa6FASIRpGAgKLlbNJ0LoWYHw1XRJcLLwNOdweh3aT7CNhZzSbMJa0JsLy45g=
X-Google-Smtp-Source: AGHT+IEvABkPNy7vk52SMCsHIro6voveAG7rnRjF16+dlvWWg2PQOIEn/QYTj3ofuof+xuyLhHJkNg==
X-Received: by 2002:a17:907:e25c:b0:a99:46aa:69d3 with SMTP id a640c23a62f3a-a9a34f0dd07mr735175766b.53.1729174125102;
        Thu, 17 Oct 2024 07:08:45 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a2971ab14sm300538066b.21.2024.10.17.07.08.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 07:08:44 -0700 (PDT)
Message-ID: <9a3c1b7e-6cd3-45ea-9be1-13a5b436cacd@suse.com>
Date: Thu, 17 Oct 2024 16:08:42 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/19] gendwarfksyms: Add address matching
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
 <20241008183823.36676-24-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-24-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> The compiler may choose not to emit type information in DWARF for all
> aliases, but it's possible for each alias to be exported separately.
> To ensure we find type information for the aliases as well, read
> {section, address} tuples from the symbol table and match symbols also
> by address.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>
> ---
>  scripts/gendwarfksyms/gendwarfksyms.c |   2 +
>  scripts/gendwarfksyms/gendwarfksyms.h |  13 +++
>  scripts/gendwarfksyms/symbols.c       | 148 ++++++++++++++++++++++++++
>  3 files changed, 163 insertions(+)
> 
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.c b/scripts/gendwarfksyms/gendwarfksyms.c
> index 1a9be8fa18c8..6fb12f9f6023 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.c
> +++ b/scripts/gendwarfksyms/gendwarfksyms.c
> @@ -103,6 +103,8 @@ int main(int argc, char **argv)
>  			error("open failed for '%s': %s", argv[n],
>  			      strerror(errno));
>  
> +		symbol_read_symtab(fd);
> +
>  		dwfl = dwfl_begin(&callbacks);
>  		if (!dwfl)
>  			error("dwfl_begin failed for '%s': %s", argv[n],
> diff --git a/scripts/gendwarfksyms/gendwarfksyms.h b/scripts/gendwarfksyms/gendwarfksyms.h
> index 1a10d18f178e..a058647e2361 100644
> --- a/scripts/gendwarfksyms/gendwarfksyms.h
> +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> @@ -66,14 +66,27 @@ extern int dump_dies;
>   * symbols.c
>   */
>  
> +static inline unsigned int addr_hash(uintptr_t addr)
> +{
> +	return hash_ptr((const void *)addr);
> +}
> +
> +struct symbol_addr {
> +	uint32_t section;
> +	Elf64_Addr address;
> +};
> +
>  struct symbol {
>  	const char *name;
> +	struct symbol_addr addr;
> +	struct hlist_node addr_hash;
>  	struct hlist_node name_hash;
>  };
>  
>  typedef void (*symbol_callback_t)(struct symbol *, void *arg);
>  
>  void symbol_read_exports(FILE *file);
> +void symbol_read_symtab(int fd);
>  struct symbol *symbol_get(const char *name);
>  
>  /*
> diff --git a/scripts/gendwarfksyms/symbols.c b/scripts/gendwarfksyms/symbols.c
> index 4df685deb9e0..6cb99b8769ea 100644
> --- a/scripts/gendwarfksyms/symbols.c
> +++ b/scripts/gendwarfksyms/symbols.c
> @@ -6,8 +6,39 @@
>  #include "gendwarfksyms.h"
>  
>  #define SYMBOL_HASH_BITS 15
> +
> +/* struct symbol_addr -> struct symbol */
> +static HASHTABLE_DEFINE(symbol_addrs, 1 << SYMBOL_HASH_BITS);
> +/* name -> struct symbol */
>  static HASHTABLE_DEFINE(symbol_names, 1 << SYMBOL_HASH_BITS);
>  
> +static inline unsigned int symbol_addr_hash(const struct symbol_addr *addr)
> +{
> +	return hash_32(addr->section ^ addr_hash(addr->address));
> +}
> +
> +static unsigned int __for_each_addr(struct symbol *sym, symbol_callback_t func,
> +				    void *data)
> +{
> +	struct hlist_node *tmp;
> +	struct symbol *match = NULL;
> +	unsigned int processed = 0;
> +
> +	hash_for_each_possible_safe(symbol_addrs, match, tmp, addr_hash,
> +				    symbol_addr_hash(&sym->addr)) {
> +		if (match == sym)
> +			continue; /* Already processed */
> +
> +		if (match->addr.section == sym->addr.section &&
> +		    match->addr.address == sym->addr.address) {
> +			func(match, data);
> +			++processed;
> +		}
> +	}
> +
> +	return processed;
> +}
> +
>  static unsigned int for_each(const char *name, symbol_callback_t func,
>  			     void *data)
>  {
> @@ -22,9 +53,13 @@ static unsigned int for_each(const char *name, symbol_callback_t func,
>  		if (strcmp(match->name, name))
>  			continue;
>  
> +		/* Call func for the match, and all address matches */
>  		if (func)
>  			func(match, data);
>  
> +		if (match->addr.section != SHN_UNDEF)
> +			return __for_each_addr(match, func, data) + 1;
> +
>  		return 1;
>  	}

This change means that symbol_get() doesn't return the first matching
symbol but the last one matched by an address.

For instance:
void foo(int a1) {}
void bar(int a1) __attribute__((alias("foo")));

The compiler produces the debug information only for foo() but
gendwarfksyms would instead report that it processed bar() when reading
this data, which is misleading. On the other hand, I don't immediately
see that it would result in an incorrect CRC or symtypes output, because
the symbols with the same address are effectively treated as one group,
so I'm not sure if this is important or not.

-- 
Thanks,
Petr
