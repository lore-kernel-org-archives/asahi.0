Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557336;
	b=gisHY4BmB9wOSuLcQUHO9nNfNvNDq0VRNCq/pjojnaCiavDerwS0tcaHYpEjJ6SHNbMt
	 qzeAeqOtOd2TWlF79D9oGWX0vdj7Cj5oBFdtCze0WEOfXiDyv45+6MOD6Q/aVVp6Dt9gK
	 20n8XQoj96v5BPuprDg8Wch3wY/3RtoIZ6pgW2Im+0eqwrr8cTH/5zo3co4uqnW5/JTRb
	 sNr982lZpxq/GfNBBWo9/gJhEedf+a35HKb8JNblifNQgcQfQS8ecDXUitooVpdLwCO63
	 vYZvj6EVGa26yiHd/8QJdjnqq0GVEHLa1Gn0Mpc59lG2S1nLRscibuzP4+84Up49dtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=kT+xuhaSl/fUoT3wmVVtDAie9WoGC5vXXYFsJEveQVY=;
	b=dmryTI1J3rikt3V/uplzDsBiBPVxbQjOhyysyrD3YAalO/tQrvqX2vsxkxzpYc2sIhog
	 0y8Fwcvk2AKV8JBIPIbasOOUhHvOTkct1YbNlTwnNBCIg0J3LY/BjF4BcTli8xe5OsroZ
	 noNGTbjXJ5Ufn2l/DTexqb9dmPeJ8AhVacILlYHoOFrCRLsbafxfyh6KF0bYYWxnt4zBO
	 HZ1hg27g1+qsDxsyHaGv7wmzglYcdb+IyIrxnpI5zp7NLEiVEulj2Zp9pxKDTROXDVYRe
	 kQYe9ILkca5z8fFFiEGjmrFA90MLm5/spcx7bhduLPlkmCERnqal/ZJREOwv0soukAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=h0JxIa8i;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D743606A323
	for <asahi@lists.linux.dev>; Tue, 24 Nov 2026 21:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D743606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=h0JxIa8i
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-949680e6d83so457873585a.3
        for <asahi@lists.linux.dev>; Tue, 24 Nov 2026 13:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795557335; x=1796162135; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kT+xuhaSl/fUoT3wmVVtDAie9WoGC5vXXYFsJEveQVY=;
        b=h0JxIa8i8Qc+cflEjmNzMLlK7h7zWJvLJsz+7A3bJ3JqLzlbcx06dLotX2I/S2at8M
         eVCr7wDWGakyiPj6b/Wpr9FHbA6+2bmjcEwIicIscoWLbrAZ2JXE9FXPhhyjvJi1T6Yk
         affLs0ww2hN8VLzUOjJU1XGGJ+VYtUPLqFyW1kR5pBM9Tjw9r6Zc+mRQXC9j+VYOE/AA
         BlHN2RVqiXi460WiQXNZKexpkqq4eyKbLjop1c+S06FUFZPXr7DNBnKZVJNMcPs2WlBH
         t9blach1r1OhId38VfgHRXAazQpQvHUPaJVDKgR5Ix81Apjw+NKMcGkR0J8/EeMgarav
         LU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557335; x=1796162135;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kT+xuhaSl/fUoT3wmVVtDAie9WoGC5vXXYFsJEveQVY=;
        b=e/5MJJY2ofhG+Ye9f2jO3aT3gNACc793eBMflP8UQyQi76X5LXCp6mB1NMh31PxKN0
         Bta5HbfMcgTdUvpwdguZtWsSSuPMqeMf0J2j4addGuDFDeX/cE7b+3M0gXhz7bpljuh7
         WffQ0sMdO6MjczxjBkyWGuDLZkF4Yd4p6L1iYsKFH15K4oV3tN9vol+qniRAFfcIyqBq
         qIpVQ5t2tUxIN2s/mZUdVVXnC7ThkAQH5PG0shOS3OplcxNDLg56//LPU5gCZa0iYtUM
         ayF2qWR1EBIqZye6mDNx8xaUv+XjGBwMTRpOqX1JbW7ymTvOxEXHhjAZrdyE6PluA5Cf
         suHw==
