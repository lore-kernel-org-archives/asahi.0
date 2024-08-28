Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB3D1741F0
	for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 12:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848534; cv=none; b=YySV+NtcB6HoV6ofV+ljQYI5matWnY1kQCLxAxOfO78O5hhHGI+jetQugB75gYV+TOwIsmOoF5zD64YRfyAOsGSlJHs5+V7ewltNMB7PYD8FlLlTKceD8CiicSTBhmL5joVP/q9MaJCqL/IPwm8jtWDGc5dQ+PBM3YZ/Z9ebhk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848534; c=relaxed/simple;
	bh=aEKzrBbYi9Ry+ohyfsBeblxLDxy0FJBfs72+PMvk3CI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=szvzGoQIzOnHHCYiR5Fb1tXO+hrqeSstam3aDtDg08mw0Evx+hXr2qPEdNNthIqKn9Z2nIKSLNmAaNY/JjpjWmR8f9tUwmlyntrAJQBfu8wivsC8RBYFeaKJS1Hb/rorBGLHU2U+xH2HOLVrlyaGTnNrHbWmRahRzS2KojRyIiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WgJHCodL; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WgJHCodL"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-371b015572cso4942277f8f.1
        for <asahi@lists.linux.dev>; Wed, 28 Aug 2024 05:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724848530; x=1725453330; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pUt4fS45inpztmNIGJYo+GUFk/1UM7umsW/0Hcne0yc=;
        b=WgJHCodLYok4OyyHIWV3VWCDlFjEcJ9+vp8FPf3tWMaJMdjUhjN4Q8IjI6uXBlUAWN
         9w4oaXN6Kdv+XQQM0KkQN1UUyaBS9a6YEpoohgejburPRQ3liP298a9hOq+dPLDbQk6o
         UbyMnOGdYlf0umJurYMojLILS8u3Ge0H3JjEAkKYSl/GDxDDpJzT1350vLXh2hXlPa37
         Tces+k1GzJj/mf9zGM+9FxTrbtfhnIc3kPC1UyNNs32MHs8ZkNi2m9LNtb0BQ9HnZZWB
         G91kT1cO0f0dRqGtfXahIlK4mhAtasM+y0uNNBxTXO8YPdm7OKiObhkrsE9P2mw5HTie
         Eqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724848530; x=1725453330;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pUt4fS45inpztmNIGJYo+GUFk/1UM7umsW/0Hcne0yc=;
        b=X6KuKFxgAd+wTwIL2AKs9kJ7Eu0HHDTuO/9ttRtMLda6lNjAfFi/7069aHNhsHzKza
         m135baA4cDfTUX7adv/FnXnP1et/4NWENMq5H9qFcIDRD20wBmoqGCqCpG9m9eDPNTo9
         10XQSQ+TNV/0r2RuDuKD6NjjqNTgHFuf7AS3sCbxPA6A1tHAJq/fdMvhXMCfpNOFt8eu
         AzxtnmiAnbLWOEJutp4lRqIV8NvVwM8T9zIGd5HDWJqSuTwNuoRABnyaMuUDQcTGtuY4
         JgjMlhV4TOLqf93i2RSOyqoF9JIlHYbXMTabG0nCndPh8pKdGFbpTZDkPHtQQz02hhH3
         Wsmw==
X-Forwarded-Encrypted: i=1; AJvYcCU6wNjkTZkHs/TvzgqofxX2XWkXhRyhkXiY9rB1tukmaBqsPfSGlNxF0ojTrTu0tnu/cWktiw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwsPIG3JFTf2ykzx0m3syMtBOgONUhqF7sd+PffcVRhNES/cbAT
	buf6mqUI/rJI5NIGQoEip/4ehCDNPiO22RUjCGcMFgU3iTPt2fghlX9e1I7zfLc=
X-Google-Smtp-Source: AGHT+IHtoo2WUu3BieUUp3gLp4qf08YKUh5yOQZnaKr6LG3FzOM6CjSzhHpc5du36ZYPkM90Gk3FgQ==
X-Received: by 2002:a5d:46cf:0:b0:371:8e85:c58e with SMTP id ffacd0b85a97d-37311863a3cmr13842070f8f.33.1724848530075;
        Wed, 28 Aug 2024 05:35:30 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549cc55sm241658566b.64.2024.08.28.05.35.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 05:35:29 -0700 (PDT)
Message-ID: <95db3178-a2ce-421e-8024-afd7fa3359a3@suse.com>
Date: Wed, 28 Aug 2024 14:35:29 +0200
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/19] gendwarfksyms: Add symbol list handling
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
 <20240815173903.4172139-23-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240815173903.4172139-23-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 19:39, Sami Tolvanen wrote:
> diff --git a/scripts/gendwarfksyms/dwarf.c b/scripts/gendwarfksyms/dwarf.c
> index 65a29d0bd8f4..71cfab0553da 100644
> --- a/scripts/gendwarfksyms/dwarf.c
> +++ b/scripts/gendwarfksyms/dwarf.c
> @@ -5,6 +5,48 @@
> [...]
> +
> +static bool is_export_symbol(struct state *state, Dwarf_Die *die)
> +{
> +	Dwarf_Die *source = die;
> +	Dwarf_Die origin;
> +
> +	state->sym = NULL;
> +
> +	/* If the DIE has an abstract origin, use it for type information. */
> +	if (get_ref_die_attr(die, DW_AT_abstract_origin, &origin))
> +		source = &origin;
> +
> +	state->sym = symbol_get(get_name(die));
> +
> +	/* Look up using the origin name if there are no matches. */
> +	if (!state->sym && source != die)
> +		state->sym = symbol_get(get_name(source));
> +
> +	state->die = *source;
> +	return !!state->sym;
> +}

Sorry, I don't want to comment much on function names.. but I realized
the name of is_export_symbol() isn't really great. The "is_" prefix
strongly indicates that it is only a query function, yet it changes the
state. It makes its caller process_exported_symbols() hard to understand
on the first read.

-- 
Thanks
Petr
