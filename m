Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795557494;
	b=QoPY1YO8ouSyWvuu5weFlhcm3zgxWQZcLkvKT8f+iO0Vn1Mx8NqW/E+ihkL5ipS4lffT
	 KfCczSO6PDMBVA2fJlqM+6FaDo8qiSji/05fLn1AZnb9kIp32UKuwt2tY95dITPF0DW7z
	 9kPAdAm0HbiuCm5qvnithquMnP6YgWoU452rsgaKmCmKTjF5RxNE5H8eq/LjxysOkK2fq
	 HITeioFeavdy7m2WZvFba6hH6dGaXPmG3fCdvZZ+rtahTcdqowMzz+zFVpLePdkCZfsct
	 f2mGB/+Zzy+mstAq9UkLFoUYXxA0fLxQbMhurwIiZr8WLV9VbnwOr6kZUS8sG1Bpt4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=aa7YPfOROhEx6JieLJ3TSEkUZ7Fh13WAPekCnuIIbKA=;
	b=cJ+moMTsJVHf5y1XsSdcV53iYDNXVDv7zEm+VsBxHAj+c0M9D8dmTfV0TU6M3kI1uQbO
	 96wKu+DbbFNgHlOu2nTrTJMoSKJHlT1L2jDvgbxLNSWum9xAvVRG7o3ONa2ZEJUjRbBK9
	 3Fue4GE91ux/+PaBw7OsPUkAUNQazgX7WE4WP1FN6BwZZsoif/Kn3hWqk1C64cpI1VpRV
	 E2GsXGhHwpKvZuSrvXUxMmD+kX13dSziI9JWIdF2oWeJ9d+GQk1ISaalCiAXHTapXmA0U
	 o6Fn0TeXPQW5PDOewCaFHwYTmgik3PVZ7cEowNqte08Fv7suL4SOjJvja9DkfI97bnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bWr7ODHp;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A668606A323
	for <asahi@lists.linux.dev>; Tue, 24 Nov 2026 21:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A668606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bWr7ODHp
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-55d3563e50eso29114401cf.0
        for <asahi@lists.linux.dev>; Tue, 24 Nov 2026 13:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795557492; x=1796162292; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aa7YPfOROhEx6JieLJ3TSEkUZ7Fh13WAPekCnuIIbKA=;
        b=bWr7ODHpwz7MDyev11fJ1mdNVl+R2g8A/Cx4jciwx+Y54q4DTkZWbt4dx9ER0Vn1tL
         1xjOjk3hGvLOkRu77H432wUz1LzYJHKPCSmFi3j0tEES1AqTgfl1Ebpu0R1AMBTKIw1L
         X5Z4xhMHfLyr8JfoBSkWtd6M4whDCNvwt/yKpIqengtCMTsCk4AihQnPYBLzBPV8mYAg
         y57pHF6zrW77lIMBygaxhJ8FOhIkPWFqZ7qx0Kmb34xj2KMe4zSGHfDME2OdHbjePbCj
         iGT1mt8ZQt2lKblWqElnIIhj8Sk92WnNBO0WO+Q6r2uEx1deZQHsYMIy+9E4NUacnYV7
         Uyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795557492; x=1796162292;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aa7YPfOROhEx6JieLJ3TSEkUZ7Fh13WAPekCnuIIbKA=;
        b=KIdpnjxp+VNXHr0EPX9pu5KnyLB6zSdZUxMW0YTEH60vpU4VH4nZYv14aITkGTXBAw
         O2GXYXdtLwCV8zMG4cFRqjjQYyLPEx0xesSuQOgVWZUQo3drcz2uJ7dePcbdgv99MlPl
         VlczlF2b6K9wr+PA48pGDxCh3GQvRR6GwW0k4Q6p1pKoNQT4hpicGEE016sGBJMMqd+3
         3/89FxnZoUSUfp20JfVH+/pv0CZilQ7B68xFD38B6nm21lYm4k3WPoO5PN99sY71gaHG
         wxUiPa5JS1Tn9YPHh4ClB70jgAZ6EArSNCu/s17V0olRU81Km4ZDRfLHJjWJ/w4T9c2R
         nHSw==
