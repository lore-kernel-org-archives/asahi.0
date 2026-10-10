Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A02366054
	for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 04:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791607268; cv=none; b=AICDSEjcsIjFN/DjbZfusI1VyBJTKAcZ1BWvdFtw5rlI/vU6waZHnd+hNkNEnX7wTfI9vSN/qh2o160E1yW3Nibrk4MsPILp0BxqG0Hq+u8DtUocm7DLUrfzx8j36uQQCGRGHeqO+1ruukhBNFqpz0Vh0E6GBSju+hWT3Eg3NjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791607268; c=relaxed/simple;
	bh=fN6Fd6o/zCGIvEnXn+MFZXCFpeQhWnuklflkSkR1o9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lApMZp2PIOs8Zzg5hHtl+2EDW5Scb3SOGdw3I9Mcy70aluzTvXFXCs+cpOdHX+H8Agky7+115YhOrhFq4Ebe0rVwPaPnwMqQZNOUP6LcpBgEK8feNzKON4EQArjpWKCgBOfcvCiX+no01NVfc25QqFw4to3Tng1aF85bQQtzltQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LgpSi71g; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LgpSi71g"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2dd76b1361dso1848795ad.1
        for <asahi@lists.linux.dev>; Fri, 09 Oct 2026 21:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791607266; x=1792212066; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sNrVsnb4FmKFTXfrSdVYo8TWlLsGj3AF2yF7SV7KZcs=;
        b=LgpSi71gClyhsKXdUE7sRVlCL4R5HYymANUj/4erQEgVSogExQg5zi6uLVRZAOFCKp
         BM7wbtAt0i/oy2NMqa3bUohzN7AAmcAoIBT9zMZDoj8gGziUlQIpFcxp2XrJpvgSMr6I
         zgZVb+Jnz67+rQZS5bn5m3eMx62dr+3Prpwl9CcXRbgVTf5HJ6ONzFCmA0BKKFuA+E6p
         1kdPOvhnR6aUwQq2SBI3HOA/FIXHyo+3coTVKKh+QP8QBJIgtg3/lQypaDbK58PPKn2K
         GR1bvdYpV3mwsQD4FhN/uJ2IvJ4CNDrL4/XDKFSFXyGJx5u6f4NgxadVF53+NHag0hE7
         0fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791607266; x=1792212066;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNrVsnb4FmKFTXfrSdVYo8TWlLsGj3AF2yF7SV7KZcs=;
        b=DVrcXiQsqx+tgOc+3OHnXbm7mreLM1/Us7dmGO/hM+V2GTmiipDemglCG0nVxXNYdt
         mQkSFhKVOqQ2DfmlI9YWsaN5giplsPErgbpPQKk7jRBJJeXLRrzfnYkMB5CBYPmcT0B1
         Bl9py3EwNYfDKPmsfki5QGH817Dfo+NovIVnyyHV56f9DPKZQchyj3Po2rQacaAGnfvt
         Tl+pH5D2OhzfuYlI9p8SZcMxHclrvUlZHAemcADzYdItaT8isOWIR0rnC/rc/uTEx+rI
         barNpkM3LZFDuRmGoU6bjmZrAJi1FQ7lCQ9EjKu0JJo9699FfKxjdyIpeSQWIrZuY68N
         XATQ==
X-Gm-Message-State: AFq9FYJC8WLy0w92fWoIJMajjgU2ixSg7okKLjbH32wtdr1PIyzgcbO/
	si1n8IWNbPHmPaA/nrvWyiaY7Q+dVfTvP8kxKuZn6/I8KiMIKujRP8mv
X-Gm-Gg: AYBFou13dANeX/ixHsUTFabWRNNS/Wtr9Tmm96PNTgrM9UaTUsBklrTTv4detYAR37n
	uOhOAha7u/uv9VuOkgfzeIhjiCeSl3M+c810GSTmDulQMubjPxMA3y7dCyKmLBww8NM6d+Dn5gk
	S/PBfmX9t1FX5RxwmmD/uq2LgWQUTLkMcNkbn/f1R0dHyP8OSgVjmAWGVoJtOF4ty89H0HikzO/
	g1IyL6HhXqLRhnA10JiYmWwdJqCvQ5VRZpNXaeDlysy5gK1TPVJG5Cl1NL4yzoZUVj4Un2fcOHJ
	CBR0UDQNo8lLvWxV21nv4X1MD1lejsFMlWLd09nw01cqKt+lr7Mmd5Yn/0x3xqvm3XmIov+hY5D
	A1bQ/k2Aoubp4vgJeKRemlezxaTPEVeU7bXrw5dBQbvfc6sUNOGtHUOuLgs6+QW2pELYl/dc2c1
	atwB81rB0Jhq4ioxdVco8i7WDaheAgWE+ljal0vY2m6x1OAKwinHwAHR8lEaa1w4zheJz6AZckJ
	N+F8CunrMHyjkD05Rwnz22lcEHeVlqQFGSQ0eXRNyoKJ30lBky6eguDKJk5iWkt8i4VMFQTKq8d
	fOCEzssp716YweWvtf20OSehsre1ne3W58jQYzbpIXuK8R69Eso=
X-Received: by 2002:a17:903:1a0e:b0:2dd:8639:9931 with SMTP id d9443c01a7336-2e842ab8200mr30793065ad.19.1791607266248;
        Fri, 09 Oct 2026 21:41:06 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e171bsm19910975ad.73.2026.10.09.21.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 21:41:05 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
 patches@opensource.cirrus.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>,
 Sasha Finkelstein <k@chaosmail.tech>, David Rhodes <david.rhodes@cirrus.com>,
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
 Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v2 09/21] ASoC: apple: Add macaudio machine driver
Date: Sat, 10 Oct 2026 14:40:54 +1000
Message-ID: <l_pd6lBHQaWNYoohhfxhFw@gmail.com>
In-Reply-To: <3698d260-13c5-4050-8f03-61f7b7185514@intel.com>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com>
 <3698d260-13c5-4050-8f03-61f7b7185514@intel.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

On Friday, 9 October 2026 9:52:09=E2=80=AFpm Australian Eastern Standard Ti=
me Cezary=20
Rojewski wrote:
> macaudio_dpcm_hw_params()
> macaudio_be_hw_free()
> 	both can access the card from the substream/dai without
> 	relying on the ma-context
>=20
> macaudio_parse_of()
> macaudio_parse_of_be_dai_link()
> 	called in context which creates the very card

I have fixed all of these by copying what rockchip/rockchip_max98090.c
does to initialise the card, however

> macaudio_vlimit_enable_timeout()
> macaudio_vlimit_disable_timeout()
> macaudio_vlimit_update()
> 	called in context of delayed part of the trigger() callback.
> 	I'd need more information on the trigger() implementation of
> 	yours to present a solution. See the comments below.

are slightly more difficult to deal with. These are called from workqueues
which only have reference to the driver data struct. Other than keeping a
pointer to the card around, I'm not sure how else to deal with this other
than keeping a pointer to card around in the driver data struct.

> Please correct me if I'm wrong but it seems the scheduled work does
> speaker-volume operations only. Moreover, it seems that
> ->lock_update_work may schedule a follow up work in form of
> ->lock_timeout_work. Are you sure trigger() is the right place to do
> volume-control in delayed manner?

The intention here is to activate the timeout when the stream starts
so that if speakersafetyd dies at any point during playback, the speaker
volume(s) are limited to prevent damage. We only want this running when
speaker playback starts and we need to disable it when that playback stops,
so trigger() seems like the natural place for this.

James



