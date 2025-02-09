Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397CF14B945
	for <asahi@lists.linux.dev>; Sun,  9 Feb 2025 11:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739099772; cv=none; b=gLZBtVDW2hP9IA/0GjUcnrWVlZ6y/h9Bgcon7LEkZ/B5SjWG7xuU2DQedUENNctsJmXVP0AOnDH7i8AD8mFpYUA3tLPxq6At9WFpENNrhMxm9/pBtmgmpcSCg8YGkDv0XxpWSiymw9asMurahEaRyA98LgEYH/DbFhiLscLwodg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739099772; c=relaxed/simple;
	bh=wJxbsC2z3YtJooP/30BhwNTuYyRohccVqSb1xfQsn0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LnHuss2P40jww+Sn8Hk08J00s/ONGYtMPLaGsaNmBfTJp9NQtT3F+c7DtqQQEaKu5URl9aDdFHmL5JXO15hiAMomrT7KES3STvQ1vuXUYxPM/u+KXchPBqrZqzlt9LIAet6QmcC8SFkNcYnDRU2VmVT1ipZh86nIeqQ14LRlB9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaec111762bso847846966b.2
        for <asahi@lists.linux.dev>; Sun, 09 Feb 2025 03:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099768; x=1739704568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iG9OSYVRZ3++ywrXL3F1Sigy1gOA1N63fgWGxmeELDY=;
        b=e+w/DxvGv8x8nQnJvdqWL/87VXs/arj9u6CSZcQbopiscegZpvK8xYfzXJCShCiOBu
         /iPQTHf+U17ssp8wwrZLg6K1v8gWmX/Az0JxiiXhm0NzrImdS5xmDkGlPX4rO9DCyilF
         +Iz0tjCDr9H/gl54nwv7tuM9twFVhTaYbkZtBQ5DOy2hynQrJjhl2CBg//An9E3B6n2a
         Wl8rQxDlSjjYsLMhm4GN89dMXPpoh24T/JM0SqNQi7jm3UXWgChmuOb3EByXMaDGt0UY
         oUcTeQzoeNylwR7+RkTqTXLtBUgQnnjwQgWmJp9fgXYFUctwNOcOKMjx5StarMDXZvYj
         gmyw==
X-Forwarded-Encrypted: i=1; AJvYcCUgeO3EcohS6FjytynRoAecPeGWBAFLEkPthP34iip5qlt3jz7E+vtQ0Lw2vMyetayXQQhJIw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0rLF0o+X/tGVdEhwv2TaCteSr22AwrhsToph67d1Jpe+6Fc+j
	wTImMnd3oV6e680zbwz+n0kjL+8lnkWLr4sK+thwRFm2h5Lj3/NBeJTTBn5kLTM=
X-Gm-Gg: ASbGncv3IPmyW4xP0Hby0v98/RnBRwKRMUuQyQpDWDknwNb2iybBy19HlTGmR8C4oea
	3d9nUyJB8wrHduS6G0cX/kmptBB1/H+OezzX3EUmxyPTrNvJ5so4Pp/LJTTwU6VCl+xMFGxTgqa
	t1++HgUEkjqd24MUI0FNchQcg1/dnq6NRqZCOlpjT40pM2sozTr6suv8ZU7i6vU2AkeNqTIGW4W
	9d1fLyzA18oQwz5c1AYItqbfIwpHuoMDmdKkQXyNYgptru9Mr9qJ0RNNrUyH2z2Kf7gRRbbgkgT
	58QsveWYihEEzV3yGVF8gmnqi/V1gEWGb3512mtAzHS9tQ==
X-Google-Smtp-Source: AGHT+IFmoobkYRjKYSQaAOACNJBRdMqkRklwZblWUiqvuyZWFkX52yu9HWDldAQmEuR7icnB0uUYmQ==
X-Received: by 2002:a17:907:1b24:b0:ab3:85e1:f11a with SMTP id a640c23a62f3a-ab789b34498mr1026582966b.13.1739099767927;
        Sun, 09 Feb 2025 03:16:07 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab785bc25d0sm540852066b.132.2025.02.09.03.16.07
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 03:16:07 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5de4f4b0e31so3305235a12.0
        for <asahi@lists.linux.dev>; Sun, 09 Feb 2025 03:16:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXsN9WEMQKqNTz4h9WUchHzt1wJu4RpfDwCBkFYhWHhMvqouXBrLzklqCBZufNfWYAzSvrltQ==@lists.linux.dev
X-Received: by 2002:a05:6402:2106:b0:5dc:58ad:b8d5 with SMTP id
 4fb4d7f45d1cf-5de450028ccmr9278045a12.9.1739099767175; Sun, 09 Feb 2025
 03:16:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250203121831.36053-1-towinchenmi@gmail.com>