X-Gm-Message-State: APuU4Z/jTY4C5moe6mIjVYkXUzAMUT8teEzya7agJAtalETD7lNmz5Au
	jBre6nwhRWe/6+cHfBRc5XZZ7hLqSvmpBPfj1qxbxsw9aMqAweQxo8XTtdAWyb8LACI=
X-Gm-Gg: AZFdTZfWrUh3CjwWbreI9OKX35DP8NicggiE8R7Vrae7VWLrxW8Ofo/kxfyK9p6FcI3
	MPOV198mv4SQ/j7kRf31ca7GOz7YxIC2qDfg7+LXQ/yVbau7CcaL1eKReSM//4531jVOykTmHs9
	rnnSaWh7vnMDTb700x7YKoRYD36u5s+ykelof9LnZQ/h+CT2FNekw26BkAw+gfNXY3qmwjJFGOf
	KFzQo0KtZn4dFDfKmUul4LUghrQpLb99T8uRh04syvrEYltQPyU/bgWC9G8L87aDOKx1V4ooByO
	UhOisikKRk/ypbfshP5xJbGT0jl54nXLrgxilX7Lu251pXZWnOFOFLSTNGuYIF/Dw5prdL2wg4O
	ENw0OUi71x2A+w+lGAoXvqUuyAA1l1o348gCYBLideUQBWs9206Av215Lvh9vDY88dfIhPYwGJY
	+4nQmrtf61U44jRpfT9i4fhrasqhkVJYwSTqAPLcpO77gHaGy9GTeT9nWkV2ZFVcorQqodUbLDa
	3hW3R4ycmtyrSiI18YzEjDD3UmPZglRVAqQSmgwOwQumi5DicPBh+8r3ueIF2jW7lu6fN/j2lfu
	NFn0xJJW7VP2/QJk43e/ZaIoIj4BB48wbKk6lkh/trdK01DqIk8CWCRVMF8rjmvOJ53aD3EXHdJ
	J
X-Received: by 2002:ac8:5e53:0:b0:536:699d:9a22 with SMTP id d75a77b69052e-55d76aa8754mr292073611cf.57.1795557492035;
        Tue, 24 Nov 2026 13:58:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349f2186sm148298976d6.29.2026.11.24.13.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:58:11 -0800 (PST)
Message-ID: <79df445f3906ef7147137d991e0fd14f7815d22c.camel@ndufresne.ca>
Subject: Re: [PATCH v3 03/17] media: v4l2: Add Apple interchange pixel
 formats
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
Date: Tue, 24 Nov 2026 16:58:10 -0500
In-Reply-To: <20261020-avd-v3-3-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-3-85cbaa2125d8@icloud.com>
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
	protocol="application/pgp-signature"; boundary="=-0opacj9JZF7JzicRk9mL"
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

