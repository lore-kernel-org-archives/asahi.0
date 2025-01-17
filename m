Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2189470825;
	Fri, 17 Jan 2025 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737124673; cv=none; b=ujixG+HAWIWr69AxVBnQWUjfKOq5FN2xalAx6nxqUlWJTZhvmYZ80Hr3K3qd92YzEP4X3sGCSofTth2eQPh237pJNj8bWrnCJ3I/2uHlgbEX2rxk1Tn13s+9pPzjo/3KAbARSIOH8hW9YFrmx+lDT7suknLPNdeJWfupqEamPWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737124673; c=relaxed/simple;
	bh=Tg+SetWFqRed9XCrJetM7sHWQTGMKeHQZW0P/dnItU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V54BDMsapcNYH8pnrMFa3lQcRKPGzogJoLwSQN1vOvPZ3oGbpy9PZcgiy85R74h6in4DwiRkldtLd6HqKWYo/MXwcc4FX80gL8Ty899QhnFjCf2yfstOjR5MrUfbjL63nb/WaFVkGF0MSZlgqAjp6+ijsCjHLrjVdm0kqwoOGJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GktwO+mt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GktwO+mt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4BDC4CEDD;
	Fri, 17 Jan 2025 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737124672;
	bh=Tg+SetWFqRed9XCrJetM7sHWQTGMKeHQZW0P/dnItU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GktwO+mthOAqo2D/lONvaKSzjp2HcibLrnTszkJtTCBFh43T9V7JepbI088+/jVYr
	 OnM2q/Amst90vijwQoa+p7SzmVHgyb3bPp/p7QKrJYEl7OZbkfMsVYuVc4xmdrCRiT
	 VF6B3pdiTsi1RCEu/e64PkU14SN2B9p+qDnTK5njiF6PdT0JSI/xHk27eYzmKtkL0L
	 0hmTPdZxWr6rO0+eFZBpuY7izGsFRo8jlUfLv49g73cbm0vyczf8cUpdDNJTaejEUp
	 FiGvW+X5W65UenaEpp4Mtbld+4sHHjMRCKB48E+9uPqPvxBPdK0S5WKAwg94BIs5Jn
	 vnKzTKi6t8vgw==
Date: Fri, 17 Jan 2025 15:37:49 +0100
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
Message-ID: <20250117-bettong-of-radical-prestige-0d81a5@houat>
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com>
 <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <20250116-vivacious-congenial-nightingale-cb2f6d@houat>
 <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
 <20250117-neon-unicorn-of-plenty-bbe639@houat>
 <CAMT+MTTrvXsYONQj0V5U+dPJtCBOAQ-Lfg7NONMB6onMvJ+3QA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="dgam3kkeewc5mr2f"
Content-Disposition: inline
In-Reply-To: <CAMT+MTTrvXsYONQj0V5U+dPJtCBOAQ-Lfg7NONMB6onMvJ+3QA@mail.gmail.com>


--dgam3kkeewc5mr2f
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
MIME-Version: 1.0

On Fri, Jan 17, 2025 at 03:17:32PM +0100, Sasha Finkelstein wrote:
> On Fri, 17 Jan 2025 at 11:24, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > I was thinking about using drmm_ here, as the DRM device is also crea=
ted
> > > and destroyed each time. But I might be mistaken here.
> >
> > Ah, right, it makes sense then, thanks!
> > Maxime
>=20
> Not sure i understand. The drm device is created in probe(), and is
> destroyed by devm.

Not really. The reference your driver has on the drm device is given up
by devm. It will be destroyed when the last app will close its fd to the
drm device file.

> I do not see a path where it can be created/destroyed without a trip
> via probe/remove, and so tying the lifetime of the bridge in question
> to devm seems correct?

And while someone has an opened fd, it can still call into the driver
through ioctls, so any KMS-facing resources need to be tied to the life
of the drm device, not its underlying device.

Maxime

--dgam3kkeewc5mr2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ4prNQAKCRAnX84Zoj2+
dhwVAYC1HkBz00di/tl/bhJvyHA0BUGUrSGUL30bpdPjubUR9YoA0357NpDKr6cs
fzqAUj4BgJUl/fzSkgqnOFLEkHiohz4oKitUhEGMjGdEYPlG4+Z5uN6IG5GN+C35
9qfOm/2gDw==
=Z3VM
-----END PGP SIGNATURE-----

--dgam3kkeewc5mr2f--
