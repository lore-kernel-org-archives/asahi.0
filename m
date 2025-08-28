Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE70826A0A6
	for <asahi@lists.linux.dev>; Thu, 28 Aug 2025 02:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756349775; cv=none; b=UGctdJup5LwCCe/UAhsokfa02MxpsN/xlhZIoM/104+okElzfAya9mU+TApiaL4ScXX0Kc/BI4sHtewC/r1ceuzDfKVEp9KxTrB+PgG3JhE/m3g0FYKY0MI/Hy03T6WNf8+wbeq4/hYua3yaG3uMT4MLzlGes7iCgR59og9gJ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756349775; c=relaxed/simple;
	bh=3Q9iEVOUz1gJksPvlCugtYW8aE3sRLkDtX7rKdL7enw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bvj5zJvg+jnDv9TMrhS7RWoGMJy1OfYG3+tF+YDDb9TdgI+5Auktem9cpViTyNIVSHwdZ54NPya5m3pauxLXtu86QFbeCOax1uzbvKuRhH7f1BOUrbA3+pCcUorLQMrvJEoV3Gx8mjfGlWTp853ftMQwENxOM2tQVhyvnkIa+dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb731ca8eso73382266b.0
        for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 19:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756349771; x=1756954571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/sG5Ec7Hlcd6BQNqJwLka5sDq9zcWIANhRNknbwVaY=;
        b=TYjYSJEnpGClWGohpuSI79QW6lhr6TVTRURwBm7a0PdtUFASVxzl9zzFviye6k5Z/t
         zWBNDTH6E41GzPZgrOYtbxEKcgz2AgbwSc1MbM8wrOzyDV0CXFLcyy3QAQjW8FtVGwqJ
         WX97XpcWSIq3GOcomN3sAk6RpGeTRSxhkTiM4npVcsGY+5y8i8kL8C59mJu+s1VtNHas
         3Ht+bsF28ccxY+qwhl+B0lradKG5/zDFq5jwYm3jv2+UgXLLAjZrCv0uKBBVC4nQ51jX
         mGy094xWE26I+Ew85rIGBOG6Th/jRpkixY3+WbrrbUyDxz+VGaCCLavCcFGOHGj3eL8m
         VeGw==
X-Forwarded-Encrypted: i=1; AJvYcCWep19MGDtYIlUN9Odnd5+1tsczoRBoFPfKmVHHad/IMFtw11UStb1kjArBd+FT0ltIEEcJSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQRUR1j7B7Jx94ZUQCLIcO3S0ILQmM+z+ZuONMJDGwL0RjtEja
	0VXAsx3Wfy+zFe9062TA9Vxy8c/EeJ64IfAvJHQ/NzITIxPvMFdZSNZkBP9XFm951ZE=
X-Gm-Gg: ASbGncsA06TGyntbd9W+VVSFp5w4r2Toq4FwjEkhbwNr7P4Y85lG9/ScGZk9qaTkbYK
	WG88VTvGP5qlCWEegq6xAtoBjDOthkS4ZHcB3PLgeTp2wn0rVkToQvxEhoWuKVu3x8YSDGInDyI
	QnHFprt3ZG6soi8e9z6ImD0NeE7aLG3Wk5c2k03QS72FBuZarjvgc/AnakYEPPLUOvY4tSawC+O
	lM+pmTBDapRYZ7AiDsYus9hdE/VJ9pI9VgbmLaqqYMUAsRBOxkDH6NjbxWOzndP366FcgeEA1Bd
	CJkBqtJ4P5EBy2zPQJ0Cey38JZiBcbuujG5Fz1dP0CoYSDJP1LxpOgMnPfTGKdinZnAWL6gm/13
	/vlVH+TjJ9qCgE/1Dz9hy6pukCs+/6PGBuO8NShZkJAdSL0oYdkElkHffW4kjSQTnOQXt4s9szL
	IM8gueT64RYxnCD7sxSUA=
X-Google-Smtp-Source: AGHT+IGvsCtTkfODBHVSpueQ9bkckaAG43tMMeZR0k8GDyFzxr8bIn3dL5SxdbdoOkYnPnI3ZTQ3Tg==
X-Received: by 2002:a17:907:7212:b0:afe:8eb8:91f with SMTP id a640c23a62f3a-afe8eb896d8mr1014132166b.52.1756349771280;
        Wed, 27 Aug 2025 19:56:11 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe81ebf53bsm767734166b.15.2025.08.27.19.56.10
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 19:56:10 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7ace3baso74651166b.3
        for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 19:56:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdpkoiDLfFxb/h17cza2Qw8XsuzJsgmEtQlIespYCtUMu79quOW6mt1aLmk4ftHJYwxYY5eQ==@lists.linux.dev
X-Received: by 2002:a17:907:7f26:b0:afe:ea46:e808 with SMTP id
 a640c23a62f3a-afeea4747aemr33407866b.47.1756349770127; Wed, 27 Aug 2025
 19:56:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
In-Reply-To: <20250823-apple-dt-sync-6-17-v2-0-6dc0daeb4786@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 27 Aug 2025 22:55:33 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9WSJ_eyuKfZejCNCdN5g-V-7_VSW=NY=Sxc4jCJfDcJA@mail.gmail.com>
X-Gm-Features: Ac12FXybLNW3dXUB-nTs8fEB4lNe9ODNBHdvueiT250V7fxKSinYXBh99Kd-hDc
Message-ID: <CAEg-Je9WSJ_eyuKfZejCNCdN5g-V-7_VSW=NY=Sxc4jCJfDcJA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Apple device tree sync from downstream kernel
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 23, 2025 at 5:49=E2=80=AFAM Janne Grunau <j@jannau.net> wrote:
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
> Changes in v2:
> - fixed commit subject of PATCH 2/5
> - correct Macbook Pro (15-inch, M2) to Macbook Air
> - added Neal's and Sven's Rb: tags
> - Link to v1: https://lore.kernel.org/r/20250813-apple-dt-sync-6-17-v1-0-=
209f15d10aa0@jannau.net
>
> ---
> Hector Martin (2):
>       arm64: dts: apple: t600x: Add missing WiFi properties
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

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
