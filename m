Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085BD13B58A
	for <asahi@lists.linux.dev>; Sat, 10 Jan 2026 16:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768061893; cv=none; b=MW/9KmFvKS/pIizalk/1Eye+orCfeY9WpIX48cCQqZKv4kRM71j2X7ngN/K9elGmrEdo5i0toCQ5TqnpxOoADWOpylccqMDVfLecwFcBQX5XJ6eNqfHe1sdTA+OYBxJEczL4Z7vDdTVCGyBM5UrGbT4/mCZ2dggZrg1EzTpLSgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768061893; c=relaxed/simple;
	bh=9yq3DORE5qus1JunAr+tdPxhJGn5H4JqrSUtwQEomhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OGJrvjeC8s7G92tcGsnmp7ASo+czSjtOPRcFyaf/W3lnsFBfAmhC+ylzku2Wqj6vOhMCrIurgYNQuvOOuJH5bDEzNZHrf+bUpzv0LPKNKEU1yq3RICKILWop7MdA3gWPAnINEuPNVb6L60icNT2vj+4+N5sw7kCKF75OKYuAf1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7c75178c05fso2009437a34.0
        for <asahi@lists.linux.dev>; Sat, 10 Jan 2026 08:18:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768061891; x=1768666691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KQdYwLZzXMAU8SmkA7uOTds+binBUVJuHuO0dy4zD+c=;
        b=KJ17wrEqygaagQd4eqJIbvzwETzp2fl9ayved/v1koqGspsTZ4w3wfNXRocXqUdRh7
         ciJqSeopKka074DiBoVyXGao5cuDHY0siW7thr+Hd7OxKsq5FJbHDQWPG1G0Wf06Nt9W
         TBLhQW7P+E6QFo9+WKybiqWcaFhY07569loMxUizpXg0teSdIqRfAgx69j0ORMkhv4DD
         q9VX4h84pTUMnZr0vD5XcGYjFPgC092iLwXcl8IbI6Gk4xWU4xDPYSopk5pbctaBR0hI
         EKvKyCfWKh8l7o0G/CKD8uLO7xo0mxD+knEnydwQsncSiufp1sIhLeb5adabJNvaHe4P
         FEtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXN8gxsQz0Y5GSONkzvLiDd39A4dUf1IXr8G2KOfTX5OnBu4u9oLTDItK0Hk53nSwI6SloL9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyU0Lq4RwBXHY0UHgffTkSUQQFhmjaBFB5oqyoi5UtDP2B9faw7
	cyd0y4WgYnHSUsoPxzY4ctchY5NRIygV+pfsdPDd1e/FO8Qd4qj3VlMrcykfGw==
X-Gm-Gg: AY/fxX7/nchW7/0jyywQ3yKgAuH+ItIKSFKQfTPB/YQquWmI9PBsx2KRi8sbs1Z2UDW
	/4tjYbIxkmnjaWOf2UGUfjezGKsqKwwfcWXQ1Lsg1651RSbiNslKuCsAs2yS+ahmU+XjT/Htp/G
	6kDcDaEIFxUmW9AIS4HBnRCiV6co4D8jmQsOhK0yawpkZ7FMYZIKzPErDJvE8EQ5YxaYB6GwtUc
	0VZYUrMTdcshwpNgOAMewKZFl6inNBEHOARbjY7ZfzsavNi4LCQA8roI1pRkmORgWstRn3XZRPO
	jz7/jDJs9o9HZfZy/ev32ahXfeDb/kYF1qLYvlMpIPwX8xtYEVz8VbkScIdTRwtQfOdLoJYBc5u
	26ke5uWdJlFDfxdSzwmOtPG+Uzwk+MH/pknA4bS9Vn0aw+7M4CSH+ryn+gAVuXm/iPZmaIz+KuO
	7HtvA2xaEBn6csSnsPUzm33F3RijBxuwjCVuxIVGi5yP9lrR/HBOXMCxz1x5hNP5iMgfXRxv9n
