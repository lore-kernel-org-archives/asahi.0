Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198648286B
	for <asahi@lists.linux.dev>; Wed, 22 May 2024 11:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716376467; cv=none; b=AyO2MwxPSgvc3DE0tkKkrvJQ2QSY+JBhYzBfSrPk/7CS5SXzyjsUw3tCr7wPdJHVdA/xp3l4WrofRMDV00k0waRswnw5wqLukQQa1KkUUH6EwU8JO2WzDBOx5xnkKRYizve0pcQoiyAeeemtrqTkwsxjowpGQGs1rd/OJr2rRRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716376467; c=relaxed/simple;
	bh=13cF2oAoheHlFE9CxjxQWnuqJHHkJsRAHVOq5/hYeOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7MhowaunxOWleS6LGjiTNe+0mHok0Ef2s7vD/X3RMd2j5cigRS8T2KloEajGgHiMvHo8mxXlet68tW9wCGLNLrA8C1U2/tCKK0rku3y1ihTP/p3BeMd9oDoDtVRsZLNz8QbMTFkB1u4ZQSgbJA6P2ViTGhrD3aZfW3L6AeILmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QTGUw0Fh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QTGUw0Fh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED6E1C2BD11;
	Wed, 22 May 2024 11:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716376466;
	bh=13cF2oAoheHlFE9CxjxQWnuqJHHkJsRAHVOq5/hYeOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QTGUw0Fh+2C3P3nCZN/tuqv23QNlkXgigf8ycx9FS8y7lak8kWXjMyVqyEtIonlRe
	 Okv2+OvdMLYNGPPdQMFavZROlKwUbIii0SnA8AZk84fklQDWuIEz+FJMmr2rpRvLl5
	 XWYlVNtWYE0XR392wZ0RU2Yha8QpXum8LkWSkDz5LbE0uCGO/7cYZGJV280r/J03x0
	 xF8p/QxYpnwIbXwAjITlCHwGaE6T2vd0ZgQAmz3SsYuxz4xCKec7Bx9nUgcRWkGchr
	 ZBqzBP5l7PlH+4sk+U7pTJBzqi6Wk8TctOtu+vmE9Tr0wlWZmw0iLhi4lnYAkgrXTE
	 C8upFGODjvmEg==
Date: Wed, 22 May 2024 12:14:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Will Deacon <will@kernel.org>, Johannes Nixdorf <mixi@shadowice.org>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev
Subject: Re: [BUG] dm-crypt broken after 2632e2521769 ("arm64: fpsimd:
 Implement lazy restore for kernel mode FPSIMD")
Message-ID: <1ab2c594-8d6a-44d8-809a-902a183000ea@sirena.org.uk>
References: <D1B7GPIR9K1E.5JFV37G0YTIF@shadowice.org>
 <cb8822182231850108fa43e0446a4c7f@kernel.org>
 <Zkw9kK0sXIgfqd01@shadowice>
 <20240521183445.GA7154@willie-the-truck>
 <806fe068-893c-4167-8162-699328014e2b@app.fastmail.com>
 <79a5261a-c215-4db6-a81a-558223f48ab8@sirena.org.uk>
 <d212a141-b94f-4717-8ab9-c150dc06dc30@app.fastmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kz5SA+DaPiZ0Ogf2"
Content-Disposition: inline
In-Reply-To: <d212a141-b94f-4717-8ab9-c150dc06dc30@app.fastmail.com>
X-Cookie: Bridge ahead.  Pay troll.


--kz5SA+DaPiZ0Ogf2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 11:23:10PM +0200, Janne Grunau wrote:
> On Tue, May 21, 2024, at 22:21, Mark Brown wrote:

> It's hard (impossible) to reproduce just with fio and fp-stress. 5
> consecutive fio runs (each 40-45 seconds) without verification error
> in fio or Mismatch from fpsimd-test.

Huh, that's interesting.  I guess the I/O or multiprocess stuff that AV1
decode implies makes the scheduling more interesting?

> In the majority of cases the mismatch is reported for reg=0.

That's about what I'd expect for a "we loaded the wrong register values"
error.

--kz5SA+DaPiZ0Ogf2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZN040ACgkQJNaLcl1U
h9AKuAf/b5x6EDPGACzTLy5jAzNHoVO5nkruz6PwclxShrZg47lFFOYlCsO/sagA
5miKvz/Ljez6bAjMdYGPx8D5OJtHy9NOAClgEWpxRqB0TcKq3GSlwsgkbeK5P76E
bA+8iydPy+g0Hqzo42eIzlKk/4ecYuUffeOCkcAyaF3ST6weCXPw3dk7XZtDSqin
VeX2ZjHkp/R2P45ND2dh0KJ0dhZZxFbb2ZOVU1zvxpkEG8/3JAGFXiflEfn5GUa+
rchiYpIXVwvLXqWRGSsdaPIzGO+Z9g215HLN4O1r4pZ/XMn3QxQ0BEK8KOreLZUZ
sO6WDZS1TdSvcijUs7OfEZJxJuEbXA==
=2drg
-----END PGP SIGNATURE-----

--kz5SA+DaPiZ0Ogf2--
