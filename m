Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837FD3590AF
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 09:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950196; cv=none; b=ANvKSZjAkbAvwsZqZRsQDdXSyiteOE2DJdpYPdykvpkjTzZMWh01ZpM9C5opWNM8SGStGNkv0Ghy4FIECtFcWKqAuhT82fjKFOyncn3om1AkILoAZtMqpEUgrVVu8NWseMa4QLkBs3aM6B5ERKttmdz76EbML0ybwJ0Wa4CDakM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950196; c=relaxed/simple;
	bh=E0edNL5B3rP6w3+T0Ub2/VKHaC3rr+HLeEDX8RHsn8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fgbjiTd62RBRbTXxP8ySKTV0bV38A695tKzDrpciPH3L13Mgv5KStCxXHLyZgtAJ2fl0QONn6bCgvtje/adwgC5nZObrIWQCYJITwajony4BG3uCYR0HLs4Uj937ubvpnKqn4kUBYPZBZwfTgQwzOa+LaKcANrk2EZNBwuusHXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-8be92e393f8so309067885a.1
        for <asahi@lists.linux.dev>; Fri, 09 Jan 2026 01:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950193; x=1768554993;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiQ5XxZuQA23XgqzTfwN/M3quzujtTsdQBOQmuJCqAs=;
        b=U+SPk0F8zO35RT3R32oYKda4KpmFjMyrdQQ1dd5oiSoZPNhSr8QDd6t6fjB3vkTMGt
         0CINEXNIrpcIEQ3GJlCX7BmbdizMC0pz+G7WCbUBSzAAsVKOnTfxv7h/eOECvV4ZLk2w
         j6Pj+wOAt1ZOk2Ow9KYJxAErtt7bX3QhELEFV1tryoFRO67+6pYtI5s41w23kvzKDDCv
         jVW64nIkTl+CJbmg9jp06tzBR04YcXbw+hR6QeWrgo33IuMmvy6aRIrtgQ8D9ierwAEf
         V7fepGuX+vyE+aA8Dl/6CohXYXHEAPy6d+xKG9W4L3RfTMQakXmNhRCJyGF/bSvYElWN
         DpBg==
X-Forwarded-Encrypted: i=1; AJvYcCViJNPIhVNer1bU8Ws0bMBjijSIuDYdclq71g9G0CnVkopMWVioZcPjZ8kMfEEkI392BZtVEw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHvdLmDIA0Qm2hhBh1deDf1+tks8zKkL9hNmeUH+SYw/f2w84I
	2V9ZH6sBw/SFrpFTlb1z9qEXUUP1zi5ZRRAgmFlMjay5ZsXEz0YK6k/UNVJqH6pjMdE=
X-Gm-Gg: AY/fxX77fhMF5+fDHRf7MfJAa5dFYGxkOTdz+whlN0HU/t2JmKZkujs+YdizdrEWAY6
	MP1wsqT7Qz+vum7xFtqJzHelgIsYw+XdB5jU04dfE8MfgeLl2hXV+0+bcLtCuACIIPuYOFf9rsO
	YVlpVTREVqS42zHi6T1kKW28HJCfsFvBIg53oPye6vS+I1zA69b4WQ05a0Ea/JMYqsYbmL8dkPF
	iA72DO7/PoRpfWU6QYaYAvmp3bT4kMt/emy+rQ9YpBbP9yXws8VD9zGKts/A0saSHiPg82rSo5j
	96EyZ9r+t5WLHtkAVT2kfN6q7M3rPH1nCVr/R5lRLQR4zfM5Vq9CsAQ2oCr4tgKE2+XszJKXi/P
	/0X/aW4Ydiz4/cWZ+ph0e0MxQxdIrb0NOcsai2DJoXJEDsbg7CQR+A5ZoBmtkSjpIv1r4u5H9ih
	QgfyO7wGZ06/902LC2v2aelzOrmdEx4IdYokqMjXznGzQOJ/2siMkw
