Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792462259;
	b=cNhSRg4fDLhN6yO0/aBx8Ob/nZOvN1vrrHe3iWsRXpcZbfmtfJ7b7ZWMNiK/goXT21S2
	 bCZhCdEyc53kxafmnAbskk+FJyVqJKs2eHHimGx4i3LF5aUxDwCoIp/jhBSfZeBW4u8ML
	 L8YNtCjGnalQcLeqZ2hR3ZI60K82pCmUKNeBSynfINiI7/6azsnEM9ngqJqhiMOjOt0/O
	 KNkWQ0eALG7gB0Ed0Y7EoiUma1NRU6MzE3qCyhcHVdBFLzmuqZG7r91+zu68Cssuc9J6A
	 K9VdGcR9wj/EKy/2+igAdfCS0S+/SniSieV2h3r66YAoZ3cIXM2WOIhYYsntMjBbPKg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792462259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
	b=pwBN2o4KSHWu8kuWOLVujDTH7bcFBfzS0j6Opz0zs2YPa4G7dxgTKILy9nIY6IvLLScE
	 SreOrGymoEFgdx9FLPPMj+JvJ7SJ3obi0br8NiDVH6E4MSiIDTS3TXbVtzsRv8iwoWObP
	 IyikFY1D9P3YdIWbu52i15LxyCOSE9JMOWBbogQPNrFQiz3DGebZ6wS+vmmpTU9oQwc2h
	 oRHMow352cQMGEwCJmClYNQAQ0foi4FEYYy2hIa/f8gjuObbplr738md+IOYQhk/msryk
	 mKF5/epcI/8eF0qVs1iAAapwGeZgA6nXVV/JjJb/d91jvyY53TIqBTT6ADJdFxv57Bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=daUiAR3A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3F0606A31B
	for <asahi@lists.linux.dev>; Tue, 20 Oct 2026 02:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D3F0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=daUiAR3A
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ea138a3497so4883405ad.2
        for <asahi@lists.linux.dev>; Mon, 19 Oct 2026 19:10:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792462257; cv=none;
        d=google.com; s=arc-20260327;
        b=M986Oi99QJFsNzS8rvOW2t2rTiShOyooHixmPyLrF5nlbC+oaMEwO5lH2kQEIyDgPg
         ofPPgSUWc62HNahoPnrVf7lmNgbdz/q3ArcZeyvl7s7x9JOrtybXV5jDCENb3fvVKQTM
         +P2fy9ftzzdq4gbdXqqp1eR/u8U9Va3U/TeYSG9vJD0zJT7WXF+lI+Tn+V6Rz0Qt+eXl
         fXSz6E3PuxcHAcb3zA15GuWTSLvS5AAV+zCiDNbDFrRNFcTdqnKJT7popr9794u44HfK
         sa3stqbPKRpRy5rPvc28ja7qLB7Foyv3+0TuCPI1E/JQicrJDpg4F43JP0nf9IaSVW5f
         5AIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        fh=ecBSzUrUk702TVeAKE4ZVJ82///fIFKR8sSO+lclvrs=;
        b=UuyCmZRu4zInAo7nc8nKQSkBBHAbfwCB6s2HJNJWLfMdFvEXxAvEaALQ/Lzy4XoKdh
         ba+mP9ScopISVnWwFQQACu7IFf3ereo0SWKbEUumI3Tq5ReqV+myf2iTfN5cCZLVTK+F
         3hwCDQiVB8v4qYGKKG0rkDAXa2Rjv8QnWSAxNpzUj8tBeqp99oQ24dUdnwPg5/kMpI52
         4LNK+08TbkTlZNBJuf+MmiV1xTEfe5ez59tPljvGrqXYG5eIt34rX65t3m8oKE+kCmj1
         EPShoDCadwFdfVjx3MntogbnmxShMrDSXch2PjF8KYynFn9pxZ89TyVV6DABcEUb3N1C
         hzPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792462257; x=1793067057; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        b=daUiAR3AJtzlL/FLTBJziXrDwr3Qz4e+1czgXhxGWdith+mpfWh2ViaI3kqYa2aDPP
         kB4s7JBn0+jBX8HJJC1hyj9dqM1mTLQep//PmoD4gI0b7Rsy6ZrZCUty3GfZ/EBtqfBW
         +Kws7RA/3laWZlayD54MSv327HfZ0rPxhgl5sgLC0QiipS4d4UXt+rnddt+RQlHHLQ3K
         p+DO5mGP/vVQPYkiyEglHi0axYIo1H0E3pRR2LjsNMwkgT4ExHIiEngAKVmeWS6f1Mc1
         0wrxDKtRUHTJuF6uAvNAxWd/Cn7nnfM6qWH+WtgYYJD5MAlBfWbFII1EBqBznl/sXkmI
         mESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792462257; x=1793067057;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J2awcyyaXtld8u9NUvdPyChgRrjEUxgKgS4S5LDKLZg=;
        b=Ge+MSbnqPuw5k2PN235lIRfJrthzm/MQCskmk/aOssA910yW0g4bOIcIDVltibpXw4
         ZiiC3yaSO9tMWA3lGO7aJVSh+5iGhvogCEzEnrSL3JvwS50SuHbVoiFwPsC0El91dcAE
         nqSwWf6E/xKGIsLVnZ/GrCf4Axu5ru+t7CxKASczBEriYtxXjFBo8HQiIOBiGdRJiSee
         vgerM94rVi6Gx9mTyYNGZcMIXPWCnBwSc/pq7HEoQCzZ/wTq+w7zlTpPBOJum1UlzaqX
         Nu3Y7BaOCQm0S6oreG2vrzHUgyJzwVxCHM3M16C7b8zQ8yD0qRVFQiFg/nRylJ9XJFiN
         ww/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzDgN0hFDde8ah0JbV2OxGERzwrXJJK2gmLNjbOpRkss5V4yRY5z7WQfDn+pKj8XRhWCkbQOw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIh/ZsvegqgIlvY96VzFTn3fV5xoEFsjZ1yOoNJAdsQOQU+43CQ
	NPldIiswjLj4PrSFDh9qk+Rt210JTL4GWRWeEF/89Rdtp3iQyIfF1PRgtz7OtktkvrAzaIvlFFT
	KN5Trio44NRIzOuHpmhz1+6d/usyGlSU=
