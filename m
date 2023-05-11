Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08CC36B
	for <asahi@lists.linux.dev>; Thu, 11 May 2023 01:11:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC468C433D2;
	Thu, 11 May 2023 01:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683767500;
	bh=M9+WbndZqXjkrw+21DO8YKqOQHdc/suzPYKkitzNKlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KjtkEhyYGHIKo2TpcTt5re5oaA6f/6cH7RQLUZm9PY5kI6YvvCNnU1eiyAzwO1amW
	 KNb3jYOdqygO8hsd1zOEQ7Z8+H1PhCOBC6jQEFOfynZp/hk7mfXL94XwoNyLr7Db/V
	 sWOvXboJyR7S6GF3/lmtf2zZsZin/0cZf0XU4x1xtmQW2gWlYXYTO52hy7wR1Zpq1t
	 Ukj5M84eN8it2jp3E0Z3q7lU/vxe4sKWqa7Y6Z1gXnaWBxSW0LNu/06Jralk/P5j9B
	 d1D4G2k/LS4K8FUCI8dJMXMV3/dhUU7OFdghiXsuiI+Md5tbo9aZE5tUy52tyasFBR
	 oVqlTFR/DYBwg==
Date: Thu, 11 May 2023 10:11:37 +0900
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	asahi@lists.linux.dev, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
Message-ID: <ZFxAyeOteYo6nGlU@finisterre.sirena.org.uk>
References: <20230509163828.86003-1-povik+lin@cutebit.org>
 <20230509-marxism-plug-759c99ac601c@spud>
 <f38b984c-e49a-0686-a907-5d86ea93d7bc@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dVKFyKievi3KFxqa"
Content-Disposition: inline
In-Reply-To: <f38b984c-e49a-0686-a907-5d86ea93d7bc@linaro.org>
X-Cookie: Avoid contact with eyes.


--dVKFyKievi3KFxqa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 10, 2023 at 09:51:50AM +0200, Krzysztof Kozlowski wrote:
> On 09/05/2023 20:25, Conor Dooley wrote:
> > On Tue, May 09, 2023 at 06:38:27PM +0200, Martin Povi=C5=A1er wrote:

> >> +        00: 8.4 V Full-Scale Gain Mapping
> >> +        01: 12.6 V Full-Scale Gain Mapping
> >> +        10: 14 V Full-Scale Gain Mapping
> >> +        11: 15 V Full-Scale Gain Mapping

> > Putting register values into the DT does not seem correct, although
> > I know nothing about sound and will have to defer to Krzysztof & Co. on
> > that front.

> Depends whether these are really voltages or something else (e.g. gain)
> just related to voltage.

They are configuring the voltage range that the output will generate.

--dVKFyKievi3KFxqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRcQMUACgkQJNaLcl1U
h9Am9gf/eDLq7JsOkXRtURy4HihqO7yPqu3e2S1JEHN+SQ+UjhTk6j7moRz3Ou5V
Jjs+HhwX+qGWzPfogrNZ/ehao/dQ1ztZUdUIAhYVuGLCsWK2cm874fo5Epyk6pNx
Cjyyq3QqMiarq67+1Qb7zTj6IRVkLccKa0NneZG6+6xwJKYNltPuCm0x9gSajE9S
YbGwNzraPv1divCYpxxaJbsM9nxStNqrVh8M7oENo2tBnvxkgE2XdHhhr/Kag2Lr
QV1SPOOvcQJStFp7+jzw91NsmWahwagu3dQd83hk+hfZ/fyBv13jOFbNfJ0iXGAl
EZtXHVCvKXztB9LCPFE5rRk3W4jKKA==
=sDMR
-----END PGP SIGNATURE-----

--dVKFyKievi3KFxqa--
