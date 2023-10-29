Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACCE389
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 14:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso5619651a12.1
        for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 07:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698590400; x=1699195200;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9yBNk5oGsfX6qpST/nmf4obxEIq1XqbX30WaF8PcVPo=;
        b=SwKcjrmcBOKm1teXebz65qlqwF4NHUafGCeBYzMj4VtnaJ1j6tvdV7eB62QVCTjjT3
         iMWf5fvIUfRKse8vJlIYo6Q1DtBmjJw1vAi5TAXSCLzF5cjhStcMkkiWnScIVlflt2b0
         Nzn1J0pnLV9OjWuyKhIQyj/dRxFFaacVzbBqUM3Xx1vg6S0mD8A3GdtCQM4rpMijqAnu
         +R9Tmgru4DCyeowpRni/Nkj3+00GVMTIGec3CqyBHw3RK9tkYgjcI9eljbSt5bxsN1Sm
         BAP8rCilirplCpgpPUjf3kZEE38WX7qmYPaCAvaMvUYpCbn3eLIeAl/OQvcZXS1fA++/
         u1cQ==
X-Gm-Message-State: AOJu0YxmeS6iD/iQctH7c2+TZZ0dU2SV5r8lWeEYMikC2Jd7vUtqtxww
	R2E85300tAdBJFk7D1kdTb4b6i2i3Sq+HA==
X-Google-Smtp-Source: AGHT+IFrXodGZyynl2H01kv9WLUO5LPIHWFvzgVK3eRLHnLp6tmtzgElqrkiYykLoqRFAh7BuwuKiA==
X-Received: by 2002:aa7:dad9:0:b0:53e:fa55:8e0e with SMTP id x25-20020aa7dad9000000b0053efa558e0emr6441168eds.24.1698590399979;
        Sun, 29 Oct 2023 07:39:59 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id w17-20020a056402071100b0053ecef8786asm4505803edx.75.2023.10.29.07.39.59
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 07:39:59 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9c603e235d1so583333166b.3
        for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 07:39:59 -0700 (PDT)
X-Received: by 2002:a17:907:d385:b0:9d2:20ee:b1c7 with SMTP id
 vh5-20020a170907d38500b009d220eeb1c7mr3005377ejc.45.1698590399726; Sun, 29
 Oct 2023 07:39:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231029-usb-fixes-5-v1-0-54bb13001f54@marcan.st>
In-Reply-To: <20231029-usb-fixes-5-v1-0-54bb13001f54@marcan.st>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 29 Oct 2023 10:39:23 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-g+WP84Deqzg+h752xMefKLxSsUYoA7WUVBg+tmDw=mg@mail.gmail.com>
Message-ID: <CAEg-Je-g+WP84Deqzg+h752xMefKLxSsUYoA7WUVBg+tmDw=mg@mail.gmail.com>
Subject: Re: [PATCH 0/2] USB fixes: (Re)implement timeouts
To: Hector Martin <marcan@marcan.st>
Cc: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
	Mark Kettenis <kettenis@openbsd.org>, u-boot@lists.denx.de, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 29, 2023 at 3:36=E2=80=AFAM Hector Martin <marcan@marcan.st> wr=
ote:
>
> A long time ago, the USB code was interrupt-driven and used top-level
> timeout handling. This has long been obsolete, and that code is just
> broken dead cruft. HC drivers instead hardcode timeouts today.
>
> We need to be able to specify timeouts explicitly to handle cases like
> USB hard disks spinning up, without having ridiculously long timeouts
> across the board (which would cause endless waiting when things go
> wrong anywhere else). So, it's time to rip out the old broken nonsense
> and actually pass through timeouts to USB host controller drivers, so
> they can be implemented properly.
>
> This series adds the necessary top-level scaffolding for control/bulk
> timeouts, and implements them in xHCI. I didn't bother with interrupt
> transfers, since I figure those probably never need long timeouts
> anyway.
>
> The platform I deal with only has xHCI, so I'll leave implementing this
> for EHCI/OHCI to someone else if anyone cares :)
>
> This series needs to be applied after [1], since the xHCI changes depend
> on changes made there.
>
> [1] https://lore.kernel.org/u-boot/20231029-usb-fixes-1-v2-0-623533f6316e=
@marcan.st/
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
> Hector Martin (2):
>       usb: Pass through timeout to drivers
>       usb: xhci: Hook up timeouts
>
>  common/usb.c                    | 21 ++-------------------
>  drivers/usb/host/ehci-hcd.c     |  5 +++--
>  drivers/usb/host/ohci-hcd.c     |  5 +++--
>  drivers/usb/host/r8a66597-hcd.c |  5 +++--
>  drivers/usb/host/usb-sandbox.c  |  6 ++++--
>  drivers/usb/host/usb-uclass.c   |  9 +++++----
>  drivers/usb/host/xhci-ring.c    | 32 ++++++++++++++++++++------------
>  drivers/usb/host/xhci.c         | 28 ++++++++++++++++------------
>  include/usb.h                   | 10 ++++++----
>  include/usb/xhci.h              | 14 ++++++++++----
>  10 files changed, 72 insertions(+), 63 deletions(-)
> ---
> base-commit: 3d5d748e4d66b98109669c05d0c473fe67795801
> change-id: 20231029-usb-fixes-5-ca87bbedb40c
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
