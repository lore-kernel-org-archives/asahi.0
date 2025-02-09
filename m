Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4126E17B50A
	for <asahi@lists.linux.dev>; Sun,  9 Feb 2025 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739100169; cv=none; b=WH3ECPETLtHZE2sxTPPN9xqAvFkZOIiXx8SvEuwGU3Er4xCtOyRucbHVxnIgsJ6mQ2a4be1xeyfintlx7VkSMnYNZ+zP+gDXW6VkMGAowcqraVRssiml9JeRivMYn4BIqI59NyMoez54wDLj+j4dfuo3z/kHBNsLvSd+SmRlfVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739100169; c=relaxed/simple;
	bh=fSpAlkuvzafpBDecQQKDZzLy+MX6Hjz7TRvpdMGaUmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=csWELi4k7kAtjVDQOTPy8L0f0141O3GcFS3ffKT9ozTyKrhOUqWTUk5h1zLn04DQz5RwuKuhxx89yWMUKoPU5CGUIAuNVveUGpnBfmCafke7ikk3BLTw9+5QdpJk3MDE39DJ6B/saJfkudW80AZf04xKEXlXB4SCw060Q1dxye4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5de4a8b4f86so3171329a12.2
        for <asahi@lists.linux.dev>; Sun, 09 Feb 2025 03:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739100166; x=1739704966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czsr8ut4E1IjeGJZsPHODj7dteAs5/QBRXMGMfAcAZA=;
        b=Kg1BQCsjP1ClqNyCTji+yBGA9Xehbbm1jF6Ix8jT8X/kI6Ghx4yqrAHj4ReUdACk/O
         ErLRypqyFVR1+rFHV7PH+E4kiTqd9ytjFviNafG80SweJkWVRkcMvu0FwKY1bgWsOlEq
         6YrFsnu4iHZHPVQGTu/3y4T/ubbkvQBdqibdVWpnIjdG36Td0hqUwqe+rTtUvyFW/CGE
         SYnbCxH2eeOyYEMfMwBfIUAG2VCldmNcO2zFDtu2ruHrXN+XBJU3b6E5GrmRT9uPxnvl
         TZIr5us+BClNfy5J06m3rfzbc2mbpuS+rgRazJYC76GJ9p395Et2JSx17H6th++9CvHq
         XS1Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2YKcTFxPGt5kX6SfBAWEOV2/bSvlq9MNHRPEH8QAuFesTiFVw9GsqYzfJggq3mXOjRixpMA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ0GM6NeCMY9A00iU4Bt30AwslqHZRPmBL3tZzHrPDGJcwVxtO
	gdl788X7408YVgl6he9NlLIceLfKZ63BK3ypzJwRzV9tKmUy18P6lwE9AMjDcTM=
X-Gm-Gg: ASbGncvoUlKMBh3kwGyqh7aEvI/4ZrZi/oeY8jqR7iZkQVl91M8TWlANi9uITDx4dAe
	WXrYobYMD2aQ5uK4ETNXLiurTrRbBU0youesfyB/0PPIaF+mkL7g/DF2er782wW7+kcW5r8nOLE
	/Mjw3FDjFOxvJYdUnIxxmpyTSdRBtxfgniPgPZwS0IchtyqwId8zY5bOIRlHJAVtdwOjZFyxD72
	dSHySES5+raTJZXGm7L72rpa9QTc2PR91Cuuu0nDH6uPTkb1qgNYMwH78quoLutSGNJC2QaharN
	SgjcdUdGa66Nhgv5xFHVjCZ2gfpOOniLpuflhmlW+5lZ3Q==
X-Google-Smtp-Source: AGHT+IGQikHgeI7/c6hEDjkSdBbW51hU9+kHBzifqk1gpyZmSgBXLdTiuBCtrzfX/MDx7tSZn56yzw==
X-Received: by 2002:a05:6402:2751:b0:5dc:d8e6:62a7 with SMTP id 4fb4d7f45d1cf-5de45005aa0mr12168250a12.14.1739100165677;
        Sun, 09 Feb 2025 03:22:45 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de541fb84bsm3679254a12.54.2025.02.09.03.22.44
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 03:22:45 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5de3c29ebaeso3766000a12.3
        for <asahi@lists.linux.dev>; Sun, 09 Feb 2025 03:22:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNwyd0hTg1tQScfVpXq6HPZ/UPBfL80xr8YfoA8/RvY1Uw/dEhCsPhBNKvkjF50i9A6RSNaQ==@lists.linux.dev
X-Received: by 2002:a05:6402:5252:b0:5db:f423:19b9 with SMTP id
 4fb4d7f45d1cf-5de450236admr7763979a12.16.1739100164505; Sun, 09 Feb 2025
 03:22:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250203115156.28174-1-towinchenmi@gmail.com>
In-Reply-To: <20250203115156.28174-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 06:22:08 -0500
X-Gmail-Original-Message-ID: <CAEg-Je8cB==_+fNi0hc-mPqkEd-w82tWay_2Wu76hV10LV4X2g@mail.gmail.com>
X-Gm-Features: AWEUYZks2Pe6z_gT4XPe5iRvZlGve_lJKCtY1woYJMW8gNu9Xz8tZDlJPRfovXQ
Message-ID: <CAEg-Je8cB==_+fNi0hc-mPqkEd-w82tWay_2Wu76hV10LV4X2g@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 0/3] Apple DWI backlight driver
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, 
	Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Helge Deller <deller@gmx.de>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 6:52=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> wr=
ote:
>
> Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
> and iPod touches the backlight controller is connected via this interface=
.
> This series adds a backlight driver for backlight controllers connected
> this way.
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
>  drivers/video/backlight/Kconfig               |  12 ++
>  drivers/video/backlight/Makefile              |   1 +
>  drivers/video/backlight/apple_dwi_bl.c        | 123 ++++++++++++++++++
>  5 files changed, 195 insertions(+)
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

This series looks good to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
