Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE691D9694;
	Fri, 17 Jan 2025 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737109422; cv=none; b=ehe7M2SiRU/d2OoG7lI92sszwKz0ldMmA7RQyQGtV+/sGIcJqWXeQ1jRyex10Gu8ipQA9QCk5VQEgOdoQuv8L3PK4rn2dRdMedJc43/Kh3KcNI90/pD8hJfZ36DJbA73mFmkL7pqlSB7s/4CEcl79xdF4CWw0ub3oNQeDapNddE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737109422; c=relaxed/simple;
	bh=jSwb2wZFFYhuuFvDBoxLHK554RSrZreFZDxgoQ2J7R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHKGhFvj1Pr1dJIRIh7W7RcI3UKuM2f+M0yeLXuLZPZSNdqERdrYSJQUJtobo1hdc4J6anrIJaTt7DUav3GQno8b9U2RE4+T9HcgrXafAnqcNMLu4G3kOcJScug/7PI/JELyhfsqNHgXdkw25zmrIR7uUUOcWnFyc24ylL0Mxu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ujh/o19S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ujh/o19S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D95DC4CEDF;
	Fri, 17 Jan 2025 10:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737109421;
	bh=jSwb2wZFFYhuuFvDBoxLHK554RSrZreFZDxgoQ2J7R8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ujh/o19S6Vqu1kuMTO8hRnxKfWHi4+Xct04NzVhA2lyP8EBYpayiCnvepWWIIzt5N
	 XqBYEop5QaigJC4ZfkfwgIuvUi4i7JrUR7AY+1ZwHpXJeiypf0o1vHCr/4G3Vu+m3m
	 08q8EY6HSrsuqj5hZjGHsLZHfVHOY4b43+04aliZldi2eyjB+vnhNMaumEd8B/0cZO
	 Fu739I247+6CnJMcp8fjXJs9DlZ5HEEt08tgKqBJ0amk1Zqq4aslWWIkAumO7NaM1R
	 htvBgb3IgzW7E0P2ebA3gk9MZv85IzCElOoKc27DR4+uFybMQQJvc9IVwXdP+nyijO
	 dyij3wJUF0/qw==
Date: Fri, 17 Jan 2025 11:23:38 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <20250117-bright-passionate-ibis-804a8a@houat>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <CAMT+MTT+_ER+mFP1yUY+L-47-sZfNmtHUp09rqpPG174OKMJKA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zxxlu2wrbjxf7qrg"
Content-Disposition: inline
In-Reply-To: <CAMT+MTT+_ER+mFP1yUY+L-47-sZfNmtHUp09rqpPG174OKMJKA@mail.gmail.com>


--zxxlu2wrbjxf7qrg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
MIME-Version: 1.0

Hi,

On Thu, Jan 16, 2025 at 07:52:30PM +0100, Sasha Finkelstein wrote:
> On Wed, 15 Jan 2025 at 11:21, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > > +     ret =3D drm_simple_encoder_init(drm, &adp->encoder, DRM_MODE_EN=
CODER_DSI);
> >
> > This is being deprecated, please use drm_encoder_init() /
> > drmm_encoder_init() instead.
>=20
> I seem to be unable to find any documentation or a mailing list post
> to this effect. If you are referring to this patchset:
> https://patchwork.kernel.org/project/linux-samsung-soc/patch/202003132017=
44.19773-3-sam@ravnborg.org/
> according to my understanding, it has not been applied.
> In this case, the simple encoder api provides all functionality i need,
> and a replacement would just be a simple encoder, except copied and pasted
> into this driver.

a drmm_encoder_(alloc|init)'d encoder with a NULL funcs pointer is
strictly equivalent and doesn't require any extra infrastructure or work
on your side compared to what you have here.

> > > +static void adp_remove(struct platform_device *pdev)
> > > +{
> > > +     struct device *dev =3D &pdev->dev;
> > > +     struct drm_device *drm =3D dev_get_drvdata(dev);
> > > +     struct adp_drv_private *adp =3D to_adp(drm);
> > > +
> > > +     adp_disable_vblank(adp);
> >
> > Isn't it being helped by the DRM itself? Anyway, I'd suggest moving it
> > after DRM device unregistration and shutdown.
>=20
> Not sure i follow, as this call disables generation of vblank interrupts,
> shouldn't it be done before all drm structures are torn down, to prevent
> the interrupt handler from potentially operating on objects that are in
> an invalid state?

Your adp_crtc_atomic_disable() function calls drm_crtc_vblank_off()
already. drm_atomic_helper_shutdown() will call the CRTC disable hook if
relevant, so you're effectively disabling vblank twice here.

Maxime

--zxxlu2wrbjxf7qrg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4ovpgAKCRAnX84Zoj2+
dl/PAYCi6eiO7nJHixv6cIn7PybRAsm1pSznLtuB/wQE6J2GK7apdsfDdL8u9qWw
Mda3RRsBgIBwNFvsUc+ukeNozHhxEQcjinnckbPigAQcK0ltVOYGaD+kpoiteW0y
yiwJc/mqQg==
=Uyb0
-----END PGP SIGNATURE-----

--zxxlu2wrbjxf7qrg--
