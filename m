Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A754D19259E
	for <asahi@lists.linux.dev>; Mon,  2 Dec 2024 18:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733162568; cv=none; b=d4TyR7y67olaWFf7Tz70C5T9IUpxjW0OSNX8LphJvTc0Vxi+o4k70gDlYGLFc7WHMKF6f5gSi1mBZMyOxRWuo7iuvsmmZRWtb9xaF7v6VEZiLCC8F+WbnzvEvlzPSyCGCUHxCVkg1Oak02zpL5biWC8w+9ayKFNx79/W7ys4OGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733162568; c=relaxed/simple;
	bh=LVuZUa24WaOmzfyvxHMhny2Hxp6afc/nbtxIS6Y1I/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0PSQ6i8+bovCPYiF6SEOS6XWhnruKDmxY6jt9SDnkaNESJF/s1ytcX0+x1CDk+lkBYEZkiLYasJ9Am939dTxr2aqjyazmLNfrrsoh4nuKxbyzmvoUb+qUSxXom7512TOai1MtRUkTh2dFiFa2E/tjIUhGGLYfIgne2elb6mD/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aa560a65fd6so783826766b.0
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 10:02:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733162565; x=1733767365;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5gHcQ4FCTGNFnaCtGHvpnPCQcPDHMQwxknwgQhKcio=;
        b=SU151JQS+UaG+hyuWUxP8qxu1TNSzZMlkUw2eo3Uvq1LZj7N+yeigcHo1BUNLL6A25
         TMfg9d7wzwNqEAC7w9bZBKme/aFy7OFOpT+hm7AD4DI++5I2xYWa9OR/4zyHZ+oHoqz0
         QI3bZWFkp31A0GDyK4KiEG1/tvV3UykU2soZPadj922AFla7Ui7VYBwc0rDglVyObwIW
         Chk6Vb5zxXQqi292U4A8tJMdSvIBb9g/ZqoaKcBF/TYJ25fWb122yqaEpBsOsS5MTKt5
         9xXTjK+wIJV48Z7k7jK1EcLuVPHwO+CPVKlH/obBSjVstUYLjNFAMMfIwoqMG9tOYjUd
         E52w==
X-Forwarded-Encrypted: i=1; AJvYcCXyLxnwUT0o3zu3DS36XUADZntJfBe2c28/P+hcYnt1LdaOWR2SPUYDaEAYlXEcWt2EXfOCTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxag9OM8jflT51muTJgx0aEbgPvIOA8jmRIwY+Hza1DFfst0Odw
	VixnsJEOqJhK8Qz0TivjSe90Y4KjTAiWpKD+ujfoA6SSBPsEVpYwLIIksl5ci9Q=
X-Gm-Gg: ASbGncuo949htFErVs91jMncGbnaoegpGGFLnG4Vgrke37jIFOom/JCbHQ9YTlIUKAP
	Jb798iKeRRyyp4qdEHfjDuYX3rSqLXv6ALGLkxqeVBdD7vX2WzOYMBKFR7R8YP0aGLvIxyZH3cC
	vqyA8K3djQz03AUtJEwnbzHHS79dRno+Cc+zeB0jjxNNDFADtbpUCQOort6LkhPY6ah91VG9iQk
	bvzsXzS30vrMAqNYDNMBbsoxNkrr7y7cVkXA9ygcv0kmLXvK6HivLfEYwuZCRGYIrFA0I4Y5hqU
	J1Lr
X-Google-Smtp-Source: AGHT+IFno/0I24hujxffabeHHbQs4uGp8d3/ut1rMmMZ8yvV9jMXJpUnPRtAbSZIwWAGbXqmzw3IhA==
X-Received: by 2002:a17:907:3e83:b0:a9a:662f:ff4a with SMTP id a640c23a62f3a-aa59431fad7mr2460273366b.0.1733162562054;
        Mon, 02 Dec 2024 10:02:42 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c1383sm531516766b.40.2024.12.02.10.02.41
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 10:02:41 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-aa560a65fd6so783815766b.0
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 10:02:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVD5Yw9zkymXUTSecrv3AwkyapEBMS/DiMYKAzq24CR8s8uV9gaAZvnkn6BaBDgOOu0+lJoag==@lists.linux.dev
X-Received: by 2002:a17:906:2181:b0:a9a:616c:459e with SMTP id
 a640c23a62f3a-aa59467032cmr2043918466b.27.1733162560648; Mon, 02 Dec 2024
 10:02:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241201155820.29259-1-towinchenmi@gmail.com>
