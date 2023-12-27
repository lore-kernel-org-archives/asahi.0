Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663F52D78C
	for <asahi@lists.linux.dev>; Wed, 27 Dec 2023 10:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-50e835800adso1004455e87.0
        for <asahi@lists.linux.dev>; Wed, 27 Dec 2023 02:24:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703672655; x=1704277455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVwxJBV9dNfPBB0zTv6L5ZFrZ/KLxWM50ofClNNSEY8=;
        b=hBY6kEfPYSoWmqbxHDwN1fmUM487fIzkHT3wg/gzCw86bUsC+KgFfIDIfR3Flwre4z
         YXHIIqfd/M04ccXfEJYNGS4pd/mhIwiiEzH8WrLqvA9Ie3xBKnm6lbJyfV41PeaHH8as
         aln+e0P15nF6HdIFDPsId2VWsUPidO27hL+vBVrRNX4Cdo5FGHpQ5gx833iBzh0f9m7l
         9sO/gKaR2W/Cv0R9wMVr+63W0BmwNNi9UddIotv9MlAo9wvTX6vqCS6EqLk5bLEiHSJ7
         K3BobD/GFulyb6g1Z94CneQkQxgExzoakTqtizMbW4aQlHJ0DdZqiRuuaRmEmKElUyI3
         YPoA==
X-Gm-Message-State: AOJu0Yx6RD4CQtM1dBKcHbxeeDEpl4PuzIo26hjD535i2InvfxBB1r2s
	RKsQsu2LMdHxw8A/wvFxvV4cxeh144jTPDJ5Sqw=
X-Google-Smtp-Source: AGHT+IGC4TzM3yn/2tzS7BGFGb4kCxyjp1fegzG59+V8lHTXpEk2GJYAauJ2w8bxKpxN7P/E0M5G+w==
X-Received: by 2002:ac2:4a72:0:b0:50e:7b34:c17b with SMTP id q18-20020ac24a72000000b0050e7b34c17bmr1068400lfp.74.1703672655377;
        Wed, 27 Dec 2023 02:24:15 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com. [209.85.208.46])
        by smtp.gmail.com with ESMTPSA id s24-20020aa7cb18000000b0054ce9ef93fbsm8398872edt.4.2023.12.27.02.24.14
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 02:24:15 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-55361b7f38eso5874813a12.0
        for <asahi@lists.linux.dev>; Wed, 27 Dec 2023 02:24:14 -0800 (PST)
X-Received: by 2002:a17:906:46d8:b0:a23:5eb9:367d with SMTP id
 k24-20020a17090646d800b00a235eb9367dmr2329262ejs.227.1703672654628; Wed, 27
 Dec 2023 02:24:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aaa107865f4cbd61f8f9006fd3e7ac43b5d1bdad.camel@mrman314.tech>
In-Reply-To: <aaa107865f4cbd61f8f9006fd3e7ac43b5d1bdad.camel@mrman314.tech>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 27 Dec 2023 05:23:37 -0500
X-Gmail-Original-Message-ID: <CAEg-Je83qHR=5v6YbAguVH8QNmnaPV6GKb6U6aDcV-_+cE291Q@mail.gmail.com>
Message-ID: <CAEg-Je83qHR=5v6YbAguVH8QNmnaPV6GKb6U6aDcV-_+cE291Q@mail.gmail.com>
Subject: Re: [PATCH v4] Bluetooth: Fix Bluetooth for BCM4377 on T2 Intel MacBooks
To: Felix Zhang <mrman@mrman314.tech>
Cc: linux-bluetooth@vger.kernel.org, stable@vger.kernel.org, marcan@marcan.st, 
	bagasdotme@gmail.com, sven@svenpeter.dev, alyssa@rosenzweig.io, 
	marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com, 
	orlandoch.dev@gmail.com, kekrby@gmail.com, admin@kodeit.net, j@jannau.net, 
	gargaditya08@live.com, asahi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 25, 2023 at 3:21=E2=80=AFPM Felix Zhang <mrman@mrman314.tech> w=
rote:
>
> Starting v6.5, Bluetooth does not work at all on my T2
> MacBookAir9,1 with the BCM4377 chip.  When I boot up the computer,
> go into bluetoothctl, and then try to run commands like scan on,
> show, list, it returns "No default controller available."  I have
> tried reloading the kernel module, in which the log outputs
> "{Added,Removed} hci0 (unconfigured)."  With this patch, I
> am able to use Bluetooth as normal without any errors regarding
> hci0 being unconfigured.  However, an issue is still present
> where sometimes hci_bcm4377 will have to be reloaded in order to
> get bluetooth to work.  I believe this was still present before
> the previously mentioned commit.
>
> I would also like to thank Kerem Karabay <kekrby@gmail.com> for
> assisting me with this patch.
>
> Fixes: 6945795bc81a ("Bluetooth: fix use-bdaddr-property quirk")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Felix Zhang <mrman@mrman314.tech>
> ---
> v4:
> * Adjust the format to pass the CI (again).
> * Shorten description
> ---
>  drivers/bluetooth/hci_bcm4377.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/hci_bcm4377.c
> b/drivers/bluetooth/hci_bcm4377.c
> index a61757835695..5c6fef1aa0f6 100644
> --- a/drivers/bluetooth/hci_bcm4377.c
> +++ b/drivers/bluetooth/hci_bcm4377.c
> @@ -513,6 +513,7 @@ struct bcm4377_hw {
>         unsigned long broken_ext_scan : 1;
>         unsigned long broken_mws_transport_config : 1;
>         unsigned long broken_le_coded : 1;
> +       unsigned long use_bdaddr_property : 1;
>
>         int (*send_calibration)(struct bcm4377_data *bcm4377);
>         int (*send_ptb)(struct bcm4377_data *bcm4377,
> @@ -2368,5 +2369,6 @@ static int bcm4377_probe(struct pci_dev *pdev,
> const struct pci_device_id *id)
>         hdev->set_bdaddr =3D bcm4377_hci_set_bdaddr;
>         hdev->setup =3D bcm4377_hci_setup;
>
> -       set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
> +       if (bcm4377->hw->use_bdaddr_property)
> +               set_bit(HCI_QUIRK_USE_BDADDR_PROPERTY, &hdev->quirks);
>         if (bcm4377->hw->broken_mws_transport_config)
> @@ -2465,6 +2467,7 @@ static const struct bcm4377_hw
> bcm4377_hw_variants[] =3D {
>                 .has_bar0_core2_window2 =3D true,
>                 .broken_mws_transport_config =3D true,
>                 .broken_le_coded =3D true,
> +               .use_bdaddr_property =3D true,
>                 .send_calibration =3D bcm4378_send_calibration,
>                 .send_ptb =3D bcm4378_send_ptb,
>         },
> @@ -2479,6 +2482,7 @@ static const struct bcm4377_hw
> bcm4377_hw_variants[] =3D {
>                 .clear_pciecfg_subsystem_ctrl_bit19 =3D true,
>                 .broken_mws_transport_config =3D true,
>                 .broken_le_coded =3D true,
> +               .use_bdaddr_property =3D true,
>                 .send_calibration =3D bcm4387_send_calibration,
>                 .send_ptb =3D bcm4378_send_ptb,
>         },
> --
> 2.43.0
>
>

Sorry, excuse me for replying to the wrong message, I got confused by
Gmail on what to reply to.

This is fine and thanks for the fix!

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
