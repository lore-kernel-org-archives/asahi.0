Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A44A253DE;
	Mon, 17 Jul 2023 16:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9DF3C433CA;
	Mon, 17 Jul 2023 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689609783;
	bh=aZICCOVfKf1PqTHgRCOupCS9EkykRJONrhoP14RlBbY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u9qcGdu2hQm4MUz7+RSnzRd6HW4caA+Q8n7HyFS6wT9cyGnC7rtzLwKrRzMH8GBaB
	 0ltb480a8fpNIUjcQb0t6f4BzCIUQqGFko0ozptmlOIlQd0aPhSCDzl7fML/jE8eao
	 DvHqaE4NHpxdEVvix8NLdokkVt/NutsW3eFTLa4xP/ja3cqSHqFZj4RA6J5fRTw+mN
	 M5YONYDw1e52hiAIwhF5YkPUzbXIm+w2V5k5YjRLXlbT4jMhM+KWHo2BzfzW35bF2Q
	 oZXj9j4D2MROP+j69VpFb0pPlf7cXuNHnSe99U4Aam5XsqG6w0lbYMMuhENIRLnSqb
	 YYlZN94wG13jg==
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fbdfda88f4so42255145e9.1;
        Mon, 17 Jul 2023 09:03:03 -0700 (PDT)
X-Gm-Message-State: ABy/qLYxVYvZM/PnoCJcLRMlwo8RUVnZ8j1lp/hLyLQZ4lbYobvg7ndh
	manaJWF+UES+4sGuDAHCkx9xwqJKirkSea1fyA==
X-Google-Smtp-Source: APBJJlGT3Z4OwG+5PD2iOuBmukBKYkwOVI4cYi2ZBHphRuP2mDYunFyhxEBn+UEFg93NJOzQaxqKN1Nt2m8NdZz6Fm0=
X-Received: by 2002:a2e:9455:0:b0:2b4:6f0c:4760 with SMTP id
 o21-20020a2e9455000000b002b46f0c4760mr8630130ljh.11.1689609761393; Mon, 17
 Jul 2023 09:02:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230714174430.4054533-1-robh@kernel.org>
In-Reply-To: <20230714174430.4054533-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 10:02:28 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+qcoFd7_wWUZeHgqWpB0JfdE0j4qLCxfJwD_Cqkz-HgA@mail.gmail.com>
Message-ID: <CAL_Jsq+qcoFd7_wWUZeHgqWpB0JfdE0j4qLCxfJwD_Cqkz-HgA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: Explicitly include correct DT includes
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Vinod Koul <vkoul@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Paul Cercueil <paul@crapouillou.net>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Sinan Kaya <okaya@kernel.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 11:44=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/dma/apple-admac.c                      | 3 ++-
>  drivers/dma/at_hdmac.c                         | 2 +-
>  drivers/dma/bcm-sba-raid.c                     | 4 +++-
>  drivers/dma/bestcomm/bestcomm.c                | 4 +---

v2 coming for this:

>> drivers/dma/bestcomm/bestcomm.
c:80:13: error: call to undeclared function 'irq_of_parse_and_map';
ISO C99 and later do not support implicit function declarations
[-Wimplicit-function-declaration]
      80 |         tsk->irq =3D irq_of_parse_and_map(bcom_eng->ofnode,
tsk->tasknum);
         |                    ^
>> drivers/dma/bestcomm/bestcomm.c:105:4: error: call to undeclared functio=
n 'irq_dispose_mapping'; ISO C99 and later do not support implicit function=
 declarations [-Wimplicit-function-declaration]
     105 |                         irq_dispose_mapping(tsk->irq);
         |                         ^
   drivers/dma/bestcomm/bestcomm.c:128:2: error: call to undeclared
function 'irq_dispose_mapping'; ISO C99 and later do not support
implicit function declarations [-Wimplicit-function-declaration]
     128 |         irq_dispose_mapping(tsk->irq);
         |         ^
   3 errors generated.
