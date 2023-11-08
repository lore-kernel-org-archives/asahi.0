Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8356156DB
	for <asahi@lists.linux.dev>; Wed,  8 Nov 2023 11:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso1056726566b.1
        for <asahi@lists.linux.dev>; Wed, 08 Nov 2023 03:13:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699442015; x=1700046815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aa+ViCUK3fZfx5s1sIETj47ifZQeP9M0i8nxo+tjcZI=;
        b=w9nkkji+2SCZ9XmQLAC2Oe+eq7NJTvp4L1bMQQzovjvSrTpyhY0B3BGgFEXLOv+zjU
         vqVFCiUKSn64a4zk49pRn6vAprhtVRISAwIkC2QLHiGh+q6gtOrmz8RdO59momQhrDFc
         xOD10S9IIMtkC9hFGw6mnQFdTp7wGn/5bXVl5orPqSpDsLnfhSgdwk6TAmMhY1ylFGnP
         WdqsK8qs8a89u5OmeEW+vmDUJcsyG0f4h3VfrebABzCQ9shPttRFFwhVUladzq2c+dXY
         YYpLdTVMDh9nESbab0DY+xob5FaToELflGreQ3jUjKDX84AC8iinzG5N5C4k1VOpOlNn
         gMRA==
X-Gm-Message-State: AOJu0Yzn/5L6b6HF8Ku+M50ddSf3cstebgD617ST7CA/U5DZtLKz/7hD
	q9D+uTH2zMewbR3GcWMsMJr4oTI2cIQusX/p
X-Google-Smtp-Source: AGHT+IF3md6mL5eHTfi09KbY4HIVPXl5xoG2QsctdlNCQ2iKJs+RjDGagxvJr8TIHvE86glAqOtNEA==
X-Received: by 2002:a17:907:9444:b0:9dd:718f:d384 with SMTP id dl4-20020a170907944400b009dd718fd384mr1050258ejc.59.1699442014546;
        Wed, 08 Nov 2023 03:13:34 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id w5-20020a1709064a0500b009b2ba067b37sm860030eju.202.2023.11.08.03.13.34
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 03:13:34 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-9d2c54482fbso1055375266b.2
        for <asahi@lists.linux.dev>; Wed, 08 Nov 2023 03:13:34 -0800 (PST)
X-Received: by 2002:a17:907:7d9e:b0:9a9:ef41:e5c7 with SMTP id
 oz30-20020a1709077d9e00b009a9ef41e5c7mr1292716ejc.8.1699442013815; Wed, 08
 Nov 2023 03:13:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231107-brcmfmac-wpa3-v1-1-4c7db8636680@marcan.st>
In-Reply-To: <20231107-brcmfmac-wpa3-v1-1-4c7db8636680@marcan.st>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 8 Nov 2023 06:12:56 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-pu5Xdej33b_6vrjgddP0A=-Pc_RFbB-wDVNxPXy2mZw@mail.gmail.com>
Message-ID: <CAEg-Je-pu5Xdej33b_6vrjgddP0A=-Pc_RFbB-wDVNxPXy2mZw@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmfmac: cfg80211: Use WSEC to set SAE password
To: Hector Martin <marcan@marcan.st>
Cc: Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>, 
	Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Daniel Berlin <dberlin@dberlin.org>, linux-wireless@vger.kernel.org, 
	brcm80211-dev-list.pdl@broadcom.com, SHA-cyfmac-dev-list@infineon.com, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 7, 2023 at 1:06=E2=80=AFAM Hector Martin <marcan@marcan.st> wro=
