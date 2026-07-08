Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2493FF1C5
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519221; cv=none; b=MxnG3AojGD/VI5kztif1pTdffHuXvmHgApkrKsXWH18fM078CEMOyWW+aTu98bYrkcuGUKc5ul3jIY4n5RMp3wwgbtwlonbl2wmupXaEdhHLr+HC1VZ3wv6FsMcsxpKjO5vLUhc5BsTfCJtReupNFm1wqZOyiFAlrJpX8m5w0fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519221; c=relaxed/simple;
	bh=+v9vy7krakGFeXF6TzAUAnw0/rePpUUz3AXWVtluiys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9BJNeCwaqmlP2QKKezVlezUFlCqk24H+WHS4TF+zufAzqP8PHEw2gnAy5xY2pVNs8oe1xZh9iP04xe4uqwIstyWCWaJbdMd9tZbYeciaMuSwTb0O55qzRBg3uBq/5Bwm3f6Yq2P8+aTZmP6eLbjESSDMsP6i4Tgj1wqlYvq74I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wp2hbQHN; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wp2hbQHN"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381507c9380so549437a91.0
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 07:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783519219; x=1784124019; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MXKeSE96P/DSTkSX0hfZLI8OogkntC/gTUwapWrQ2Q8=;
        b=Wp2hbQHNrEmS22sCyVIH4GY6FHgi5s8wXlNCdjO/bXNwIForVTNpTWBRUN1dKWkJcO
         x/6RVQvlXzoLkyDKrxwTIdR9MlIUc4MuL2ddAYUSy4tv1AFqkhmVqiqGxoJxTKeN1x3b
         zprvGwPAiEvybnKiUE8V5t/tW216i7FJlhmgmolawXdv/JbGBX0EbTZQu3pv1H9W+eAp
         JpzHk+/immgVgl6vFaPOKFvI68oKFvPDTTeZ3n7tOoP+i1/7mvlkerxDpcrb2EpZDZky
         JB3OqvE2fO+E4gWDSuIzYSH9Gg+5GokQHDpyd4S8L4hztBfVopLO2ytrfUdwPllFkUvp
         AD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783519219; x=1784124019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MXKeSE96P/DSTkSX0hfZLI8OogkntC/gTUwapWrQ2Q8=;
        b=TmvmYN9MmM+HlTnfK1n070sPWalaHRAdlVM37+sqHONHqgFUktp7EkdWKcy3Hv9q6/
         Xo1CrOtZBe0ODsW8U8U9vM0amC1uIOsdfAwLKoEMORMmfXyM0nKPItJ7Qgk7as3iE6TJ
         eaBwhrqbfLqxERNRuY34Tb0spc9OhsVPpabzOw9a18fv35wHflVXY70/JvxfoNxARaB/
         qsQdQynKvQ/sk0/iYC8oo9LpzvNpjY5bPi9WgVzgVAqselRqK0yma5ZFjw6/iasptJw1
         4tYMveyTsZt2H+LD1cGTDcwvkDAhDQiOzqUDwkQzQftsKoK5pJNcsluVuynnlzy1QGW0
         uy9w==
X-Forwarded-Encrypted: i=1; AHgh+RoVK9QS8JdbbtGaZ26O+AJBn4bnU6nCLEAIGr+dxZ+3wnrjb8hsWYKdg4UellH6XaItOxEfsg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyljus/bRLvFSCYVSSNSThi6v0uTYaplnB/fEKSHgr3DRocNRpz
	Xvvc4/uNnGL69Woq1SMuIcoEQIEyTTg7JWVhstRBc1Gw8SKSg9/6WGWL
X-Gm-Gg: AfdE7ckS52MXxzZ+2MQHoTtfwu1/JTq8rXF4oskOu0OTS4l3w7ciAPJqOUYW1ZzYgMt
	qHH4hs3kEOG/5cswCARR8w7CaDpcfu39QYxAa4L/g++zQ3kKXO0waj4DzpDkKd18lfapdSMvbBD
	VB5hRlXZG08n8/Zq4NwzpHd5J6YG8NUgHeUrHFwfycEaTC5qCY/5oMXL+UZl7wqbxCugwOXr//A
	VYsSAAmZJHDSD1MqpVCGYYzBHVAnk2afQkOFb3z1OuX2mBjAcexGltntvvIhfkwHFjHPkx2eaol
	so/E3OVGFWi9/dYvGq49yNUbZKN5r5Emzo71QkpZSlBWgE+PfldVDbtsK+JkvGNLWMmUeJd60zN
	HLSldmpYpSJANCu/PtgOiqnn+UcvFQZDUxdxBeLW6SgyN8HLZ0IVaTRTq4uXsbmIBLE2FR0i9pe
	vgnJ0SHvdELKyWQ5A/jGrc4D2KRQ==
X-Received: by 2002:a17:90b:3512:b0:37f:ec5e:12d9 with SMTP id 98e67ed59e1d1-3894034404bmr2572315a91.16.1783519218978;
        Wed, 08 Jul 2026 07:00:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-388fdc9a066sm569937a91.1.2026.07.08.07.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:00:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 8 Jul 2026 07:00:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Hector Martin <marcan@marcan.st>, Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH 03/10] dt-bindings: watchdog: apple,wdt: Add t8132
 compatible
Message-ID: <a03c19ee-cf74-4f26-826d-f2bfb816fb3f@roeck-us.net>
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
 <20260705-apple-m4-initial-devicetrees-v1-3-e5655ee56523@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-apple-m4-initial-devicetrees-v1-3-e5655ee56523@cyberchaos.dev>

On Sun, Jul 05, 2026 at 03:17:22PM +0200, Yureka Lilian wrote:
> The watchdog on the Apple silicon t8132 (M4) SoC is compatible with the
> existing driver. Add "apple,t8132-wdt" as SoC specific compatible under
> "apple,t8103-wdt" used by the driver.
> 
> The M4 wdt block additionally has a secondary watchdog, which is
> disabled by m1n1 and can safely be ignored by Linux.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
