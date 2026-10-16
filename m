Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C34E479889
	for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792149971; cv=pass; b=IgiNYdPbqF2ilC86N4k9Vt2F0i2Qw2m+b7d7yZn7CtPLWlJ+uOwRnC5942fymdio7L5Qxrm5oLAVi9EM7WYIAkLbGc9MDLGPY4O8Quebb0C15cxsAEtyOq/QVPtqZYyHsHD6m8u3p45LbiuCndWlNyih94Zi59i2GXHTYetuyNY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792149971; c=relaxed/simple;
	bh=R7fc9o/O4yqhA3W/kJmDsBhaIBU4bJflgTG28U+KE44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEkN45gGdlseiVrYi2UEoCDgVjw4JBWk7kJ3dREJ4kV5Uu7Y4w/QbP1274eQsGrPUnVT35Q1/7z6umW4naaeSl95B4cLqG3m81rQBY/N/NFHpTIGCvmdkc7eLR7UL1oj+H4JaHUc6eiuzlzbifcmboMBiC/iPCFh1WPyplEHMxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UG2+dOpU; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UG2+dOpU"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2df8c28a0b1so28461715ad.1
        for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 04:26:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792149968; cv=none;
        d=google.com; s=arc-20260327;
        b=QPPRH34t1B0jght2u8o5r8UqrVHwxf7RKhjJMahZekGf0XarMHjiE+7b4mANd5ZCwF
         65MA4UnfVPViRg33c2Wsl52UPTQtHVqPIKuNRPwc7wSew1A8L2ulXAOH1yc+FUwk5JSi
         TgAeV/6g7ZSF0LE3PYs0do/QL0qyvM8HaZeTAjXs8xPg7C1jRJiNFge3xNC1fho9L/cJ
         AVx1wmbJYzxNzD03eBJolZhM+HgGixZkn4y0N4bS5T/t1eEfkO2LwpNaBMNbq6SDEtVz
         lZLoa+RLaCa+5Ea0VaHaAZl92mZdE6OMGps0VRkQ0HaFhWShttc0zIQztKtnD4BfcmSs
         hj8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        fh=qNZBnlMf02tU/oe8XHNn/Mh/h8px5cPzBW/Z/xFyDWg=;
        b=EszT1GNWexDpfdHzyR3Skf4NneodWgDYWNBQteHwAhmTGx+POyIvcQM9XvfKPmgA7r
         IohwOxBCkY3sjxNn2LGg/5q+ggLv1LPy70UmEqfdSi528HL2koOSG/oqMdr6V2hc7LXQ
         qp18atKSVG5aoN7jH77j63NIHEcy0/NEo1Pmyq3/PoWArPvMhgMlpzbK2Tv1GHFK9apw
         rQWeSoB6DY1V9qbQV2NLbO+L2gTTBHtTuQW0Smr7wO3kbdwORuKnY4f9jMZNicG4nP+K
         AUYBiYh5c7BKF/ktjDGyiT2yEo8no25+rOP7P25G5DiQS8KtUlMonWS01XCSsv4rJmHV
         Kpwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792149968; x=1792754768; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        b=UG2+dOpU/PQfOESHhp7MjaPbDCmVW0bFq7RfGA7rFl/VKHOpRiaHkezgJR1NIwv1Ub
         eCngxcNIv8r0emkd/CXi2O7IAyT/N8QknSIRb7nNMtT2Ryc06EuqSN87uuyeyW6zToaz
         EnIZybD5vdKa8ve2Dy9421nMH4HO3SdCi9jC8YwLTbieSAzp+eLjVy8tPd9AWzbic4Qm
         At9aD4YfWc0SdYS/BgSdcBc/az7P53ztUyjeCnGwoPUQYRnzsn+pdIUDggQ8G3tfkzV2
         B1PGPfIf9FSPIxSBYW8BMf8NGFu5mppJDFX97dwshzayVZO4ufGYHHxBcjvtQa6dCYO2
         sdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792149968; x=1792754768;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vApPRxEqpGQADna5mwyiV+wtnRS+6fLHQ7GBxAw9kX8=;
        b=fTEuEwuK7bVTK2R4glxCpCWJKgaE9EodD3TBHueQUX2QiKL2LCda4yTWCzhc4jOdQW
         /v+nGrkdVlmqffIM9H9JTmVby55X7jkSjWjc1T+aokeHeB3O48zZK1JQVNYMma2EBQHd
         INmz4ismcqLtjqeQ2xwhI8MXsoh7azcLx4YXV6/UkCMXXNfU22mJho/vOQDYENrKWNg+
         ybcbSjMwzes138VXoXPGeBuIrAKPPlVLwpVr4G8hmufZlhWfz78TxYiAUmElYfNtOIMd
         8ZkS4Yy9faaz/k8VU6BHaO+NTGa1FPqlTCU7CAqyUuTbOWf0RZqFiWbB13vGZgQ/+xUY
         yD8g==
