Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F3410A37
	for <asahi@lists.linux.dev>; Tue, 31 Oct 2023 00:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-507d7b73b74so7014846e87.3
        for <asahi@lists.linux.dev>; Mon, 30 Oct 2023 17:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698710455; x=1699315255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZVJKfi+PzDUAtiv1q8ocAV1+Plo8zxDJySpo+IH4+c=;
        b=hOoA/YuMDNqfOchMDohkfYqWmmdvM1zUjWYHGjIwEkMNeWhmGkGnBGlhUAtFt1L0R2
         tlh9sQ5V93dEk+5NijJJclqzcES8jf7ccGQFUxLIdQr31UOi1Mfg/a3pdPRbs+uLXBCk
         ZEX2CJOs/k1csG63KqdfTk5ItMagaKj/TQRyQhWysl5epqBXET+FKxFynas//P+b9wXg
         t30rhgLNfksLVhM6x+AdGh29rDT/Fke4wx49Dq7rg3C7UXmwbuka5cnhv4K+cj8RtWYe
         X5ZYFqOdqjdbn1MqZKEEVhfpwpgU0xLxJ3NYx35/bPNLFn/saHq8X7WWwBpnDkvmSyWJ
         5EJw==
X-Gm-Message-State: AOJu0YyNKJ+GxOCnE4yt+u7VLhfdSC2hNpqxj3ESfMrAypLlXsnzGKwE
	4ALnyasVz+F60bnoKvsHeqc4h5ChyxLCW2fR
X-Google-Smtp-Source: AGHT+IEaFmxTbhWcEYVCf7JDKDp+KAguFbZobn/lWLus3tToCKlLnIdlDKLwr3eKowEf91AfJE8D0g==
X-Received: by 2002:a19:2d02:0:b0:508:12f4:dc9a with SMTP id k2-20020a192d02000000b0050812f4dc9amr7850043lfj.67.1698710454383;
        Mon, 30 Oct 2023 17:00:54 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id g26-20020a056402181a00b0053e8f1f79afsm168478edy.30.2023.10.30.17.00.53
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 17:00:53 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9c2a0725825so814494466b.2
        for <asahi@lists.linux.dev>; Mon, 30 Oct 2023 17:00:53 -0700 (PDT)
X-Received: by 2002:a17:907:8f0d:b0:9bf:5771:a8cf with SMTP id
 wg13-20020a1709078f0d00b009bf5771a8cfmr6271380ejc.70.1698710453646; Mon, 30
 Oct 2023 17:00:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231030142620.818663-2-robh@kernel.org>
In-Reply-To: <20231030142620.818663-2-robh@kernel.org>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 30 Oct 2023 20:00:16 -0400
X-Gmail-Original-Message-ID: <CAEg-Je9CsN2-GYL9hnwwYhX=B8P-M1tZfmdrQNrWtGOMTWiChA@mail.gmail.com>
Message-ID: <CAEg-Je9CsN2-GYL9hnwwYhX=B8P-M1tZfmdrQNrWtGOMTWiChA@mail.gmail.com>
Subject: Re: [RESEND PATCH] soc: apple: mailbox: Add explicit include of platform_device.h
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 30, 2023 at 10:27=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other and pull in various other headers. In
> preparation to fix this, adjust the includes for what is actually needed.
>
> platform_device.h is implicitly included by of_platform.h, but that's goi=
ng
> to be removed.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> Note this was added in the merge window and missed the last round.
>
> Arnd, Can you apply this directly.
>
> ---
>  drivers/soc/apple/mailbox.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/soc/apple/mailbox.c b/drivers/soc/apple/mailbox.c
> index 0cbd172f435e..780199bf351e 100644
> --- a/drivers/soc/apple/mailbox.c
> +++ b/drivers/soc/apple/mailbox.c
> @@ -26,6 +26,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/spinlock.h>
>  #include <linux/types.h>
> --
> 2.42.0
>
>

Pretty obvious patch.

Reviewed-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
