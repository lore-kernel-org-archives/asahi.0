Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D883E765A
	for <asahi@lists.linux.dev>; Thu,  8 Oct 2026 11:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457249; cv=pass; b=cgYFEvZmjdfFEVckiDItj/vHMSoSOzqcAAjJ27zQ1GQwXtDo1Fsp80BMtk3rBPcnxbHvWliKbAfyS6SMhllaXCQr2w6wozF9SP0n/YYopfJ7BCuI1wUgmBPCf4UVxRtx094MdcXOBrLtDpw3sbJER2BnhebWp9EpLplrZdGSZVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457249; c=relaxed/simple;
	bh=PwHZM9ypG7ivy6DiyvJAIMcoKpqU4Q9ea2Q0SCuiZzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oo4pVnAaqssYQTd892qx3Y2fxbqadEgNCl07cjXdhYXmZEkw+7s3qs9sFfJPcaqdvjgvwUESqpefqRmCnMajHAY+bbWAvGlhzP3wp3I4n/1lH+HPs6a6IyO+92YB0vJWO2GadSoujf9/jh5pLfCWDHAdMnRe1b3iE9ZQrXredNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEbLk3Ye; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEbLk3Ye"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2e40d62e77so321383666b.1
        for <asahi@lists.linux.dev>; Thu, 08 Oct 2026 04:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791457246; cv=none;
        d=google.com; s=arc-20260327;
        b=WGyomM2+VptYeaDA5HnPAjFAdlVT41v7R9NeG/XYiTGguKyuhL9twkRLCYyrEvE30e
         kpRamwGiI66JW3iML3+yTnUTky7oVYSGs9JtP/WPSis9KqfcKSYS+sXqDLQrVvzBk4xJ
         AihBftPjGwrFYFA11hs1BM2YNszqIYrQRwVv8iJz5OsuNnBrz3PRKY/D/oxdGcRfzxWb
         o1Dr0ZYfxu8xLHa1Ez8l44TbTYA6wak05tCZ0CO51NCVfl3q751ddpsffA6ISePyL4a2
         TMpq/KfM0emEeCJAYptPxI/MquXLy0CwJW+247KgbhqfnpYy5o0KG6U8bWnjywiWzcPb
         9ccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eIepTPV7DS9Aylyj+4CBDzvdvhaffPGskWIagcgTxBk=;
        fh=eCHX9StpdIxn+iQ1WVwtC7RSC/U3XYyMNkdV098YU40=;
        b=Dlh4AhooTph0Uvz6z2arNkdSLIxIwsJciIRalqvMsF+rY67JQXZGAJYU6j/8T4cvwX
         FMkHU8eYQZRbSWaSx2Uqdaw64ajb1AMMQy31RGRu0NawC8gkXI3XBulhq7xfGg2mdCsk
         YgooyD8xE75I/I3BAC45YSZ89VdLng7u/7PDsOQ3Z6197gJFDcKgO0zobmVNLUHlM7je
         x7k3GfFhCnQwvwbg7bP8jQpHk7aqHuJkyXBczc113csSWNPW27QSKbliZfKPc2iGsDBa
         qlZp8yv4flWobx8w+A7K5oxAtbd0Sj3YJeULLIgsC8mdfHi3MA13Eklf0lfOgjF+z3dm
         sNDg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791457246; x=1792062046; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eIepTPV7DS9Aylyj+4CBDzvdvhaffPGskWIagcgTxBk=;
        b=cEbLk3YesCFAtuDuYXJ9WftKA5OqV5vpLDmJLhp3QL6YVKLOrWoQi3w+cESzr/T+Ia
         I/J5u3vv6PT9vpv2poUlAAreaEHQG/ZKcTwjCciLqc+WidHcrAEjfCsp72A4wgky9Ey6
         PeQjuXKlkND+C/etEbo3fgm8pMqyYoqbpVTZ1mO1a+OMEq6FOCThbUpsJxuoLufsGg0r
         cI7t3GdpmNMZNhB532ZKS1PohDX/L5n6fZ2H9yGdUWhvftXiGp1PtDzttk7H9yjyuC7v
         17/KRqEpeVzSd1v0yVveX2M+jew5GZzS4ozvCGwU6spCDTMwRJ5DhQdH8TJ/DhE8Rims
         fc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457246; x=1792062046;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eIepTPV7DS9Aylyj+4CBDzvdvhaffPGskWIagcgTxBk=;
        b=ovv7jCYOWORjFUzxO4tsYqTYOQg2X2+bz5e4QjjDaBn3Zg5g89jO7VQUZEdRty7HWn
         UU/NbfoCgcng78zqXQnhIiouUl0ZWPy0F89u2j+c3onAEEu9SdvpnFTrjYvOdRDR+dzX
         P12PSaCUrUboZ4hQdKlzS/llGL3NxQVNVMmdverCFjQigCqBkrrodlR2ZuD9Jt1rnUUF
         XHfKJkVEeOTrwtne4Ad92JVIitdLuJPj/O262d6oKP9mM7JWHWFsa4vhY2RwDomyrtJS
         5WuHlRbOqqCs6rnal3eSrKCYB7vUv/PI7yGRYzaJjcTUTEUfDGhkiucMnOZH/wRcy8ck
         kq1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxehUL6uKhaIvWQBiAnYwBBWZFlUjgTms7BFbva9qwa9X7mgRd2OsqigsAbCiEIrdIbIarhaQ==@lists.linux.dev
