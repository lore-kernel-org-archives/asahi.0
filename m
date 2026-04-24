Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A676F2D248B
	for <asahi@lists.linux.dev>; Fri, 24 Apr 2026 07:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777017378; cv=none; b=odWG5fH6Q90PWw5OH/eVXYyGVoQYoIIwl/e+n6pbFgbfAY/dhLWlucBVEUbJP55tNurQMRbwBhMX+27UIRnSHzEgqv0Hm9uejpuR/DtArAlSCQP3Oq+K87pdelRemIuyDI+Ngbwz3XJFiTVepcW3RvbE8xEj7vNogeh4Ej+73Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777017378; c=relaxed/simple;
	bh=BZaZ3g7ZBPkjQoz8nLCka6ZxevyTyp8FYNkCXs7p8Ww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggXnuDxDzoehT/mWtoTImKK5KM3/WV9NJv1nze8I8daBEhGarfZQrgxat4Oe4dkGQrnk27NuMeRT1Kpt5CEi/oxsaJQ3/SDeUxoYxQq5En0dL+wRvTVoYMopsiocleO0BoIAXob1rL+pF5KD5vVJJteuGRRFdgTEqJBG8oUyg2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-42c0b0ffac1so2664311fac.2
        for <asahi@lists.linux.dev>; Fri, 24 Apr 2026 00:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777017376; x=1777622176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+k21mzy1Q8IyL290m/XCuURamP2UyoHvl1hWQE5Pk/w=;
        b=Q/FXE4JayU5lDngOfK8BBgwUGCaneXyz8rm7Wlf+rqCO6Tt4aCPmA6Vi8Ta35dkq4B
         mkPLN1dRiWJrdiL7lMwQI4xq9auAY53M05ugTx8jz3tmTlgLoDjyU9Qf49ybJeRrNYjW
         6LqRaIInktCqV/lwB7Roo/dBKtQeGJGft4bX0inLjkp6Wx7m6UGZVqCXysBGBmwKP8Iv
         toyY3M68NvaLtmGUMhqqBTUGlmoL3/gHmNzxwVXYDlpnNljC1mAw9lo2nphZl9IFllAa
         poZ+/hKgugSWct41aMVAzOVHynCw27ugq9b0tZ5EkEfR2xFwcrRg5IMlttj3ZHtycMQh
         VP/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+/1HSQcQRbyKWOKiT71voOtZ3kj8XhqjlH/CKmTH/ocNGrhFRXWsJlr7UEH+7XezUh8WlKmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwExOWf/Txl0PBcrqCZaLBFEpTI1KwqvxtQ4NX9g4CiyxXkLLNk
	8wVo9pBwEFuyL5CNFkxUBf8okwS8z8QHaJM3FxSFd5Wcv1RHFi22h7GkTBqlL8r6Muo=
X-Gm-Gg: AeBDiesYEQwaqHPuC1phVML19FOmAPItxP7p4pIRU+TKgihrlASHRaK90Z4ZWtlgo/c
	9fO8HF7X03IPf3W8EmRpWfQe1TXEusr36IU3PGwxqJs/VAfkzhawLmYuALYZ2F7B8K2nlwENdBh
	rOZPuQatuI28cM+YaZcL3dgi5RpS07T/A0Bq7lm2iXNBcsTVVThm/uAcBiWrv+gGALuoyFucbj/
	3Xv88EFN2/4k61SLg3QjJi/mdQHzjEsvhILU8p1C8VXnA8Mqyq212stqWHQX9whYy4cA+mfh8ie
	IngiaCsLJkoKN7RfT5oH+btEBnzD19Ur85zgM8Zgo9cZvJTyXScg5LVZ3tVyeq5GOu/Uyx+Nkv/
	sl2DT3tjzCb3zGqIx1AUa5QG6KtAbA0WLb5yEkNwn5ZbYn2tAq1K1YW7B3GOqb+dOafzyf21eiV
	t5mkXaEvPCXq6HCRLsJvTJtMvKesrU49jVYVUp72Cu4CQzSH0yid11uCl6vymgJSUWGUkCzXU=
X-Received: by 2002:a05:6870:8a07:b0:417:ab68:fbaf with SMTP id 586e51a60fabf-42adecd155dmr17749069fac.20.1777017376594;
        Fri, 24 Apr 2026 00:56:16 -0700 (PDT)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com. [209.85.161.47])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b934a2e8esm21120250fac.10.2026.04.24.00.56.15
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:56:16 -0700 (PDT)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-67c22b05346so3919990eaf.2
        for <asahi@lists.linux.dev>; Fri, 24 Apr 2026 00:56:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8mgO+d4LP41PLVIrux/a/MDG0lAK5fHxIbYg9kcHNTvyngq4kl8+Blrm2npkkf86rnH7KBsg==@lists.linux.dev
X-Received: by 2002:a05:6102:38cb:b0:5e8:1d93:921a with SMTP id
 ada2fe7eead31-616f772e968mr14645934137.15.1777017023068; Fri, 24 Apr 2026
 00:50:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260423-drm-bridge-connector-attach_encoder-v2-0-2ae6ca69b390@bootlin.com>
 <20260423115550.444930-7-luca.ceresoli@bootlin.com>
In-Reply-To: <20260423115550.444930-7-luca.ceresoli@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 09:50:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVbEV0b+MwCjqyc9Q0EjasD2hoN0rqWtjfmPPotZ19Lrw@mail.gmail.com>
X-Gm-Features: AQROBzASdrVB_Aky8lNaIViGqa4fIOoRKTkBEjNLF-nFJbKyYgy5oQezNNnYjKM
Message-ID: <CAMuHMdVbEV0b+MwCjqyc9Q0EjasD2hoN0rqWtjfmPPotZ19Lrw@mail.gmail.com>
Subject: Re: [PATCH v2 41/41] drm: renesas: shmobile: remove now-redundant
 call to drm_connector_attach_encoder()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, Liu Ying <victor.liu@nxp.com>, 
	Douglas Anderson <dianders@chromium.org>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jingoo Han <jingoohan1@gmail.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Jyri Sarha <jyri.sarha@iki.fi>, Michal Simek <michal.simek@amd.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Luca,

On Thu, 23 Apr 2026 at 13:59, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> shmob_drm_connector_create() can init the connector in two ways, based on
> the 'if (sdev->pdata)':
>
>  1. manually in shmob_drm_connector_create(), or
>  2. delegating to drm_bridge_connector_init()
>
> Whichever branch is taken, drm_connector_attach_encoder() is called
> immediately after to attach the connector to the encoder.
>
> Now drm_bridge_connector_init() calls drm_connector_attach_encoder() on the
> connector so it is not needed anymore in case 2 and should be removed, but
> it is still needed in case 1. Move drm_connector_attach_encoder() from the
> common path to inside shmob_drm_connector_create() in order to get back to
> a single drm_connector_attach_encoder() in both cases.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

For case 2:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

As none of the old SH platform have been converted from
sh_mobile_lcdc_fb to shmob-drm yet, case 1 cannot be tested.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
