Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFFE16FF44
	for <asahi@lists.linux.dev>; Mon,  2 Dec 2024 16:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733155737; cv=none; b=O7R1JUxj6kA0lQhJ4I5aNgUFE7SNMn66mRjlZV4xngp4g+DoCR+8nmreUYgG7GCP6uhL75QHVzVFWo0T5vPqyf4gqlb7Z/+yQLDNyxCqgTBc2KR+r7ytDu0NZJAEMZ+EsO9h8wY77ck+dLIK5953Wvt3DRQFP/6oId3NeG/JXPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733155737; c=relaxed/simple;
	bh=MwB1ACqjAl/x3LNO27/3tM8Pks1XLvEtvtCteP6ruUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQlOXoJ+N5AjveLJa/Ty04rm4l8TYeI8e64Y5VOH2/+Z5GavrVgYOFnQxrRpyCl6a+NNmHmOKfMo7UaEBUKbzt5E1/myd6QcmWJCg9WW30uUGfeqSxtCGaIRFX61enKWBGF9URRV28T8gFZ4AaAz15DPQJgjc+4+wt12ivrwGUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FIXLHXC3; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FIXLHXC3"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e3621518so1760831f8f.1
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 08:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733155734; x=1733760534; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wk9t4gJyThohCN5wH/UWKd/DL3WW9bY6aJcRvcTwW+M=;
        b=FIXLHXC3ymQZ20WE4EAqV2JqJABWgcP7VBplSvW1yRFqr4p1cMIMpfCD5nNQcE1vJT
         WwrKAz9o0Jtldn5UVl5gTN7W4WJPww2+i+V0wlH0Se1uVamY7CiVzq0qRcH8E1HFWaY6
         ErsED07OOLu6KXUl+BGAhZCPp7AGk9NXtjQS8O3icRek3WRo18bPaKOmEufb1w1PKMpo
         9PB7Ti7DhfptgLDGDLzI/g8FmU+m0IhBKvu3owz241B5lJ+ZPUBueQBq9g2+gsz56cfX
         VCVop7HwfkCfgUjp7MImV/UX2t9coNUb5AfMZyvMBHlIRpVhTpuKK9mDLxx8fKlIA+8T
         CVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733155734; x=1733760534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wk9t4gJyThohCN5wH/UWKd/DL3WW9bY6aJcRvcTwW+M=;
        b=gZ22NFQsJhRAoTrUVCcYgwvKLBacND8KwRASx/fv5Zh+M1o/vgcM/e/i8JQv6RaoTZ
         /SJ/mpV3ikihep2KvatMkxBqWxm7bnuVkB2qwOCvhALTW5J7CriayJBj02WZ7x3p8cPn
         AGD0WUrTVodibWpRDiUNWqLUbkEqDqBXbpiwVBVeLqxBk0TBptX1jqj/NU6AINuArPve
         1t3pqZLdF3WUGrXsjvez79t/smCayP+SHcJ6rbonQr2wAzpPGoyrr+lHmb0S6h4uBbP3
         ITtcbQsGmcCo3QcbDpdkvKLc6ixAxR52EbGHZoWGx/7MTsfztIJu67L8xc+tB7WV2VQf
         X9JA==
X-Forwarded-Encrypted: i=1; AJvYcCV89RU1KIQjCA/+l8hudNU7MxivgGam7uaW30pyc4GLXaNb9Uwm8uFYRF3TnE5u2Pn/RxjKcA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4QHiGi9uolmPdYx3ksDjlvc0gNzyRhUZkwfVtTrZtzqgTIUPl
	gHaL6j0Sq47i5bYSVKK5g4EG4D0Ec5qN6MzD46IXPEMF884g8ZDbxCUtRriKbks=
X-Gm-Gg: ASbGnctRctsSnKpQNnFZOu4zG/ieHi9By97SL2nKNqOTvlnfh9hno1gsA4mY25UxisV
	UdizBIUg4icdKoNsj9nVKgWZg5UrW7NsYj+OUQ+BriEeqjY4IC6aYzq2Dd+CPVlyHDuPN/r84KR
	sTxK56D3cbYySlFsg1eH1Clr5JFR7oeDwe5dkaHl+lQeqSWZpya/T+D2gNOwZQnhVF6hZ+0X2Dt
	uZmQr5ouC49upIwVdYXcbZ6TPC5wQOW6Gne1hHRvgMrkrN4gEBdAA==
X-Google-Smtp-Source: AGHT+IHdMxsweQVSvkIE89/cartjnOdmknoW4rycIDu/WM156Nv5fZKnY0Cvww8TcwuaRagOlY68cw==
X-Received: by 2002:a5d:5f46:0:b0:385:fb59:8358 with SMTP id ffacd0b85a97d-385fb598458mr236029f8f.53.1733155732003;
        Mon, 02 Dec 2024 08:08:52 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd68c1bsm13165465f8f.84.2024.12.02.08.08.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 08:08:51 -0800 (PST)
Message-ID: <de6b416c-b96a-43aa-ad72-ea365ffbe785@suse.com>
Date: Mon, 2 Dec 2024 17:08:49 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/18] gendwarfksyms: Add address matching
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
 <20241121204220.2378181-22-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241121204220.2378181-22-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/24 21:42, Sami Tolvanen wrote:
> The compiler may choose not to emit type information in DWARF for all
> aliases, but it's possible for each alias to be exported separately.
> To ensure we find type information for the aliases as well, read
> {section, address} tuples from the symbol table and match symbols also
> by address.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
[...]
> @@ -82,6 +118,130 @@ struct symbol *symbol_get(const char *name)
>  	return sym;
>  }
>  
> +typedef void (*elf_symbol_callback_t)(const char *name, GElf_Sym *sym,
> +				      Elf32_Word xndx, void *arg);
> +
> +static void elf_for_each_global(int fd, elf_symbol_callback_t func, void *arg)
> +{
> +	size_t sym_size;
> +	GElf_Shdr shdr_mem;
> +	GElf_Shdr *shdr;
> +	Elf_Data *xndx_data = NULL;
> +	Elf_Scn *scn;
> +	Elf *elf;
> +
> +	if (elf_version(EV_CURRENT) != EV_CURRENT)
> +		error("elf_version failed: %s", elf_errmsg(-1));
> +
> +	elf = elf_begin(fd, ELF_C_READ_MMAP, NULL);
> +	if (!elf)
> +		error("elf_begin failed: %s", elf_errmsg(-1));
> +
> +	scn = elf_nextscn(elf, NULL);
> +
> +	while (scn) {
> +		shdr = gelf_getshdr(scn, &shdr_mem);
> +		if (!shdr)
> +			error("gelf_getshdr failed: %s", elf_errmsg(-1));
> +
> +		if (shdr->sh_type == SHT_SYMTAB_SHNDX) {
> +			xndx_data = elf_getdata(scn, NULL);
> +			if (!xndx_data)
> +				error("elf_getdata failed: %s", elf_errmsg(-1));
> +			break;
> +		}
> +
> +		scn = elf_nextscn(elf, scn);
> +	}
> +
> +	sym_size = gelf_fsize(elf, ELF_T_SYM, 1, EV_CURRENT);
> +	scn = elf_nextscn(elf, NULL);
> +
> +	while (scn) {
> +		shdr = gelf_getshdr(scn, &shdr_mem);
> +		if (!shdr)
> +			error("gelf_getshdr failed: %s", elf_errmsg(-1));
> +
> +		if (shdr->sh_type == SHT_SYMTAB) {
> +			unsigned int nsyms;
> +			unsigned int n;
> +			Elf_Data *data = elf_getdata(scn, NULL);
> +
> +			if (!data)
> +				error("elf_getdata failed: %s", elf_errmsg(-1));
> +
> +			if (shdr->sh_entsize != sym_size)
> +				error("expected sh_entsize (%lu) to be %zu",
> +				      shdr->sh_entsize, sym_size);
> +
> +			nsyms = shdr->sh_size / shdr->sh_entsize;
> +
> +			for (n = 1; n < nsyms; ++n) {
> +				const char *name = NULL;
> +				Elf32_Word xndx = 0;
> +				GElf_Sym sym_mem;
> +				GElf_Sym *sym;
> +
> +				sym = gelf_getsymshndx(data, xndx_data, n,
> +						       &sym_mem, &xndx);
> +
> +				if (!sym ||
> +				    GELF_ST_BIND(sym->st_info) == STB_LOCAL)
> +					continue;

Doesn't NULL returned by gelf_getsymshndx() indicate an error? If yes
then I think it should be reported instead of silently skipping the
symbol.

With this addressed, feel free to add:
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
