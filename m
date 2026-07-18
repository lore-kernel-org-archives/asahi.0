Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32928242D88
	for <asahi@lists.linux.dev>; Sat, 18 Jul 2026 14:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784383741; cv=none; b=CDbLxp7On3l+hu4FVQ3b08FWM/zA96fKCwXKYiUJtIM9ZvOmUF8OOksg/nNAtsR/T8QdSF2qA/CRo1AwBsf0lh1RGoc8oovHwq1t1pkR1P1wx74LbWhwLWd0/xRyA1Nl6GJiKLrImt5x4+5pC1I1Vr0WebzWXd9dMfHFQ8qKk48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784383741; c=relaxed/simple;
	bh=Dn4+/xgeieh1LHD6He5u6OXfezns/RApi+yaHTB7VZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFKnQf02qr28ac62pO/zGOOIYbHKaxfX9oz0qo540IGXB1K16LU/Ti1OBMBDjYj8J8LbR+qrbDNxXdbxcS0T71IyaO6D6838zrjdhDrVDfznWkAS1Q8yFO0IhqCnSumOIzDxkU2JMyzmce423VtPwoHjyIkAAQQn+2TD07pJV74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=a0k7Ppeq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="a0k7Ppeq"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47df6a5202bso5994462f8f.0
        for <asahi@lists.linux.dev>; Sat, 18 Jul 2026 07:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784383736; x=1784988536; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dn4+/xgeieh1LHD6He5u6OXfezns/RApi+yaHTB7VZY=;
        b=a0k7PpeqLtKqAUyJckGSFPStpIpV6ddXYNlXu5X7383ZcVTExJGlnb/9TUwY6GJNkR
         5mMWmo89bkVd6EsYiYHyi3j/8ahNo9lnlT2GGBlSNNIXjOsIN1IaGA/aj4vsM8I+x2Xw
         5IxcnJMeVYA/hpMvCzIvxLkt8clNzc8BnJcPVSp4stjKcB3M26lbndZ9SMOjtMkzITfu
         L9EE1uJOxzlrtmcD18wcXAgPkU5cglcroEvGhP0zsLk0mVGJJB9PBmo/RylO0mDt1reQ
         OvLUd6ziYbLWD2zk5bESwEYnqeHJvuP69pEmzVedi9KIGMu4UmWsXfNxLMWK+LMfIv4u
         wlRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784383736; x=1784988536;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dn4+/xgeieh1LHD6He5u6OXfezns/RApi+yaHTB7VZY=;
        b=kxDBEiXqWav3Lt8QJpKsH8yQuIt2gXJLbCtF9XG9RbBGWlmNoiwyJJjWKI8yzLsTOI
         l8kEZDhHKwypRwJzeloK61RpOw6n9YjW7UnVzJYFrLEqXZzNDsreSMBH5ti4tkdhcsRF
         q80BsiNyUWHKXzC9AE+EBJwHG37kPzoy4MvfoLu91Re6Z5nBe+M4UeEcvIzLiBMmdql/
         mcV0LqjlvE2iSXuV5Qr4+B8zb6YB6mhhQtf24M+K7NXNPbjTUNC28OONwVYvwBdW9WfF
         OMIauqkKjLZo6TPN0d/bqRtCiMjSSZ5jDWFHJ2OpXBIFuv9p0NMYKobSR5lf0nlxz7mA
         G6Nw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3ZL87gj2aQQVbwWy1PzfBJ85P1hIR3CnXGOiLmtJUJzsCeqn3NGRvZxipg4w8Vv4AOPUV8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrzV2xc/Jyrk8Kvl7kWtUrkFGYUUCiWMnFU9DomPUL+FZ8h7F9
	vXlkGfvVv4/Q6glO/OTe8gVMYtw2UZrBSHJyv/z49IBg8ISeBE4uy8PTOfLcaMhmQgA=
X-Gm-Gg: AfdE7clkqFBaBvmc+dFQh2Rw/Rc1QOuXjzE4VUL9RGRAj7tJWTVxake3h5hhoK34/zC
	+OxDBlAAKfStpBDZNUFT5teXlVIp1psagcCoC1VYWK9p11cO+pHD9XkuImIU2xz6cksXJzt+0Kf
	Cc1eV4VeV8ot/YAq7OQvEiGDI+Gw5RlmNJWW8IERe6Faor6/YBTeS0qa4DcBprq2OrrLhCKfeRC
	DvPq94hiwhztIisNDksR5bRV4xEZ7/NzUYaID2D07pzMMf+CKVN/MrlxAH4ADrRIM+Cmi/TBVlU
	Y8AMPLtLoF/ZyyoIKg3uka8rpjw8FOxAqt+dkUxQkPKevYwUPBSjj45RLDwkezWbz+D7rb4jGGq
	Pt4MD8eftTrbLdgX0WOlIkAEHTFfaxFBuDPYsQu2VYmzyiSH3ohSw6llmkzk2eal8doJGPK28qW
	qTtFCr4nA=
