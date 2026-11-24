Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795559223;
	b=OmlNGjkfCaR6lhSYKh6frvx23OC4o6R2VVZBJ1BI8Q4jWiWZdDtRue9lag+hCM4PUq5W
	 1BFwZrPkssichcPEi2ideQrJIE2VKR2c7rD5kYfbk27nGv5Z0cj7ZUUoK+MK2wGCnpzqB
	 awJkw9N79BYMEqTycIj8Gkrr4sHwqbGzNSKeQnK2zj3C+Yjil250mxuMQv7/vDlO58lvH
	 GtmqCmjGopNUp1g9Q0hEy9MTaV5XleoB8yyIgJdpHgtX/vMTBYHziQzDCrewYf2tdZQbF
	 +DBF148gzoY+asqo3UoR6oVm/u/91LUMoka2qRQOTkJtm12Z0dHmQm9Wk6SuR+E/YNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795559223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=U55uaK+8eYLNG9cZIt46oPZS2SF8ZBVO1Bjlq4aivhw=;
	b=R9DX7LEHf/oV5kjEcpINSR8NLvViM1nNVYlM8gLE8WX+rcc80abUONceDgkixLU1mb7Q
	 vU3n8vVgPeL103fVxkxowdeC60wuyXsyPanGK77Xrz1AnVfpVCrinyy/+oZluzNKKssgW
	 tWZ1ldx3grjGvr2/HaKY+x+U//BQYOvhWaB8+u/6cam0s6j50HJS3ioqf4EDvkiiBr/hO
	 3Ts4Aaf48Dp5/bI3r41ZhR3xmyFVTwtnUpi1v0b4WuPiijoSIwcuHQFlYw5yQIzzt+9bW
	 68grCaIrQzQ9HB8ajALNwlPaQg5q+tsbuyCZmcIT9rOEd82OIYL6VKeFQh4Hz2osRHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pSu0RyEY;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D127606A326
	for <asahi@lists.linux.dev>; Tue, 24 Nov 2026 22:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D127606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=pSu0RyEY
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-536c8f958d7so38679541cf.1
        for <asahi@lists.linux.dev>; Tue, 24 Nov 2026 14:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795559220; x=1796164020; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U55uaK+8eYLNG9cZIt46oPZS2SF8ZBVO1Bjlq4aivhw=;
        b=pSu0RyEY+XbsnT14b2KWZErOr4EdX8fAKVktG7ICt6tKV7QQ5RrBAhQDAGPcZ7ENJz
         FCdKGljkd8074q1LyPQokEphVIIvnp0PamhrGZNfj7TYz6acpFW9nFdf4CaqNPk9CSk3
         M/DyE+ivb0TMOBg5obkEGcuD1PHqEfKnMWmFYFXi/un8rlci9yXvP3Qf+qHsdJ2TimYx
         5PzZrfRttKsca58tS4BdX57HNtVLI5GdGqoAVSE5kgZotT/13zkMUIIh44NbrOh/5Z/U
         EbczCXiJpExmaUPchUBTUZrzoBPyE/s1aQyZCWZgbZFcKxD5VozqiNNmm334oTnABQsH
         tP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795559220; x=1796164020;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U55uaK+8eYLNG9cZIt46oPZS2SF8ZBVO1Bjlq4aivhw=;
        b=jbgClJmTzI9vUGIYKyeAY1R7n1aBt5uxQaHiJpN0RQpmkac+SYcvojdnKXbPNpCIGS
         ZCD/aBMHBAiQaIN0GyV+BacGZ4uhPzgMZkNzqsjjOXA7DOOQoFojQ80nJNAdcfTydfw9
         OnumjUXhCAQaBKfPMV605VlTUET36sMNYUlgs95sOU4r/xgkingJkM7wzFy907t7tUjm
         kLldJsj8TTnW/elcsVarVFk8IO50cIgu8tKDhvXZAlZiLvxhe5HmN1HZQcDEhJaXjoo3
         qjOaY5EYmKy+KC4CdZcQYZI1lrzM1VsfaaU1CWhuFSKYUFyg6TPpXWzis5pHeJXIrKO/
         HIHg==
X-Gm-Message-State: APuU4Z8BVRA6xJwIEbAgGEzIc2Ne1A/nrtUGXTyE6RZldzzJysSrFhOa
	acd08CBzgExNepptTmchgphqNvddntH8UNB/isQcvZKMr1DIAQ1v8IZimwR44hVBqZg=
X-Gm-Gg: AZFdTZd3FQOINDDPCeKj36T3jE7EtL9/gZqh7QZBJi/MARkptczhHSELxyAia2+t0Rv
	UXVEEanmBgJljeJ7PBdXkrfM09aa1Q4QJ/NP1HCAwQ24VyrDlhlb7VbyxYif0VsDudncn62dAlQ
	9FaQUCO90fHJCVoyV3qhC763+FhDnGT0wmFz3J/UM0gY5mTEoMzXRS3lOQy4YNBCoP3hvXJ57N1
	9Au7Kxqv/GBkLwJYV3BqjB0dY5sfN7IkQMhOuHaU8FpAK9NqoNBxFKb1VKzRbuMTrXHDMvDCkEB
	uFn5j9zRwaxq6zhXezzJ9JKIWw4mCe37Yr9q8fi2Aax10qNb7l6fRp9a6YMM0a0vuE765SlpZhb
	s/G0a2gvymGn0bUkYosts1WWrL1wepE2ia26BVdAmTMAC4zJ/OwpK0e7pCmyfug3eaGpWAUCS40
	C7sXmY6RtM4UniXXbVe+9A0LDH8dJnWKsKJ0NBQasahG9p1kYgTqv0DVzV8tFh4RQAqcsGi+eOD
	ahho9H4UoqFSZqAPyEDq+3WbMbfE9xOxGPmAkZCkhzY8kMzFbx42bg/gpIdzg/gwcJmu+EOFPo4
	nqySL2q247+dY97ZjwUGx5FdfzY6Ut72XYNp5pNcEotU/NrZ0vDlw1gm
X-Received: by 2002:a05:622a:5508:b0:55d:33f4:1073 with SMTP id d75a77b69052e-55d76889c98mr329174321cf.3.1795559219613;
        Tue, 24 Nov 2026 14:26:59 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d784517casm137926961cf.3.2026.11.24.14.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:26:58 -0800 (PST)
Message-ID: <4bf91d773c7c2bd8c3b04210eff7869169f1f382.camel@ndufresne.ca>
Subject: Re: [PATCH v3 06/17] media: apple: add avd driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau
	 <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Tue, 24 Nov 2026 17:26:56 -0500
In-Reply-To: <20261020-avd-v3-6-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-6-85cbaa2125d8@icloud.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-x08Y6vppfz4ikL2auF+x"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

--=-x08Y6vppfz4ikL2auF+x
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9crit=
=C2=A0:
> Add the AVD (Apple Video Decoder) driver with V4L2 M2M stateless
> support based largely on rockchips implementation.
>=20
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>

Check you Sashiko report, and below...

