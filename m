Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4234D3C1D
	for <asahi@lists.linux.dev>; Sat, 27 Aug 2022 12:06:11 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id cr9so3075676qtb.13
        for <asahi@lists.linux.dev>; Sat, 27 Aug 2022 05:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=GwEAUoAsvSKAuI3T7BnBX/XzvogeDEWCtliQKkHfxU4=;
        b=ROAfxbu7W8pLqK0F2H9HpYyBIofrqp/7lOLmQy1Tt3vGqx830iaMXpBb0vv5mnaZa9
         DHkx/J418Iv9Ob2+05fLaaXJdwSB7Sg1LqQxEb+lbSjArD48K7AkddY5ubJywNEK7Sw3
         //R/0GqGW5EBFO+G/5jIBl2e7uN4l99h/NLjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=GwEAUoAsvSKAuI3T7BnBX/XzvogeDEWCtliQKkHfxU4=;
        b=IkGjYYyOUtQtPME66jNtWuyoBEadiNPFDdV/AlsvChyQS/WumenHZMTcaXTYwDZ4A9
         E/cL3BxreW6nz7KWC3Wx5zQZRC0p131o2DyUzl7RCopJOSXlRnUN2YYmyTGyrzE3k2k6
         p46zajQSWkccvVxfdjJzEdSNbQ+NkfCq0HAPdeQE+1j7etBJ+iZxfUR43D+0umPNv1zQ
         UQCp+Duw+riyWicvbu86UShHhNKJGJ6xQjHA3iwH09IHjdyD4YfJn4ujfKvtWnLqkWsn
         SUXklVZvQ6TPaNKWT8HUR1IvTe9V5CDjwUNmIpfzx3dfdIuyCrVuFPdYKEzzw95QTGup
         JkqA==
X-Gm-Message-State: ACgBeo3+kAyShyJezBqMqFEVlYtejqvvcjRpD/KXjawZGE99a45ChFcT
	WQh726V85coZeY4aqyEpEMU09Y8QgXNnBQ==
X-Google-Smtp-Source: AA6agR5ddtjQzR9v96KExowcIh9PNV0lzC42nhdyacCJbUL5DCKbXir+siU3XbnzhIwtdYkeIpim6A==
X-Received: by 2002:ac8:4e41:0:b0:343:5c49:951a with SMTP id e1-20020ac84e41000000b003435c49951amr3122721qtw.25.1661601970101;
        Sat, 27 Aug 2022 05:06:10 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-195-139.ec.res.rr.com. [65.184.195.139])
        by smtp.gmail.com with ESMTPSA id x6-20020ac86b46000000b00339b8a5639csm1538229qts.95.2022.08.27.05.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 05:06:09 -0700 (PDT)
Date: Sat, 27 Aug 2022 08:06:07 -0400
From: Tom Rini <trini@konsulko.com>
To: Hector Martin <marcan@marcan.st>
Cc: Bin Meng <bmeng.cn@gmail.com>, Sven Peter <sven@svenpeter.dev>,
	Mark Kettenis <kettenis@openbsd.org>, u-boot@lists.denx.de,
	asahi@lists.linux.dev
Subject: Re: [PATCH] nvme: Do a clean NVMe shutdown
Message-ID: <20220827120607.GF7942@bill-the-cat>
References: <20220731063131.38271-1-marcan@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6nSyB+bcl/pT7+kx"
Content-Disposition: inline
In-Reply-To: <20220731063131.38271-1-marcan@marcan.st>
X-Clacks-Overhead: GNU Terry Pratchett


--6nSyB+bcl/pT7+kx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 31, 2022 at 03:31:31PM +0900, Hector Martin wrote:

> The brute-force controller disable method can end up racing controller
> initilization and causing a crash when we shut down Apple ANS2 NVMe
> controllers. Do a proper controlled shutdown, which does block until
> things are quiesced properly. This is nicer in general for all
> controllers.
>=20
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Tested-by: Mark Kettenis <kettenis@openbsd.org> [firefly-rk3399]

Applied to u-boot/master, thanks!

--=20
Tom

--6nSyB+bcl/pT7+kx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmMKCK8ACgkQFHw5/5Y0
tyzybQv7BtQ1MlhRAe4Oo7VLCwXxTGYuK6opoI+c3heQgvQ3n3Mw9DxfHtKPOjEF
XDo3E/Ce5HgOcMmXxBAez2GjgOypw3HSmL1vC/nvRNmmMgBp7gONqSpWOLDyWNqw
aYKdMrFQJQR6T9JvcDn061sU3+2ixYWFGy2+5vaDIpnnyDBlYs2eqIhdVGYnm2x3
povHQDwPv/PM3bWSFkDlN9qpS0BI6C7aNyviNX1zcuyNFo6tePkSGbzuIyTKpj7G
fwCsCZqzXhfYSbCr//rziv/gXT3yegFtYIf2D3I1ma5vRvWlECpT6EIRjpgjYDkA
afDcfb3/fIfz+2mypzRArKY0MXh/NOAQpoM5XpJx1YVy4gHQcw1mzlaC6Xn3NrD8
du18jst2Uw2XHO/w2AkqZeHJlQnH0RyUEWWf5I7C8IHpqrA2UBhfCqH98twPS/NQ
cTrp+0Fkom6Yew5XC2toMIrWnL6eJ5D50F8neLkWZDCoiDPZnuLl0e3mZXrh90ce
bt38Sf7q
=B2ip
-----END PGP SIGNATURE-----

--6nSyB+bcl/pT7+kx--
