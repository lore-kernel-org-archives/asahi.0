Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F311715
	for <asahi@lists.linux.dev>; Fri, 29 Sep 2023 08:57:47 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso1850076866b.2
        for <asahi@lists.linux.dev>; Fri, 29 Sep 2023 01:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695977866; x=1696582666; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsBQLJ6Ogoic+1/xmfT0u8ONBi3qeWxubxgbbL3TF8o=;
        b=xm0rvKkchFu+6Jvaf2qXoBfOI3X7hrKlEbCcbcDKuSxmEkPfZX5z/s4mLTSoYiJLKz
         WeZJsBtt/AUAzZrcTrxigmw3q4GkbOXM1PTxAHcgtKaKwfpxRG7RdKs++9XIgxBGNgU5
         pUr+DfRKhePRrXPoz70cDb0Qiy5MViTdTGnLw2hNaBOrUdAWAJkdflWVLdx48W8w4PMP
         9WaaNFJLbIHCwkcSwfrEnZt2bwDcmGoh0P8s5BvVLRLRP3LgbhjETjaT5uv1Daomyidv
         bAbMD0LajjW+Bq6gH9GwxO/d13YjqYkK963Gjqawitkifdivoh/N1n1gPPf6lr32/Oki
         PiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695977866; x=1696582666;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsBQLJ6Ogoic+1/xmfT0u8ONBi3qeWxubxgbbL3TF8o=;
        b=jKTAE5+USUd70QqiDrToQCxnIzkdExnlCgvMZn6ldSQrsbVQMhOUhCK/Fg+Fy88HVl
         pd0sd17ibf6sMgMSzjGBLsfpo44n8zIbx72QSUW0HOxnD+c4s02kgnUs4g6tEHeusVqA
         wRsfC/4hNKu4C2hEFHv8LmsJ6e8nY+69FzXS618DantmRkXKRiCLjxTStr3XWIN0G3cj
         nicVhPyOmVkkWlucfe+6iFyPkc0qN00bpnYjGw5VwNsAr0FTImgRqc1nzegIdmm5N3gj
         XqCCy6tq0bCW6ReepsPK378pUXWzUleqHVNJBilN9lm3EQSGKR57rI6JAPh/HQDx7Pic
         RBSA==
X-Gm-Message-State: AOJu0YybdIcKIa/7L2x2XYBECHZJe2+Y6PvnpgswwB1IbuZlxAU3uHOq
	3pDkhfItuYMhiVmbhXazxxRCtg==
X-Google-Smtp-Source: AGHT+IEsrmtSBffKc4/0WejFkmq1arFW3oxGMi3C1GOThUgoHMTSmFySeXvpixD0/kTwmWhaMqbTUQ==
X-Received: by 2002:a17:906:28e:b0:9b2:b749:ff93 with SMTP id 14-20020a170906028e00b009b2b749ff93mr2957352ejf.24.1695977866113;
        Fri, 29 Sep 2023 01:57:46 -0700 (PDT)
Received: from srini-hackbase.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id w27-20020a17090633db00b009a2235ed496sm12339806eja.141.2023.09.29.01.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:57:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Evgeniy Polyakov <zbr@ioremap.net>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-rtc@vger.kernel.org, Michael Walle <michael@walle.cc>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230927204446.4231-1-zajec5@gmail.com>
References: <20230927204446.4231-1-zajec5@gmail.com>
Subject: Re: [PATCH V5] nvmem: add explicit config option to read old
 syntax fixed OF cells
Message-Id: <169597786418.99756.8731565742524355843.b4-ty@linaro.org>
Date: Fri, 29 Sep 2023 09:57:44 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2


On Wed, 27 Sep 2023 22:44:46 +0200, Rafał Miłecki wrote:
> Binding for fixed NVMEM cells defined directly as NVMEM device subnodes
> has been deprecated. It has been replaced by the "fixed-layout" NVMEM
> layout binding.
> 
> New syntax is meant to be clearer and should help avoiding imprecise
> bindings.
> 
> [...]

Applied, thanks!

[1/1] nvmem: add explicit config option to read old syntax fixed OF cells
      commit: ee73a9fae540adbb432bd2854a82409515c7c892

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

