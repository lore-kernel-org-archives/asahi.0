Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1980335E1B9;
	Mon, 10 Aug 2026 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786377729; cv=none; b=oxEFD+m1N7SE2ePJL683KSlJ5gUOsF3KtTUOtaLlp8y/8chfrujzGUXYHZAheLUGHwuBftopw3LdAmighF+fOD08cLraxqnkBEVCRNZlT2qIYwqh4LQHiktV7xyNQyageeJPkA72N3XPsvUQDemwb9pTR7l2m/jc+zoi9hV3iyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786377729; c=relaxed/simple;
	bh=fndTkoy1bq+J6Frr7IYIubz9f9Q4W8b/YfOVs/6jl+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gEvZNfyWnnMbMMDYm/RQHxqrTL3iVp+SdTByhi2wWde1J350DzzpDsxCm5bilAsb6K449ZWZysHL/xrCzpJH9jS6rJkaBLQmG4wBC1Z5AIxE2uNhJrT6RZPPB/p18wtJTtCzulQMXYLbVSAI7/TmA3f33Y+WzIstFXQF9o7Sof0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hVWKSlWe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hVWKSlWe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29D2C1F00AC4;
	Mon, 10 Aug 2026 16:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786377726;
	bh=w7p43VGfb3bUIVfnjYJPEQrg/m2q3ZK4huMmdI2LR14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hVWKSlWea0NFTRlkHdkxXXtSYk6ZGTQm45LFzbXdo2ftzRFvRrbrdp+g90ypQnMTM
	 e4HhyifWyjioNidwSf2MUPN1M5pPSyJ1qsIuixqmoU2JDkQqrSM5L0+OodQLHd6WLs
	 DXAAWVdj6sCGagNMww81ZxcR7IHhybQlUTTa6KYWji5xJcv4FffmMH96+C26ORxCO/
	 /bq+23IBbxAT3tqpbxNgFZT4fwrkxSp8enPrwBU1fkejZjU/TJeHdBAhfjXNn06a3G
	 Gh41XIn1lavYGauCtavr3w/eABlXuAtxUua0PATJGe4ThLXpjfV6H1lLE9xm3p2lW5
	 yEPFgfICsmSzw==
Date: Mon, 10 Aug 2026 17:02:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: reset: Add Apple SoC CIO reset
Message-ID: <20260810-unveiled-specked-a856434db8df@spud>
References: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
 <20260809-b4-cio-reset-v1-1-4f33777d9b4b@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="N2Sxqftfd7ROY7yz"
Content-Disposition: inline
In-Reply-To: <20260809-b4-cio-reset-v1-1-4f33777d9b4b@kernel.org>

--N2Sxqftfd7ROY7yz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 09, 2026 at 02:16:02PM +0200, Sven Peter wrote:
> The CIO (USB4/Thunderbolt) blocks on Apple Silicon SoCs have a reset
> inside the power manager that has to be deasserted before their
> co-processor can be booted. On t8103 each port comes with a dedicated
> register page, represented as a standalone node. On t600x a single
> register shared by all ports of a die is located in the middle of the
> PMGR MMIO region instead, represented as a sub-node of the PMGR syscon.
>=20
> Signed-off-by: Sven Peter <sven@kernel.org>

Fix the sashiko complaint and then
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> +  - |
> +    power-management@28e080000 {
> +        compatible =3D "apple,t6000-pmgr", "apple,pmgr", "syscon", "simp=
le-mfd";
> +        reg =3D <0x8e080000 0x1c000>;
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        reset-controller@1a034 {
> +            compatible =3D "apple,t6000-cio-reset";
> +            reg =3D <0x1a034 0x4>;
> +            #reset-cells =3D <1>;
> +        };
> +    };

Probably the fix is actually moving this to the parent device bnding.

--N2Sxqftfd7ROY7yz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCann1+gAKCRB4tDGHoIJi
0jBgAQDYWOEGR74Ds6KSZUGl/Cm2Kr3fF2JYxWhCO3HCFEXHvgD+N2kbKxt/f94d
E6xkauGWWWPsmeqbgKCFEXXuvtDnJQo=
=iapb
-----END PGP SIGNATURE-----

--N2Sxqftfd7ROY7yz--
