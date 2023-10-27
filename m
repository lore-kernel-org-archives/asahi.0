Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5B23716D
	for <asahi@lists.linux.dev>; Fri, 27 Oct 2023 18:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2c5b7764016so17559871fa.1
        for <asahi@lists.linux.dev>; Fri, 27 Oct 2023 11:59:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698433159; x=1699037959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slTU4mDtqByVYMShnYphjovLZd8SOqKqLDwGE2v9O7Q=;
        b=vvTHk6MrcVdvCMUtHQrO9U30CbC0KkUDVHqTkMkR7S/eSTzcXrbJA7nS6R33CGV3TZ
         /hjjA6KyoYocQSHyANgOtnbNeHoKxKgaayj9Xa1j/OutkJp8aD4J/nBFIfaNtAIzZk96
         /st87Mzt9+rDDVqf1W1zbmZPfz7gZw7LseYOIj31BcdzBaWoMMWqEk8F3563/HSCfhxg
         Hv6hO5dgnmE9ePFepAgstVU0hTj2lhaUTAlbRZPO9MJC2oCQVDzO4BN9NQHwlIPhsBQc
         aso3RXIQ1mSxLh1GK5sw/WFGBSCEZjdr87VphJJJJr3lGmFXHpn1PZvJ7dwOSoMRelKC
         MPMA==
X-Gm-Message-State: AOJu0YzT17sxiswesk7zn368FC1nUKKS6m064ND004bsiZW99eHgAiv8
	WT78A9ZXITKZUDUNOk6jZuthTe/f8ELfjEH7MfI=
X-Google-Smtp-Source: AGHT+IFk6r54qndFs/9EI9AP5VoY1ixfsZSUDx1m69fGPsd8rc3Utf5rUiDKDDpGHpFstmq8JSunHw==
X-Received: by 2002:a2e:5012:0:b0:2c5:16d0:69ab with SMTP id e18-20020a2e5012000000b002c516d069abmr2783527ljb.44.1698433158919;
        Fri, 27 Oct 2023 11:59:18 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id y18-20020a2ebb92000000b002b9f4841913sm390749lje.1.2023.10.27.11.59.18
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 11:59:18 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-507c5249d55so3580700e87.3
        for <asahi@lists.linux.dev>; Fri, 27 Oct 2023 11:59:18 -0700 (PDT)
X-Received: by 2002:ac2:4d81:0:b0:503:388f:30a3 with SMTP id
 g1-20020ac24d81000000b00503388f30a3mr2539613lfe.26.1698433158499; Fri, 27 Oct
 2023 11:59:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231027-usb-fixes-1-v1-0-1c879bbcd928@marcan.st>
In-Reply-To: <20231027-usb-fixes-1-v1-0-1c879bbcd928@marcan.st>
From: Neal Gompa <neal@gompa.dev>
Date: Fri, 27 Oct 2023 14:58:41 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-o+xSG-Yxtqt=+HAZds_HO62dtkAZ64kon_a6xG5SaOA@mail.gmail.com>
Message-ID: <CAEg-Je-o+xSG-Yxtqt=+HAZds_HO62dtkAZ64kon_a6xG5SaOA@mail.gmail.com>
Subject: Re: [PATCH 0/8] USB fixes: xHCI error handling
To: Hector Martin <marcan@marcan.st>
Cc: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
	Mark Kettenis <kettenis@openbsd.org>, u-boot@lists.denx.de, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 26, 2023 at 7:26=E2=80=AFPM Hector Martin <marcan@marcan.st> wr=
ote:
>
> This series is the first of a few bundles of USB fixes we have been
> carrying downstream on the Asahi U-Boot branch for a few months.
>
> Most importantly, this related set of patches makes xHCI error/stall
> recovery more robust (or work at all in some cases). There are also a
> couple patches fixing other xHCI bugs and adding better debug logs.
>
> I believe this should fix this Fedora bug too:
>
> https://bugzilla.redhat.com/show_bug.cgi?id=3D2244305
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
> Hector Martin (8):
>       usb: xhci: Guard all calls to xhci_wait_for_event
>       usb: xhci: Better error handling in abort_td()
>       usb: xhci: Allow context state errors when halting an endpoint
>       usb: xhci: Recover from halted non-control endpoints
>       usb: xhci: Fail on attempt to queue TRBs to a halted endpoint
>       usb: xhci: Do not panic on event timeouts
>       usb: xhci: Fix DMA address calculation in queue_trb
>       usb: xhci: Add more debugging
>
>  drivers/usb/host/xhci-ring.c | 100 +++++++++++++++++++++++++++++++++++--=
------
>  drivers/usb/host/xhci.c      |   9 ++++
>  include/usb/xhci.h           |   2 +
>  3 files changed, 92 insertions(+), 19 deletions(-)
> ---
> base-commit: fb428b61819444b9337075f49c72f326f5d12085
> change-id: 20231027-usb-fixes-1-83bfc7013012
>

The series looks reasonable and has worked quite well in Fedora Asahi.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
