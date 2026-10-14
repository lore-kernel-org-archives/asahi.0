Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0944948125B
	for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977977; cv=pass; b=USMm9a6B1pI+5uwhaw6Oj9Wc4hbGCcWX8r9PxdAGjCVeb+2SA8faJowmdW8mBD6mzIwIMbLMkBWNcS4OC3gz0HHpQTT/8GmAcfvfbh44xJu17Ota+jlTHJgnPLgrHIwAROZCW4GuXNnfzKK7sg8ZcFY73pS3+QWmurBLn7TPg/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977977; c=relaxed/simple;
	bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtiCcr0vSqS+hb7hyJMAN2QjyMcEE2S9KiwlJ270/kfvuhmIAQX7PyjEEG3L+77c8oaaa573UrvgY2k1t2Z7GeNWr4XnTkxnVQy5z2mJEeumpMkOd2Z/KmQbd46fX2vApnFAE/xttKAdcZbthhP4nUWbDl0bAGiXIyfciJh/kqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eriwDF89; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eriwDF89"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e5378b281aso21591425ad.2
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 04:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977975; cv=none;
        d=google.com; s=arc-20260327;
        b=d5z5kU3ZHjnD72AgdBWbjGbNgl32eJbcE9oSKmnfTrXvyWB/6ALH6MwmxKv2A5Mm6p
         FiACUH0XAX97Ht89XvC+v0new9+CUOhV2+c+gPagt1icI8jiyav1mfwc0SIdvkztvLPI
         ImPBtRVq7vc9NGveAf674mH8SaHTgdEGcTRY6uQEq0hPrsiBmLkjxtEp0OMuLCJvP1Sz
         6tHDGidKxwe3DuHuVn93uGQxctdJQSnPRZwHQ269KGX5AJjEHO84lxbk2RO7og4YCjWj
         EbbnYw+zULjJsXKam03mZ+Sg7yVfdwwKY/RUH5QmyIf1E5PxfjuzuHtRmllwvwZPiI1Z
         JarA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        fh=ByXmlU1VBqjzDIEvcs4ySNRnW/JyIFmzDSv0BpGpclM=;
        b=MXSuNS8pKJyg6ADLXW3oYs5msMP3dntz7zWNFJtiMPtj49P5t+re6vzReFStjV1rqT
         D78CUtaX/mLwaw9zO/+ycORKnlBc/vICh9cbYIwxkNXAPJRmWYHUA7RpjHminIwM2NgN
         HHgFl2tiuEI6kaQEW8MizjN30vioVRrpN/OeO31uQoZvg0IKm+gr5n1nj8dwHRaWOsZ3
         l94YkDuKzVmIxZ3+6g0r77zD5YOlo0OUrR6yWo92qoZNyTTozTPIVsZhIkpM8F4R3guk
         7IIcvcdJuMM8WKlRYSwg61J5v6tfgl26GdFYJGbqgNn3on1VGz4EHaoknuhr5kPyLQLE
         pdtw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977975; x=1792582775; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        b=eriwDF89oyU450sggqluSKSqMT6IAyPCSbSUjzF45Nvzd8Jsob/RE4Tr09b+o1AEFD
         5/7IYtVUcgnCrX9XQlTDgbpXVUVpK2dbF4Yu6cpEpJD+0AFjPZrKy9faIXfeSEjb2+Cq
         3/DKVwhwX8si/iBLaU095YHRGbp8XM04jfoMF7xinK8IEUf3PIMn8gmtXCgRlCReFfgH
         7UyVv2Rm8NOYHiZ8ljA1ObVjBMy9I2+LcqJWVZJ+5LsrgtgLGLWcn8kO6GOl7Tt1dAs5
         IUDXMAOqNObCZTVh40+ZhlAYQw4U8t2IFciTOQGppfsSeAokCEbDMQz06neSGM+cDAJD
         xp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977975; x=1792582775;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        b=FeCCFbKjuj24ai2gIJb9bUAcolvzxUphuCvraSs6SlKQSb17KCnQFRRbsPgR1Tisnj
         ZSHWc1HlInmEEcWMvo8HePlr7BM5EstzrqPP1xEyKZrSsqbMklT96K63nskj17HtNwUe
         ROLL6MG6OKOFGntLeFcO+3ig2Az6PXH/NPmvgOJu27NtvDWwA8X/yBhZSXD8Ks9bXoZg
         A62zQ8+a4FArDhNxqJ6XDNFqlCLGKuCDkx9ONyJ3bXr1zadEMUVr0nMDap7VmJ7mkqMO
         6cDR1F4znc3RKfB/EsACZX6vcdVuyv2xIw/DYywwc9OFRvST2y2ffzQZB4KifutbF0vv
         ALLw==
X-Forwarded-Encrypted: i=1; AKwUvBzoi/rZwVw1+D5GoBgmuBMBh5gmGcvmFZMLiOhnv5K7NHtRD0fWxKicUT2/VqPbKTR6ojLrEg==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ/YN7HpMwSvowASvejrg7TDQb+pcpMfoiVJZ4gZ6Efd5w8TdSt
	DDTo1s9hCyCTHHCtmmgc7H6LdbkfXpDShv5wbu/tUCoAM0F6EbbaDNibsHqWHgug7TsP78kN2tE
	LyFg1DjQXMttXWo4qXuydOPDyL1JKUlA=
X-Gm-Gg: AYBFou0Q2A140/HThkWRvUEK+aXHOh+SPbyamc8ycprTwYB1mS9G//xhFHwcMStm0A7
	OL+mkMv+kyvtSXLuzMplXocZH1a7kpLGmiBmpnJfnp1Uz1BUoQTdClrIux/qnQti2Vhap2ByeK/
	O5NUhCTVIoFLGI7eiCSq+bUauUlG+gDsCuEd3IRXr9VK9u30FJt5uxWJeDE3Az/4UAG+pgZfQdb
	XxmJbVgK6kSAkjE7iIJkAX1T2oJpnlwvSxzo4mW8knhbPVeJTBt0K4o7LLClRj8o2eWMl9jxagL
	n4FD7xN3V7MVBirAmbd9dZ1dv3F/YH3tcqURUb3cjKhA8DNZG0m/MJIpHFvBfhvEL8exb1dM691
	cZdY+BmD5eW4swNL3SmoGe4Ni4vTxQSlq6GmcnhQy1O+GFLMD3FvcEJghGOaL6huAJ/U=
X-Received: by 2002:a17:902:c946:b0:2e7:e73e:7091 with SMTP id
 d9443c01a7336-2e842bc6d99mr145871485ad.31.1791977975265; Wed, 14 Oct 2026
 04:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com> <fc30ea4e-3c2f-4ba4-9ae2-054db9b49fd5@amd.com>
In-Reply-To: <fc30ea4e-3c2f-4ba4-9ae2-054db9b49fd5@amd.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 18:39:23 +0700
X-Gm-Features: AclHuK9jgQVtz3xDN60LQFsNWM2GDbLorSH_eG4NihFn39vhGI4sDgE_b4KgxkY
Message-ID: <CAABR9nGbO1tBOL=fN90ZrYPkv767qh_sJG_UHP-FW5C7sBPpmw@mail.gmail.com>
Subject: Re: [PATCH 00/24] ASoC: Fix constraint return value handling
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrei Simion <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
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

Hi Mukunda,

Thanks for the review.

> > Found by manual code inspection.
> For AMD patches:
>
> Reviewed-By: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

 I'll send v2 shortly with your Reviewed-by tag.

Best regards,
Phuc