X-Gm-Gg: AYBFou2+hWLwhXZmHwtEWdPoSe/Osmwq30CDYQhXUngGBBm4kSOTIVX0OrIT1rHbVSL
	CwoBVK7TdCbwvmFiLQMzX2fqPBJPb7CWbqyFfEfhpKZx+Yc5DG83iqmevqexuwBUul7CYkpAj9G
	ATmLrb8Lh0N0asIEu1t1dbJSMUTCoGDeNSWG5QsFgC8d0GTe6uP0fv3WT+nnqKyzgtg2BC6wOJZ
	xT14xog5/UUq401RAJ1H3gBhK9p7V2Ao7cTZB/ewWgMh4Z+MZTt204xHK3jkeJFLl7u/J5jxbJi
	Bo7//VLu2l+jZ7fCrPed6HVDoKnYuZNzOLDp/3J57aIX4fyjC5bTLcU1P27S2zNYf5MKJJoddPW
	NvxeDJOyuqzxnnMDYSbAYLVk1UISblOEAbBhN7BwGPoscPH8at47POmEsnVWU6wJRyGU=
X-Received: by 2002:a17:902:e547:b0:2e8:93b5:c555 with SMTP id
 d9443c01a7336-2e9a6e5296emr76192995ad.61.1792462257434; Mon, 19 Oct 2026
 19:10:57 -0700 (PDT)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
 <20261016040946.521195-11-phucduc.bui@gmail.com> <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
In-Reply-To: <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 20 Oct 2026 09:10:45 +0700
X-Gm-Features: AclHuK-OxoOqEZe9QHO9PQT5BaN1GB4IUM0kwzQZDjYp5iThqBCJWYOaobvziFs
Message-ID: <CAABR9nGOmx6zvost-Y9Zd2nzQa+ZMYxt2PtZ8xYPLZqZVGHegg@mail.gmail.com>
Subject: Re: [PATCH 10/11] ASoC: renesas: rz-ssi: Remove redundant component
 open callback
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Andrei Simion <andrei.simion@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
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
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Claudiu,


> > In DMA mode, the generic dmaengine PCM component already applies
> > the integer PERIODS constraint in snd_dmaengine_pcm_open().
> >
> > Since rz_ssi_pcm_open_dma() only applies this constraint, remove
> > the redundant component .open callback.
> >
> > Signed-off-by: bui duc phuc<phucduc.bui@gmail.com>
>
> FTR:
>
> Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>

Thanks for reviewing and testing!

Best regards,
Phuc