--=-0opacj9JZF7JzicRk9mL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9crit=
=C2=A0:
> Apple Interchange is a compressed and tiled format modifier.
>=20
> Its intended use is for sharing buffers between hardware blocks (GPU,
> display controller, video codecs) on Apple platforms.
>=20
> Add it to the v4l2_format_info table to help with calculating sizes.
>=20
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 7 +++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c  | 6 ++++++
>  include/uapi/linux/videodev2.h        | 8 ++++++++
>  3 files changed, 21 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 43ef12d073a3..896c07d93032 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -336,6 +336,13 @@ const struct v4l2_format_info *v4l2_format_info(u32 =
format)
>  =09=09{ .format =3D V4L2_PIX_FMT_GREY,    .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  =09=09{ .format =3D V4L2_PIX_FMT_Y12,     .pixel_enc =3D V4L2_PIXEL_ENC_=
YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 2, 0, 0, 0 }, .bpp_d=
iv =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =20
> +=09=09{ .format =3D V4L2_PIX_FMT_APPLE_AX12, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bp=
p_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> +=09=09{ .format =3D V4L2_PIX_FMT_APPLE_AX16, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bp=
p_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> +=09=09{ .format =3D V4L2_PIX_FMT_APPLE_AX24, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bp=
p_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +=09=09{ .format =3D V4L2_PIX_FMT_APPLE_AX03, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .b=
pp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> +=09=09{ .format =3D V4L2_PIX_FMT_APPLE_AX23, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .b=
pp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> +=09=09{ .format =3D V4L2_PIX_FMT_APPLE_AX43, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .b=
pp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +
>  =09=09/* Tiled YUV formats */
>  =09=09{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
>  =09=09{ .format =3D V4L2_PIX_FMT_NV15_4L4, .pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bpp=
_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-co=
re/v4l2-ioctl.c
> index 1f2519ffeb2b..e40e2ebac241 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1561,6 +1561,12 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *=
fmt)
>  =09=09case V4L2_PIX_FMT_PISP_COMP2_GBRG: descr =3D "PiSP 8b GBGB/RGRG mo=
de2 compr"; break;
>  =09=09case V4L2_PIX_FMT_PISP_COMP2_BGGR: descr =3D "PiSP 8b BGBG/GRGR mo=
de2 compr"; break;
>  =09=09case V4L2_PIX_FMT_PISP_COMP2_MONO: descr =3D "PiSP 8b monochrome m=
ode2 compr"; break;
> +=09=09case V4L2_PIX_FMT_APPLE_AX12:=09descr =3D "Apple Interchange NV12"=
; break;
> +=09=09case V4L2_PIX_FMT_APPLE_AX16:=09descr =3D "Apple Interchange NV16"=
; break;
> +=09=09case V4L2_PIX_FMT_APPLE_AX24:=09descr =3D "Apple Interchange NV24"=
; break;
> +=09=09case V4L2_PIX_FMT_APPLE_AX03:=09descr =3D "Apple Interchange P030"=
; break;
> +=09=09case V4L2_PIX_FMT_APPLE_AX23:=09descr =3D "Apple Interchange P230"=
; break;
> +=09=09case V4L2_PIX_FMT_APPLE_AX43:=09descr =3D "Apple Interchange P430"=
; break;
>  =09=09default:
>  =09=09=09if (fmt->description[0])
>  =09=09=09=09return;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 5472e433ed06..f218f4fb26a4 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -842,6 +842,14 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_PISP_COMP2_BGGR=09v4l2_fourcc('P', 'C', '2', 'B') /=
* PiSP 8-bit mode 2 compressed BGGR bayer */
>  #define V4L2_PIX_FMT_PISP_COMP2_MONO=09v4l2_fourcc('P', 'C', '2', 'M') /=
* PiSP 8-bit mode 2 compressed monochrome */
> =20
> +/* Apple Interchange, compressed and tiled formats */
> +#define V4L2_PIX_FMT_APPLE_AX12=09v4l2_fourcc('A', 'X', '1', '2') /* App=
le Interchange NV12 */
> +#define V4L2_PIX_FMT_APPLE_AX16=09v4l2_fourcc('A', 'X', '1', '6') /* App=
le Interchange NV16 */
> +#define V4L2_PIX_FMT_APPLE_AX24=09v4l2_fourcc('A', 'X', '2', '4') /* App=
le Interchange NV24 */
> +#define V4L2_PIX_FMT_APPLE_AX03=09v4l2_fourcc('A', 'X', '0', '3') /* App=
le Interchange P030 */
> +#define V4L2_PIX_FMT_APPLE_AX23=09v4l2_fourcc('A', 'X', '2', '3') /* App=
le Interchange P230 */
> +#define V4L2_PIX_FMT_APPLE_AX43=09v4l2_fourcc('A', 'X', '4', '3') /* App=
le Interchange P430 */

These needs to be in Documentation/userspace-api/media/v4l/pixfmt-reserved.=
rst

Nicolas

> +
>  /* Renesas RZ/V2H CRU packed formats. 64-bit units with contiguous pixel=
s */
>  #define V4L2_PIX_FMT_RAW_CRU10=09v4l2_fourcc('C', 'R', '1', '0')
>  #define V4L2_PIX_FMT_RAW_CRU12=09v4l2_fourcc('C', 'R', '1', '2')

--=-0opacj9JZF7JzicRk9mL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYIcgAKCRDZQZRRKWBy
9LYlAP9eNt64YAYVi+3tdmO2eVOgxAxX3MBInpvFBV83Km5LlQEAva1+LKSeuhBa
0jv5NXY7twZmCiEmTXSCAQrzfD7RsA8=
=Z59I
-----END PGP SIGNATURE-----

--=-0opacj9JZF7JzicRk9mL--
