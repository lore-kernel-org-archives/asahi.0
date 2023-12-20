Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262B6210F8
	for <asahi@lists.linux.dev>; Wed, 20 Dec 2023 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GD0hz631"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6dbaf12c866so210610a34.3
        for <asahi@lists.linux.dev>; Wed, 20 Dec 2023 03:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703070339; x=1703675139; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZK4NlSSPgQwsGSHLA/Pycg97M136hutjFPJCvYqz4Ck=;
        b=GD0hz631Rr+wkXdy3K0StrcTIqSYY7ct80oZ3ApLsrz+BP60XJnhXOZpCLEJn21gkJ
         eGuTKi47k/ulJoLfu0GNZz+o+oB3R+Ij01NZXY2UFbLvdSMI7WL06IcOj0Sni2oEduSx
         7kTDwMPaGQQ/x572SW/YWYFWgwfY13hvTkSE31B8c5t1i6aH+rUHflfKs6oXv8JrM7hK
         O5CLjCr6F+nPJeO7A8SA13yXLJK6MeH8LZ4zg2dFfGKYTQ3Q9rLVtLPikPEXeLGNRrqs
         ootnoMYwtAEmOfbFTDrLAAtGKyQ0EAJToK1sHWBYkbcnrfQWZdNeTdby/a1QE3B9L6ZD
         AFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703070339; x=1703675139;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZK4NlSSPgQwsGSHLA/Pycg97M136hutjFPJCvYqz4Ck=;
        b=Qoi2cSJT54/ubB3+Zl42J9wl+D/l0GrIOAP/CmHnEtaFXymYUxV3hoF6dfPTrdhXL8
         FvWh+G+eED3Orls1P5wirQwkocuTxh9rxSe+MAu59wJRWAFOuEl1PdSbTaOj0sIj2N3r
         MWseo4ouvnhO/JSJwGfZI+Br7n5/FcACrK4CqHXuUXx5opig2gVqne40XGecQU/y8a8w
         dOQdCkLaPI81asj44Vm65b8y9kKYXrUA6Z1goxaMX6X5uJvEFWwsfnE7V3l7v216o/dk
         TKC4gsBwqrvD5az2hutmzo6L+o4bs3F6xNN7lVWpsAsOTVN3KvktG738CMxQ3E8v/FGD
         231g==
X-Gm-Message-State: AOJu0YxENyo7TCyut3ya1IuHZaYRAntdTI/OHwF2B9akqabq0a4LyNL6
	abKlyaLleFykILNjqivq+mZ1yP0NpImoFg==
X-Google-Smtp-Source: AGHT+IHNw5Fjt6eji/RZDZ0VYxrLINVasZMdhYpFeaAe+l8GXMP3b8PGNjKBysKhnQL06umOFZ4krA==
X-Received: by 2002:a05:6359:4c1c:b0:170:bd6c:b7cf with SMTP id kj28-20020a0563594c1c00b00170bd6cb7cfmr23746012rwc.46.1703070339040;
        Wed, 20 Dec 2023 03:05:39 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id fk1-20020a056a003a8100b006d40f44dc03sm7642917pfb.11.2023.12.20.03.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 03:05:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id AF6051028B299; Wed, 20 Dec 2023 18:05:34 +0700 (WIB)
Date: Wed, 20 Dec 2023 18:05:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kalle Valo <kvalo@kernel.org>, Daniel Berlin <dberlin@dberlin.org>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Arend van Spriel <aspriel@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>,
	SHA-cyfmac-dev-list@infineon.com, asahi@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org, David Airlie <airlied@redhat.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Subject: Re: [PATCH] wifi: brcmfmac: cfg80211: Use WSEC to set SAE password
Message-ID: <ZYLKftqKFJ_PMmF3@archie.me>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rMlNXoe/imCf0D6r"
Content-Disposition: inline
In-Reply-To: <6e330280-0b0a-4483-ac09-cd974d87a7ae@marcan.st>


--rMlNXoe/imCf0D6r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 20, 2023 at 01:16:20PM +0900, Hector Martin wrote:
>=20
>=20
> On 2023/12/20 10:44, Linus Torvalds wrote:
> > Put another way: if we effectively don't have a driver maintainer that
> > can test things, and somebody is willing to step up, shouldn't we take
> > that person up on it?
>=20
> Personally, I do think the rPi folks themselves should step up for
> *testing* at the very least. I did point them at our downstream WiFi
> branch at one point during a previous discussion and haven't heard back,
> so either they never tested it, or they did and it didn't break
> anything. If they're shipping popular Linux hardware where the WiFi
> chipset vendor has fully and completely checked out of any upstream
> support, they need to either accept that upstream support will likely
> break at some point (because that's just what happens when nobody cares
> about a given piece of hardware, especially with drivers shared across
> others like this one) or they need to proactively step up and take on,
> minimally, an early testing role themselves.

I'm agree that downstream (e.g. rPi) developers should also participating
in upstream kernel development.

Also Cc: rPi folks to solicit their opinions.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--rMlNXoe/imCf0D6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZYLKewAKCRD2uYlJVVFO
ozFjAP9RYxpZvqkXRWkXgtGFOlqyvnG5Y1UEvsJdEKmqzdW30AD8CHkVFxApQ5TK
WCwps84FH+6ExEtPz0RrClRSWpi05QI=
=ea1G
-----END PGP SIGNATURE-----

--rMlNXoe/imCf0D6r--
