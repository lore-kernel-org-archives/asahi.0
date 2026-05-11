Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAF23ED113
	for <asahi@lists.linux.dev>; Mon, 11 May 2026 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508400; cv=none; b=U5eka3mT45hcqYqyIHM3+EJ7FdbVFrn9T7x/k12Oe0WjDzFa+IZhUYONizKTFoF1zC5i0ONTzlfBAlMb+cyGjcbThQ+n/SVywTkVeU6ctoTj5yDb4+15nj9y2lCbzWD5J4pWeUH9+owmGVl9+tH21NEV7/UlEdNyc3SDSwk1AUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508400; c=relaxed/simple;
	bh=7cxxZqN1g0qqNRtwUJmzJW5yzCgloqX4VcBEh/hoaYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPUyL0o/wovkZLKAn8dt+8xT7099WTEe/zZHEaDZcpiKTJEt41cvjKk/Fk5exR0EUcWK8kKdBkh6eLfd/gZTg1B9NSmQkPa1Kiz/rjK31W1PY0aywka6XMbtVPlEqh9zKyQwNcHhMByZJ4CjZUQkPe0xoLDHGeUHDAZlJhemQcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p57rHau7; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p57rHau7"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1329fc4bf77so3935133c88.1
        for <asahi@lists.linux.dev>; Mon, 11 May 2026 07:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778508398; x=1779113198; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yH/da57m9j66BBfxDcaOUHxrZwIbeRL1xLwNB3IDa6M=;
        b=p57rHau74y2d0qLEexYyHZ4nwur7RChqs9gt4pLE+Yo+aTfyxiuiu6KKWYhXi5a0VE
         hIVxsuXN5IpCnkaGtcrps7Wvc6ewStrfylOUEG/Y3NZ0w8maC7Oc+Rr7lLRZ9Jh7V4bl
         wWPiEUV3fE6bqfOLFs5QPChpn1NRMoEBOhbAcreETLn8MIWPjQvUTV31Umkv2snurRPx
         YXUcBNrLRXi4mW86+9hlwS+EZRQwn0AnvL2buYdNEmSAgnw2WXoSy9q43IazfRIO4Htu
         2YV0Rq6EjbDFGVkX+pCovkpg8kPVPvi275L8/ZbWHT1W1zWxrbKSDNkEeN11Ct1NprLO
         Jqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778508398; x=1779113198;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yH/da57m9j66BBfxDcaOUHxrZwIbeRL1xLwNB3IDa6M=;
        b=SRckqv0XyjKlspm99QhnQCf3zFiAbCkp9cr5M9BAYmtAb6A4IwEGw7VM7UnnkLbYgF
         IWWEGtXDAV6QjKGWONSV1qBmaw92Q+fnbAyYFtJGNqI5CbQAgu4ys8CwOqRC+lvf84/x
         5OQ+7sTxTnU1xOR4W/lhfeaSOhWT0jdY/I3tu+V9XQAHpNuyXnR2A4CMlo07vPAVg9AY
         jlps98qXXLruNUOWUQHceFgzSN6bHUxkjHs1gXrrk6i7isDdncMmtUZZxTjDgOK/pmdL
         8vYRsOC2vNelGWU2/j27HyTeoB4ilHUEXB5NTAEIPF9XoRh4N5+Y2hhpnDEuPfL4Fo31
         4OWg==
X-Forwarded-Encrypted: i=1; AFNElJ+ki8l1sPh/ywRtY15zQ1QvCl0vlPjZ+mvWp0HoBiLxMxfInLphIegTP1pCmQTKnfyjEgBFKA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRKKGpqEuTllMGv+MKsJmx6z0V0/squpQWISbfWEVTNS/JIhu6
	BNcVXl6MI74Q27t9AiC/MppAw9w55JzS00fcIFjSxvJ2FB6e71DUKL3u
X-Gm-Gg: Acq92OGNFrUzPfHLqwWE//tdPlj+oBgQ6U/nUvP1XIsatYyQ8Vnb65Y3WcXW4IfPxT+
	27OArLmlWocigr+nGLzW4Jmh3Bharl/9/SQnhdb7mP3bQ97CaYeJmNmSuG633Yuvx3N3Cw6isPQ
	t4T7d1KuGpeBuPJECt65slmHbT4LdZsj3ASinPCcyOIxXcl5ruklSBt7zMGjFZVcKMynU/nkQdp
	Eshw877PIszOFxJrL1MfliocBLyls0heiCy/wU4hUhpO0cbJi2HEAkeQh4NUGcqJWXT4wbkpPjE
	vnaA3sbF4P+8tdASWdiG0G2wBke3Qjb9zs7NqiG4jW0oH7RG0chCUZlGFvpygrsH6HY/wxa8sr/
	44VNYM7m35a2aLd/m6mA1HYl9EYE6GTtOm2p+bBssnZNmztBSJn6z/B9Heer+Kthh1V2zG99IOj
	MevMqaLvMvmK0LzXp62yjDd4L+PWN0utcMwS9j
X-Received: by 2002:a05:7022:488:b0:12c:8e70:c33b with SMTP id a92af1059eb24-131852d2e27mr14527532c88.8.1778508397470;
        Mon, 11 May 2026 07:06:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13277bb2b14sm18610981c88.0.2026.05.11.07.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:06:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 11 May 2026 07:06:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org,
	Joshua Peisach <jpeisach@ubuntu.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
Message-ID: <a3055969-31ff-4b33-b6eb-6418cbf3597e@roeck-us.net>
References: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
 <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>

On Thu, May 07, 2026 at 09:33:08AM +0200, Janne Grunau wrote:
> The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
> existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
> "apple,t8103-wdt" used by the driver.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>

Applied to my watchdog-next branch.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> index 05602678c070..845b5e8b5abc 100644
> --- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> @@ -16,7 +16,9 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: apple,t6020-wdt
> +          - enum:
> +              - apple,t6020-wdt
> +              - apple,t8122-wdt
>            - const: apple,t8103-wdt
>        - items:
>            - enum:
