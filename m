Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21510111A
	for <asahi@lists.linux.dev>; Sun, 19 Mar 2023 10:56:11 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id eh3so36350402edb.11
        for <asahi@lists.linux.dev>; Sun, 19 Mar 2023 03:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679223369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
        b=LoyXTmuTmKGgTLGBo0qYnX6Jp8bEDf17eVvP7XGO2qhfRemxtwJtrRH9Ep1JHhGnQk
         DM7G/ianKOJTy+onrcx5K+rasN1+P/5phdjTikcBfSCvls5VoUEtU19R0HbCgCF7aobg
         40WRU2UHhFcDZODehVDDkwN/snWgAt/4QDmupCFnR47uQEZePsVew0+rLxSDOdDvvAwp
         3JMq8P2tanxmPYuvLeuCmLNfn9yRr7Dfe9NF+r536JdXbCdxebQX1OVjBpyJ7mUDvRMU
         iVtQ2+uN79keOw++o+t+UG4w2ddZnZ5CBm+iLIx5uFLx+Pf3+PRu53Jz68pAER7B1gdw
         MxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679223369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
        b=NwvRf0V5Jndib5gj+ffu7k7oWBmniOOXbig7XHLhIqoLGqbRkxOK4M/PNVkFv8w4lK
         JmrQGtRr4F6FhE+DarmJyi0gpJSSsMlmarCwVgXAcSqWlJPQ/8hIS79h10xSwpx4wMZo
         EaMKgvCABv7ThaSZqVuz//BqoSCZdockbvZHeViEgewSQTy9sxblZNi7k6JhCy9m74ob
         65MmJGl9zlOCW+4/S6CX38rjcqdBvt88Hog2jYzMdK/dTqx80UisD1rXHRarsCYLttTr
         yg2iqFtGLFIgq19QsOSKGdbRloLzXvwf2cP17omeTuTVPMIZn9FnnWA2ZBRVy66UARTV
         BmHw==
X-Gm-Message-State: AO0yUKWwTLBuLmbLVkF339kLmonYKoLdqEpP1AWKkelUlpppakxUs53B
	lWNwNEEp3ODwJiugAhAKHdEXDw==
X-Google-Smtp-Source: AK7set8aBKLZuOSLuGkgBgWSIN+Nyo0cQB4QbrQUYK+fT1WnG6tZns0BtbZAKs7jswp9C0GRLAkphg==
X-Received: by 2002:a17:906:7fc6:b0:923:812c:a5d3 with SMTP id r6-20020a1709067fc600b00923812ca5d3mr5250858ejs.25.1679223369254;
        Sun, 19 Mar 2023 03:56:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id 21-20020a170906319500b008d68d018153sm3115271ejy.23.2023.03.19.03.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 03:56:08 -0700 (PDT)
Message-ID: <23036bfc-cceb-2ac5-85fb-5e2d0bc0cbb5@linaro.org>
Date: Sun, 19 Mar 2023 11:56:05 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20230317233623.3968172-1-robh@kernel.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