X-Gm-Message-State: APuU4Z8H32w/5RHYey377Cw8c3zz5Ue0pW6pEE2lia1LhJsTHGw9Lbo7
	xZ4Mmb+Zpse5M8hHxSKCr7BkLA3SyGD7hl9FGS3hPCSkCwP1qQmXrJ8DXRGrYZ7PZVA=
X-Gm-Gg: AZFdTZe2tbWDhb9HFjf5rvwzXBIQM8r2s+JRO+pRpFWWK8cAYoMbJOAFHJOtgH6dHvC
	fVacAWj5SM0J4WMmSB5FvezKQaWABVSKOszNgyq929tXNRL4nNdp+8VXcfuvFPEOvMIYYxizBwr
	rXkQMk+w+qb9QzJGPRAKxUhPHBQiJemEggdOZ/igdzUj4TpfaCqvlkO1PNVrqwAdkEp5O0YCMNW
	n3MD/Cqf3sD7vK08umfVxsBn3o4qjFjb2xAgl59pvD/57AmApaZIYzKMl3mZgKh0NuMSoJkkmIK
	ty27+OCJKkF83BFP1FU2Tjc1qyDu5i4IZ7C7T6A7uRRf+LT7dLNNxVkCxKfBxJ2lBBztiwINPrF
	7sapI8LtQsP+8km+C8+mG0hzJvR3YPNIKKgf7edeA1N8h3csN/cdnENUHzQkd6s6ESgac51d5KK
	BajgKwAW8yoxzdOgxt4z+mqDOp2mn/zBNaco4D0V/yZdOsX5NZdkxdQNOACbxv+Bdb/QbMONk2n
	1nOWa521VGiuhJ6UX6MyW0I5F1ZECWJEsa+0IsXeQoiL+FfPPfTiy2+XMVGjX7gYPjjzduR24en
	iXE+INLVk2czynRY5UyiSVlLAV9NIi+IPYiXY8+yuDDVQ4PKBl41seY=
X-Received: by 2002:a05:620a:1305:b0:949:74d8:46fb with SMTP id af79cd13be357-949ba9b385cmr2910405585a.41.1795557335002;
        Tue, 24 Nov 2026 13:55:35 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3ba04bsm1169083785a.24.2026.11.24.13.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:55:34 -0800 (PST)
Message-ID: <c592bdd6b31c6e6580876c5fb7a37591b0355157.camel@ndufresne.ca>
Subject: Re: [PATCH v3 02/17] media: v4l2: Add P210 pixel format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>, Sven Peter <sven@kernel.org>, 
 Janne Grunau
	 <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	 <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Date: Tue, 24 Nov 2026 16:55:33 -0500
In-Reply-To: <20261020-avd-v3-2-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-2-85cbaa2125d8@icloud.com>
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
	protocol="application/pgp-signature"; boundary="=-CAwZvlptZ/R7neJeECDI"
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

--=-CAwZvlptZ/R7neJeECDI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9crit=
=C2=A0:
> P210 is a YUV format with 10-bits per component with interleaved UV.
>=20
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst          | 14 ++++++++=
++++--
>  drivers/media/v4l2-core/v4l2-common.c                      |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c                       |  1 +
>  include/uapi/linux/videodev2.h                             |  1 +
>  4 files changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst =
b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 0631919bd667..f2d2e79698fa 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -138,6 +138,13 @@ All components are stored with the same number of bi=
ts per component.
>        - Cb, Cr
>        - No
>        - Linear
> +    * - V4L2_PIX_FMT_P210
> +      - 'P210'
> +      - 10
> +      - 4:2:2
> +      - Cb, Cr
> +      - Yes
> +      - Linear
>      * - V4L2_PIX_FMT_NV15
>        - 'NV15'
>        - 10
> @@ -834,12 +841,15 @@ number of lines as the luma plane.
> =20
>  .. _V4L2_PIX_FMT_P010:
>  .. _V4L2-PIX-FMT-P010-4L4:
> +.. _V4L2-PIX-FMT-P210:
> =20
> -P010 and tiled P010
> --------------------
> +P010, tiled P010 and P210
> +-------------------------
> =20
>  P010 is like NV12 with 10 bits per component, expanded to 16 bits.
>  Data in the 10 high bits, zeros in the 6 low bits, arranged in little en=
dian order.
> +P210 is the same as P010 but the chroma plane is only subsampled by 2 in=
 the
