Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DAF27932C
	for <asahi@lists.linux.dev>; Fri, 11 Apr 2025 02:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744337080; cv=none; b=qD7stFfldPq20iMkaqp8eHbncybqejDoNQY6BfHVXKspKhPhyOHI8HjuWDPnEsD89AYBe45Gi+gTxObGJVDqogZAwoyctkRiKSkyjs58rxY79T/yb59bdPyH6WIbxJhcNDL2pu4nopy4wpVvnrdq7rXMw7lId6yIfRJzOghnAxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744337080; c=relaxed/simple;
	bh=g9/x8XVo04TJwsErizKXE+KW7n7KBUBQb8/FWxPLymg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e1p+xnmbxj+LPrHhf9bZVvHVhFY4qa71TmImrSJ0d1EJj06R17bX3g3i4ldFkqwityV+Trx6wHZXVDjLlhT8FymstzzAebcV0uwgsCvfl5unGuc7Yc0V6kzG17dTSmo9VyXrktg1GQb39AmI+Aum6pg1u+KxXZc9iXVJoNCpH5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2963dc379so236665366b.2
        for <asahi@lists.linux.dev>; Thu, 10 Apr 2025 19:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744337076; x=1744941876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5z1I+Yl9dtmBZZ8N6P8UIj5dgbJQZua1H9d8D+bvII=;
        b=l0sdqnfp9phmEZUb6UYi4C6NzFGwiAwOs8fC/Ddo4UdovC+FD1OMpedCssIOzauOVq
         kLwZRQYRyro9vTmTLCBdQCp0cqbJTFsB/e0gRGc3Fg/QEuVuGXMWOD5/5v1lekJbLXrq
         BAbMRQEZyLpzbUst6CxvpTcie6DiHgsR8dyhVOZeVaVN61qu7d8ApawQ2L/DaGr7+Ale
         MTNL29AzV1kMfT6uVCi8ii7nqtS4EqhSxP6UlvzJSzQa8XqbEUa8Leyo90fOPheCls2h
         zJwU39o8wf0z1Wg4nRyS+Avb9ItKBAPQ4mWkg1+SihWxyoSX7TUhBLQJdMSl7s1vwAag
         DfVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl7st6q34OodneVK6YkQuj/V873p++vIesX/GbvGDT/apDUv6Vbm1nwAWL9dZXUcrHJ8djQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwdLO+NcofXU8s9Zwje6TxGdDMNO3Jss2JfKDWhCBOHaZFBiGQk
	5wx+YZNGn34BETP8O/gpnggupeiRDzumY1oeNK+eCA+3EQCMXhRAxycwqgA2xHs=
X-Gm-Gg: ASbGncvzwvhNNppNNb7WFShsjTKqiXq4o8WqaexYDrRvUi4PxNYqwy/8JewOQls6K6S
	zEyE8gmeIBrSfG1lOlYehOwCJe0s3EAfByd/9j9MkLtFNzvB+d4aLDLVaObXV2OqeX6PCV0vW3L
	t5XhMBwnt3mD8Fw74W7Ed9fJi1u1d0grwXL4fASm/qF6SsBAyNhocTd2O6qaoEPFr4VWTjCacK4
	2V9NcDeRlyxFOtCV98G2LFi1/powau4uExuc9J63o02NSiU/8EdCTF0XsmvcGGYwPnqzaWl6o/C
	BfjDzUKdHvNHDY9hK+1yd1CYO12K19Ax9HqqMll+lD/x48A/ZRzCvORBjaX8zuHogVxlTP8=
X-Google-Smtp-Source: AGHT+IHE/zOTpTF40oMKH9WgvvwVRwimEg9zBjSc835btRlKx8a9d5QQVp0Q9KWrUM8u0Z6U90dc/Q==
X-Received: by 2002:a17:907:3f8d:b0:ac7:970b:8ee5 with SMTP id a640c23a62f3a-acad34c45bfmr70342166b.27.1744337075705;
        Thu, 10 Apr 2025 19:04:35 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1c0227bsm361875466b.82.2025.04.10.19.04.34
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 19:04:34 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2963dc379so236662866b.2
        for <asahi@lists.linux.dev>; Thu, 10 Apr 2025 19:04:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWMstQjo8PQ8YiZKWd7zPAFsuaLMKDWeCp0pbbKPX393yFbverBZ5syKYb/VwSYJJ/FaEW9tQ==@lists.linux.dev
X-Received: by 2002:a17:907:7215:b0:ac7:805f:905a with SMTP id
 a640c23a62f3a-acad34c6e4fmr59887566b.28.1744337074794; Thu, 10 Apr 2025
 19:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
In-Reply-To: <20250409-spmi-v4-0-eb81ecfd1f64@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 10 Apr 2025 22:03:57 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9xarQK2jP=+7P_Ug5oM=HbBLsc-Sad_wp1tQkfSgXA=g@mail.gmail.com>
X-Gm-Features: ATxdqUFptu85Pq5XS2Y77lz4M0bInU8AWjExnkfiEk-bZJ-0RHCXCTLUmPDmg_M
Message-ID: <CAEg-Je9xarQK2jP=+7P_Ug5oM=HbBLsc-Sad_wp1tQkfSgXA=g@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Driver for the Apple SPMI controller
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Jean-Francois Bortolotti <jeff@borto.fr>, 
	Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 5:52=E2=80=AFPM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> Hi.
>
> This patch series adds support for the SPMI controller persent in most
> Apple SoCs. The drivers for the attached PMU and subdevices will be in
> further patch series.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v4:
> - Rebase on 6.14
> - Link to v3: https://lore.kernel.org/r/20250310-spmi-v3-0-92a82e7d9f0d@g=
mail.com
>
> Changes in v3:
> - Inlined helpers, dropped unneccesary error prefixes
> - Link to v2: https://lore.kernel.org/r/20250307-spmi-v2-0-eccdb06afb99@g=
mail.com
>
> Changes in v2:
> - Removed redundant error prints
> - Various style fixes
> - Better explanation of why the driver is needed
> - Link to v1: https://lore.kernel.org/r/20250305-spmi-v1-0-c98f561fa99f@g=
mail.com
>
> ---
> Jean-Francois Bortolotti (1):
>       spmi: add a spmi driver for Apple SoC
>
> Sasha Finkelstein (2):
>       dt-bindings: spmi: Add Apple SPMI controller
>       arm64: dts: apple: Add SPMI controller nodes
>
>  .../devicetree/bindings/spmi/apple,spmi.yaml       |  49 ++++++
>  MAINTAINERS                                        |   2 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   7 +
>  arch/arm64/boot/dts/apple/t8103.dtsi               |   8 +
>  arch/arm64/boot/dts/apple/t8112.dtsi               |   7 +
>  drivers/spmi/Kconfig                               |   8 +
>  drivers/spmi/Makefile                              |   1 +
>  drivers/spmi/spmi-apple-controller.c               | 168 +++++++++++++++=
++++++
>  8 files changed, 250 insertions(+)
> ---
> base-commit: a24588245776dafc227243a01bfbeb8a59bafba9
> change-id: 20250304-spmi-6d3c24b9027a
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
