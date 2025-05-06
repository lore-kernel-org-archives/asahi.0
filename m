Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D6D22B8A6
	for <asahi@lists.linux.dev>; Tue,  6 May 2025 08:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746518836; cv=none; b=gQzxkRUofjSBmkVwIUwJMYp8dRdWF3uen4UBiI0g9iVQGiCH/AOosDuGIYnX8l5YjQoEsNlpRtX/9KZ7MFrXp2CwTXlH3ZHxDul6PfVfOin7JniPa92guAOR1Fvcb335Z+rMGt8HVAvtoOtViLc5cqu8birKBQNWg7Eh37/sSRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746518836; c=relaxed/simple;
	bh=/i/S7NDpaV/eqwKPT4Y4crlS4XLw5APJiQbbcfUmI+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFYTpjdvKJEVi1Z6CbvOM2M75Fs7tcpSydIBlk2AVjc8uT64Hxj6SkNicQs/OVcMRUIAxN/w65Rc3dZ8ZF/u51iDn5PPSOLqWm+LY6vjKiFDoWLcHgTvt9nqXyEgGdPbs0v3cRJiezkDEKz8gO8nN/De8b6KxJH6+IoOx4bCi00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ajsurnl8; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ajsurnl8"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54af20849bbso6135524e87.0
        for <asahi@lists.linux.dev>; Tue, 06 May 2025 01:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746518832; x=1747123632; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWjI1WdrW4fw1LjYjyn2MNuK0dU9SDM3EHaXeQ0QWpk=;
        b=Ajsurnl88SsRJeNckEG1LtetgKGxTfTXgFAqL4ZT7RWSmX9Q8PeeTlUxNKto7flvF3
         zgTi9wdSD9/m9aYDsQPZAQTjII2xf12mg2V/epOgbFvi/ieoV+NFnG+596auO3sbI3rk
         9F8fWUVMYJYW3dS16a6enFThJtVyMHWhq1RMsc9ZrqH7bbLlwq8fgndVzMWnYYUQpIwU
         bXzMfEiugQHZQNGzmxUV5DBlAHv+CbkSk3hQLA6NFaHJrqmwk53YWpsah32pBhYvL2Dp
         CNAOaJBuzUyQ0I5FtXLxtR2N8wg/KewDNrWGPt7yLDx4g6sKiBIqAe6Ia3X7WExAs3LO
         vlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746518832; x=1747123632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWjI1WdrW4fw1LjYjyn2MNuK0dU9SDM3EHaXeQ0QWpk=;
        b=t0z/EaEBgB5VsVY2hcC6yb+qsBdPteNOp3AOvsldLWO73T9N5Nak995ljkUIg0KdQW
         BVTIDkC7u+fOjp2mF6Zkb3NUMomEw+BJcTT52/IQfzQ7nG5vnhHLvYntjL4NvlMrLog8
         fA97YKqiiShFKaSUeFgtodqk0ieFE095QLzqf+EUC58zUIc9AV28Gm3DYvAfeSRpRrQr
         ZP6D6grgxeuQ/Ra+yu4kcs7roSLnwh7203w2B/Bg5bnWnBVWrOS1lXa6Qa3/Fdj0H0L4
         AKFtTKlxQ6pzrGvtVPg9hzVA6t3tQcVK+NMM+KQ7i73Lrnh7lLJgxWitJKJ/OfrfR0US
         dGjg==
X-Forwarded-Encrypted: i=1; AJvYcCW8ANB92X+9JbqUDriwiWmHnDF1xLG/n+o9ioHw2XROHMa9ccwDtHjqpe0TebC6gzxOZtOHkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyRqDo+2n6esIGPO8rlX0b247NYn/ljWVr8C9lkw2YtpdswOrw
	gXxNfqOraYcmOG4/F8p/ueyd0ugosAEAd2XlnTDGM6rn/ILbwpj5gPBphLMoCL85BCLqIX59Bex
	kwMAj0moQ7mrPi2Zomye9NXtlGpozHzrEU0jzNw==
X-Gm-Gg: ASbGncsVi9P190u0K0LcSN97uNoDenAg402wNAI0G1XRbe7Xcqc4hyNPVBV1Gw6Rivo
	/0cQs8zN/a55ELf4cBWYUsr7wx0eZhchNyHH3QjcKqc72xHO5RTt5+1tGAYrtczLMB1jEZmCx8I
	/NKensGZLRGTGdquse6zj8S9l5G9gTXrXZ0SoAC5J/y+9tm8ZzjhJHfA==
X-Google-Smtp-Source: AGHT+IHqoCICO9862R9K2Lm84ouPAwINr3VP7krJifWUL5WSBoQ4Kvr33P34RfQvhWkjHIDMgMqYGqtI1g5tPyBwgtk=
X-Received: by 2002:a05:6512:1048:b0:545:aa5:d44f with SMTP id
 2adb3069b0e04-54fb4a14406mr712084e87.30.1746518831752; Tue, 06 May 2025
 01:07:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250503-smc-6-15-v4-0-500b9b6546fc@svenpeter.dev> <20250503-smc-6-15-v4-5-500b9b6546fc@svenpeter.dev>
In-Reply-To: <20250503-smc-6-15-v4-5-500b9b6546fc@svenpeter.dev>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 6 May 2025 10:07:00 +0200
X-Gm-Features: ATxdqUE_9uM4g2e9vDQcwVZ74pJhDseN0shdJbJ2G8cWvYqvkY72EGPX5Nyfbec
Message-ID: <CAMRc=MebFf-DBh_=H0J4ORStaxBYhOnfY+jSk2d4UpdyS=m1LA@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] gpio: Add new gpio-macsmc driver for Apple Macs
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 3, 2025 at 12:07=E2=80=AFPM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> This driver implements the GPIO service on top of the SMC framework
> on Apple Mac machines. In particular, these are the GPIOs present in the
> PMU IC which are used to control power to certain on-board devices.
>
> Although the underlying hardware supports various pin config settings
> (input/output, open drain, etc.), this driver does not implement that
> functionality and leaves it up to the firmware to configure things
> properly. We also don't yet support interrupts/events. This is
> sufficient for device power control, which is the only thing we need to
> support at this point. More features will be implemented when needed.
>
> To our knowledge, only Apple Silicon Macs implement this SMC feature.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---

[snip]

> +
> +       smcgp->gc.label =3D "macsmc-pmu-gpio";
> +       smcgp->gc.owner =3D THIS_MODULE;
> +       smcgp->gc.get =3D macsmc_gpio_get;
> +       smcgp->gc.set =3D macsmc_gpio_set;

I must have given my Reviewed-by under this driver before we started
the conversion to the new GPIO driver setters. Could you please
replace this with set_rv() as the old set() is now deprecated?

> +       smcgp->gc.get_direction =3D macsmc_gpio_get_direction;
> +       smcgp->gc.init_valid_mask =3D macsmc_gpio_init_valid_mask;
> +       smcgp->gc.can_sleep =3D true;
> +       smcgp->gc.ngpio =3D MAX_GPIO;
> +       smcgp->gc.base =3D -1;
> +       smcgp->gc.parent =3D &pdev->dev;
> +

Bart