> +horizontal direction.
> =20
>  .. flat-table:: Sample 4x4 P010 Image
>      :header-rows:  0
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 11ab684024c5..43ef12d073a3 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -325,6 +325,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>  =09=09{ .format =3D V4L2_PIX_FMT_NV42,    .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  =09=09{ .format =3D V4L2_PIX_FMT_P010,    .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
>  =09=09{ .format =3D V4L2_PIX_FMT_P012,    .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> +=09=09{ .format =3D V4L2_PIX_FMT_P210,    .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> =20
>  =09=09{ .format =3D V4L2_PIX_FMT_YUV410,  .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 4, .vdiv =3D 4 },
>  =09=09{ .format =3D V4L2_PIX_FMT_YVU410,  .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 4, .vdiv =3D 4 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 17ba1ae70735..1f2519ffeb2b 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1369,6 +1369,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *f=
mt)
>  =09case V4L2_PIX_FMT_NV42:=09=09descr =3D "Y/VU 4:4:4"; break;
>  =09case V4L2_PIX_FMT_P010:=09=09descr =3D "10-bit Y/UV 4:2:0"; break;
>  =09case V4L2_PIX_FMT_P012:=09=09descr =3D "12-bit Y/UV 4:2:0"; break;
> +=09case V4L2_PIX_FMT_P210:=09=09descr =3D "10-bit Y/UV 4:2:2"; break;
>  =09case V4L2_PIX_FMT_NV12_4L4:=09descr =3D "Y/UV 4:2:0 (4x4 Linear)"; br=
eak;
>  =09case V4L2_PIX_FMT_NV12_16L16:=09descr =3D "Y/UV 4:2:0 (16x16 Linear)"=
; break;
>  =09case V4L2_PIX_FMT_NV12_32L32:   descr =3D "Y/UV 4:2:0 (32x32 Linear)"=
; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 5373dba640fa..5472e433ed06 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -659,6 +659,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/Cr=
Cb 4:4:4  */
>  #define V4L2_PIX_FMT_P010    v4l2_fourcc('P', '0', '1', '0') /* 24  Y/Cb=
Cr 4:2:0 10-bit per component */
>  #define V4L2_PIX_FMT_P012    v4l2_fourcc('P', '0', '1', '2') /* 24  Y/Cb=
Cr 4:2:0 12-bit per component */
> +#define V4L2_PIX_FMT_P210    v4l2_fourcc('P', '2', '1', '0') /* 32  Y/Cb=
Cr 4:2:2 10-bit per component */
> =20
>  /* two non contiguous planes - one Y, one Cr + Cb interleaved  */
>  #define V4L2_PIX_FMT_NV12M   v4l2_fourcc('N', 'M', '1', '2') /* 12  Y/Cb=
Cr 4:2:0  */

--=-CAwZvlptZ/R7neJeECDI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYH1QAKCRDZQZRRKWBy
9Hi5APwNsO/NocrcIJcIll1SPJxbqsKHJGgTqWhDD76gjdf7EQEAs6EtAl483env
blqRUPQrAHH8q7BIoKoBtSv+UXwi4ww=
=6io4
-----END PGP SIGNATURE-----

--=-CAwZvlptZ/R7neJeECDI--