> ---
>  MAINTAINERS                                 |   1 +
>  drivers/media/platform/Kconfig              |   1 +
>  drivers/media/platform/Makefile             |   1 +
>  drivers/media/platform/apple/Kconfig        |   5 +
>  drivers/media/platform/apple/Makefile       |   3 +
>  drivers/media/platform/apple/avd/Kconfig    |  16 +
>  drivers/media/platform/apple/avd/Makefile   |   4 +
>  drivers/media/platform/apple/avd/avd-drv.c  | 782 ++++++++++++++++++++++=
+++++
>  drivers/media/platform/apple/avd/avd-inst.h | 210 ++++++++
>  drivers/media/platform/apple/avd/avd-v4l2.c | 783 ++++++++++++++++++++++=
++++++
>  drivers/media/platform/apple/avd/avd.h      | 267 ++++++++++
>  11 files changed, 2073 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4fabca992fd4..3c919f7986bd 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2676,6 +2676,7 @@ F:=09drivers/input/touchscreen/apple_z2.c
>  F:=09drivers/iommu/apple-dart.c
>  F:=09drivers/iommu/io-pgtable-dart.c
>  F:=09drivers/irqchip/irq-apple-aic.c
> +F:=09drivers/media/platform/apple/*
>  F:=09drivers/mfd/macsmc.c
>  F:=09drivers/nvme/host/apple.c
>  F:=09drivers/nvmem/apple-efuses.c
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kcon=
fig
> index 2c7699b6610b..280a9db25935 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -66,6 +66,7 @@ source "drivers/media/platform/allegro-dvt/Kconfig"
>  source "drivers/media/platform/amd/Kconfig"
>  source "drivers/media/platform/amlogic/Kconfig"
>  source "drivers/media/platform/amphion/Kconfig"
> +source "drivers/media/platform/apple/Kconfig"
>  source "drivers/media/platform/arm/Kconfig"
>  source "drivers/media/platform/aspeed/Kconfig"
>  source "drivers/media/platform/atmel/Kconfig"
> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Mak=
efile
> index d47c47d817da..aa82e189936b 100644
> --- a/drivers/media/platform/Makefile
> +++ b/drivers/media/platform/Makefile
> @@ -9,6 +9,7 @@ obj-y +=3D allegro-dvt/
>  obj-y +=3D amd/
>  obj-y +=3D amlogic/
>  obj-y +=3D amphion/
> +obj-y +=3D apple/
>  obj-y +=3D arm/
>  obj-y +=3D aspeed/
>  obj-y +=3D atmel/
> diff --git a/drivers/media/platform/apple/Kconfig b/drivers/media/platfor=
m/apple/Kconfig
> new file mode 100644
> index 000000000000..43c0a56c36a8
> --- /dev/null
> +++ b/drivers/media/platform/apple/Kconfig
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +comment "Apple media platform drivers"
> +
> +source "drivers/media/platform/apple/avd/Kconfig"
> diff --git a/drivers/media/platform/apple/Makefile b/drivers/media/platfo=
rm/apple/Makefile
> new file mode 100644
> index 000000000000..d502cab93970
> --- /dev/null
> +++ b/drivers/media/platform/apple/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-y +=3D avd/
> diff --git a/drivers/media/platform/apple/avd/Kconfig b/drivers/media/pla=
tform/apple/avd/Kconfig
> new file mode 100644
> index 000000000000..68efa2df368a
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config VIDEO_APPLE_AVD
> +=09tristate "Apple Silicon Video Decoding driver"
> +=09depends on VIDEO_DEV
> +=09depends on MEDIA_CONTROLLER
> +=09depends on ARCH_APPLE || COMPILE_TEST
> +=09depends on OF_ADDRESS
> +=09depends on V4L_PLATFORM_DRIVERS
> +=09select V4L2_MEM2MEM_DEV
> +=09select VIDEOBUF2_DMA_CONTIG
> +=09help
> +=09  Support for hardware video decoding on Apple Silicon devices using
> +=09  the Apple Video Decoder (AVD).
> +=09  To compile this driver as a module, choose M here: the module will
> +=09  be called apple-avd.
> diff --git a/drivers/media/platform/apple/avd/Makefile b/drivers/media/pl=
atform/apple/avd/Makefile
> new file mode 100644
> index 000000000000..b2f6736a790e
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/Makefile
> @@ -0,0 +1,4 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +apple-avd-y :=3D avd-drv.o avd-v4l2.o
> +obj-$(CONFIG_VIDEO_APPLE_AVD) +=3D apple-avd.o
> diff --git a/drivers/media/platform/apple/avd/avd-drv.c b/drivers/media/p=
latform/apple/avd/avd-drv.c
> new file mode 100644
> index 000000000000..ddbf18cd3329
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-drv.c
> @@ -0,0 +1,782 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Apple Video Decoder driver
> + *
> + * Copyright (C) 2026 The Asahi Linux Contributors
> + * Copyright (C) 2026 Sofus Forstreuter <sofus.c@icloud.com>
> + *
> + * Based on rkvdec driver by Collabora, Ltd.
> + * Copyright (C) 2019 Collabora, Ltd.
> + * Based on rkvdec driver by Google LLC. (Tomasz Figa <tfiga@chromium.or=
g>)
> + * Based on s5p-mfc driver by Samsung Electronics Co., Ltd.
> + * Copyright (C) 2011 Samsung Electronics Co., Ltd.
> + */
> +
> +#include <linux/pm_runtime.h>
> +#include <linux/iommu.h>
> +#include <linux/reset.h>
> +#include <linux/dev_printk.h>
> +#include <linux/iopoll.h>
> +
> +#include <media/videobuf2-dma-contig.h>
> +#include <media/videobuf2-v4l2.h>
> +
> +#include "avd.h"
> +#include "avd-inst.h"
> +
> +static void calc_tile_meta(u32 w, u32 h, u32 bpb, u32 tile_dim,
> +=09=09=09   u32 meta_hdr_bytes, u32 *tile, u32 *meta)
> +{
> +=09u32 tiles_width, tiles_height, meta_tile_w, meta_tile_h, tile_bytes;
> +
> +=09tiles_width =3D DIV_ROUND_UP(w, tile_dim);
> +=09tiles_height =3D DIV_ROUND_UP(h, tile_dim);
> +=09tile_bytes =3D DIV_ROUND_UP(tile_dim * tile_dim * bpb, 8);
> +=09*tile =3D ALIGN(tiles_width * tiles_height * tile_bytes, 16);
> +
> +=09meta_tile_w =3D roundup_pow_of_two(tiles_width);
> +=09meta_tile_h =3D roundup_pow_of_two(tiles_height);
> +
> +=09*meta =3D ALIGN(meta_tile_w * meta_tile_h * meta_hdr_bytes, 16);
> +}
> +
> +static inline u8 v4l2_format_info_bpp(const struct v4l2_format_info *inf=
o,
> +=09=09=09=09      int plane)
> +{
> +=09return 8 * info->bpp[plane] / info->bpp_div[plane];
> +}
> +
> +void fill_comp(struct avd_comp *comp, enum avd_image_fmt fmt, u32 width,
> +=09       u32 height)
> +{
> +=09u32 y_meta, y, uv_meta, uv, fourcc;
> +=09const struct v4l2_format_info *info;
> +
> +=09switch (fmt) {
> +=09case AVD_IMG_FMT_420_8BIT:
> +=09=09fourcc =3D V4L2_PIX_FMT_APPLE_AX12;
> +=09=09break;
> +=09case AVD_IMG_FMT_420_10BIT:
> +=09=09fourcc =3D V4L2_PIX_FMT_APPLE_AX03;
> +=09=09break;
> +=09case AVD_IMG_FMT_422_8BIT:
> +=09=09fourcc =3D V4L2_PIX_FMT_APPLE_AX16;
> +=09=09break;
> +=09case AVD_IMG_FMT_ANY: /* use the largest one */
> +=09case AVD_IMG_FMT_422_10BIT:
> +=09=09fourcc =3D V4L2_PIX_FMT_APPLE_AX23;
> +=09=09break;
> +=09}
> +=09info =3D v4l2_format_info(fourcc);
> +
> +=09/* y has 32x32 tiles and 32 bytes of metadata per tile */
> +=09calc_tile_meta(width, height, v4l2_format_info_bpp(info, 0), 32, 32,
> +=09=09       &y, &y_meta);
> +=09/* uv has 16x16 tiles and 8 bytes of metadata per tile */
> +=09calc_tile_meta(width / info->vdiv, height / info->hdiv,
> +=09=09       v4l2_format_info_bpp(info, 1), 16, 8, &uv,
> +=09=09       &uv_meta);
> +
> +=09/* output like DCP/AGX expect */
> +=09comp->offsets[0] =3D y;
> +=09comp->offsets[1] =3D 0;
> +=09comp->offsets[2] =3D y + y_meta + uv;
> +=09comp->offsets[3] =3D y + y_meta;
> +
> +=09comp->size =3D y_meta + y + uv_meta + uv;
> +}
> +
> +int avd_buf_alloc(struct avd_dev *avd, struct avd_buf *buf, size_t size)
> +{
> +=09if (buf->cpu && size < buf->size)
> +=09=09return 0;
> +=09else if (buf->cpu)
> +=09=09avd_buf_free(avd, buf);
> +
> +=09if (size <=3D 0)
> +=09=09return -ENOMEM;
> +
> +=09buf->size =3D size;
> +=09buf->cpu =3D
> +=09=09dma_alloc_coherent(avd->dev, buf->size, &buf->addr, GFP_KERNEL);
> +=09return buf->cpu ? 0 : -ENOMEM;
> +}
> +
> +void avd_buf_free(struct avd_dev *avd, struct avd_buf *buf)
> +{
> +=09if (buf->cpu)
> +=09=09dma_free_coherent(avd->dev, buf->size, buf->cpu, buf->addr);
> +=09memset(buf, 0, sizeof(*buf));
> +}
> +
> +struct avd_decoded_buffer *
> +avd_get_ref_buf(struct avd_ctx *ctx, struct vb2_v4l2_buffer *dst, u64 ti=
mestamp)
> +{
> +=09struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> +=09struct vb2_queue *cap_q =3D &m2m_ctx->cap_q_ctx.q;
> +=09struct vb2_buffer *buf;
> +
> +=09/*
> +=09 * If a ref is unused or invalid, address of current destination
> +=09 * buffer is returned.
> +=09 */
> +=09buf =3D vb2_find_buffer(cap_q, timestamp);
> +=09if (!buf)
> +=09=09buf =3D &dst->vb2_buf;
> +
> +=09return vb2_to_avd_decoded_buf(buf);
> +}
> +
> +int avd_end_segment(struct avd_ctx *ctx, bool update_submit)
> +{
> +=09struct avd_job *job =3D &ctx->job;
> +=09struct avd_segment *seg =3D &job->segments[job->num];
> +
> +=09/* avd_segment includes piodma_cmd which is not transferred */
> +=09seg->piodma_cmd =3D
> +=09=09AVD_PIODMA_CMD_SIZE((sizeof(struct avd_segment) - 8) / 4);
> +=09seg->piodma_cmd |=3D AVD_PIODMA_CMD_DEST(job->dest);
> +=09seg->piodma_cmd |=3D AVD_PIODMA_CMD_CONST;
> +
> +=09job->num++;
> +=09if (update_submit)
> +=09=09job->num_submit++;
> +=09return job->num >=3D job->num_alloc;
> +}
> +
> +int avd_init_job(struct avd_ctx *ctx, enum avd_codec codec, size_t segme=
nts)
> +{
> +=09int ret =3D 0;
> +=09struct avd_job *job =3D &ctx->job;
> +
> +=09job->codec =3D codec;
> +=09job->dest =3D 0x1000;

Maybe give this a name with a #define?

> +=09job->num =3D 0;
> +=09job->num_submit =3D 0;
> +=09job->num_alloc =3D segments;
> +=09ret =3D avd_buf_alloc(ctx->dev, &job->buf,
> +=09=09=09    job->num_alloc * sizeof(*job->segments));
> +=09if (ret)
> +=09=09return ret;
> +
> +=09job->segments =3D job->buf.cpu;
> +=09memset(job->buf.cpu, 0, job->buf.size);
> +=09return 0;
> +}
> +
> +struct avd_cm3_job {
> +=09enum avd_codec codec;
> +=09u32 dest;
> +=09u32 num;
> +=09u32 num_submit;
> +=09u64 iova;
> +=09u64 insn;
> +};
> +
> +int avd_submit_job(struct avd_ctx *ctx)
> +{
> +=09struct avd_dev *avd =3D ctx->dev;
> +=09struct avd_job *job =3D &ctx->job;
> +=09int submit_off =3D 0x100;

Same.

> +=09struct avd_cm3_job submit =3D (struct avd_cm3_job) {
> +=09=09.codec =3D job->codec,
> +=09=09.dest =3D job->dest,
> +=09=09.num =3D job->num,
> +=09=09.num_submit =3D job->num_submit,
> +=09=09.iova =3D job->buf.addr,
> +=09=09.insn =3D ctx->inst.addr,
> +=09};
> +
> +=09schedule_delayed_work(&ctx->watchdog_work, msecs_to_jiffies(2000));
> +=09memcpy_toio(avd->sram + submit_off, &submit, sizeof(submit));
> +=09writel(submit_off, avd->mbox + AVD_REG_MBOX1_SUBMIT);
> +
> +=09return 0;
> +}
> +
> +static int avd_boot(struct avd_dev *avd)
> +{
> +=09u32 val;
> +=09int ret;
> +=09char version[64];
> +
> +=09if (avd->variant->revision !=3D 3)
> +=09=09dev_info_once(avd->dev, "booting hw version: %04x",
> +=09=09=09      readl_relaxed(avd->ctrl));
> +
> +=09writel(avd->sram_start, avd->piodma + 0x24);
> +=09dev_info_once(avd->dev, "piodma version: %04x base: %08x",
> +=09=09      readl_relaxed(avd->piodma + 0xb4),
> +=09=09      readl_relaxed(avd->piodma + 0x24));
> +
> +=09memcpy_toio(avd->code, avd->fw->data, avd->fw->size);
> +
> +=09writel_relaxed(AVD_MBOX_ENABLE, avd->mbox + AVD_REG_MBOX1_STATUS);
> +=09writel_relaxed(AVD_MBOX_ENABLE, avd->mbox + AVD_REG_MBOX0_STATUS);
> +=09writel_relaxed(AVD_MBOX0_NOT_EMPTY,
> +=09=09       avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
> +=09writel_relaxed(AVD_RUN_CTRL_UNK_RUN, avd->mbox + AVD_REG_RUN_CTRL);
> +
> +=09/* wait for cm3 to boot */
> +=09ret =3D readl_poll_timeout(avd->mbox + AVD_REG_FLAG0_SET, val, val =
=3D=3D 1,
> +=09=09=09=09 10, 10000);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09memcpy_fromio(version, avd->sram, sizeof(version));
> +=09dev_info_once(avd->dev, "fw version: %s\n", version);
> +
> +=09return 0;
> +}
> +
> +static void avd_shutdown(struct avd_dev *avd)
> +{
> +=09writel_relaxed(AVD_RUN_CTRL_UNK_STOP, avd->mbox + AVD_REG_RUN_CTRL);
> +=09writel_relaxed(1, avd->mbox + AVD_REG_FLAG0_CLR);
> +=09writel_relaxed(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
> +}
> +
> +static int avd_reset(struct avd_dev *avd)
> +{
> +=09int ret =3D 0;
> +
> +=09ret =3D pm_runtime_resume_and_get(avd->dev);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D reset_control_reset(avd->rstc);
> +=09if (ret)
> +=09=09dev_err(avd->dev, "reset: failed: %d", ret);
> +
> +=09iommu_attach_device(avd->empty_domain, avd->dev);
> +=09iommu_detach_device(avd->empty_domain, avd->dev);
> +
> +=09ret =3D avd_boot(avd);
> +=09if (ret)
> +=09=09dev_err(avd->dev, "reset: failed to boot");
> +
> +=09pm_runtime_put_autosuspend(avd->dev);
> +
> +=09return ret;
> +}
> +
> +static void avd_watchdog_func(struct work_struct *work)
> +{
> +=09struct avd_dev *avd;
> +=09struct avd_ctx *ctx;
> +=09int ret;
> +
> +=09ctx =3D container_of(to_delayed_work(work), struct avd_ctx,
> +=09=09=09   watchdog_work);
> +=09if (!ctx)
> +=09=09return;
> +
> +=09avd =3D ctx->dev;
> +
> +=09dev_err(avd->dev, "Frame processing timed out!");
> +
> +=09writel(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
> +=09ret =3D avd_reset(avd);
> +=09if (ret)
> +=09=09dev_err(avd->dev, "failed to reset: %d", ret);
> +
> +=09avd_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +}
> +
> +static irqreturn_t avd_irq_handler(int irq, void *data)
> +{
> +=09struct avd_dev *avd =3D data;
> +=09struct avd_ctx *ctx =3D v4l2_m2m_get_curr_priv(avd->m2m_dev);
> +=09enum vb2_buffer_state state;
> +=09u32 status;
> +
> +=09status =3D readl(avd->mbox + AVD_REG_MBOX0_RETRIEVE);
> +=09writel(AVD_MBOX0_NOT_EMPTY, avd->mbox + AVD_REG_MBOX_IRQ_CLR);
> +
> +=09if (status & 0x10000) { /* dbg */

A define for this bit would be nice (#define BIT(N))

> +=09=09dev_warn(avd->dev, "no handler for IRQ: %3d",
> +=09=09=09 status & ~0x10000);

And so you don't have to duplicate.

> +=09=09writel_relaxed(0, avd->mbox + AVD_REG_MBOX_IRQ_ENABLE);
> +=09=09return IRQ_HANDLED;
> +=09}
> +
> +=09if (!ctx)
> +=09=09return IRQ_HANDLED;
> +
> +=09if (status & 0x1000) {

same, and any occurrence I may have missed.

> +=09=09state =3D VB2_BUF_STATE_DONE;
> +=09} else {
> +=09=09dev_err(avd->dev, "error: fw says: %x", status);
> +=09=09/* let watchdog handle */
> +=09=09goto done;
> +=09}
> +
> +=09/* if the watchdog_work has run the work has already been submitted *=
/
> +=09if (cancel_delayed_work(&ctx->watchdog_work))
> +=09=09avd_job_finish(ctx, state);
> +
> +done:
> +=09return IRQ_HANDLED;
> +}
> +
> +static void avd_device_run(void *priv)
> +{
> +=09struct avd_ctx *ctx =3D priv;
> +=09struct avd_dev *avd =3D ctx->dev;
> +=09const struct avd_coded_fmt_desc *desc =3D ctx->coded_fmt_desc;
> +=09int ret;
> +
> +=09if (WARN_ON(!desc))
> +=09=09return;
> +
> +=09ret =3D pm_runtime_resume_and_get(avd->dev);
> +=09if (ret < 0) {
> +=09=09avd_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
> +=09=09return;
> +=09}
> +
> +=09ret =3D desc->ops->run(ctx);
> +=09if (ret)
> +=09=09avd_job_finish(ctx, VB2_BUF_STATE_ERROR);
> +}
> +
> +static int avd_queue_init(void *priv, struct vb2_queue *src_vq,
> +=09=09=09  struct vb2_queue *dst_vq)
> +{
> +=09struct avd_ctx *ctx =3D priv;
> +=09int ret;
> +
> +=09src_vq->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +=09src_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +=09src_vq->drv_priv =3D ctx;
> +=09src_vq->ops =3D &avd_queue_ops;
> +=09src_vq->mem_ops =3D &vb2_dma_contig_memops;
> +
> +=09src_vq->dma_attrs =3D 0;
> +=09src_vq->buf_struct_size =3D sizeof(struct v4l2_m2m_buffer);
> +=09src_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +=09src_vq->lock =3D &ctx->dev->vdev_lock;
> +=09src_vq->dev =3D ctx->dev->v4l2_dev.dev;
> +=09src_vq->supports_requests =3D true;
> +
> +=09ret =3D vb2_queue_init(src_vq);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09dst_vq->bidirectional =3D true;
> +=09dst_vq->mem_ops =3D &vb2_dma_contig_memops;
> +=09dst_vq->dma_attrs =3D 0;
> +=09dst_vq->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +=09dst_vq->io_modes =3D VB2_MMAP | VB2_DMABUF;
> +=09dst_vq->drv_priv =3D ctx;
> +=09dst_vq->ops =3D &avd_queue_ops;
> +=09dst_vq->buf_struct_size =3D sizeof(struct avd_decoded_buffer);
> +=09dst_vq->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> +=09dst_vq->lock =3D &ctx->dev->vdev_lock;
> +=09dst_vq->dev =3D ctx->dev->v4l2_dev.dev;
> +
> +=09return vb2_queue_init(dst_vq);
> +}
> +
> +static int avd_open(struct file *filp)
> +{
> +=09struct avd_dev *avd =3D video_drvdata(filp);
> +=09struct avd_ctx *ctx;
> +=09int ret;
> +
> +=09ctx =3D kzalloc_obj(*ctx, GFP_KERNEL);
> +=09if (!ctx)
> +=09=09return -ENOMEM;
> +
> +=09ctx->dev =3D avd;
> +
> +=09ret =3D avd_buf_alloc(avd, &ctx->inst, AVD_FIFO_SIZE);
> +=09if (ret)
> +=09=09goto err_free_ctx;
> +
> +=09ret =3D avd_buf_alloc(avd, &ctx->pipe_state, 512);
> +=09if (ret)
> +=09=09goto err_free_ctx;
> +
> +=09INIT_DELAYED_WORK(&ctx->watchdog_work, avd_watchdog_func);
> +
> +=09avd_reset_coded_fmt(ctx);
> +=09avd_reset_decoded_fmt(ctx);
> +
> +=09v4l2_fh_init(&ctx->fh, video_devdata(filp));
> +
> +=09ctx->fh.m2m_ctx =3D v4l2_m2m_ctx_init(avd->m2m_dev, ctx, avd_queue_in=
it);
> +=09if (IS_ERR(ctx->fh.m2m_ctx)) {
> +=09=09ret =3D PTR_ERR(ctx->fh.m2m_ctx);
> +=09=09goto err_free_ctx;
> +=09}
> +
> +=09ret =3D avd_init_ctrls(ctx);
> +=09if (ret)
> +=09=09goto err_cleanup_m2m_ctx;
> +
> +=09v4l2_fh_add(&ctx->fh, filp);
> +
> +=09return 0;
> +
> +err_cleanup_m2m_ctx:
> +=09v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +
> +err_free_ctx:
> +=09avd_buf_free(avd, &ctx->pipe_state);
> +=09avd_buf_free(avd, &ctx->inst);
> +=09kfree(ctx);
> +=09return ret;
> +}
> +
> +static int avd_release(struct file *filp)
> +{
> +=09struct avd_ctx *ctx =3D file_to_ctx(filp);
> +
> +

Style: drop the extra empty line.

> +=09v4l2_fh_del(&ctx->fh, filp);
> +=09v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +=09cancel_delayed_work_sync(&ctx->watchdog_work);
> +=09v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> +=09v4l2_fh_exit(&ctx->fh);
> +=09avd_buf_free(ctx->dev, &ctx->inst);
> +=09avd_buf_free(ctx->dev, &ctx->pipe_state);
> +=09avd_buf_free(ctx->dev, &ctx->job.buf);
> +=09kfree(ctx);
> +
> +=09return 0;
> +}
> +
> +static const struct v4l2_file_operations avd_fops =3D {
> +=09.owner =3D THIS_MODULE,
> +=09.open =3D avd_open,
> +=09.release =3D avd_release,
> +=09.poll =3D v4l2_m2m_fop_poll,
> +=09.unlocked_ioctl =3D video_ioctl2,
> +=09.mmap =3D v4l2_m2m_fop_mmap,
> +};
> +
> +static const struct v4l2_m2m_ops avd_m2m_ops =3D {
> +=09.device_run =3D avd_device_run,
> +};
> +
> +static const struct media_device_ops avd_media_ops =3D {
> +=09.req_validate =3D vb2_request_validate,
> +=09.req_queue =3D v4l2_m2m_request_queue,
> +};
> +
> +static int avd_v4l2_init(struct avd_dev *avd)
> +{
> +=09int ret;
> +
> +=09ret =3D v4l2_device_register(avd->dev, &avd->v4l2_dev);
> +=09if (ret) {
> +=09=09dev_err(avd->dev, "Failed to register V4L2 device\n");
> +=09=09return ret;
> +=09}
> +
> +=09avd->m2m_dev =3D v4l2_m2m_init(&avd_m2m_ops);
> +=09if (IS_ERR(avd->m2m_dev)) {
> +=09=09v4l2_err(&avd->v4l2_dev, "Failed to init mem2mem device\n");
> +=09=09ret =3D PTR_ERR(avd->m2m_dev);
> +=09=09goto err_unregister_v4l2;
> +=09}
> +
> +=09avd->mdev.dev =3D avd->dev;
> +=09strscpy(avd->mdev.model, "avd", sizeof(avd->mdev.model));
> +=09strscpy(avd->mdev.bus_info, "platform:avd", sizeof(avd->mdev.bus_info=
));
> +=09media_device_init(&avd->mdev);
> +=09avd->mdev.ops =3D &avd_media_ops;
> +=09avd->v4l2_dev.mdev =3D &avd->mdev;
> +
> +=09avd->vdev.lock =3D &avd->vdev_lock;
> +=09avd->vdev.v4l2_dev =3D &avd->v4l2_dev;
> +=09avd->vdev.fops =3D &avd_fops;
> +=09avd->vdev.release =3D video_device_release_empty;
> +=09avd->vdev.vfl_dir =3D VFL_DIR_M2M;
> +=09avd->vdev.device_caps =3D V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPL=
ANE;
> +=09avd->vdev.ioctl_ops =3D &avd_ioctl_ops;
> +=09video_set_drvdata(&avd->vdev, avd);
> +=09strscpy(avd->vdev.name, "avd", sizeof(avd->vdev.name));
> +
> +=09ret =3D video_register_device(&avd->vdev, VFL_TYPE_VIDEO, -1);
> +=09if (ret) {
> +=09=09v4l2_err(&avd->v4l2_dev, "Failed to register video device\n");
> +=09=09goto err_cleanup_mc;
> +=09}
> +
> +=09ret =3D v4l2_m2m_register_media_controller(avd->m2m_dev, &avd->vdev,
> +=09=09=09=09=09=09 MEDIA_ENT_F_PROC_VIDEO_DECODER);
> +=09if (ret) {
> +=09=09v4l2_err(&avd->v4l2_dev,
> +=09=09=09 "Failed to initialize V4L2 M2M media controller\n");
> +=09=09goto err_unregister_vdev;
> +=09}
> +
> +=09ret =3D media_device_register(&avd->mdev);
> +=09if (ret) {
> +=09=09v4l2_err(&avd->v4l2_dev, "Failed to register media device\n");
> +=09=09goto err_unregister_mc;
> +=09}
> +
> +=09return 0;
> +
> +err_unregister_mc:
> +=09v4l2_m2m_unregister_media_controller(avd->m2m_dev);
> +
> +err_unregister_vdev:
> +=09video_unregister_device(&avd->vdev);
> +
> +err_cleanup_mc:
> +=09media_device_cleanup(&avd->mdev);
> +=09v4l2_m2m_release(avd->m2m_dev);
> +
> +err_unregister_v4l2:
> +=09v4l2_device_unregister(&avd->v4l2_dev);
> +=09return ret;
> +}
> +
> +static void avd_v4l2_cleanup(struct avd_dev *avd)
> +{
> +=09media_device_unregister(&avd->mdev);
> +=09v4l2_m2m_unregister_media_controller(avd->m2m_dev);
> +=09video_unregister_device(&avd->vdev);
> +=09media_device_cleanup(&avd->mdev);
> +=09v4l2_m2m_release(avd->m2m_dev);
> +=09v4l2_device_unregister(&avd->v4l2_dev);
> +}
> +
> +static const struct avd_variant avd_t8103_variant =3D {
> +=09.capabilities =3D AVD_CAPABILITY_HEVC |
> +=09=09=09AVD_CAPABILITY_H264 |
> +=09=09=09AVD_CAPABILITY_VP9,
> +=09.fw_name =3D "apple/avd-fw-v2-t0.bin",
> +=09.revision =3D 3,
> +=09.quirks =3D AVD_QUIRK_LSR | AVD_QUIRK_NO_PIPE_STATE,
> +};
> +
> +static const struct avd_variant avd_t6000_variant =3D {
> +=09.capabilities =3D AVD_CAPABILITY_HEVC |
> +=09=09=09AVD_CAPABILITY_H264 |
> +=09=09=09AVD_CAPABILITY_VP9,
> +=09.fw_name =3D "apple/avd-fw-v3-t0.bin",
> +=09.revision =3D 4,
> +=09.quirks =3D AVD_QUIRK_LSR | AVD_QUIRK_NO_PIPE_STATE,
> +};
> +
> +static const struct avd_variant avd_t8112_variant =3D {
> +=09.capabilities =3D AVD_CAPABILITY_HEVC |
> +=09=09=09AVD_CAPABILITY_H264 |
> +=09=09=09AVD_CAPABILITY_VP9,
> +=09.fw_name =3D "apple/avd-fw-v3-t1.bin",
> +=09.revision =3D 4,
> +=09.quirks =3D AVD_QUIRK_LSR,
> +};
> +
> +static const struct avd_variant avd_t6020_variant =3D {
> +=09.capabilities =3D AVD_CAPABILITY_HEVC |
> +=09=09=09AVD_CAPABILITY_H264 |
> +=09=09=09AVD_CAPABILITY_VP9,
> +=09.fw_name =3D "apple/avd-fw-v3-t2.bin",
> +=09.revision =3D 4,
> +};
> +
> +static const struct avd_variant avd_t8122_variant =3D {
> +=09.capabilities =3D AVD_CAPABILITY_HEVC |
> +=09=09=09AVD_CAPABILITY_H264 |
> +=09=09=09AVD_CAPABILITY_VP9 |
> +=09=09=09AVD_CAPABILITY_AV1,
> +=09.fw_name =3D "apple/avd-fw-v4-t0.bin",
> +=09.revision =3D 4,
> +};
> +
> +static const struct avd_variant avd_t8140_variant =3D {
> +=09.capabilities =3D AVD_CAPABILITY_HEVC |
> +=09=09=09AVD_CAPABILITY_H264 |
> +=09=09=09AVD_CAPABILITY_VP9 |
> +=09=09=09AVD_CAPABILITY_AV1,
> +=09.fw_name =3D "apple/avd-fw-v5-t0.bin",
> +=09.revision =3D 4,
> +};
> +
> +static const struct avd_variant avd_t8132_variant =3D {
> +=09.capabilities =3D AVD_CAPABILITY_HEVC |
> +=09=09=09AVD_CAPABILITY_H264 |
> +=09=09=09AVD_CAPABILITY_VP9 |
> +=09=09=09AVD_CAPABILITY_AV1,
> +=09.fw_name =3D "apple/avd-fw-v5-t1.bin",
> +=09.revision =3D 4,
> +};
> +
> +/* can also be derived from a version register */
> +static const struct of_device_id avd_of_match[] =3D {
> +=09{ .compatible =3D "apple,t8103-avd", .data =3D &avd_t8103_variant },
> +=09{ .compatible =3D "apple,t6000-avd", .data =3D &avd_t6000_variant },
> +=09{ .compatible =3D "apple,t8112-avd", .data =3D &avd_t8112_variant },
> +=09{ .compatible =3D "apple,t6020-avd", .data =3D &avd_t6020_variant },
> +=09{ .compatible =3D "apple,t8122-avd", .data =3D &avd_t8122_variant },
> +=09{ .compatible =3D "apple,t8132-avd", .data =3D &avd_t8132_variant },
> +=09{ .compatible =3D "apple,t8140-avd", .data =3D &avd_t8140_variant },
> +=09{},
> +};
> +
> +MODULE_DEVICE_TABLE(of, avd_of_match);
> +
> +static int avd_probe(struct platform_device *pdev)
> +{
> +=09struct avd_dev *avd;
> +=09int ret, irq;
> +
> +=09avd =3D devm_kzalloc(&pdev->dev, sizeof(*avd), GFP_KERNEL);
> +=09if (!avd)
> +=09=09return -ENOMEM;
> +
> +=09platform_set_drvdata(pdev, avd);
> +=09avd->dev =3D &pdev->dev;
> +=09avd->pdev =3D pdev;
> +
> +=09mutex_init(&avd->vdev_lock);
> +
> +=09avd->variant =3D of_device_get_match_data(&pdev->dev);
> +
> +=09avd->rstc =3D devm_reset_control_get_exclusive(avd->dev, NULL);
> +
> +=09if (IS_ERR(avd->rstc))
> +=09=09return PTR_ERR(avd->rstc);
> +
> +=09avd->piodma =3D devm_platform_ioremap_resource_byname(pdev, "piodma")=
;
> +=09if (IS_ERR(avd->piodma))
> +=09=09return PTR_ERR(avd->piodma);
> +
> +=09avd->code =3D devm_platform_ioremap_resource_byname(pdev, "code");
> +=09if (IS_ERR(avd->code))
> +=09=09return PTR_ERR(avd->code);
> +
> +=09avd->sram =3D devm_platform_ioremap_resource_byname(pdev, "sram");
> +=09if (IS_ERR(avd->sram))
> +=09=09return PTR_ERR(avd->sram);
> +
> +=09avd->mbox =3D devm_platform_ioremap_resource_byname(pdev, "mbox");
> +=09if (IS_ERR(avd->mbox))
> +=09=09return PTR_ERR(avd->mbox);
> +
> +=09avd->ctrl =3D devm_platform_ioremap_resource_byname(pdev, "ctrl");
> +=09if (IS_ERR(avd->ctrl))
> +=09=09return PTR_ERR(avd->ctrl);
> +
> +=09avd->sram_start =3D platform_get_resource_byname(pdev, IORESOURCE_MEM=
,
> +=09=09=09=09=09=09       "sram")->start >> 4;
> +
> +=09ret =3D dma_set_mask_and_coherent(avd->dev,
> +=09=09=09=09=09DMA_BIT_MASK((avd->variant->quirks &
> +=09=09=09=09=09=09     AVD_QUIRK_LSR) ? 38 : 64));
> +=09if (ret) {
> +=09=09dev_err(avd->dev, "Failed to set DMA mask");
> +=09=09return ret;
> +=09}
> +
> +=09irq =3D platform_get_irq_byname(pdev, "mbox0");
> +=09if (irq < 0)
> +=09=09return irq;
> +=09ret =3D devm_request_threaded_irq(&pdev->dev, irq, NULL, avd_irq_hand=
ler,
> +=09=09=09=09=09IRQF_ONESHOT, dev_name(&pdev->dev),
> +=09=09=09=09=09avd);
> +=09if (ret) {
> +=09=09dev_err(avd->dev, "Could not request IRQ 0");
> +=09=09return ret;
> +=09}
> +
> +=09avd->domain =3D iommu_get_domain_for_dev(avd->dev);
> +=09if (!avd->domain)
> +=09=09return -EINVAL;
> +
> +=09avd->empty_domain =3D iommu_paging_domain_alloc(avd->dev);
> +=09if (IS_ERR(avd->empty_domain)) {
> +=09=09dev_err(avd->dev, "cannot alloc new empty domain");
> +=09=09return PTR_ERR(avd->empty_domain);
> +=09}
> +
> +=09ret =3D request_firmware(&avd->fw, avd->variant->fw_name, avd->dev);
> +=09if (ret) {
> +=09=09dev_err(avd->dev, "failed to load firmware: %d", ret);
> +=09=09iommu_domain_free(avd->empty_domain);
> +=09=09return ret;
> +=09}
> +
> +=09pm_runtime_set_autosuspend_delay(avd->dev, 100);
> +=09pm_runtime_use_autosuspend(avd->dev);
> +=09pm_runtime_enable(avd->dev);
> +
> +=09ret =3D avd_v4l2_init(avd);
> +=09if (ret)
> +=09=09goto err_disable_runtime_pm;
> +
> +=09return 0;
> +
> +err_disable_runtime_pm:
> +=09pm_runtime_dont_use_autosuspend(&pdev->dev);
> +=09pm_runtime_disable(&pdev->dev);
> +=09release_firmware(avd->fw);
> +=09iommu_domain_free(avd->empty_domain);
> +=09return ret;
> +}
> +
> +static void avd_remove(struct platform_device *pdev)
> +{
> +=09struct avd_dev *avd =3D platform_get_drvdata(pdev);
> +
> +=09avd_v4l2_cleanup(avd);
> +
> +=09iommu_domain_free(avd->empty_domain);
> +
> +=09release_firmware(avd->fw);
> +
> +=09pm_runtime_disable(avd->dev);
> +=09pm_runtime_dont_use_autosuspend(avd->dev);
> +}
> +
> +static __maybe_unused int avd_runtime_resume(struct device *dev)
> +{
> +=09int ret;
> +=09struct avd_dev *avd =3D platform_get_drvdata(to_platform_device(dev))=
;
> +
> +=09ret =3D avd_boot(avd);
> +=09if (ret)
> +=09=09dev_err(dev, "failed to boot");
> +=09return ret;
> +}
> +
> +static __maybe_unused int avd_runtime_suspend(struct device *dev)
> +{
> +=09struct avd_dev *avd =3D platform_get_drvdata(to_platform_device(dev))=
;
> +
> +=09avd_shutdown(avd);
> +=09return 0;
> +}
> +
> +static const struct dev_pm_ops avd_pm_ops =3D {
> +=09SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +=09=09=09=09pm_runtime_force_resume)
> +=09SET_RUNTIME_PM_OPS(avd_runtime_suspend, avd_runtime_resume, NULL)
> +};
> +
> +static struct platform_driver avd_driver =3D {
> +=09.probe =3D avd_probe,
> +=09.remove =3D avd_remove,
> +=09.driver =3D {
> +=09=09.name =3D "avd",
> +=09=09.of_match_table =3D avd_of_match,
> +=09=09.pm =3D pm_ptr(&avd_pm_ops),
> +=09},
> +};
> +module_platform_driver(avd_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("Apple Video Decoder driver");
> +MODULE_FIRMWARE("apple/avd-fw-v2-t0.bin");
> +MODULE_FIRMWARE("apple/avd-fw-v3-t0.bin");
> +MODULE_FIRMWARE("apple/avd-fw-v3-t1.bin");
> +MODULE_FIRMWARE("apple/avd-fw-v3-t2.bin");
> +MODULE_FIRMWARE("apple/avd-fw-v4-t0.bin");
> +MODULE_FIRMWARE("apple/avd-fw-v5-t0.bin");
> +MODULE_FIRMWARE("apple/avd-fw-v5-t1.bin");

I believe these are made by you, did you publish them into linux-framework?=
 or
do you expect them to be built from source ? Should be part of the cover.

> diff --git a/drivers/media/platform/apple/avd/avd-inst.h b/drivers/media/=
platform/apple/avd/avd-inst.h
> new file mode 100644
> index 000000000000..baa783d00f18
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-inst.h
> @@ -0,0 +1,210 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Apple Video Decoder instruction stream definitions
> + *
> + * Copyright (C) 2026 The Asahi Linux Contributors
> + * Copyright (C) 2026 Sofus Forstreuter <sofus.c@icloud.com>
> + * Copyright (C) 2023 Eileen Yoon <eyn@gmx.com>
> + *
> + * The AVD block consists of one to four processors for each codecs
> + * called "VP". Its the VP's job to prepare codecs specifik syntax into
> + * something the shared processor(s?) (called PP, Pipeline?) understands=
. PP
> + * implements different DSP routines: QT, IPMC, LF, MV, TP, PC, SW, LR.
> + *
> + * When VP processes a u32, if the value has the two upper bits set and =
unset
> + * respectively, it will execute the opcode function stored in the next =
8
> + * bits.
> + *
> + * Please refer to
> + * https://web.archive.org/web/20240105073842/https://eiln.net/avd-notes=
2.html
> + * for an excellent write-up by Eileen.
> + */
> +
> +#ifndef AVD_INST_H_
> +#define AVD_INST_H_
> +
> +#include <linux/types.h>
> +#include <linux/bitfield.h>
> +
> +#include "avd.h"
> +
> +#define AVD_OP_HDR=09=09=09FIELD_PREP(GENMASK(31, 20), 0x2db)
> +#define AVD_OP_HDR_CONST=09=09FIELD_PREP(GENMASK(10, 0), 0x2e0)
> +
> +/*
> + * output in packed PX30
> + * 10 bits per component. With groups of tree packed into 4 bytes (littl=
e
> + * endian order)
> + *  P  3  2  1
> + * [2:10:10:10]
> + *
> + * additionally, av1 and vp9 need an extra scratch buffer if this is set
> + */
> +#define AVD_OP_HDR_FLAG_PACKED(v)=09FIELD_PREP(BIT(10), !!(v))
> +/* decompress pixel data */
> +#define AVD_OP_HDR_FLAG_DECOMP(v)=09FIELD_PREP(BIT(12), !!(v))
> +#define AVD_OP_HDR_FLAG_INTRA(v)=09FIELD_PREP(BIT(13), !!(v))
> +#define AVD_OP_HDR_FLAG_PIPE_STATE(v)=09FIELD_PREP(BIT(19), !!(v))
> +
> +#define AVD_OP_WEIGHTS_HDR=09=09FIELD_PREP(GENMASK(31, 20), 0x2dd)
> +#define AVD_OP_WEIGHTS_HDR_CHROMA(v)=09FIELD_PREP(GENMASK(2, 0), v)
> +#define AVD_OP_WEIGHTS_HDR_LUMA(v)=09FIELD_PREP(GENMASK(5, 3), v)
> +#define AVD_OP_WEIGHTS_HDR_FLAG0(v)=09FIELD_PREP(BIT(6), !!(v))
> +#define AVD_OP_WEIGHTS_HDR_FLAG1(v)=09FIELD_PREP(BIT(7), !!(v))
> +
> +#define AVD_OP_WEIGHTS=09=09=09FIELD_PREP(GENMASK(31, 20), 0x2de)
> +#define AVD_OP_WEIGHTS_WEIGHT(v)=09FIELD_PREP(GENMASK(8, 0), v)
> +#define AVD_OP_WEIGHTS_INDEX(v)=09=09FIELD_PREP(GENMASK(12, 9), v)
> +#define AVD_OP_WEIGHTS_LIST_IDX(v)=09FIELD_PREP(BIT(13), v)
> +/* 1 =3D luma, 2,3 =3D chroma[{0,1}] */
> +#define AVD_OP_WEIGHTS_IDENT(v)=09=09FIELD_PREP(GENMASK(16, 14), v)
> +
> +#define AVD_OP_OFFSETS=09=09=09FIELD_PREP(GENMASK(31, 20), 0x2df)
> +#define AVD_OP_OFFSETS_OFFSET(v)=09FIELD_PREP(GENMASK(15, 0), v)
> +
> +#define AVD_OP_CODED_DATA=09=09FIELD_PREP(GENMASK(31, 20), 0x2d8)
> +#define AVD_OP_CODED_IN_HI(v)=09=09FIELD_PREP(GENMASK(12, 0), (u64)(v) >=
> 32)
> +#define AVD_OP_CODED_IN_LO(v)=09=09((u32)(v) & 0xffffffff)
> +#define AVD_OP_CODED_DATA_FLAG0(v)=09FIELD_PREP(BIT(13), !!(v))
> +#define AVD_OP_CODED_DATA_FLAG1(v)=09FIELD_PREP(BIT(14), !!(v))
> +#define AVD_OP_CODED_DATA_BIT_OFF(v)=09FIELD_PREP(GENMASK(18, 15), v)
> +
> +#define AVD_OP_SL_LOC=09=09=09FIELD_PREP(GENMASK(31, 24), 0x2c)
> +#define AVD_OP_SL_LOC_X(v)=09=09FIELD_PREP(GENMASK(11, 0), v)
> +#define AVD_OP_SL_LOC_Y(v)=09=09FIELD_PREP(GENMASK(23, 12), v)
> +
> +#define AVD_OP_SL_DIM_START=09=09FIELD_PREP(GENMASK(31, 24), 0x2a)
> +#define AVD_OP_SL_DIM_START_X(v)=09FIELD_PREP(GENMASK(11, 0), v)
> +#define AVD_OP_SL_DIM_START_Y(v)=09FIELD_PREP(GENMASK(23, 12), v)
> +
> +/* end is not an op */
> +#define AVD_SL_DIM_END_X(v)=09=09FIELD_PREP(GENMASK(11, 0), v)
> +#define AVD_SL_DIM_END_Y(v)=09=09FIELD_PREP(GENMASK(23, 12), v)
> +#define AVD_SL_DIM_END_COL(v)=09=09FIELD_PREP(GENMASK(27, 24), v)
> +#define AVD_SL_DIM_END_ROW(v)=09=09FIELD_PREP(GENMASK(31, 28), v)
> +
> +#define AVD_OP_SL_REF=09=09=09FIELD_PREP(GENMASK(31, 24), 0x2d)
> +#define AVD_OP_SL_REF_MAX_MERGE(v)=09FIELD_PREP(GENMASK(3, 1), v)
> +
> +#define AVD_OP_SL_REF_FLAG0(v)=09=09FIELD_PREP(BIT(4), !!(v))
> +#define AVD_OP_SL_REF_FLAG_CABAC(v)=09FIELD_PREP(BIT(5), !!(v))
> +#define AVD_OP_SL_REF_FLAG1(v)=09=09FIELD_PREP(BIT(6), !!(v))
> +#define AVD_OP_SL_REF_NUM_L0(v)=09=09FIELD_PREP(GENMASK(14, 11), v)
> +#define AVD_OP_SL_REF_NUM_L1(v)=09=09FIELD_PREP(GENMASK(10, 7), v)
> +#define AVD_OP_SL_REF_FLAG2(v)=09=09FIELD_PREP(BIT(15), !!(v))
> +#define AVD_OP_SL_REF_SLICE_P(v)=09FIELD_PREP(BIT(16), !!(v))
> +#define AVD_OP_SL_REF_SLICE_I(v)=09FIELD_PREP(BIT(17), !!(v))
> +/* not really kinda more like has_ref_and_ref_is_valid_ref */
> +#define AVD_OP_SL_REF_SLICE_B(v)=09FIELD_PREP(BIT(18), !!(v))
> +
> +#define AVD_OP_QP=09=09=09FIELD_PREP(GENMASK(31, 20), 0x2d9)
> +#define AVD_OP_QP_CR_OFF(v)=09=09FIELD_PREP(GENMASK(4, 0), v)
> +#define AVD_OP_QP_CB_OFF(v)=09=09FIELD_PREP(GENMASK(9, 5), v)
> +#define AVD_OP_QP_VAL(v)=09=09FIELD_PREP(GENMASK(16, 10), v)
> +
> +#define AVD_OP_DBLK=09=09=09FIELD_PREP(GENMASK(31, 20), 0x2da)
> +#define AVD_OP_DBLK_FLAG_SAO_CHROMA(v)=09FIELD_PREP(BIT(6), !!(v))
> +#define AVD_OP_DBLK_FLAG_SAO_LUMA(v)=09FIELD_PREP(BIT(7), !!(v))
> +#define AVD_OP_DBLK_OFF0(v)=09=09FIELD_PREP(GENMASK(11, 8), v)
> +#define AVD_OP_DBLK_OFF1(v)=09=09FIELD_PREP(GENMASK(15, 12), v)
> +#define AVD_OP_DBLK_FLAG_EN(v)=09=09FIELD_PREP(BIT(16), !!(v))
> +#define AVD_OP_DBLK_FLAG_FULL_EN(v)=09FIELD_PREP(BIT(17), !!(v))
> +#define AVD_OP_DBLK_FLAG_TILES_EN(v)=09FIELD_PREP(BIT(18), !!(v))
> +#define AVD_OP_DBLK_FLAG_PCM_EN(v)=09FIELD_PREP(BIT(19), !!(v))
> +
> +#define AVD_OP_REF=09=09=09FIELD_PREP(GENMASK(31, 20), 0x2dc)
> +/* same order as they where submitted */
> +#define AVD_OP_REF_DBP_IDX(v)=09=09FIELD_PREP(GENMASK(3, 0), v)
> +#define AVD_OP_REF_LOOP_IDX(v)=09=09FIELD_PREP(GENMASK(7, 4), v)
> +#define AVD_OP_REF_LIST_IDX(v)=09=09FIELD_PREP(GENMASK(11, 8), v)
> +
> +#define AVD_HDR_CODEC_MODE(v)=09=09FIELD_PREP(GENMASK(28, 24), v)
> +#define AVD_HDR_WIDTH(v)=09=09FIELD_PREP(GENMASK(15, 0), v)
> +#define AVD_HDR_HEIGHT(v)=09=09FIELD_PREP(GENMASK(31, 16), v)
> +
> +#define AVD_HDR_FEAT_H264=09=09FIELD_PREP(GENMASK(3, 0), 10)
> +#define AVD_HDR_FEAT_PIPE_STATE_EN(v)=09FIELD_PREP(GENMASK(7, 4), (v) ? =
3 : 0)
> +#define AVD_HDR_FEAT_H26X=09=09FIELD_PREP(BIT(20), 1)
> +#define AVD_HDR_FEAT_COMMON=09=09FIELD_PREP(BIT(21), 1)
> +#define AVD_HDR_FEAT_VP9=09=09FIELD_PREP(BIT(17), 1)
> +
> +#define AVD_HDR_COMMON_FLAG0(v)=09=09FIELD_PREP(BIT(0), !!(v))
> +#define AVD_HDR_COMMON_LUMA_TBS(v)=09FIELD_PREP(GENMASK(8, 7), v)
> +#define AVD_HDR_COMMON_MIN_LUMA_TBS(v)=09FIELD_PREP(GENMASK(10, 9), v)
> +#define AVD_HDR_COMMON_LUMA_CBS(v)=09FIELD_PREP(GENMASK(12, 11), v)
> +#define AVD_HDR_COMMON_MIN_LUMA_CBS(v)=09FIELD_PREP(GENMASK(14, 13), v)
> +#define AVD_HDR_COMMON_BIT_DEPTH_L(v)=09FIELD_PREP(GENMASK(18, 15), v)
> +#define AVD_HDR_COMMON_BIT_DEPTH_C(v)=09FIELD_PREP(GENMASK(23, 19), v)
> +#define AVD_HDR_COMMON_CHROMA_FORMAT(v)=09FIELD_PREP(GENMASK(26, 24), v)
> +
> +#define AVD_HDR_H26X_QP_OFFSET_CR(v)=09FIELD_PREP(GENMASK(4, 0), v)
> +#define AVD_HDR_H26X_QP_OFFSET_CB(v)=09FIELD_PREP(GENMASK(9, 5), v)
> +
> +#define AVD_SCALING_I0(v)=09=09FIELD_PREP(GENMASK(7, 0), v)
> +#define AVD_SCALING_I1(v)=09=09FIELD_PREP(GENMASK(15, 8), v)
> +#define AVD_SCALING_I2(v)=09=09FIELD_PREP(GENMASK(23, 16), v)
> +#define AVD_SCALING_I3(v)=09=09FIELD_PREP(GENMASK(31, 24), v)
> +
> +#define AVD_REF_NUM(v)=09=09=09FIELD_PREP(GENMASK(31, 28), v)
> +#define AVD_REF_FLAG_CONST=09=09FIELD_PREP(BIT(24), 1)
> +#define AVD_REF_FLAG_LONG(v)=09=09FIELD_PREP(BIT(17), !!(v))
> +#define AVD_REF_DELTA_POC(v)=09=09FIELD_PREP(GENMASK(16, 0), v)
> +
> +#define AVD_FIFO_SIZE=09=09=09(0x100000 * 12)
> +
> +static inline void push(struct avd_ctx *ctx, u32 inst)
> +{
> +=09struct avd_job *job =3D &ctx->job;
> +=09struct avd_segment *seg =3D &job->segments[job->num];
> +
> +=09seg->instructions[seg->num++] =3D inst;
> +}
> +
> +static inline void push_address(struct avd_ctx *ctx, dma_addr_t addr)
> +{
> +=09if (ctx->dev->variant->quirks & AVD_QUIRK_LSR) {
> +=09=09push(ctx, addr >> 8);
> +=09} else {
> +=09=09push(ctx, (u32)(addr & 0xffffffff));
> +=09=09push(ctx, (u32)((u64)addr >> 32));
> +=09}
> +}
> +
> +static inline void push_comp(struct avd_ctx *ctx, dma_addr_t addr,
> +=09=09=09     u32 offsets[4])
> +{
> +=09if (ctx->dev->variant->quirks & AVD_QUIRK_LSR) {
> +=09=09for (int i =3D 0; i < 4; i++)
> +=09=09=09push(ctx, (addr + offsets[i]) >> 7);
> +=09} else {
> +=09=09for (int i =3D 0; i < 4; i++)
> +=09=09=09push_address(ctx, (addr + offsets[i]));
> +=09}
> +}
> +
> +#ifdef DEBUG_INST
> +#define push(inst, name)                                           \
> +=09do {                                                       \
> +=09=09dev_info(ctx->dev->dev, "%8x | %s", (inst), name); \
> +=09=09push(ctx, inst);                                   \
> +=09} while (0)
> +
> +#else
> +#define push(inst, name) push(ctx, inst)
> +#endif
> +
> +#ifdef DEBUG_INST_ADDR
> +#define pusha(inst, name, i)                                            =
       \
> +=09do {                                                                 =
  \
> +=09=09dev_info(ctx->dev->dev, "%8llx | %s[%d]", (inst) & 0xffffffff, \
> +=09=09=09 name, i);                                             \
> +=09=09dev_info(ctx->dev->dev, "%8llx | %s[%d] (high)", (inst) >> 32, \
> +=09=09=09 name, i);                                             \
> +=09=09push_address(ctx, inst);                                       \
> +=09} while (0)
> +
> +#else
> +#define pusha(inst, name, i) push_address(ctx, inst)
> +#endif
> +
> +#endif /* AVD_INST_H_ */
> diff --git a/drivers/media/platform/apple/avd/avd-v4l2.c b/drivers/media/=
platform/apple/avd/avd-v4l2.c
> new file mode 100644
> index 000000000000..838f6e348a49
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd-v4l2.c
> @@ -0,0 +1,783 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Apple Video Decoder V4L2 M2M api functions
> + *
> + * Copyright (C) 2026 The Asahi Linux Contributors
> + * Copyright (C) 2026 Sofus Forstreuter <sofus.c@icloud.com>
> + *
> + * Based on rkvdec driver by Collabora, Ltd.
> + * Copyright (C) 2019 Collabora, Ltd.
> + * Based on rkvdec driver by Google LLC. (Tomasz Figa <tfiga@chromium.or=
g>)
> + * Based on s5p-mfc driver by Samsung Electronics Co., Ltd.
> + * Copyright (C) 2011 Samsung Electronics Co., Ltd.
> + */
> +
> +#include <linux/pm_runtime.h>
> +
> +#include <media/v4l2-event.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/videobuf2-dma-contig.h>
> +
> +#include "avd.h"
> +
> +static const struct avd_decoded_fmt_desc avd_decoded_fmts[] =3D {
> +=09{
> +=09=09.fourcc =3D V4L2_PIX_FMT_NV12,
> +=09=09.image_fmt =3D AVD_IMG_FMT_420_8BIT,
> +=09},
> +=09{
> +=09=09.fourcc =3D V4L2_PIX_FMT_P010,
> +=09=09.image_fmt =3D AVD_IMG_FMT_420_10BIT,
> +=09},
> +=09{
> +=09=09.fourcc =3D V4L2_PIX_FMT_NV16,
> +=09=09.image_fmt =3D AVD_IMG_FMT_422_8BIT,
> +=09},
> +=09{
> +=09=09.fourcc =3D V4L2_PIX_FMT_P210,
> +=09=09.image_fmt =3D AVD_IMG_FMT_422_10BIT,
> +=09},
> +=09{
> +=09=09.fourcc =3D V4L2_PIX_FMT_APPLE_AX12,
> +=09=09.image_fmt =3D AVD_IMG_FMT_420_8BIT,
> +=09},
> +=09{
> +=09=09.fourcc =3D V4L2_PIX_FMT_APPLE_AX03,
> +=09=09.image_fmt =3D AVD_IMG_FMT_420_10BIT,
> +=09},
> +=09{
> +=09=09.fourcc =3D V4L2_PIX_FMT_APPLE_AX16,
> +=09=09.image_fmt =3D AVD_IMG_FMT_422_8BIT,
> +=09},
> +=09{
> +=09=09.fourcc =3D V4L2_PIX_FMT_APPLE_AX23,
> +=09=09.image_fmt =3D AVD_IMG_FMT_422_10BIT,
> +=09},
> +};
> +
> +static bool is_interchange(u32 fourcc)
> +{
> +=09return fourcc =3D=3D V4L2_PIX_FMT_APPLE_AX12 ||
> +=09=09fourcc =3D=3D V4L2_PIX_FMT_APPLE_AX16 ||
> +=09=09fourcc =3D=3D V4L2_PIX_FMT_APPLE_AX03 ||
> +=09=09fourcc =3D=3D V4L2_PIX_FMT_APPLE_AX23;
> +}
> +
> +static bool avd_image_fmt_match(enum avd_image_fmt fmt1,
> +=09=09=09=09enum avd_image_fmt fmt2)
> +{
> +=09return fmt1 =3D=3D fmt2 || fmt2 =3D=3D AVD_IMG_FMT_ANY ||
> +=09       fmt1 =3D=3D AVD_IMG_FMT_ANY;
> +}
> +
> +static bool avd_image_fmt_changed(struct avd_ctx *ctx,
> +=09=09=09=09  enum avd_image_fmt image_fmt)
> +{
> +=09if (image_fmt =3D=3D AVD_IMG_FMT_ANY)
> +=09=09return false;
> +
> +=09return ctx->image_fmt !=3D image_fmt;
> +}
> +
> +static u32 avd_enum_decoded_fmt(struct avd_ctx *ctx, int index,
> +=09=09=09=09enum avd_image_fmt image_fmt)
> +{
> +=09const struct avd_coded_fmt_desc *desc =3D ctx->coded_fmt_desc;
> +=09int fmt_idx =3D -1;
> +=09unsigned int i;
> +
> +=09if (WARN_ON(!desc))
> +=09=09return 0;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(avd_decoded_fmts); i++) {
> +=09=09if (!avd_image_fmt_match(avd_decoded_fmts[i].image_fmt,
> +=09=09=09=09=09 image_fmt))
> +=09=09=09continue;
> +=09=09fmt_idx++;
> +=09=09if (index =3D=3D fmt_idx)
> +=09=09=09return avd_decoded_fmts[i].fourcc;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static bool avd_is_valid_fmt(struct avd_ctx *ctx, u32 fourcc,
> +=09=09=09     enum avd_image_fmt image_fmt)
> +{
> +=09unsigned int i;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(avd_decoded_fmts); i++) {
> +=09=09if (avd_image_fmt_match(avd_decoded_fmts[i].image_fmt,
> +=09=09=09=09=09image_fmt) &&
> +=09=09    avd_decoded_fmts[i].fourcc =3D=3D fourcc)
> +=09=09=09return true;
> +=09}
> +
> +=09return false;
> +}
> +
> +static void avd_fill_decoded_pixfmt(struct avd_ctx *ctx,
> +=09=09=09=09    struct v4l2_pix_format_mplane *pix_mp)
> +{
> +=09v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width,
> +=09=09=09    pix_mp->height);
> +
> +=09if (is_interchange(pix_mp->pixelformat))
> +=09=09pix_mp->plane_fmt[0].sizeimage =3D 0;
> +=09ctx->comp.start_offset =3D pix_mp->plane_fmt[0].sizeimage;
> +
> +=09fill_comp(&ctx->comp, ctx->image_fmt, pix_mp->width, pix_mp->height);
> +=09pix_mp->plane_fmt[0].sizeimage +=3D ctx->comp.size;
> +
> +=09if (ctx->coded_fmt_desc->ops->adjust_decoded_fmt)
> +=09=09ctx->coded_fmt_desc->ops->adjust_decoded_fmt(ctx, pix_mp);
> +
> +=09pix_mp->plane_fmt[0].sizeimage =3D ALIGN(pix_mp->plane_fmt[0].sizeima=
ge,
> +=09=09=09=09=09       AVD_ALIGN);
> +}
> +
> +static void avd_reset_fmt(struct avd_ctx *ctx, struct v4l2_format *f,
> +=09=09=09  u32 fourcc)
> +{
> +=09memset(f, 0, sizeof(*f));
> +=09f->fmt.pix_mp.pixelformat =3D fourcc;
> +=09f->fmt.pix_mp.field =3D V4L2_FIELD_NONE;
> +=09f->fmt.pix_mp.colorspace =3D V4L2_COLORSPACE_REC709;
> +=09f->fmt.pix_mp.ycbcr_enc =3D V4L2_YCBCR_ENC_DEFAULT;
> +=09f->fmt.pix_mp.quantization =3D V4L2_QUANTIZATION_DEFAULT;
> +=09f->fmt.pix_mp.xfer_func =3D V4L2_XFER_FUNC_DEFAULT;
> +}
> +
> +void avd_reset_decoded_fmt(struct avd_ctx *ctx)
> +{
> +=09struct v4l2_format *f =3D &ctx->decoded_fmt;
> +=09u32 fourcc;
> +
> +=09fourcc =3D avd_enum_decoded_fmt(ctx, 0, ctx->image_fmt);
> +=09avd_reset_fmt(ctx, f, fourcc);
> +=09f->type =3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +=09f->fmt.pix_mp.width =3D ctx->coded_fmt.fmt.pix_mp.width;
> +=09f->fmt.pix_mp.height =3D ctx->coded_fmt.fmt.pix_mp.height;
> +=09avd_fill_decoded_pixfmt(ctx, &f->fmt.pix_mp);
> +}
> +
> +static int avd_try_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +=09struct avd_ctx *ctx =3D
> +=09=09container_of(ctrl->handler, struct avd_ctx, ctrl_hdl);
> +=09const struct avd_coded_fmt_desc *desc =3D ctx->coded_fmt_desc;
> +
> +=09if (desc->ops->try_ctrl)
> +=09=09return desc->ops->try_ctrl(ctx, ctrl);
> +
> +=09return 0;
> +}
> +
> +static int avd_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +=09struct avd_ctx *ctx =3D
> +=09=09container_of(ctrl->handler, struct avd_ctx, ctrl_hdl);
> +=09const struct avd_coded_fmt_desc *desc =3D ctx->coded_fmt_desc;
> +=09enum avd_image_fmt image_fmt;
> +=09struct vb2_queue *vq;
> +
> +=09/* Check if this change requires a capture format reset */
> +=09if (!desc->ops->get_image_fmt)
> +=09=09return 0;
> +
> +=09image_fmt =3D desc->ops->get_image_fmt(ctx, ctrl);
> +=09if (avd_image_fmt_changed(ctx, image_fmt)) {
> +=09=09vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> +=09=09=09=09     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +=09=09if (vb2_is_busy(vq))
> +=09=09=09return -EBUSY;
> +
> +=09=09ctx->image_fmt =3D image_fmt;
> +=09=09avd_reset_decoded_fmt(ctx);
> +=09}
> +
> +=09return 0;
> +}
> +
> +const struct v4l2_ctrl_ops avd_ctrl_ops =3D {
> +=09.try_ctrl =3D avd_try_ctrl,
> +=09.s_ctrl =3D avd_s_ctrl,
> +};
> +
> +static const struct avd_coded_fmt_desc avd_coded_fmts[] =3D {};
> +
> +static bool avd_is_capable(struct avd_ctx *ctx, unsigned int capability)
> +{
> +=09return (ctx->dev->variant->capabilities & capability) =3D=3D capabili=
ty;
> +}
> +
> +static const struct avd_coded_fmt_desc *
> +avd_enum_coded_fmt_desc(struct avd_ctx *ctx, int index)
> +{
> +=09int fmt_idx =3D -1;
> +=09unsigned int i;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(avd_coded_fmts); i++) {
> +=09=09if (!avd_is_capable(ctx, avd_coded_fmts[i].capability))
> +=09=09=09continue;
> +=09=09fmt_idx++;
> +=09=09if (index =3D=3D fmt_idx)
> +=09=09=09return &avd_coded_fmts[i];
> +=09}
> +
> +=09return NULL;
> +}
> +
> +static const struct avd_coded_fmt_desc *
> +avd_find_coded_fmt_desc(struct avd_ctx *ctx, u32 fourcc)
> +{
> +=09unsigned int i;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(avd_coded_fmts); i++) {
> +=09=09if (avd_is_capable(ctx, avd_coded_fmts[i].capability) &&
> +=09=09    avd_coded_fmts[i].fourcc =3D=3D fourcc)
> +=09=09=09return &avd_coded_fmts[i];
> +=09}
> +
> +=09return NULL;
> +}
> +
> +void avd_reset_coded_fmt(struct avd_ctx *ctx)
> +{
> +=09struct v4l2_format *f =3D &ctx->coded_fmt;
> +
> +=09ctx->coded_fmt_desc =3D avd_enum_coded_fmt_desc(ctx, 0);
> +=09avd_reset_fmt(ctx, f, ctx->coded_fmt_desc->fourcc);
> +
> +=09f->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> +=09f->fmt.pix_mp.width =3D ctx->coded_fmt_desc->frmsize.min_width;
> +=09f->fmt.pix_mp.height =3D ctx->coded_fmt_desc->frmsize.min_height;
> +
> +=09f->fmt.pix_mp.num_planes =3D 1;
> +=09if (!f->fmt.pix_mp.plane_fmt[0].sizeimage)
> +=09=09f->fmt.pix_mp.plane_fmt[0].sizeimage =3D
> +=09=09=09f->fmt.pix_mp.width * f->fmt.pix_mp.height;
> +}
> +
> +static int avd_enum_framesizes(struct file *file, void *priv,
> +=09=09=09       struct v4l2_frmsizeenum *fsize)
> +{
> +=09struct avd_ctx *ctx =3D file_to_ctx(file);
> +=09const struct avd_coded_fmt_desc *desc;
> +
> +=09if (fsize->index !=3D 0)
> +=09=09return -EINVAL;
> +
> +=09desc =3D avd_find_coded_fmt_desc(ctx, fsize->pixel_format);
> +=09if (!desc)
> +=09=09return -EINVAL;
> +
> +=09fsize->type =3D V4L2_FRMSIZE_TYPE_CONTINUOUS;
> +=09fsize->stepwise.min_width =3D 1;
> +=09fsize->stepwise.max_width =3D desc->frmsize.max_width;
> +=09fsize->stepwise.step_width =3D 1;
> +=09fsize->stepwise.min_height =3D 1;
> +=09fsize->stepwise.max_height =3D desc->frmsize.max_height;
> +=09fsize->stepwise.step_height =3D 1;
> +
> +=09return 0;
> +}
> +
> +static int avd_querycap(struct file *file, void *priv,
> +=09=09=09struct v4l2_capability *cap)
> +{
> +=09struct avd_dev *avd =3D video_drvdata(file);
> +=09struct video_device *vdev =3D video_devdata(file);
> +
> +=09strscpy(cap->driver, avd->dev->driver->name, sizeof(cap->driver));
> +=09strscpy(cap->card, vdev->name, sizeof(cap->card));
> +=09snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> +=09=09 avd->dev->driver->name);
> +=09return 0;
> +}
> +
> +static int avd_try_capture_fmt(struct file *file, void *priv,
> +=09=09=09       struct v4l2_format *f)
> +{
> +=09struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +=09struct avd_ctx *ctx =3D file_to_ctx(file);
> +=09const struct avd_coded_fmt_desc *coded_desc;
> +
> +=09/*
> +=09 * The codec context should point to a coded format desc, if the form=
at
> +=09 * on the coded end has not been set yet, it should point to the
> +=09 * default value.
> +=09 */
> +=09coded_desc =3D ctx->coded_fmt_desc;
> +=09if (WARN_ON(!coded_desc)) {
> +=09=09dev_err(ctx->dev->dev, "no coded desc!");
> +=09=09return -EINVAL;
> +=09}
> +
> +=09if (!avd_is_valid_fmt(ctx, pix_mp->pixelformat, ctx->image_fmt))
> +=09=09pix_mp->pixelformat =3D
> +=09=09=09avd_enum_decoded_fmt(ctx, 0, ctx->image_fmt);
> +
> +=09/* Always apply the frmsize constraint of the coded end. */
> +=09pix_mp->width =3D max(pix_mp->width, ctx->coded_fmt.fmt.pix_mp.width)=
;
> +=09pix_mp->height =3D max(pix_mp->height, ctx->coded_fmt.fmt.pix_mp.heig=
ht);
> +=09v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
> +=09=09=09=09       &coded_desc->frmsize);
> +
> +=09avd_fill_decoded_pixfmt(ctx, pix_mp);
> +=09pix_mp->field =3D V4L2_FIELD_NONE;
> +
> +=09return 0;
> +}
> +
> +static int avd_try_output_fmt(struct file *file, void *priv,
> +=09=09=09      struct v4l2_format *f)
> +{
> +=09struct v4l2_pix_format_mplane *pix_mp =3D &f->fmt.pix_mp;
> +=09struct avd_ctx *ctx =3D file_to_ctx(file);
> +=09const struct avd_coded_fmt_desc *desc;
> +
> +=09desc =3D avd_find_coded_fmt_desc(ctx, pix_mp->pixelformat);
> +=09if (!desc) {
> +=09=09desc =3D avd_enum_coded_fmt_desc(ctx, 0);
> +=09=09pix_mp->pixelformat =3D desc->fourcc;
> +=09}
> +
> +=09v4l2_apply_frmsize_constraints(&pix_mp->width, &pix_mp->height,
> +=09=09=09=09       &desc->frmsize);
> +
> +=09pix_mp->field =3D V4L2_FIELD_NONE;
> +=09/* All coded formats are considered single planar for now. */
> +=09pix_mp->num_planes =3D 1;
> +
> +=09if (!pix_mp->plane_fmt[0].sizeimage)
> +=09=09pix_mp->plane_fmt[0].sizeimage =3D
> +=09=09=09pix_mp->width * f->fmt.pix_mp.height;
> +
> +=09return 0;
> +}
> +
> +static int avd_s_capture_fmt(struct file *file, void *priv,
> +=09=09=09     struct v4l2_format *f)
> +{
> +=09struct avd_ctx *ctx =3D file_to_ctx(file);
> +=09struct vb2_queue *vq;
> +=09int ret;
> +
> +=09/* Change not allowed if queue is busy */
> +=09vq =3D v4l2_m2m_get_vq(ctx->fh.m2m_ctx,
> +=09=09=09     V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +=09if (vb2_is_busy(vq))
> +=09=09return -EBUSY;
> +
> +=09ret =3D avd_try_capture_fmt(file, priv, f);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ctx->decoded_fmt =3D *f;
> +=09return 0;
> +}
> +
> +static int avd_s_output_fmt(struct file *file, void *priv,
> +=09=09=09    struct v4l2_format *f)
> +{
> +=09struct avd_ctx *ctx =3D file_to_ctx(file);
> +=09struct v4l2_m2m_ctx *m2m_ctx =3D ctx->fh.m2m_ctx;
> +=09const struct avd_coded_fmt_desc *desc;
> +=09struct v4l2_format *cap_fmt;
> +=09struct vb2_queue *peer_vq, *vq;
> +=09int ret;
> +
> +=09/*
> +=09 * In order to support dynamic resolution change, the decoder admits
> +=09 * a resolution change, as long as the pixelformat remains. Can't be
> +=09 * done if streaming.
> +=09 */
> +=09vq =3D v4l2_m2m_get_vq(m2m_ctx, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +=09if (vb2_is_streaming(vq) ||
> +=09    (vb2_is_busy(vq) && f->fmt.pix_mp.pixelformat !=3D
> +=09=09=09=09=09ctx->coded_fmt.fmt.pix_mp.pixelformat))
> +=09=09return -EBUSY;
> +
> +=09/*
> +=09 * Since format change on the OUTPUT queue will reset the CAPTURE
> +=09 * queue, we can't allow doing so when the CAPTURE queue has buffers
> +=09 * allocated.
> +=09 */
> +=09peer_vq =3D v4l2_m2m_get_vq(m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLA=
NE);
> +=09if (vb2_is_busy(peer_vq))
> +=09=09return -EBUSY;
> +
> +=09ret =3D avd_try_output_fmt(file, priv, f);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09desc =3D avd_find_coded_fmt_desc(ctx, f->fmt.pix_mp.pixelformat);
> +=09if (!desc)
> +=09=09return -EINVAL;
> +=09ctx->coded_fmt_desc =3D desc;
> +=09ctx->coded_fmt =3D *f;
> +
> +=09/*
> +=09 * Current decoded format might have become invalid with newly
> +=09 * selected codec, so reset it to default just to be safe and
> +=09 * keep internal driver state sane. User is mandated to set
> +=09 * the decoded format again after we return, so we don't need
> +=09 * anything smarter.
> +=09 *
> +=09 * Note that this will propagates any size changes to the decoded
> +=09 * format.
> +=09 */
> +=09ctx->image_fmt =3D AVD_IMG_FMT_ANY;
> +=09avd_reset_decoded_fmt(ctx);
> +
> +=09/* Propagate colorspace information to capture. */
> +=09cap_fmt =3D &ctx->decoded_fmt;
> +=09cap_fmt->fmt.pix_mp.colorspace =3D f->fmt.pix_mp.colorspace;
> +=09cap_fmt->fmt.pix_mp.xfer_func =3D f->fmt.pix_mp.xfer_func;
> +=09cap_fmt->fmt.pix_mp.ycbcr_enc =3D f->fmt.pix_mp.ycbcr_enc;
> +=09cap_fmt->fmt.pix_mp.quantization =3D f->fmt.pix_mp.quantization;
> +
> +=09/* Enable format specific queue features */
> +=09vq->subsystem_flags |=3D desc->subsystem_flags;
> +
> +=09return 0;
> +}
> +
> +static int avd_g_output_fmt(struct file *file, void *priv,
> +=09=09=09    struct v4l2_format *f)
> +{
> +=09struct avd_ctx *ctx =3D file_to_ctx(file);
> +
> +=09*f =3D ctx->coded_fmt;
> +=09return 0;
> +}
> +
> +static int avd_g_capture_fmt(struct file *file, void *priv,
> +=09=09=09     struct v4l2_format *f)
> +{
> +=09struct avd_ctx *ctx =3D file_to_ctx(file);
> +
> +=09*f =3D ctx->decoded_fmt;
> +=09return 0;
> +}
> +
> +static int avd_enum_output_fmt(struct file *file, void *priv,
> +=09=09=09       struct v4l2_fmtdesc *f)
> +{
> +=09struct avd_ctx *ctx =3D file_to_ctx(file);
> +=09const struct avd_coded_fmt_desc *desc;
> +
> +=09desc =3D avd_enum_coded_fmt_desc(ctx, f->index);
> +=09if (!desc)
> +=09=09return -EINVAL;
> +
> +=09f->pixelformat =3D desc->fourcc;
> +=09return 0;
> +}
> +
> +static int avd_enum_capture_fmt(struct file *file, void *priv,
> +=09=09=09=09struct v4l2_fmtdesc *f)
> +{
> +=09struct avd_ctx *ctx =3D file_to_ctx(file);
> +=09u32 fourcc;
> +
> +=09fourcc =3D avd_enum_decoded_fmt(ctx, f->index, ctx->image_fmt);
> +=09if (!fourcc)
> +=09=09return -EINVAL;
> +
> +=09f->pixelformat =3D fourcc;
> +=09return 0;
> +}
> +
> +const struct v4l2_ioctl_ops avd_ioctl_ops =3D {
> +=09.vidioc_querycap =3D avd_querycap,
> +=09.vidioc_enum_framesizes =3D avd_enum_framesizes,
> +
> +=09.vidioc_try_fmt_vid_cap_mplane =3D avd_try_capture_fmt,
> +=09.vidioc_try_fmt_vid_out_mplane =3D avd_try_output_fmt,
> +=09.vidioc_s_fmt_vid_out_mplane =3D avd_s_output_fmt,
> +=09.vidioc_s_fmt_vid_cap_mplane =3D avd_s_capture_fmt,
> +=09.vidioc_g_fmt_vid_out_mplane =3D avd_g_output_fmt,
> +=09.vidioc_g_fmt_vid_cap_mplane =3D avd_g_capture_fmt,
> +=09.vidioc_enum_fmt_vid_out =3D avd_enum_output_fmt,
> +=09.vidioc_enum_fmt_vid_cap =3D avd_enum_capture_fmt,
> +
> +=09.vidioc_reqbufs =3D v4l2_m2m_ioctl_reqbufs,
> +=09.vidioc_querybuf =3D v4l2_m2m_ioctl_querybuf,
> +=09.vidioc_qbuf =3D v4l2_m2m_ioctl_qbuf,
> +=09.vidioc_dqbuf =3D v4l2_m2m_ioctl_dqbuf,
> +=09.vidioc_prepare_buf =3D v4l2_m2m_ioctl_prepare_buf,
> +=09.vidioc_create_bufs =3D v4l2_m2m_ioctl_create_bufs,
> +=09.vidioc_expbuf =3D v4l2_m2m_ioctl_expbuf,
> +
> +=09.vidioc_subscribe_event =3D v4l2_ctrl_subscribe_event,
> +=09.vidioc_unsubscribe_event =3D v4l2_event_unsubscribe,
> +
> +=09.vidioc_streamon =3D v4l2_m2m_ioctl_streamon,
> +=09.vidioc_streamoff =3D v4l2_m2m_ioctl_streamoff,
> +
> +=09.vidioc_decoder_cmd =3D v4l2_m2m_ioctl_stateless_decoder_cmd,
> +=09.vidioc_try_decoder_cmd =3D v4l2_m2m_ioctl_stateless_try_decoder_cmd,
> +};
> +
> +static int avd_queue_setup(struct vb2_queue *vq, unsigned int *num_buffe=
rs,
> +=09=09=09   unsigned int *num_planes, unsigned int sizes[],
> +=09=09=09   struct device *alloc_devs[])
> +{
> +=09struct avd_ctx *ctx =3D vb2_get_drv_priv(vq);
> +=09struct v4l2_format *f;
> +=09unsigned int i;
> +
> +=09if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +=09=09f =3D &ctx->coded_fmt;
> +=09else
> +=09=09f =3D &ctx->decoded_fmt;
> +
> +=09if (*num_planes) {
> +=09=09if (*num_planes !=3D f->fmt.pix_mp.num_planes)
> +=09=09=09return -EINVAL;
> +
> +=09=09for (i =3D 0; i < f->fmt.pix_mp.num_planes; i++) {
> +=09=09=09if (sizes[i] < f->fmt.pix_mp.plane_fmt[i].sizeimage)
> +=09=09=09=09return -EINVAL;
> +=09=09}
> +=09} else {
> +=09=09*num_planes =3D f->fmt.pix_mp.num_planes;
> +=09=09for (i =3D 0; i < f->fmt.pix_mp.num_planes; i++)
> +=09=09=09sizes[i] =3D f->fmt.pix_mp.plane_fmt[i].sizeimage;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int avd_buf_prepare(struct vb2_buffer *vb)
> +{
> +=09struct vb2_queue *vq =3D vb->vb2_queue;
> +=09struct avd_ctx *ctx =3D vb2_get_drv_priv(vq);
> +=09struct v4l2_format *f;
> +=09unsigned int i;
> +
> +=09if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +=09=09f =3D &ctx->coded_fmt;
> +=09else
> +=09=09f =3D &ctx->decoded_fmt;
> +
> +=09for (i =3D 0; i < f->fmt.pix_mp.num_planes; ++i) {
> +=09=09u32 sizeimage =3D f->fmt.pix_mp.plane_fmt[i].sizeimage;
> +
> +=09=09if (vb2_plane_size(vb, i) < sizeimage)
> +=09=09=09return -EINVAL;
> +=09}
> +
> +=09/*
> +=09 * Buffer's bytesused must be written by driver for CAPTURE buffers.
> +=09 * (for OUTPUT buffers, if userspace passes 0 bytesused, v4l2-core se=
ts
> +=09 * it to buffer length).
> +=09 */
> +=09if (V4L2_TYPE_IS_CAPTURE(vq->type))
> +=09=09vb2_set_plane_payload(vb, 0,
> +=09=09=09=09      f->fmt.pix_mp.plane_fmt[0].sizeimage);
> +
> +=09return 0;
> +}
> +
> +static void avd_buf_queue(struct vb2_buffer *vb)
> +{
> +=09struct avd_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +=09struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +=09v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
> +}
> +
> +static int avd_buf_out_validate(struct vb2_buffer *vb)
> +{
> +=09struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> +
> +=09vbuf->field =3D V4L2_FIELD_NONE;
> +=09return 0;
> +}
> +
> +static void avd_buf_request_complete(struct vb2_buffer *vb)
> +{
> +=09struct avd_ctx *ctx =3D vb2_get_drv_priv(vb->vb2_queue);
> +
> +=09v4l2_ctrl_request_complete(vb->req_obj.req, &ctx->ctrl_hdl);
> +}
> +
> +static int avd_start_streaming(struct vb2_queue *q, unsigned int count)
> +{
> +=09struct avd_ctx *ctx =3D vb2_get_drv_priv(q);
> +=09const struct avd_coded_fmt_desc *desc;
> +=09int ret;
> +
> +=09if (V4L2_TYPE_IS_CAPTURE(q->type))
> +=09=09return 0;
> +
> +=09desc =3D ctx->coded_fmt_desc;
> +=09if (WARN_ON(!desc))
> +=09=09return -EINVAL;
> +
> +=09if (desc->ops->start) {
> +=09=09ret =3D desc->ops->start(ctx);
> +=09=09if (ret)
> +=09=09=09return ret;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static void avd_queue_cleanup(struct vb2_queue *vq, u32 state)
> +{
> +=09struct avd_ctx *ctx =3D vb2_get_drv_priv(vq);
> +
> +=09while (true) {
> +=09=09struct vb2_v4l2_buffer *vbuf;
> +
> +=09=09if (V4L2_TYPE_IS_OUTPUT(vq->type))
> +=09=09=09vbuf =3D v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> +=09=09else
> +=09=09=09vbuf =3D v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
> +
> +=09=09if (!vbuf)
> +=09=09=09break;
> +
> +=09=09v4l2_ctrl_request_complete(vbuf->vb2_buf.req_obj.req,
> +=09=09=09=09=09   &ctx->ctrl_hdl);
> +=09=09v4l2_m2m_buf_done(vbuf, state);
> +=09}
> +}
> +
> +static void avd_stop_streaming(struct vb2_queue *q)
> +{
> +=09struct avd_ctx *ctx =3D vb2_get_drv_priv(q);
> +
> +=09if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +=09=09const struct avd_coded_fmt_desc *desc =3D ctx->coded_fmt_desc;
> +
> +=09=09if (WARN_ON(!desc))
> +=09=09=09return;
> +
> +=09=09if (desc->ops->stop)
> +=09=09=09desc->ops->stop(ctx);
> +=09}
> +
> +=09avd_queue_cleanup(q, VB2_BUF_STATE_ERROR);
> +}
> +
> +const struct vb2_ops avd_queue_ops =3D {
> +=09.queue_setup =3D avd_queue_setup,
> +=09.buf_prepare =3D avd_buf_prepare,
> +=09.buf_queue =3D avd_buf_queue,
> +=09.buf_out_validate =3D avd_buf_out_validate,
> +=09.buf_request_complete =3D avd_buf_request_complete,
> +=09.start_streaming =3D avd_start_streaming,
> +=09.stop_streaming =3D avd_stop_streaming,
> +};
> +
> +void avd_job_finish_no_pm(struct avd_ctx *ctx, enum vb2_buffer_state res=
ult)
> +{
> +=09if (ctx->coded_fmt_desc->ops->done) {
> +=09=09struct vb2_v4l2_buffer *src_buf, *dst_buf;
> +
> +=09=09src_buf =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +=09=09dst_buf =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +=09=09ctx->coded_fmt_desc->ops->done(ctx, src_buf, dst_buf, result);
> +=09}
> +
> +=09v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
> +=09=09=09=09=09 result);
> +}
> +
> +void avd_job_finish(struct avd_ctx *ctx, enum vb2_buffer_state result)
> +{
> +=09struct avd_dev *avd =3D ctx->dev;
> +
> +=09pm_runtime_put_autosuspend(avd->dev);
> +=09avd_job_finish_no_pm(ctx, result);
> +}
> +
> +void avd_run_preamble(struct avd_ctx *ctx, struct avd_run *run)
> +{
> +=09struct media_request *src_req;
> +=09struct avd_decoded_buffer *dst;
> +
> +=09memset(run, 0, sizeof(*run));
> +
> +=09run->bufs.src =3D v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
> +=09run->bufs.dst =3D v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
> +
> +=09run->coded_in =3D
> +=09=09vb2_dma_contig_plane_dma_addr(&run->bufs.src->vb2_buf, 0);
> +=09run->y_out =3D vb2_dma_contig_plane_dma_addr(&run->bufs.dst->vb2_buf,=
 0);
> +=09run->uv_out =3D run->y_out +
> +=09=09      ctx->decoded_fmt.fmt.pix_mp.plane_fmt[0].bytesperline *
> +=09=09=09      ctx->decoded_fmt.fmt.pix_mp.height;
> +
> +=09run->comp_out =3D run->y_out + ctx->comp.start_offset;
> +=09ctx->decomp =3D !is_interchange(ctx->decoded_fmt.fmt.pix_mp.pixelform=
at);
> +
> +=09dst =3D vb2_to_avd_decoded_buf(&run->bufs.dst->vb2_buf);
> +=09memcpy(&dst->comp, &ctx->comp, sizeof(ctx->comp));
> +
> +=09/* Apply request(s) controls if needed. */
> +=09src_req =3D run->bufs.src->vb2_buf.req_obj.req;
> +=09if (src_req)
> +=09=09v4l2_ctrl_request_setup(src_req, &ctx->ctrl_hdl);
> +
> +=09v4l2_m2m_buf_copy_metadata(run->bufs.src, run->bufs.dst);
> +}
> +
> +void avd_run_postamble(struct avd_ctx *ctx, struct avd_run *run)
> +{
> +=09struct media_request *src_req =3D run->bufs.src->vb2_buf.req_obj.req;
> +
> +=09if (src_req)
> +=09=09v4l2_ctrl_request_complete(src_req, &ctx->ctrl_hdl);
> +}
> +
> +static int avd_add_ctrls(struct avd_ctx *ctx, const struct avd_ctrls *ct=
rls)
> +{
> +=09unsigned int i;
> +
> +=09for (i =3D 0; i < ctrls->num_ctrls; i++) {
> +=09=09const struct v4l2_ctrl_config *cfg =3D &ctrls->ctrls[i].cfg;
> +
> +=09=09v4l2_ctrl_new_custom(&ctx->ctrl_hdl, cfg, ctx);
> +=09=09if (ctx->ctrl_hdl.error)
> +=09=09=09return ctx->ctrl_hdl.error;
> +=09}
> +
> +=09return 0;
> +}
> +
> +int avd_init_ctrls(struct avd_ctx *ctx)
> +{
> +=09unsigned int i, nctrls =3D 0;
> +=09int ret;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(avd_coded_fmts); i++)
> +=09=09if (avd_is_capable(ctx, avd_coded_fmts[i].capability))
> +=09=09=09nctrls +=3D avd_coded_fmts[i].ctrls->num_ctrls;
> +
> +=09v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(avd_coded_fmts); i++) {
> +=09=09if (avd_is_capable(ctx, avd_coded_fmts[i].capability)) {
> +=09=09=09ret =3D avd_add_ctrls(ctx, avd_coded_fmts[i].ctrls);
> +=09=09=09if (ret)
> +=09=09=09=09goto err_free_handler;
> +=09=09}
> +=09}
> +
> +=09ret =3D v4l2_ctrl_handler_setup(&ctx->ctrl_hdl);
> +=09if (ret)
> +=09=09goto err_free_handler;
> +
> +=09ctx->fh.ctrl_handler =3D &ctx->ctrl_hdl;
> +=09return 0;
> +
> +err_free_handler:
> +=09v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> +=09return ret;
> +}
> diff --git a/drivers/media/platform/apple/avd/avd.h b/drivers/media/platf=
orm/apple/avd/avd.h
> new file mode 100644
> index 000000000000..980ecce4f3df
> --- /dev/null
> +++ b/drivers/media/platform/apple/avd/avd.h
> @@ -0,0 +1,267 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Apple Video Decoder driver
> + *
> + * Copyright (C) 2026 The Asahi Linux Contributors
> + * Copyright (C) 2026 Sofus Forstreuter <sofus.c@icloud.com>
> + *
> + * Based on rkvdec driver by Collabora, Ltd.
> + * Copyright (C) 2019 Collabora, Ltd.
> + * Based on rkvdec driver by Google LLC. (Tomasz Figa <tfiga@chromium.or=
g>)
> + * Based on s5p-mfc driver by Samsung Electronics Co., Ltd.
> + * Copyright (C) 2011 Samsung Electronics Co., Ltd.
> + */
> +
> +#ifndef AVD_H_
> +#define AVD_H_
> +
> +#include <linux/platform_device.h>
> +#include <linux/firmware.h>
> +#include <linux/iommu.h>
> +#include <linux/slab.h>
> +
> +#include <media/v4l2-ctrls.h>
> +#include <media/v4l2-device.h>
> +#include <media/v4l2-mem2mem.h>
> +#include <media/v4l2-ioctl.h>
> +
> +#define AVD_CAPABILITY_HEVC=09BIT(0)
> +#define AVD_CAPABILITY_H264=09BIT(1)
> +#define AVD_CAPABILITY_VP9=09BIT(2)
> +#define AVD_CAPABILITY_AV1=09BIT(3)
> +
> +/* Shifts addresses right and bytesperline?? */
> +#define AVD_QUIRK_LSR=09=09BIT(0)
> +#define AVD_QUIRK_NO_PIPE_STATE=09BIT(1)
> +
> +#define AVD_REG_RUN_CTRL=090x08
> +#define AVD_RUN_CTRL_UNK_RUN=09BIT(0)
> +#define AVD_RUN_CTRL_UNK_STOP=09(BIT(1) | BIT(2) | BIT(3))
> +
> +#define AVD_REG_MBOX_IRQ_ENABLE=090x48
> +#define AVD_REG_MBOX_IRQ_CLR=090x4c
> +#define AVD_MBOX0_EMPTY=09=09BIT(0)
> +#define AVD_MBOX0_NOT_EMPTY=09BIT(1)
> +
> +#define AVD_REG_MBOX0_STATUS=090x50
> +#define AVD_REG_MBOX0_RETRIEVE=090x58
> +#define AVD_REG_MBOX1_STATUS=090x5c
> +#define AVD_REG_MBOX1_SUBMIT=090x60
> +#define AVD_MBOX_ENABLE=09=09BIT(0)
> +
> +#define AVD_REG_FLAG0_SET=090x90
> +#define AVD_REG_FLAG0_CLR=090x98
> +
> +/* size in number of words (u32) minus one */
> +#define AVD_PIODMA_CMD_SIZE(v)=09FIELD_PREP(GENMASK(31, 18), v)
> +#define AVD_PIODMA_CMD_DEST(v)=09(GENMASK(17, 2) & (v))
> +#define AVD_PIODMA_CMD_CONST=09BIT(0)
> +
> +/*
> + * AVD needs most addresses to be aligned to 256
> + * the only exception are the compressed buffers, they are aligned to 12=
8
> + * instead
> + */
> +#define AVD_ALIGN=09256
> +/* hevc, with a b slice where all references are active and weights are =
sent */
> +#define AVD_MAX_INST=09512
> +
> +struct avd_ctx;
> +struct avd_dev;
> +
> +/* Matches hdr mode (inst stream) and register layout */
> +enum avd_codec {
> +=09AVD_CODEC_HEVC =3D 0,
> +=09AVD_CODEC_H264 =3D 1,
> +=09AVD_CODEC_VP9 =3D 2,
> +=09AVD_CODEC_AV1 =3D 3
> +};
> +
> +struct avd_run {
> +=09struct {
> +=09=09struct vb2_v4l2_buffer *src; /* OUTPUT coded */
> +=09=09struct vb2_v4l2_buffer *dst; /* CAPTURE decoded */
> +=09} bufs;
> +
> +=09dma_addr_t coded_in;
> +=09dma_addr_t y_out;
> +=09dma_addr_t uv_out;
> +=09dma_addr_t comp_out;
> +};
> +
> +struct avd_ctrl_desc {
> +=09struct v4l2_ctrl_config cfg;
> +};
> +
> +struct avd_ctrls {
> +=09const struct avd_ctrl_desc *ctrls;
> +=09unsigned int num_ctrls;
> +};
> +
> +struct avd_comp {
> +=09u32 size;
> +=09/* offset to start of compressed data */
> +=09size_t start_offset;
> +=09/* relative offsets to start */
> +=09u32 offsets[4];
> +};
> +
> +struct avd_decoded_buffer {
> +=09/* Must be the first field in this struct. */
> +=09struct v4l2_m2m_buffer base;
> +=09struct avd_comp comp;
> +};
> +
> +static inline struct avd_decoded_buffer *
> +vb2_to_avd_decoded_buf(struct vb2_buffer *buf)
> +{
> +=09return container_of(buf, struct avd_decoded_buffer, base.vb.vb2_buf);
> +}
> +
> +struct avd_decoded_buffer *avd_get_ref_buf(struct avd_ctx *ctx,
> +=09=09=09=09=09   struct vb2_v4l2_buffer *dst,
> +=09=09=09=09=09   u64 timestamp);
> +
> +struct avd_coded_fmt_ops {
> +=09void (*adjust_decoded_fmt)(struct avd_ctx *ctx,
> +=09=09=09=09   struct v4l2_pix_format_mplane *pix_mp);
> +=09int (*start)(struct avd_ctx *ctx);
> +=09void (*stop)(struct avd_ctx *ctx);
> +=09int (*run)(struct avd_ctx *ctx);
> +=09void (*done)(struct avd_ctx *ctx, struct vb2_v4l2_buffer *src_buf,
> +=09=09     struct vb2_v4l2_buffer *dst_buf,
> +=09=09     enum vb2_buffer_state result);
> +=09int (*try_ctrl)(struct avd_ctx *ctx, struct v4l2_ctrl *ctrl);
> +=09enum avd_image_fmt (*get_image_fmt)(struct avd_ctx *ctx,
> +=09=09=09=09=09    struct v4l2_ctrl *ctrl);
> +};
> +
> +enum avd_image_fmt {
> +=09AVD_IMG_FMT_ANY =3D 0,
> +=09AVD_IMG_FMT_420_8BIT,
> +=09AVD_IMG_FMT_420_10BIT,
> +=09AVD_IMG_FMT_422_8BIT,
> +=09AVD_IMG_FMT_422_10BIT,
> +};
> +
> +struct avd_decoded_fmt_desc {
> +=09u32 fourcc;
> +=09enum avd_image_fmt image_fmt;
> +};
> +
> +struct avd_coded_fmt_desc {
> +=09u32 fourcc;
> +=09struct v4l2_frmsize_stepwise frmsize;
> +=09const struct avd_ctrls *ctrls;
> +=09const struct avd_coded_fmt_ops *ops;
> +=09u32 subsystem_flags;
> +=09unsigned int capability;
> +};
> +
> +struct avd_variant {
> +=09unsigned int capabilities;
> +=09const char *fw_name;
> +=09unsigned char revision; /* the same as the device tree */
> +=09unsigned int quirks;
> +};
> +
> +struct avd_dev {
> +=09struct device *dev;
> +=09struct v4l2_device v4l2_dev;
> +=09struct media_device mdev;
> +=09struct video_device vdev;
> +=09struct v4l2_m2m_dev *m2m_dev;
> +=09struct platform_device *pdev;
> +=09const struct firmware *fw; /* fw is lost on suspend */
> +=09void __iomem *piodma;
> +=09void __iomem *code;
> +=09void __iomem *sram;
> +=09void __iomem *mbox;
> +=09void __iomem *ctrl;
> +=09u32 sram_start;
> +=09struct iommu_domain *domain;
> +=09struct iommu_domain *empty_domain;
> +=09struct mutex vdev_lock; /* serializes ioctls */
> +=09struct reset_control *rstc;
> +=09const struct avd_variant *variant;
> +};
> +
> +struct avd_segment {
> +=09u32 piodma_cmd;
> +=09u32 num;
> +=09u32 instructions[AVD_MAX_INST];
> +};
> +
> +struct avd_buf {
> +=09void *cpu;
> +=09dma_addr_t addr;
> +=09size_t size;
> +};
> +
> +struct avd_job {
> +=09enum avd_codec codec;
> +=09int dest;
> +=09size_t num;
> +=09size_t num_alloc;
> +=09size_t num_submit;
> +=09struct avd_segment *segments;
> +=09struct avd_buf buf;
> +};
> +
> +struct avd_ctx {
> +=09struct v4l2_fh fh;
> +=09struct avd_dev *dev;
> +=09struct v4l2_format coded_fmt;
> +=09struct v4l2_format decoded_fmt;
> +=09const struct avd_coded_fmt_desc *coded_fmt_desc;
> +=09struct v4l2_ctrl_handler ctrl_hdl;
> +=09enum avd_image_fmt image_fmt;
> +=09bool decomp;
> +=09struct delayed_work watchdog_work;
> +=09void *priv;
> +=09struct avd_comp comp;
> +=09struct avd_job job;
> +=09struct avd_buf inst;
> +=09struct avd_buf pipe_state;
> +};
> +
> +int avd_end_segment(struct avd_ctx *ctx, bool update_submit);
> +int avd_init_job(struct avd_ctx *ctx, enum avd_codec codec, size_t segme=
nts);
> +int avd_submit_job(struct avd_ctx *ctx);
> +
> +int avd_buf_alloc(struct avd_dev *avd, struct avd_buf *buf, size_t size)=
;
> +void avd_buf_free(struct avd_dev *avd, struct avd_buf *buf);
> +
> +void avd_reset_coded_fmt(struct avd_ctx *ctx);
> +void avd_reset_decoded_fmt(struct avd_ctx *ctx);
> +int avd_init_ctrls(struct avd_ctx *ctx);
> +
> +void avd_job_finish_no_pm(struct avd_ctx *ctx, enum vb2_buffer_state res=
ult);
> +void avd_job_finish(struct avd_ctx *ctx, enum vb2_buffer_state result);
> +
> +void avd_run_preamble(struct avd_ctx *ctx, struct avd_run *run);
> +void avd_run_postamble(struct avd_ctx *ctx, struct avd_run *run);
> +
> +extern const struct v4l2_ctrl_ops avd_ctrl_ops;
> +extern const struct v4l2_ioctl_ops avd_ioctl_ops;
> +extern const struct vb2_ops avd_queue_ops;
> +
> +static inline u32 fmt_height(struct avd_ctx *ctx)
> +{
> +=09return ctx->coded_fmt.fmt.pix_mp.height;
> +}
> +
> +static inline u32 fmt_width(struct avd_ctx *ctx)
> +{
> +=09return ctx->coded_fmt.fmt.pix_mp.width;
> +}
> +
> +void fill_comp(struct avd_comp *comp, enum avd_image_fmt image_fmt, u32 =
width,
> +=09       u32 height);
> +
> +static inline struct avd_ctx *file_to_ctx(struct file *filp)
> +{
> +=09return container_of(file_to_v4l2_fh(filp), struct avd_ctx, fh);
> +}
> +
> +#endif /* AVD_H_ */


Did a light pass for now.

Nicolas

--=-x08Y6vppfz4ikL2auF+x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYPMQAKCRDZQZRRKWBy
9ILkAQCB7UHs7fBWF23/pLO7IPdZfP1GyadZ4l2XEs5sXgflJAEAnU+dxAfecvSY
AWo5TDPQjZ3nTHFz9nnMvtd/poAPlAQ=
=3zfm
-----END PGP SIGNATURE-----

--=-x08Y6vppfz4ikL2auF+x--
