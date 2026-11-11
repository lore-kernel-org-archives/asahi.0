Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794378658;
	b=mnPFCZ6iaQjyj86A2BF7FWjsir3VH9SfcGiicvJh6ssdSWTSvzLkm31zuOcShiDvFyku
	 2IZ9WtpSU+Qq+FFC0RzKOry4jerwqUM/hkxjoWkxkAfC2Hr+w40eWVaI+oFJWPhTFUK/z
	 hnLGmr/iSz2quL1whZ3jKMFMC8WZ/9kKX2qBzUe6iuq5aNCA1hbOtSNK/YHaVVbrRNs19
	 gr2pWwb3jwkHfX26piuoVLCONJ4lGk4KItl+Q261Z5+1pFgnVaviezQY5rDGxGgxf0mBm
	 RfdmsNNfl6gxYj5XN/s8wF/m1cU6aCYPiQeWmz/0loQ5XrHOJ58HWg8bxfAxHez5tRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
	b=b5s1Sp5NMjaYik1PSNkXMD4cxyMsHNoS3afV8YAZDFPFlK2fbC1wFejXMFZlWNIGFtms
	 hdOOzXxfvEnzZn2/ZW2CRk8vsuMFVDlvMX6R4myTNZQAufdBNolPc0vabZtGNtA5bu2Ft
	 /aZxjdqKIjL2S5FyUoG5bbOR3vnzfVfS5AvB5wQQfErd7S4xHTItjRlzOlnVcG/qse3VF
	 xx7tXg0ndKPrk5R/vSR7q1NBmIFukSTjrLncb2MQElx+lXEqt6S6o9U7GLmo8CzqwSaOV
	 xGFXaWrgAiorJzcqZi6YnQIaXiDQFQ52JqaE7jC+tKIxvssclAVvqxSrH3k8NcUw/2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itVgzFw2;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D43606A326
	for <asahi@lists.linux.dev>; Wed, 11 Nov 2026 06:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D43606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=itVgzFw2
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso2661161e87.3
        for <asahi@lists.linux.dev>; Tue, 10 Nov 2026 22:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794378656; x=1794983456; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
        b=itVgzFw2YGR6mlkCiSze60k/QRsT29lzwxytEXtHg/MbD3G+2M3s5jsYlqMN3g7pI0
         QtmRkYbTBMXbcVxSbV6IBxh2zYi5hTbD7LX55QkoQNWuslsGvhTXlM2FWwqcbiCqvK//
         fzwIRbMuJkZQk4bEIXbSMLKg+jurluarMHRrcCwB89+voUv+PenTDqwFSdf1H5Qv7X0l
         daCyEHhkwJZrDHjNZ4NcUj/rxtFhVeHBDzRuFZjd7qwOja09V7DHcHkVuos9UAZBf7xR
         qAVfPAFjJ1lzFWdf6KJ/qAxpWP33Lw+rhLJrZCZCt82SQ/S4VYTxd9MbH1xGgSO79HwR
         3JYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794378656; x=1794983456;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UkJcxjLHhm0Y+CDL9JRRl5rrZMoXUbMeNekZv0BizMY=;
        b=oLXOMctg3i7dGxKSyiGuPwzHRgipg1Z6KI+OkmoRxmF6cWdHzabmDLTBtjkygC5trG
         gzRXxoAZ+TXdauJoiiRw6y2A2/E6B5hoxwnjQ/WhfixKgfNAynZXTDRqI+Udn1yDNnIA
         RN6vhxQD8QUTrbHmFKnZ53zVK1snWN/1iyDjk2tENwnWtRW/MakPozQaCV4o+9dwg64z
         /+j/3PJtZtVJMZIiEbXAPlbsD9uRhm5FHkup8vVmhT6+tGEbMs0WZx4dBcHdbbXzzYGu
         6ACTVllxIwhS5XJaSh3O2xbjMNG6jrir5qVUSNr+jLn+GgsnSmh2ujoJ2ucWbQyeg+LY
         S2kw==
X-Forwarded-Encrypted: i=1; AL+hErFyZW/tc/L7aP+iN8KvUR1OlnAwf2oojVXkvvVLLqFYTte93eP8OnkKqRvl+vsZit6P/R9tlg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Sa4/MZXJCnX8B0fR+1aaraLEuM3n3rktjV1Mil9O4VyunMsC6
	/hoPTQ9pQCTlpkXWvLSQDHfLSXK34g4eFw2/JRKmsWocd3PXGyCfJ0M3
X-Gm-Gg: AYBFou3bQACqR4MQsPc0PxXXDzvYGHpnxrXkhPg/XXDwE6osJC/0DYkfBB9Y1pHl6+/
	LTT3I4DEjNjNn+1pYfZktTRTmIuIV/9bh/feKQmovSIJ0rNnzIx4/xt0TMWtL2UnNmow1FJo8TN
	hxJp4AThVEuZKEA6h5RzpCnl4vV/0ETulA/+jMD5kvBE3kclrO8sEDZXkOuclHlLUYXKlpSx4o8
	1sx7kKxdQV4C2T0iiSnEbIwMFxlBms1Jgt/4twCI6Adb6yhlPVnrFlaHIyRZEq9lklQZ7vkwFrl
	c1YogJkWV+up5ivd4a5jq2m9mqBuiaI222R+b1Nw3eo+m5E98TrAjUsvOqRw87MhwGg1zPPLoIo
	CUnoy5Rf6Q7fENqC+kD/XWMLydJ2E4FrigDlPJoluf9nQvvvSygMr8Sz7TUsY+39uKzmP+VWF7Q
	V2Jf1H2oK74ajcSjkMVKGddryie078JEVm5mUsMzgtuOhUHWWDEAtGNJzmGGYsDPAB9hppg7yoB
	zwBe12qAMe+1V8OYqb4ZFjOf3Np3FZolfxAnaRZfeHoz5GgDRBSLuNsXYUL01RefK+GNAHxXHCh
	cOhhiewyfNhEklJ76nG5MEJsia4OlJfyYTnTRM1CwX6IlhH7NkVsL8M/zmGuq+LoBttMk8TQVP3
	ze7haJMSLuQ==
X-Received: by 2002:ac2:51ce:0:b0:5c1:5974:8a54 with SMTP id 2adb3069b0e04-5c15d545536mr529421e87.5.1794378655623;
        Tue, 10 Nov 2026 22:30:55 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb7529sm811767e87.66.2026.11.10.22.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 22:30:54 -0800 (PST)
Message-ID: <0a520efd-ac3a-47bc-b37b-11df8263fb5f@gmail.com>
Date: Wed, 11 Nov 2026 08:30:51 +0200
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 19/20] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>, Lee Jones <lee@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter
 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org
References: <cover.1794347059.git.u.kleine-koenig@baylibre.com>
 <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <2cd7c4695edff6b711f8c77ae468d295bb910cdb.1794347059.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/11/2026 23:54, Uwe Kleine-König (The Capable Hub) wrote:
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
> 
>   - no comma after the list terminator;
>   - a comma after an initializer if (and only if) the closing } is not
>     directly following;
>   - no explicit zeros in the list terminator;
>   - a space after an opening { and before a closing }, a single space in
>     the list terminator;
> 
> Adapt the offenders accordingly.
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org> # for Maxim MAX77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> # max7360
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>


-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
