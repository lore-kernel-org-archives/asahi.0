Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62591FA7
	for <asahi@lists.linux.dev>; Fri, 30 Sep 2022 09:17:03 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oeBtU-0002K6-1Y; Fri, 30 Sep 2022 11:01:16 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oeBtM-003lds-D4; Fri, 30 Sep 2022 11:01:06 +0200
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1oeBtK-000326-1D; Fri, 30 Sep 2022 11:01:06 +0200
Message-ID: <f3ca1852b5ddfa9b0be4742779838b3ba18a0e5d.camel@pengutronix.de>
Subject: Re: [PATCH 4/4] dmaengine: apple-admac: Trigger shared reset
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Martin =?UTF-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Vinod Koul
 <vkoul@kernel.org>,  Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 30 Sep 2022 11:01:05 +0200
In-Reply-To: <20220918095845.68860-5-povik+lin@cutebit.org>
References: <20220918095845.68860-1-povik+lin@cutebit.org>
	 <20220918095845.68860-5-povik+lin@cutebit.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: asahi@lists.linux.dev

Hi Martin,

On So, 2022-09-18 at 11:58 +0200, Martin Povi=C5=A1er wrote:
> If a reset domain is attached to the device, obtain a shared reference
> to it and trigger it. Typically on a chip the ADMAC controller will
> share a reset domain with the MCA peripheral.
>=20
> Signed-off-by: Martin Povi=C5=A1er <povik+lin@cutebit.org>
> ---
> =C2=A0drivers/dma/apple-admac.c | 22 +++++++++++++++++++---
> =C2=A01 file changed, 19 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
> index 7d1b76678032..317ca76ccafd 100644
> --- a/drivers/dma/apple-admac.c
> +++ b/drivers/dma/apple-admac.c
> @@ -12,8 +12,9 @@
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/of_device.h>
> =C2=A0#include <linux/of_dma.h>
> -#include <linux/interrupt.h>
> +#include <linux/reset.h>
> =C2=A0#include <linux/spinlock.h>
> +#include <linux/interrupt.h>

Moving around the linux/interrupt.h include doesn't belong in this
patch. Otherwise this looks good to me, assuming the MCA driver does
the same reset/rearm dance.

regards
Philipp
