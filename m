Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7C13210
	for <asahi@lists.linux.dev>; Thu,  9 Jun 2022 15:54:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E221C34114;
	Thu,  9 Jun 2022 15:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654790045;
	bh=d6IpKcReOM0BAzYys8GQhWOY3da05wd4CwqGIOwNcnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Db15ot9lABxO3UDTeilr4THVUTIhS5xY67yd39M0pz3GRSLiVbaUWWzAqu3M8vDpl
	 eZ1Jw4GN7i49o6r941HRcZ31gj0EcToE6PjyDn/1IT39g3MDPXc7Ef+EHdo5+XThCj
	 65tGwXPC/wqgbmiUQ5mdFDio+QFPuNpFZBUIjyIBHSzrf/6C9K3cQCkva6OzChTm3J
	 i8hgY7BZkrDYydCMFPTWdPam//3L6igIRKdTXs+KseTpoZvFoagI5jImY+D1s6dVji
	 XgJzO9/uuSA4lR/zr4S+fJBUDBoSGMpzCnECkyjAVWIHS+nFuuT5amgxmWlYN4rjjC
	 0ITOxZtE8FWiw==
Date: Thu, 9 Jun 2022 16:53:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev
Subject: Re: [RFC PATCH v2 0/5] Apple Macs machine/platform ASoC driver
Message-ID: <YqIXlwTzQWwtzbdN@sirena.org.uk>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="th3PZ0FiY0ufDWny"
Content-Disposition: inline
In-Reply-To: <20220606191910.16580-1-povik+lin@cutebit.org>
X-Cookie: Space is limited.


--th3PZ0FiY0ufDWny
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 09:19:05PM +0200, Martin Povi=C5=A1er wrote:

>  - The way the platform/machine driver handles the fact that multiple I2S
>    ports (now backend DAIs) can be driven by/connected to the same SERDES
>    unit (now in effect a frontend DAI). After previous discussion I have
>    transitioned to DPCM to model this. I took the opportunity of dynamic
>    backend/frontend routing to support speakers/headphones runtime
>    switching. More on this in comments at top of the machine and platform
>    driver.

This looks roughly like I'd expect now, there's some issues from myself
and Pierre but it's more around the edges than anything big picture.

--th3PZ0FiY0ufDWny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKiF5YACgkQJNaLcl1U
h9AlNgf7BPncxFpRN1RmT8l9lbVRvoJyMKLO0MWxXCBeHx7bbO/8GXmDIpg/VmXO
J2vqhrtWSMijrffbeG4efWXldQMGhUAhz/GgB1FFgAdwzgE+6ndaNCEP8HGG9dIP
xUlcJxbPK9XGpJEgqG+ihrsaA9WjcXD0HaH96yjCoL687emR3fOXtKSjOC/Dqebp
GOg1+ilWEn1BRvCdj+CtBWLiPWcrY9AD8ObLl0fYql8FH5KYoF2FWNsfaGWE5Qh8
He2vyrMlaFwsqPZcUuznV0PPE8tF/cq8syXxk4ReXHeq8WPp1ttG+egBd0fTlRys
YKpwyOdMaqdnrDwryruzRc9I0CrW/g==
=YWSx
-----END PGP SIGNATURE-----

--th3PZ0FiY0ufDWny--
