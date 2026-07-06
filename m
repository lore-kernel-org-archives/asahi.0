Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36863E8323
	for <asahi@lists.linux.dev>; Mon,  6 Jul 2026 08:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325263; cv=none; b=D5YYDmkDMIrBr8iIOeXfXkXKr4DLclmH3Bkf19Nz4uif/Mdgmn+PdkZ8oEmoTyFxBpWeaKKwG0KcJLGCqAKFSIoUduOHlJ4TB0SLJR/lHZwCYiA5Lyh3LjFFS35jzwPS4YvmiPzlPEhwv+hZ/pUmL+aq7vaLRS2tlmXFAt56YkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325263; c=relaxed/simple;
	bh=6FRXXocn1lfRgJnxiPkpYYSBB5w4wnBEBhNnIuipX2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bneTaz//iqFN6VK11bnE5/JFK2GzqO8w2xcU4YS1ZgdDDDnKyMFaMclVAvz7YP3QUXi1Ny53G1qOWPgdsXwpHDuQ1ouqJ3ZBIYdIOIGPC5OcXInHYvpBzkQVTptlyQL0ijuIPEeEEgeczIgkUKUDo9bQpLH0v1+YRgH99WJrCcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5bdb162ee53so2026842e0c.2
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 01:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325253; x=1783930053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xlcdnSGCAGaaD3Qtz41jPpd7wkV1TEYjW94sOKYd3zY=;
        b=q9yEIKPjsO0xrsV+Xi4PNTHhdsMUdQmkAgoCdpUV+joFxWjw+DhjREiji+UzfLHwhQ
         8ET/rNshkGPFwSxNt91a2dFIt+GhsFUqZHzHskkrXmsQvg1jgTh6C83M0m24MiwmigsC
         xXoR6QnBN0ps9qcXrRxT7TwgxaBiar8EwBF+aBF0qhoekamkXr0lsJV9uFEDGT19GvKg
         JHmia3K2BD0YyZm4HyA0S7RgPWu7uCwK+5hvAruQ8iCWSL4xcRBLfrceVPAEPwhWTgiK
         t2N+HVvBkggTJS2cDmI4YL3mNoOiZFsirZEeQUCKAV5iaa283YaA438kVWtjXBKNuhIw
         0kAA==
X-Forwarded-Encrypted: i=1; AHgh+RptsIw/2octYPFm3/T2dBIWY0ftul5tD9a+b0j9+TSCH9u92u1Xy7SRZ8YccK+5Fys+nXzTPg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh1RBTIa0nbM0VXeb+mBaslLvJz89EbKBP+1+QfZd6/Vy7n4ig
	4eycjf6FrTYJRb72RVJ8j+2CazFHHyqnv4KRJzLtdAK4ktHSNNW0JLWVTvunc1Cn
X-Gm-Gg: AfdE7clCkVIvsGo08UfKTHvuLTc8TZ2dlOiH78eithBOWRBZkpdJNzjpsLkzXfm87bb
	3mXzmtAn/25d+lH9SDW5S1w7ps52SiuFwVwRAt5CtB1X6v/i0Q+RTjs9Ht4RIxDtIqNUefaGSve
	dxp6gVJ6WnClG7ga5GKDA8g4PzukrzpAVnFdrkixjHW2IFO2NSXGnrIojn1Wm5nG/Ixjpeicnhn
	IkDvJ7teGhpSIjD2pZLkZbkkewh/MHkAa46On8hxAYFoWkXrHqi6tzxE/d+lakVSD/CJhKM0+rl
	yQAxqU94UTnHFog4lXK4j/J+ZRiuuBC9A144Cp1q/g88IfuUA7RHpfypoiUo8Y7jKC9a60xvFqz
	D1Gha/xWhXaGcEOwZBlMVJx9SEK7F8XV8GlNrHVRTPGKHeXUx4Dauc4gnQKIRccW5sjwTTfstAG
	k5C6zYN0rXQaRma78TQSYBVAXS9jLE5yYY9URTxAi83MnT4U2oxByQnvcOTUlUSkWE
X-Received: by 2002:a05:6122:3107:b0:59e:f727:4bb4 with SMTP id 71dfb90a1353d-5be10121628mr3407842e0c.1.1783325252928;
        Mon, 06 Jul 2026 01:07:32 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5be02c0b1aesm4454985e0c.11.2026.07.06.01.07.32
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:07:32 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59c9b666822so2322063e0c.3
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 01:07:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpDXy2btPXG27RQLiGCL5q55pF0P90teCej1vHOXW//H85ulE5L1Em8pQ84N4iyjaPeIVGT0Q==@lists.linux.dev
X-Received: by 2002:a05:6102:800d:b0:722:826e:1423 with SMTP id
 ada2fe7eead31-7427f0478a0mr3286706137.20.1783324855096; Mon, 06 Jul 2026
 01:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783263835.git.ukleinek@kernel.org> <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
In-Reply-To: <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 10:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
X-Gm-Features: AVVi8CfQACxAMot5VlqKHI6FXvkOZpEWhTZp1dlkgWSruFHOk1f-I-dS5kVo31s
Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Michael Walle <mwalle@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Alexey Charkov <alchark@gmail.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 5 Jul 2026 at 17:14, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>  - Use a single space in a of_device_id array terminator; A single space
>    after the opening { and before the closing } in non-empty
>    initializers;
>  - No comma after an array terminator;
>  - Also no trailing comma after a named initializer iff the
>    closing } is on the same line;
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

>  drivers/pwm/pwm-rcar.c            |  4 ++--
>  drivers/pwm/pwm-renesas-tpu.c     | 10 +++++-----
>  drivers/pwm/pwm-rzg2l-gpt.c       |  2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
