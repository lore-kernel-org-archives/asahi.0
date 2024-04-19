Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102CC384
	for <asahi@lists.linux.dev>; Fri, 19 Apr 2024 00:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713486840; cv=none; b=eQ23kDqsEA7KM2JY/e1G5FZS2UDRlN6N5UkFpOw6dOw7rr1BUJO0L1YF5VSj5ByLCfLH97AALtOEnJNcMe9gVPBxMq442/3mrFMJxg6u8NMmA4giIpo9myT5fkLPnlU43vKpt0U+oF6UzqMgZv2yv8gOMwlLBSuI+wlD2kNbCOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713486840; c=relaxed/simple;
	bh=XlBorlfT8rw1i53kGYOpbDGKfhtdO+iNqgxQrm04vps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=botCgnEvCWV5Yc1FV8sRCRKyf7JjxhqyyP9HMocDsfgAsP6MqTV0RlO8NLwxRFJWJc1v+NOVfSr3cA2ZIcTx/N3cc+BbkC3XkpA6vqK96lfw+WK6Y8MvY2/5FAGdJmRhCWMjEMORfoaBJbFjkvjKUkBt+YqakKWeMc8AD8QRajs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso2413969a12.3
        for <asahi@lists.linux.dev>; Thu, 18 Apr 2024 17:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713486837; x=1714091637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhD14Fcqz09Aolmox4funyeAN+UtnsdTMtIVtk68AGk=;
        b=AWYqA7yaA1B11GTFyTakXsw0FtiGo39XrfttUIQ7U1Dbl3YYf7XPVGue44hANrXHiI
         cSfWGwVs2LDnTQe+ogQ4/RvyFEZ/bujh2lgKnO9ufJJyyKLRjmJRsqeL36I/7baisZgB
         POhdApa3xpk9MyYP6cZPMU1nYetC+o+SUrJlHtp6ULGiNfNHUZjUbokc2rbL1vkWBdEU
         JlR20g+rQ8h0QVRK17+pHvUhxudxziiRtWHjvtee11p8Duz+8g0Uc9wMx13FEr0qUzMv
         WcYh3DiektuFg1swC7TPMFPZwdMmWKi9MveK9OwbGUdC6VQC4ngcYIxr1zP0EeD4TwbJ
         8+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLe2DmXteFPOxhxM8506V7Pp6uQjcxVH1bIhKCP0BLJ5tHrKM3BDBEc/Svq7NRnY1MxZ+nRSdDD8ndcBLcP2yKmXAwzfw=
X-Gm-Message-State: AOJu0YyfbwbENl10D92rck/gO9Dk4vMw4thnxIqTWNgtBdRzKGTbfwNT
	9bRS8uP714BUU/I0sjMDWUyeDNawdj3lqNw/b9WEA2ayAtNTf/ezb2tfEzsOu4P69w==
X-Google-Smtp-Source: AGHT+IFv1DGRwlD0WF46Wh8jvli0HBAOyFTpFnEhOqNZTOt92u8PmYSkbaw0/F1kCE2a7AtTok9C+Q==
X-Received: by 2002:a50:9f6d:0:b0:570:5b3c:443 with SMTP id b100-20020a509f6d000000b005705b3c0443mr398996edf.7.1713486836770;
        Thu, 18 Apr 2024 17:33:56 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id ch15-20020a0564021bcf00b0056e34297cbasm1462566edb.80.2024.04.18.17.33.56
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 17:33:56 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a51addddbd4so142185366b.0
        for <asahi@lists.linux.dev>; Thu, 18 Apr 2024 17:33:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW9355gpn1aRSN+Gbxl7uBUOCGHNS3wf0m9DHkv24fmY0vtDdYn4wbAlzIIZ91dNGl42U5PqGZOAzRWl+s/2AA9rXA5l+E=
X-Received: by 2002:a17:907:980e:b0:a52:2d35:5e28 with SMTP id
 ji14-20020a170907980e00b00a522d355e28mr410282ejc.57.1713486836344; Thu, 18
 Apr 2024 17:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net> <20240418-apple_config-v2-4-7e5c6b9a9db3@jannau.net>
In-Reply-To: <20240418-apple_config-v2-4-7e5c6b9a9db3@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Thu, 18 Apr 2024 20:33:20 -0400
X-Gmail-Original-Message-ID: <CAEg-Je8q_nKO06X1uLLBmGzcHSRbiW6Th+KJdcv4QSQwVC_nNw@mail.gmail.com>
Message-ID: <CAEg-Je8q_nKO06X1uLLBmGzcHSRbiW6Th+KJdcv4QSQwVC_nNw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm: apple: Switch to standard boot
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
> Use standard boot instead of the distro boot scripts. Use
> BOOTSTD_FULL instead of BOOTSTD_DEFAULTS for easier interactive use.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  arch/arm/Kconfig        |  2 +-
>  include/configs/apple.h | 20 ++------------------
>  2 files changed, 3 insertions(+), 19 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 01d6556c42..9b83b2e6f8 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -1034,7 +1034,7 @@ config ARCH_APPLE
>         select USB
>         imply CMD_DM
>         imply CMD_GPT
> -       imply DISTRO_DEFAULTS
> +       imply BOOTSTD_FULL
>         imply OF_HAS_PRIOR_STAGE
>
>  config ARCH_OWL
> diff --git a/include/configs/apple.h b/include/configs/apple.h
> index a70440b3ad..1e08b11448 100644
> --- a/include/configs/apple.h
> +++ b/include/configs/apple.h
> @@ -9,26 +9,10 @@
>         "stdout=3Dvidconsole,serial\0" \
>         "stderr=3Dvidconsole,serial\0"
>
> -#if IS_ENABLED(CONFIG_CMD_NVME)
> -       #define BOOT_TARGET_NVME(func) func(NVME, nvme, 0)
> -#else
> -       #define BOOT_TARGET_NVME(func)
> -#endif
> -
> -#if IS_ENABLED(CONFIG_CMD_USB)
> -       #define BOOT_TARGET_USB(func) func(USB, usb, 0)
> -#else
> -       #define BOOT_TARGET_USB(func)
> -#endif
> -
> -#define BOOT_TARGET_DEVICES(func) \
> -       BOOT_TARGET_NVME(func) \
> -       BOOT_TARGET_USB(func)
> -
> -#include <config_distro_bootcmd.h>
> +#define BOOT_TARGETS   "nvme usb"
>
>  #define CFG_EXTRA_ENV_SETTINGS \
>         ENV_DEVICE_SETTINGS \
> -       BOOTENV
> +       "boot_targets=3D" BOOT_TARGETS "\0"
>
>  #endif
>
> --
> 2.44.0
>

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
