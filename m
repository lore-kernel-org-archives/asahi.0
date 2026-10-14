Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199594BF924
	for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978160; cv=pass; b=gXAjKIqE1IuyyBJCDn5GV/Vk2eMHELOnnE1cY54vy6Aewmu3xlCIxhEip/630Svdh3/lrTRL99QPzFwBf/+rYmmGI3iHIu067arcV35Wj3kHz1ax2yH+SJ80UcalDolyyTOSVmDpqca94UUIMV4tvdVZkbM4jAKO9AJWdaYzb2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978160; c=relaxed/simple;
	bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGX2VCcy7fvW9yUTOFRAcxwrNKUBvG+xBqK4xC9mmu2xNG04vOvIVcmZQ22Yaz9MB7VagagtG5/zyrIX2dVx5Xyl0OuFD2wVCL+N19DYSNsevxPxIVL6H6VT5bvZkW5Xn/xLurAMkWyNN/SY8eRROoNWaOIFYdq5yNbwR+v3lEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9gU2yB4; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9gU2yB4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e812e2b31bso22118235ad.3
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 04:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791978158; cv=none;
        d=google.com; s=arc-20260327;
        b=j5WtqXWGpGdCmdkuHWZJuz6S3iiXALsSa/NVQ+ITr0i9G52TphbSR/k8agi31sD7vc
         L2g27NQqyybeIn48U2m9DgFIshq1vfi8JnL7AwJn4apBz+Ef7Yo4gnoDoCk6OphI3HzI
         l0fh59gL5lV+6g4brICxTZwEr7GM9sqmjTvGJrP+ukT9vHf55RI3/r2dA/L2A6UUeXou
         wse9Ufw/tISbm36XY54sP/KiQcMRj9I60rJx067nY2p5B/f8VBXiixxwUPH+Ef4Olg5X
         FeY/l/mVXv7t3B18//5pyQhQJTfy09AWNMqvJTUgS17rBlzdYWgmwB0fH+QpS/fV90DA
         9xqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        fh=grXDqNphjib1x0PouVGrw4iQG91rpxzZb1RJolHHCfg=;
        b=B4EfQ4C9ZMOFBS27jes4hQy6FFe7RdvHinEf9p8Y9RlP1e68/tgMe39qbdSo6wLObr
         CTBfW4cmBRjXC+QAA/3j9ZaSUHtOhoozHKdiTRkbt6iQlbdqorjkC7kz2j7+x7oo4+EL
         VU9pvAxTci1HsIQ7bXBmBUJqJd663h2F8cKSnhrK9DSB5eEJd/vkjLP2nqydnbknG5yO
         fK2wUlayV6NlBZw2XyBadk03hcrjFHwpGpt9zSC2Yqv+QYisSiMVSoa1F0f93lc2Ht33
         wG2XiTrU57VAt/LqqqyJLvYwby90rjTDMvjpm+RZbdbqxztWRl/EggpjLfXx7c8Bc934
         P5YQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791978158; x=1792582958; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        b=I9gU2yB4q1JUABIIm2OW/CrBdDgu4X6mdHbetIMDODTFlbBhd+3Zb7hWC61kR3sg1a
         KI63QcpebwYICqg4cG5BAl5IdxnorPquIUer3mmFlXifpzvR2EgzmBNx/ctMcAMLUEFa
         jiJbdsg2Xd22ymuFlD86w0lzecTUEQ4WglBQnJTN1kQuaUbFhRlOUiaC4sjLyYfBlD7Z
         D95FX03VKeNjPOBvhYM15u+kqg6A0ESyerWid4ubQAnCiS9vJsyL86ZKvfPzPwRowTg5
         0VKQRdMgqwDmFB/QXY5GYHl64Eu1CCcHmuDE/TPJJdQSlFsUyigDg7SrJfkuZr8XKiKL
         7VPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978158; x=1792582958;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        b=o9hU+uDjCb7HBG1Bfa9ubjtwgINsXerdeGJcf84RfrTWW+8G1+GyFoLgbSSx9GjFuB
         WlZ4VraIxGEnCCwVlddWSTFJupWsQhEnfLL8uBNug8Hm1wXrGZH2v0yej1OWC5OzyL/I
         SdsVPLIM5IVpAcoPoi9RUjjgLyNuocZmS2gUng/Y6EhgdEsP1lj2mjGQOr+PT4HkAeOv
         /K++GepNnOc9GmzFTCXg5gwqS1fG4y8UXp/lfVQPIAGJHUzFN0rduA0DkVW2Z3PrHK6I
         oAeZLO6I4C8vnudk2ZdS7nxjpYQZ8mItBe3Qbrwaeju0f07FauOV2pukiI6hxExrU6dc
         09Uw==
X-Forwarded-Encrypted: i=1; AKwUvBwYJEsbaKQAdpfCVjBdzi/zjW31a1L7lv0EHR5XR6frERrVoxSt09s8m6+dj88KL0FoduLxaA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJITRPMxEJ+vBtpq7DZhGCLYPmkEU4c14CWGZTOFiq6aCKCwTyV
	XRBd81IK4XgOpeGFh3ckZ0ENWZkCLSr3GvoCZnMz2CqxXEub9WL9JTChfFLklzFWaY8CTz2PXEU
	l1W66mQYAfDvZZpN+t/gYfKd8d3NcVS0=
X-Gm-Gg: AYBFou2gCdt5L1Qt7TXu1iQJOi4PWM+qwb/NPM/qzlOGnONMmWBKwqMKxM7kY46VbHw
	rSGUNElPgUZFeMQkbSln2lpxP38wKyQk1g0QVvaNjYRd7B8sR0/sT5nSuto/9DetUp6oxNMOugK
	ibx0MiBAWtQrmoVNlC8Wbm/W/aamHmjD4mItJmYFOaCsh7GEsxCH0SZMHXN1yWZiAd5gQ9SCMTs
	OfyueV3PfwbtUxdxhWC8WD76aCcpoVGEetgNts9BdFT8GQq96xmczA2qg/8YA6jVvlarHOYCiTd
	0GLT9MxrSiKo8SCGAzRDPHe7tYkEfbhHr128QxavUFdLR/jAr6z5HWPDUEbPaLyS4PeEA0Pl6EM
	g/JXK2ozTo0En6wjklvrTwohH6LlxcAczveOlP/5nRBm7sVAlOAACicUQ9e+cl8pr0uQ=
X-Received: by 2002:a17:902:db0b:b0:2db:3b35:1ac6 with SMTP id
 d9443c01a7336-2e8427efd9dmr151731365ad.5.1791978158291; Wed, 14 Oct 2026
 04:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-19-phucduc.bui@gmail.com> <14bbf027-4a16-4bac-b530-d4654ed38d4a@gmail.com>
In-Reply-To: <14bbf027-4a16-4bac-b530-d4654ed38d4a@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 18:42:26 +0700
X-Gm-Features: AclHuK--pm1YXW-dAVCk4mePmFKUqLdOhzguEaV2jSOsxf_MJ7HFDWxjeVZGb_U
Message-ID: <CAABR9nHyso5GHpc5Gg-KLF3hJkCHQCYz_mK_i3_0fWDEimLEtw@mail.gmail.com>
Subject: Re: [PATCH 18/24] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close()
 being skipped on rollback
To: Chancel Liu <chancel.liu@gmail.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
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
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Liu,


>
> Reviewed-by: Chancel Liu <chancel.liu@gmail.com>
>

Thank you for your review.

Best regards,
Phuc
