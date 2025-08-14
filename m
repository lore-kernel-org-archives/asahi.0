Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DFE2FC87A
	for <asahi@lists.linux.dev>; Thu, 14 Aug 2025 13:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755176840; cv=none; b=pxxyk+xYLmNsxgqZushVsuJK8uwBA9LE2rWb49qZAnUF1WDvNcapsqje1UPhv1knqLMlwCZGQk0R/5kE8ExUwH24yTvRHR5etXJhEiMtVnxeQCSnbEq1cQjjk+5SQ5ifjHYBzyTUi3faYV3RrCuf82V1SlgA8E2fqLE/yFYvcI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755176840; c=relaxed/simple;
	bh=PKcSZQ4ipFczTaWb2tQTT3R0z5gejcAuUKoB9Ktsqcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RtRO8kkDy7Jpjd5fks1AzTOb47tVEk4tH2iVG70UfWyh3qMN4Jb4hLSVduG+A8wZDqd4mVq7/0Vp7wJtonBZtOcaqbrU1KK0zhqAf3EHZvXySM52NLNVogG634gqxVtB8mth3gTgabInL211vSnV4IwI8qSrF9z5WQzlaqdn6a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6188945f471so1993992a12.0
        for <asahi@lists.linux.dev>; Thu, 14 Aug 2025 06:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755176835; x=1755781635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFUrylcigol2hllrcza769/tLyOk1d4CmbqHA8zoLyw=;
        b=DY0PKPMj1Du+ay8I6/hhMkFSB1tzgQGR0nTSGrflgkAEeNG2q2/zXxDjkdVnyVMNDQ
         eKUR7NM1Al5ff5jb8iUju785C9o9g/mPkQO1jDp3SRSd0O0go+vOm7QuuTO8kkS2YU1p
         sxOmM8fXJbhd7s50sxsi0SW04im1V5ShBw8+kD4tdepenRgX53X+hZgsfhI/uTK16x7a
         IDoUx/bL9xC4sK7SKKC2scuQ+GwTHTD6vsyo+ze9OkmDbkukLeg9zyiBOnkMaL/94XKc
         fXz8nMyaYkeiUDpVYe8H6fIxcKYyxE7JDOI7kQiZQm33bchMMGhAej9TjdtFUmyCgZSP
         KyGw==
X-Forwarded-Encrypted: i=1; AJvYcCWd33eAjfJ1EHTD5cchuENlxBueNtuSCuOl5r7iwIbOBGl3KWpaef+vJrV+3pOZKsRLU/rPXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaltgJ/QG5S2Uk/RSjaJ3sNb9xJyXUmNX70A+jsKemNJLmYptQ
	VsZZ64djYFxaTXmtDbiH/BUDaZdEs8jakSljhQYV0rPZJ2AiVEq5ionQ1uft0cGMRm4=
X-Gm-Gg: ASbGncsJJjcnEJc2YJBc61I1+Z8DwFud1ZMsFw83HqXdWPs4NJ8q0i8uxbumKcbHGex
	+RD+z74NlNphCvm4m1YVPpFKE+f6tskc13eUfck75xHhuQfNTaKnefvdxA88I5Ev3MCwLmYR7t6
	48bt8qQ4YGBSq37QwCaBMcV/RaJeHoXBiXGS6D/F/srThvWBUx/BMmo01rVkdZ/OBEy9cnFV42w
	eKOPrBzSmgnezPFcx6l0aUOE7D/6QFjDIGN50FWeSVUvvjwVQXOlhL9Q/lzNXapS14aMzWSA0sn
	ExEya4LSOVf7r9xJvhGcYHcIO2GIbsmvhXff27b55P6RdiJa5r07VdWcpptDH+gODZsK6WvKIdq
	29698lurL5HuBMldY31s+a6kcvW/fiarUnJN6MAd9D9gtVpeA8hW3
X-Google-Smtp-Source: AGHT+IGFysG613W9tRn3gPiV4kt81OctPppG0BDvKz/bHfpJJMj61Cp5GIbdItGXNx1+M4i8apnV/Q==
X-Received: by 2002:a05:6402:26c7:b0:618:2533:f735 with SMTP id 4fb4d7f45d1cf-618920c8198mr2326250a12.7.1755176834688;
        Thu, 14 Aug 2025 06:07:14 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f26cc6sm24065602a12.23.2025.08.14.06.07.14
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Aug 2025 06:07:14 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-618896b3ff9so1974939a12.1
        for <asahi@lists.linux.dev>; Thu, 14 Aug 2025 06:07:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWn+6U4+IB6SZ7q5ATst2aSk0zAFrdOzcQwOzoWZm72k8c6NAoLZHezFB5I92WmLIrrLDdq5g==@lists.linux.dev
X-Received: by 2002:a05:6402:5206:b0:618:3521:6842 with SMTP id
 4fb4d7f45d1cf-618921e9bfcmr2202592a12.16.1755176833833; Thu, 14 Aug 2025
 06:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
In-Reply-To: <20250812-wip-smc-rtc-v1-0-66a8e96dad60@kernel.org>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 14 Aug 2025 06:06:35 -0700
X-Gmail-Original-Message-ID: <CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com>
X-Gm-Features: Ac12FXzLclnfzNMdgfWr5WLv-lJF3C441CLYE6NCa_SPc5-EdJWTW2hkFqFeYNQ
Message-ID: <CAEg-Je84XxLWH7vznQmPRfjf6GxWOu75ZetwN7AdseAwfMLLrQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Apple Silicon SMC RTC driver
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 11:25=E2=80=AFAM Sven Peter <sven@kernel.org> wrote=
:
>
> Hi,
>
> Now that the core mfd device has been upstream I've prepared one of the
> child drivers that is still missing: RTC support.
> This driver is required to read and set the hardware clock and requires
> a reference to an additional NVMEM cell to store the offset and thus
> requires a device tree node.
>
> The series applies cleanly to 6.17-rc1 but is based on a tree with three
> additional commits to add the SMC nodes to the DTS which didn't make it
> into 6.17. You can just ignore that and pretend this is based on
> 6.17-rc1 since I'll take the dts update through my tree anyway.
>
> Next to this SMC child driver we're still working on an input/misc HID
> driver for the powerbutton, a hwmon driver for the various sensors and a
> power-supply driver to manage the batteries.
>
> Best,
>
> Sven
>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
> Hector Martin (1):
>       rtc: Add new rtc-macsmc driver for Apple Silicon Macs
>
> Sven Peter (2):
>       dt-bindings: rtc: Add Apple SMC RTC
>       arm64: dts: apple: t8103,t600x,t8112: Add SMC RTC node
>
>  .../devicetree/bindings/mfd/apple,smc.yaml         |   9 ++
>  .../devicetree/bindings/rtc/apple,smc-rtc.yaml     |  35 +++++
>  MAINTAINERS                                        |   2 +
>  arch/arm64/boot/dts/apple/t600x-die0.dtsi          |   6 +
>  arch/arm64/boot/dts/apple/t8103.dtsi               |   6 +
>  arch/arm64/boot/dts/apple/t8112.dtsi               |   6 +
>  drivers/mfd/macsmc.c                               |   1 +
>  drivers/rtc/Kconfig                                |  11 ++
>  drivers/rtc/Makefile                               |   1 +
>  drivers/rtc/rtc-macsmc.c                           | 141 +++++++++++++++=
++++++
>  10 files changed, 218 insertions(+)
> ---
> base-commit: 772c260c9c7f916c9a2508839df4f03fc19f3773
> change-id: 20250812-wip-smc-rtc-e856b6f24603
>

Series looks good to me, thanks for submitting them!

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
