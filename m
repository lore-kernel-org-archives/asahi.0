Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C174B274FC2
	for <asahi@lists.linux.dev>; Wed, 18 Jun 2025 12:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750251429; cv=none; b=kV0z2TtmnpxnDQxUAEs76pB/4BMwHpzKn1yCtsQMyro4n/0Dyg6LK5tvWW6MxQ0EBullop0pSCXuoCK82TCWoNpV5t+Djn+XtHzXCzDGjva6ZRmx3T1fwOkDlj/FC0QYuSXSrZZyEPOpx+VK4r2ubd9lgH4lqtV/cwjnmXNALiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750251429; c=relaxed/simple;
	bh=chU3ZzgX8ixQ80XuNsDpy9w595hkOFK6g+6/L8GwJwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JJ/FoaeaEdgrqAV4+vU5mV76D4fB79D05Fe90z81zJXnSjIeUG6oQc07ucFsqIKwU/om0dfTeOz0vqkoR8FD0zCKOyvadFI0gXZAPF7oFSRQOeEcDwuBIXKFR3GjH3rJZLQ4CbC4AoXXY8iBtw8gjeKsxNNUzK2OZNrcm/BK2m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EGxY8U7w; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EGxY8U7w"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso6013083276.0
        for <asahi@lists.linux.dev>; Wed, 18 Jun 2025 05:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750251427; x=1750856227; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2X2h53UoNZQhDXBsMhRcUUHtA/t5wbotkmy7UVTkX7E=;
        b=EGxY8U7wZfBIEWPBrsFsKtlxprnyoPK2ixvlZbN9wp/wSYmczbiKIGjwNXBSAMYe9H
         SSS6wOn432GzI/SOm1gC4JmHGUVdMcruB5PKDOP+n8uBLqMbNT9VcsHw1QWfd5cPgbSf
         Zt6ym8PHGoXoby9nlC8vXF4j/GX27KTl7JllSHyNqpNXz8xfp9g7ctHhXWWV4zIXVMx/
         9h2cpVJLTfqDNNbRQ3CZNiSOCRCF7CMgUF5l9vl0OsoV8rXLlUdRpW7FTvHkGdg4ZlZh
         i9HnF59jaUhbVcgwb8fbRP7vRZT/FuwDay88IvVgvkOdRC5wAoUhBF9fjYngSLWCF7ne
         pc/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251427; x=1750856227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2X2h53UoNZQhDXBsMhRcUUHtA/t5wbotkmy7UVTkX7E=;
        b=US4j9gRxxIZg0VUZ5prp0XxxgA9a0+68Qyfy4Yoo9iclQawzmrNokEdIY4qak77hvZ
         dRHAYQrUJDOeW5kZEK1GNQw/69FWT47ONgdmFWAiVdj68fVhZAwijTxYyMne6qEIA3kQ
         gtLyMLVDTx7odOpAdmiMZfSZUR2iwhr3iYWLYV2QjTlHFHqRFUMLYB981toCqUoyTkwL
         ei5hOO3WcowSYZkcdyHNqXGpgffWf7gDQTQkY+tgy0w0XEvCiODwrzTHpX/SwIfIR5V3
         /6gSJv0Z6AsInD9JDRrD+k+l/3aPfHhR6vz2P2mkN+P0G6BpFJl9VyeQlVrY7w8Mw2A6
         LLnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUR2WiK9KcYpod0INRdNHq6dkZqZiR+Mmu4NJCX97kY2xVCmd9CtoLASnRvS7Z+GSHmswC6zw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyM1W57wepxAAtFJpTCVRoWzKh7V/7M3y/eV1toWOOHPW6oq/YS
	84CMXTuDWFQkgRa5/G7Pw/pBjPiO8LPxjFsNxFkHBa8SBPs7/Lnnzq4z9IWMqT2hFQ6VB9OPmKY
	CNmXKQkhl4tRWpyprZkcLolh66D6B3O+UJ3O8E+y3IA==
X-Gm-Gg: ASbGnctbxhOInLMwns8kD2dTBCbtxaHagvWA3jb0P+bHzfDzi/Zi+J6LFCAYsgMMwdW
	n95rTPsRjIfiY1PFvWrgza8g8fs9nbMfpSD3LF1/BaRQgSTBcw1C/N+uwyPlaQ5ds0Ttxo0w+VW
	HqrMvbKuLfKoSnsL87yWVxwhg5DrwH6SBxHFjkh0TWYcw=
X-Google-Smtp-Source: AGHT+IEZlf2SkQ6pDtcOhhdvV3LmUw3iR0H22QpguHg1V4liWBddtmQy97+4HMMAxIbIevgaVnIrB0SHGsEYRyBVYzQ=
X-Received: by 2002:a05:6902:6303:b0:e82:2b85:ea3a with SMTP id
 3f1490d57ef6-e822b85ee43mr16723424276.32.1750251426746; Wed, 18 Jun 2025
 05:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org> <20250612-apple-kconfig-defconfig-v1-1-0e6f9cb512c1@kernel.org>
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-1-0e6f9cb512c1@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 18 Jun 2025 14:56:30 +0200
X-Gm-Features: AX0GCFsnEI_9cu3U9fY7I_D0EnrNerJPcmhYfg39LAqv66uN774UfRLbAU6VCkM
Message-ID: <CAPDyKFrQ3Uj+coa0WCG00_pyaxu-yEnH26qmS6tevZ_772oZVg@mail.gmail.com>
Subject: Re: [PATCH 01/11] pmdomain: apple: Drop default ARCH_APPLE in Kconfig
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, iommu@lists.linux.dev, linux-input@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Jun 2025 at 23:12, Sven Peter <sven@kernel.org> wrote:
>
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
>
> Signed-off-by: Sven Peter <sven@kernel.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/apple/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/pmdomain/apple/Kconfig b/drivers/pmdomain/apple/Kconfig
> index 12237cbcfaa983083367bad70b1b54ded9ac9824..a8973f8057fba74cd3e8c7d15cd2972081c6697d 100644
> --- a/drivers/pmdomain/apple/Kconfig
> +++ b/drivers/pmdomain/apple/Kconfig
> @@ -9,7 +9,6 @@ config APPLE_PMGR_PWRSTATE
>         select MFD_SYSCON
>         select PM_GENERIC_DOMAINS
>         select RESET_CONTROLLER
> -       default ARCH_APPLE
>         help
>           The PMGR block in Apple SoCs provides high-level power state
>           controls for SoC devices. This driver manages them through the
>
> --
> 2.34.1
>
>
