Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010806;
	b=Fxqp1vrHvrgF3GnYAHGNFPl46DAf+acRvkZuv1iFw7GQOJNTq5L4jrixs98/XY6wwwyD
	 41IHYwoStSd/6T8pw8KFkNorMAvQjLFBX0EUlJ9Cr0Osg3IiHrZbu/OIOV2Lq7H7TRgrh
	 OQ+Mqhzla0MfMX4uLolZ2ErOuuMvONYdij73X9ljgQVZkgU0E1L8bBndZp6rtLAYkEAwx
	 9KJ06A5oLuanb/ItHl/Ja5LeWPSQmikUTPkM+LsVmt5PG03fVJxnmgH63hjgrmn1pw/xG
	 on/usFjhFaEbyXcAaSxyWi0Fx9VvMHdV/X9dPHLdYo/8pzkhp8PX2pGVBR3ZTd1I6Kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
	b=LzZOrwKnfgxj9p9/43T3mEBPzHErtuM58fIqRi9YeWHXPyH2CXrTTregOYojpAOUAs3s
	 K9E7zQy6pj7iZPp+u8YybBtIY5R+9wOi5QerZdmFDk6D2y1F7pQrsfbDiRPZXAEw4PgRQ
	 pGC/ysoSocgPxzqyq0S++/+3FZT5Ql2irTbkNygxS8BoonVewhYM35pnWJ1cX5KEJxIf9
	 LYOkCPZ3od0prG+7suXz6ucD4YiGI4ef76rwrl5x4T21MiVfdHqIcggpwsimwr4gD7VZa
	 Dgvwo/PXOL5jpR/pJgZUHq9+PtmH70ka4GAKRIGgkDRiJSg+UAeY5HqZmXRXgSnSlYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=m+xbdE2k;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFA5606A336
	for <asahi@lists.linux.dev>; Wed, 18 Nov 2026 14:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BFA5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=m+xbdE2k
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so14096935e9.1
        for <asahi@lists.linux.dev>; Wed, 18 Nov 2026 06:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795010804; x=1795615604; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
        b=m+xbdE2k5CCVtpBP577o2tkxcRdCBv8X0ubrc4Nn7qvC4s7OT1ONYtLDkxTy81wS5s
         XLRxhavPkNIyPjaAfZ6kanIOp/tyFL/uG4Faezv5bA6NYiFOnyy1oPi3XQBSvAMea7aK
         ltrHwWADMWOV1HqENeFcmmHZOUlHBXT0MtECSc41tppkRmtQbVOd1Iw+W/9bRFPg0xwZ
         AfOa6Xj4i9j5ebEXys5PkCUIFA6nAUcOmu3Sxzy3pFSURiCUsqKkBSDMD0t53bG7ur2+
         ydjYlSXuGjuc7BAbkG3yeDi9kwk4d92sCO9wZLm1CgzZa+DWoaEd/Oy3RS6bWfeG8hdq
         GTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010804; x=1795615604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8kUxWwNMGGKdJF+2JBGIvhWCx8VFS9Gq0fs2XPEP3c=;
        b=rqy6yteyJoAsfyNr1XF4o14sw4nQ9ZCT8hMUijguPk62W61u9DuFGtefkFi30k3QeA
         Dp2ShfOg/DItrin6HMZ/o3hGudl2X32UuxYErXGF6WFsjmWIBZ/2DhzEcBz2Ib7xITKy
         +f+UkZE9XPJ8PvQblGwPg5xpXuN1eNTCrTVzqT9kutpSTr8oR1PuRVAsGr0FZvGW/6gk
         99eC+clEBPNUm+yZpKFD020UI2Vqj4dhhgFf80Fr8UTPxmAWj+VLbSRv1lptsN3Rdxti
         +1CAQ0GgLaZcBX3MlKJhlsXZuC5idw/LUwCHnA6FkHZPWrJdhuhozkwR+/uGbOBg+ShW
         7XAQ==
X-Forwarded-Encrypted: i=1; AL+hErE8ZgzgSJu5/Lbh1X15W53M6lDDOyGNCH5+6kWOImCb2lR7L37BaiPpth8EtoGB7Jofn+eBAQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+VvikjZTobFPgWWfnubjkEkhORT3/kqtle2m8UZ9ee0t2NFdAT
	oMWbjpEViJO/tt2yb0tfcKNLrcwbQm7AVPSGnxEkJp/x9g6C7GeoeLKZxN7U6FXL79c=
X-Gm-Gg: AYBFou1u16pVH9d+n1lsOh28WEtSjedtIV0t7Y9luw6dQ8Y3VAgE5Q8erwhJUgCux72
	H3H9m9CArb8y10K1n7f/G5PytUmBuXBSx+SUr0wpdasqBmZ8fTNdCS12+lNKrKiOnysp6+cdILH
	K2RQbBrbhFNJVgqAcX4/ecAlj7E/274URzcMkyecd7YP/BFvk1ETzDHhk6AIsNtYdf2+/robWPR
	HacFUYwLQTLydNuVj9krDrrs82N+d03iYbYt1U3F1rYdE0cR0R3wjYll4kYwtythxIGi97apGpP
	5/AmIfmPC0V7gxJbgSyHGJlxNQIWdZo9BaGeGTdYCZR169hLpgu0qugMTaDQsruIgPUdfKpBWTK
	iekYZFojuSsGB8h8AZWCQBz1vluioe0ovBKp9+2z0NFNh2Q7wxHrzR+CGp+b+1qcZecwvaELjxx
	4M1kRkMPpXXu2iHym/+HezZWLK8uHWSp+rhQNF1mTVIljiNH6LZgzFha3Wtv3YboB7eTti+8rnR
	14fiu3Wzn9M3Pc8pFtuMSQLhvMR8zWnVgDsbzqI9dGgIuJuiPFjYHKJh8PFt9NciwbjR2ihie8m
	6gXLVJa+STMQ9CkRqcYSV8jSTSgN7RMFAn0=
