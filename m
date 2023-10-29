Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012FE389
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 14:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-53dfc28a2afso5743572a12.1
        for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 07:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698590272; x=1699195072;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+CbmyRxF4VUwyySze5hLqducEioPMLXYFdj1Fi2dXk=;
        b=C8yA54Bx7cSsh6hDm0bH5nvoHezderiABbEjbHPN2XyvNCTzpleYs2y6OXDqznOTNX
         FdUB+d/reQ6cbeSeecgsoRmovm6UH8/7uIHpA+NPi7OgSqwiVe7p2nTSDwYW1LpnSb44
         d45KJP8UB48O15Yl7NmW7GHFpk3pA2f/zop7KkLm6hy7NTpRmLLxVZ24Zt+qDIiTWisf
         AWfJnZrS4lIt73x2REIWmT/d1HVh/PL1lbDcQc/nTfh0VVPbQ8QjDiRK+r8pmBsaDoot
         fibEMDgBCXVuUWM21HL838VOoew/SOrwV7DF0/UMNyiYK3tTHtGD+sXj2/vVjG0aVSDr
         AhEQ==
X-Gm-Message-State: AOJu0Ywu0EuAII3P7ERVcN5Xgy7nDj4YMHk/SYS0hQ7mQKMYNxXLADfk
	Zi3ODwqdFwgBLFZxOUz8O6BfW5MLRYm0mw==
X-Google-Smtp-Source: AGHT+IHxWgct/AYrGcpBic/97j58NAn7eXQwKdX/VDgyT7PVZzqvGCTVKTgpV+dL0SE2FWuNb4dP4A==
X-Received: by 2002:a17:907:9807:b0:9bf:b8f7:1fcd with SMTP id ji7-20020a170907980700b009bfb8f71fcdmr6753090ejc.14.1698590272425;
        Sun, 29 Oct 2023 07:37:52 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id rh22-20020a17090720f600b00997e99a662bsm4381330ejb.20.2023.10.29.07.37.52
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Oct 2023 07:37:52 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9d216597f64so135576166b.3
        for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 07:37:52 -0700 (PDT)
X-Received: by 2002:a17:906:db0d:b0:9c7:58cd:b57 with SMTP id
 xj13-20020a170906db0d00b009c758cd0b57mr6821776ejb.37.1698590272121; Sun, 29
 Oct 2023 07:37:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231029-usb-fixes-4-v1-1-fe973dde7e59@marcan.st>
In-Reply-To: <20231029-usb-fixes-4-v1-1-fe973dde7e59@marcan.st>
From: Neal Gompa <neal@gompa.dev>
Date: Sun, 29 Oct 2023 10:37:15 -0400
X-Gmail-Original-Message-ID: <CAEg-Je-iXWXQC=QFEh2bS4hDv52Tp1ZTwYzCdSf7rBuYm4Se5g@mail.gmail.com>
Message-ID: <CAEg-Je-iXWXQC=QFEh2bS4hDv52Tp1ZTwYzCdSf7rBuYm4Se5g@mail.gmail.com>
Subject: Re: [PATCH] usb: Ignore endpoints in non-zero altsettings
To: Hector Martin <marcan@marcan.st>
Cc: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>, 
	Mark Kettenis <kettenis@openbsd.org>, u-boot@lists.denx.de, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 29, 2023 at 3:25=E2=80=AFAM Hector Martin <marcan@marcan.st> wr=
ote:
>
> We currently do not really handle altsettings properly, and no driver
> uses them. Ignore the respective endpoint descriptors for secondary
> altsettings, to avoid creating duplicate endpoint records in the
> interface.
>
> This will have to be revisited if/when we have a driver that needs
> altsettings to work properly.
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  common/usb.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/common/usb.c b/common/usb.c
> index aad13fd9c557..90f72fda00bc 100644
> --- a/common/usb.c
> +++ b/common/usb.c
> @@ -463,6 +463,15 @@ static int usb_parse_config(struct usb_device *dev,
>                                 puts("Endpoint descriptor out of order!\n=
");
>                                 break;
>                         }
> +                       if (if_desc->num_altsetting > 1) {
> +                               /*
> +                                * Ignore altsettings, which can trigger =
duplicate
> +                                * endpoint errors below. Revisit this wh=
en some
> +                                * driver actually needs altsettings with=
 differing
> +                                * endpoint setups.
> +                                */
> +                               break;
> +                       }
>                         epno =3D dev->config.if_desc[ifno].no_of_ep;
>                         if_desc =3D &dev->config.if_desc[ifno];
>                         if (epno >=3D USB_MAXENDPOINTS) {
>
> ---
> base-commit: 8ad1c9c26f7740806a162818b790d4a72f515b7e
> change-id: 20231029-usb-fixes-4-ba6931acf217
>

Irritating, but makes sense.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