In-Reply-To: <20250203121831.36053-1-towinchenmi@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 06:15:30 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-iyYeJ3KrfmY5Rw7p9P4gJjFitfSQm6zU1YR+BaJ1z4Q@mail.gmail.com>
X-Gm-Features: AWEUYZkSDgSvnihPMz58EG7aGE05QsB0MtC-oDAO7_jhkBlKmWapE15sU421zUA
Message-ID: <CAEg-Je-iyYeJ3KrfmY5Rw7p9P4gJjFitfSQm6zU1YR+BaJ1z4Q@mail.gmail.com>
Subject: Re: [PATCH v7 RESEND 00/11] Add PMGR nodes for Apple A7-A11, T2 SoCs
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 7:20=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> wr=
ote:
>
> This series adds the PMGR nodes and all known power state subnodes for
> Apple A7-A11, T2 SoCs, along with the associated dt-bindings.
>
> Dependencies:
> - Split s8000/s8003 SoC DTS files
> https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.co=
m/T
>
> - Device Tree for Apple T2 (T8012) devices.
> https://lore.kernel.org/asahi/20250203114417.16453-1-towinchenmi@gmail.co=
m/T
>
> Changes since v6:
> - Now arch/arm64/boot/dts/apple/s800-0-3.dtsi builds, somehow this went
> under the radar this whole time...
>
> Link to v6: https://lore.kernel.org/asahi/20241222173750.148071-2-towinch=
enmi@gmail.com/T
>
> Changes since v5:
> - Rebase the series such that splitting s8000/s8003 device trees is the
> first patch to be applied. Now this series depends on Apple A9 device
> tree being split, and the T2 SoC PMGR nodes are added in this series.
>
> Link to v5: https://lore.kernel.org/asahi/20241203050640.109378-1-towinch=
enmi@gmail.com/T
>
> Changes since v4:
> - Use imperative mood in commit messages.
>
> Link to v4: https://lore.kernel.org/asahi/20241201161942.36027-1-towinche=
nmi@gmail.com/T
>
> Changes since v3:
> - Add "apple,always-on" property to "ps_spmi" in t8015 power domains.
> This is required for cpufreq to function correctly which will be added
> in a later series.
>
> Link to v3: https://lore.kernel.org/asahi/20241122095136.35046-1-towinche=
nmi@gmail.com/T
>
> Changes since v2:
> - Removed "apple,always-on" property from "ps_pmp" from s8001, t8011,
> t8015 power domains. It is not on at boot. (Mixed up with ps_pms which
> is required to be on)
> - Add asahi-soc/dt back into the subject prefix, missing from v2.
>
> Link to v2: https://lore.kernel.org/asahi/20241102011004.59339-1-towinche=
nmi@gmail.com/T
>
> Changes since v1:
> - Removed "framebuffer0" dt aliases. It is not standard and not needed.
>
> Link to v1: https://lore.kernel.org/asahi/20241029010526.42052-1-towinche=
nmi@gmail.com/T
>
> Nick Chan
> ---
>
> Nick Chan (11):
>   dt-bindings: arm: apple: apple,pmgr: Add A7-A11, T2 compatibles
>   dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2
>     compatibles
>   arm64: dts: apple: s5l8960x: Add PMGR node
>   arm64: dts: apple: t7000: Add PMGR node
>   arm64: dts: apple: t7001: Add PMGR node
>   arm64: dts: apple: s800-0-3: Add PMGR nodes
>   arm64: dts: apple: s8001: Add PMGR nodes
>   arm64: dts: apple: t8010: Add PMGR nodes
>   arm64: dts: apple: t8011: Add PMGR nodes
>   arm64: dts: apple: t8012: Add PMGR nodes
>   arm64: dts: apple: t8015: Add PMGR nodes
>
>  .../bindings/arm/apple/apple,pmgr.yaml        |   5 +
>  .../bindings/power/apple,pmgr-pwrstate.yaml   |   5 +
>  arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
>  arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi  | 757 ++++++++++++++
>  arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  22 +
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
>  arch/arm64/boot/dts/apple/t8012-pmgr.dtsi     | 837 ++++++++++++++++
>  arch/arm64/boot/dts/apple/t8012-touchbar.dtsi |   1 +
>  arch/arm64/boot/dts/apple/t8012.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
>  arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
>  42 files changed, 7097 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s800-0-3-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8012-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi
>
>
> base-commit: 146773acdbf5afd40b0faf7383061a95adee8a2f
> --
> 2.48.1
>
>

Series looks good to me, so...

Reviewed-by: Neal Gompa <neal@gompa.dev>

I've also looped in the new Apple ARM maintainer Janne so they see the
patch set.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
