Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72E433939D
	for <asahi@lists.linux.dev>; Thu, 15 Oct 2026 01:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028385; cv=pass; b=VSvkiOQ0PxCbdI8bs/buQ5iRJ8k7hWm6q4jTVBZXxpD1BIrUVfaDU+1/iWy2IMFCWM+XPYQnJTyOHlQO7Cq0LYBRs5Wj9MxTghbOVNLfhNPj3Z+VjbEmST3//2EkSFvfHw6CUNOeRjoSAh1DTFX3LtdAA/v1sCXSjqfZrEpGtgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028385; c=relaxed/simple;
	bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQaptMtqmpCjlXWkGcpE0a9bPrFcbMKkFvXmVXFNLpjlrDUObdQLo78KZSwsgYM3FsyIecXjlIaoPlWwQzLaf4Mxglj7ew92uC9TN07F54AGAzLsxzKZKSN/IY8Hs45Op7p6LwCeEBDWaOC5nkKjDzDdQHWG56Cp2sHTZB0p4Hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JoSkePzA; arc=pass smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JoSkePzA"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1918051a12.0
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 18:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792028383; cv=none;
        d=google.com; s=arc-20260327;
        b=mFIrHDK6Yhf56IgGQxLRIvBscRj49IF+LGEF7jTRlLHEtmCwuRCFFEXhZXR8GjWiRh
         Fr6q7qaxKo3Ggp19kWF1R+Az16rsr4nAqNOwypMb0CkRD5wfVs3JDGUK9887YNDkPHPm
         UXDaVCIps2m74jjds2VmRhniTtrF0n7a3P4SwEdRk83rHvI6fgm7Ho5gMF73jUpY6ZA5
         6TTl9nNImflat3sURz5I6D9YXdCdgwI9oDFnoZNeG03IirlNQpT5rfrnOZI00viXwtZR
         rcvQ6PzSssO/3Xmyr1ch5TEm7PHwe0HmDP+TECFj7XGStUeOJZ3IQALgokWYg4u5GiGR
         H+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        fh=4oi6bltJslLmL3bwa5O2mmrtuSPWkevZQF5VRZsPpDY=;
        b=Is3hqZdouliKVBwOZrN054s+281Sh8W9tQU9zfPpU9gXqPK4dnnfQOZB+R95If8Nzw
         8yqIkt2ae2nlE1+o9u4aZ8+ohXdkNrATOU2ygBrHE/iu2Nf0+VdLlNcpFfE13cNlMU9Q
         YXm0tLHpvIOEti7mcIAbWCLrt1nWnyWVtilIai/oGPzTRSAwHSZubiORhm16rJTnYr1B
         ElTwnqDxIjgKOicKmlkMTtyvtDOUKFEmOOffkRhCJztxNT3++/s3VnLMDXtz9a4xgphR
         qONbP0PnxORpw7TzjzW5ZWXdIdBscnDEmyKBWiKt8UE8ENeQVRN7aaO83nw5jh7LoCj5
         al8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028383; x=1792633183; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        b=JoSkePzArueMo2xxyDqdUWMQBx1Nhe2psQVqI73zvZJ5U9e5RCeoarfuwwXLt98fXk
         rApwD1pLu/yyvppUVd+OxCZTMvQVKHABxYu/Y5mmP8LQPELeqoVlYXLlgkPquSr3xR89
         g22baMdxcnfF55QSLiuK0C5/NFP5abSRmOdQ0ZIXRn7LpqaY0mEhPD9yQKVZFBAN92LE
         zbQLVSCqvCcaxnGknKcLGwMNN4uZPAli/yPnmZWehuV9dOC0ttlR7oFM92IdA2QrERtf
         e0DRoPPoq+rsI5UXCjCqzuhq4uHLwA27BYez0SieAhQLPNNaF03jPj4Gt1LmrDdtFu0W
         evMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028383; x=1792633183;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        b=miqWj+nVXauMeNYHay/Vut3aa4eqHehqm6awk5upiWIcl+0AJfBcRm9IVcdhFshM7t
         gBCcwmMTmpG2cKrFh9lXDIJXUC85WTm8e79vurW63l2TpjeMhlWfvMWDpt0BYOlbpDXO
         MVFe4wFTz/JhkAN53xXynB5pTn2jmJwaCz42nHyrbMRuEKbTyhmT303N04V7RB40PTiq
         SscvMnJ1cC1DhVBE7DmqzU1CiZp7C+cFNoFnVpGUGoCc2lvf9t3bdV+RdOWvsg0/W5ok
         3qmcxQ4Khd7e6OvRxrmG8UktY7+4DiRmG3EQtbD3JK+yQl9kaRALTKeUhhF6YLDa26wH
         Cw5w==
