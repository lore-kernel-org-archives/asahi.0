Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF77F9CB
	for <asahi@lists.linux.dev>; Wed, 18 Jun 2025 12:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248559; cv=none; b=YgnG0gKddILgf8g8FWoQgAmbs8PkBUcJXlpKczmqQYKjogGBCnz5P+QjvmRKZjmOiYjYGwg6z1JccVpvDlOtVy0WOX132CYopMs3uncq4RGk5wCOAyUl0eBQHaCQhN0H5mvBKloqd1N0u4F0Tx52jNRWKffRvbFD6gN6IhIEZSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248559; c=relaxed/simple;
	bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nT24GRBYwwDV8Q84AvStm0impVXpVp1EL5ZWPafJN7S96OMBi1BK2zGzCE7EN/t+kcC4seCaJ35EtJKvOEZd66KDFu8XJ1boV9ES/HKsVKodTis574x/N4cJvJuDM4HAFZBDrqVRW2MjoHgB3uzIbrctZi/XvY1uVnrB00QRUtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hbewhQG0; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hbewhQG0"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5533a86a134so5901516e87.3
        for <asahi@lists.linux.dev>; Wed, 18 Jun 2025 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248554; x=1750853354; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=;
        b=hbewhQG039c5DhiaXZDJ+3zgifzkZVBHTyXDLMPmDABAsyjpX7RnBbckFQeO2GWaZu
         IMyXem/X1XTv0LSkSloVJeVe5vUS4shfPF98M/isyijMiQneo+AahNrODov6Un/t1i7D
         xJw21hHGurSW2Xy/Cequ66DbSBWcH3ecfg9rtDaWdMURUyJJR2GHaH+lTOy+6SMxFmIF
         6Ah1DJ/Dfs1pTKoCbvlqunSRCYxHQkatGnOj4I6F1R/HyOoi4O2xa2B2qhU/+rt3oFuX
         j3W8v6+WHyov+2fIOP74NEdfI8tzk07AwlkhdjuXf+hb24vZTWeDNusjG6s+JF6dhFPi
         q/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248554; x=1750853354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eus1GwfPuFQtn6OQ9v3rF0J21GjEHtkdFtWAPZQVNsA=;
        b=Z4/+RYfi3MfIqJqoN6qfwb7qTT5SQadbd9MHI90FM/e1dmCfxHUWMaZKrlICvdTWxm
         gK8hbgAIR0Vud0RdmF4MuaRLFRfSwqMXHgTHhBYoTY/BthBGvr9fNbzJmDeSs+WlJpSo
         oLslCENUAcrRZK3t25pWUJuuZ38BCvPLc5n6IkYGdgE00iYVgsuKC2T2ynVle2b83cxc
         7TyBgTyea1rpKCTmyhaZcZjKh9GzGVfsxf8k6BXCM+SCvSQ45Vij1Pd8gqTnHKP0wuBT
         9kuvfcqGQx7ca8Ac0qsTgTF0mStL2B+JaOL9r8UA1ez8HAdvDOphAsE7QQ9xOubb0jum
         0oFg==
X-Forwarded-Encrypted: i=1; AJvYcCVvua6hpLCDEuf7/4nuhQtvBNiLK8vkzr1hFxME7TLX3dg10JAZ8WpXKySqTsh4gi07BtpYjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtnP0thU7sZkbqNQid19K1Aw4i0rzFLFWfEi7/uCejzEZ3M+xW
	lSNnihwZgrYEFLjNOUc2pMHpI5mBElYTpFVT408kJYow/CrcEiyFlheNbIs1REH8BQNa5F5KlhZ
	fkdMCoKgTl8mRcEFApcD/L6grhK2+WdwpV8eFC+gHpg==
X-Gm-Gg: ASbGnculVy2E26a3wAQmQ/RLVIGTF7yCCiTXCnGYXqzHsoruoCXz29seYYx6Q65ghG/
	flnY72HgZd3leJqMlNtU4uzAkGvbPT7TB4qVifE/BhV6xjV6vv5v0A65ebPtiy77teGXH3Dg6Dv
	BU6wQlQbq7lOEdzyrRoYzAJN8lkU8Iaekegqx6S9T571I=
X-Google-Smtp-Source: AGHT+IGC0m4FXYYQm+k0AXFCSy3bx6F7/2cTaiKhBBnuAbB+6N8ybTZnHZCukOOueaHxtyfLbUpPRBURy2oO4IVfhl0=
X-Received: by 2002:a19:5f17:0:b0:553:ca33:46f with SMTP id
 2adb3069b0e04-553ca330808mr1234493e87.29.1750248554215; Wed, 18 Jun 2025
 05:09:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
In-Reply-To: <20250612-gpiochip-set-rv-pinctrl-remaining-v1-0-556b0a530cd4@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:09:03 +0200
X-Gm-Features: AX0GCFtzAwHH-ht5UUznh81aEY-DCCdnUYFURG79_8pBHXv4vb2M7QItIyT5tQE
Message-ID: <CACRpkdb3+uQ=PG+ne48hyvdTFeEQBxXtq3CwxpqEmd1m9o9fNA@mail.gmail.com>
Subject: Re: [PATCH 00/16] pinctrl: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, 
	Support Opensource <support.opensource@diasemi.com>, Baruch Siach <baruch@tkos.co.il>, 
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Neal Gompa <neal@gompa.dev>, Viresh Kumar <vireshk@kernel.org>, 
	Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, soc@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 12, 2025 at 3:15=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> Commit 98ce1eb1fd87e ("gpiolib: introduce gpio_chip setters that return
> values") added new line setter callbacks to struct gpio_chip. They allow
> to indicate failures to callers. We're in the process of converting all
> GPIO controllers to using them before removing the old ones. This series
> converts remaining pinctrl drivers that still use old APIs.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Patches applied!

Yours,
Linus Walleij