X-Google-Smtp-Source: AGHT+IHlZHdmTgwEvyz+ZIKz6BQaOxm88om3Oi7JB/2Mq+CECYaTQGi6LfV1Kfgc00vrPoJvngDdiA==
X-Received: by 2002:a05:620a:4722:b0:8b2:9b48:605b with SMTP id af79cd13be357-8c388b6d6d9mr1191185985a.6.1767950193301;
        Fri, 09 Jan 2026 01:16:33 -0800 (PST)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c38a9244bdsm515451185a.3.2026.01.09.01.16.32
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:16:33 -0800 (PST)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8be92e393f8so309067185a.1
        for <asahi@lists.linux.dev>; Fri, 09 Jan 2026 01:16:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVw2A+zXxuahNCkPL6//wHR3uO4uJiLHywRnovP+EfStFYp7VMx5dkyo4U/uieozhQMPNtsiw==@lists.linux.dev
X-Received: by 2002:a05:6102:2b92:b0:5dd:a0bf:8c89 with SMTP id
 ada2fe7eead31-5ec755c2d49mr4919224137.7.1767949880413; Fri, 09 Jan 2026
 01:11:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260108203004.3538449-1-andriy.shevchenko@linux.intel.com> <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260108203004.3538449-3-andriy.shevchenko@linux.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Jan 2026 10:11:09 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2B9sRmy-k5ucmo6WukvNFq3QqxM0BkB-qS=+-AP4M3Q@mail.gmail.com>
X-Gm-Features: AZwV_QjXHpmtcr0h8pnp_-HCv95C85A8pbrG70DRu5Hp0BWpB8DvCNd7K_eVFa4
Message-ID: <CAMuHMdV2B9sRmy-k5ucmo6WukvNFq3QqxM0BkB-qS=+-AP4M3Q@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] spi: Drop duplicate of_node assignment
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>, 
	Varshini Rajendran <varshini.rajendran@microchip.com>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sunny Luo <sunny.luo@amlogic.com>, 
	Janne Grunau <j@jannau.net>, Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, 
	CL Wang <cl634@andestech.com>, Manikandan Muralidharan <manikandan.m@microchip.com>, 
	David Lechner <dlechner@baylibre.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Jonas Gorski <jonas.gorski@gmail.com>, Hang Zhou <929513338@qq.com>, Jun Guo <jun.guo@cixtech.com>, 
	Philipp Stanner <phasta@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Shiji Yang <yangshiji66@outlook.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Marek <jonathan@marek.ca>, Carlos Song <carlos.song@nxp.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>, 
	Sergio Perez Gonzalez <sperezglz@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Gabor Juhos <j4g8y7@gmail.com>, Md Sadre Alam <quic_mdalam@quicinc.com>, 
	Rosen Penev <rosenp@gmail.com>, Luis de Arquer <luis.dearquer@inertim.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Longbin Li <looong.bin@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
	Alessandro Grassi <alessandro.grassi@mailbox.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Darshan R <rathod.darshan.0896@gmail.com>, Aaron Kling <webgeek1234@gmail.com>, 
	Vishwaroop A <va@nvidia.com>, Haixu Cui <quic_haixcui@quicinc.com>, 
	Darshan Rathod <darshanrathod475@gmail.com>, linux-spi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, asahi@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>, Sven Peter <sven@kernel.org>, 
	Neal Gompa <neal@gompa.dev>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Michael Hennerich <michael.hennerich@analog.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jean-Marie Verdun <verdun@hpe.com>, 
	Nick Hawkins <nick.hawkins@hpe.com>, Yang Shen <shenyang39@huawei.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Lixu Zhang <lixu.zhang@intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Han Xu <han.xu@nxp.com>, 
	Yogesh Gaur <yogeshgaur.83@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Li-hao Kuo <lhjeff911@gmail.com>, 
	Masahisa Kojima <masahisa.kojima@linaro.org>, Jassi Brar <jaswinder.singh@linaro.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Jan 2026 at 21:30, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> The SPI core provides the default of_node for the controller,
> inherited from the actual (parent) device. No need to repeat it
> in the driver.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

>  drivers/spi/spi-rspi.c               | 1 -
>  drivers/spi/spi-sh-hspi.c            | 1 -
>  drivers/spi/spi-sh-msiof.c           | 1 -

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
