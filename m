Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720953FB15
	for <asahi@lists.linux.dev>; Tue, 14 Nov 2023 15:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5437269a661so13562199a12.0
        for <asahi@lists.linux.dev>; Tue, 14 Nov 2023 07:14:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699974861; x=1700579661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxz8QkUMUdK70UcIufkcCTFuHM/iFKukNXMBMippDVw=;
        b=EvoI+QxmDMF0tFHPk8ziZcImFJJ/e87Koz8Ud3BeYBpuLgouvA99fCQKzr3/Fly5e/
         fQnnLOknHr8it8VO54dERtAPgigunY9IPugssli6khVOT2F88Z+XDL5kjHuO+GTLXQhV
         E1j+8x2bTAYQ/dEhxOqxEoDL9CbNaRIc4Hsn0iK4VT11s9SX22gwuPhe0VPkAr6C9X6X
         tciEZ6ef689WX5A1JuMU4lPDXAmUD0LExaf0lvRcw4a3vaVhKGX9kZN5F/bqEm28A8wh
         kR7jTuajohTIvrxETxHRd9BsFUB41q93oyYL7DdtZqL+IbwAlyV0av5/VImTrwqMkTXi
         EUAA==
X-Gm-Message-State: AOJu0YyCITS7msMrms88qInsiKA+eHv3grZ1wFtnCbhcuiOY8D0JRtO9
	XHLQzkmmjQf8hZd2lZv6RsD726SJ4f37/wGW7Pk=
X-Google-Smtp-Source: AGHT+IFpzaIdUMoAMPJnU+6Yeom8kRpMb97SIlLOkgIcjvO4ViWilP1hckTo3ClMnja0tno4TZ8YlQ==
X-Received: by 2002:a17:906:234e:b0:9a9:f0e6:904e with SMTP id m14-20020a170906234e00b009a9f0e6904emr2126702eja.16.1699974861214;
        Tue, 14 Nov 2023 07:14:21 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id k11-20020a170906a38b00b009b285351817sm5648950ejz.116.2023.11.14.07.14.20
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Nov 2023 07:14:20 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5437269a661so13562164a12.0
        for <asahi@lists.linux.dev>; Tue, 14 Nov 2023 07:14:20 -0800 (PST)
X-Received: by 2002:a05:6402:440f:b0:531:14c4:ae30 with SMTP id
 y15-20020a056402440f00b0053114c4ae30mr3214229eda.0.1699974860727; Tue, 14 Nov
 2023 07:14:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231114-bluetooth-msgid-fix-v1-1-1d15394bf342@marcan.st>
In-Reply-To: <20231114-bluetooth-msgid-fix-v1-1-1d15394bf342@marcan.st>
From: Neal Gompa <neal@gompa.dev>
Date: Tue, 14 Nov 2023 10:13:43 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-SvvMpAAqtOPgaKt1PuoZi37K0Tprf3KDts-SBTzNpUA@mail.gmail.com>
Message-ID: <CAEg-Je-SvvMpAAqtOPgaKt1PuoZi37K0Tprf3KDts-SBTzNpUA@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Fix msgid release
To: Hector Martin <marcan@marcan.st>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Aditya Garg <gargaditya08@live.com>, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 2:05=E2=80=AFAM Hector Martin <marcan@marcan.st> wr=
ote:
>
> We are releasing a single msgid, so the order argument to
> bitmap_release_region must be zero.
>
> In practice this was probably harmlessly masked to 0 anyway, which is
> why it worked, but it trips ubsan.
>
> Fixes: 8a06127602de ("Bluetooth: hci_bcm4377: Add new driver for BCM4377 =
PCIe boards")
> Reported-by: Aditya Garg <gargaditya08@live.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  drivers/bluetooth/hci_bcm4377.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4=
377.c
> index 19ad0e788646..5e9f79235cde 100644
> --- a/drivers/bluetooth/hci_bcm4377.c
> +++ b/drivers/bluetooth/hci_bcm4377.c
> @@ -715,7 +715,7 @@ static void bcm4377_handle_ack(struct bcm4377_data *b=
cm4377,
>                 ring->events[msgid] =3D NULL;
>         }
>
> -       bitmap_release_region(ring->msgids, msgid, ring->n_entries);
> +       bitmap_release_region(ring->msgids, msgid, 0);
>
>  unlock:
>         spin_unlock_irqrestore(&ring->lock, flags);
>
> ---
> base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
> change-id: 20231114-bluetooth-msgid-fix-29769be7e45b
>
> Best regards,
> --
> Hector Martin <marcan@marcan.st>
>
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
