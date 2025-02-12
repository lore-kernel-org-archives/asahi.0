Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2984B261390
	for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 15:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739375283; cv=none; b=qhXdF8HDm+pR+vxjAETkc8KjHd2utUVl6BLcsdozuhi3d6HWhKnR8FFACv/T0JnASWdPJd/CRSlgwztIO1hg4dwNz7J8RkCWIA+qiNLYJCKE8Ojs0DsKoP+709lMycTcgrD0JD1Ja33hiwpP+8NxoUW1vd79q9vlmzKkYdz6GPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739375283; c=relaxed/simple;
	bh=iMwraRPqoGZXPSV/ZIi013g4oSfQKmUsDk4bVEfeeAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ubu1ZtSlSw9p5qMYTNBMP5Mab23w3QrvadeHitRBF7d7QKO0IxLsYfA8S637rvIfyeEA2kB4jSL8XpmKG7H8CU0GZ11Jh789dwA2/cjS1+yUS7r0p7rYJ7VFxxVqyeA8wR6VtmOZxTeF2IDoOkSrIdrwF4jvwck2zq3MuZ9rfBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dcdb56c9d3so11034229a12.0
        for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 07:48:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739375279; x=1739980079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uYrRumV9nMSUYKKSpYn+3g5k4eAh93TeT+WqPiVakU=;
        b=RcEd5agtjh6lrc3iKRk4pDdrnVPvnFnbCVqo3Vzl0NAgGo03y4hjt0WIy+M3LYotUs
         4kKgaqIzC1U5wzRX72otVPDhrDyxM0vlWUKTfk9EfG7lxZPjkq0HmVWUH1xZRo2rrEBg
         rQjofVaOeZMd2dMcHviYykLPNCdmIm2IxYD4AWzRMcjN1EBCedRf1ruKI1ihLDxQVMuO
         0KNJDuFw/jhkZGMRw+xh1o4Mo2iAwdBgPvRgCnb2h/swnBfXWWovcB+PMSwK5Pjf1HkB
         07hDvN9vwga/KTEQTJ3BthXPLN/pPcxLU5q/2duDGIRxnG5qWGFOD3XJsh68gQpjxvh9
         sxoQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4Rt78viNNJocrntsgceERjJ4r/H7iYlIZ9ifvd5xHhhbhkahIkDgKtQqd8vMAixIUxhyBHQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwwLjoVTcC9fuIxVyin5EZYoKU2cayIFuiajpwPbdCdtFVRvOC9
	ttrO0ZkBas+2+2QKO7AHLP/0hcn2Vhp6OhO1jRps/uI+ULcIdPtVvUH6JgCb7N4=
X-Gm-Gg: ASbGncsYh9H2FX4VLuv4lLb73LE8eerNU3fy/fZDMbDnC+wji3C/v4BDelg/rdNwWVv
	l4aU5sLMEHTy22PCNRz19EFSiVYdDy23waU5+I3pNn3Hd2xpLUX8Io9bW4L/fnWhA2yODOR1wOt
	A3RjUSzyo9p3aYz/a5b4gK02SM0zvOe+pYMvgnaLoPu6NHbBU9mISpU3BRjlCEP8AcOrlqjGbZF
	yvX891vW6UWK6aa/WCSiccwYfIgLdbgs89laYoonjpma0J8+QMgXTqwwshpPOYz8bntZzyJ9VmX
	HkbmRhSvenXswxUtU35LVer5OK79iheRCFp7JFsjI4aafg==
X-Google-Smtp-Source: AGHT+IH/eqnyj/nbZ/knq5GxjV5L+piA15jOCTDQ1dPWt0MzIHQjLKezGMvGXspr6cvisA3bM5QWCQ==
X-Received: by 2002:a05:6402:268e:b0:5d0:c697:1f02 with SMTP id 4fb4d7f45d1cf-5deadd9d2b4mr9111799a12.17.1739375278344;
        Wed, 12 Feb 2025 07:47:58 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de50b1cafesm9509574a12.78.2025.02.12.07.47.58
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 07:47:58 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-38de1a5f039so2783028f8f.2
        for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 07:47:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSV21FlhwqelaOux0uUeEbCo37zD8SCt6cuvzIVYP7z141x7HlMURaSKsBfZ/j2SR5/JMjAQ==@lists.linux.dev
X-Received: by 2002:a5d:588c:0:b0:38a:2b39:9205 with SMTP id
 ffacd0b85a97d-38dea2878bfmr3997807f8f.33.1739375277843; Wed, 12 Feb 2025
 07:47:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250211-rtkit-more-logging-v1-1-93334e9c1c77@rosenzweig.io>
