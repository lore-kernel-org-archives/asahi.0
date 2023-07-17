Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA63E253DE;
	Mon, 17 Jul 2023 16:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23660C433C7;
	Mon, 17 Jul 2023 16:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689609627;
	bh=dZQcAw1zSoJbieoMVSknj3lKolfzlek5nECTMuXlJTI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kev7TG2o9s8LS1U/OrbHxP2+DikpEYtenqHzdUHa+C5S0uRyXnW5U6HBWbWDoDXQI
	 HGuFTdRhkqm+GwCuyGUiQCrQIBnNUsB43hwdyHSN8YFnaj7h/DGE77zsXN5/+VMP/L
	 YZNJDo3H5Rte1xRxXFxY/vQafP1OutAKGHgMHhaOjddTl8pfPhKoOStSUpOiHr1dKy
	 9Esfh+1CxXaorLzzKihoO8Sl3pYodrhThchtNG/BLLJFkFde3kvadEvySbQHCQTsrX
	 oku76bkYJnNGA5Z2PWzj46Y85htWLlOTNocpmM9fMndXvi310760mH+GIq47ReDgB7
	 lKnqY07zhEUHg==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-993d1f899d7so673415966b.2;
        Mon, 17 Jul 2023 09:00:27 -0700 (PDT)
X-Gm-Message-State: ABy/qLY9XjjV0ILHc4hc7r3SqzxzgqryU9tUmVz/4js5kI9C38/rs7Ry
	b0PSfR3AT3620inKhACmGWBJi/3LdcZZ52CEXQ==
X-Google-Smtp-Source: APBJJlHA4mgilySogAP42lUQSMVRT/qbV5Oma2JALtCafuqV/cUjtluoVPGDaYM362s9DRx6+5c70nlKH/JRTpSuRMY=
X-Received: by 2002:a2e:9206:0:b0:2b7:15d:24 with SMTP id k6-20020a2e9206000000b002b7015d0024mr9106273ljg.41.1689609605034;
 Mon, 17 Jul 2023 09:00:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230714174852.4062251-1-robh@kernel.org> <20230717074352.dz3ex7fwi77loayc@pengutronix.de>
In-Reply-To: <20230717074352.dz3ex7fwi77loayc@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 09:59:52 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKDGeDrK6-cgsZpcpmAvQN-SVUv+W1nJRRiYD3BGAj-_g@mail.gmail.com>
Message-ID: <CAL_JsqKDGeDrK6-cgsZpcpmAvQN-SVUv+W1nJRRiYD3BGAj-_g@mail.gmail.com>
Subject: Re: [PATCH] pwm: Explicitly include correct DT includes
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Michael Walle <michael@walle.cc>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	asahi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 1:44=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> On Fri, Jul 14, 2023 at 11:48:50AM -0600, Rob Herring wrote:
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those includ=
e
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
>
> so the eventual goal here is to prepare for:
>
>  - drop #include <linux/of_device.h> from include/linux/of_platform.h
>  - drop #include <linux/of.h> from include/linux/of_device.h
>  - drop #include <linux/of_platform.h> from include/linux/of_device.h
>  - drop #include <linux/platform_device.h> from include/linux/of_device.h
>  - drop #include <linux/platform_device.h> from include/linux/of_platform=
.h

Yes.

> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  drivers/pwm/core.c               | 1 +
> >  drivers/pwm/pwm-apple.c          | 1 +
> >  drivers/pwm/pwm-atmel-hlcdc.c    | 1 +
> >  drivers/pwm/pwm-atmel-tcb.c      | 3 +--
> >  drivers/pwm/pwm-atmel.c          | 1 -
> >  drivers/pwm/pwm-berlin.c         | 1 +
> >  drivers/pwm/pwm-cros-ec.c        | 1 +
> >  drivers/pwm/pwm-fsl-ftm.c        | 3 +--
> >  drivers/pwm/pwm-hibvt.c          | 2 +-
> >  drivers/pwm/pwm-imx1.c           | 1 -
> >  drivers/pwm/pwm-jz4740.c         | 2 +-
> >  drivers/pwm/pwm-lp3943.c         | 1 +
> >  drivers/pwm/pwm-lpc18xx-sct.c    | 1 +
> >  drivers/pwm/pwm-mediatek.c       | 1 -
> >  drivers/pwm/pwm-meson.c          | 1 -
> >  drivers/pwm/pwm-microchip-core.c | 2 +-
> >  drivers/pwm/pwm-mtk-disp.c       | 1 -
> >  drivers/pwm/pwm-pxa.c            | 1 +
> >  drivers/pwm/pwm-sifive.c         | 1 +
> >  drivers/pwm/pwm-sl28cpld.c       | 1 +
> >  drivers/pwm/pwm-sprd.c           | 1 +
> >  drivers/pwm/pwm-sun4i.c          | 1 -
> >  drivers/pwm/pwm-sunplus.c        | 1 +
> >  drivers/pwm/pwm-tegra.c          | 1 -
> >  drivers/pwm/pwm-tiecap.c         | 2 +-
> >  drivers/pwm/pwm-tiehrpwm.c       | 2 +-
> >  drivers/pwm/pwm-visconti.c       | 2 +-
> >  drivers/pwm/pwm-vt8500.c         | 5 +----
> >  28 files changed, 21 insertions(+), 21 deletions(-)
> >
> > diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
> > index 3dacceaef4a9..d37617c60eae 100644
> > --- a/drivers/pwm/core.c
> > +++ b/drivers/pwm/core.c
> > @@ -8,6 +8,7 @@
> >
> >  #include <linux/acpi.h>
> >  #include <linux/module.h>
> > +#include <linux/of.h>
> >  #include <linux/pwm.h>
> >  #include <linux/radix-tree.h>
> >  #include <linux/list.h>
>
> This file includes neither of_device.h nor of_platform.h and up to now
> gets of.h via <linux/pwm.h>.

Indeed.

> What is your plan for <linux/pwm.h>'s include? I think it would only need
>
>         struct of_phandle_args;

Here's what I'm testing with:

diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index 04ae1d9073a7..5a59a7d53be8 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -4,8 +4,10 @@

 #include <linux/err.h>
 #include <linux/mutex.h>
-#include <linux/of.h>

+struct device;
+struct fwnode_handle;
+struct of_phandle_args;
 struct pwm_chip;

 /**

>
> to replace that. (But that would need another patch like this one, as
> then e.g. drivers/pwm/pwm-sl28cpld.c fails to compile because
> device_property_read_u32() is undeclared. It would need to #include
> <linux/property.h> which now it gets transitively via <linux/of.h>.)

property.h is added in this patch, so it should be okay?

> If <linux/pwm.h> is planed to continue #including <linux/of.h>, the
> explicit include here isn't necessary (and probably elsewhere).

I would like to drop including of.h, but probably not this cycle.
Either way, I thought kernel best practice was to not rely on implicit
includes.

BTW, linux/i2c.h is another source of lots of implicit of.h includes.
That one looks like we can't get rid of.

> I don't care much either way, but maybe your quest would be a bit
> simpler if you only touch files that include the two files you want to
> modify?

Yes, that's how it started. I kind of decided it wasn't worth trying
to split things up by every separate reason explicit includes were not
correct.

>
> *shrug*, this patch is still an improvement so:
>
> Acked-by: Uwe Kleine-K=C3=B6ng <u.kleine-koenig@pengutronix.de>
>
> Another thing I wonder is: How did you identify the files that need
> these includes. I guess you have a list of types for each header and
> search for files that use any of the types but doesn't include the
> respecitve header? I wonder if tracking this type -> header mapping in
> machine readable form somewhere would be nice, to e.g. make checkpatch
> warn if a file uses struct of_node but only gets it by chance?

It's been less automated than I'd like. It's been a lot of grepping
with a list of symbols the headers provide. For example, I get all the
files including of_device.h and then get the ones with no symbols from
of_device.h. And then do a manual review of what are the correct
headers for the file. And then run thru builds and fix all the issues.

Rob
