Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A00E280021;
	Tue, 10 Jun 2025 10:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552202; cv=none; b=gzbyRnbYL89abiDDNGwCVzYlJHc0Tyb0FQJsS2rJJNM8/3qXag8VhhSS5KOfBK3KLNeLvLE5HYsW1dGRAB60A1nWWUyh+fghcr/rRJiL+RLywtVNDG/RWiU++2L0s6ywiJf/zb+93AUv0i8gY83OLojsRNYErOTCGWDnAl5+AnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552202; c=relaxed/simple;
	bh=z2e8Cx4N22j0jFPYP9dn1ksvGApxjY/BLZUazVli9yA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z37rpArH3UhSGghSKjZWkp6pz0cZhLwcQlc5rSxCEx7cdn8vuAr/V5wVvKEj98VPVQV5c325gTB2XZAc7YOXBiFwi00azNtuBtQ+8f0gZiLyqkGR6rFyfYBcRqD5HImYlGW56ZzAaxNhfviWUHmbr6JsktKHR2/YEAtnQUB0rHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DIJK7dLB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DIJK7dLB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-451d54214adso43315305e9.3;
        Tue, 10 Jun 2025 03:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749552200; x=1750157000; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kOaDoz9H3gJVjVkXf5SppnF68Xo6KIKjXhIxBWkW7q8=;
        b=DIJK7dLBRW9pJIo+hFDKI52aOZwwQqR/7BYJ/tncyW8T6yg7Ul74yCSHzQXTKMfNQ/
         0bhpn5RBNjW4Mfrj3Zo2FT7IZzHzXbOZ+5HUaYYA1PtxZLbHoGjU4eTo/NL1VNALDjXu
         2c3PPaVJCptzQp4BTmSlEuepKKC9B8+e3uQz9pv250OCLdLmVVkyv7+hycEuwitnvfcl
         1wdvN5Gi8icdLiPcGNEBWOSRm3HkVmtyJdph0P4OAA4WdMeZ0BVEbHGWleiBJhpptbDS
         J4dW2BKQtNbRo2Z3vKl/+UkGkw852GdDZSHr7O23cxV0U5pJQFBYWmTUUjnOyvNFIm1Y
         NzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552200; x=1750157000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOaDoz9H3gJVjVkXf5SppnF68Xo6KIKjXhIxBWkW7q8=;
        b=Qk0bYwKNoxdei/moyW1fZOT/YtKwh6GWgl4pbqoRtSue7W5rANFhxI+/vFAGLGce13
         B5o1QO3PRUdnJ34WwoIsp2KqaXXKnoMSMAGU83pAatNWjWjXH0QhB6IIFc0l/q6poz73
         T2Mkn/2mk+X4X4+fsMcPDA7m4mlvaR6riIMyMdWXRU0P5BrbpqQCaq6BRB7xiXLX8wb9
         AMPa8lCDFAwVUslUGc3nhTyxSSJ9tBWKPIghyxnVcGtRNjoi+Wag+LTbkdJ33r0e82UJ
         WMB/T02/l4XwAJHcbrF/l4F1cO8ARlPdq4Zue3naCRuDnxNhmvNhH/CFNLZd8lKotMSi
         dmYw==
X-Forwarded-Encrypted: i=1; AJvYcCUqL9xZHAzzCRBr8gueI01JMZpcagzeFqo5ntixy45iGrXycSFqaq8PKADYi0qQV2VOllhFvBJWSkpf/v8=@lists.linux.dev, AJvYcCUu6oMgcLjmY3cSZWfLYI7/PRUE+CS3CEsifBbXK38oiuQ+d2JyJ3Ceho8EEdk6g2sOcwWdzg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzprRA2V8z7dMEhQRa5dGVOK9RnWbITEtCRjqCwjmrYRfo3mrE1
	0Q/iAk/1lf9WlZ5CBSBKaHSC2Eot7/r0U/20puXo3T5bUqWTHA2GnJnl