X-Received: by 2002:a05:600c:3509:b0:4bb:68b9:f610 with SMTP id 5b1f17b1804b1-4bb7da03954mr52120315e9.9.1795010803953;
        Wed, 18 Nov 2026 06:06:43 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb7d256f64sm61534715e9.1.2026.11.18.06.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:06:43 -0800 (PST)
Date: Wed, 18 Nov 2026 15:06:41 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sasha Finkelstein <k@chaosmail.tech>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org, asahi@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	imagination@lists.freedesktop.org, linux-mips@vger.kernel.org, lima@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
Message-ID: <av2rKJQ0AKU9CFZI@monoceros>
References: <cover.1795002467.git.ukleinek@kernel.org>
 <a2d5ce256b8ec150de4a6494c177b19693a33222.1795002467.git.ukleinek@kernel.org>
 <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5c6ped4sw6nigwko"
Content-Disposition: inline
In-Reply-To: <7692c160e418e7ad0528739fcc879b11fbac8ab0@intel.com>


--5c6ped4sw6nigwko
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 9/9] drm: Unify coding style for *_device_id arrays
MIME-Version: 1.0

Hello Jani,

On Wed, Nov 18, 2026 at 03:27:40PM +0200, Jani Nikula wrote:
> > [...]
> >  drivers/gpu/ipu-v3/ipu-common.c               |   8 +-
> >  drivers/gpu/ipu-v3/ipu-pre.c                  |   4 +-
> >  drivers/gpu/ipu-v3/ipu-prg.c                  |   4 +-
> >  254 files changed, 1155 insertions(+), 940 deletions(-)
>=20
> How do you expect a patch of this size be merged?

Using b4 am :-) Honestly, in the cover letter I wrote about an immutable
branch and offered to rebase to 7.4-rc1. When trying to apply this
series on top ov 7.4-rc1 there are only 6 conflicts (1x modify/delete
and 5x content); these are all not so hard to resolve (and even dropping
the respective hunks (i.e. resolving using `git checkout HEAD`) is fine
for me.)

> > diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i91=
5_pci.c
> > index 84a7dc6ab5db..faceb3de4fa3 100644
> > --- a/drivers/gpu/drm/i915/i915_pci.c
> > +++ b/drivers/gpu/drm/i915/i915_pci.c
> > @@ -870,7 +870,7 @@ static const struct pci_device_id pciidlist[] =3D {
> >  	INTEL_ATS_M_IDS(INTEL_VGA_DEVICE, &ats_m_info),
> >  	INTEL_ARL_IDS(INTEL_VGA_DEVICE, &mtl_info),
> >  	INTEL_MTL_IDS(INTEL_VGA_DEVICE, &mtl_info),
> > -	{}
> > +	{ }
>=20
> Personally, I would *always* use {} instead of { }, and would rather not
> change.
>=20
> Across the tree, {} is slightly more common than { }. IMO changing them
> is pointless churn.

It depends on how you count. My statistic looks as follows (on top of
next-20261117):

	$ git grep -l device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/devi=
ce_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | sort | uni=
q -c
	      2 	}
	      2 {
	      6 {  }
	   2598 { }
	   1262 {}

So over all *_device_id { } is more common by a factor of > 2. This
series fixes one {  } and reduces the number of {} by 37. For only
pci_device_id it's:

	$ git grep -l pci_device_id | xargs -n 1 perl -g -n -e 'print "$1\n" if m/=
pci_device_id\s*[a-zA-Z_0-9]*\[\]\s*=3D\s*{(?:\s*{[^}]*},\s*({\s*}))/' | so=
rt | uniq -c
	    159 { }
	     32 {}

Without the context of an array initializer there are many empty
code blocks (function bodys or `do {} while (0)`), empty dt nodes, and
{} in Rust code, which IMHO have to be considered off-topic for this
statistic.

Best regards
Uwe

--5c6ped4sw6nigwko
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr9sOcACgkQj4D7WH0S
/k4vggf+PQfM4MkbLgaQRCdXRWWsc4/Fa0tTMBQAl4gjx2p5NE/N7TDUO571o3+N
oWcelzY5O1uRcc2qHZVnu3vAxFqzk4YHfGjsbGHsxQAibxnIFW7ttYTzt0w5a9NH
v65V6+sebCdwLrPVE5ilcqzFFSgmnv1wTNm2vCEUxdKGacifySaGRmg4+ax+fLb1
CL+RS7fM2EkQxG1k4iDEPv1Onrm9S4DtwTts0wxkK780rWYD9FoSLjHyX/x21Y8x
SZKaXeNZlxtHJpQLq8ub8AL/t6k82nC020wYZOUbUmvPyqxhNoUuuS0/RVlz9xT6
kXiliIwWzcMtAKt4ik8nbTRO5JERhQ==
=0alU
-----END PGP SIGNATURE-----

--5c6ped4sw6nigwko--
