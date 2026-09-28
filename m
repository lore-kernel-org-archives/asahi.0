Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BF74F68D7
	for <asahi@lists.linux.dev>; Mon, 28 Sep 2026 22:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790634535; cv=none; b=mDcWvHaJYOHmsBblF/i5ou4OoV4sXwfbIay3aIOIzBFj+QwTHNocGLPTd6Fcdohl88Zde24uGexi6h17j4TUcj1OOw0dJYhy49xRucZbfJNkUUVUNFfQfpgjZWjsD8q8f3LH1eBqCHZ7ed3BXNBJ1yhOWI3zcVmLvsKpfWLdm/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790634535; c=relaxed/simple;
	bh=CMhVbbwMjVNodf67+oObxNDkfFFuusEAICzl886gi4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgSCAI4YVPr3ZAdynVISIDALToSK5lgUAAGKTeYGkw8gEhciQ4EikRQR2pvzFG2/zBnuJM9ys5SXXZEsntGSI7vEryw5HTSe8QyPb9CDOComGTsSUCL2wS6QlN0Ur75KH2HE0yOE3dBDo3rEHe9e6QxcgD++/4YeXoOb9kJtMko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Qn1X79Ro; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qn1X79Ro"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f333dc2aso1952757e87.2
        for <asahi@lists.linux.dev>; Mon, 28 Sep 2026 15:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790634532; x=1791239332; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JArXmWr/mVGoLLKcByjQ5+EXzcvGruMpOpTO8U+lXSI=;
        b=Qn1X79RoTPSQoheWz7Ey3Q8VeWvTrWjIGK5DZV+XCLi+3nYbjy0qPfXZEyLDhDhZYX
         4qrP4GdXEweyWbQLzZv0wZXzC61RokKnyOuWJhBsHf/noIj228g0R+CB1ZhsNJDKXDTA
         IUBUXBCwjjOYxCyLnscI0aT93ZjP/ACR0zhRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790634532; x=1791239332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JArXmWr/mVGoLLKcByjQ5+EXzcvGruMpOpTO8U+lXSI=;
        b=sxzE5YntiOv59PBt2wfmeWVXM9hWEx9mkzWyi2yIrFCkDq8bc9zSxm0txrF0MoToqx
         Ug+qQkxYMIPxLaDNPDR/Y63DtoQ5EIWz/Nmq1V9KfHLuvmS0+0ZtqiNwML1n6IuXCdCK
         M0E2BIV7E8IjGmSLcXKAzPia+aAiWY7qr2QYj6OL97S6UEDLj/LWmNcLsukIU0LObGS3
         y93oUDmxirLY+s7eJePB3fharPE0iuHKUh8TDvX0tKDK9DKpgWGn0ry3zxPX9WXI7HAe
         ATC+rfVPzCeH6Tps0H395U1Zyw6XT//34ZzhWYWm4MPiORpNrE4//Nl1uuHOk67pLuiT
         x0sQ==
X-Forwarded-Encrypted: i=1; AKwUvBxBpKq+pgsdN3Eix9wKZU9fzVDsh1QVVUW2EYnosP/4bYFHhYw1TUCAIyx3ZIdcrpFuZ5shEQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJQlcvOkczoa7fho/WdyEVNoHPuZ+Nss3BiykTMrGoTOWo3J72A
	eEkVHEHT+Lpk99Q4ZsjtDtq4c03zW5KgFfmGz0ytTKlzC0bbVVMcwPXtt1xpaNc7wtBL1LvKEqI
	ryuxuRA==
