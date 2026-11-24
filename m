Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558375;
	b=HoGJpVXDwXZQhTBZIz4mLvDlelMzezfFP6BsWCEhqWqGAp12PSp0vvU1mP1froTwvHQ8
	 SUGs0r+gCTwvNKHZwiuM+kW6UCTbXz7CSHEbxcIK6iVisuLQqyaHz8gcl4rqE6RK9lNOo
	 IL2zrk+DUONKw9n2m0bWHEBVCDAhctCA1vhvljEpslv+b7hD4Y10DeoHtr3rBGebxB5OI
	 252X+x/Q8onbWAAzjE/4wDanHMEGY65Rb0FIr3If9GczgR4vArf0x+bsK69AvMxS2kAWB
	 h6DeKHUzNx1x3nudXPbQ++wt/tCcyiX2EnHa9JkoQ0l3dmYUZs3p6xncKEq7LxC8JOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=a+lCQh9rFeHZpRcts8xKmbAzUymCGM5+mzuki638UuI=;
	b=DxE1FuZraFhdsjdSJcKKfSwWivhcZVNN8l+Cait69LO/83UySchMkngzcs/sGCZOPGVC
	 BeqJ71MvC29ElMcUqoRT/xLflIoHk5FGVAGffoQy+acNNDYD40mnzHlTGJPiS9tvRZyou
	 vWh5VDK2uekw8Ayz/KFDV4I2uMopap38HrCl1pSuQv4HhxJ2XzKru4Bw03SK+3rzImN0U
	 nEk4tzfUJdh4djtcCAWuMiNU2LpqBS236CAMSMxPrmtiEVcHQyzezx8b1yuRpq+mR50WU
	 /V88VfXWQqahLr9BR2XmaVOWVjWc5tkkhY5pqBOnxjedsZykjtNo5bmda2A1LSoyKpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HjCEffdm;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79ADE606A31E
	for <asahi@lists.linux.dev>; Tue, 24 Nov 2026 22:12:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79ADE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HjCEffdm
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-94961b68685so432248985a.3
        for <asahi@lists.linux.dev>; Tue, 24 Nov 2026 14:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795558374; x=1796163174; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a+lCQh9rFeHZpRcts8xKmbAzUymCGM5+mzuki638UuI=;
        b=HjCEffdm3lBV93Cg7kEPmahELSk+KRxbwfUrM6z0qdVtHcQYVD4fS7UVAr4XVOVa28
         qWqZnNSDdEvVoHNkUqcjkSWLVqhgBfe+RJfgt/YCh4lEv8YJBKMxJ3We6cBxrCoNozQZ
         A94/3nqaAn/oIvrAAi+nIX/K3LVeGdkTEPfnD+DAZbAzU4ZnPjBljr4r3emWjr5iwqt1
         /jfm0tAqh+EPCt4oXqn1CdF1kySnzbG2ieikqd33y31fBWg9Wcb9GBU9xQ8K7iKT2ERQ
         uiNWk7Y1IttU3ZQ4VoKpe8erJsA+NwDbwS3uMH3q+/WsYadWOYDmBgEyRBVJG+ZV0Nb+
         O43Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795558374; x=1796163174;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+lCQh9rFeHZpRcts8xKmbAzUymCGM5+mzuki638UuI=;
        b=QK28yqdyRBL8v4jrFGznHe7+SlTsPGNNs3FEHBr3S4tcyD8UFFvV38OnViNxwqWBed
         XLaIR9j/Py5Or/P4j+Va30O0PORO2Pxshn+JZWM3Eyrt7nrYEpJipuGvzxvd0QVDGNPx
         aX3VPA23PNYY863yOMa9Krgbs7RCzVwBPaBA2xKdUlfLn5vtZMAcqutgeqNe55/JwL+c
         hbFOa8J1gQ3YLGB3Ook51S6EhHQp53q40NnkNUFWOkaAVWqDnMB3GF2Omi1+o59deWgs
         uGxHu6gJJrRhPWGTXJf33mpqv+3ul2gqCdHdwSS0IstQWvT5sxUndXFTSeIJFVMUnnYK
         zdhw==
X-Gm-Message-State: APuU4Z9KNKWHHYSl0IPM8lA6e3wMS4pAaz7JEm7jxsDAdn7kuVZVuIfr
	CZ3ZWw8abkOhVOvtfs9LUU7BmiGRCmJX8pMdM5JvXHBTzBJbixwx7ZY2rw/WwPnai2A=
