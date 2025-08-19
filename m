Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA712E2295
	for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 18:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755628762; cv=none; b=dCOOERdNG9KFgNGX02HiSAs+V8irHpEeu7KT2m/gOPQaqO/pE1pyn2+RkOurX/GIt1edtEejubvX8uwAc0ZPUszMgy6ZKEbBiIthMpKzyiOvx0l73CwSter9A3GVbQFWA36eEztggjVhYDWs2fIXzDYxA0oroWC6HGEVDtQNyEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755628762; c=relaxed/simple;
	bh=PXzBRIfXwKHZi+PVe3ictws1msxyerhHK53wBLauIiw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hpl5ebTKh3wFFK/ExAQHq+g93KKTKJHso+uvJK3pao1LZUsB2P4HBU8h1P1Xg7rEIZL8lrS9vYj1JJGB3j/ewXu9hmbwWl8WO8tJxElkFGr/3KyDyNjZaz95ZUCJJ0W1WVH+PXISueNzky9F7RgHPx2zLHfAhIU5W3iU96qpdEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb7abfc5cso961807966b.3
        for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 11:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628758; x=1756233558;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ik2CZRraiL4wjLDuUaIjOn1b1SNp0YAfTL1m5BkDZ58=;
        b=j2Xbu1p1VlBwJuxn4YEKQD2ck/wsIlcYI7VrYQ2yLL/CVypMTFziDn3AclfbY5X2Qb
         yHxFwvLI1tOpMn/eiyu+gBU6wiPhg40w2XsOqNTksfBjCZEkrRmY3Y0KfFdY7ndymTcN
         TrGgEqpBRUNEOPni9YyvgiVGMnPJVhcPmXzWcQPu093Fz69tH4WIkzRxdCp0cZnpUcj4
         MTW540+pRaAgPskOxxtQ/RyR0ZnjBJAVl0JeJkHhiP2eccksLfyJiSfGhP9ewAIbT2zG
         Sx3Fgrsz1AuXWdnBUft3CEEKW5jsXUsERJI5wPfqFD/YJiCDOlfZP2coUMLKggCtArAX
         NqRg==
X-Forwarded-Encrypted: i=1; AJvYcCVnyHCb3P03yaJPjE0cRzGtJx+BWM+gSbqoX6blVDMRkLgZLhbj5ve1KXUpb/mWan3kYnbamw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOEa2iyxlBMMNObgI0pBxdaS33Fdad2WdzUCR0y0DhlyeQkcW5
	+WYqSZqfYs7H+97flIW/eRPSuxMAfD5pHHPIoqeByIwCTXyfhq+acGcnja50TNPSgnM=
X-Gm-Gg: ASbGnctWsFR56R1DskTls03WBWE5I1csqoGwCHDjquyEQp1gNu95G5vCAFgE/3lKVTR
	LdRk0ngGYO/12jIrH1JrC2cqlf2Y6uzeInVTeZx2UVlMi/UIJteFB5tG3jl/3LKjx6AyvRWqjIf
	2nVMVA9D4sXfO5Ttbn3sdeOwsFlyUiVezqH4veeKBTeO4cADucK6lpnDsnVet0y9cQAKUQ+RHr4
	xIoSqhh+DKtOOYUTgf/N0RwQj1q9lySUBQMGJAPC8iXa7RNwTUYF6d8n5/qUC40yf+cUavC6CiV
	y9XQVHq2jA2u1F2EjeKCEdx+h1bfqC6VKBy+d9ToFGD+WxaNDtXnI5IvRK/2f4pVkXGL3qDS6kA
	81VjcUbE9g9zKc2NkNZoGpBIs+xWx6EwEXQpl8isYIpEXDKbetDek
