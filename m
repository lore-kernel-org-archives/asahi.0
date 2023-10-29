Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392FAA49
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 14:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9936b3d0286so556484966b.0
        for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 07:35:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698590115; x=1699194915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGArOgtP/Y8NOacje0SY8hTCe26rkg0NhPpNm2lneSo=;
        b=P8M8ruQG/Qqnv0+xcmpW8j8Agy7FVLwHZ3ryb9G+y8s0dlLPdqHpkvNOIUg1dCQQCu
         jUfJvBWK9NcQUzd2q1EYrNp+2MqI4AE+Hf5faxVi212t3H+tNa0O9igyHiBoDmX84rbm
         B1dol62TRlm5lBpMf4rZVpJ4QrTDS2MseWgALe7wbcKFGourR7PkP0GWmAqr78c0CzOI
         6Y/JkFZVXp//7SkJW0wWBDw8eLAuzdd2RrCtTk6YJVGSLtveb0/X01c0iNg7B8gNvNvo
         dx0MwNDFkCWtBEim1yF8+6sK4xDS3uGnZG9vUEFYxEwFPNMxEXw7B3ORBHIEgj7tI2SH
         sYEw==
X-Gm-Message-State: AOJu0YzSS6CBn/JIvqwGtHi1edsVq7arf0SG9VjOxiEKlHn0HzYNo8Gv
	RKaicGSdUstlmlCGKqBBbWTb7B5+YxVAmA==
X-Google-Smtp-Source: AGHT+IHYV8ZG6kjHBZJEKjL6jOfUxNdWK5bhgaGsJ23TFmKFRnVUk91dayd7j3dem7ruociUT5KN5Q==
X-Received: by 2002:a17:907:a0a:b0:9a9:f2fd:2a2b with SMTP id bb10-20020a1709070a0a00b009a9f2fd2a2bmr5912774ejc.73.1698590114766;
        Sun, 29 Oct 2023 07:35:14 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id gz4-20020a170906f2c400b00992b2c55c67sm4432011ejb.156.2023.10.29.07.35.14
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 07:35:14 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-53e04b17132so5880604a12.0
        for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 07:35:14 -0700 (PDT)
X-Received: by 2002:a17:906:ee82:b0:9be:3c8e:1506 with SMTP id
 wt2-20020a170906ee8200b009be3c8e1506mr6184178ejb.70.1698590114453; Sun, 29
 Oct 2023 07:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231029-usb-fixes-2-v1-0-9f793aa20fe4@marcan.st>
In-Reply-To: <20231029-usb-fixes-2-v1-0-9f793aa20fe4@marcan.st>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 29 Oct 2023 10:34:37 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-20EYdKTk0fGon4w7mBbChrARuyHyfWwbZDwyx2k=59A@mail.gmail.com>
Message-ID: <CAEg-Je-20EYdKTk0fGon4w7mBbChrARuyHyfWwbZDwyx2k=59A@mail.gmail.com>
Subject: Re: [PATCH 0/2] USB fixes: Add missing timeout, ignore YubiKeys
To: Hector Martin <marcan@marcan.st>
Cc: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
	Mark Kettenis <kettenis@openbsd.org>, u-boot@lists.denx.de, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 29, 2023 at 3:09=E2=80=AFAM Hector Martin <marcan@marcan.st> wr=
ote:
>
> This mini series fixes one bug, but in the process makes YubiKeys work,
> which then regresses people who have one *and* a USB keyboard, since we
> only support a single keyboard device.
>
> Therefore patch #1 makes U-Boot ignore YubiKeys, so #2 does not
> regress things.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
> Hector Martin (2):
>       usb: kbd: Ignore Yubikeys
>       usb: hub: Add missing reset recovery delay
>
>  common/usb_hub.c |  7 +++++++
>  common/usb_kbd.c | 19 +++++++++++++++++++
>  2 files changed, 26 insertions(+)
> ---
> base-commit: 8ad1c9c26f7740806a162818b790d4a72f515b7e
> change-id: 20231029-usb-fixes-2-976486d1603c
>

Series LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