X-Gm-Gg: AZFdTZcZAqf6CScpwPTJcxcazMRGLJ5wGYFNGo0IFM7hp5l1L6HTt1Il9ovJKPuH+IO
	m7VRhfquzW67YEBf3SSMkOb/+T3xzXlwCCMwpc+z0ZSyVG09rAdN5qgcZKgkH+uwPJGhcTyl3ML
	/+bIXb5QQoE6T0qVEKDi1UEAzocEHGy61wA8ch4aBqyJlUSolzcdMC33jCcUmc9PeOqsyP6qJPQ
	K9fzGJ8xwv1Y36BwOElsUvOliP49IAJd8EmzKyoG9YPA6NLy4xNtpNuvigx8t+FKvHNKj2qN7bX
	eFoBgoxfx2iIEAEuFifWYfIeKyCYYy9uBGRTuh1w0I+WZfiuUT4/ito/cHOT6TTqmR9F4TwjRi6
	BBdfADUJ5pEDO59a26aSHeYPN0atT9fI8zeY4RrYRyQc0xvted7sL8U30z2atTJdAt0wm+2g8j/
	BP6vi3ts7BhBquGWB4vSknlXjRh33+XDLLAEdCVBKOIhJ4QjXpXRq8NQkBupM8hZ/7SmRnvgwmr
	4Oj4UJM3kTZ74wyWKI8WnHPNQLtI96dOr+wUJhfFO1UHoTn/j5naimB0r9o0GT6Wr7se7SRZfqu
	O7OIdlQFJekkFO3Y7joS+0FEePvXrUKwELZK91i4vrhxO5oz7onwPNYbXcaG+2WJC+QPeSuOOsp
	C
X-Received: by 2002:a05:620a:7087:b0:93f:633b:ee1f with SMTP id af79cd13be357-949ba9c6b95mr3002134585a.28.1795558374358;
        Tue, 24 Nov 2026 14:12:54 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3bec3dsm1148251585a.23.2026.11.24.14.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:12:53 -0800 (PST)
Message-ID: <16ae904e41539059dbe1649551c1c903295690b3.camel@ndufresne.ca>
Subject: Re: [PATCH v3 04/17] media: v4l2-ctrls: validate av1 tile info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau
	 <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, Daniel Almeida
	 <daniel.almeida@collabora.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Tue, 24 Nov 2026 17:12:51 -0500
In-Reply-To: <20261020-avd-v3-4-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-4-85cbaa2125d8@icloud.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-TfGKB/izRKTkKjOJIU01"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

--=-TfGKB/izRKTkKjOJIU01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9crit=
=C2=A0:
> Many drivers use tile_cols and/or tile_rows, so make sure they are
> valid.
>=20
> Increase V4L2_AV1_MAX_TILE_COUNT to MAX_TILE_COLS * MAX_TILE_ROWS
>=20
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 15 +++++++++++++++
>  include/uapi/linux/v4l2-controls.h        |  2 +-
>  2 files changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 661a3a25da52..922cf74c4eb8 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -800,10 +800,25 @@ static int validate_av1_film_grain(struct v4l2_ctrl=
_av1_film_grain *fg)
>  =09return 0;
>  }
> =20
> +static int validate_av1_tile_info(struct v4l2_av1_tile_info *ti)
> +{
> +=09if (ti->tile_cols > V4L2_AV1_MAX_TILE_COLS ||
> +=09    ti->tile_rows > V4L2_AV1_MAX_TILE_ROWS)
> +=09=09return -EINVAL;
> +
> +=09if (ti->context_update_tile_id >=3D ti->tile_cols * ti->tile_rows)
> +=09=09return -EINVAL;

Make sure to update std_init_compound() so that the default passes the chec=
k
please.

> +
> +=09return 0;
> +}
> +
>  static int validate_av1_frame(struct v4l2_ctrl_av1_frame *f)
>  {
>  =09int ret =3D 0;
> =20
> +=09ret =3D validate_av1_tile_info(&f->tile_info);
> +=09if (ret)
> +=09=09return ret;
>  =09ret =3D validate_av1_quantization(&f->quantization);
>  =09if (ret)
>  =09=09return ret;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index d17e41d51d2e..abdfa102a77b 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -2939,7 +2939,7 @@ struct v4l2_ctrl_vp9_compressed_hdr {
>  #define V4L2_AV1_MAX_NUM_PLANES=09=093
>  #define V4L2_AV1_MAX_TILE_COLS=09=0964
>  #define V4L2_AV1_MAX_TILE_ROWS=09=0964
> -#define V4L2_AV1_MAX_TILE_COUNT=09=09512
> +#define V4L2_AV1_MAX_TILE_COUNT=09=094096

Hmm, added Daniel in CC, no idea how we ended up with 512 here. This will
increase MTK insance size, but the communication with the firmware seems
dynamic.

Hantro is limited to 128 and properly reject anything above. So in all, sho=
uld
be fine, unless there is a problem with MTK firmware, which which case I'd
suggest to program the original limit in there. Also added Xiaoyong in CC.

> =20
>  #define V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE=09=09  0x00000001
>  #define V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK=09  0x00000002

--=-TfGKB/izRKTkKjOJIU01
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYL4wAKCRDZQZRRKWBy
9AqIAQD/Po4bqlGbwwvzn3azk4B+6lvUS+G/w/qpKmt706DCrgEA7eZ3FFzsMcQl
GNrZH0OYicvPvO4L1n4kg3NLn/HwGgg=
=kmno
-----END PGP SIGNATURE-----

--=-TfGKB/izRKTkKjOJIU01--