X-Received: by 2002:a5d:59c4:0:b0:479:37e8:44e7 with SMTP id ffacd0b85a97d-47f62330be5mr9388858f8f.40.1784383736446;
        Sat, 18 Jul 2026 07:08:56 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e49ce4sm13571967f8f.8.2026.07.18.07.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 07:08:55 -0700 (PDT)
Date: Sat, 18 Jul 2026 16:08:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Marcel Holtmann <marcel@holtmann.org>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
Message-ID: <aluGI7g2BbOsrjoM@monoceros>
References: <20260504160940.2168650-2-u.kleine-koenig@baylibre.com>
 <aimXkX4FC4JVxt6q@monoceros>
 <CABBYNZKuOdtxa8ksEZM1FyjYJCQ22H6NzaX31t6LcZuvn0LMNg@mail.gmail.com>
 <ainSCcYroJUIAuwr@monoceros>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bwnxy7zgptzm7mmy"
Content-Disposition: inline
In-Reply-To: <ainSCcYroJUIAuwr@monoceros>


--bwnxy7zgptzm7mmy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Bluetooth: hci_bcm4377: Use named initializers for
 pci_device_id array
MIME-Version: 1.0

On Wed, Jun 10, 2026 at 11:08:49PM +0200, Uwe Kleine-K=C3=B6nig (The Capabl=
e Hub) wrote:
> Hello,
>=20
> On Wed, Jun 10, 2026 at 01:13:44PM -0400, Luiz Augusto von Dentz wrote:
> > On Wed, Jun 10, 2026 at 12:59=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Cap=
able Hub)
> > <u.kleine-koenig@baylibre.com> wrote:
> > >
> > > On Mon, May 04, 2026 at 06:09:40PM +0200, Uwe Kleine-K=C3=B6nig (The =
Capable Hub) wrote:
> > > > Initializing a struct using list initializers is hard to read, comp=
ared
> > > > to that using named initializers is more ideomatic. Convert the mac=
ro
> > > > used to assign values in the driver's pci_device_id array according=
ly.
> > > >
> > > > This change doesn't introduce any changes to the compiled array on =
an
> > > > x86 and an arm64 build.
> > > >
> > > > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-ko=
enig@baylibre.com>
> > > > ---
> > > > Hello,
> > > >
> > > > this is a preparing change for making struct pci_device_id::driver_=
data an
> > > > anonymous union (similar to
> > > > https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@ba=
ylibre.com/).
> > > > This requires named initializers for .driver_data. But even without=
 that
> > > > this is a nice cleanup making the macro better readable.
> > > >
> > > > Gcc is happy with simplifying the assignment further using
> > > > PCI_VDEVICE(BROADCOM, BCM ## id ## _DEVICE_ID), but this is a bit f=
ishy
> > > > because PCI_VDEVICE also assigns .class and .class_mask (using list
> > > > initializers), so I didn't convert that.
> > >
> > > In the meantime I learned that doing that would break W=3D1 builds, s=
o it
> > > was a good choice to not go that path.
> > >
> > > > Once all pci_device_id use
> > > > named initializers, the two zeros can be dropped from PCI_VDEVICE a=
nd
> > > > this entry simplified accordingly.
> > >
> > > Is this patch still on someone's radar? Ideally for application in ti=
me
> > > for 7.2-rc1?
> >=20
> > It is no longer in patchwork so if you really want to get in please res=
end.
>=20
> Instead I unarchived the patch, so it appears in the patch list again. I
> hope this is easier for everyone (it is for me).

That didn't help, it is archived again. So I'll resend, but I still
wonder about the processes involved. Is there a bogous automation that
archives patches after a while? Or is someone archiving patches by hand
that look old? Both make patchwork as tracker somewhat useless ...

Best regards
Uwe

--bwnxy7zgptzm7mmy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpbiPIACgkQj4D7WH0S
/k4c1wf+KcoE7dFmw403md8qqMbo0WQC/qoBEezSjlMwYrzakuDItdFVFoNFBiCw
3EObuzygqxIZE1BYccJoTvjRtkU/V4QVAYqS5pildQ4p7Vt09YDxPiUFxQO3Od6o
PyEDcKR7ILURIN4O6peARALntWYwQ4Nzk2NYS03yGSxfNXKc4LIIG6fgrVdcgw+n
HeSwcSRmqXFa16BTplVQTAMtsHC4TUC+HieWosDtJeg03LURbBNLamGWO33DrLBs
qbaU3zNaHSZvoxXUgEI0W2f2U2J0Gn4RhjRAtB1lOfO1Do1QWz/UWUYjgiiwA0xk
JK0AS0bg5Wz9FlvUWkIcrWyp2kTPKA==
=sRN4
-----END PGP SIGNATURE-----

--bwnxy7zgptzm7mmy--