X-Google-Smtp-Source: AGHT+IG856E0DBHQZj++nmqqeqXCzTuUZphpslPSYxr/Qfq0wR5qukC+N2j+2mjIJ9wkcCDiPk5T1g==
X-Received: by 2002:a17:907:9810:b0:ae9:c47f:1bda with SMTP id a640c23a62f3a-afddd21d01cmr345227066b.59.1755628757856;
        Tue, 19 Aug 2025 11:39:17 -0700 (PDT)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded477d29sm29170966b.75.2025.08.19.11.39.16
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 11:39:17 -0700 (PDT)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6188b5b113eso7930830a12.0
        for <asahi@lists.linux.dev>; Tue, 19 Aug 2025 11:39:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJnav4Ma5kRX8twMH4S7CImcO+2Fk6ZrRK41qkyA2Q3xWbTzPSVQx104L4lNzrRYZEvjTdew==@lists.linux.dev
X-Received: by 2002:a05:6402:354a:b0:618:272a:6dc0 with SMTP id
 4fb4d7f45d1cf-61a97825978mr311982a12.27.1755628756633; Tue, 19 Aug 2025
 11:39:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
In-Reply-To: <20250813-apple-dt-sync-6-17-v1-0-209f15d10aa0@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 19 Aug 2025 14:38:39 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-uMD4xPcmfcoxzdmo_wfHdiUvw=EByY+zG1c5UQ0=EfQ@mail.gmail.com>
X-Gm-Features: Ac12FXwXcPnRZb3XHtBRKxe3pDOsXrkoCrBveLOoTcxv7QMCxYMri1d_dXh5Bt8
Message-ID: <CAEg-Je-uMD4xPcmfcoxzdmo_wfHdiUvw=EByY+zG1c5UQ0=EfQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] Apple device tree sync from downstream kernel
To: j@jannau.net
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 5:53=E2=80=AFAM Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> This series pulls changes from the downstream device trees which are
> supported in upstream kernel.
> Most importantly it fixes the PCIe description for a specific iMac model
> (iMac M1, 2 USB-C ports, 2021). This is worked around in the downstream
> kernel by not disabling the port. In preparation for submitting M2
> Pro/Max/Ultra devices trees I investigated the issue on the similarly
> affected M2 Pro Mac mini and fixed it this way.
> It completes the Wlan/BT device nodes for t600x based devices and adds
> the missing 15-inch Macbook Air (M2, 2023).
>
> Checkpatch emits following warnings:
>
> WARNING: DT compatible string vendor "pci14e4" appears un-documented --
> check ./Documentation/devicetree/bindings/vendor-prefixes.yaml
>
> Which I chose to ignore. `vendor-prefixes.yaml` prefixes contains no
> other mapping for PCI vendor code and the list of ignored prefixes
> forbids extending it. Both options feel wrong though. "pci${vendor}" is
> clearly a vendor prefix but duplicating the PCI vendor data base feels
> wrong. `vendor-prefixes.yaml` currently does not contain and PCI vendor
> aliases.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
> Hector Martin (2):
>       arm64: dts: apple: t600x: Comple WiFi properties
>       arm64: dts: apple: t600x: Add bluetooth device nodes
>
> Janne Grunau (3):
>       arm64: dts: apple: t8103-j457: Fix PCIe ethernet iommu-map
>       dt-bindings: arm: apple: Add t8112 j415 compatible
>       arm64: dts: apple: Add devicetreee for t8112-j415
>
>  Documentation/devicetree/bindings/arm/apple.yaml |  2 +
>  arch/arm64/boot/dts/apple/Makefile               |  1 +
>  arch/arm64/boot/dts/apple/t6000-j314s.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6000-j316s.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6001-j314c.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6001-j316c.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6001-j375c.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t6002-j375d.dts        |  8 +++
>  arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi   | 10 +++
>  arch/arm64/boot/dts/apple/t600x-j375.dtsi        | 10 +++
>  arch/arm64/boot/dts/apple/t8103-j457.dts         | 12 +++-
>  arch/arm64/boot/dts/apple/t8112-j415.dts         | 80 ++++++++++++++++++=
++++++
>  12 files changed, 161 insertions(+), 2 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250813-apple-dt-sync-6-17-d1fc1c89f7ca
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>

--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
