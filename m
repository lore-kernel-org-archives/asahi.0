Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E512E33DEC0
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302434; cv=none; b=BLzCfwJvgXAPoYlxR5lWUoRfV6ZlJk0I6KzhEhYbRvl/8rpzZekUjlzk3+fWPzl14RXEhEWgcvlSI82hA6WC1UB/MPOrx02Ukdrq8GNrK1imRsUUr3Zz6alUTt1BOO7NDeMKuyDlGPOhY+MXI/tcMDlIfeDcIWQh9b4cSwD1NXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302434; c=relaxed/simple;
	bh=nL33N4MkG2GAXW61rbmW51GmG14HD5JKfZBJNorgJ1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jik7/Ae1YTdZjJ5TDFPqDXtUgsAn9xrWXM16G21QhFEyrKHgXO8oUxWc9NyR2Y/yOjVJYDUZa0aZBIVdx25lvzVwo61HdgMCzpT+bhx62xWhs47ROoHhE7dFEJXh1VqfN+GbtGD1kB6PYvws3pxlVi0yRrPpM4yOf4mxIvp13xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DKysRJwL; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DKysRJwL"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so1099224a91.2
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302431; x=1792907231; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=DKysRJwLy2Q5sVhCnRIf2jbrSYkycD3brBLoDBQWe9OdANVTyNFyXJ9DMtZe65V+wp
         3u4BL7+MxSMPsWBKOWOoCiv3I6MZ2JZO3t6HEd6sPWWdF7dJm7RZrj2HnkxXBE3ERlmO
         p1AmI/jplDYg3fb804S6OETkzh9cwgKAvOn/tG6ZZ6dGdv4zDR25aTMyY33o817TKLqG
         p7Xd/f4xdwGLq8ScedT1SuEbuRur6R6h0o30M01ViRP8RQFaamYWJL7mmrDRIsrxK0z2
         3NLkstM/PgcCZrTxAdkVgcJEgyAwVZP/kUQgvISor+DNOUaoN3E3lK4xqA6cb+n5dcUf
         7LLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302431; x=1792907231;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZY9wh4sxQs63RQAxeF2tIFILu93inTX2QwnrPUnhYs=;
        b=0G+vRLJZI6WSl+Wt/lIjKOUOxJJwM7pkKlbxI4NJovDNvtltEc9yiqjX7Itzqs1iZE
         c/Wyl4nTP5ZqpWXYog8C7kXMZRlKvrUiYPgNi56RnMPQyvlycc3t5GThiyWSpMJfb/1m
         UPvLW5yp28FMMoKT3Rro0+z8juUOIuIugDe7++Pss3NHUgRgV2RIQ04XVZFisJBifq1k
         Jn7qTjZophF9wrxtAn2FRKYPCg3HZKvUzxk8n13Jw8ApfqxkIVscUM967H/PM6Y+q1yB
         5StqY8NNifOWE2j/uOEsw7+XfzBMmsCPike59iGHBy5UzgGfsHXee5Remg+C5vRzxfKT
         51AA==
X-Forwarded-Encrypted: i=1; AKwUvBwDPzHz+vZnNqZ/5KIyj0mim7rwdoHv1visxCBeMMdqt9G5clTQyfa6P9oIvLlmEKz1ZaHVqg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJEBRDC3Rg9xqLuOxkeeH5/x20CkG8UYO2exFpIL/oVJBHg3aP1
	Eb1fldFRvtk5DZKjLDqE4l9DiCEyH5nr0/Gqt7z/uylzFLzfbcAgpYPK
X-Gm-Gg: AYBFou1oWlbiDIP0BY3/CtktL/TKzHc8IjzN7GPGLfegFUERhpNslYCy0daKLa/dN6X
	++uH8Q2Ks5UBta29ho+2myDVNYMvobigz8TX4N9ejuB3g8lxSLQGt2FHLBDjnTtg4E07gUupAYK
	amOcS/hTVrkBaRM23AtP9iBgK3Q55MmBDNVeQPUm9TBD/3KSFB/Z0LtfLipISJIe7H6o7NzobzJ
	dp6NdlPsTc1APE2BRZLv9CwBfdRX8cC8MllCUw0zsPaNcw2Gf0VxCb0CFwJ/36toso7seLBHgpN
	GALopT2R1/dsb9FLWQAsdvpHIBe4Kh13/hFJvevEfIA68iNru2vVEWMSo/736uYwuPSm2qPGa3S
	Vkpn+I6fztscKlh4k0PYd4+KIJQ87Hyu+4Sl446gJryXEp5mucm8q5Oh0gJKiGHj+gGEf9ba4ew
	w+0eox/HJVwT8iWdH5USlIbO7gPKnIgiGu7xMpgv/igUVALs5se0mlCXsCYRkGQrEHfdMZ/IbTr
	J5Q8iy9RrStf7ivLZgSaBXP7jUDo8+nVruSpnZhGGDPdM/JRi/BfvJ+K2NwPnShtg2zdtzlfkAZ
	IqTVmPiQRJdhdKmKXRbIuE4NWXiK+Knq95CfUlfiTFy/Ife1RV8=
X-Received: by 2002:a17:90b:4c49:b0:3a8:185:cf40 with SMTP id 98e67ed59e1d1-3aceeb95f82mr3942070a91.10.1792302431271;
        Sat, 17 Oct 2026 22:47:11 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9d266d6sm5442358a91.1.2026.10.17.22.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:47:09 -0700 (PDT)
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
Date: Sun, 18 Oct 2026 15:46:54 +1000
Message-ID: <hMEBpV6QSOSLxRVSn92CIQ@gmail.com>
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