X-Gm-Message-State: AFuF++l13f7uVPR4no2QK9EYsZbeIpxMEt2+vBekPq3Wxdfq9ybjkoCr
	RZoLdiCLWvp6tc9qt4MF5hlULaSXMb+W2s3rpSSTT3G+Ci5Wc/kSpeaTdblrTSx2nfYKCSTmg6t
	AxidwaW+bnwYlJM0Q6yGjyJD7qaQ0NlI=
X-Gm-Gg: AYBFou1vmNOjaCV3n5y+jdw3dCMXbvWN0ReFoae7fMtL4ebf2DaAuJlztlVZvYznppr
	AIVDwOqcs8nzoM/aMFjpQIn7okTZZD9P4KR3T7mrl2a8Q0yQxrpLzdzXOYKgSbDrGPKQJdiG9pC
	Oz+w5AdQl/5H+9YsX9G0PVmuRPuOt86X7qDFWn6/4NhK8RBacHSzG/3PHcW2IU57Xi8yqprheKk
	Ie5hX4BLfkX6Qkwr5tA81D7hFwwzXSY77pPxULuPDFHjt2xux+CZiXVqebJ8xrrmOisSCfujKZr
	h9OTUjt8He1qjmdtnSycIEIS1IyKKu/JCZ/MA1DxaVx+kdszsXVTrKTVM4WmwGbZvgEPCS20u7J
	9//jnkvz4bLqXSsvdMxMNuW8Tpjl4TMH2legBk8XSHPEYamKK7J/gwInz4sMuJIoXS6g=
X-Received: by 2002:a17:907:3f9b:b0:c26:1648:a062 with SMTP id
 a640c23a62f3a-c317be58e90mr502991266b.29.1791457245712; Thu, 08 Oct 2026
 04:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-11-phucduc.bui@gmail.com> <fc7d2b73-e0a4-4a36-b6d4-8080ebb883f7@opensource.cirrus.com>
In-Reply-To: <fc7d2b73-e0a4-4a36-b6d4-8080ebb883f7@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 8 Oct 2026 18:00:32 +0700
X-Gm-Features: AclHuK_K3qxrvyLSGGdbMZG2p4PEMizBkDvUHEpZw0j03bz-I49nzoxH95pIpWQ
Message-ID: <CAABR9nHx1Uwket5-co+e-LR3j=0Cww0ZqZgZsUbiDmHTEXp-PA@mail.gmail.com>
Subject: Re: [PATCH 10/24] ASoC: codecs: cs42l42: Ensure the DAI is marked as
 started on success
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrei Simion <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Neo Chang <YLCHANG2@nuvoton.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, u.kleine-koenig@baylibre.com, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Zain Aboobacker <zainaboobacker33@gmail.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, 
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, Bo Shen <voice.shen@atmel.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thank you for your review.

> Is there any reason why we can't change ASoC to mark the DAI as started
> if return is not an error?
>
>
> int snd_soc_dai_startup(struct snd_soc_dai *dai,
>                         struct snd_pcm_substream *substream)
> {
> <SNIP>
>
>         if (ret < 0)
>                 soc_dai_ret(dai, ret);
>
>         soc_dai_mark_push(dai, substream, startup);
>
>         return soc_dai_ret(dai, 0);
> }

I confirmed this with the maintainer here:
https://lore.kernel.org/all/CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com/

It seems that the other ASoC callbacks consistently use 0 to indicate
success. The other call sites also handle the return values correctly.
The issue is limited to callbacks that directly return the result of
snd_pcm_hw_constraint_minmax() or snd_pcm_hw_constraint_integer(),
where the positive return value was overlooked.

Best regards,
Phuc
