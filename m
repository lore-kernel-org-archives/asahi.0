Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6293F3C13E3
	for <asahi@lists.linux.dev>; Wed, 15 Jul 2026 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784133350; cv=none; b=HXz4L7GI7/wD/09KEQKF1gCay/jYQs6uAm5ShVt8F0t8eP9GF92mOuLGQcGa894+ZlXbibCuW0pjqzhMUw8531iLDrXL5CAyqhYLr0v0H2ZH0QxFk8MACiQSxwVACht94spCQnD2Ytq7Ig2VEvfsa7RK5vgHeBr8LmSYOsLn1NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784133350; c=relaxed/simple;
	bh=7IrB0okd03Aqpih7Ns5d5dds/+Un1am8C/UF9ELzHjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/Pkfv7Z/nQg0VeGyDd+nyc9s07yhoDbk0Wc5fyChKMtbDVyKqQZDoAkenThXi6fygr5vqbsDq3TBmPzgYOWTIWNqgHAhGZBpfdSvDhGFssc2Vq/avyhnn0mW5y4H+QY7Tk9oJtqCP4FufeSc7+MdYYzFgua99pypylWT1+79O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tz6+FCD+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tz6+FCD+"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-848593533cbso3103621b3a.3
        for <asahi@lists.linux.dev>; Wed, 15 Jul 2026 09:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784133346; x=1784738146; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xKMpslmS1nZLwbcYPHb8iOZLrmPISU+0dOPEfAdriDw=;
        b=Tz6+FCD+oTvvMClm2waOXSZ5uaIzRfUbXJoBpnJAi0b7SsZcACGjnGdFVrnIAljOqL
         WS5SoXm/OrwGhgQYZ2LFHY78ZYeUVM2pFxI/f+uF0rla2yUpHCCfPfcFKVnai6xPo1j2
         dfOMzUZnIeCYkDIDwjywovEJFwDdh2kAvU57ffZDVRgX+njOaVy1HxlgYMGT3SkEnYoG
         XmbvxPlubSAuvAJO5FZmHREjKsFdUHBzxVqE3dvg4umjgwc07ild1O00EPhn70oHtGrb
         68Jjr9efxWZkmOdU2+m8fHSDOPGx132LE+PvAL6G1u48aQkuKeK6KwKPBF2k1lOv0QST
         Y9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784133346; x=1784738146;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKMpslmS1nZLwbcYPHb8iOZLrmPISU+0dOPEfAdriDw=;
        b=P+o2JEI4BHTSd+ZD4wNCLtlZUGM9wGiw7HhM2yprEUMYmA+karjDau9dMK1b/H+Zap
         Ne9pcIYC8e7JF9KdvC30z/ycJTDzb7SNJc7yKZvthWCL7u42YSZkjsIj00W6s9eIWxbO
         IdUYWxB7VwmAbbqNvlxdlB/aB1kxkQw1BHin2swlC69wqx66GGbkfxjHYp8upfc6H9b9
         rAOeCrD+Ga/mwyhHT9CZUQaMI0K80tY8htfAE0m96bEFL1yrzuJY4v6Zu+bR0sVtD8o5
         bpxwhT8qloyPAsC1hIhVZpRH0PWaU02rgdhR9uVGr7/q/M9woOn8DuwIcxVddBMnflH3
         W/Hw==
X-Forwarded-Encrypted: i=1; AHgh+RoDqKwAp5ta4DONxeTGj/m2MFG5sbYtREOaj4xeuK/scTYcAr0E2HIU3Wz86paNPs7wCfUb8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwDB4tLguoX4B0p/dzVnWY0Y8OU6b++Lf+VAvlljT2Ok8Eb7rp
	TRs7vzNNeh7ObSRawRdEJ0GKUbDhwjdDnaAUYuGUK+iBPM3s0aRrRvS7
X-Gm-Gg: AfdE7cm1OPUpnce7mX7rCMDBzS6pt3GShpxaokyOOywn7mFiZxjgUO9UfwyEXPyBGe2
	jH0w/IE7/jed2n5wu4hpaXhHHeaK4xCRg+RNg7wNA8dxW2QJuIX8B0e6fQ+cjaNAe1MfQaF8m/m
	6/oQ7x6tDTu2woKXUCFSFkjAm30dVCJywSX7P5BjeUcfD7UL8I+TWMyR2apFXNLFMb6c8ZK7C8W
	rI17q16wDEP3yVhppGVN5cf1fGmK2+8jVIlMLGe/R5uknVQMS4h/R5pU0QwOu5ojPO9bAk3uvqP
	9/Ura3dEPLxLCTHPpxOMM1bPlOlAuMeTIpM/bV6gsZxeY5ie5QdDh8FqSlXskoSGZpRXaUzI2YC
	z4c93iAXcQud1cYEqm1uXPb81vvdrCV+f032x47qDP3QE8wJBAyUyEiOaNwjZh5uGwW+iip8WKi
	Kn8rQ5Qd8/3RC9Lf0P7TUKcKar9g==
X-Received: by 2002:a05:6a00:2d8b:b0:847:770f:da4c with SMTP id d2e1a72fcca58-84a672425fdmr2861024b3a.16.1784133346501;
        Wed, 15 Jul 2026 09:35:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f238b21sm3470359b3a.7.2026.07.15.09.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:35:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 15 Jul 2026 09:35:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 06/10] dt-bindings: watchdog: apple,wdt: Add t6030 and
 t6031 compatibles
Message-ID: <990ec316-5050-4e7b-93f4-b5a2a85ef447@roeck-us.net>
References: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
 <20260715-apple-t603x-initial-devices-v2-6-df65b2485710@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-apple-t603x-initial-devices-v2-6-df65b2485710@jannau.net>

Hi,

On Wed, Jul 15, 2026 at 11:11:53AM +0200, Janne Grunau wrote:
> The watchdog on Apple silicon M3 Pro, Max and Ultra SoCs is compatible
> with the t8103 (M1) one. Add "apple,t6030-wdt" for M3 Pro and
> "apple,t6031-wdt" for M3 Max and Ultra as per-SoC compatibles.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Janne Grunau <j@jannau.net>

This patch didn't trigger any conflicts against watchdog-next,
so I applied it directly.

Guenter

> ---
>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> index 845b5e8b5abc..bef8255022fa 100644
> --- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> @@ -18,6 +18,8 @@ properties:
>        - items:
>            - enum:
>                - apple,t6020-wdt
> +              - apple,t6030-wdt
> +              - apple,t6031-wdt
>                - apple,t8122-wdt
>            - const: apple,t8103-wdt
>        - items:
