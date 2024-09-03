Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C59A1D6AA
	for <asahi@lists.linux.dev>; Tue,  3 Sep 2024 15:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725376322; cv=none; b=RumGrvedQb7dMuezwwRrkICxi4Adbc7XPTEFsTFiI3lJg2Wx1pMcHoTpeedwmq5ngknafikXPXKfeFxKAeae6N4+zhG6E0dlb2DItzvi4fQGHL8QaCaEM/T3D+NQ/hSioX7dAzbORvjUNe05OSLiw2ASr2WoitDFtSQNq0HNMRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725376322; c=relaxed/simple;
	bh=HaQoSOeNV+l72P3AJuWZoCj9lxSZl2+1ZxYqkRtwfCw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcKiLTaDKcGbtT2G20y7PsnuIWxoAGUYBw/6RNQXMnWTVR7ydmtzB+iibBRFcsj9wQMXNEIoqN2inC5PdZIgZH7Iwk0dZHTAQgzuTV0ihrHY0qBCiqgUHk5mF5sOx8160ZrWdcngw5a0eiq+Er9KbR0zrvNJq3UHRvBE74W1Icw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XMz/2QtK; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XMz/2QtK"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a86b46c4831so609257766b.1
        for <asahi@lists.linux.dev>; Tue, 03 Sep 2024 08:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725376318; x=1725981118; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8WDyM7wA+4uXBEwvEfZ6K89F1ujUbboR8QatKwOx+kg=;
        b=XMz/2QtKXL2s9aswyJs50LQzjnMM0VXodjHtUXoYnHJz4do7ohtxLmpN9brnMO9RmY
         BB5uv3k7EkHgeSCsDgVGEsjqEgAy1Hi2pmwDdWgYCRxS95LireryegMdFMjM3CHECZ63
         FZKAnIt7MS6xHbvVj8n8A+CnAOui5I1SYTA4DEWz3Bkc7J1REvSJ0NFECGAi6MMSMeS7
         zXX16G+IC0PsXRsmVGRkGDTLE73c45OPu8G3z0Zh3rc3Wbjlo4T1/4qYI1z1NTAQqvqI
         aojTD+cN45OLCdOz8tXhGDYp0NMecI3EAAR2PUXVn55pRC606D49oJyiPkUctjX/cawZ
         sC9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725376318; x=1725981118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WDyM7wA+4uXBEwvEfZ6K89F1ujUbboR8QatKwOx+kg=;
        b=Ie35efmgsFxIWMCifN6j30ylc6z1B2yuzoB9l/fiN/RvIkp2lLJ8WosvK4Mv95ljMn
         etCHisQhjiG25E4uF3YTkiQcYncMGT3qV4nvnLStr4Ts1oqTdk/D9RSwiKt9e4B6uLou
         gddrgkmlYVKUzzSHIekDjRyAKow8567m3WilDcI7maIriKLa3wIJlwdm8bjeQp0EoNmy
         0N5OzTEkafzhq4NxCO17nUTg3bsby7NcLtWn/dQdL2yNkw4r9Uc8KkjxDQBO51x+bzlE
         tu32WgZFu7vsFV2d8lg84wVgDhE1iku5EIwmVmR3Q4rTtFKq7YgMvq+4RX5qa5bcZaXG
         hL0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVHh6gJjeGkQYNDCS7aiaqsW25D1fnKH3wJbu3qSAzoh7sdqZVFfCj4nQncOx237pYQz1p2qA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxW/03mTSFDBWQ9A8x6cj+A/G4UVRSU0laceBhkz5N4i6GzPMrA
	YeZBnqKLaf5WVYG9I4u2jgorFLRpsnQO2Tt5kafo8Lv/ljOPdL9SarZhuAU4ltI=
X-Google-Smtp-Source: AGHT+IFoUUFxcVhHxWppSsUC1TKbkdYIP8izH9TlTs0zzWQ7ixgWt0bHVTTPOJbkicRNtP6gPNtD2A==
X-Received: by 2002:a17:906:ef0d:b0:a80:f7db:3e7 with SMTP id a640c23a62f3a-a89d87216d1mr821251966b.5.1725376318249;
        Tue, 03 Sep 2024 08:11:58 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989196500sm695054466b.138.2024.09.03.08.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 08:11:57 -0700 (PDT)
Message-ID: <9978884e-87c8-4c20-b9ff-b4571bce01ce@suse.com>
Date: Tue, 3 Sep 2024 17:11:57 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/19] gendwarfksyms: Expand subroutine_type
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
 <20240815173903.4172139-29-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240815173903.4172139-29-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 19:39, Sami Tolvanen wrote:
> Add support for expanding DW_TAG_subroutine_type and the parameters
> in DW_TAG_formal_parameter. Use this to also expand subprograms.
> 
> Example output with --debug:
> 
>   subprogram(
>     formal_parameter base_type usize byte_size(8),
>     formal_parameter base_type usize byte_size(8),
>   )
>   -> base_type void;
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>  scripts/gendwarfksyms/dwarf.c         | 57 ++++++++++++++++++++++++++-
>  scripts/gendwarfksyms/gendwarfksyms.h |  1 +
>  2 files changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index 82185737fa2a..c81652426be8 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> [...]
>  
> +static int __process_subroutine_type(struct state *state, struct die *cache,
> +				     Dwarf_Die *die, const char *type)
> +{
> +	check(process(state, cache, type));
> +	check(process(state, cache, "("));
> +	check(process_linebreak(cache, 1));
> +	/* Parameters */
> +	check(process_die_container(state, cache, die, process_type,
> +				    match_formal_parameter_type));
> +	check(process_linebreak(cache, -1));
> +	check(process(state, cache, ")"));
> +	process_linebreak(cache, 0);
> +	/* Return type */
> +	check(process(state, cache, "-> "));
> +	return check(process_type_attr(state, cache, die));
> +}

If I understand correctly, this formatting logic also affects the
symtypes output. Looking at its format, I would like to propose a few
minor changes.

Example of the current symtypes output:
kprobe_event_cmd_init subprogram( formal_parameter pointer_type <unnamed> { s#dynevent_cmd } byte_size(8), formal_parameter pointer_type <unnamed> { base_type char byte_size(1) encoding(8) } byte_size(8), formal_parameter base_type int byte_size(4) encoding(5),  ) -> base_type void

Proposed changes:
kprobe_event_cmd_init subprogram ( formal_parameter pointer_type <unnamed> { s#dynevent_cmd } byte_size(8) , formal_parameter pointer_type <unnamed> { base_type char byte_size(1) encoding(8) } byte_size(8) , formal_parameter base_type int byte_size(4) encoding(5) ) -> base_type void
                                ^- (1)                                                                    ^- (2)                                                                                                                                                       ^- (3)

(1) "subprogram(" is split to "subprogram (".
(2) A space is added prior to ",".
(3) String ", " is removed after the last parameter.

Separating each token with a whitespace matches the current genksyms
format, makes the data trivially parsable and easy to pretty-print by
additional tools. If some tokens are merged, as in "subprogram(", then
such a tool needs to have extra logic to parse each word and split it
into tokens.

For attributes with one value, such as "byte_size(4)", I think the
current format is probably ok.

-- 
Thanks,
Petr
