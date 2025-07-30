Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22C212B73;
	Wed, 30 Jul 2025 11:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753875691; cv=none; b=dPMvqJDrYUn9E5dZaNi27+aO/nxZtdne7Bh1f4ws6vX6RPSw+qBt3+ApBbvzUwJfCyBDrkck2TWkkRys1+Kv4n/HsVsMaukvePICacfuE87Qk2/WgRcYPeI1v5jvRwgusjPlNIlrqc8v11f19dUuDQZcQVAboku7MgIyoRttk9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753875691; c=relaxed/simple;
	bh=Q+yabLyIW7uC1xqhnObba1fTmUcHSjCC07MPdQrhtrI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJf0zsUTRdSXSD4MN/2ckKHqoPa4Q/4XrcdzQrwlYdRRrB9nFoqClJahrMz5Rt6Y4Kgo+3bFrpGTNNko8BNdhN2WfPC6Qfz8oGLXfICwQ5qS4A5qhM9LpyP4ZU9GaUWrjEv4kdXJ0VQoQLYPR8uprzfAMGN19Gs69De5LRJ1/PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-87c241da47dso207094139f.3;
        Wed, 30 Jul 2025 04:41:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753875689; x=1754480489;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nW9Fed3oaCcY5j8zAXTzmhRy4s/lDYERKz+lZhw5SjM=;
        b=HQthWLsHLewLgQTifuWRi3xjNuBfxYDjtXv9UhjiGoda2uTX4HoH0yz7Ii+PUBcwZj
         UVkWhBDxaXRzVy/C/FQtt/zicLq+qOT6D6myAqaq9+YuC7VMtW8NNaGc8lt+ru7MnrE6
         ALsBM/F/PZcjwKBh5Ra/CgsxYfVF2EftKt8GXt5IWc/5g5cqMF5TH8KPsnDrfxC0LTOm
         Y/pn+Wn3/zUMrMR0KmWFh3zoO9lQDrqjKStaCYgg/UjfUpT9AbGcXErilt8ZOk3gjGAY
         gvH7atvd7sWiI3X98hy4QvTKGHbAOHFMSG/m9Gw8ZJsvQuef/kLGx4uNZHBcSVIG7c0G
         aYQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDzWYuUaPvvAURlojSWhM2YSPxRIyFK1fpHLizDK1mLcvn7OxNGWRVPwpX1YbXDYtnjIX/RQ==@lists.linux.dev, AJvYcCW1jmSeQphTEJXzgMszkzcJkJ1S/O7j5+0PlOykDHfw38qCcUfvv9ot7GoSPBcKucqy5Ya/INKE2qMKiYY=@lists.linux.dev, AJvYcCW8ayUKW7FZeXUsWD2hQQhEQsH8cv+SWjWvUIUHh9kOK3Ui2vtIo9/7iyNX0g3E/KATHdqi@lists.linux.dev
X-Gm-Message-State: AOJu0YycIz91AlFkx9h1XzjwEAbxlUXx0Ivn/NOhBBrZw80iGoff3wCg
	D6hc6CcEbCpT33hqBlen9+LpZ/p9ZaDX8ghaP8fezMslUNqKacTbVVsSrzYYBX1kfn4=
X-Gm-Gg: ASbGncv6o7xDmSKAsWdZHxrx8kNFRyeARdD584LnyVd8LO2f9U6tpYtAYvgC67kpfIA
	P+T3F8e7y62BRaDv0EaxnXvJLqrVyjWf0zp6e2PD4FFud4mjv8INiy/wTrfL2uq6GhJXZm6SU2C
	2LDqqqFckJgN3/zs9T5HWM+Q6pSfnQ9WKF7nUP8PsXH+x8uUf/xjGt4T0CvlA6jrG1duzNebnnC
	93CUDfrLpDwyUhvHo41NIaDrEBk3DxSAn3ZG4I09easy9so1IAiK4MQ5YfOEaqnpFFkwJfSgf8x
	VrncALnPtblb4jpgMdjwdvNs4GPHC5KaOdhGt8eRO3pQ6sA0y6DqLQxL0/ZUgbG5CNqt5uPkgxt
	VhC9DqVKUktytBIBFHYBcHytDA1FmLQ1dpqRbtAg5YoguAsesJupdUfQXa9avHaLkqC8eTHpSgT
	A=
