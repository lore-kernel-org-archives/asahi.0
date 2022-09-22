Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDD42560
	for <asahi@lists.linux.dev>; Thu, 22 Sep 2022 22:19:53 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYV815Q9pz4xD1;
	Fri, 23 Sep 2022 08:19:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1663885185;
	bh=u29mhIvpahCVfLIeUUJ+Q5zVnoirDkHZjYdUJFVs5oQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HdHw5oYkasNYjRn5gszsBXTII8c/u2/5Utd2mwHx7xY7I1qsB9Czqe9dCWLweKvuH
	 K+VNnMh4UTIrmsD4N/KIFdojWmy/r6QSGhaSo9JBhEeR5VTcs8mzdjxBpHvernFA9I
	 xlk6/9eK69JtHSjWH5DW0Cj27NznwQVBKEVekFdo8QHTblo6HOV6yK6z9H7dNIVs0F
	 I+oXihVkBjrl0t9a7dhE1mrTycct7iMxJN/VSjRD27KBryOsesc6Qp7cJFngXtUP4w
	 HL1OP4oQNUQl97dYb7f6DPMu6tWhqsc5AyM/iw8pNnR7U3V5pK4u93RiHkum4Gq9Km
	 y/8MF0gmNb+TQ==
Date: Fri, 23 Sep 2022 08:19:28 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Hector Martin <marcan@marcan.st>
Cc: Asahi Linux <asahi@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: Please add asahi-soc to linux-next
Message-ID: <20220923081928.6172c4fa@canb.auug.org.au>
In-Reply-To: <2159b672-4db7-5add-8046-ed5354dd5343@marcan.st>
References: <2159b672-4db7-5add-8046-ed5354dd5343@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/YQ7ShGKyHkj//oJBnDgl6P9";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/YQ7ShGKyHkj//oJBnDgl6P9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Hector,

On Thu, 22 Sep 2022 23:29:29 +0900 Hector Martin <marcan@marcan.st> wrote:
>
> Could you add the asahi-soc trees to linux-next? We are downstream from
> SoC and would benefit from testing in linux-next before I send out PRs.
>=20
> URLs:
> https://github.com/AsahiLinux/linux.git asahi-soc/fixes
> https://github.com/AsahiLinux/linux.git asahi-soc/for-next
>=20
> (Right now we have no fixes, and some DT changes in for-next)

Added from today.  I have just you listed as the contact at the moment,
please let me know if you want any others listed.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--=20
Cheers,
Stephen Rothwell

--Sig_/YQ7ShGKyHkj//oJBnDgl6P9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmMs33AACgkQAVBC80lX
0GzwtwgAj44qDB1qKHk382gLm8Oyl9RT/nNE3AlJJRQAMTnwMQBqKHznjQGm8P5L
6n413A7xXoRGNeHsyTiVY6j8wxktNvqWvStMYgEGl9njC28og/z3lTivmule2/to
FUWkzvnmZIQ3mVrMTBKwrEa/e42g8LvgOKvVOV+Ou2FsFoSvoyLHC/be4C1Y1Q5Z
BPGUXWmjbUtvlf5rZarALm/YX9lEYhPMwUNVuQ81q1sMb2D2Vb75phRkPiUqGX+O
7RX4WpHFBckbKL0xAVi6wM17fxufJciedcRz313lbSLrENCrFkmRu2yQCf6WyHsJ
ZhJDdnNWCU2HlND22XnidNpUt27w1g==
=ymJI
-----END PGP SIGNATURE-----

--Sig_/YQ7ShGKyHkj//oJBnDgl6P9--
