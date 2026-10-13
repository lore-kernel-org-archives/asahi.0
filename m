Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F6448F010
	for <asahi@lists.linux.dev>; Tue, 13 Oct 2026 06:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871478; cv=none; b=scdR+dyVwqMJhIfI8Gw9a5xFZglgQLSABUWZ3VU7/xX7Y66qgWF6nFqH3VAiPUgPPdchzAU5gtOX/5+ybcJHUNy4jg5Dfod9Oy7qYQcFcCTQp6j873VfWDRPSEfT1SNoqBoKgC14s42/Kxr0HhwAB9SodMhlr0ep7WtVUhmgbqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871478; c=relaxed/simple;
	bh=Rjpe9v6RRYU+NG7RT5Zptya1DV0KrnwiYyeVJX03vKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d5MHFlhYamtoMSOeWqewYUQzguJOixpAAx0nJI8n8sFMCUqw6OTeK+hr0BcpbcU5mvbKbhQz6i7V+vNeK272q2z4LmWqP/8gcaa8Ejj9PbfFjCzlDEXi+x5ieTpbxwankAI+UNNFlBwL6SS6Gt3jNvO4LfL0uX6DzUNcq2cyPD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oABVZK/q; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oABVZK/q"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so2048209a91.1
        for <asahi@lists.linux.dev>; Mon, 12 Oct 2026 23:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791871475; x=1792476275; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=acEtVgfuadFdXlisXUuNZxKScLo0hQqEFXfuOZQe1a4=;
        b=oABVZK/qrA524Qx/KmvQq27gtMOohT3+DOCnAINA7mgyHsl+NDfuOcakmM3v+L7U7t
         wlIDDIssPuEMwvOBcvAceXvDFpAQo3vvqIUM7bWE7Z4iwAkEE+gcErhslS1nHQX7kiaY
         1Qy08pg6YPty9pq5cIYQkzyyq2iUqXCreOQTG+g1E10spxkWDkdcQuzeK+ZrFUW3HF87
         Mp+E7KWXF53Rr4drgDwq+mtvwN2RaAi8kZDCe6fIXZNggSItfANJHngG2STQrXBhJR50
         LOSdbBIbhtgYxdxjwsXhA9OoaJF5A5ZgoV+o/pWszCkaJCEmlvVvwb0REe+pV+dwuaq4
         3kbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871475; x=1792476275;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acEtVgfuadFdXlisXUuNZxKScLo0hQqEFXfuOZQe1a4=;
        b=yy99AnJjgtQI2cO5Ob0QGIX8gW5xjjvBoc6I9OUTy8/1ylk89mmTNWUMNvz2dP8TL9
         RUV1ttL9GM5EFCt0vAZZ8sJM5C6NFpEmtskc2xQ+E8GJLLDP1+fqjc9VovFd06xzNVje
         /+5giaIpxmPPLgGxIAOdNj3pIvXLH91JkYbUHpVPq8S4zyq8OljoGboUZb+7UzwhDWov
         5wq1QYPVpOXgpppP3PzGaP7JZ7pV9v5ckutiC970HwRISCDBRmXFC2eRtHLhgQnPUGa5
         JW+xubcSgAv2CbmioRXxdA7SbVSXvWbUflt3SC74MhhBZq1h5EhzSdyT7/cQklgigqSV
         FySQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5stsunOw8iVAV9QoETl4pmP9mx7IMoPKv4FtGzK8lA251wiqWNvwzWYsqjgsY/THkJadKAA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKw+c9BTMWWNo30WikEY0VzXxCjyN5ias7DPoAcPJu3Jt+efFPp
	iIAPyUwH7jQZM4xHt2igjYyPP+9/wcAV3LexGLc1brY5mO04gbJl+21J
X-Gm-Gg: AYBFou1BMLOclROh1NRg+OI3yBZ3fy+VagNdUiBhd7u/lcfDgpQOZuFkqkVjr4eRsP1
	BWcyT+s6GIVHhjOJFblL9tILDFtowJ4wD+i/QHb2ESbnPX2Ra9T6yIpm08uHhjlSUuO8NFjUdTh
	O1L7bH8KIXYgT02X9vl6DQvy1XmIgUJc5HVdVXnG9grR1fPz/JytlTB3+T3hmQNclUtPXstoycR
	JUDOOjpOXo+FlnHSFMiU1tkGP90tMsvUo7j3BFOZHX3YDty8JGYqNgsz6geUmK8YHRKoe9/pn+j
	lgpJVdtINGnI+twCM2wA8ThL5AtnYpOwHHshwfSQpz643Bi2SRw3wkytIgdm2zWyIJ9ZZ5NaEW2
	CY2WABzzwr5H8M+L3bbzIu2P7rQNFZ1AxFeIxwLTiS/ea19SE+8bpktTjkbVA62t4rzgMSc2md/
	B8/+YMMoy5E4okA5tJD9327xBYZDbQlcJt86QHNG7Xf2Uf0ogJdW13/kEyjLkbURwmEvfdUPqJ+
	W9d4p5xqCsai9H4EOQ=
X-Received: by 2002:a17:90b:4d86:b0:3a8:6571:b43f with SMTP id 98e67ed59e1d1-3ab3a9f7f28mr9589394a91.29.1791871475585;
        Mon, 12 Oct 2026 23:04:35 -0700 (PDT)
Received: from [10.25.160.252] ([165.85.154.27])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm23035084a91.11.2026.10.12.23.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:04:34 -0700 (PDT)
Message-ID: <14bbf027-4a16-4bac-b530-d4654ed38d4a@gmail.com>
Date: Tue, 13 Oct 2026 14:04:10 +0800
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/24] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close()
 being skipped on rollback
To: phucduc.bui@gmail.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andrei Simion <andrei.simion@microchip.com>,
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
 Sang-Heon Jeon <ekffu200098@gmail.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>,
 linux-sound@vger.kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-19-phucduc.bui@gmail.com>
Content-Language: en-US
From: Chancel Liu <chancel.liu@gmail.com>
In-Reply-To: <20261008103831.542533-19-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/2026 6:38 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> snd_pcm_hw_constraint_integer() may return 1, which is then returned
> from imx_rpmsg_pcm_open(). ASoC only marks the component as opened
> when .open() returns 0, so .close() can be skipped on rollback.
> 
> Return 0 explicitly on success.
> 
> Fixes: 3c00eceb2a53 ("ASoC: imx-pcm-rpmsg: Add platform driver for audio base on rpmsg")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Chancel Liu <chancel.liu@gmail.com>

Regards,
Chancel Liu