X-Gm-Gg: AYBFou0PqM8oaYzwJscr9akMW2XDCOl7wxMDvg4IZOT4BiRWI9lqa/IvDm1xOAXyKUf
	5VL6gp9l2L/kmTw5T9eUkC/dUVBZAMDRr7RBEYX0LxksA3VmPRZV3RTnV7Ts8O6JoPQuu1k4sK4
	gWQ0KUPR3hbsbk4Nf0UDubanxTPS4uuwcacnuGkj4R0Hul3fNzGnB6ox0Fy/t5T92A//khydRq1
	TTfAmuddb18FfzwuMYSB5CdW0eO/lOvKmG1woMzS9A6AJxcX0kttoJPb4x8J9ca94mzdoz3PbF3
	9w22/beNGv3PNAxtL/pKh/YJ1AzkAfuTClIF9DLbFZssWhQ4pJpFz2CvRHxANBpjp28ylMcvbhe
	qVNf5wKMRar6jc5ZrFqjxLonDqeshcejX8EH/FxOqq/FxsbobjY8DBvq46uUDX1qgfPDfCBOuXw
	Ois2n2iqq8sLOf/kxwn+q5mppONrNMIYNAbKL0ffT9/fHAowjknTPuBuOsBF1N66J9LQloXE6Zc
	MLZ1Ywu/Y5X9lVpAh1qtfMDZjbEnBPh639SGw==
X-Received: by 2002:ac2:51d4:0:b0:5b8:ef26:9308 with SMTP id 2adb3069b0e04-5b8ef269320mr3138372e87.26.1790634532168;
        Mon, 28 Sep 2026 15:28:52 -0700 (PDT)
Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com. [74.125.230.98])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b9d826f9fbsm896751e87.12.2026.09.28.15.28.51
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 15:28:51 -0700 (PDT)
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a65fd1534aso15381071fa.0
        for <asahi@lists.linux.dev>; Mon, 28 Sep 2026 15:28:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzGJYzyr/qi7vxUPKSfXH7vgijSncC7IcwbnX+WK9NJmwJZhlY6/sxsky1kgkxbaOL2YT8afw==@lists.linux.dev
X-Received: by 2002:a05:600c:6986:b0:49c:fa21:e73c with SMTP id
 5b1f17b1804b1-49fe66f147bmr235241965e9.18.1790634033791; Mon, 28 Sep 2026
 15:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260928161605.2271412-1-arnd@kernel.org>
In-Reply-To: <20260928161605.2271412-1-arnd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Sep 2026 15:20:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UzWmSjWZ96sBYvRLr=EbYqqBZ71o2BqotUsxRf5zqjTg@mail.gmail.com>
X-Gm-Features: AclHuK-sVszmxzKslRXTzUjiQ3wDqpSD15BZhQhdtvRJFSFfPWjQSieqaRkgVN0
Message-ID: <CAD=FV=UzWmSjWZ96sBYvRLr=EbYqqBZ71o2BqotUsxRf5zqjTg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: add missing drm/drm_panel.h inclusions
To: Arnd Bergmann <arnd@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 28, 2026 at 9:16=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The devm_drm_of_get_bridge() declaration moved to drm_panel.h, but
> not all callers include this, which leads to build failures in
> some configurations:
>
> drivers/gpu/drm/imx/lcdc/imx-lcdc.c: In function 'imx_lcdc_probe':
> drivers/gpu/drm/imx/lcdc/imx-lcdc.c:404:18: error: implicit declaration o=
f function 'devm_drm_of_get_bridge' [-Wimplicit-function-declaration]
>   404 |         bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0, 0=
);
>       |                  ^~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/verisilicon/vs_bridge.c: In function 'vs_bridge_init':
> drivers/gpu/drm/verisilicon/vs_bridge.c:306:16: error: implicit declarati=
on of function 'devm_drm_of_get_bridge' [-Wimplicit-function-declaration]
>   306 |         next =3D devm_drm_of_get_bridge(drm_dev->dev, drm_dev->de=
v->of_node,
>       |                ^~~~~~~~~~~~~~~~~~~~~~
>
> Include the new header in all files that need it.
>
> Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to drm_panel.c")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

[ ... ]

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index e7f9e6d58927..e50737432071 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -36,6 +36,7 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>
>  #include "drm_crtc_internal.h"

The above one might not be necessary. drm_bridge.c only references
devm_drm_of_get_bridge() in comments.

Other than that, this looks OK to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll assume Luca will apply the fix since he landed aa8a8c7e4641.

-Doug
