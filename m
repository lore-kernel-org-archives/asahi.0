Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5B6304976;
	Fri,  3 Jul 2026 16:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783095554; cv=none; b=Yi2h1hAV+m0/+S8ZCCaHGRDRBoDDrPoLzbyvwl4jt8wmQUdspDfyXOD+QCu7pSCoo+V2KnhH4uOPBZ3JMze+yudvZ4Qt5WmZQkgAk1PdZgK4LhgN/Zwr1z0nteBLY1Dxn4WeYYEaO7aVVRXEWVUzGKlWCietnAFRdnyZMwPxiJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783095554; c=relaxed/simple;
	bh=MDqV3FE/QURKj47Ug9qhhO3Rw6xeNdaWbeaJ1FuMeXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qlvc9EHGRmHzPlHq6our5QsaZNu5Af1YQf9rCYln36WggZX7dfppw17D5mUBgIsnGSIVOhu6erulRtrfjgM4x0KRYl8v9oHuwgabMhptlBgREeeF7Na60u+afTf/KpXZChZSAhkt6f7z3Z/l0f00dZoA1NRvrV+2Xj8GL0XUy2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/j4ZWUr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/j4ZWUr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6131F000E9;
	Fri,  3 Jul 2026 16:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783095553;
	bh=MDqV3FE/QURKj47Ug9qhhO3Rw6xeNdaWbeaJ1FuMeXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d/j4ZWUrtxifnX8y919J8kuQuU5DEj1oB14B6kihoAoypJZRemNaeQiPADNdNsyYm
	 BKOCus/eZWIPGtPhqVi4YPlgvopBcbw1dilQiwOzO/FYzr0DfSHgaj6yNVGY3XW+U0
	 u2IKQRCJPgCVFB7HMRVp8Bms73PRBDjuC+Jna+HUsDOJXbhlxA74ZekbcfutiNkFO1
	 QMGAOrkyEpsVLwoDKqWVEIEFA7qYSS+i8Ns2MdC5hJfWNfyRAZwHLzOYxKigfjn3NN
	 M1Gp70mq4T9ehJKkvaOroeS6O8RhG5l456YtAHQcErARJxNPRQZCjY5+Ne1fQyXTuk
	 C4ZZaF2jOLRag==
Date: Fri, 3 Jul 2026 17:19:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: soc: apple: Add Apple PMGR misc
 controls
Message-ID: <20260703-acre-buffalo-815de034999e@spud>
References: <20260703-pmgr-misc-v2-0-4b26ba10c5a4@chaosmail.tech>
 <20260703-pmgr-misc-v2-1-4b26ba10c5a4@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ew3fU/QzK+CdPJ5y"
Content-Disposition: inline
In-Reply-To: <20260703-pmgr-misc-v2-1-4b26ba10c5a4@chaosmail.tech>

--Ew3fU/QzK+CdPJ5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--Ew3fU/QzK+CdPJ5y
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakfg/AAKCRB4tDGHoIJi
0jYaAP0aSmWIipYQoz1Y9zbqOWoAnynQ5pXZqcKDuusK7Hf54gD/SC1++acH8F08
FMU2DVs0tWppBFT9gNOmErqDtSCT+QA=
=K5Z3
-----END PGP SIGNATURE-----

--Ew3fU/QzK+CdPJ5y--
