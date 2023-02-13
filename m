Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76D033D1
	for <asahi@lists.linux.dev>; Mon, 13 Feb 2023 12:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1122CC4339B;
	Mon, 13 Feb 2023 12:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676291858;
	bh=uBHjrTWQKkfaPwze/tEkM/PBOCV8FGkdpjBjVEqbGic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jiwrzEwrU2PFdlUVdVzzWTVdEqD6IhKKf5TLMYAJgikO90BhA6kETslVbsYVLlE7M
	 UkLhfirCj4SLItq8VgwVeIdscYboRy53D2CnkqpQhZXAXBrrloDKk4JMD5NztaBkRC
	 aUsC0UPHm2o1PekgC9katxXe+z9TYbAsq/JyH2TLgepyo3LgfzEc02OI/+o/s5LVtL
	 YoOgP/uxfGacHbegdtVB6jISNO1Koiqp7vbQ8NE8E86tfHcijsymTDFLUlQ9ajQvPT
	 F0pdJBhyKUpANdwuQDsA2Ch/L1HQxYGt6ZAzOft1MYZtNIT3OrEClZfy6Ww5qAOafO
	 6SSa53TOqQpTA==
Date: Mon, 13 Feb 2023 12:37:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 14/17] dt-bindings: sound: apple,mca: Add t8112-mca
 compatible
Message-ID: <Y+ovEeS5KSkiHHQ1@sirena.org.uk>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
 <20230202-asahi-t8112-dt-v1-14-cb5442d1c229@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hLckiemEQMgkNtNC"
Content-Disposition: inline
In-Reply-To: <20230202-asahi-t8112-dt-v1-14-cb5442d1c229@jannau.net>
X-Cookie: Serving suggestion.


--hLckiemEQMgkNtNC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Feb 12, 2023 at 04:41:24PM +0100, Janne Grunau wrote:

> This trivial dt-bindings update should be merged through the asahi-soc
> tree to ensure validation of the Apple M2 (t8112) devicetrees in this
> series.

Given that we're at -rc8 it seems like it would be more sensible
to just merge this now so it's in -rc1, it doesn't seem likely
that everything will get sorted prior to the merge window?

--hLckiemEQMgkNtNC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPqLw0ACgkQJNaLcl1U
h9Cusgf+KHIMbGjZ94f/3Md7bYbHGXWVbYeqzBW/6+lEkfiiRKOh1voFts8mMAgR
mq955EflP3IhKLBUuoGwSSLqT51rnR5O/pkjilihYcqhc4WE/GgOm7AI3kopomWN
FclT/xp6xwg7YIb9J3LcY0CsrpHDyP6xlAdG+Lt2etc++xyp0EA0Hkv+i/QlZDw6
nomffp+VkEKSYZFPh8KAPWs9yz3MKDLgrUFsOwdLYYT6B4eRcT7c6Vq52E91jxY8
TW55W285X2sfvt27ZeWL6kou1HHDoySqBO+mfp/ejw4llMuOWngRjqYKrh+E/JJH
dKHCW35kvUwwnjMsMGTaBK4tfrlC9A==
=h6Bg
-----END PGP SIGNATURE-----

--hLckiemEQMgkNtNC--