In-Reply-To: <20241201155820.29259-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 2 Dec 2024 13:02:04 -0500
X-Gmail-Original-Message-ID: <CAEg-Je97QmLUrOV+dvg2zbV56R44Ouj4gLwV36z-RdvG-H+hGw@mail.gmail.com>
Message-ID: <CAEg-Je97QmLUrOV+dvg2zbV56R44Ouj4gLwV36z-RdvG-H+hGw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] Add PMGR nodes for Apple A7-A11 SoCs
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 1, 2024 at 11:00=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> w=
rote:
>
> This series adds the PMGR nodes and all known power state subnodes for
> Apple A7-A11 SoCs, along with the associated dt-bindings.
>
> Changes since v3:
> - Add "apple,always-on" property to "ps_spmi" in t8015 power domains.
> This is required for cpufreq to function correctly which will be added
> in a later series.
>
> Changes since v2:
> - Removed "apple,always-on" property from "ps_pmp" from s8001, t8011,
> t8015 power domains. It is not on at boot. (Mixed up with ps_pms which
> is required to be on)
> - Add asahi-soc/dt back into the subject prefix, missing from v2.
>
> Link to v2: https://lore.kernel.org/asahi/20241102011004.59339-1-towinche=
nmi@gmail.com
>
> Changes since v1:
> - Removed "framebuffer0" dt aliases. It is not standard and not needed.
>
> Link to v1: https://lore.kernel.org/asahi/20241029010526.42052-1-towinche=
nmi@gmail.com
>
> Nick Chan
> ---
>
> Nick Chan (10):
>   dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
>   dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
>   arm64: dts: apple: s5l8960x: Add PMGR node
>   arm64: dts: apple: t7000: Add PMGR node
>   arm64: dts: apple: t7001: Add PMGR node
>   arm64: dts: apple: s8000: Add PMGR nodes
>   arm64: dts: apple: s8001: Add PMGR nodes
>   arm64: dts: apple: t8010: Add PMGR nodes
>   arm64: dts: apple: t8011: Add PMGR nodes
>   arm64: dts: apple: t8015: Add PMGR nodes
>
>  .../bindings/arm/apple/apple,pmgr.yaml        |   5 +
>  .../bindings/power/apple,pmgr-pwrstate.yaml   |   5 +
>  arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
>  arch/arm64/boot/dts/apple/s8000-pmgr.dtsi     | 757 ++++++++++++++
>  arch/arm64/boot/dts/apple/s8000.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
>  .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
>  arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
>  arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
>  arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 822 ++++++++++++++++
>  arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/s800x-6s.dtsi       |   4 +
>  arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/s800x-se.dtsi       |   4 +
>  arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
>  arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
>  arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++
>  arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
>  arch/arm64/boot/dts/apple/t7001-air2.dtsi     |   1 +
>  arch/arm64/boot/dts/apple/t7001-pmgr.dtsi     | 650 ++++++++++++
>  arch/arm64/boot/dts/apple/t7001.dtsi          |  13 +
>  arch/arm64/boot/dts/apple/t8010-7.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t8010-n112.dts      |   4 +
>  arch/arm64/boot/dts/apple/t8010-pmgr.dtsi     | 772 +++++++++++++++
>  arch/arm64/boot/dts/apple/t8010.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8011-common.dtsi   |   1 +
>  arch/arm64/boot/dts/apple/t8011-pmgr.dtsi     | 806 +++++++++++++++
>  arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |   8 +
>  arch/arm64/boot/dts/apple/t8011.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
>  arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
>  39 files changed, 6237 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8000-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi
>
>
> base-commit: 9ad55a67a788c0806b0fe23be36fae6dbfbc3fc5
> --
> 2.47.1
>
>

These seem reasonable.

Acked-by: Neal Gompa <neal@gompa.dev>



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
