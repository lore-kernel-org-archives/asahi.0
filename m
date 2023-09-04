Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408147FE
	for <asahi@lists.linux.dev>; Mon,  4 Sep 2023 05:46:31 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-50079d148aeso1737614e87.3
        for <asahi@lists.linux.dev>; Sun, 03 Sep 2023 22:46:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693806390; x=1694411190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSlS5Nn7/93tzc5hw6/561afVbIZPCAbfsDHLo7s/EE=;
        b=PN0rPotXGQ/LF8v0PLvPr7uecuSCbkRqIa2VTDw4lW4D/+IDIc1AwkbsVK+C4oXNgi
         T2LWyy7+7dI6xBDUw0cWvr8pnCY+OHkdPDkdtbG1uLM7+w+wiwKLVTlSZSxvfX49Q7VM
         BjHZrRVXPFi+6S94ytmSIkCajnXggyEWqrdvCgaEwb4VSrqgn2dz3lNli5N7Xg97fhED
         JXG4946LZpPyKQT62hsuyKFcuzKPbfof5tOyMENK+iRtDpJ/yqdcYbmJ9e3KePMFbm9y
         UMR7IJPQj3UcyY0G57OITiWDqbyjl+vb7VASke4xS4+Z9Bb/VzzAxJXHasXdRE5GFU/V
         Z+Ow==
X-Gm-Message-State: AOJu0YzTdUk6WKx2aviX6CV2L2GhdPz4YkvHrB00GRcdgPNVgGwSdBcY
	LxnVVahx9yCQSeYAWF3KkaSEI9jc2pAMog==
X-Google-Smtp-Source: AGHT+IFH+E2ntUoTjSOZQ5Rh5RFCpXWdGfWgWHFPLYZtjqBfL7k+slF90NK4RKWkJGsUui2d1MYTEw==
X-Received: by 2002:a05:6512:3ca0:b0:4f8:e4e9:499e with SMTP id h32-20020a0565123ca000b004f8e4e9499emr7337080lfv.12.1693806389400;
        Sun, 03 Sep 2023 22:46:29 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id m22-20020a195216000000b004fb745fd22fsm1517421lfb.32.2023.09.03.22.46.29
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 22:46:29 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2bcc14ea414so15328911fa.0
        for <asahi@lists.linux.dev>; Sun, 03 Sep 2023 22:46:29 -0700 (PDT)
X-Received: by 2002:a19:500f:0:b0:500:b553:c09e with SMTP id
 e15-20020a19500f000000b00500b553c09emr5025415lfb.32.1693806388886; Sun, 03
 Sep 2023 22:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230828170013.75820-1-povik+lin@cutebit.org>
In-Reply-To: <20230828170013.75820-1-povik+lin@cutebit.org>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 4 Sep 2023 01:45:52 -0400
X-Gmail-Original-Message-ID: <CAEg-Je8_f_hZ3VyBg+8tK8uobWNaEqCwp==2JhV6jVpPYXj_Pg@mail.gmail.com>
Message-ID: <CAEg-Je8_f_hZ3VyBg+8tK8uobWNaEqCwp==2JhV6jVpPYXj_Pg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Apple SIO driver
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	asahi@lists.linux.dev, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2023 at 1:00=E2=80=AFPM Martin Povi=C5=A1er <povik+lin@cute=
bit.org> wrote:
>
> Hi all,
>
> see attached a driver for the SIO coprocessor found on recent Apple
> SoCs. This coprocessor provides general DMA services, it can feed
> many peripherals but so far it seems it will only be useful for
> audio output over HDMI/DisplayPort. So the driver here only supports
> the DMA_CYCLIC mode of transactions with the focus being on audio.
> There's a downstream prototype ALSA driver the DMA driver is being
> tested against.
>
> Some of the boilerplate code in implementing the dmaengine interface
> was lifted from apple-admac.c. Among other things these two drivers
> have in common that they implement the DMA_CYCLIC regime on top of
> hardware/coprocessor layer supporting linear transactions only.
>
> The binding schema saw two RFC rounds before and has a reviewed-by
> from Rob.
> https://lore.kernel.org/asahi/167693643966.613996.10372170526471864080.ro=
bh@kernel.org
>
> Best regards,
> Martin
>
> --
>
> Changes since v1:
> https://lore.kernel.org/asahi/20230712133806.4450-1-povik+lin@cutebit.org=
/T/#t
>  - move to using virt-dma
>  - drop redundant cookie field from `sio_tx`
>  - use DECLARE_BITMAP for `allocated` in sio_tagdata
>
> Martin Povi=C5=A1er (2):
>   dt-bindings: dma: apple,sio: Add schema
>   dmaengine: apple-sio: Add Apple SIO driver
>
>  .../devicetree/bindings/dma/apple,sio.yaml    | 111 +++
>  MAINTAINERS                                   |   2 +
>  drivers/dma/Kconfig                           |  11 +
>  drivers/dma/Makefile                          |   1 +
>  drivers/dma/apple-sio.c                       | 868 ++++++++++++++++++
>  5 files changed, 993 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/apple,sio.yaml
>  create mode 100644 drivers/dma/apple-sio.c
>
> --
> 2.38.3
>
>

Series looks reasonable to me, though this is something I'm more new
at looking at...

Acked-by: Neal Gompa <neal@gompa.dev>


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!
