Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01CC156230
	for <asahi@lists.linux.dev>; Sun,  9 Feb 2025 11:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739099332; cv=none; b=ERrxt6XT0ci6E8aJMeXMOejl03x5D1rSCPRyIak6XsRySIprpvFVoswa9pIv0xSvrMxyJKPwuGfuIRBGYqfhOIZ9fNjOU0qC48t2aB7PVcYHOPTq9Y5K29wH0DItCZkSyOLZjm1zzHp5zBmzZpHH2KUZp5EpLs5eAI4yhcTHpDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739099332; c=relaxed/simple;
	bh=g6Z5E/J7Lu/e4cN4IuJx4avEmz/Rrp3PpRqkyElWLnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c7XRCuzUrpBHwfKyVlkUWEiwyp874cJdFb6lplKm6fQOvpznNUapkLzJGv/F9HCGWP3eD07AvrWx3pnGvsjXXfpfzaIArpUnCIfWAA0ZDhMWCk/Ty28hTN78pXYx2W7FdnMIK0b3CNSOSvgWFlfDSPAC6Sh/L4rmZhrAqmXvhk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5de64873d18so1312913a12.2
        for <asahi@lists.linux.dev>; Sun, 09 Feb 2025 03:08:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739099329; x=1739704129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EZtSlMlkn5zHaXo0WZfyndZctK7R7et8V22vFKv8IdM=;
        b=cejmIbN1pEEIwH49B08k+QJ5VezoDIVhHtyKUIO9Po4t7WnO3nUcQDkmu6APJ0k9/z
         5J5yLo/alZdQx/firfsQnq5mvAZQ2/q/QOXvnYTNHeZouizXEQzTD9RfVjCK8V8o8iPC
         FKzqgS+tlXlfqc5mdN3sOg86k8rYIVeDsf2R5Wi3eLJtyV4K1sIv/+VFu+fne6yaDja0
         wMzjzjrJeDIo0BJv6zPlwIZpxhbuIRBsg0FzE7Nimbbj30kGg/EXxdNdZIh0+seRrhcg
         JlbOg/peCAgIBFC7MKysNTAwiSAUhQruKyRTTrk+Zur/aWoKkmkQzzAMOR7zSD4XA4cw
         R3IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfW1l50Dg3yLzFsYa09YbGjozDFte5LLEWBL9dV7/6zhLS0AvjTw2SPfQkRKU0owlotXSk7g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0ujFTFz15Bgp+OA4w38Bv1jn8WlWO9Bc0i+fItnefH4YgsNkI
	9Bvqiy4jTM1xst1uA7CKaQzYC8V2/YCLpyWutYoTbivYM0AGPE1THoxB3KKvXc4=
X-Gm-Gg: ASbGnctHEuymuPCyTk8km0dkDzsnzV0nAx34iPv/eD37TXDRMrW9pn3/9aaSCOnGtRY
	CnLqDKZRKmRZlJv80f7DAOkzoYmYkUMnTZh47O2Mpn8nQdtXAOYfK3d1nxJMnXG44e/qysaW02n
	O5lswyJHVhoYNmevdGs/dDj7vnl2ouZkBjMJAhgDV1VfPqPT4kHuPoJQj39yD2aayvS76YQoP8I
	2/m7tMUcX0TdSxZAGqPAHu/WrB5rcx2L2IbqZEgh/zsqtZ8NhGvtnxLceADhFCVJN34enzN6RaQ
	BpcPdhm3lc00GbrUeFlZKDE2usDT/V+Fg9rxEkdX6gQfiA==
X-Google-Smtp-Source: AGHT+IHxzyqVa6MclbU8cV+FG3X72AuSn/8YMMpRPLKOTQGovIYa/bm3AUQaO7EzCN3Jq1jWskvjCQ==
X-Received: by 2002:a17:907:1c23:b0:aa6:9198:75a6 with SMTP id a640c23a62f3a-ab789ae237fmr901547566b.21.1739099328730;
        Sun, 09 Feb 2025 03:08:48 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab79668f32esm389881866b.176.2025.02.09.03.08.48
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 03:08:48 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab795ebaa02so293435366b.1
        for <asahi@lists.linux.dev>; Sun, 09 Feb 2025 03:08:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUYEUpnzXh6xPSIetPLSQdy3Vg7b0iOFil5WycbHykYw9LapmQmcYxXkJ52u9pCWKrBLQunXw==@lists.linux.dev