te:
>
> Using the WSEC command instead of sae_password seems to be the supported
> mechanism on newer firmware, and also how the brcmdhd driver does it.
>
> According to user reports [1], the sae_password codepath doesn't actually
> work on machines with Cypress chips anyway, so no harm in removing it.
>
> This makes WPA3 work with iwd, or with wpa_supplicant pending a support
> patchset [2].
>
> [1] https://rachelbythebay.com/w/2023/11/06/wpa3/
> [2] http://lists.infradead.org/pipermail/hostap/2023-July/041653.html
>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 46 +++++++++-------=
------
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       |  2 +-
>  2 files changed, 20 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c =
b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> index 2a90bb24ba77..138af70a33b8 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> @@ -1687,52 +1687,44 @@ static u16 brcmf_map_fw_linkdown_reason(const str=
uct brcmf_event_msg *e)
>         return reason;
>  }
>
> -static int brcmf_set_pmk(struct brcmf_if *ifp, const u8 *pmk_data, u16 p=
mk_len)
> +static int brcmf_set_wsec(struct brcmf_if *ifp, const u8 *key, u16 key_l=
en, u16 flags)
>  {
>         struct brcmf_pub *drvr =3D ifp->drvr;
>         struct brcmf_wsec_pmk_le pmk;
>         int err;
>
> +       if (key_len > sizeof(pmk.key)) {
> +               bphy_err(drvr, "key must be less than %zu bytes\n",
> +                        sizeof(pmk.key));
> +               return -EINVAL;
> +       }
> +
>         memset(&pmk, 0, sizeof(pmk));
>
> -       /* pass pmk directly */
> -       pmk.key_len =3D cpu_to_le16(pmk_len);
> -       pmk.flags =3D cpu_to_le16(0);
> -       memcpy(pmk.key, pmk_data, pmk_len);
> +       /* pass key material directly */
> +       pmk.key_len =3D cpu_to_le16(key_len);
> +       pmk.flags =3D cpu_to_le16(flags);
> +       memcpy(pmk.key, key, key_len);
>
> -       /* store psk in firmware */
> +       /* store key material in firmware */
>         err =3D brcmf_fil_cmd_data_set(ifp, BRCMF_C_SET_WSEC_PMK,
>                                      &pmk, sizeof(pmk));
>         if (err < 0)
>                 bphy_err(drvr, "failed to change PSK in firmware (len=3D%=
u)\n",
> -                        pmk_len);
> +                        key_len);
>
>         return err;
>  }
>
> +static int brcmf_set_pmk(struct brcmf_if *ifp, const u8 *pmk_data, u16 p=
mk_len)
> +{
> +       return brcmf_set_wsec(ifp, pmk_data, pmk_len, 0);
> +}
> +
>  static int brcmf_set_sae_password(struct brcmf_if *ifp, const u8 *pwd_da=
ta,
>                                   u16 pwd_len)
>  {
> -       struct brcmf_pub *drvr =3D ifp->drvr;
> -       struct brcmf_wsec_sae_pwd_le sae_pwd;
> -       int err;
> -
> -       if (pwd_len > BRCMF_WSEC_MAX_SAE_PASSWORD_LEN) {
> -               bphy_err(drvr, "sae_password must be less than %d\n",
> -                        BRCMF_WSEC_MAX_SAE_PASSWORD_LEN);
> -               return -EINVAL;
> -       }
> -
> -       sae_pwd.key_len =3D cpu_to_le16(pwd_len);
> -       memcpy(sae_pwd.key, pwd_data, pwd_len);
> -
> -       err =3D brcmf_fil_iovar_data_set(ifp, "sae_password", &sae_pwd,
> -                                      sizeof(sae_pwd));
> -       if (err < 0)
> -               bphy_err(drvr, "failed to set SAE password in firmware (l=
en=3D%u)\n",
> -                        pwd_len);
> -
> -       return err;
> +       return brcmf_set_wsec(ifp, pwd_data, pwd_len, BRCMF_WSEC_PASSPHRA=
SE);
>  }
>
>  static void brcmf_link_down(struct brcmf_cfg80211_vif *vif, u16 reason,
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.=
h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
> index 611d1a6aabb9..b68c46caabe8 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
> @@ -584,7 +584,7 @@ struct brcmf_wsec_key_le {
>  struct brcmf_wsec_pmk_le {
>         __le16  key_len;
>         __le16  flags;
> -       u8 key[2 * BRCMF_WSEC_MAX_PSK_LEN + 1];
> +       u8 key[BRCMF_WSEC_MAX_SAE_PASSWORD_LEN];
>  };
>
>  /**
>
> ---
> base-commit: ffc253263a1375a65fa6c9f62a893e9767fbebfa
> change-id: 20231107-brcmfmac-wpa3-9e5f66e8be34
>
> Best regards,
> --
> Hector Martin <marcan@marcan.st>
>
>

Looks good to me.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
