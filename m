Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C0B51C52
	for <asahi@lists.linux.dev>; Tue, 21 May 2024 20:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716322886; cv=none; b=ZuK+E7wbhEcXbIXcZRHnWqb7W/G0z1tgoYHUhIWUYoA2dwhWFe1LZiYqayvVtV1mucFWhs/lCi/HmN05xEUIViPJ5GonYXp7WNOu+N5P24lD9EHO0fTKTSFpmjneK5qZmoypcOYAQnRXf/PcrOkLqcitlsuRasxSKfRtZWSzCCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716322886; c=relaxed/simple;
	bh=4Bxp3o5m8egWrnVzwxFyaKv4tTBy4O0+t6TzIEjPB8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooaGsRHIEB5UsDIoEYCtCmH51j2MmtCO2IEL68FygSBUxnaT/R/d8lpXOpfn1GzyQiwuevO/kcaIyfcp/u969BS2+BsgzomczEWk/p8RvaGj5h6XyuQqZ6NoWGoVLezmVoYKLQc0JlcdpyjhhS3KOpea4sfhQiDFxbKDq2xhius=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vAQgV9Uj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vAQgV9Uj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD601C2BD11;
	Tue, 21 May 2024 20:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716322885;
	bh=4Bxp3o5m8egWrnVzwxFyaKv4tTBy4O0+t6TzIEjPB8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vAQgV9Ujc/5rxEozNuVR4I/MXnk21COPM7/7iIhoru9RvlRGYuSBIbMmPJxbI88+8
	 vC2OKQ9sIF30Jn20ncYnsG6ff0Wg19wmOPIwlfCYHtdPiJ67pZXI2J+LFtgmgEVHnX
	 rq0Qx6MW9PfcsFElzLLpREOdGjhsJWZho3hPOgUaYeAiWurmsMqNM/8p+SDpz6/xmi
	 gJYE+pUbTB+UGRoF6g346P3FChgVhOIjxeck8b94eHIVDbW7ftjSNF7Q/7jMPXgpy+
	 hnew+8q1/Quh2HsUM+zhhSQ56fGOmvAzHSmIf8BHDbLbW0P9DMkqq63CzwUNrHx7DP
	 sHZqOjUVHfwhQ==
Date: Tue, 21 May 2024 21:21:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Will Deacon <will@kernel.org>, Johannes Nixdorf <mixi@shadowice.org>,
	Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev
Subject: Re: [BUG] dm-crypt broken after 2632e2521769 ("arm64: fpsimd:
 Implement lazy restore for kernel mode FPSIMD")
Message-ID: <79a5261a-c215-4db6-a81a-558223f48ab8@sirena.org.uk>
References: <D1B7GPIR9K1E.5JFV37G0YTIF@shadowice.org>
 <cb8822182231850108fa43e0446a4c7f@kernel.org>
 <Zkw9kK0sXIgfqd01@shadowice>
 <20240521183445.GA7154@willie-the-truck>
 <806fe068-893c-4167-8162-699328014e2b@app.fastmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BUuElTPxLPDj+peI"
Content-Disposition: inline
In-Reply-To: <806fe068-893c-4167-8162-699328014e2b@app.fastmail.com>
X-Cookie: Eloquence is logic on fire.


--BUuElTPxLPDj+peI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 10:06:36PM +0200, Janne Grunau wrote:

> Running SIMD intense workloads in user space apparently increase the
> reproduction odds. When running AV1 decoding using dav1d in parallel
> errors appear faster. Errors manifest either in changed decoder
> output, fio verification errors or both. I'm using `dav1d -i
> sample.ivf --muxer xxh3 -o -` here as user space SIMD payload but I'd
> assume the exact SIMD user space code doesn't matter as long as it
> runs on all CPU cores.

There's fp-stress in tools/testing/selftests/arm64/fp which will run two
copies of fpsimd-test (from the same directory) per core in parallel
looking for corruption in the FPSIMD registers.  Specify '-t -1' and
it'll run for ever.

--BUuElTPxLPDj+peI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZNAkAACgkQJNaLcl1U
h9B39gf/eWll8un9LbWlxi8LyROMED0urr/p74rtue5dQJRABzchcWmQdNInKYyV
Yw/QvNferqT8uPDlCqlC988rv0Rm0EmImeMJiVT1ss6FcAU00IGuNoTtnr8scnRk
uq+HcM4j4NNAP7x0Qt/o8EkBWGagHDEM75Hj1q4Y9ZrUaq8cbF41CDlXgGb/LS4v
/IDnv5eHVvIgd9H+INKeUI+/O1ofihaZkFS5twzL2iUIDCZSHKDn6OLXkTc0BOpJ
ExMUhL2zRel9VsWbHH9eODn913D8R/vylef8lh4xdgZONoobtIIUJPH/uS0hlXLh
a9Z5Y9RQgHpifNQ87/cIexSNFaid7Q==
=BaX4
-----END PGP SIGNATURE-----

--BUuElTPxLPDj+peI--
