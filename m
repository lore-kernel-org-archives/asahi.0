Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D41A4206E
	for <asahi@lists.linux.dev>; Fri, 18 Oct 2024 12:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729253743; cv=none; b=L+6odjZtcr5ERi8LR0xfVSSMYSINb7i3v+2FBb/WFqcI45Hi4gtAtCmHUU7L8XtCYBaAkwD4K7Y6ORGj/clj+06B9ryfvQk7NPeRx1hl5/LhtbpDLuTYBWNiLOfMVMvCBuPorbKkCvIXtjK8MjMIhgyJnW08AivCpCV8Yv3zPhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729253743; c=relaxed/simple;
	bh=IE5eND4JS389Mg64lkLSdqShAg+vwI2qRCJ1rs2mbGU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhNJFiBkcMrrf+AArJSfMg214tb4SXkzQpNsllA3nHVE3ygYrkZIHq66fXE/ETc0jyYAbtnlzQmNI3ZMNCaqC8JqIbXEpduT9k4N5Deb9bt/MPEzJ5s9Z1bF58JKY96YAEpoKzeCZmYwnX6imbsvExllXxvKiI1kIXYWL3l9uhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1uYmdn1; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1uYmdn1"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4609c96b2e5so11002041cf.0
        for <asahi@lists.linux.dev>; Fri, 18 Oct 2024 05:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729253741; x=1729858541; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20pjU3e//rgq26Yi05Ys1N4I2o5U5qD7ybOOR7293q4=;
        b=L1uYmdn1QYfe7dxY1QNCfD4nskeZ/CSWxuHOpeO64/pSHWaAYJwV6pFjJhXXJMaiwr
         2xb4fWyz6kduQhpTHywo3h+QdZHzlwYfCBahEyh4K5N6tf/aaTb+fqqeoLQLWBPHVYeF
         M02vBFQnIA5gyrmk4YMANYcWExqRXG/TpVsmiRP/AaHO6gZTsfLC7WoOVKZKaD1WZcfs
         FLh7hisROebcT+9C8bwZrmZ2zSexfR3ztVyQIS3QDkF4h2KOVpD4m/goN9L5eqFt22EV
         x1J0nAneM/Z2IBkUByFmfglD29lkTKLXMqv2FstNdoozQXnOrTi5Ta98NahL3pz/Yuh9
         LLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729253741; x=1729858541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20pjU3e//rgq26Yi05Ys1N4I2o5U5qD7ybOOR7293q4=;
        b=AprEK7YBiyEIKout+K6DqDT3ro5tFIMtKnUPI1h7ogCKBc1k1HjRnZDvLCMfu7AIch
         xIlFkRlcusPTFlM4wjrAJ89Gzb66BkGfdRZaQyt/9oMJbCjRbuZdLZsxPACDktk/Fjgw
         tu/anVjtvaRGx2O2wHl0b53/rjbT8KavXbBDcX8iuLOZWGohyLISBVZdrFsjm4moQr6i
         lM9K6uO4wr5Wr/1pPS8TN92mKwczKS4b0st+rxnMWVvPa8ku9cHnhtA0a1PGs3KGWlFN
         YhfzpQQ8gmd8S33LkoPrVXs+V9TPKypk30dta13aIwS8Ro74aGokwt6Hw3chWaAQfyFZ
         D5JA==
X-Forwarded-Encrypted: i=1; AJvYcCV/WMxwb4dP2F3nwpkk0R8rKDzIRe1bjLxfYYSYkHVxpAV6SOya/gs4DyUsglosqeZ5limUAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxN2yICoo7dkrD5cgGeqZWhz0noJgZaTQL+/TBWyjdjWq98l3nd
	/Ai3dPho1XaLerVHG2fKu1MJJg5Lrax2LEL9iUdQOK/V6cxx+xb3OmDFmUgLLunBRCkv0GEx3tY
	0BLvirj2E54WLWbuaBTlhYJCvezI=
X-Google-Smtp-Source: AGHT+IHznlnIPkcD1o9NThG4Pn7268Gn9GiD6LokW8b2HqLdTDhxkp1K0M7XBv6+w0jbPY3BaPJt8cM+9Prcjg21UIk=
X-Received: by 2002:ac8:5a01:0:b0:45f:bca0:b8d2 with SMTP id
 d75a77b69052e-460aed53cfemr26349851cf.20.1729253741145; Fri, 18 Oct 2024
 05:15:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241016-cs42l84-v1-0-8d7e9d437d2d@gmail.com> <20241016-cs42l84-v1-2-8d7e9d437d2d@gmail.com>
 <abe88a18-28fb-40e5-8bd2-3fde5de9cb56@sirena.org.uk>
In-Reply-To: <abe88a18-28fb-40e5-8bd2-3fde5de9cb56@sirena.org.uk>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Fri, 18 Oct 2024 22:15:29 +1000
Message-ID: <CAHgNfTwGM8tEsp5SfYp2XmqN2qC557kGyuDwCJfcoxpc7wGSOQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: cs42l84: Add new codec driver
To: Mark Brown <broonie@kernel.org>
Cc: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Wed, Oct 16, 2024 at 10:23=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > +static const struct regmap_config cs42l84_regmap =3D {
> > +     .reg_bits =3D 16,
> > +     .val_bits =3D 8,
> > +
> > +     .volatile_reg =3D cs42l84_volatile_register,
> > +
> > +     .max_register =3D 0xffff,
>
> Does that register actually exist?

It is likely that the highest register is the ID register, which would matc=
h
CS42L42. Setting that here does not break anything.

> > +static int cs42l84_mute_stream(struct snd_soc_dai *dai, int mute, int =
stream)
> > +{
> > +     struct snd_soc_component *component =3D dai->component;
> > +     struct cs42l84_private *cs42l84 =3D snd_soc_component_get_drvdata=
(component);
> > +     unsigned int regval;
> > +     int ret;
>
> > +                             ret =3D regmap_read_poll_timeout(cs42l84-=
>regmap,
> > +                                                            CS42L84_PL=
L_LOCK_STATUS,
> > +                                                            regval,
> > +                                                            (regval & =
CS42L84_PLL_LOCK_STATUS_LOCKED),
> > +                                                            CS42L84_PL=
L_LOCK_POLL_US,
> > +                                                            CS42L84_PL=
L_LOCK_TIMEOUT_US);
> > +                             if (ret < 0)
> > +                                     dev_warn(component->dev, "PLL fai=
led to lock: %d\n", ret);
>
> This is too heavyweight for a mute operation, do you really need one?

Unfortunately it seems that way. This was carried over directly from CS42L4=
2,
and as the comment in the function states, the internal power supply
will discharge
itself and crash the chip if the PLL is set up before any of the interfaces
are fully enabled. This is corroborrated by the CS42L42 datasheet. I've spe=
nt
some time today trying to work around this, but trying to sequence and enab=
le
the PLL anywhere more sensible either causes the chip to crash or causes
audible clock jitter artefacts.

Regards,
James