X-Google-Smtp-Source: AGHT+IFzqQOJtB9CGptz2u3b/qeGMYGKSZqw2EB8k3lK7+LYuxu5d0U1T5cdLiOmt7bZo0DE2S575Q==
X-Received: by 2002:a05:6830:438b:b0:756:a322:311 with SMTP id 46e09a7af769-7ce50ae90cfmr7062317a34.10.1768061890558;
        Sat, 10 Jan 2026 08:18:10 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478f05f7sm9583097a34.31.2026.01.10.08.18.10
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 08:18:10 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7c75178c05fso2009425a34.0
        for <asahi@lists.linux.dev>; Sat, 10 Jan 2026 08:18:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjoAeP5Z13PhWawNhYFUoFRu5X/1V4p5Lc+HEwnS4qgW3rqiFhSNvumriGool2oQpYQFK77A==@lists.linux.dev
X-Received: by 2002:a05:6830:43a3:b0:7c7:162:e0c7 with SMTP id
 46e09a7af769-7ce50a90f4bmr8147510a34.6.1768061889898; Sat, 10 Jan 2026
 08:18:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sat, 10 Jan 2026 11:17:32 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-HQX+gn6btg2XdSWksKT_LWiZALHYUut6g=nLNyyss-g@mail.gmail.com>
X-Gm-Features: AQt7F2qg4rFQ5hy8HWAR12VQcLFFsQaKZU4AJgyzrS2WAPR63DqzY544RgrVDKs
Message-ID: <CAEg-Je-HQX+gn6btg2XdSWksKT_LWiZALHYUut6g=nLNyyss-g@mail.gmail.com>
Subject: Re: [PATCH v10 00/21] drivers/perf: apple_m1: Add Apple A7-A11, T2
 SoC support
To: Nick Chan <towinchenmi@gmail.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 1, 2026 at 4:02=E2=80=AFAM Nick Chan <towinchenmi@gmail.com> wr=
ote:
>
> This series adds support for the CPU PMU in the older Apple A7-A11, T2
> SoCs. These PMUs may have a different event layout, less counters, or
> deliver their interrupts via IRQ instead of a FIQ. Since some of those
> older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
> be enabled by the driver where applicable.
>
> Patch 1 adds the DT bindings.
> Patch 2-7 prepares the driver to allow adding support for those
> older SoCs.
> Patch 8-12 adds support for the older SoCs.
> Patch 13-21 are the DT changes.
>
> Happy new year 2026!
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
> Changes in v10:
> - Modify apple_pmu_get_event_idx() to take the number of counters support=
ed
>   on the current PMU, which allows `perf record` to work correctly on A7-=
A9
>   with 8 counters in the PMU.
> - Rename the added counters to nr_counters in apple_pmu_init()
> - Link to v9: https://lore.kernel.org/r/20251218-apple-cpmu-v9-0-4deadbe6=
5d03@gmail.com
>
> Changes in v9:
> - Rebased on top of v6.19-rc1
> - Removed non-existent "INST_A32" and "INST_T32" events from Apple A11
> - Added "INST_A32" and "INST_T32" event affinities for A9 and A10
> - Link to v8: https://lore.kernel.org/r/20250811-apple-cpmu-v8-0-c560ebd9=
ca46@gmail.com
>
> Changes in v8:
> - Rebased on top of v6.17-rc1
> - Collect Ivaylo's Tested-by
> - Drop #define PMCR1_COUNT_A64_EL3_0_7
> - Reword reason to not initialize PMUv3 remap in EL1
> - Link to v7: https://lore.kernel.org/r/20250510-apple-cpmu-v7-0-bd505cb6=
c520@gmail.com
>
> Changes in v7:
> - Fix a W=3D1 compile warning in apple_pmu_get_event_idx() as appearently=
 using GENMASK()
