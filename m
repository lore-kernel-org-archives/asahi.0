Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B231EF395
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740758364; cv=none; b=R70Mpo3LqW4SsDREgnRxFRmp1km5JrqSc51IIRlLChBO4wbzszcMHkGpNK4lBhVp9J5s+hegP1khTRBltOoZqzGC71UmgyFYD+XRZ5qxaNNE/O+IIXj/0KIQmud318l7UTYcAmWOoYN0l1UCFPh8sTo6lx1wHz79Luh4DrHPDuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740758364; c=relaxed/simple;
	bh=b46EP5IzWq8UU0xT/34RovEAbbytBs+vdnTdJMSt2qM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VF54Y0sgN8B6cuN/Hv9AjphkzUNZy2LnMtl3JIT1nme1R31CiYnYfw83H28tzHO6fozLeEjFz+1McGKiZcdReqbFY+GKxyORIYkVS2IT8H9NsmbKLz/xO4TEL058OtkTfHBm72m1N1hDCibKSWAVHg5jVGsK5d3aUymkdRi94yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cFZlL7R2; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cFZlL7R2"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abb7f539c35so423277666b.1
        for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 07:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740758360; x=1741363160; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=77jE1/LyMPegdPWJf8a9cIaRHVuPbBJvb9L7XbmoSfk=;
        b=cFZlL7R2eiOijMCa9M+lrmRVcvYKxUo1jeGi7uwHA4Q57c6LTuImd5o5eKiyyzsj0n
         lKXiWNcWtRCcabZanoSiXvVh2dlBL3FQI3QtX7vi4j0jDUjH1CIMc4rmngLzv6XbRg+G
         mrIGpsPB2UdLrAWs6omAFV27CxbSn1KMdhvJbU2TXuedU1B0kFkFLS9cEXGhQdCgR1/C
         0EEXu+WKIGWfFKtBENPqo2PvKuDj9WnkC5iLZyKIVN04TV7jbEHoX1NJ05771algqtM1
         JBh6HnswxRJwttVq/bjr/67etYOoEE1d/3H3+u2rFT9n6AJbEnhORH9rOvHdpfjiZAht
         fx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740758360; x=1741363160;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77jE1/LyMPegdPWJf8a9cIaRHVuPbBJvb9L7XbmoSfk=;
        b=cAESYkpWDeJ+zDigkisPV4l+9xcoxlYOwwnImYz7Jee1aOog45GnB3LFYWHC8ioyKj
         oyiwi4Fbx9Cc6EpLPI9ccpMsiREQEp6p0lLVHgCJw6fo9f+GBpCMyuLxW3R6QD6bIZN7
         B1RRXQl3g4riDBujgYX/EgbejR20pwsv/xmYDvghj8sabenheDT3UjuqGBrJ3IkoHt7t
         cfHkokkhMlNtkBpclgc62fWp4pmMatv4vwZqA40VQa/nSAXHALbTNeFBaI9RVWid06Bu
         q3KRNCsgjao685uNdOYqaUWClK1CQU19zMnmWZjJ8qLsEkmZgC9xa4UD16jnVrfHWIaO
         p2pw==
X-Forwarded-Encrypted: i=1; AJvYcCXs6F6VKk9E/+E5DABK4TSiLrm4bgqjMMpzuBcD9BomzvGt+sjcRRk/KccUMWCuFP8HVZBRcg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4nNxyh41e5ECnimjpU2IkPzHtS2W/73EE4pY9HU3uuyNn5hLE
	Uzlh/iGRU5yFPMcyh19GqmRkR9122RtCBTN7J1hI3nLextLFfsxnBrWOMYUf3IQ=
X-Gm-Gg: ASbGncuaO8VBru2nvtMHZ00J12Y3+JAGEOYAkskraL/j0rJw+4qlBVgfAseDDthLSF9
	ZOpZHHWsb+PKZ9+Fot0zMcNT2LouH56LRTre4BZ2d5KjCs+8AVcxcumYKtgivoL7nO3sChtX3ZW
	S4j0KZm1vXfgobgVbUxkofa7m0QeUrEbhDJV8nKOB4Jfe5XGtsEIT/AE+G+UnkVvoogGRpefMDL
	ZzFip9T21AXOBJomtPWMy3GT1lyRyvkGMqrG6enbWDWGWKNz4r9LidmqGIWEiDbnjPpn4wEajTD
	/wDXH/h2Dz9lK5weQpyndjRr7lhv
X-Google-Smtp-Source: AGHT+IFn7pQ0YfG5opXpIxWkH3TKxQe435WJeIcDsK+/6jZv4G4I2NoKhduLn6iQSoe62P9qjjwEwQ==
X-Received: by 2002:a17:906:f59d:b0:ab7:a5f2:ed22 with SMTP id a640c23a62f3a-abf25fa0374mr480905066b.1.1740758359562;
        Fri, 28 Feb 2025 07:59:19 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c0ba58asm308277866b.31.2025.02.28.07.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:59:19 -0800 (PST)
Date: Fri, 28 Feb 2025 16:59:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	"andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"corbet@lwn.net" <corbet@lwn.net>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"apw@canonical.com" <apw@canonical.com>,
	"joe@perches.com" <joe@perches.com>,
	"dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
	"lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Hector Martin <marcan@marcan.st>,
	"sven@svenpeter.dev" <sven@svenpeter.dev>,
	Janne Grunau <j@jannau.net>,
	"alyssa@rosenzweig.io" <alyssa@rosenzweig.io>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>