X-Forwarded-Encrypted: i=1; AKwUvBwH3BJ/hgdTu7rleoBBUu1Xj1+15lF+FeHdfKiyprwo2feVoNUKNrqlrFj63KydOBMm5CtFZg==@lists.linux.dev
X-Gm-Message-State: AFq9FYL9w+hnjQNE2sMU9rDKZEyd1TprgeWKT7t/Eo/QY/Ciw4x0nnPm
	4s1QC9u6LFZ396IaleUcO6KPFiBmhgkOSFqkP6VDiM0Hs++6wUQUfWKmVXcis8EZnHXC3DdaOKP
	e+CbPmr0G6AfoDBgMCnPiIAca9BObePQ=
X-Gm-Gg: AYBFou08FhkVl08cZkLNly+OPvOVq6LBtCDluSFd0JXDdIqDZOqcUxQcXWyKeTTA6/I
	fC6VlxLYF3CTfOJrUo6pnmtRD5O+jb0k14HVDaBJfmVqRfeFWWjw6ReIitMLW9zZ5tlecwXmFhQ
	xgzcnngMXstf8JcLGIe3QKQ3NX62zkSdMZIsGDnG9tY8ZST5ceqgpLPQT7i+jaKnLNBUUt7t7vZ
	ssKI1bFKrXFh2gfVy4h7GT2ki01aPGNxTyz0gnrAUkw1W6yq8Op6rbs9tUOfrtgnc9rNlpVDzRt
	cAeQWCRZh1fea5M4V5xTpuDAj32uw5VB0arb2tw0DjLbJOGDCbzL94C8wLxtZZB00ZYukThXHVi
	sotPp7OcHDOFbiFsy42Xn/7N3gyaVNGw/kUCt91zqAoqCBy+/0KlmfxNKK1Rl29lK3k5v
X-Received: by 2002:a17:903:11ce:b0:2e9:4e83:1979 with SMTP id
 d9443c01a7336-2e94e836527mr62789995ad.32.1792149967287; Fri, 16 Oct 2026
 04:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015014324.5569-1-phucduc.bui@gmail.com> <20261016040048.506531-1-phucduc.bui@gmail.com>
 <46a96bc8-2ee7-4c6f-ad8e-94321f8b9630@sirena.org.uk>
In-Reply-To: <46a96bc8-2ee7-4c6f-ad8e-94321f8b9630@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 16 Oct 2026 18:25:56 +0700
X-Gm-Features: AclHuK9bobvuHZz0ZvKJfKfhAJdiG3c7XQlmqU2uHEyUuNfyFRrkKv-rn3SiKZ0
Message-ID: <CAABR9nG8PeQS4GBGwENfHTRBUnroKYQiEu29iztix+py=Arprg@mail.gmail.com>
Subject: Re: [PATCH v2 25/25] ASoC: rockchip: rockchip_max98090: Mark the link
 as started on success
To: Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, povik+lin@cutebit.org, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, 
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

Hi Mark,

> Can you please resubmit this as a separate patch as a new thread without
> the series numbering?  This is really going to mess with the tooling :(
>
> Please don't send new patches in reply to old patches or serieses, this
> makes it harder for both people and tools to understand what is going
> on - it can bury things in mailboxes and make it difficult to keep track
> of what current patches are, both for the new patches and the old ones.
>
> Series numbering only makes sense within a series for ordering, if
> you're sending something separately to a series or a new series then
> preserving the ordering of the series just causes confusion.

Sorry for the inconvenience.

This was patch 25 of v2. I had only managed to send the first 24
patches previously.
Patch 25 failed to send due to an error, so I sent it afterward to
complete the series history.

Link to v2:
https://lore.kernel.org/all/20261015014324.5569-1-phucduc.bui@gmail.com/

Since you had already applied v1, this patch does not necessarily need
to be resubmitted,
so please feel free to ignore it.

Link v1 :
https://lore.kernel.org/all/20261008103831.542533-1-phucduc.bui@gmail.com/

I have also sent the incremental changes in a separate thread, as you requested:

https://lore.kernel.org/all/20261016040946.521195-1-phucduc.bui@gmail.com/

Best regards,
Phuc
