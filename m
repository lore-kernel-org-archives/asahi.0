Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7B119F13C
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 10:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678270; cv=none; b=esmO0sPCWPrglFT6A9iKsDQ7IdNXBwVSQaldL2Fnh0AWq9PimiuIhylq8V4XkaSWqAVUoMTS8EyBklxA2dGYIQFN+sThr3apBH76T3gsdwcIYqUZIyMSo2fg37sV7BCyecFLtMUMziHdjV2EYYl8LoA3aZFGYPmeJD1u5TFMk/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678270; c=relaxed/simple;
	bh=5OOvHNGAVgHImRA4rtLY0Acms6nJmTWGumvJk2gBIAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J0qKeNKAs7MzOl3mHK0Fxd1BIUNJS/j6kPHYR9ULsC0ikIbhwXLC8YU492HuoiO9mgsgHEMCVbQuOl+25AxFczmlC6wJNRgZSD8evukZVqmEypgFeyYcSjSXXmjBa/VdL0ryIpGTfHC8r9eOChk1sS6LtMEfVPImMTDDjcIbWZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xVvpJ9at; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xVvpJ9at"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f1292a9bso8069602e87.2
        for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 03:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729678266; x=1730283066; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OOvHNGAVgHImRA4rtLY0Acms6nJmTWGumvJk2gBIAw=;
        b=xVvpJ9atjDSLKxEg0YibQwsfa49UGtvqPhT+qosxkYbiyfBmxHMsIUdmfpIK7WTrpm
         X8G25wFTpfBO13l9jncXt8+Fb49euhx8/0ZJevkigRgUB7GVcuSI7EGx77Nc0GgVCbdL
         kUlbPXiIzUEAzO/MUQ7r363H83e7BYlPazftyjxrPUH2EJX6W8K9ZS6fV8ShOOhSKwB6
         fGaBAOzIdRjEy6ObdzaDuWjfkKr48W9qQYerAiaFregpByQZtSnzUkItlFtlRcN/lca8
         8KEjCOuZwyPm8s/Q42SoQfK+EW9VezC0/SEz/HDWtgDjuWooywlwUJrgjboaEcoZDkQ6
         Nc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729678266; x=1730283066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OOvHNGAVgHImRA4rtLY0Acms6nJmTWGumvJk2gBIAw=;
        b=aITDkSyFvePs842PhuL/gO0qyqDFMnghPajjGao/xzVP+3WVFWFkK2dRJVdGKw/1iJ
         i43rrnL6Nc70655Guetyp8py3bSFHtLrf/nEJEmNKTbsPdgwzJXOZeiI+P0GeeX4c0AQ
         CFOZBmfGHOWG/dLNPK6ltIuIv2DnsvWE1vT087uzAP7kHa657FjSibaBfYJsY/PKL8z0
         8/7qf1X9GumyfF3boq2vTmFYW3yof7LiR2cQNUxPm/qcsbHJGrnoRxJ6HA+8FIGCfwe9
         JEjN4pCN+q9ZdL4pflLdbJ0v5MACIzXG/Yg3mxSq4pxjUlQXHgbm4Z8hApTH5j1VW4gh
         ESjg==
X-Forwarded-Encrypted: i=1; AJvYcCVDpfB1qzFm39MdyQ6LRtBbZNhWmiQGf7ziIYSI15OGvR607jkvrAaCjHjPCx5eITRTeE+R7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbnqlNVEjeSjH6x1Yxc8ieKJoDsoC0Dg+eo+v8LyI/VIdWqmAK
	23hi/F2Hffw6ovV6+oSOVJb0X2ZyY0qZwmyTqsoqSGlnYZK6o6raQDwWECpMemNWiFx2lpHNzsZ
	B/USLkG6J5IGhhu04ao04ozrTgzLAr22Wr7JzZg==
X-Google-Smtp-Source: AGHT+IE089tWVwoXd/8Hysqc4S/uDg7EGVHjVvwgua3xypehCFmJa3XmQQ+EwelSROlylF6cOjc2uO3oYJn05SS9GVs=
X-Received: by 2002:a05:6512:1114:b0:539:fde9:4bbe with SMTP id
 2adb3069b0e04-53b1a30512fmr994214e87.20.1729678266366; Wed, 23 Oct 2024
 03:11:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241023044423.18294-1-towinchenmi@gmail.com> <CACRpkdZP9oDd+fRKKagFtGbfLx=Rk5LJ7bvaKimw5-t25XZAfQ@mail.gmail.com>
 <5e1b807f-82ac-4ab8-867c-32b2bf2a91ce@gmail.com>
In-Reply-To: <5e1b807f-82ac-4ab8-867c-32b2bf2a91ce@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Oct 2024 12:10:55 +0200
Message-ID: <CACRpkdYjmwHaHPTmjOKR8E9kYQBZAx04Ydby7HKZzE3KhbNh2A@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 00/20] Initial device trees for A7-A11 based
 Apple devices
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 11:37=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> =
wrote:
> On 23/10/2024 17:05, Linus Walleij wrote:
> > On Wed, Oct 23, 2024 at 6:44=E2=80=AFAM Nick Chan <towinchenmi@gmail.co=
m> wrote:
> >
> >> This series adds device trees for all A7-A11 SoC based iPhones, iPads,
> >> iPod touches and Apple TVs.
> >
> > This is a good and important series. FWIW:
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Are patches not getting applied since you resend them?
>
> This series along with the watchdog reset delay series mentioned in the
> cover letter have not been applied.

It seems to me that the watchdog series is only a runtime dependency
and these binding+DTS patches are well ripe for merge.

I suspect the three Asahi-affiliated maintainers are too busy with their
own stuff (like M3 support...) to respond or queue patches as they haven't
responded to the patch set for the two months it's been floating. (OK
Sven Peter did respond to some v1 patches.)

If nothing happens in a week or so, I suggest you just send a pull request
to the SoC tree (soc@kernel.org) yourself. Perhaps you should even be added=
 as
comaintainer for the ARM/APPLE machine support so things do not
stack up like this?

Yours,
Linus Walleij
