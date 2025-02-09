Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932FA14F115
	for <asahi@lists.linux.dev>; Sun,  9 Feb 2025 10:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739098350; cv=none; b=qpcau8RIXD44ORFbvYHC5xHCaLiaxcPHx6NNOE5taUYKqqu7//XBTSo7yc3JA6R7hvQwfPGyWJ5w2/0cJrvxN5d7+8TTQppfCo5KIrRRj6ni4oc/fk8SxS71+etlIy1RTUpbf2r9nKnnyl3fiy/JiZrw+8TBaF5ynIKxS6MBk94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739098350; c=relaxed/simple;
	bh=99Q0XUTzbpO0aXxB9c7lAHvm67OUL659f0fUrxhbdvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVJISb3yT6+X7iUPAeHvoujvg6j5zgfdkZstx7Rxd/XxDvBAMCRD1j/1vpHOka3Q28KvZ36UTldgMcy7htPNs1zQYIwFHpH7DOtyvoPsOoC2DdO9F+w0C7lXZC/+Cox1j0+iRS/A4X7l08YTgxsyvZKVDZ6gfVhaBYyVjb+o/lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ab794ae3cf2so189810166b.2
        for <asahi@lists.linux.dev>; Sun, 09 Feb 2025 02:52:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739098347; x=1739703147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Au6zQLeh68QVpuJTfw781W0Z1sj2OEff0MPZwPdF+qs=;
        b=A/kZm4q/8egHqQyBOqqJM1wr0rYgiXxzW5zliZQ3ytD38X9xlHefe1xNQV080KsqBc
         BlwGoW59kXoQQbLGmM4JmKK8f3bjbjVJmLNZfjrpIyAyXSYu2tPapsrLARs7gLke/+md
         i8ZklozE2VHvRfeJAw70b/6A2jhbNyqzI+bU9WOS+dmuHmp0zb+6b4xwu0vMfsce6MDb
         2tJkKux7dahPgEl2F91geVdn2TViVDepkcDLZGjIB0LxWaTU26N6om67qa1IfnNUy5Ot
         Zky3wnMpt/cPlHZTgy+xwNr30yVz0KJXsS3BSd+ULJE0lYV99Gu5MoR22h0h3KRnQKkE
         stcA==
X-Forwarded-Encrypted: i=1; AJvYcCVVZP7HF6gu+/lCSidL8xwtFjNYSA70AbWIkStrOVBkagckfPjMmiVf6i40ZIdbA81GWcvEgg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9Ng3YGAzt9aUn2y4owS8XNwhVXzwMA3P0oh0XkEn20kspkho1
	rBUpilBefsaTYuQ8Bl4an4HzJ0sQAU6lZe/4u7dvNsH83QhlhGQe/2SfrbluWlM=
X-Gm-Gg: ASbGncs8It4ZfDFnr0XnQswehbp4WFW3Q7XICWcdA+tw70SUtz3n9B3JPauHWCv7PsP
	4ulnJpna2WMKjtyhSecN66XDK+6NkP4a4VPxHZXHFQpqYrMGsIR43X4HaCTqyLFHw9N27SU6kPj
	ZPYxmgMZMJ/HuG9j7fa00I/CTUyCAvCddIX/TasG7cgLUHsSf6YuM+fnlPomf37Yz3gAQMZVEYL
	6vJIJT6Wt0x/ucqAvLnUmIexeRVs2eee5/Ln0/c1DEY5xxUm0/GEpCDiJDlp+vaNznBQb2ujWbY
	3YLV40s+BptmoXN8Dis/cedmGTCAJ3qGr1MoN1nuzfXWLA==
X-Google-Smtp-Source: AGHT+IEs18mcbBMtJBXCpWyRlJ4y1evSNnkkjSmQ5JYEMQASp5myPukQ++D5NVWRo/j9L/Idpz81qg==
X-Received: by 2002:a17:907:2d27:b0:aa6:89b9:e9c6 with SMTP id a640c23a62f3a-ab789ac0dcdmr919642366b.21.1739098346511;
        Sun, 09 Feb 2025 02:52:26 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab773339e82sm655448266b.143.2025.02.09.02.52.26
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 02:52:26 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5de7519e5a7so271360a12.2
        for <asahi@lists.linux.dev>; Sun, 09 Feb 2025 02:52:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVni6H2NAd57PqvPqvL5mKtYdclo2HNRR3O+RzrZgt+ngNH6Ji4yF0C0cQbrO+HUqPkl+Ur8w==@lists.linux.dev
