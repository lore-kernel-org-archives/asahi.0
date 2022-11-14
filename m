Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79A56FC1
	for <asahi@lists.linux.dev>; Mon, 14 Nov 2022 15:34:14 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 9C2321FFD1;
	Mon, 14 Nov 2022 15:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1668440052; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iX0twiutIXQvyzjvENfNYeTzi5iV06fn6/uJ3rwwZHQ=;
	b=CSqUQJ08j5/qIt6kMB+TN0dttJya6Uhm0czVdp3AA47iPq4SLqKwE0jAXalRa4kxsrFQiv
	Ue+cwR7I2ZEkuCD6NoN7jvTBC/sog6Tt4IKCxLbydvrfyKmt2pclKFrhOQGYKiVjtT2JW2
	rdKzXoU7xcaRXSO722vtMJPAQeuhPsQ=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id E91DB2C143;
	Mon, 14 Nov 2022 15:34:10 +0000 (UTC)
Date: Mon, 14 Nov 2022 16:34:07 +0100
From: Petr Mladek <pmladek@suse.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	asahi@lists.linux.dev, devicetree@vger.kernel.org,
	Hector Martin <marcan@marcan.st>, Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sven Peter <sven@svenpeter.dev>
Subject: Re: [PATCH v3 2/7] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Message-ID: <Y3Jf7xz2CQjJuEeT@alley>
References: <Y2qEpgIdpRTzTQbN@shell.armlinux.org.uk>
 <E1osRXO-002mvw-Fp@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1osRXO-002mvw-Fp@rmk-PC.armlinux.org.uk>

On Tue 2022-11-08 16:33:22, Russell King wrote:
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
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Petr Mladek <pmladek@suse.com>

See one nit below.

> --- a/lib/vsprintf.c
> +++ b/lib/vsprintf.c
> @@ -1762,27 +1762,50 @@ char *fourcc_string(char *buf, char *end, const u32 *fourcc,
>  	char output[sizeof("0123 little-endian (0x01234567)")];
>  	char *p = output;
>  	unsigned int i;
> +	bool pixel_fmt = false;
>  	u32 orig, val;
>  
> -	if (fmt[1] != 'c' || fmt[2] != 'c')
> +	if (fmt[1] != 'c')
>  		return error_string(buf, end, "(%p4?)", spec);
>  
>  	if (check_pointer(&buf, end, fourcc, spec))
>  		return buf;
>  
>  	orig = get_unaligned(fourcc);
> -	val = orig & ~BIT(31);
> +	switch (fmt[2]) {
> +	case 'h':
> +		val = orig;
> +		break;
> +	case 'r':
> +		val = orig = swab32(orig);

I do not like much these multi assignments. I think that the result
was not even defined in some older C standards. Though, I can't find
it now. And even make W=3 does not warn about it.

> +		break;
> +	case 'l':
> +		val = orig = le32_to_cpu(orig);
> +		break;
> +	case 'b':
> +		val = orig = be32_to_cpu(orig);
> +		break;

Best Regards,
Petr
