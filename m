Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACED287250
	for <asahi@lists.linux.dev>; Thu, 28 Aug 2025 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756414777; cv=none; b=T23U98C858bU8eCG1xNUGAGJvParpSTsE+ycbJHr7OCffWG8S21pQyxiixNZLM0dFMFnibbKFYdriFxcv5+NIRAjyejdY3qRG3LqP6Llc9ozDNT0xf2flgkQV5trxLAeWWF9f2jJo5snR8YtOezlhtWOA+B8wQNLcsHg6Pk/yqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756414777; c=relaxed/simple;
	bh=nhUyagpznBFRZ9pdGyujL8snMtRV7AxzIDv/2iWCkkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNsZUXYhuihbAsaWTWI7ubEIOXG6hBgH7qtrtaD4Tm5MuBkFb15Cv8VV5uJWGxobzFugNTzq/ZtgUHi3UdN8j5bJoxHnSDpA+YkgtV75DEXCUcPk8o0LP++sUg1qUIJTPoeJq9G7eBsYDOr8KZIcTSMFFi0ZbdK4I4Z20ZbZACI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eH0TahKp; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eH0TahKp"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f646b1db8so947468e87.0
        for <asahi@lists.linux.dev>; Thu, 28 Aug 2025 13:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756414773; x=1757019573; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhUyagpznBFRZ9pdGyujL8snMtRV7AxzIDv/2iWCkkM=;
        b=eH0TahKptjB5T6yv59r5xvtqQhz0ZVXl8x7aqrJA/CrKzbauxO4urpyTs2cFcRvHD8
         S2w9SjmxQLJo4ArUYKqrL9QX7kpMVsoY7fAowH6gMxFp4t4YyfvBrrfp5iHvLmQe3U/y
         SyVGvlvjh6wWpxNZvX/qwPYIKwvp0jAjDLqeSXkpsygJuPROBAwLHzfEsUtiTlpTnqS1
         uAZqGY+s6v5BDV15fU3+xg2WZ5+Oz2BwIOVGXZXBUQoPVB7fXixrAd3Nu254ogkF5kD5
         qkM8eyTtBBMNNjr27fNVy4ejQLSK1y/kMioU6N5hdmGbRcdbXGzYMqlMoELp5a2LPhqi
         Jyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756414773; x=1757019573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhUyagpznBFRZ9pdGyujL8snMtRV7AxzIDv/2iWCkkM=;
        b=A4nVWOFsGlofsm58PN8uTeZMEjgEXORGfQmk9pxSO1pSyFUCqtJ2qI0fVQ3JMDUDat
         BnDrkeq/mqjVmrxnS8QZ9AO3cxUmBoWft3bKLXoH+ay1bMa+n+tUnsKT6RKejZBugZtS
         oXhGamAFsoPJKvfrAQznvX/fL8ewDfbRT+qxalNfVmn51vCvc0v0h7NQh3azcj8K2ZnB
         8QQFqXgKBdZftEATM9ngHJTMO0x1mnQ0JxKyDa62ztGlTZyERyDh2aAbe4LEhQ16sWgo
         h4mo9xnb7B5gq4urrXKDJJcCXOwd4WVbmJrFrpCsrKy6fSAsh6ZXne4JuB/npYFimr/j
         wdtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZO4/nwiVUEPCZix8HktOQvVBqewYZoHkDKwNQWkFPsAwt/9agkVWhfKiSj6eNV0HlPlywGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTEvJjAaJJTiU+fMzdcQd/4bFS/Knn/SUjvqKXh175MK2TsGn1
	bMhwVJ5of7jhku/Y9hlNLoVPN9tbKhuM7mZj5G6w7R+25Hlx0iFOPL4EJudsdS5eq4x3CPm9ptP
	2KyolP2bC4F91/hEx3kiOR3jdU3WVss/FMsNGFIkivw==
X-Gm-Gg: ASbGncsXql1jt4RhOqv2v8Pr5U/uXFSJAuLqHJVjYvyyfj8fb9ANOGK67xVTOmqZE2r
	nS5OYWrZITxneMTT7MACcm8Hg50f+DMCwn+xFGNh5DtrQe2IR/MLh8p8/2PoYWQra0zqdDCxYST
	y2XbTT3cMQtS24L0fhk7dfSZu5bRn2FIYzYDQt4FnVUV1vhOHhFUyxqZN7WUbErA9uEqC9fR5qT
	D4z9r4=
X-Google-Smtp-Source: AGHT+IGkAeRfSepttrAWspST3WxeFhzvmsQkOJn8zGWgyydoFU7mfe7dFpmDKHnPoU/jmN1MyfkA6699WvyfKPSV4Ms=
X-Received: by 2002:a05:6512:6301:b0:55f:503c:d322 with SMTP id
 2adb3069b0e04-55f503cd585mr2344975e87.40.1756414773211; Thu, 28 Aug 2025
 13:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net> <20250828-dt-apple-t6020-v1-8-507ba4c4b98e@jannau.net>
In-Reply-To: <20250828-dt-apple-t6020-v1-8-507ba4c4b98e@jannau.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 22:59:22 +0200
X-Gm-Features: Ac12FXwdi56r5WxKQlnuWh0e5CWqxbReZCdYkWbkMywpfjpFF5zgYMlMEAzYzgg
Message-ID: <CACRpkdbvLhTQ8EujGg9QMbuGVRDnH9ApVxVt1NdmSmPw77QXdA@mail.gmail.com>
Subject: Re: [PATCH 08/37] pinctrl: apple: Add "apple,t8103-pinctrl" as compatible
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Johannes Berg <johannes@sipsolutions.net>, 
	van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Keith Busch <kbusch@kernel.org>, 
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 28, 2025 at 4:02=E2=80=AFPM Janne Grunau <j@jannau.net> wrote:

> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,pinctrl" anymore [1]. Use
> "apple,t8103-pinctrl" as fallback compatible as it is the SoC the driver
> and bindings were written for.
>
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@k=
ernel.org/
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
