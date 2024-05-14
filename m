Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39360ED8
	for <asahi@lists.linux.dev>; Tue, 14 May 2024 01:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715649347; cv=none; b=bwORoAW3dtD+7JqWcjMpJ6bOzVrCkM44TeXLhTmw+k98xz6TrPgDOumBCgnE8h/VmkMV/s7f6g6vSto3NwlQ9oYuDIM0xCSur+99lB/1OGJ8TNiCpZnkYxSXqVx0ELxWe1N0GBrHOg2kb9mv++Um/Xd+fnmSwgW4Xg2UbLEq3AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715649347; c=relaxed/simple;
	bh=0g4t4jn+4E1si8A6H6w8IGJTK/A0udZy64us43YP3A8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wyeijc+Uiq5r9vk5zse4kfcngpBfQ5oYZ62mNnqHww8g3BBBvOuovpLyk4EHkwMeJk+tSmG4uAddu27zY2y24h6Tzlb+q2aTdUZXVAlL7GW3kRnl7tNpBoGgxC47Uykxg5quKcYjaCC834P38z9kAlSlXbwnVthS3S5X7F2oUoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-34db6a299b2so4177235f8f.3
        for <asahi@lists.linux.dev>; Mon, 13 May 2024 18:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715649343; x=1716254143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2RnPvnmbVp/k4BkATtYCJhVJdOKpdPbSZG9RJRPJ5Zw=;
        b=OMN55gbEGF817Wd6gXwSFMVawl+mqFK30UGKoyl2cI/vtCq3HEHfpSdeSOYcFdwX2x
         TQ7T1JNyVWHoeQrA7na/2/LpX2tVgaI2ZmFz+YfUSYpi+vQZacV7I6A0PVs9REa4QjLk
         dX7IQrTQNOdF/buhFVZj0y+c1k8qaTynno7TOtyT4t6cVloJeKqs908LJn0V0D+gycEp
         PMAHR94MrjjHkzfggqeoAbC/k2oBXzjVgdyZ9yPMAHYWW6NfG3T42LQRM6+i1aSJ9nts
         DGd7w2mz7zAeIbvVy8iUlYWiJTJvSdrAt4umgEuBc72MSb2PXFKe6caOUwPSoSB5DAvu
         ahSg==
X-Forwarded-Encrypted: i=1; AJvYcCUmimMEUzaCbQoS9HTh3QgkRkJxfAN3AOX4FDWxuewUc9xmSU0mlhwXz0W95wH/2OarB3sjYYdhqbNDmaG/Z7z+QlgT/2I=
X-Gm-Message-State: AOJu0Yz708w8TP9YqrSJA0xl2HGGNyPjlmMVh0mXOq3s5gPxZtl3oVnf
	/nRtMa3U4rkCIA71wGCDpvapKV3afZ/5AtB+rloKVuY02NEfzywtRf1lSBNWAt0=
X-Google-Smtp-Source: AGHT+IEYQQ7n/z1C1dbskl++lQMEFqvXeljW4LCsD85g7SwcowAoF9NQlg4njVd5LayOreSQvRyq7w==
X-Received: by 2002:adf:ed08:0:b0:34c:e52f:89ee with SMTP id ffacd0b85a97d-3504a9688fbmr8724478f8f.53.1715649343178;
        Mon, 13 May 2024 18:15:43 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a7b53fc8fsm67004566b.38.2024.05.13.18.15.42
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 18:15:42 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59b097b202so1074241166b.0
        for <asahi@lists.linux.dev>; Mon, 13 May 2024 18:15:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWG0QBK7L3F/vvze0Rl+Fo3l9F7csJKoClWenAZNZvu7PkiRBuLLC1bq30sPXI4noYBBcj3AdW15mjM3pc32U9RPobOy4=
X-Received: by 2002:a17:906:1992:b0:a59:b359:3e14 with SMTP id
 a640c23a62f3a-a5a2d5356d3mr774515066b.10.1715649342335; Mon, 13 May 2024
 18:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240512-btfix-msgid-v1-0-ab1bd938a7f4@svenpeter.dev> <20240512-btfix-msgid-v1-2-ab1bd938a7f4@svenpeter.dev>
In-Reply-To: <20240512-btfix-msgid-v1-2-ab1bd938a7f4@svenpeter.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 13 May 2024 19:15:05 -0600
X-Gmail-Original-Message-ID: <CAEg-Je-eOMyKzEVhcTsipRyoZ1GD1JvVTjsX3=NPzNKJ3Vsx3Q@mail.gmail.com>
Message-ID: <CAEg-Je-eOMyKzEVhcTsipRyoZ1GD1JvVTjsX3=NPzNKJ3Vsx3Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] Bluetooth: hci_bcm4377: Fix msgid release
To: sven@svenpeter.dev
Cc: Hector Martin <marcan@marcan.st>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 12, 2024 at 6:12=E2=80=AFAM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:
>
> From: Hector Martin <marcan@marcan.st>
>
> We are releasing a single msgid, so the order argument to
> bitmap_release_region must be zero.
>
> Fixes: 8a06127602de ("Bluetooth: hci_bcm4377: Add new driver for BCM4377 =
PCIe boards")
> Cc: stable@vger.kernel.org
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Reviewed-by: Sven Peter <sven@svenpeter.dev>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  drivers/bluetooth/hci_bcm4377.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4=
377.c
> index 5b818a0e33d6..92d734f02e00 100644
> --- a/drivers/bluetooth/hci_bcm4377.c
> +++ b/drivers/bluetooth/hci_bcm4377.c
> @@ -717,7 +717,7 @@ static void bcm4377_handle_ack(struct bcm4377_data *b=
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
> --
> 2.34.1

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
