Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7493AAF5B
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302485; cv=none; b=puTd3T9I87Y/AWiU1aN/RKmLK/Sne5ICNEjmSyb6S11LvNTEbjIbU2xJH4P7WdXxNvLp9vcih0VOcOR2/7DnHmgZPhEJ8mcJw0tlpW/o1H/xeptwLH4BBjo3k6K96Va+Agkhu2KtzWV0KODyxVCwx8ub6pneDid/QOn4jh3K2HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302485; c=relaxed/simple;
	bh=nL33N4MkG2GAXW61rbmW51GmG14HD5JKfZBJNorgJ1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mRvQrO+RFb+J763lb9sU6emy0NiZPq6rGU/0GEU5nJgLeH5MhMPtdzG6HOri5+Aq3jlJWM2Lo0HfB2txmDsIRQ+MyAJpVnEEvTxLHyisP+VTRVQRnD2BJVolGRmEBUoA+iiSXT8iP4/xI23fGqFX1bl5kmKM3+JcnYDvowCar24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XViKeiOQ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XViKeiOQ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a04d34e294so420969b3a.3
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302483; x=1792907283; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=XViKeiOQTZVvpOGDiFmaSQqWxD0L9kt6bT3+x6ncpvX+ooLxxuDWhY0pSF1EMlknuW
         0HXCrP0wNTdjoWd3HooC7u9pXYAc+HRBRt8HiokRqAzVmFti1n3u8HU4UwAGYsYPn8AW
         AAFGJAB4a6SQALobvtodhGonn2gckeIiQEiU6eTw3sOSXv1m6k8oExwLXao53rSYkDLV
         +IqlUFoTF0IUpNLZ8qNt3VoQoxQTzLF5O3MJDBMHzxLEZb6K5nY8+O5U2tW0jDHz0xZc
         GhccDLm0D/wnp+eiW6y7P0auO9luU3hcwKVjeybUEbE8vtHTlzPwHsahVm/WGMM+L78g
         LB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302483; x=1792907283;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=rJVmKgDCAw+0BGlpFYJElTRz7dpjlK6z9qNQ8YdMl9bKbaXZPUCFrarb5pRtDJsKrg
         j9rTMqrvuJS2QOprsWIkTjmOVQODSXN6UeWtrX0IpfoLAxYvD3AoFhwyF2Klb+rr4EZg
         UG2gx8wNAHveEjkLa2MPYYHcDtr0o8s43GWM28Quvrw2XfPP5JaEe32uB+T0gDHT5lQn
         vMn/5wGGnyAw4uHtIPzvZ+mEfPl0Xr5uWRCA1QF7fanj9z2iQYI+28YXZoY2RTDgAy+I
         c5E9PdZ5N8b9NP7F/dM0PrTAFN8tX2qUOX8c+8tchkj/SNXacZtGE9mbFuY6FpE9Ei/5
         gPmA==
X-Forwarded-Encrypted: i=1; AKwUvBw+s/ohC/ln1J5qOkVW85eqKK874ctPcbnnC6H+jiFYYGk0tQcKfV5L8kDV1NK8+/Dr4/v+iQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIiRObZ/jEvvBAMu6k2jXvfTx183meF92eLXyIGRnbMD39Ge3gg
	24H5R9gYYKDvJl8MtuXKG9devx1t424O96g6STuv8tjzslCD75diDCG7
X-Gm-Gg: AYBFou0bkXFVFzG+wvpxODecjhbd+2qVJNZpF0Yl170bXsj9aBsJX09+LrzqAExcWax
	Z8JZFnCHSNarLDxrkVmwGmDQkaESLxYzMgbbcHLALZf9g2Jxs+ho8xnJkbMTsTm1vA1lfZVSyNJ
	B/J0oXTwPMF61ObNnJWDTi+r7laQGEqcpAgXHlAdK2yMsiQVtFlHLdrNi27Y7285ox/dnpnV0Cq
	n2jc0nViIYnIgmu8KqzyOvDALJUONEoklHUr0Veit2Ya4gjO36JlDBWrA4Yc4yZm8IOPI4Us6bW
	bIpy4kaogWairqNnWWuU8thaE7AcKIt0Q961O7NZZj5DBSi+DUqdaqtoNd1dNlgYhDshLAISCAK
	a3Ck+vGcg6I/gB2EOzUq85ckBboiMypzek06gwokImoYO3EbH7K7eMDgZkaiO4q5hkmbMiUBJ37
	G1Ot5ZW9THdOoHLJZ57UdViKoqEmuQPeuR5kxavuOpuf3VgTojN8q9aJYd6b9fjJqG91UKZGT+9
	0EyC0CcIvQ2MjvGEQMSfG4XpDr/6WMbmM5kA/Kz8rLYhkot3OAnSa8W7S8T11qv6XYjfDke1idH
	VWw0fwfyoDz1wlk6rNGwwjm/jHiuXrHlVrie4iDyRQlpPezC+U4=
X-Received: by 2002:a05:6a20:c5aa:b0:3e1:efce:1d35 with SMTP id adf61e73a8af0-3e225f2b40emr3593769637.14.1792302483139;
        Sat, 17 Oct 2026 22:48:03 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57452b16sm2648102b3a.29.2026.10.17.22.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:48:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 08/21] ASoC: card: Let 'fixup_controls' return errors
Date: Sun, 18 Oct 2026 15:47:54 +1000
Message-ID: <sd9fj8SNRAmGisFuRJU7rg@gmail.com>
In-Reply-To: <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-8-7b47ed6335a8@gmail.com>
 <asZV7oBh7jQ6wk/g@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Thursday, 8 October 2026 12:23:42=E2=80=AFam Australian Eastern Standard=
 Time=20
Charles Keepax wrote:
> On Sun, Oct 04, 2026 at 04:03:35PM +1000, James Calligeros wrote:
> > From: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> >=20
> > Let the 'fixup_controls' card method return error values which will roll
> > back the half-done binding of the card.
> >=20
> > Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  include/sound/soc-card.h                 |  2 +-
> >  include/sound/soc.h                      |  2 +-
> >  .../soc/mediatek/mt8188/mt8188-mt6359.c  |  4 +++-
> >  sound/soc/soc-card.c                     | 12 +++++++++---
> >  sound/soc/soc-core.c                     |  5 ++++-
>=20
> Fixup is missing here for sound/soc/sdca/sdca_class_function.c

Unless I'm missing something, that one calls the .fixup_controls on
snd_soc_component_driver, which is not the snd_soc_card callback
modified by this commit. That callback already expected an int,
and class_function_component_fixup_controls already returns one
per b8f71f16134f ("ASoC: SDCA: Switch to fixup_controls callback
for IRQ registration").

Regards,
James


