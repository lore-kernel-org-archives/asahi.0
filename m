Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC59185B62
	for <asahi@lists.linux.dev>; Sun,  9 Feb 2025 11:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739100070; cv=none; b=SApwyJC268aeq7TizczzSbgKQaTkICUNMO8CdTdhG34XfYYeOfWdcrIdw9qDH3lYW906tLJCkRRi7OIpnYovyrjlzG6TsI3BNm2uUWZn/xWEbBrjELyuk8l3XSJa06c2iPJ/KLLz5ej8Nnu+7GWy+WAEUghDTyXQNTOxSu0+9+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739100070; c=relaxed/simple;
	bh=CAnnWyCze9cfss+SjVVJmUgbHgwmBOf/0t372kG3MqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cZNX1p/2QNoCjYAP3fc1V8EXeTBxwh2uthlmjT5tyIxNsMfotGtIVXhiPKSIlbq+tbu5ANOE7a422dWPY4LGd67gHfGqXj5dEE166hGFKVlavjLEtvkHeFdLj2orp8KjB/0OHBO4qxVtfXQywZ68rjQAvXnRQ5Ep4LdyRJdWBQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab7a4b40cc1so189331566b.0
        for <asahi@lists.linux.dev>; Sun, 09 Feb 2025 03:21:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739100066; x=1739704866;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3H7l2zQeJCQ6IJMd5f13r5y864trAdM17LlrOlM0f8=;
        b=v2civnCo5nK1IVX8o9Y6KWg/4+odvTpMGCVZGvuxaonh0FkrtDGdHO0/KJ3U4TZzJz
         ihOryoFAlVQ+avG2qU6S/a1UFNEZEsB+BtVtQWJpMNtxWgqhMIIL/ybW31UFGbuHwbn4
         c6/lPIlii0GDbUMfWe+cCwMi5XFTYOjCMLjDDPfk5GnvCljGaccJbZt3JJ+dkoyjEypC
         8cXeBBthRSRP2l0o3qxwPspPPVUHt5uR9lyX92KnwzI/X98WW3QSi/r/hE/QrjUtIt/z
         a5ruRaFUIP3bSFzueLYwUUcPYaB0MVnKIm66dLBrFL452VIV8kuwM6elwgWn8D6WF46J
         8xzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDVvuZPPcpxwmT5gLA9QLf8tox8ansWeKecH0gPtCx0NiCkwoebbt1tlvsXZG1JMARgN6iBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyg/L9o1+GCBK1z0Nppccu4F29WiAs6vNH7P7b+zhmyuFd+or0J
	n0P1yz0avRphC9UVPiuV/oaLSose0CPxT5+eG6ZA1djkTu1EJnNuBZOdD4Mbeys=
X-Gm-Gg: ASbGncu3RD6Aw4U2Q4CJCO489JaH69Hfe/zdDVDLOnd/86ihWGMoSkbdN+HBjUDTXfk
	XbUru0ZMpGalHankDh/3n3qUNZMrOypy6nAUw5iB6hzMLAK9v15Xw2cbgcbjAePwn/YHQZ+uTHx
	pXdMyskbrSK3dg9AcoJ4jAl58ugrPeGOK+7N6n4AWzje81p9563FT72L3wQq0V84cZKIpigzVpY
	bLTnHfGw4U3r+Q/smIGiytVOIBWYsmPJJThSqwqxJ1ZtjtmZnlsa/bkRftT30rSv8Lc1sm46inu
	9JmLZKL5y0TGG84eMB7lB9tX//vozpsBdblWZMktTr9GqA==
X-Google-Smtp-Source: AGHT+IG+nzT1he7wawAdn0pTSA+BeHd/ThqoV2yhAMtAiydFIZOGNAn4OHY/a2PtFvgY3vW6LvR2fA==
X-Received: by 2002:a17:907:3606:b0:ab7:6369:83fa with SMTP id a640c23a62f3a-ab789b28ea9mr1083541766b.33.1739100066066;
        Sun, 09 Feb 2025 03:21:06 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7be7ac8a9sm25483866b.39.2025.02.09.03.21.05
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 03:21:05 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5de5e3729ecso2080903a12.0
        for <asahi@lists.linux.dev>; Sun, 09 Feb 2025 03:21:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUcljUAZHFN0a+j1yqgqWzSwyoq1xGMauRr+bXB2XDp72fsugtjQdOJvOjDrhbSNNCFWAeD3g==@lists.linux.dev
X-Received: by 2002:a05:6402:4615:b0:5dc:cf9b:b033 with SMTP id
 4fb4d7f45d1cf-5de44fea8aemr10414132a12.5.1739100065489; Sun, 09 Feb 2025
 03:21:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250203114417.16453-1-towinchenmi@gmail.com>
In-Reply-To: <20250203114417.16453-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 06:20:28 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-zEy3pxS06arXfpvkX5p1=C01M7ryt6ymGjMyVweaH1Q@mail.gmail.com>
X-Gm-Features: AWEUYZkUL7KIDLWrANT2GMLY2aCBOSjId3KzpFCyyGq6xdbnQ16cXMqe9iLjzl8
Message-ID: <CAEg-Je-zEy3pxS06arXfpvkX5p1=C01M7ryt6ymGjMyVweaH1Q@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 0/2] Device Tree for Apple T2 (T8012) SoC devices
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Aun-Ali Zaidi <admin@kodeit.net>, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 6:45=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> wr=
ote:
>
> This series adds device trees for the Apple T2 Security Chip found on
> some Intel Macs released after 2017. This SoC is based on Apple A10
> (T8010) SoC and, for many hardware blocks, can share the A10 compatibles.
>
> Changes since v2:
> - Drop PMGR nodes, moved to PMGR nodes for A7-A11, T2 SoC series.
>
> Link to v2: https://lore.kernel.org/asahi/20241203051147.110980-1-towinch=
enmi@gmail.com/T
>
> Changes since v1:
> - Use imperative mood in commit messages
>
> Link to v1: https://lore.kernel.org/asahi/20241201161942.36027-1-towinche=
nmi@gmail.com/T
>
> [1]: https://lore.kernel.org/asahi/20241203050640.109378-1-towinchenmi@gm=
ail.com/T
>
> Nick Chan
>
> Cc: Aun-Ali Zaidi <admin@kodeit.net>
>
> ---
> Nick Chan (2):
>   dt-bindings: arm: apple: Add T2 devices
>   arm64: dts: apple: Add T2 devices
>
>  .../devicetree/bindings/arm/apple.yaml        |  41 ++++
>  arch/arm64/boot/dts/apple/Makefile            |  16 ++
>  arch/arm64/boot/dts/apple/t8012-j132.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j137.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j140a.dts     |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j140k.dts     |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j152f.dts     |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j160.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j174.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j185.dts      |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j185f.dts     |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j213.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j214k.dts     |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j215.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j223.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j230k.dts     |  14 ++
>  arch/arm64/boot/dts/apple/t8012-j680.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-j780.dts      |  15 ++
>  arch/arm64/boot/dts/apple/t8012-jxxx.dtsi     |  44 +++++
>  arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |  19 ++
>  arch/arm64/boot/dts/apple/t8012.dtsi          | 176 ++++++++++++++++++
>  21 files changed, 527 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j132.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j137.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j140a.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j140k.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j152f.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j160.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j174.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j185.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j185f.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j213.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j214k.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j215.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j223.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j230k.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j680.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-j780.dts
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-jxxx.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-touchbar.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8012.dtsi
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
