Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928FB53D9C9
	for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791991350; cv=none; b=l2aaMpuVV0Avmcwbl0Ze1g11KVHjkU2AU9kC7JWYHWfbDD1qEqonELsKr6bYdNj8ZawGHf5OYSu8h5wNPMKUWJ1iZiDznDmpyA2yeLe9XFMhHwfZsZ5+nqLumWnCP7Ism1ZfTT71lfzTI9br87dUMSEY+TVETMUi1655MfcUmXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791991350; c=relaxed/simple;
	bh=OJYOG4YSV0pLaaOPEwxxy35lIjjZKUEA7jwt74Dr43o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p63UC9igGbGQmw0Pm6y3hRs6CZs2As3Scpoy4uWnKpSoUSUc6H+69/JAXoIVSw76EBQrH+HdVHRhRpoKQAg4qMBlKx1UFNcF2b0+u9NH2qJf6EmAJ8lwTO48SiLk1x8AHkHGNtOEJheTa19QGojFbl9eFX7aUnkI9VNSn6d9Tpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=I4uSknA5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="I4uSknA5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so41219625e9.0
        for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 08:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1791991346; x=1792596146; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Js2yXAKJLVFgb+YsCYrtsAgVcbxI+5CvJwak5knEqR8=;
        b=I4uSknA5Y+frcJP3Cxa4KeJoS2EyUUBSVvnZsn2GnMquv/Fj+GLBMPIrpIPHIiG9Ry
         FwJLyTO/qOMmI8z/Yospv4Oe6r/0tXWbj5C1AjtwsotTtZlhvLYP6ByNGS9WmT0ZXLfu
         WvmSoLGua97HHfh/y3db4F+i87tLq8T9WADGV5h3CgZ3ivcbJQlO3cuQI5HvwF3bXpIf
         cONEEXO1Hjbv6L3uGHS9ol0Y2MpD/JdBUECjGvNK2GOT4CGEgWUEySQXqI+UXIi5EOGI
         q7Pt86WkYr0n3pYn3GdVILVJnvJ3pLAsaZlY3VmF08OffhGUs8lhUpKxJt6wZEbtFbOS
         FEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791991346; x=1792596146;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Js2yXAKJLVFgb+YsCYrtsAgVcbxI+5CvJwak5knEqR8=;
        b=qMXZndTK2VGNOodrFccPNIJLKVEUSxYAFaDJQ0ZKC+5fnn9N3b/XUtP6Wx1WhTzC0u
         Fs9VajjE6nJV9V/Qqc7ctrzrtLQS0GGQD/s0Djy9eBrRIWYSL/+yC9cLw39/GedNdoA3
         gcqRKLI71pMykunt6QkyvZ/1Rm6eEP2Xk/4pBo0LhsCjiLoQ+NJvd3CLONvaJuyw9kbm
         XbD5yXwGmwmNPwY/ph93AmMlnrqo+aYrxh+3oJSGss2ytOwtCo8J34SRgvHrSeahRE2C
         JVyXEt9JiXafE6DjdrEjdoXstzL6hW6TEIMaKlc2v2pUGrOyD4XHSGzisq9Qez8LGUcx
         b7xQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqeW1jZrqhTC6rkzRCroVTVOMFzMEmNnZiVlT3WG/FZppEZPCYkkQeV+qff+mPk6FoImd1Sg==@lists.linux.dev
X-Gm-Message-State: AFq9FYL5QGKyKWFtxgI2PsdrB6L4ayfxsA8tbocBvaq++V6maEC9/Tm6
	BVB0oKQRJFRBlY56CmPJqPeGT86VCnwrSUhA3prtEJBeAbn9U2FZmwIqkOWPYQFFWp0=
X-Gm-Gg: AYBFou1PNfw3wgg7ouAZfHGqH0ibxqVR73uQJ7FKGu5ZcxvetFGFPuQnOlnSGY7VQK1
	D+bvRkdiZsiru/n44plKfSL/43mrMQ0AHxyuyMtNA9zV+sY7c0pVo2cIgSOxrKeucvHpRmftp1g
	SghmnSh4lrhOecQ91hOMsDzmIgboTNJKl/f+OwZALuQMbt2NpKwRtSBqH3g1GxzfpQ4pEMMY6EU
	dSYB0wb12jNCuOa7IeNKnRYcRXN92BEu5qf2EqYRM8T7srAaiGdwh0Unk/nUQp4OKCfRxXdG2i3
	Sy2H7Q74ckEJeV27/s+eSWnYPD/ALIEjlI2bpoHDJeFUNfZE9qLor6l9iOAco9d7DPi/06YVbwc
	zfu7XSaQXS7LsFjuCw/QTywzhBl1AwLS+4v5F8js061GfmiLxDkr6JYFW6AKxvaUGhgdHMdQF5j
	R6A9icvbNBAJSKspLvNF23RUp0g1QlD4cW0mh37UXEQtgEBUFUE1ET5u0sY/N8lZznm0q45+CYo
	JqF8lQ=
X-Received: by 2002:a05:600c:3507:b0:4a1:afcd:3919 with SMTP id 5b1f17b1804b1-4a1afcd393emr93408495e9.7.1791991346614;
        Wed, 14 Oct 2026 08:22:26 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd67502asm974715e9.3.2026.10.14.08.22.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 08:22:25 -0700 (PDT)
Message-ID: <3a6759c7-84bc-46ff-93f1-965c7e8dd4d0@tuxon.dev>
Date: Wed, 14 Oct 2026 18:22:21 +0300
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Bui Duc Phuc <phucduc.bui@gmail.com>,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
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
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>, Kees Cook <kees@kernel.org>,
 Syed Saba Kareem <syed.sabakareem@amd.com>,
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
 <20261008103831.542533-22-phucduc.bui@gmail.com>
 <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
 <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nG-YJZEdj6pVD-gbGU6J2EfRMQYsKd7u0UTgfrWOyAPXA@mail.gmail.com>
 <87qzhtyxw6.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <87qzhtyxw6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Morimoto-san, Bui,

On 10/14/26 02:38, Kuninori Morimoto wrote:
> 
> Hi Bui, Claudiu
> 
>> For rz-ssi: in DMA mode, the driver registers the generic dmaengine
>> PCM component, whose .open callback already applies the integer
>> PERIODS constraint via snd_dmaengine_pcm_open().
>>
>> Could we drop rz_ssi_pcm_open_dma() instead, and keep the return
>> value fix only for rz_ssi_pcm_open_pio()?
> 
> It seems fine, but I don't know detail of rz-ssi.
> Claudiu, what do you think ?

That should work. I'll test v2 once it's out.

Thank you,
Claudiu