X-Gm-Gg: ASbGncvKCVdPMeXLrvzso9/maspa1StIogkjXHYuOUaDLjnyLJALl7s0vRq89Me0JPx
	J4G28JcoS/Mij0U8SIlYzdmGYDV5gNWsn53x/SfntCOJIt8xpiGfs9em3lJkQj0wXB3O+v68ggn
	1pCPfGbGh3qpZaKUh0SNmue0Qi+HOcJykpT04bgsftJw+WUawAYeaGm10r+lL3cU0jEL5ff05xU
	gTBC3dtY/m2IvkSDFednAoyLlFXbJANRazazpagAiACH8zAnFmSzzWaRMdqSrR3EXCwO2ai5SNS
	wj+Xzs/uM4sfjXQGrzhFYsLZfIQzpEEUug7vMofX1vVYjngir4vCb8vpnxxqCdGdSHghkwFAfyu
	M6bG4cYVPinTtWm6tZklkAj9KV9+TrdFhIcJFOfAhm6jIdEtYpK7N1+9Af/k=
X-Google-Smtp-Source: AGHT+IHQ/+H0xmT4/n8SzqPJO5wYfpUJEhNk4WbIofE8jpTP1D8Vxb32j//I2sl0mRwL2FnnAavasQ==
X-Received: by 2002:a05:600c:8218:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-4531de00602mr28517275e9.10.1749552199291;
        Tue, 10 Jun 2025 03:43:19 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4521370961csm137172115e9.22.2025.06.10.03.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:43:17 -0700 (PDT)
Date: Tue, 10 Jun 2025 12:43:15 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: mailbox: nvidia,tegra186-hsp: Use
 generic node name
Message-ID: <hcw6q4iwiout2htnq7wdd3bijozjoqbfdk3tdt42ynr4cx53uy@rxd4io4oua3a>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
 <20250603-dt-bindings-mailbox-cleanup-v1-4-724407563997@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="abxrtw4wmi4tc3x3"
Content-Disposition: inline
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-4-724407563997@linaro.org>


--abxrtw4wmi4tc3x3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/5] dt-bindings: mailbox: nvidia,tegra186-hsp: Use
 generic node name
MIME-Version: 1.0

On Tue, Jun 03, 2025 at 01:57:11PM +0200, Krzysztof Kozlowski wrote:
> According to Devicetree specifications, device node names should be
> generic, thus Mailbox provider should be called "mailbox", not "hsp".
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml | 5 +=
----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--abxrtw4wmi4tc3x3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhIDEAACgkQ3SOs138+
s6FLeA/8C28wIE1XdUrfWbZVBn7aovpLS99DRcLoPyMvhw8fjByqxokguQTPyVMb
uUYMChlSTxFTyYulzP+K2kv12E04Yeu6n4nhk6gOx90ItrPuiqCqPsBrp8WU6Ktu
/Xr/DpwTy6DdlN+Xb5RZ6FtcncU0CMdf7bpB0ZxYIciQfRnimdpG6e8JTxE5ShIa
uLTNQjPYdtJb7RSE4jaQ3KZFLP5tUsb43sh/Yr+8356lE0ehI+L994IO+H8J5OKn
0A8ZKhCRzXwMdMb3N9bYfP0BpMRlgnk5BhGMEu5BTGVt1QjNTlSSstt3kaees5pd
3D+2vN4NLXtkSoSUjyxIwUK+nJhZudE7DjySBZpIf1TiJ3Js64i6wMwWEqs4v+0/
7jPjZp9JXKzFvBoBUtmEpGt3YM9B4kALq9gqooFzH8IkowTK6FUlamTqSlBytDrd
0ZjwrGllN7fYZZaxZ4L/5CIeLyo/XLG/AgVm45QeuGIpT3uBRVdox3X1oPgHKz57
dCnGomNKN7WyMEqXCE2TSJQkIh3qdhtpHg0p/Wf3gvKg+ak8kJYE099TTtOYS6VN
DyHrxbecTi/ktRX9d7TmReGlCkFwrmLrl5FECpWWUEO0ZnrFXuQj5cNues8Y5wSQ
V3Ey7khUayaf0c9EiafF4zDHDgx4YBeHw7Rn3bRM6PzdboL3EcQ=
=rTWv
-----END PGP SIGNATURE-----

--abxrtw4wmi4tc3x3--
