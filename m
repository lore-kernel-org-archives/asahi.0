Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A23D64C
	for <asahi@lists.linux.dev>; Sat, 12 Nov 2022 20:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA5FC433D6;
	Sat, 12 Nov 2022 20:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668285212;
	bh=x9mkEkI4TNpYNRcWCN2Z41iUCjKp0CTsuCucKloZ/Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MIE7fKaLooueyS7ffe/2vtQLMHa+T0yPMNEZlPv7hRikkO5Gj71D7xgU0S4qoGot5
	 jG1+9Zgqh3kwbLEIW/xLCttX+laPnX8fB99qrwEFuvp5IN9K8ZkK4Sww563so3lNKU
	 DfivKvyBM6y5YPb1CrMA/w18YrPWYeZnJsA9yl9Gf6ste8unff7Cyd8sGbdl3rbFQX
	 JL703DAxE9X/3EXH1yjNqI7yrySlUXshgpcelDzXgD148p/9li33qpOYZYfaeS1F6g
	 OSUX71HTTi/QIP8oQfV6Ct2qhiP3/fKq5quyhFSRWk5tgxIYvFjNPex3wNfAouPCMP
	 IiteRznpkjhgw==
Date: Sat, 12 Nov 2022 21:33:28 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Arminder Singh <arminders208@outlook.com>
Cc: linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Paul Mackerras <paulus@samba.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	asahi@lists.linux.dev
Subject: Re: [PATCH v4] i2c/pasemi: PASemi I2C controller IRQ enablement
Message-ID: <Y3ADGNw6iDEDTezl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Arminder Singh <arminders208@outlook.com>,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	Paul Mackerras <paulus@samba.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>, Hector Martin <marcan@marcan.st>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	asahi@lists.linux.dev
References: <MN2PR01MB5358D35DEBAB82A80629EBB59F3A9@MN2PR01MB5358.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mPWs60l+c46WSwEa"
Content-Disposition: inline
In-Reply-To: <MN2PR01MB5358D35DEBAB82A80629EBB59F3A9@MN2PR01MB5358.prod.exchangelabs.com>


--mPWs60l+c46WSwEa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 05, 2022 at 07:56:49AM -0400, Arminder Singh wrote:
> This patch adds IRQ support to the PASemi I2C controller driver to
> increase the performace of I2C transactions on platforms with PASemi I2C
> controllers. While primarily intended for Apple silicon platforms, this
> patch should also help in enabling IRQ support for older PASemi hardware
> as well should the need arise.
>=20
> This version of the patch has been tested on an M1 Ultra Mac Studio,
> as well as an M1 MacBook Pro, and userspace launches successfully
> while using the IRQ path for I2C transactions.
>=20
> Signed-off-by: Arminder Singh <arminders208@outlook.com>

Applied to for-next, thanks! One thing, though:

> +		while (!(status & SMSTA_XEN) && timeout--) {
> +			msleep(1);

Checkpatch complained about this one:

WARNING: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/t=
imers-howto.rst

Not your issue because you were just moving this code around. But this
might be a candidate for future improvements, thiugh.

> +			status =3D reg_read(smbus, REG_SMSTA);
> +		}


--mPWs60l+c46WSwEa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmNwAxgACgkQFA3kzBSg
KbZOVw//f61IwAT3+7pj46mSdeCMBH7jTcgwvVsjRoNpCQYTRVCwnNjdlYvK8ELR
YNm1MwWGBSxVyEzo3Aveyv37A0JGL03Ebk254NaMLM1Uo0NNXazxu7986Uw/e8xw
NhlzbFoSyH3/z0RjeolsfsTapWIHDG3URJwXCVFhBavB7pECzX4J9EW2a9f5la3s
/I/82rlp5XMQ2DGQBg74V7DOikuyg9C8zjobV4ZS6bNSeR6z/NwOgPuUFigQ95W6
RuoAcQvc+5L2chm9DTOygBapALqxzTU0UD+PYjWAOtEaUzfkJiktulRN6S2kqiET
uP/hUmONrylPox+Uj2Cuzs4iu/NBSwM6tlVQmlSpsSGcZWIuv+Yk0/ZYZJqtrmGe
jVM75X0IqaT2cmL4cjkmtjn5MZAV85RK0rknrvnoFan34+DzDo7k50spmotIhTql
WuRrp6l7id8VH0I43BULUyGiQJo2rxUiaPb/dY/BFlPPXjd3AwCkxPY4/uwSqOn+
/hOMjquEXb6kOoW18OD13MiiN0y4dcfDVPwccBp4uVEdC54VMEHFyMGwQwtYjadx
IQHY0iSbMO33hLAQ5JLo6svDW1/DssP20QZU1r4tq0l3iVGZwuDm/ojAKsJ/jeaF
Pqt1AqSxcJ4DCThgcLnmufmYy5xBiEV3Cb4YltmVmLJQ4g5YFUg=
=b5o0
-----END PGP SIGNATURE-----

--mPWs60l+c46WSwEa--
