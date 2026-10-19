Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651334F68AC
	for <asahi@lists.linux.dev>; Mon, 19 Oct 2026 13:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792417029; cv=none; b=jMGImVtVEKZJnACLLz3dGUvD5a33ctGPxPKhUA4Ocg0nsGb2pgNS+xhD5Bh1f7I6Tc9bhmj5lxWtOP0aASSBu8vgTPAJDxxsm83jrS2cZMiw3WbHjzPQ10eDO3JKw5wpsHfDL2xXhHWfB61+55vl1uejvJTRz8MEO6MP7DTrbqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792417029; c=relaxed/simple;
	bh=fwAYS3zcXGkdd+Ibq1n5HFY65n1XJA1GPMTC7CY2epw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UApiJr8QMKM5CkeZMN+HJ2eXjmNEibwwlNprhSpb3tOIxOo4UfoEhigzNsxRLGG3p8NR2sNvurXeHzgFhAvnNaqHD81ZDKiy4ZUADFkKdKxbN8SittjmG069zMhDmjLNXvNWetDPy6R2SR3otGzEswixjaNbAZdI06jy9FJc9Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=XVlmZmNw; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="XVlmZmNw"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso3043770a12.0
        for <asahi@lists.linux.dev>; Mon, 19 Oct 2026 06:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1792417024; x=1793021824; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kc0HBa20pNgTgn9A/dNG9MRjR4EzrI7cz68avvggZvk=;
        b=XVlmZmNwCZoJspshuxX8JeDZBgNhD3fgFKndZINJvXLZy8KQZ8yZL5ywNKt8I+GnVY
         CcC9hc9nfWJ/li5X0bDTcTBgaPP2LF1MDJG3fQhITjcKt7fZJWTVJaB45wzBTj4kCPh8
         CgCs8II3KFATUNWmlDe8SsgipPOkII+xit/iHp5cQMESvGv7F3MXNzG/YoYzUEHjrGfi
         KWI1IDEr1bepmRk7GDKvYUbqLs7cXukDZpaH6KO9ytQfHi5S7vh0PoMRkmNsYS6zXkXa
         UtQGDd3zxaSu8k2B73nDh1aVRGogtWjIuWZiBjISqUezgEOzcXh0ExLF4vEkaUu07Yqc
         LZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792417024; x=1793021824;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kc0HBa20pNgTgn9A/dNG9MRjR4EzrI7cz68avvggZvk=;
        b=Ukq9SnLZ0+zFcDySvZF4qZMRud/B6PYD82JMeIcBA1SSPCUNbMssKKZGThSGVzfnIl
         SAQxnaR9UswmpEvQP1I3ReEr0LfYmYFcGQVAmb+HaVVjL5Fre9ia1wsafKF8jlzxstH4
         iRPf9l6sHcje88uSH3jz/UsrU8yAj7HuVFyGnQvM5KSeX9hRsBtnHl9rkJoX6fJjfby6
         BpKxyCw2Ub94GiKspGBCh6EoklXjwwIXfdhMmnuHvCX3HL2cPSTtVzXCBzHLQWrPscWq
         BB7aq30OhYecijlSPcpotpH5SI102vGw2TrVBFMDk6q9iXvddEMmeJdDF4F/jeGgFv3J
         bUiw==
X-Forwarded-Encrypted: i=1; AKwUvBxsbMBFkpByvKODefrgrOf145w+MK89c/uboyYd0b+lYsjf8sZpozKJh4wO3bvVgHpV4NoPbg==@lists.linux.dev
X-Gm-Message-State: AFq9FYIS5BsOhbSZDsg4b9qWFc14yvkDXcuia5TDgxiSgHGz/GrjB/0g
	ZrQaIYZtzpTTJmVkvXFwG5Vq9qHbg2LWPtBPZuOhuz2bMGisFIms/W1PvEKoJqZrhYc=
X-Gm-Gg: AYBFou3VV04NB695tpR3L1xD8IhHJeBADcZ2Vd8XrRdnhzo7X/Z74DeKoc19mGRT5ya
	bVOBurdRcUlwD827I2yE3MSaSaeXP//gxpXJgMvEnP4wNwXiteYxr3Ivsx6IZ0Gzu3SRHQS/YBG
	Y4CHAZcMisHUzzLVYQ7OxGd9/6qAaqKRQcOHOqQDb7M9FYbgd3XHi9eawGnn/5dNL1Qy1bttyck
	077bvg1I2O0I1+WdFz8yqTtkGHrwIOLA6LIYjK9AGhxHEExEvD7xQp5JSfujORP3D+f7KDA7RUE
	QuFjxdm96YbVbyM3FTB1ZxQAlT65KmPDBydAwDKV91X0exuvffzniV09Svd/hgHL8EJM+jdd2eD
	xZL4jcnLQ4QAcQkgxlSMzwXsIuCkbMbIxs9XGyamPOaxsG0GtlP7pOCiGVrJvQzA7FKyf+uNX3f
	R9UeX82kenHpPwp38vS9Uf/7c5ufRjLDTuz/pB14etg6MAZui9qybSr3g13gflOn2cHDlm4jzx3
	r8C7Sc=
X-Received: by 2002:a05:6402:5489:b0:6af:8a4b:7aad with SMTP id 4fb4d7f45d1cf-6b3a81a6d00mr4333695a12.28.1792417023411;
        Mon, 19 Oct 2026 06:37:03 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4f5177sm22897379f8f.30.2026.10.19.06.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 06:37:01 -0700 (PDT)
Message-ID: <14f60932-9a85-45ee-ad87-593c20cc116b@tuxon.dev>
Date: Mon, 19 Oct 2026 16:36:57 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] ASoC: renesas: rz-ssi: Remove redundant component
 open callback
To: phucduc.bui@gmail.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 povik+lin@cutebit.org, Andrei Simion <andrei.simion@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>,
 wangdicheng <wangdicheng@kylinos.cn>,
 Chris Bainbridge <chris.bainbridge@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Neo Chang <YLCHANG2@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 u.kleine-koenig@baylibre.com, Pengpeng Hou <pengpeng@iscas.ac.cn>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Hemanth Selam <hemanth.selam@gmail.com>,
 Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Zain Aboobacker <zainaboobacker33@gmail.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>, Bo Shen <voice.shen@atmel.com>,
 Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016040946.521195-1-phucduc.bui@gmail.com>
 <20261016040946.521195-11-phucduc.bui@gmail.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261016040946.521195-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/26 07:09, phucduc.bui@gmail.com wrote:
> From: bui duc phuc<phucduc.bui@gmail.com>
> 
> In DMA mode, the generic dmaengine PCM component already applies
> the integer PERIODS constraint in snd_dmaengine_pcm_open().
> 
> Since rz_ssi_pcm_open_dma() only applies this constraint, remove
> the redundant component .open callback.
> 
> Signed-off-by: bui duc phuc<phucduc.bui@gmail.com>

FTR:

Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Tested-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

