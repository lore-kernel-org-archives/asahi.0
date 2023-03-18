Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA35A21;
	Sat, 18 Mar 2023 08:21:08 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id bk32so5445528oib.10;
        Sat, 18 Mar 2023 01:21:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679127667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok0/fcUUjYf3VJvre1cNZ96FcwH4JhSJwBxsOnlRNhc=;
        b=ig5tVYauzWsAih7sx19k1ipmfNhRXUHGW+dCqqUyWsyca2LPPrdJHzfmn8iztbsi3x
         LS/SpbHum1Og5457Vnk6b94WeC9jYitUs5zFImn7UWrIQmk9m7Gga5UCTQt+X4RFfSGe
         QuydMpYsw553Yq3a0n5nIYrBQP2OjlAyexq4v82jJ7I9jHpXWhRJAbwCEdmf4DowIAuz
         P9KGw3AQHsaJ2z8k9jxvcboFVwzyUijQEFs6VpNRFLzyuwyVACQhGJMHH9zXNMazlPxQ
         o8807YiT0MUzEF8UBKoei6Smp+RS2G7hQDNQVz/LLa0ferXQNQ/NImd/PuDFqODLrNSt
         iu8A==
X-Gm-Message-State: AO0yUKW7oApEp5LQLz81X/BICUj5z2VPYXt+d/lAd8irk2vmXDCoLZ7Q
	xyAhPxkHIBjT9SrJcYVGaYIG56DrHvaNww==
X-Google-Smtp-Source: AK7set/Z5ieIO4feRY/3xEp+DDEUIFISFtjj8+3SFPsD7UDRAyCujdZTP5V18A6yRQD7QVXXd6sJOw==
X-Received: by 2002:aca:c082:0:b0:386:c50a:c8fa with SMTP id q124-20020acac082000000b00386c50ac8famr2961699oif.28.1679127666889;
        Sat, 18 Mar 2023 01:21:06 -0700 (PDT)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com. [209.85.160.50])
        by smtp.gmail.com with ESMTPSA id p204-20020acaf1d5000000b003845f4991c7sm1723350oih.11.2023.03.18.01.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 01:21:06 -0700 (PDT)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-17786581fe1so8079812fac.10;
        Sat, 18 Mar 2023 01:21:06 -0700 (PDT)
X-Received: by 2002:a5b:c47:0:b0:b56:1f24:7e9f with SMTP id
 d7-20020a5b0c47000000b00b561f247e9fmr897441ybr.12.1679127645593; Sat, 18 Mar
 2023 01:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 18 Mar 2023 09:20:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8uu=2EZ1dmtY-eGj+ORGdepsKgpNcL7qKfW3FkVJw7g@mail.gmail.com>
Message-ID: <CAMuHMdU8uu=2EZ1dmtY-eGj+ORGdepsKgpNcL7qKfW3FkVJw7g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
	Damien Le Moal <damien.lemoal@wdc.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
	Wells Lu <wellslutw@gmail.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, patches@opensource.cirrus.com, 
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 18, 2023 at 12:37=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  .../devicetree/bindings/pinctrl/renesas,pfc.yaml       |  2 +-
>  .../bindings/pinctrl/renesas,rza1-ports.yaml           |  2 +-
>  .../bindings/pinctrl/renesas,rza2-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/renesas,rzn1-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/renesas,rzv2m-pinctrl.yaml        |  2 +-

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
