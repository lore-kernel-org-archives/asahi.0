Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2972101F2
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739580003; cv=none; b=o/U0Eg6Zi58P1EMNmyDzi+yaqdAXSC51rJqURh1a4KRU6vDWbjXoPkuBqEiWL3/KNBYk7eq/1/JnAhdT4194L+FIlOAAF+8/lHC08+XW5lpCXpGXRylCXqrr7C9aRmY5ECSbvPn971LBQtKmvTMn7aa2zBA5K4DEPHw1Yn4en0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739580003; c=relaxed/simple;
	bh=0lb+XuejwQ6WJ/rlS82FD9QDxDHkpczO99KyIdSRZVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9nn76HOqAJSvsE3IUvA18hsol9tVPR3YGPp2FU3fNTrAhjtHTvbNItA0zCKrZnMhHslX7mHsUvAbhgqUWLPCl6q3rHDIV+l59b8QQnlT7WJxpnsB5hSU9atRkGAHIzWdzy+qZgQG2XWccfeKghyV8C1OW/9wUigE5SPq3JckzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7cc0c1a37so485750066b.0
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:40:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739579999; x=1740184799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3luXOCFKIPpMmtbHHxucGGaojmh3uFOnTbaxnuKr2fo=;
        b=Cq4UmsNogwoHv79rL2rBEwIYvNJCK0Q2tpY/SwADmjohZVkW2VyNIQ95X1MOakgLfG
         YxWngAh/Rkq4cfVrQQkouMrxlJGgPvnvVBoxNx1qd8ehpN/NgYYjO07MtJXyEqKkuLHc
         sb4/cipZ1G3e0V3MYK8zvcLk+7fMf1sMqbPDX2w329kKu4eG/X0gN9kMiVyGnlaQHLKZ
         hd6N/yVGDMmVVu0kB7zwNjo/6VZNL+eysTC1oM8PmYWXieFUEqaoBni9ddSyq+2BNWzN
         36+cVsT4JbDF2AdkIhWn0q6cEPDxxv+h7aaF8zaS96FgIM/azm7LQwH0a5UuNFztKMdB
         KV4w==
X-Forwarded-Encrypted: i=1; AJvYcCVUoTJUbrfW9lU32VsUAXghaWWhZqnSM6LXnAC+G6YAmgp/nKM/chIN80khJqcQGGKUzX8ojw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxj694g8I3j9SM+k5ahEXs+qwE2GeoV779l+Ww2oRe8KDdaKNtO
	4wBvV4qX9GB9YBmPDi94HDIdyOSQVxWrIgqlwCwg+7aClxqgmi28pQ3ESuSDxIw=
X-Gm-Gg: ASbGncu7mLdY/zthAr15xlV8NuzBQnnzTeNXY6ydZs/nfsr57a1gYmhYdfN2mOqBz9o
	MNI6cVoMuhEJ7NPvJP2ZPKd78/HHW8oTS5RUMmWZGGOETOsrIHTJ6ERAVCwlh1LrztdNDa/S9un
	7Q9qKDLCvtKdEtxRxK5Mny6O+35TAYmn2idDCqNQV6FVbLa+3lPRK8E3Na4mje3UbKTBC62i689
	HnSoJCVsrl51/cr+QUrNk0kdxDpCLtXhemsX3xlCniUMTnLtY0Arld/CbEsFzoO5TgigRIN49jP
	xBbu67Dnbj17PMAQ2PGn8zqU0PL9cjoJRqa8qBSCy4E9hw==
X-Google-Smtp-Source: AGHT+IEbpskB1jG7eJUyamRb7jIPynfMAnpbkbnfS/EYqv7Kag6chdXfpWd+aUsEO36y+RG0tonIqA==
X-Received: by 2002:a17:906:31d6:b0:ab7:e943:4c1 with SMTP id a640c23a62f3a-abb7091ab36mr94516966b.11.1739579999175;
        Fri, 14 Feb 2025 16:39:59 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb72b519c5sm40668166b.173.2025.02.14.16.39.57
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2025 16:39:58 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5de3c29ebaeso3359334a12.3
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:39:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW87Flk5aKwuUFViRIwcjWQhNP8TVQr94zjwVOC1peuVyzrxwqNCb9hpq7BXXfJ/gCP7kn7kQ==@lists.linux.dev
X-Received: by 2002:a17:906:3118:b0:ab2:faed:f180 with SMTP id
 a640c23a62f3a-abb70b81377mr107070966b.33.1739579997503; Fri, 14 Feb 2025
 16:39:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
