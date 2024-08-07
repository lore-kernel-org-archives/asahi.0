Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9682868D;
	Wed,  7 Aug 2024 08:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723018224; cv=none; b=qmxoK6KIHFKoeuc9VRplvd+DHpq1t2MxD7CScbGqu+kKtrJD728WAdTCpxrQUd4/L+SWvYIuaou+7nBp7H+5REcTrlsJkWGTbsSklK3NcMnbZWvV84knqycxJYBaIgolqrgilRtj23f1MSdFKsTtS2znKPNrhFDKy0fnYKSangk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723018224; c=relaxed/simple;
	bh=O65A7S4dv9JLxTrEg15BToKE6ghwYaIYY4QohPP/UKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UuCXs2fWqvNwQPsOAkP9zzlzpPow9GNp2FRTXtOEd+jWQAJMsuHr5dE+xcaDPHwn/HHOE7x6k6ye2+RZIPplRYEeYN9dILVLagGWfpMCh5sK8t3jtSO0WewddhiGC23Y61GAAD/UeSHxUw+uakHigB5QaNSt4//CeQ7qCvqfugw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a7a8a4f21aeso180921966b.2;
        Wed, 07 Aug 2024 01:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723018219; x=1723623019;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jjhz96xjWuk/ukU30r31lEvLok4NM+gNuypmgKKc5GQ=;
        b=BLB9D2SrDZca76jRZCIUmnSQtm00oak93n6osDvCFG0rrjLv4Nn8sBAyRAkcoUUCcY
         jqJ8lmaLFGV5SOZOtgdRLdKq6+LQ01vkdjbMqDHZjQ3U0HOFR2pHHJbNJDCQ4KjXF/0w
         BCAAjucCktB9H8NSXkpvHAmEL1XJwvwUFLMLLRzaxXoJbJ0rdHFELeBB1H0/QLAyg9lC
         x37RzyCDuNU85uib3bzLNEpToWUgpOT2r8PjdjL1OwnRPk3Fi+Q48nWlCHPoaDFLAdH5
         DgvMF5f8xHiC0zOYDUMStxkzbvE9NKq+KcnYsisRk05Th0ZopDivoVVSf2Nwj9C/Gtvl
         aTmw==
X-Forwarded-Encrypted: i=1; AJvYcCUbGQs1qBQedJGYc6JkiFRh99f32TSlHAGZr+x+1XYLAEXTEsZmEVc6KqcOPhVUvShKrHWVkzt+e6YUR6XRPzPcQzHH+rfEbxJ5Rua1zfs32SRKAfPdGDmL3j2tpc8NrS0=
X-Gm-Message-State: AOJu0YyL8G5oyuKNb/bLaA0v9c22oL/LT/TqAv0A9o7adzgW6V390D0R
	uXp70J8tx1qv6nTVrZEWanYcW6DFJbvUSAfTqHZavNNrXEA08mcASboZ90MS4MY=
X-Google-Smtp-Source: AGHT+IGCvmUPQBtXZdf0eTSh1qwMFFR0Jr8jmoBU+H48AqkurfyzUC/Unq+m/GNPBVYjxvY+PnGGcw==
X-Received: by 2002:a17:907:1608:b0:a7d:cf4f:1820 with SMTP id a640c23a62f3a-a7dcf4f1a9dmr699661166b.69.1723018218699;
        Wed, 07 Aug 2024 01:10:18 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d433e8sm616840266b.135.2024.08.07.01.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Aug 2024 01:10:18 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5af51684d52so1781348a12.1;
        Wed, 07 Aug 2024 01:10:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWswvCLtFfY08StZGKQvvANPlJlG7w4l0zHqBbxogVG36QGWW0VeJrdEFI2IvS9fucaxCSbtSESn/SKGNu7oWggTEYgkjdAA0bvZL+8HA0Q1ldoMbCfSwfVv9gKpAxrUVY=
X-Received: by 2002:aa7:d15a:0:b0:5a7:464a:ab9 with SMTP id
 4fb4d7f45d1cf-5b7f40a4cd3mr10589275a12.21.1723018218098; Wed, 07 Aug 2024
 01:10:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240803-brcmfmac_pmksa_del_ssid-v1-1-4e85f19135e1@jannau.net>
In-Reply-To: <20240803-brcmfmac_pmksa_del_ssid-v1-1-4e85f19135e1@jannau.net>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 7 Aug 2024 04:09:41 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_=R_SXXsu6PGT=fBpAO33Usw4YDLEW4EyyyFtsFzdszQ@mail.gmail.com>
Message-ID: <CAEg-Je_=R_SXXsu6PGT=fBpAO33Usw4YDLEW4EyyyFtsFzdszQ@mail.gmail.com>
Subject: Re: [PATCH] wifi: brcmfmac: cfg80211: Handle SSID based pmksa deletion
To: Janne Grunau <j@jannau.net>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, Kalle Valo <kvalo@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 3, 2024 at 3:53=E2=80=AFPM Janne Grunau via B4 Relay
<devnull+j.jannau.net@kernel.org> wrote:
>
> From: Janne Grunau <j@jannau.net>
>
> wpa_supplicant 2.11 sends since 1efdba5fdc2c ("Handle PMKSA flush in the
> driver for SAE/OWE offload cases") SSID based PMKSA del commands.
> brcmfmac is not prepared and tries to dereference the NULL bssid and
> pmkid pointers in cfg80211_pmksa. PMKID_V3 operations support SSID based
> updates so copy the SSID.
>
> Fixes: a96202acaea4 ("wifi: brcmfmac: cfg80211: Add support for PMKID_V3 =
operations")
> Cc: stable@vger.kernel.org
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 13 +++++++=
+++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c =
b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> index 5fe0e671ecb3..826b768196e2 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
> @@ -4320,9 +4320,16 @@ brcmf_pmksa_v3_op(struct brcmf_if *ifp, struct cfg=
80211_pmksa *pmksa,
>                 /* Single PMK operation */
>                 pmk_op->count =3D cpu_to_le16(1);
>                 length +=3D sizeof(struct brcmf_pmksa_v3);
> -               memcpy(pmk_op->pmk[0].bssid, pmksa->bssid, ETH_ALEN);
> -               memcpy(pmk_op->pmk[0].pmkid, pmksa->pmkid, WLAN_PMKID_LEN=
);
> -               pmk_op->pmk[0].pmkid_len =3D WLAN_PMKID_LEN;
> +               if (pmksa->bssid)
> +                       memcpy(pmk_op->pmk[0].bssid, pmksa->bssid, ETH_AL=
EN);
> +               if (pmksa->pmkid) {
> +                       memcpy(pmk_op->pmk[0].pmkid, pmksa->pmkid, WLAN_P=
MKID_LEN);
> +                       pmk_op->pmk[0].pmkid_len =3D WLAN_PMKID_LEN;
> +               }
> +               if (pmksa->ssid && pmksa->ssid_len) {
> +                       memcpy(pmk_op->pmk[0].ssid.SSID, pmksa->ssid, pmk=
sa->ssid_len);
> +                       pmk_op->pmk[0].ssid.SSID_len =3D pmksa->ssid_len;
> +               }
>                 pmk_op->pmk[0].time_left =3D cpu_to_le32(alive ? BRCMF_PM=
KSA_NO_EXPIRY : 0);
>         }
>
>
> ---
> base-commit: 0c3836482481200ead7b416ca80c68a29cfdaabd
> change-id: 20240803-brcmfmac_pmksa_del_ssid-3c35efe35330
>

This looks reasonable to me and works on my Macs.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
