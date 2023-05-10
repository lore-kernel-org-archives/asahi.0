Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A17362
	for <asahi@lists.linux.dev>; Wed, 10 May 2023 02:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB05C433EF;
	Wed, 10 May 2023 02:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683684619;
	bh=poI666OI/xsZPVnr06pLwQAkEzT1SEYPhOfJQcJRHw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WvYIzReuFXvL7NWwO5OG68hV84RKTLdKoP1oCl2TR8I1Y0FOR6/EdqJsLSr4PSPiv
	 3LrFhIJSEZ4ijpVINxD5n51oDYBfbSdvft/Z1ejFYfRUAt9UB1LI5vaalQKi9thGyD
	 kqFZDd4/zKyUzRR8567MvtoWIpn61Q6asj/L0dy3aisq0e5+LQhzkS/5uZwdPP2+4r
	 Ee5oR5s0cUwTggR4m79UHTcbKg5c7XB+mOzo4JG/qRRc08zUa9l5S3GY+PfFddKWjV
	 YZ0xEoRbnDNK9m56cqXEGWC6B33PjLW9aN47OhxOoxP1+474T8kHMm2XY7+lKBqKMn
	 5FxwMnevFYVdg==
Date: Wed, 10 May 2023 11:10:16 +0900
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Conor Dooley <conor@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	asahi@lists.linux.dev, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
Message-ID: <ZFr9CP3Dfmb/3LzP@finisterre.sirena.org.uk>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <20230509-marxism-plug-759c99ac601c@spud>
 <0216884B-A6F4-46B0-AEB9-AA16B3F24C8C@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x8yWm22KI+W3sa7J"
Content-Disposition: inline
In-Reply-To: <0216884B-A6F4-46B0-AEB9-AA16B3F24C8C@cutebit.org>
X-Cookie: Avoid contact with eyes.


--x8yWm22KI+W3sa7J
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 09, 2023 at 09:38:46PM +0200, Martin Povi=C5=A1er wrote:
> > On 9. 5. 2023, at 20:25, Conor Dooley <conor@kernel.org> wrote:

> >> +        00: 8.4 V Full-Scale Gain Mapping
> >> +        01: 12.6 V Full-Scale Gain Mapping
> >> +        10: 14 V Full-Scale Gain Mapping
> >> +        11: 15 V Full-Scale Gain Mapping

> > Putting register values into the DT does not seem correct, although
> > I know nothing about sound and will have to defer to Krzysztof & Co. on
> > that front.

> I thought this should be here, and not with the other gain controls to be
> exported to userspace, since it relates to the supply voltage. You probab=
ly
> can=E2=80=99t select a gain value close or over the amp=E2=80=99s supply =
and expect proper
> functioning, so the value here should be the system=E2=80=99s integrator =
choice.

> On second thought there doesn=E2=80=99t seem to be any risk of damage to =
the amp
> itself, so the knowledge of what=E2=80=99s the optimal value could be lef=
t up to
> ALSA use-case configuration, and there=E2=80=99s no real downside in trea=
ting it
> like other gain controls.

Alternatively why not just query the supply voltage via the regulator
API?  Those are kind of weird numbers (eg, 12.6V rather than 12V)
though, it looks like they're not expected to be the actual maximum
supply values but rather something slightly less.

--x8yWm22KI+W3sa7J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRa/QcACgkQJNaLcl1U
h9BY4QgAhWukkwf/Q+KJ/O1mA+WDot7Z/4HgoZ6HQ1Ah1oeMY2KKVMctkt+Fjjsu
71JOb30GLBJNLiU71/915kUVu6da4KdpfvWJAPT94yfishybk+Kvre0c4YsSuPnR
oToqrQLzMr14EHPYMgCB6xEOGyUgpQHJ+FXhhvlTaYme5wEwpUYrx7lNLCZCN5Xh
pBUJEWWAlImA/FqNICvl9pHooolRe/nkvvPb0m0RgWnQ90cxJXtfRQ5Louixv7l5
jmOqaO2hSFCuoRED54pUqOVKq3qGj/rzEGONEwxdSlIKaKYQWmkCzdx+xt+pCW8i
KwhMWrajFDoxxoo+t43SuOqOZyLsDg==
=Vdq1
-----END PGP SIGNATURE-----

--x8yWm22KI+W3sa7J--
