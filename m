Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82D11D9694;
	Fri, 17 Jan 2025 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737109440; cv=none; b=FbR71AO6suKsrEL3E1BiYRevMT02BjYpXMx8cOnww1ShSfqSZuVu6BqAHZmTXGNwydnbbBaKvpmlPL2gLanR+nKDv4abinuONYGLf+d7gZbft7dObNHc2+07hs9TL9QD3UKCsrJ7wQ+sxGwibt+kSKd8W6Dauip4isJj4oPma6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737109440; c=relaxed/simple;
	bh=qzAn1c/k3kESKkXWElYSoijsx7SCYZrltfmSf6A/EVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jceb730yBXYzYkBmOvHisfh1kCSPA5qYcyw1yXxfz/dyb2OZwPfKlfmAAH/gfq6fo9Pk9nT2CGXNX0trEdkIB0MYOuH7mls7lSM9flOKBGY7tFiwHGidV9uiErzgJXp7wHVn0BqxgJu2IMoTBvhODwZKaqqQkBYn2rJspGOBWXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XDjUHGhh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XDjUHGhh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6FC5C4CEDD;
	Fri, 17 Jan 2025 10:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737109440;
	bh=qzAn1c/k3kESKkXWElYSoijsx7SCYZrltfmSf6A/EVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XDjUHGhhhcftUMtpezf3hANBIPaphR7bvOodUfMNOQC3CJvXfvE6GD6bxwbkuMCLG
	 Wes4Ua1XkqLVQMPJwwSs7eruwdSp4QjWHRm2AqWeWiy25ulPhrtg0j2N9cy6sdy7Z1
	 Wkq68kBM8c4815iOQVTeQGND6oftcloYIHHcWBnhCqAPotfhQA4chEkydW637taHgr
	 gIdN5oyxoYp7KOcOVkKXwGxCvU1xuaZqe4P6L3A0dejnb58pkzHf9xQXggiXoxdmuJ
	 DjLsfJmcYRaICdnPOek/a70S+y6avH1c00b7lYidwwZbRkoNjUJPxTu4tfv+Zsh7fH
	 issgUmelDZaag==
Date: Fri, 17 Jan 2025 11:23:57 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: fnkl.kernel@gmail.com, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
Message-ID: <20250117-neon-unicorn-of-plenty-bbe639@houat>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
 <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vrjre4lk5dsy5ds3"
Content-Disposition: inline
In-Reply-To: <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>


--vrjre4lk5dsy5ds3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
MIME-Version: 1.0

On Fri, Jan 17, 2025 at 05:43:57AM +0200, Dmitry Baryshkov wrote:
> On Thu, Jan 16, 2025 at 05:01:03PM +0100, Maxime Ripard wrote:
> > Hi Dmitry,
> >=20
> > On Wed, Jan 15, 2025 at 12:21:39PM +0200, Dmitry Baryshkov wrote:
> > > On Tue, Jan 14, 2025 at 10:38:53PM +0100, Sasha Finkelstein via B4 Re=
lay wrote:
> > > > +static int adp_dsi_host_attach(struct mipi_dsi_host *host,
> > > > +			       struct mipi_dsi_device *dev)
> > > > +{
> > > > +	struct adp_mipi_drv_private *adp =3D mipi_to_adp(host);
> > > > +	struct drm_bridge *next;
> > > > +
> > > > +	next =3D devm_drm_of_get_bridge(adp->dsi.dev, adp->dsi.dev->of_no=
de, 1, 0);
> > >=20
> > > select DRM_PANEL_BRIDGE for this API to be available.
> > > Also there is an issue of lifetimes. The bridge will be destroyed only
> > > when MIPI driver is unbound, however the panel can be attached and
> > > detached several times.
> >=20
> > Can you expand on that one a bit more? AFAIK, it's always been unsafe
> > and we don't have a good mitigation at the moment, so it's unclear to me
> > what change you want here.
>=20
> I was thinking about using drmm_ here, as the DRM device is also created
> and destroyed each time. But I might be mistaken here.

Ah, right, it makes sense then, thanks!
Maxime

--vrjre4lk5dsy5ds3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4ovvAAKCRAnX84Zoj2+
drc7AX4lqVMGAHarEVIA1Pcn9ke3TjmZj9h/0P1cE1+WwL9tu59subgCIKYEEgjn
Aw9JlO0BgJrqHXIvHGhiKj6/R5jZ/CPGL5hq7c6TtHTEuGuvElaI8g5bkBCei1SG
lE8HfloWLQ==
=lUDV
-----END PGP SIGNATURE-----

--vrjre4lk5dsy5ds3--