Subject: Re: [PATCH v4] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Z8HdVfr2hWyzhwHh@pathway.suse.cz>
References: <DB7F502D-1477-49C9-A36D-1DEE408ED23C@live.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB7F502D-1477-49C9-A36D-1DEE408ED23C@live.com>

On Thu 2025-02-27 06:30:48, Aditya Garg wrote:
> From: Hector Martin <marcan@marcan.st>
> 
> %p4cc is designed for DRM/V4L2 FOURCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FOURCCs with various endian semantics:
> 
> %p4ch   Host-endian
> %p4cl	Little-endian
> %p4cb	Big-endian
> %p4cr	Reverse-endian
> 
> The endianness determines how bytes are interpreted as a u32, and the
> FOURCC is then always printed MSByte-first (this is the opposite of
> V4L/DRM FOURCCs). This covers most practical cases, e.g. %p4cr would
> allow printing LSByte-first FOURCCs stored in host endian order
> (other than the hex form being in character order, not the integer
> value).
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
>

> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -648,6 +648,38 @@ Examples::
> 	%p4cc	Y10  little-endian (0x20303159)
> 	%p4cc	NV12 big-endian (0xb231564e)
> 
> +Generic FourCC code
> +-------------------
> +
> +::
> +	%p4c[hrbl]	gP00 (0x67503030)
> +
> +Print a generic FourCC code, as both ASCII characters and its numerical
> +value as hexadecimal.
> +
> +The additional ``h``, ``r``, ``b``, and ``l`` specifiers are used to specify
> +host, reversed, big or little endian order data respectively. Host endian
> +order means the data is interpreted as a 32-bit integer and the most
> +significant byte is printed first; that is, the character code as printed
> +matches the byte order stored in memory on big-endian systems, and is reversed
> +on little-endian systems.

I am a bit confused by the description like I was in the past, see
https://lore.kernel.org/r/Y3zhhLoqAOaZ7rMz@alley  ;-)

I wonder if the following sounds better:

<proposa>
Print a generic FourCC code, as both ASCII characters and its numerical
value as hexadecimal.

The generic FourCC code is always printed in the the big-endian format,
the most significant byte first. This is the opposite of V4L/DRM
FOURCCs.

The additional ``h``, ``r``, ``b``, and ``l`` specifiers define what
endianes is used to load the stored bytes. The data might be interpreted
using the host-endian, reverse-host-endian, big-endian, or little endian.
</proposal>

> +Passed by reference.
> +
> +Examples for a little-endian machine, given &(u32)0x67503030::
> +
> +	%p4ch	gP00 (0x67503030)
> +	%p4cr	00Pg (0x30305067)
> +	%p4cb	00Pg (0x30305067)
> +	%p4cl	gP00 (0x67503030)
> +
> +Examples for a big-endian machine, given &(u32)0x67503030::
> +
> +	%p4ch	gP00 (0x67503030)
> +	%p4cr	00Pg (0x30305067)
> +	%p4cb	gP00 (0x67503030)
> +	%p4cl	00Pg (0x30305067)
> +
> Rust

The patch has been malformed. I guess that your mail client
removed spaces at the beginning of some lines.

> ----
> 
> diff --git a/lib/test_printf.c b/lib/test_printf.c
> index 59dbe4f9a..056929c06 100644
> --- a/lib/test_printf.c
> +++ b/lib/test_printf.c
> @@ -776,21 +776,46 @@ static void __init fwnode_pointer(void)
> 	software_node_unregister_node_group(group);
> }
> 
> +struct fourcc_struct {
> +	u32 code;
> +	const char *str;
> +};
> +
> +static void __init fourcc_pointer_test(const struct fourcc_struct *fc, size_t n,
> +				       const char *fmt)
> +{
> +	size_t i;
> +
> +	for (i = 0; i < n; i++)
> +		test(fc[i].str, fmt, &fc[i].code);
> +}
> +
> static void __init fourcc_pointer(void)
> {
> -	struct {
> -		u32 code;
> -		char *str;
> -	} const try[] = {
> +	static const struct fourcc_struct try_cc[] = {
> 		{ 0x3231564e, "NV12 little-endian (0x3231564e)", },
> 		{ 0xb231564e, "NV12 big-endian (0xb231564e)", },
> 		{ 0x10111213, ".... little-endian (0x10111213)", },
> 		{ 0x20303159, "Y10  little-endian (0x20303159)", },
> 	};
> -	unsigned int i;
> +	static const struct fourcc_struct try_ch = {
> +		0x41424344, "ABCD (0x41424344)",
> +	};
> +	static const struct fourcc_struct try_cr = {
> +		0x41424344, "DCBA (0x44434241)",
> +	};
> +	static const struct fourcc_struct try_cl = {
> +		le32_to_cpu(0x41424344), "ABCD (0x41424344)",
> +	};
> +	static const struct fourcc_struct try_cb = {
> +		be32_to_cpu(0x41424344), "ABCD (0x41424344)",
> +	};
> 
> -	for (i = 0; i < ARRAY_SIZE(try); i++)
> -		test(try[i].str, "%p4cc", &try[i].code);
> +	fourcc_pointer_test(try_cc, ARRAY_SIZE(try_cc), "%p4cc");
> +	fourcc_pointer_test(&try_ch, 1, "%p4ch");
> +	fourcc_pointer_test(&try_cr, 1, "%p4cr");
> +	fourcc_pointer_test(&try_cl, 1, "%p4cl");
> +	fourcc_pointer_test(&try_cb, 1, "%p4cb");

Nit: I would use ARRAY_SIZE() instead of the hardcoded 1 in all cases.
     But it might be a matter of taste.

> }
> 

Otherwise, it looks good to me.

Best Regards,
Petr