X-Google-Smtp-Source: AGHT+IHr/hv7p0aFh7X56jny2EszDcxB1sF41n/SGyCbqmuDqNulJO4TS99/31Peh8ntjeRwM3cWsQ==
X-Received: by 2002:a05:6602:1d19:b0:87c:3417:cc11 with SMTP id ca18e2360f4ac-881374d12d2mr453434439f.1.1753875688595;
        Wed, 30 Jul 2025 04:41:28 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com. [209.85.166.181])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a29612sm256873039f.24.2025.07.30.04.41.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 04:41:28 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3e3d238b3a7so50552135ab.0;
        Wed, 30 Jul 2025 04:41:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhv1ptrw5+EtOO6Qie8f1q+wrgSx3qGJ/nrmcaNBOXIU8cQV9uEfxfVkZGvxZop6s4F+bs@lists.linux.dev, AJvYcCXEN4Jxx4uQ0BCIsMZIRNdcSiZa4kZUFdimBeONh9NOlZ6sDxkeey4VryXs4DmCPkFHd37TtOMhMNyJiQo=@lists.linux.dev, AJvYcCXL9rHr6YxBt1QIJGEc/UTHsaUDYYZJXvtHz0kKpD/uFsAZ3dk1QYUeQSA10CMWbKzRls/cLQ==@lists.linux.dev
X-Received: by 2002:a05:6102:418b:b0:4c5:4591:ffda with SMTP id
 ada2fe7eead31-4fbe87b425emr1711001137.21.1753875189085; Wed, 30 Jul 2025
 04:33:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730-topic-dma_genise_cookie-v1-0-b505c1238f9f@oss.qualcomm.com>
 <20250730-topic-dma_genise_cookie-v1-3-b505c1238f9f@oss.qualcomm.com>
In-Reply-To: <20250730-topic-dma_genise_cookie-v1-3-b505c1238f9f@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 30 Jul 2025 13:32:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV0JO=qtregrrHsBZ-6tpNdPUj3G1_LWRfRsj0vBb+qyw@mail.gmail.com>
X-Gm-Features: Ac12FXwFObS4veqAcz-kMArtfpOLnucchkvqP_CejUTAp0AxApTTYboaikMMzJA
Message-ID: <CAMuHMdV0JO=qtregrrHsBZ-6tpNdPUj3G1_LWRfRsj0vBb+qyw@mail.gmail.com>
Subject: Re: [PATCH RFC 3/6] dmaengine: qcom: gpi: Accept protocol ID hints
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Paul Cercueil <paul@crapouillou.net>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Viresh Kumar <vireshk@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Frank Li <Frank.Li@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>, Viken Dadhaniya <quic_vdadhani@quicinc.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Konrad,

On Wed, 30 Jul 2025 at 11:35, Konrad Dybcio <konradybcio@kernel.org> wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> Client drivers may now pass hints to dmaengine drivers. GPI DMA's only
> consumers (GENI SEs) need to pass a protocol (I2C, I3C, SPI, etc.) ID
> to the DMA engine driver, for it to take different actions.
>
> Currently, that's done through passing that ID through device tree,
> with each Serial Engine expressed NUM_PROTOCOL times, resulting in
> terrible dt-bindings that are full of useless copypasta.
>
> To help get rid of that, accept the driver cookie instead, while
> keeping backwards compatibility.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for your patch!

> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -2145,7 +2151,8 @@ static struct dma_chan *gpi_of_dma_xlate(struct of_phandle_args *args,
>         }
>
>         gchan->seid = seid;
> -       gchan->protocol = args->args[2];
> +       /* The protocol ID is in the teens range, simply ignore the higher bits */
> +       gchan->protocol = (u32)((u64)proto);

A single cast "(uintptr_t)" should be sufficient.
Casing the pointer to u64 on 32-bit may trigger:

    warning: cast from pointer to integer of different size
[-Wpointer-to-int-cast]

>
>         return dma_get_slave_channel(&gchan->vc.chan);
>  }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
