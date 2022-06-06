Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D001A7E
	for <asahi@lists.linux.dev>; Mon,  6 Jun 2022 19:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D122BC385A9;
	Mon,  6 Jun 2022 19:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654544687;
	bh=TdyzOHBijyDDuJa2kymQDu3XUPAwTzmKg4DRuJ4dnrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KfuwYUHQcSCTFzs4dSzoQUcCQF+ZZHaLVUn0UV2rRBcCmdFfEhGh4NnKetgvUk1kI
	 O3LAEHez8RgANUrufP2o/DWqEtA6dihYZEqwTKKHZp5348tIXqvii4XljVl7dEZB+y
	 DykCz2bL4OOTh3E9WAaR9B70f0zqex800F83+hTZpmET7+ZXofKcLNe2iJ/n8F686P
	 ebQ9auP9Dz9pv4F6rzmNLwCGICqCU4deKMQtmn3da/jbmB6dclsKHSkje9jJUUDl9J
	 otobhR/BlmJMPh2NAx0Wf5qo6D0dj5J/LEfzJ/qCkcpPSz+RBd350XJLhb9kLRql/m
	 Zty0pLS61y7Pg==
Date: Mon, 6 Jun 2022 20:44:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev
Subject: Re: [RFC PATCH v2 1/5] dt-bindings: sound: Add Apple MCA I2S
 transceiver
Message-ID: <Yp5ZKZ+MOW/75KXi@sirena.org.uk>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
 <20220606191910.16580-2-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AlCYaszFUFMsVBIw"
Content-Disposition: inline
In-Reply-To: <20220606191910.16580-2-povik+lin@cutebit.org>
X-Cookie: Have an adequate day.


--AlCYaszFUFMsVBIw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 09:19:06PM +0200, Martin Povi=C5=A1er wrote:

> +  interrupts:
> +    maxItems: 6
> +    description: |
> +      One interrupt per each cluster

Other properties are specified in a manner which implies that there's a
minimum of 4 clusters, eg:

> +  clocks:
> +    minItems: 4
> +    maxItems: 6
> +    description: |
> +      Clusters' input reference clock.

--AlCYaszFUFMsVBIw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKeWSgACgkQJNaLcl1U
h9Aqfwf+NBQXCTVBk663Vwcd22hz9vBXtdVIMfmgPBYszdHc/ZlYb3vSsd7l2Cb4
SvxdYa7uixpvVOi1yoFW0M7G4fBAVHT1PEt9s2sRkE0iFu4QcOaUfKDyo8pY9jdc
ak3EHjJ74hPZtcHSF4KfFkKIJm6kl7mgjpATzUfhi8D1GGDXmyaGBBncDgCvUnEl
ulVKVpRQcd12KVDLfvzZZCDMIJOiZO6WF5F3OtN0alwfekPGU9poRs+QxpjAWxHf
Q8WIk7rctnKt4HREyq7egXNJuG3V06K3jzZnwIT7P1n9ye7RrZH87PR3oLsQIVWd
zh6Ibuyl9Ia2Zh9q4RLPcaLE+mbYUA==
=TRq/
-----END PGP SIGNATURE-----

--AlCYaszFUFMsVBIw--