> in a function prototype causes a warning in GCC.
> - Link to v6: https://lore.kernel.org/r/20250407-apple-cpmu-v6-0-ae8c2f22=
5c1f@gmail.com
>
> Changes in v6:
> - Rebased on top of v6.15-rc1 (Conflict with FEAT_PMUv3 support for KVM o=
n Apple Hardware)
> - Add patch to skip initialization of PMUv3 remap in EL1 even though not =
strictly needed
> - Include DT patches
> - Link to v5: https://lore.kernel.org/r/20250228-apple-cpmu-v5-0-9e124cd2=
8ed4@gmail.com
>
> Changes in v5:
> - Slightly change "drivers/perf: apple_m1: Add Apple A11 Support", to kee=
p things in
> chronological order.
> - Link to v4: https://lore.kernel.org/r/20250214-apple-cpmu-v4-0-ffca0e45=
147e@gmail.com
>
> Changes in v4:
> - Support per-implementation event attr group
> - Fix Apple A7 event attr groups
> - Link to v3: https://lore.kernel.org/r/20250213-apple-cpmu-v3-0-be7f8ade=
d81f@gmail.com
>
> Changes in v3:
> - Configure PMC8 and PMC9 for 32-bit EL0
> - Remove redundant _common suffix from shared functions
> - Link to v2: https://lore.kernel.org/r/20250213-apple-cpmu-v2-0-87b36193=
2e88@gmail.com
>
> Changes in v2:
> - Remove unused flags parameter from apple_pmu_init_common()
> - Link to v1: https://lore.kernel.org/r/20250212-apple-cpmu-v1-0-f8c7f2ac=
1743@gmail.com
>
> ---
> Nick Chan (21):
>       dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
>       drivers/perf: apple_m1: Only init PMUv3 remap when EL2 is available
>       drivers/perf: apple_m1: Support per-implementation event tables
>       drivers/perf: apple_m1: Support a per-implementation number of coun=
ters
>       drivers/perf: apple_m1: Support configuring counters for 32-bit EL0
>       drivers/perf: apple_m1: Support per-implementation PMU startup
>       drivers/perf: apple_m1: Support per-implementation event attr group
>       drivers/perf: apple_m1: Add Apple A7 support
>       drivers/perf: apple_m1: Add Apple A8/A8X support
>       drivers/perf: apple_m1: Add A9/A9X support
>       drivers/perf: apple_m1: Add Apple A10/A10X/T2 Support
>       drivers/perf: apple_m1: Add Apple A11 Support
>       arm64: dts: apple: s5l8960x: Add CPU PMU nodes
>       arm64: dts: apple: t7000: Add CPU PMU nodes
>       arm64: dts: apple: t7001: Add CPU PMU nodes
>       arm64: dts: apple: s800-0-3: Add CPU PMU nodes
>       arm64: dts: apple: s8001: Add CPU PMU nodes
>       arm64: dts: apple: t8010: Add CPU PMU nodes
>       arm64: dts: apple: t8011: Add CPU PMU nodes
>       arm64: dts: apple: t8012: Add CPU PMU nodes
>       arm64: dts: apple: t8015: Add CPU PMU nodes
>
>  Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi        |   8 +
>  arch/arm64/boot/dts/apple/s800-0-3.dtsi        |   8 +
>  arch/arm64/boot/dts/apple/s8001.dtsi           |   8 +
>  arch/arm64/boot/dts/apple/t7000.dtsi           |   8 +
>  arch/arm64/boot/dts/apple/t7001.dtsi           |   9 +
>  arch/arm64/boot/dts/apple/t8010.dtsi           |   8 +
>  arch/arm64/boot/dts/apple/t8011.dtsi           |   9 +
>  arch/arm64/boot/dts/apple/t8012.dtsi           |   8 +
>  arch/arm64/boot/dts/apple/t8015.dtsi           |  24 +
>  arch/arm64/include/asm/apple_m1_pmu.h          |   2 +
>  drivers/perf/apple_m1_cpu_pmu.c                | 820 +++++++++++++++++++=
++++--
>  12 files changed, 883 insertions(+), 35 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20250211-apple-cpmu-5a5a3da39483
>

Seems reasonable to me.

Acked-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