X-Forwarded-Encrypted: i=1; AKwUvBz9E1eNLw0ggle2vHlRTyp1iK3+MShdoIuktl5uYwONSsNRKGJ00xl2LcMkcz2KB88cBmrDMg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIQOaCCKmB20Fa3CILN6nut5vvKk4Y1V7PfbOhThp9KoFUEndS5
	tNYivQ8JX3fm7XaUisE5n/ioUwiZJDoDg1nVg3nsrWc6pK3r/oOJePTvwIm8AqBss6uV8sAzW46
	9lngqJY0AngXucDxcwa0p39D8M9PX2RA=
X-Gm-Gg: AYBFou2JTuhEciEvYpYSUFkOc7iOvYPa9sEJc2sGtNZ8nRQTfe6WwYV5WhfeNkfQULw
	OldBKD4I0LEOx8oSNldVfY3l7T2UtU7KSJXIw+2BmmOHAihkKBq5nWlL0cF6fPnyJ03MHO5DfAP
	6W/X45RwKUCnhvA3Ota9J0V37TS40WHcAXm2MwWdkL3M/rl1VgvICSfWT8PWvspEgC2kIyJ+P/J
	78XI4Hd1yaPLDORK3Awo6qshEIqDUVnkWShJiMgvjFNrxzk0lcOoZ2F9DW2Uu58CXNVIBHa4E71
	pIxnvgNbzGZaKEYoi94FG9H6/77aivcK732/j3JJhOPMRDMabA4tpDuIGEXY396U1XhyNfzKK+v
	99g/v9yABB5BbTPCoLDjnkPdHsKODsWC5gl0iMa3BhGNT0aEheWLhV3MjtDRvSqo1bKU=
X-Received: by 2002:a17:90b:4acc:b0:3a0:e1f7:9b04 with SMTP id
 98e67ed59e1d1-3ab3a60ac9amr16312045a91.12.1792028382966; Wed, 14 Oct 2026
 18:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
 <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nG-YJZEdj6pVD-gbGU6J2EfRMQYsKd7u0UTgfrWOyAPXA@mail.gmail.com>
 <87qzhtyxw6.wl-kuninori.morimoto.gx@renesas.com> <3a6759c7-84bc-46ff-93f1-965c7e8dd4d0@tuxon.dev>
In-Reply-To: <3a6759c7-84bc-46ff-93f1-965c7e8dd4d0@tuxon.dev>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 15 Oct 2026 08:39:29 +0700
X-Gm-Features: AclHuK8C1u90VDPCucQhY3afyuLfcxP0SCIJrlA3M2hLxVwcjMsqinLCGr2nhSI
Message-ID: <CAABR9nFA5p=5hnMoxFHLtmGEj4kvfrN6M6UFPnm9hRQv_CAP6Q@mail.gmail.com>
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
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

Hi Claudiu, Morimoto-san,

> >
> >> For rz-ssi: in DMA mode, the driver registers the generic dmaengine
> >> PCM component, whose .open callback already applies the integer
> >> PERIODS constraint via snd_dmaengine_pcm_open().
> >>
> >> Could we drop rz_ssi_pcm_open_dma() instead, and keep the return
> >> value fix only for rz_ssi_pcm_open_pio()?
> >
> > It seems fine, but I don't know detail of rz-ssi.
> > Claudiu, what do you think ?
>
> That should work. I'll test v2 once it's out.
>

Thanks for your help and feedback. I'll send v2 now.

Best regards,
Phuc
