Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A7E389
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so6157414a12.1
        for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 07:36:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698590209; x=1699195009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZQSmnqte/YS0gnA72GqEYQS6BYIWW/IXAm8JEmiPV4o=;
        b=T3QZ/Ij02UG+1BApBm0evbR9A9dDBfHUCrwg3yoTdNhzuHw6bxez+O4i7DAMazXN3Z
         PEusBshAlMeHweLBk4t3Av/FmsIH8Q3laHbSVMAOnP0rD2RrjsC+37JSgTq9on4AHFu/
         V49XtvPYafb10nZ4KD0+UZ9qiH3vdrhOrBDs5Y5lxaQgO8qc25Xa9AFihVT3mEYUU4RU
         tVWyRD3AB3zyDbtiLV6WvPa8NPXxiULvwowDW6RoRxvvSTlHkovXIv4EveUtpriDB85h
         jV2lf/BwUefOmizqAUXVmjy3BJr7UXT5RwpRuxrAcpDkcXhANUQOs4oygRA5Q0p/e1Lv
         UljA==
X-Gm-Message-State: AOJu0Yxty8Fjj6yKk4PhAIaTUpT4xtdiwPSYxnGvfn6Ox4GW1EPUbv3x
	khnZMx/SqlMWk5W46uwpCEVWK3JJf+x6TA==
X-Google-Smtp-Source: AGHT+IGLtutzXDcKM3MMqtGHRiXn/nVj9ZyLWgrHhzHhoyJ9Fi5Ci/Q0g4HppkZBFcPdaCGaUrvsSQ==
X-Received: by 2002:a17:907:7ba2:b0:9ae:82b4:e306 with SMTP id ne34-20020a1709077ba200b009ae82b4e306mr6611117ejc.62.1698590209013;
        Sun, 29 Oct 2023 07:36:49 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id s8-20020a1709066c8800b009ad7fc17b2asm4388692ejr.224.2023.10.29.07.36.48
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 07:36:48 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-9d242846194so110849666b.1
        for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 07:36:48 -0700 (PDT)
X-Received: by 2002:a17:906:dc8b:b0:9ae:52fb:2202 with SMTP id
 cs11-20020a170906dc8b00b009ae52fb2202mr7347961ejc.40.1698590208337; Sun, 29
 Oct 2023 07:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231029-usb-fixes-3-v1-0-0153210a7f55@marcan.st>
In-Reply-To: <20231029-usb-fixes-3-v1-0-0153210a7f55@marcan.st>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 29 Oct 2023 10:36:11 -0400
X-Gmail-Original-Message-ID: <CAEg-Je81t+Ty8sQVOomETNti=htz=gj4Lr1jQb0ucoNDXoqkPw@mail.gmail.com>
Message-ID: <CAEg-Je81t+Ty8sQVOomETNti=htz=gj4Lr1jQb0ucoNDXoqkPw@mail.gmail.com>
Subject: Re: [PATCH 0/4] USB fixes: Mass Storage bugs & 64bit support
To: Hector Martin <marcan@marcan.st>
Cc: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
	Mark Kettenis <kettenis@openbsd.org>, u-boot@lists.denx.de, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 29, 2023 at 3:23=E2=80=AFAM Hector Martin <marcan@marcan.st> wr=
ote:
>
> This series fixes some bugs in the USBMS driver and adds 64-bit LBA
> support. This is required to make USB HDDs >=3D4TB work.
>
> Note that the increased timeout won't actually work right now, due to
> broken handling in the underlying USB infrastructure. That will be fixed
> in a follow-up series, which depends on [1] being applied first. The
> USBMS part is logically stand-alone and can be applied in parallel
> before that.
>
> [1] https://lore.kernel.org/u-boot/20231029-usb-fixes-1-v2-0-623533f6316e=
@marcan.st/
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
> Hector Martin (4):
>       scsi: Fix a bunch of SCSI definitions.
>       usb: storage: Increase read/write timeout
>       usb: storage: Use the correct CBW lengths
>       usb: storage: Implement 64-bit LBA support
>
>  common/usb_storage.c | 164 ++++++++++++++++++++++++++++++++++++++++++---=
------
>  drivers/ata/ahci.c   |   9 ++-
>  drivers/scsi/scsi.c  |   4 +-
>  include/scsi.h       |   8 ++-
>  4 files changed, 150 insertions(+), 35 deletions(-)
> ---
> base-commit: 8ad1c9c26f7740806a162818b790d4a72f515b7e
> change-id: 20231029-usb-fixes-3-c72f829ba61b

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
