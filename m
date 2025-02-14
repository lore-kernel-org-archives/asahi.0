Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889D20CCC3
	for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 07:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739517919; cv=none; b=Ya8wk8MqxH1HP1+MXAf6okzS6jdz7sfwIGP98fCYTVrX2Va3VQP+jCP6oTspwXAsbG2ua0a36hqA5U3shhGadixaNr6wu4z2uPYru1udMHcqM+hTHQXCXeyDzAal7c48Ip7upSmLNK1kH64PcFgCGdoipS6m2xwfujNII4Uktq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739517919; c=relaxed/simple;
	bh=njhTqJEMSxRhiYF56n6lamJ5BDIWXxGYG2aaHwYf2Cs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JiNNsdDgoPuGVGyqxBQsnXWm8k16pWdcG1QdzfMqMyXEZsrlXgZouePBaqk9KN595ZPPYqJjdx072cRkS0UpRAoZhMVc0XcDzRJIaRJP3Thduhb3cLpHhJlyLD5Hb16z1TVyBlV1dCmiDhw6JaV+2yMmoRqjGAMCdjlu6nxI2oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de4d3bbc76so2777343a12.3
        for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 23:25:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739517914; x=1740122714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+sv0U2cyjukGfA/ZIjsFBOYnHcPPEH2EG7bSm4QAFU=;
        b=askX3ulSsi4XsD2c7P+E1EgmtKiow2GacLKClpTCBt1v/WiIQD1n6B8evhofP4RGTO
         IIF5MudHTFcDi1rRPtrvNFoAkYDaPMr8L4VgZUdUKbgd3VWeiQ7vwR154qtW99SfZC1a
         Xf2sejZBUuxjHCIi+g2ps18OGUYFR3bW6FohGYku26uIj5qRAnIP5ZXmdlchUvMa5MZX
         dK6m0C4QbQr3+ZQf64ReyMnxueMjyX2gx+QywDO91a46MJ/KZutgXmLK6XbuSnqVTCbu
         aqO2t4+W/X46xGmiT1QP9Qzp9vruEUwbTgZNBCaVcfAeNC1ErlH83ACjUQqgK9dunZjo
         OZXA==
X-Forwarded-Encrypted: i=1; AJvYcCUpKrvSH5o0QmyiNDEPOvNgYQujtLWkVVEqDvBx/8KekvM2weSJ7L1O+q14JIVuE0qr7Cq0Ew==@lists.linux.dev
X-Gm-Message-State: AOJu0YwI7Go1NTlpfr/QQ+OPuixwRh1UerBTpFi5z7oK/h9jkT88Qhko
	h+YAi/ZniMdHYYT+jexHHC6IByc3Gxv07axTXnlZeU8MzvaBX9kd
X-Gm-Gg: ASbGncsXEwNdaE+Y5irR+7HqUZ99yKt1jXRbYrBvKJ4JBt2xqElBhssjeP5yu4O7/k5
	/sMQ+uMbgAyIXnTZqT+k7gaYOSGZstpFdPeAn42dF4rb+UO7TXErqW+wKyYZffsXNELNuoXOJRP
	1IVBYWq2ytwBHEbtVffWD2IV1L3Mst8cRhQCfyJoRtcCi1tnrz3h9uh8NBhoewgvB0ZjUpO/kTZ
	9Ll9UN7HFdqgPN2AVAKAJLsYG+QD6E4dLjwC8kJ52eVkbhFT2Ah8CFJQTeDjrB/LHQlU7bNWgLB
	H+ONcHI=
X-Google-Smtp-Source: AGHT+IEoarJM2g862+tjhaxlTXDbDAymQwDvKoPHtrhln93W0x/KWZn0hwC1S4O8Gi4SYfUlrl3j8A==
X-Received: by 2002:a05:6402:34d2:b0:5d3:bc1d:e56d with SMTP id 4fb4d7f45d1cf-5deade10992mr9046527a12.31.1739517912656;
        Thu, 13 Feb 2025 23:25:12 -0800 (PST)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece2709ffsm2429951a12.60.2025.02.13.23.25.11
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 23:25:11 -0800 (PST)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab7c501bbecso253735166b.2
        for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 23:25:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWGgF56UT4Kc6n5UTjoC6N2WHfmYe3tqNoEvAsJL7c1jmC9Io1NaxXw60LCI6HMenvwMDUk4g==@lists.linux.dev
