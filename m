Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D7765C
	for <asahi@lists.linux.dev>; Fri, 19 Apr 2024 00:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713486866; cv=none; b=fqDieIykhmd6pCV5Ms1oJBbsYvdgzovP43p9qxO9IFGheSyDGBfRhMaoTnrz76H0oQb2WvVltvjNX/+jbcUdIt/jDYJ+2ZvlzbXNdxT/IuMaN9uMIQ7rjsXKIOhSCh56raRlOryA0+j34Eb98zvbTvaLGnjv+CBbH0FIbOjk1Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713486866; c=relaxed/simple;
	bh=d6s++CfypUF36kb9gSyIy2WDe5GpudUFHCbhxbLnufM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FH39zEV8sLFk+mzyhHEHwtMJZoD0OUMBtko4RM/NeBKb7wotWwn4ZvPg7o7OsPQQspfAvr2YjUge6VFDK89HVDGUpJB0yYYz69nHv6AnWkiC7J3DsDnetlSFd4G5Wd5ZZNgfDfQD3c19y70AzTeNjxAqnpvPNoUK71QMh2UBG8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51abf1a9332so84397e87.3
        for <asahi@lists.linux.dev>; Thu, 18 Apr 2024 17:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713486863; x=1714091663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSYLD5SwzBaB5LC4mmFD62Vk9Hl4DW4hxIfMegLA96c=;
        b=n/xSB4SsLPHlQCiUvroFQoc8N+7w7JOOUx8uc7bMLMUc34goPiJSDdnfZsnyd/ds25
         HhbQ6Ba7wOd3aqzX8j78Rj9qHYBsMvrgmCb3SoHkbxZmdzopk09wrazPag5nJJBq7miC
         b5Ae9Lr47lQcc2MBXkL3N9iw9nQ3aS0xMyGQ5yLZNspEAsOAHrjDwgacrRN5sGiiyYp6
         hN3LUlWROrAgfxQJWub+7EMok4N4knbxR7vZCkCloEaIJQOSqRMNM1smDwcw2Lnv3qEo
         ZPYDZ8j8o7dMN4lgACxJ9znU7jWefUM+MBVogNfskTgRwTPThuBeBdilkOGFCGbxRbcX
         I7Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVWHxNfRlGVEQtfGUw5r0KoWHQbHrgTNvzvQauNjMx9OV4QxRu9E+JYNMr0A3UMhNrDO3PXObbv0sXtiNblg6xh/JC4j3A=
X-Gm-Message-State: AOJu0Yx5X1pnJMKoP2fMsqVN0s1oe6vqx3b6TVpKeOzElz7bC1lRF/3U
	aHtCP6lsSB+eBP6/dx1SZGDBJJiAjeUz63Ny7sqa1Ui4s57Jaul4j7JRv0JmxS2q5w==
X-Google-Smtp-Source: AGHT+IHRjk6/y+KFUyFQXAsoWefhSX7z50XF66dPVwlU0Hds+8Q9s2LLNBwc/VGPfioySUO6Hm8vCw==
X-Received: by 2002:a05:6512:3132:b0:519:27c3:1f8e with SMTP id p18-20020a056512313200b0051927c31f8emr297356lfd.4.1713486863109;
        Thu, 18 Apr 2024 17:34:23 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id b1-20020ac25e81000000b00516a1e2a6fcsm449459lfq.256.2024.04.18.17.34.22
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 17:34:22 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2da08b06e0dso17480441fa.2
        for <asahi@lists.linux.dev>; Thu, 18 Apr 2024 17:34:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7x7uqxHuKwCnZ41izkNyPBydlSUldCchAsteF9Xnoj7trq3SDDxks5jxX1RlKBX/JuNge2Z/ug3/uVbADfNJ0vNaU3gg=
X-Received: by 2002:a05:6512:3714:b0:519:231:e4b9 with SMTP id
 z20-20020a056512371400b005190231e4b9mr254768lfr.48.1713486862553; Thu, 18 Apr
 2024 17:34:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net> <20240418-apple_config-v2-5-7e5c6b9a9db3@jannau.net>
In-Reply-To: <20240418-apple_config-v2-5-7e5c6b9a9db3@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 18 Apr 2024 20:33:45 -0400
X-Gmail-Original-Message-ID: <CAEg-Je98=-j4zOhfy4L3smy5PKqRyaNMJX5H_6jKr0o2pDJqFQ@mail.gmail.com>
Message-ID: <CAEg-Je98=-j4zOhfy4L3smy5PKqRyaNMJX5H_6jKr0o2pDJqFQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] arm: apple: Do not list bootflows on boot
To: j@jannau.net
Cc: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>, 
	Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2024 at 3:00=E2=80=AFPM Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> From: Janne Grunau <j@jannau.net>
>
> The bootflow list is only seen briefly and is probably more confusing
> than helpful.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  configs/apple_m1_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/configs/apple_m1_defconfig b/configs/apple_m1_defconfig
> index c30aec7c55..4eac1a9e2d 100644
> --- a/configs/apple_m1_defconfig
> +++ b/configs/apple_m1_defconfig
> @@ -8,6 +8,7 @@ CONFIG_SYS_CBSIZE=3D256
>  CONFIG_SYS_PBSIZE=3D276
>  # CONFIG_DISPLAY_CPUINFO is not set
>  CONFIG_DISPLAY_BOARDINFO_LATE=3Dy
> +CONFIG_BOOTCOMMAND=3D"bootflow scan -b"
>  CONFIG_BOARD_LATE_INIT=3Dy
>  CONFIG_CMD_SELECT_FONT=3Dy
>  # CONFIG_NET is not set
>
> --
> 2.44.0
>

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