X-Received: by 2002:a05:6402:e8a:b0:5d9:f9b8:e7e5 with SMTP id
 4fb4d7f45d1cf-5de45019c14mr12109880a12.15.1739098346131; Sun, 09 Feb 2025
 02:52:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250203124747.41541-1-towinchenmi@gmail.com>
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 05:51:49 -0500
X-Gmail-Original-Message-ID: <CAEg-Je88vu26f_c5oE+MfedOw-bvmAO_v7YYhbaEiX-p3oivYA@mail.gmail.com>
X-Gm-Features: AWEUYZkreSJI3JUypO3Y6OVLfPm7TpTxsqhTmgRkrr1SmVO3qusxGLiZ7hKNs1I
Message-ID: <CAEg-Je88vu26f_c5oE+MfedOw-bvmAO_v7YYhbaEiX-p3oivYA@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/9] Add Apple A7-A11, T2 SoC cpufreq nodes
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 7:51=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> wr=
ote:
>
> This series adds performance-controller and operating-points-v2 cpufreq
> nodes for Apple A7-A11, T2 SoCs.
>
> Dependencies:
>
> - arm64: dts: apple: Split s8000/s8003 SoC DTS files
> https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.co=
m/T
>
> - Device Tree for Apple T2 (T8012) SoC devices
> https://lore.kernel.org/asahi/20250203114417.16453-1-towinchenmi@gmail.co=
m/T
>
> Note, this will have conflicts with Apple A7-A11, T2 PMGR nodes [1] due t=
o
> both of the series adding things to the same part of the .dts files, they=
 are
> unrelated, so keep both of additions.
>
> 1: https://lore.kernel.org/asahi/20250203121831.36053-1-towinchenmi@gmail=
.com/T
>
> Nick Chan
>
> ---
> Nick Chan (9):
>   arm64: dts: apple: s5l8960x: Add cpufreq nodes
>   arm64: dts: apple: t7000: Add cpufreq nodes
>   arm64: dts: apple: t7001: Add cpufreq nodes
>   arm64: dts: apple: Add cpufreq nodes for S8000/S8003
>   arm64: dts: apple: s8001: Add cpufreq nodes
>   arm64: dts: apple: t8010: Add cpufreq nodes
>   arm64: dts: apple: t8011: Add cpufreq nodes
>   arm64: dts: apple: t8012: Add cpufreq nodes
>   arm64: dts: apple: t8015: Add cpufreq nodes
>
>  arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   1 +
>  arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   1 +
>  arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   1 +
>  arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi   |  45 +++++++
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  10 ++
>  arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi   |  45 +++++++
>  arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  10 ++
>  arch/arm64/boot/dts/apple/s8000.dtsi          |  53 +++++++-
>  arch/arm64/boot/dts/apple/s8001.dtsi          |  59 +++++++++
>  arch/arm64/boot/dts/apple/s8003.dtsi          |  53 +++++++-
>  arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t7000-j42d.dts      |   4 +
>  arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t7000.dtsi          |  46 +++++++
>  arch/arm64/boot/dts/apple/t7001.dtsi          |  52 ++++++++
>  arch/arm64/boot/dts/apple/t8010-7.dtsi        |   8 ++
>  arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   8 ++
>  arch/arm64/boot/dts/apple/t8010.dtsi          |  86 ++++++++++++
>  arch/arm64/boot/dts/apple/t8011.dtsi          |  79 +++++++++++
>  arch/arm64/boot/dts/apple/t8012.dtsi          |  83 ++++++++++++
>  arch/arm64/boot/dts/apple/t8015.dtsi          | 123 ++++++++++++++++++
>  21 files changed, 773 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi
>
>
> base-commit: a14d9039c2aea103eeedc5602ebab731ef3eb73e
> --
> 2.48.1
>
>

This series looks good to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>

I've also CC'd in the new tree maintainer Janne so they can see this series=
.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
