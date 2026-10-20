Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792495480;
	b=0VOCMXkSsIMes/SmeNxCm+MKtS336vculpBNRDqZ/hg1hH9+9yy6/TVrixSEeuNItQNG
	 jX5KbFnLyOSI5HB8Psrfb7Rr8HXoOVZgZG56cSVvdJfdGLRTRD/UskgHdFPLm3mgajGEn
	 OzD4LLLa1Xe9PzpcjhjgjyHq1IKUgbixF3lcDnrHGosXsBDEaIDR1CsxULey9EBeurEHt
	 19xi+eYeQ9jeSWImZjpxUlzkSKDVUFUDVgn9UBAJCFHSZ09KK2DEjJbQzPpQFizDd0WNW
	 ERYIW1+sJh67IjKvsQtXQ3CuxUWVMfhksC7JS5INt1UCBeKeWULI9swvYik29+AgXGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495480;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=lWY2XuNPbUYtQZXSjdjg05LI8FaRFZGhfx8rJVDmx1o=;
	b=0zfXZoqDqTHP0Pk6U/djFXEPY0FflCz3RYDC6+6JcyRtOy1GpiD27Qnwv35dFTdQFo17
	 8R7ealph/9s5tZPqrqVYkeb24uacvHpI79YiEMN5CZBam/dI63BO2vZeuWvXvEAtvW08b
	 9AFGoLF2pzDqmrsU6HX+4fZx98kldASvQI6eVOyZ8aeHGGm9SNIIvd5zb/UvHcnHeYNHK
	 A3lcLZsqIR6kqemFD4YehGzJWMF6CY9ED+5FTCZjXt5khsoQTehbmb5AbyGlSJNBksIbI
	 JEUUZ0Zf5XDjgAQlXI7hsrY4oG/Y9sIxkjN+TFMRLYmJGnbuNTJgyMN7E30EPk1wxhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="vCuf/qLx";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B194A606A31A
	for <asahi@lists.linux.dev>; Tue, 20 Oct 2026 11:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B194A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vCuf/qLx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1C3794E41291;
	Tue, 20 Oct 2026 11:24:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DA5EC60393;
	Tue, 20 Oct 2026 11:24:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C9EDE10328D1B;
	Tue, 20 Oct 2026 13:24:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792495472; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lWY2XuNPbUYtQZXSjdjg05LI8FaRFZGhfx8rJVDmx1o=;
	b=vCuf/qLxEpfmHzgv2ykmlS8R6iUa8Ff96US10R5POYi23BQM9SGnKWsqTUTMi4ilvXrXf1
	DlMFWhYkMHza9Z+4Ing1hsE6iYTZitXm5bLcMxeF3U9V1iGzziu8Mg6df+hMoznLEkE3zM
	oPje2hcVZ/jjA5rp5s1vOH/5Wqj36RZif5HuL3eSsfC8Iw1YUSQSzLzTV2uijf2FGETnT/
	eoyFOpd7Txn0LjQtqqHHE6RIeiWUiXXQhU+0u7JKamgezGmi8lIsRMzxg3FFH/xNlZTy3l
	VV1AJ/ny9HAteCrKoqzvYVdY/lK5ASTG1/P6zBQH+REss7kv/PHao6MXBk+5OA==
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 13:24:24 +0200
Message-Id: <DM9MM06SOXOI.V1Z0VPY5MAKJ@bootlin.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Jessica Zhang" <jesszhan0024@gmail.com>, "Purism Kernel Team"
 <kernel@puri.sm>, "Ondrej Jirman" <megi@xff.cz>, "Janne Grunau"
 <j@jannau.net>, <asahi@lists.linux.dev>
To: "Osama Abdelkader" <osama.abdelkader@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Joel
 Selvaraj" <jo@jsfamily.in>, "Icenowy Zheng" <icenowy@aosc.io>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Sumit Semwal" <sumit.semwal@linaro.org>,
 "Casey Connolly" <casey.connolly@linaro.org>, "Michael Tretter"
 <m.tretter@pengutronix.de>, =?utf-8?q?Guido_G=C3=BCnther?=
 <agx@sigxcpu.org>, "Sasha Finkelstein" <k@chaosmail.tech>, "Michael
 Trimarchi" <michael@amarulasolutions.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v7 3/3] drm/panel: Use managed helpers in assorted
 panels
X-Mailer: aerc 0.22.0
References: <cover.1789994813.git.osama.abdelkader@gmail.com>
 <f1a0299094a059fe24ddff687e0ea4992d1673eb.1789994813.git.osama.abdelkader@gmail.com>
In-Reply-To: <f1a0299094a059fe24ddff687e0ea4992d1673eb.1789994813.git.osama.abdelkader@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

On Mon Sep 21, 2026 at 3:17 PM CEST, Osama Abdelkader wrote:
> Use the managed MIPI DSI attach and panel add helpers in assorted
> panel drivers and drop the corresponding manual detach and panel remove
> calls from remove paths.
>
> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>

...

> --- a/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> +++ b/drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> @@ -202,30 +202,19 @@ static int ebbg_ft8719_probe(struct mipi_dsi_device=
 *dsi)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to get backlight\n");
>
> -	drm_panel_add(&ctx->panel);
> +	ret =3D devm_drm_panel_add(dev, &ctx->panel);
> +	if (ret)
> +		return ret;
>
> -	ret =3D mipi_dsi_attach(dsi);
> +	ret =3D devm_mipi_dsi_attach(&dsi->dev, dsi);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to attach to DSI host: %d\n", ret);
> -		drm_panel_remove(&ctx->panel);
>  		return ret;
>  	}

As for patch 2, this could be even simpler by using dev_err_probe(). Same
for other drivers in this patch.

> --- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
> @@ -1263,7 +1263,6 @@ static void st7701_cleanup(void *data)
>  {
>  	struct st7701 *st7701 =3D (struct st7701 *)data;
>
> -	drm_panel_remove(&st7701->panel);
>  	drm_panel_disable(&st7701->panel);
>  	drm_panel_unprepare(&st7701->panel);
>  }

The last two calls here appear inappropriate IMO. However it's not an issue
with your patch.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
