Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5533918784A
	for <asahi@lists.linux.dev>; Mon,  2 Dec 2024 17:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733160573; cv=none; b=mW+WojAD3MUbNDCmmP6Bhu/4vwxiGqt7fO3qbCm9fMmX82Ft3KREpzPUzYR+iJaS+erjky1+9U8JjHOIjETOsDx0JsTsUd5um+4sIQ14U7dEJ1K/m0s+lhVMrBQTkvww/pEOcOw7M5+nHH4Ab6+JmCIRBLW/ij6vF5MIwsn5sDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733160573; c=relaxed/simple;
	bh=QOQ+erHT4VXZq8nXOWd4czcnijmv3x7ttdi40L8gVbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GSpIU5HFfm4Gp1bHPa/ZTt/WYkjsBHalAIANNh5EqSEdDoHXMXSmAzHpvCBB3ysw3kPo0WXuwqB8teBNRrjftElgiuQW0ricH2T4l995wmIq6QuwhRbi/2UcN0EI8xdAKk2+L+pwB1q5NJyNlK16WJrIsasERjJLM39yGFSDL5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso54173371fa.0
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 09:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733160569; x=1733765369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CgvuKCN7J6YpKVI1K2eRbzWN5UKOCpkxDwdsMytbnaM=;
        b=s281WekOxfl695h1tsxZCGG9IqPVJCFzmJ0VIoVgEiB+dh2HhRCPFg/zIxYGTbHGu3
         VWED85mQUEEK1D+pTePv2BxHv8gS5dcS6bPxvcGSyaEi1auer2qEftvIQzxdVDpdivKm
         5LVdgwH057cUEsSPXFOpgbctiIRxH9K1uH5Arg1xiuarjvJ5UrsWL7bXs13wh23t2DaB
         Q1dUox+W/5VnKhcH7ZCgTte62n+I2z8j47An0L8gQfAZDxYvw9llxa2bg5sobUoY7M9h
         8aZhzj56y6/PC1tW3Ez+jPfuZSbvbg/w3Aw/JUw3zz1SY9OTXSpgsH8VAVmcMcGSV/sk
         gQCA==
X-Forwarded-Encrypted: i=1; AJvYcCVaZMpvt0RbV+g3AVTC1M10obU4lyF+zbCVSwLJrBuXU4ISHVVMgCDy5vTyrpbs+jQYG+Lrkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwvmBWTKk+yI0Rv3GFAsI8onJLPyTyfyCPFPu0KBA+0uipSMGtO
	3ltweM2FkJa1lsa5eG9j1TtbiawF1ArDCISR5rj8+coxrKGXdKMt+Yb52HY0
X-Gm-Gg: ASbGncu2ML3XNT/XZ2fLxftpfY+2wFyim8iaKDyh3AArdTynNiYJtV0A87G3xMqs4Z0
	2ARvzgElkwBRO9Ez+96M8eNm1ZO0ruVWAk8Qu/ftKR52AIGWavTzdZ2LO3kjQVjmwHS0XSLQnkA
	7BVkVX4aEzfZCugQPxUlLFgmbtTK3LyLBP1ZaR+OjVddgK8cnvOT5FJwmcWqWVBzIJm27mySMGs
	9qrFHVDryFST5QrPrg6hqXUqateKKjlkpe8wH4fgOff3S42VqKc+lbYX0hePaazx/ux8aN9XD1D
	SG4u
X-Google-Smtp-Source: AGHT+IEBioAXykw8aZjwsNDb7svdYT7gPNIOPBEskZHBU8oKsO+3czPSXkOpmicK/nLLJG22JXRJzw==
X-Received: by 2002:a2e:be0d:0:b0:2ff:8e14:30a4 with SMTP id 38308e7fff4ca-2ffd6007861mr107226631fa.10.1733160568895;
        Mon, 02 Dec 2024 09:29:28 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097db0be1sm5252336a12.31.2024.12.02.09.29.27
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 09:29:28 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa549d9dffdso744495866b.2
        for <asahi@lists.linux.dev>; Mon, 02 Dec 2024 09:29:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlkujAsiah9TDRFlm5KhQRJWAJcKaMMC4bOh2EtnKjSn81/MYJLrCrQLVq1Vad/j/bsfyWVw==@lists.linux.dev