X-Received: by 2002:a17:907:1909:b0:ab7:8e0d:3d3c with SMTP id
 a640c23a62f3a-ab7f3473720mr1066973166b.42.1739517910868; Thu, 13 Feb 2025
 23:25:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250214040306.16312-1-towinchenmi@gmail.com>
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 14 Feb 2025 02:24:34 -0500
X-Gmail-Original-Message-ID: <CAEg-Je88-zfnD+Yx7GdxMaG8NZBBjDGZJJ33D0kUyYnAhMhrDA@mail.gmail.com>
X-Gm-Features: AWEUYZmee1G4NO9TTRkSGcwt1I0mLzwp9RPxwW1Z78u96Fa7SXff07gmHN3DsJ8
Message-ID: <CAEg-Je88-zfnD+Yx7GdxMaG8NZBBjDGZJJ33D0kUyYnAhMhrDA@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Apple DWI backlight driver
To: Nick Chan <towinchenmi@gmail.com>
Cc: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Helge Deller <deller@gmx.de>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 11:04=E2=80=AFPM Nick Chan <towinchenmi@gmail.com> =
wrote:
>
> Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
> and iPod touches the backlight controller is connected via this interface=
.
> This series adds a backlight driver for backlight controllers connected
> this way.
>
> Changes since v5:
> - Remove default y from drivers/video/backlight/Kconfig
>
> v5: https://lore.kernel.org/asahi/20250203115156.28174-1-towinchenmi@gmai=
l.com/T
>
> Changes since v4:
> - Change type to BACKLIGHT_PLATFORM since the driver does not directly
> interface with the backlight controller. The actual backlight controller
> can be directly controlled via i2c and is not the same on all hardware
> that supports the dwi interface.
> - Rename file to apple_dwi_bl.c to better match config option.
> - Rename driver to apple-dwi-bl to better match config option
> - Indicate that the backlight scales linearly
>
> v4: https://lore.kernel.org/asahi/20241211113512.19009-1-towinchenmi@gmai=
l.com/T
>
> Changes since v3:
> - $ref to common.yaml in bindings
> - (and then additionalProperties is changed to unevaluatedProperties)
> - Use hex everywhere in bindings example
> - Use sizeof(*dwi_bl) instead of the type of the struct when doing
> devm_kzalloc()
> - Use devm_platform_get_and_ioremap_resource() in driver
> - Fix sorting in drivers/video/backlight/Makefile
> - In drivers/video/backlight/Kconfig, move config to right after
> BACKLIGHT_APPLE
> - Explain this driver being completely different from apple_bl
>
> v3: https://lore.kernel.org/asahi/20241209075908.140014-1-towinchenmi@gma=
il.com/T
>
> Changes since v2:
> - Add missing includes in driver
> - Fix file path in MAINTAINERS
>
> v2: https://lore.kernel.org/asahi/20241207130433.30351-1-towinchenmi@gmai=
l.com/T
>
> Changes since v1:
> - Fixed dt-bindings $id.
> - Make power-domains an optional property in dt-bindings.
> - Added missing error checking after devm_ioremap_resource() in
> dwi_bl_probe().
>
> v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail=
.com/T
>
> Nick Chan
>
> ---
> Nick Chan (3):
>   dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
>   backlight: apple_dwi_bl: Add Apple DWI backlight driver
>   MAINTAINERS: Add entries for Apple DWI backlight controller
>
>  .../bindings/leds/backlight/apple,dwi-bl.yaml |  57 ++++++++
>  MAINTAINERS                                   |   2 +
>  drivers/video/backlight/Kconfig               |  11 ++
>  drivers/video/backlight/Makefile              |   1 +
>  drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
>  5 files changed, 194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/appl=
e,dwi-bl.yaml
>  create mode 100644 drivers/video/backlight/apple_dwi_bl.c
>
>
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> --
> 2.48.1
>
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