X-Received: by 2002:a05:6402:4608:b0:5de:42f5:817b with SMTP id
 4fb4d7f45d1cf-5de450b1c5dmr9937857a12.31.1739098947851; Sun, 09 Feb 2025
 03:02:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
In-Reply-To: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 9 Feb 2025 06:01:51 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_1Qe_q0Vt1ReX0HG83gNP3Ph37E+d_prDiMXSWtum5vQ@mail.gmail.com>
X-Gm-Features: AWEUYZlNJz2VbuDrDkNmceAgZ0ETGFMAFQeCJbSKwBdyoI2QQNmlLF0UVoGPB5w
Message-ID: <CAEg-Je_1Qe_q0Vt1ReX0HG83gNP3Ph37E+d_prDiMXSWtum5vQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Driver for pre-DCP apple display controller.
To: fnkl.kernel@gmail.com
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, Janne Grunau <j@jannau.net>, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 9:02=E2=80=AFAM Sasha Finkelstein via B4 Relay
<devnull+fnkl.kernel.gmail.com@kernel.org> wrote:
>
> Hi.
>
> This patch series adds support for a secondary display controller
> present on Apple M1/M2 chips and used to drive the display of the
> "touchbar" touch panel present on those.
>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> ---
> Changes in v6:
> - Use the drm_connector_helper_get_modes_fixed helper.
> - Split out into a separate MAINTAINERS entry
> - Link to v5: https://lore.kernel.org/r/20250205-adpdrm-v5-0-4e4ec979bbf2=
@gmail.com
>
> Changes in v5:
> - Moved to using the component framework.
> - Other lifetime fixes
> - Link to v4: https://lore.kernel.org/r/20250114-adpdrm-v4-0-e9b5260a39f1=
@gmail.com
>
> Changes in v4:
> - Fixed dt bindings.
> - Link to v3: https://lore.kernel.org/r/20250112-adpdrm-v3-0-c674dc19fa7f=
@gmail.com
>
> Changes in v3:
> - Fixed building as module after splitting out mipi block
> - Addressing the review feedback.
> - Link to v2: https://lore.kernel.org/r/20241126-adpdrm-v2-0-c90485336c09=
@gmail.com
>
> Changes in v2:
> - Addressing the review feedback.
> - Split out the mipi part of the display controller into a separate devic=
e
> - Link to v1: https://lore.kernel.org/r/20241124-adpdrm-v1-0-3191d8e6e49a=
@gmail.com
>
> ---
> Sasha Finkelstein (5):
>       dt-bindings: display: Add Apple pre-DCP display controller
>       drm: adp: Add Apple Display Pipe driver
>       drm: panel: Add a panel driver for the Summit display
>       arm64: dts: apple: Add touchbar screen nodes
>       MAINTAINERS: Add entries for touchbar display driver
>
>  .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
>  .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
>  .../bindings/display/panel/apple,summit.yaml       |  58 ++
>  MAINTAINERS                                        |  16 +
>  arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
>  arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
>  arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
>  arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
>  drivers/gpu/drm/Kconfig                            |   2 +
>  drivers/gpu/drm/Makefile                           |   1 +
>  drivers/gpu/drm/adp/Kconfig                        |  17 +
>  drivers/gpu/drm/adp/Makefile                       |   5 +
>  drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
>  drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++=
++++++
>  drivers/gpu/drm/panel/Kconfig                      |   9 +
>  drivers/gpu/drm/panel/Makefile                     |   1 +
>  drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
>  17 files changed, 1489 insertions(+)
> ---
> base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
> change-id: 20241124-adpdrm-25fce3dd8a71
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
