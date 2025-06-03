Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FFF269AE6
	for <asahi@lists.linux.dev>; Tue,  3 Jun 2025 07:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934685; cv=none; b=uZx9/Z/rdXScG4eiR5fCvXebdWagQ8lD/lvBmcepHlmurQJzgx2kArBoUqLtZXaYVw7KwDtvmbdutny987rwgwvrxzYP+7fOVbc52LMSsMZMgmyFU1Z8WrU3llG8YMya458+DeYOS9Km3L9EH0zYTJxFHWF2GAJTGiY+Z34Tduc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934685; c=relaxed/simple;
	bh=mL+MB9sT5jktnVzl73SbKdG0xZoa7DasqXdQr1/ZCr4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTdFsHC9R/kLhWilI3RLFsDfGXGvJ8zMsgst1nmoTd8PxNFmanbNYOxOx5GvZzNPOWhOrEbgFxQB/bJRR5bzFkVuqGmcpMzEld4AoEQzQ2VFo8Eui1ShVfnOJ6aPHaABaI5+BbRA9GLq6GICKwvLLXSaOHEFRAsRGTykWAy6Qqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fad3fdf3aaso38555126d6.1
        for <asahi@lists.linux.dev>; Tue, 03 Jun 2025 00:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934682; x=1749539482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLb8HhO98/51A3Sg1akRHkfjqC4wsBeHTx0qur+bJ6w=;
        b=wbnRuGZinOaLjBil4yEpJNeNXBYeUjIr7t+Lpog2nAMBgqBXQQvGy56N2oVH133l8j
         xgCNTt6p4nsX1zHDi3tTy8SJ2cCOZPWnjIoyfVjcRviF3r9+Fdbf1hyMUsT/4mkLRjk+
         75HIc/1K7JCrEeM0GkQPjVN94vkFnWLiMabB9oJjSO3StTcmcXE+qeUXFVYLbe0tnNLa
         YNcm9gq43VAkEd6DaXjsp5OKdMbAXpn9Ku0JRREwdQMxVj27QzICUkdrjT+pApE/Kl+c
         pwtsuP9Fca07s2q8O24QUiw4iVNbDNvDNIbuGPcx4BgTsxIVrGOaQGANFqyCm82k1fvB
         gWWg==
X-Forwarded-Encrypted: i=1; AJvYcCWMMiNJgLKdVjUNgzAGRBgqhc5YL4u2+tx6VKZZ6tBCGPjy2d3FSfIkcarSUHgwFCb9UIbnUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCSJp/Q+rsf8Bvj4jm59BNmeMyNcUG/T73BhMDFG/pKVEvSbPV
	6ZTgmHS58PxbblpV0oqczfYji+sYI0C6RZzEfQ3PDfWYBNs9ZgKAwhbb52q7lIJs
X-Gm-Gg: ASbGnctVRE47hZ0Y68qZ0sUlA+doBneN2w4n0kWy9sAX7fN2Y5qlPX7n4PuClUxUdVa
	w3Wc1HMNvj9nB1DaLiWOunhsqwKUTysF3GuQCukIDp66d9dmqUsbhlHeJi7bFYL0aQRjtZzxPOe
	OAd8gD9iYLZMvV7xc0B4DdVgdivobZQPdABdJp2yiT+7BJk1C0sr+pKW1EKUlQHC4hzdrHI6W6u
	VT3APjmWCDgEUdP4CIsslQ1I1ab40dfH8APqAiEQ0Pbh9+8ndP9OiE0xclSh/lr5+GsGiUws5Zw
	sTYP75PK1onR9TV51zGqP9RjLCYgszPQL2tFAHXjQA/QIArhpqWCpDoJqbJlsJo8wW0iT7RoWGP
	6EfSddPpdFoS2qg==
X-Google-Smtp-Source: AGHT+IG1A96RjTVnUqV3ugm3nH+IbZ/8YJ9AO4/jmXqTon/OiDaSnTSyVG1P6c8hT4tMW1/QdE1o4A==
X-Received: by 2002:a05:6214:1c4b:b0:6fa:b9e9:e799 with SMTP id 6a1803df08f44-6facebb7f7amr197287036d6.24.1748934681890;
        Tue, 03 Jun 2025 00:11:21 -0700 (PDT)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e0126csm76398926d6.80.2025.06.03.00.11.21
        for <asahi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jun 2025 00:11:21 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6fad3fdf3aaso38554946d6.1
        for <asahi@lists.linux.dev>; Tue, 03 Jun 2025 00:11:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMXIxofOuNP1sWS+5UZ3szZsFWpy6UQgnkxy71RKepQBty/q9of66vSFxKpSUtN2M1m3SCyg==@lists.linux.dev
X-Received: by 2002:a05:6102:3751:b0:4dd:b192:960f with SMTP id
 ada2fe7eead31-4e6e410d39amr14204348137.13.1748934671280; Tue, 03 Jun 2025
 00:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
 <20250529-b4-drm_panel_mass_driver_convert_part3-v2-1-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-1-5d75a3711e40@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Jun 2025 09:10:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsGVNsm_WdiZ2hNuErrUUaj49SN_ROr-_KfEWW63omTw@mail.gmail.com>
X-Gm-Features: AX0GCFtcVOHqZD8BcFzZWMq6QGLbY93W1tbb2YLDvTYE6IWQhmuycmj54r1gmT0
Message-ID: <CAMuHMdWsGVNsm_WdiZ2hNuErrUUaj49SN_ROr-_KfEWW63omTw@mail.gmail.com>
Subject: Re: [PATCH v2 01/46] panel/orisetech-otm8009a: Use refcounted
 allocation in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Robert Chiras <robert.chiras@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Markuss Broks <markuss.broks@gmail.com>, Artur Weber <aweber.kernel@gmail.com>, 
	Dzmitry Sankouski <dsankouski@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	=?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	Janne Grunau <j@jannau.net>, Michael Trimarchi <michael@amarulasolutions.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Anusha,

On Fri, 30 May 2025 at 20:28, Anusha Srivatsa <asrivats@redhat.com> wrote:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Thanks for your patch!

I have a generic comment that applies to all patches in the series.

> --- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> +++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
> @@ -424,9 +424,11 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
>         struct otm8009a *ctx;
>         int ret;
>
> -       ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);

The old code used sizeof(*ctx) instead of an explicit type, for
increased type-safety.

> -       if (!ctx)
> -               return -ENOMEM;
> +       ctx = devm_drm_panel_alloc(dev, struct otm8009a, panel,

Can't you use __typeof(*ctx) instead of the explicit type here, too?

> +                                  &otm8009a_drm_funcs,
> +                                  DRM_MODE_CONNECTOR_DSI);
> +       if (IS_ERR(ctx))
> +               return PTR_ERR(ctx);
>
>         ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>         if (IS_ERR(ctx->reset_gpio)) {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