In-Reply-To: <20250211-rtkit-more-logging-v1-1-93334e9c1c77@rosenzweig.io>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 12 Feb 2025 10:47:21 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_XadeDiXBeXckZ=UQ2wYHtGppdM3nPmardyYx7SBgCrg@mail.gmail.com>
X-Gm-Features: AWEUYZloTNjia8wdzYJXwYEgocjhTE4bAY0UXN52FPIm83DaokT5Zoy8sOwb2VQ
Message-ID: <CAEg-Je_XadeDiXBeXckZ=UQ2wYHtGppdM3nPmardyYx7SBgCrg@mail.gmail.com>
Subject: Re: [PATCH] soc: apple: rtkit: Check & log more failures
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Sven Peter <sven@svenpeter.dev>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Asahi Lina <lina@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 1:00=E2=80=AFPM Alyssa Rosenzweig <alyssa@rosenzwei=
g.io> wrote:
>
> From: Asahi Lina <lina@asahilina.net>
>
> Check and log the following failures:
>
> * regular messages
> * management messages
> * failed buffer requests
>
> This helps debugging.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> Signed-off-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> ---
> Originally multiple commits by Asahi Lina, squashed here and
> checkpatch.pl warn fixed.
> ---
>  drivers/soc/apple/rtkit.c | 44 ++++++++++++++++++++++++++++++++++-------=
---
>  1 file changed, 34 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
> index e6d940292c9fbdfc4cd42020e89aca2662c5cdce..f8077a1ec3a42265eb9565a0e=
a1ca6a4cf7e79dc 100644
> --- a/drivers/soc/apple/rtkit.c
> +++ b/drivers/soc/apple/rtkit.c
> @@ -97,12 +97,19 @@ bool apple_rtkit_is_crashed(struct apple_rtkit *rtk)
>  }
>  EXPORT_SYMBOL_GPL(apple_rtkit_is_crashed);
>
> -static void apple_rtkit_management_send(struct apple_rtkit *rtk, u8 type=
,
> +static int apple_rtkit_management_send(struct apple_rtkit *rtk, u8 type,
>                                         u64 msg)
>  {
> +       int ret;
> +
>         msg &=3D ~APPLE_RTKIT_MGMT_TYPE;
>         msg |=3D FIELD_PREP(APPLE_RTKIT_MGMT_TYPE, type);
> -       apple_rtkit_send_message(rtk, APPLE_RTKIT_EP_MGMT, msg, NULL, fal=
se);
> +       ret =3D apple_rtkit_send_message(rtk, APPLE_RTKIT_EP_MGMT, msg, N=
ULL, false);
> +
> +       if (ret)
> +               dev_err(rtk->dev, "RTKit: Failed to send management messa=
ge: %d\n", ret);
> +
> +       return ret;
>  }
>
>  static void apple_rtkit_management_rx_hello(struct apple_rtkit *rtk, u64=
 msg)
> @@ -295,6 +302,9 @@ static int apple_rtkit_common_rx_get_buffer(struct ap=
ple_rtkit *rtk,
>         return 0;
>
>  error:
> +       dev_err(rtk->dev, "RTKit: failed buffer request for 0x%zx bytes (=
%d)\n",
> +               buffer->size, err);
> +
>         buffer->buffer =3D NULL;
>         buffer->iomem =3D NULL;
>         buffer->iova =3D 0;
> @@ -588,11 +598,18 @@ int apple_rtkit_send_message(struct apple_rtkit *rt=
k, u8 ep, u64 message,
>                 .msg1 =3D ep,
>         };
>
> -       if (rtk->crashed)
> +       if (rtk->crashed) {
> +               dev_warn(rtk->dev,
> +                        "RTKit: Device is crashed, cannot send message\n=
");
>                 return -EINVAL;
> +       }
> +
>         if (ep >=3D APPLE_RTKIT_APP_ENDPOINT_START &&
> -           !apple_rtkit_is_running(rtk))
> +           !apple_rtkit_is_running(rtk)) {
> +               dev_warn(rtk->dev,
> +                        "RTKit: Endpoint 0x%02x is not running, cannot s=
end message\n", ep);
>                 return -EINVAL;
> +       }
>
>         /*
>          * The message will be sent with a MMIO write. We need the barrie=
r
> @@ -742,8 +759,10 @@ static int apple_rtkit_set_ap_power_state(struct app=
le_rtkit *rtk,
>         reinit_completion(&rtk->ap_pwr_ack_completion);
>
>         msg =3D FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, state);
> -       apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_AP_PWR_STAT=
E,
> -                                   msg);
> +       ret =3D apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_AP_=
PWR_STATE,
> +                                         msg);
> +       if (ret)
> +               return ret;
>
>         ret =3D apple_rtkit_wait_for_completion(&rtk->ap_pwr_ack_completi=
on);
>         if (ret)
> @@ -763,8 +782,10 @@ static int apple_rtkit_set_iop_power_state(struct ap=
ple_rtkit *rtk,
>         reinit_completion(&rtk->iop_pwr_ack_completion);
>
>         msg =3D FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, state);
> -       apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP_PWR_STA=
TE,
> -                                   msg);
> +       ret =3D apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP=
_PWR_STATE,
> +                                         msg);
> +       if (ret)
> +               return ret;
>
>         ret =3D apple_rtkit_wait_for_completion(&rtk->iop_pwr_ack_complet=
ion);
>         if (ret)
> @@ -865,6 +886,7 @@ EXPORT_SYMBOL_GPL(apple_rtkit_quiesce);
>  int apple_rtkit_wake(struct apple_rtkit *rtk)
>  {
>         u64 msg;
> +       int ret;
>
>         if (apple_rtkit_is_running(rtk))
>                 return -EINVAL;
> @@ -876,8 +898,10 @@ int apple_rtkit_wake(struct apple_rtkit *rtk)
>          * will wait for the completion anyway.
>          */
>         msg =3D FIELD_PREP(APPLE_RTKIT_MGMT_PWR_STATE, APPLE_RTKIT_PWR_ST=
ATE_ON);
> -       apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP_PWR_STA=
TE,
> -                                   msg);
> +       ret =3D apple_rtkit_management_send(rtk, APPLE_RTKIT_MGMT_SET_IOP=
_PWR_STATE,
> +                                         msg);
> +       if (ret)
> +               return ret;
>
>         return apple_rtkit_boot(rtk);
>  }
>
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250211-rtkit-more-logging-79cbbbe21eee
>
> Best regards,
> --
> Alyssa Rosenzweig <alyssa@rosenzweig.io>
>
>

Looks good to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