X-Received: by 2002:a17:906:c383:b0:aa5:451c:ce25 with SMTP id
 a640c23a62f3a-aa58105895amr1847466266b.43.1733160567637; Mon, 02 Dec 2024
 09:29:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241127-asahi-spi-dt-v1-0-907c9447f623@jannau.net>
In-Reply-To: <20241127-asahi-spi-dt-v1-0-907c9447f623@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 2 Dec 2024 12:28:50 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-3w3koiqnAOMQO4RZ2DB+fRiSbZJSba-Z=L8OCF2B0Pg@mail.gmail.com>
Message-ID: <CAEg-Je-3w3koiqnAOMQO4RZ2DB+fRiSbZJSba-Z=L8OCF2B0Pg@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/5] Add Apple SPI controller and spi-nor dt nodes
To: j@jannau.net
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 4:52=E2=80=AFAM Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> This series adds SPI controller and SPI NOR flash device nodes to the
> man Apple silicon SoC dts files. Only the subset of used SPI controllers
> is added. Five SPI controllers exists according to pmgr ADT data but the
> commits only add controllers found in use on any of the devices. The
> parameters for the missing nodes are guessable but there's no point in
> adding them since no further M1 or M2 devices are expected.
> Together with controller nodes the first SPI device is added. All Apple
> silicon devices connect a SPI NOR flash to spi1. This holds Apple's 1st
> stage bootloader, firmwares, platform and machine specific config data
> and a writeable key-value store (nvram). Expose only the nvram as mtd
> partition since it has use beyond exploring the content. Tools from
> asahi-nvram [1] can modify the (default) boot configuration
> (asahi-bless), read Bluetooth sync keys (asahi-btsync) and read and
> write arbitrary keys (asahi-nvram).
>
> Devicetree bindings are included in the driver series. Last version at
> https://lore.kernel.org/linux-devicetree/20241101-asahi-spi-v3-0-3b411c5f=
b8e5@jannau.net/
>
> This series passes `make CHECK_DTBS=3D1 dtbs` with the spi bindings excep=
t
> for "local-mac-address" for the Bluetooth device (I need get back to
> this).
>
> [1] https://github.com/WhatAmISupposedToPutHere/asahi-nvram/
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Hector Martin (1):
>       arm64: dts: apple: t8103: Fix spi4 power domain sort order
>
> Janne Grunau (4):
>       arm64: dts: apple: t8103: Add spi controller nodes
>       arm64: dts: apple: t8112: Add spi controller nodes
>       arm64: dts: apple: t600x: Add spi controller nodes
>       arm64: dts: apple: Add SPI NOR nvram partition to all devices
>
>  arch/arm64/boot/dts/apple/spi1-nvram.dtsi      | 39 +++++++++++++++
>  arch/arm64/boot/dts/apple/t600x-common.dtsi    |  7 +++
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi      | 28 +++++++++++
>  arch/arm64/boot/dts/apple/t600x-gpio-pins.dtsi | 14 ++++++
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi |  2 +
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi      |  2 +
>  arch/arm64/boot/dts/apple/t8103-jxxx.dtsi      |  2 +
>  arch/arm64/boot/dts/apple/t8103-pmgr.dtsi      | 18 +++----
>  arch/arm64/boot/dts/apple/t8103.dtsi           | 68 ++++++++++++++++++++=
++++++
>  arch/arm64/boot/dts/apple/t8112-jxxx.dtsi      |  2 +
>  arch/arm64/boot/dts/apple/t8112.dtsi           | 44 ++++++++++++++++-
>  11 files changed, 216 insertions(+), 10 deletions(-)
> ---
> base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
> change-id: 20241101-asahi-spi-dt-58245bb1da3e
>
> Best regards,
> --
> Janne Grunau <j@jannau.net>
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
