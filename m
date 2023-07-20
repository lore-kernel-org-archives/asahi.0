Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9663218AE4;
	Thu, 20 Jul 2023 14:41:23 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-98377c5d53eso151761866b.0;
        Thu, 20 Jul 2023 07:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689864081; x=1690468881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwRHBU9c5xadzNDMxPmHn7wr/vyd2lyd2aWFINCC4iE=;
        b=IYkSaw2fLykXQ37NjequnMJ89wJMsFWbIVL50S52MQzxYG63+qLDBbKhKOzKcstmwT
         DaVvF46+YFdhnZvP2A/d93w496r8YnDadWvHbA4T3oCiPcNj1sC84g+IGWuhZwf8GUQn
         94IuCvbFlswK4ZwAmHrXsT+8APe6vS3OzdOTj+Unfk4V/O2sFYPaG24DiTAaU0woO16f
         yMkNztL3l//kUK4segexWIMRNNtFZEogs7zloT/Bnio4to1kJAF9HWGeOX9M6y0W1WVO
         bXVSVky/EgyU7/NsBP4QiB84Ru+t6+KTTJasF2ZecHQC7w863ODzrKLuSLCOmFAq7epZ
         FB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689864081; x=1690468881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RwRHBU9c5xadzNDMxPmHn7wr/vyd2lyd2aWFINCC4iE=;
        b=EOQigjd7c9E899e4s+Y08IjG8gwlY0nEYimHMA/pm43Wpw9SOQbenklP+4XoMtShsn
         y9w8fsWDtpNaAeFHRaPQUaxFplgJSdHFSo9y3naCINvkQ5GcMMDgtAMKeZ1KtsNvpy6z
         sdcYYfL1VNdhxqBJpc4ZXBsxwQDBwVT182cng5aGVKWTC9TBQdAfFseO5RshiDn/Ois3
         WE4r3ic6bdZcU1e08K05qMqYKSzruB+07ys0PEa+R2SRXp9Hqj5RDPk7CwB3b1HL1GrV
         hOBmRSiPCmq/4BR+byS/YF82aThKPO38jLGMldfwsAIDqL9xlPua/S2pBeT/+PrzxsPe
         73ag==
X-Gm-Message-State: ABy/qLYZLEkwhg/xnMLaJVWI3/1iY5V8D/p/ExIDHJCAbwU6+ckOLgVo
	x4mCJAhEE83+mZtRXi6ULW4=
X-Google-Smtp-Source: APBJJlHb0tKAQTS3OU1oBfmdDrT4eFmQjBmNHPnnE8cgWVrDPBMDuvkwOC0e1Hj67ZrNMamXYvALYg==
X-Received: by 2002:a17:906:31d2:b0:994:4f08:2bad with SMTP id f18-20020a17090631d200b009944f082badmr5214427ejf.69.1689864081292;
        Thu, 20 Jul 2023 07:41:21 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a5-20020a170906274500b009932337747esm788354ejd.86.2023.07.20.07.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 07:41:20 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Michael Walle <michael@walle.cc>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hammer Hsieh <hammerh0314@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] pwm: Explicitly include correct DT includes
Date: Thu, 20 Jul 2023 16:41:15 +0200
Message-ID: <168986404883.1519829.12505785794624953835.b4-ty@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714174852.4062251-1-robh@kernel.org>
References: <20230714174852.4062251-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 14 Jul 2023 11:48:50 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] pwm: Explicitly include correct DT includes
      commit: 8d171282110fcde89bb4289c4010a15aca5cec95

Best regards,
-- 
Thierry Reding <thierry.reding@gmail.com>
