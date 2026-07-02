Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725C3313E34;
	Thu,  2 Jul 2026 19:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783019944; cv=none; b=mE2kSgjXnBqt4gbd8AkrpxfFOd+qEFyHqLmFp4o0q1fWDyuvn/3aJC+LFc5EE65F9aIbcRaHk7Y5jM9TVFM5NYLO1d3pLgjJjqB2/rCpp23t0hrjxxxpj74xSpq3RuJrhshui7l9OTq+mqafACJNIwHHJC4y+BiQbf3GHPXhEi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783019944; c=relaxed/simple;
	bh=TlEL3eCJeYiJLW2NNTM3t/jPoZjPfvhxGhM6HT00XMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pl5mtqeQb5ZbGrAI1IuqFQmrFbWhtQkQjSSuNx+Ay8RdTMicoMVW6Z6DzScArJOfvd4IdwskDR6sviekc+C6U37ozXRR8K/d7CeifeIPBHVeN+OKUJqy78UjYSwWn+UaZ2taheEyl7RqjbF7xly8jKp6k+ydtXX2skciGyuLAkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUYzmCEb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUYzmCEb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6D61F000E9;
	Thu,  2 Jul 2026 19:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783019943;
	bh=5DpZR7hy/lYQjk9fkUaq4KszFvmgNMTrxboiLH/D098=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SUYzmCEbF70SHkDYOx+MOjMQJQknv8liRNr2dstY7HJsRvOWH3l2/gF6kQR49FS4H
	 Huy5XiNzTyFJSHivHnTdVYyS+c4knzO7jaEScktTItsLJ7whC/7ifuuFBgOcUFTPLc
	 0cfNhap8UrTCSlfCU0tARr6xQFjlLqlshg7XwjMNJ89OuuChTi7zREfKaoHv59NJEo
	 O/ZtQZiOejMTMarEuPbCAs4tl57FvnWb8NzGQhp6rOqEjQSd9Brd4AreANqlsLSJ5H
	 y/lum7Nff69wWi3zq90n1I8qgNqTTxtvuvQgzbWBUX7DUKkyzJ5aiKKb4wxTXuTLqP
	 aP8FezItzDztg==
Date: Thu, 2 Jul 2026 20:18:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: soc: apple: Add bindings for apple PMGR
 misc controls
Message-ID: <20260702-kitchen-census-d79e1abb9f36@spud>
References: <20260702-pmgr-misc-v1-0-4f075a3a95c1@chaosmail.tech>
 <20260702-pmgr-misc-v1-1-4f075a3a95c1@chaosmail.tech>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ocjsct3ZYFMJTFmH"
Content-Disposition: inline
In-Reply-To: <20260702-pmgr-misc-v1-1-4f075a3a95c1@chaosmail.tech>

--Ocjsct3ZYFMJTFmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 02, 2026 at 02:06:26PM +0200, Sasha Finkelstein wrote:
> Certain Apple SoCs include additional PMGR power states that are
> controlled via a different "misc" control block. On existing SoCs, this
> includes the fabric and memory controller state.
>=20
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml |=
 45 +++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                                                            |=
  1 +
>  2 files changed, 46 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr=
-misc.yaml b/Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-m=
isc.yaml
> new file mode 100644
> index 000000000000..30abedc67fa4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.y=
aml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SoC PMGR Misc Power States
> +
> +maintainers:
> +  - Sasha Finkelstein <k@chaosmail.tech>
> +
> +description: |
> +  Certain Apple SoCs include additional PMGR power states that are contr=
olled
> +  via a different "misc" control block. On existing SoCs, this includes =
the
> +  fabric and memory controller state.

Are t6000 and t6020 the "certain Apple SoCs"? I assume so. The bit about
"existing SoCs" is confusing in a binding (although it would be ok in the
commit message), because you run into language semantics that imply that
this sentence is about devices to the ones you're addressing here. I
think you can just do s/. On existing SoCs//. And add an s to the final
"state" to make it "states".

> +
> +properties:
> +  compatible:
> +    enum:
> +      - apple,t6000-pmgr-misc
> +      - apple,t6020-pmgr-misc
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: fabric-ps
> +      - const: dcs-ps

"dcs" means memory controller then?

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pmgr_misc: power-management@8e20c000 {

If there's a new version, drop the unused label here please.

> +        compatible =3D "apple,t6000-pmgr-misc";
> +        reg =3D <0x8e20c000 0x400>,
> +              <0x8e20c800 0x400>;
> +        reg-names =3D "fabric-ps", "dcs-ps";
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 15011f5752a9..5a29bb86499f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2607,6 +2607,7 @@ F:	Documentation/devicetree/bindings/power/apple*
>  F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
>  F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
>  F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
> +F:	Documentation/devicetree/bindings/soc/apple/apple,t6000-pmgr-misc.yaml
>  F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
>  F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
>  F:	Documentation/devicetree/bindings/usb/apple,dwc3.yaml
>=20
> --=20
> 2.55.0
>=20

--Ocjsct3ZYFMJTFmH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaka5ogAKCRB4tDGHoIJi
0tlAAQDdgE9j16D8wb54N1NhXZ6tE6JQTMjWT4k+oOAHOEGHXAD+Igpwx/8G2BL5
x1QpWLWp7T4VAbJhllS/qG+ZIeZTFQY=
=lPlg
-----END PGP SIGNATURE-----

--Ocjsct3ZYFMJTFmH--
