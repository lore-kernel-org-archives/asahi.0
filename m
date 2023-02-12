Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A2946BB
	for <asahi@lists.linux.dev>; Sun, 12 Feb 2023 16:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43ED0C433EF;
	Sun, 12 Feb 2023 16:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676218832;
	bh=8c5ZE6wso1sJzAexSJLkIIxBqt9QGbBE23FLS8hkIhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MRu6kci35NM7pkS3wIjl4HLQYbPUGybMY8UUgiOlUs4XDI/inlal4p3CPd6pNiUAM
	 I4rMRxRVv85R44J1NfI3P494gCKdH7BGb/jcfcvm1KhCC6RfkGcWsC9Dkr1JEWS2zX
	 k6DR5zqDzoFTX0bl8NlF4PVCF4J13oZaDjsrn++3yw+t3uyOqCfg1Aaj63EbOzr4FD
	 wKt4q8+/CPL2J4c4QFyFmgZ9MBFRp2v7wITovYNmmxzPUEHy4qCheHNNrP8O71n5Fb
	 4YfkfXCU8/W5q+VDC/VCMf5h4i1itJB047QJ5mn9AeGuEy304aBGwz8BtVtf2GLi6o
	 9ZwuonChVZQ1A==
Date: Sun, 12 Feb 2023 17:20:23 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 12/17] dt-bindings: i2c: apple,i2c: Add apple,t8112-i2c
 compatible
Message-ID: <Y+kRx0SKDO7aadnX@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-12-cb5442d1c229@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ST6dBu1VamLAYVH7"
Content-Disposition: inline
In-Reply-To: <20230202-asahi-t8112-dt-v1-12-cb5442d1c229@jannau.net>


--ST6dBu1VamLAYVH7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 12, 2023 at 04:41:22PM +0100, Janne Grunau wrote:
> This block on the Apple M2 is compatible with the existing driver so
> just add the per-SoC compatible.
>=20
> Signed-off-by: Janne Grunau <j@jannau.net>
>=20

Acked-by: Wolfram Sang <wsa@kernel.org> # for I2C


--ST6dBu1VamLAYVH7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPpEcYACgkQFA3kzBSg
KbbkDg/+M0Ppq/ZZ/28h8ANuPUws9poi5kn4SvSpZN7feKgWRKAjLRaq1jrdwT9W
z9C7Jh3AatgXFe1a8vG/jAE9aqnmgBrj1Sf+Q5SIn40AarUh7M6SgXsvlqup0BdU
ArmcEVc+JLSYS+UdsEvLzENePuG05LvjSP233F3DN1mhnXBz4GqiXS7cxukC+rYe
FxFToPUq/c+6kmOZjao7GJNinnSYbSrn2zVtttl+pzzOJWCj2ryRvhoaU4E5rE1q
SkDEHtX43R2kRgqx7lT0nnpiJ4C+RrRzY18BmRzpSZT9BkLOVjBkvvC+py5ieP4x
qVPwMTB8J6eIjvb0bVRfZe9x35v3b3bsYEv7mSNZHAUevzl1TnX86v+k65fFkU61
ZQlwiVFkQIc6SlYx2I/cczLTtPGfaIsoDlp9/EFgSXTjlOupdkpzyYmCoFM8nvmX
Pfj0FnXrJYZXqSBDm638iL8LUvg5u9QU0Y8uxBuTKeFVPZWqYt+cnHyruXaySsjf
qI8ryCIeb9WBzeqgc0/3kspotqf9phtQzPhGg31xaYvGfaFrkOtu06xoOX+UjO6Z
3Snh84ZtaCm1DY8uY0LtPdVmPSbf5thDrDn26usRkAikPFhlRCxYfiLbSZ8MIO/E
rIfzDwPNAMuhVW0X32bbDlCC4+LAtnKEOEObw6ZiKXEsZ+Jw5Z8=
=4LS4
-----END PGP SIGNATURE-----

--ST6dBu1VamLAYVH7--