In-Reply-To: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 14 Feb 2025 19:39:21 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9az=jLZSLg+4V0XYFzaxW02827+koSBkDd=RoUaiTFFA@mail.gmail.com>
X-Gm-Features: AWEUYZkDDgpalGANAbSSWSDtuS7jiEiBkOjRIsOJW9cVI5i9ylu35HYX48Q62mU
Message-ID: <CAEg-Je9az=jLZSLg+4V0XYFzaxW02827+koSBkDd=RoUaiTFFA@mail.gmail.com>
Subject: Re: [PATCH 00/27] ASoC: tas27{64,70}: improve support for Apple codec variants
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shi Fu <shifu0704@thundersoft.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev, =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 14, 2025 at 7:04=E2=80=AFPM James Calligeros
<jcalligeros99@gmail.com> wrote:
>
> Hi all,
>
> This series introduces a number of changes to the drivers for
> the Texas Instruments TAS2764 and TAS2770 amplifiers in order to
> introduce (and improve in the case of TAS2770) support for the
> variants of these amps found in Apple Silicon Macs.
>
> Apple's variant of TAS2764 is known as SN012776, and as always with
> Apple is a subtly incompatible variant with a number of quirks. It
> is not publicly available. The TAS2770 variant is known as TAS5770L,
> and does not require incompatible handling.
>
> Much as with the Cirrus codec patches, I do not
> expect that we will get any official acknowledgement that these parts
> exist from TI, however I would be delighted to be proven wrong.
>
> This series has been living in the downstream Asahi kernel tree[1]
> for over two years, and has been tested by many thousands of users
> by this point[2].
>
> Regards,
> James
>
> [1] https://github.com/AsahiLinux/linux/tree/asahi-wip
> [2] https://stats.asahilinux.org/
>
> ---
> Hector Martin (14):
>       ASoC: tas2764: Enable main IRQs
>       ASoC: tas2764: Power up/down amp on mute ops
>       ASoC: tas2764: Add SDZ regulator
>       ASoC: tas2764: Add reg defaults for TAS2764_INT_CLK_CFG
>       ASoC: tas2764: Mark SW_RESET as volatile
>       ASoC: tas2764: Fix power control mask
>       ASoC: tas2764: Wait for ramp-down after shutdown
>       ASoC: tas2770: Add SDZ regulator
>       ASoC: tas2770: Power cycle amp on ISENSE/VSENSE change
>       ASoC: tas2770: Add zero-fill and pull-down controls
>       ASoC: tas2770: Support setting the PDM TX slot
>       ASoC: tas2770: Fix volume scale
>       ASoC: tas2764: Set the SDOUT polarity correctly
>       ASoC: tas2770: Set the SDOUT polarity correctly
>
> James Calligeros (2):
>       ASoC: dt-bindings: tas27xx: add compatible for SN012776
>       ASoC: dt-bindings: tas2770: add compatible for TAS5770L
>
> Martin Povi=C5=A1er (11):
>       ASoC: tas2764: Extend driver to SN012776
>       ASoC: tas2764: Add control concerning overcurrent events
>       ASoC: tas2770: Factor out set_ivsense_slots
>       ASoC: tas2770: Fix and redo I/V sense TDM slot setting logic
>       ASoC: tas2764: Reinit cache on part reset
>       ASoC: tas2764: Configure zeroing of SDOUT slots
>       ASoC: tas2764: Apply Apple quirks
>       ASoC: tas2764: Raise regmap range maximum
>       ASoC: tas2770: Export 'die_temp' to sysfs
>       ASoC: tas2764: Export 'die_temp' to sysfs
>       ASoC: tas2764: Crop SDOUT zero-out mask based on BCLK ratio
>
>  .../bindings/sound/ti,tas2770.yaml       |   1 +
>  .../bindings/sound/ti,tas27xx.yaml       |   1 +
>  sound/soc/codecs/Kconfig                 |   1 +
>  sound/soc/codecs/tas2764-quirks.h        | 188 +++++++++++++++
>  sound/soc/codecs/tas2764.c               | 302 +++++++++++++++++++++----
>  sound/soc/codecs/tas2764.h               |  29 ++-
>  sound/soc/codecs/tas2770.c               | 264 +++++++++++++++++----
>  sound/soc/codecs/tas2770.h               |  20 ++
>  8 files changed, 711 insertions(+), 95 deletions(-)
> ---
> base-commit: cc7708ae5e2aab296203fcec774695fc9d995f48
> change-id: 20250214-apple-codec-changes-6e656dc1e24d
>
> Best regards,
> --
> James Calligeros <jcalligeros99@gmail.com>
>
>

After years of iterations, I think this series looks good to me. :)

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
