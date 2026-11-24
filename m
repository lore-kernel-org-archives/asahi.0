Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558611;
	b=Tk7voYbPEYKJhRDzN+0wsX2cwNvFAqgTZpEkzuaSYYkxC3jMrCUVi9Q5xcmlbPI5PO/w
	 qrOuDOp/80wZi31MeyFK2MxHjTIBUWFlimIJyFdEgDYc11X/No38Dm7TUNzYcPcPydLQV
	 2MVgpXvCG1L5St8MtGJxpX7w20/a7B5/A99p3cAc2Ng3Zj2/c8dRn7tU1vwhiWWmLYPH9
	 9PBLF2YaXOeud0V7sw1sLCvhfGtkg0DwixYJuIhRE7mYwm0sY89cRhZKVCyzvnj5X0Dlf
	 rgBmQC5nHSenbhLzHJdR87MpLycwXmaYzD9oVHB/KZs3zHQlIgC3CEUrXfmQN1HUGeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Autocrypt:Content-Type:
	 User-Agent:MIME-Version;
	bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=;
	b=SK3svU7h67YMiuPbmJAJV5gYo/bM8KfGQhW+r8zjC55xlMHrlJan5Iu3wLF2b8swE0I3
	 vYcJphLmU8PHmwT/yLShr6kBoCrHTT1IB2lnuioPT7if4J15vU0109dPif/KgVIyRggi4
	 /a3kvYWEtvkh+QbEGRorlt8Eo0Rc98i+ojVQswO1J+ILVScQJsUIwoPV+KtKJXp0G8udE
	 nunj1hFYpO4wRcsbXZ54uBwFKzH8LGihiXfZR0Ov+3E0lstISvQEaeFl3xg2pKvWnrD6Y
	 MRyFitEO5tFnb64x/5RSoNBoM4Gl7FvysVGoA6itJItfUmtL3uJFcrzbJFLJ86LdYIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TUQsCvaH;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED6D606A327
	for <asahi@lists.linux.dev>; Tue, 24 Nov 2026 22:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AED6D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TUQsCvaH
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-92125687442so50454716d6.2
        for <asahi@lists.linux.dev>; Tue, 24 Nov 2026 14:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795558610; x=1796163410; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=;
        b=TUQsCvaHQLNalKcRlnjLo5BWhb2hunpSZbHYOZTyTgR7IR2s9cbzyFDFcY8ERBlAYd
         f/qyB4LpQKweKczb4hi4QQ3qBBKsJq94uFnV4DrxKoSD0am/jBGzaxlEoLBlk1d7hoUU
         qRMZJkmLzQ9nlBTIoqBILsYAp4SAVIwoS8RZM4f3e0e29dhIiHbkHlFMI9MOPtphVdpB
         s+TZZYKhqbT+cJGf5rSgxBP96hSmijszRfrUdGNNm+tJ4ZtVXBgyhX3+HXj7NVf3TlKk
         86vqsDtGx5Lq8vGEKt//SpWPuN3VMfnvbD+lThoom3NHBkfV88r8W1t3+UvrIIlFy8LL
         vrLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795558610; x=1796163410;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uhmi7vdLdSTBTBfiyTnnA5vkStcVEY8sN0rPcbiafRM=;
        b=McVlPdHckEdMmqOSmgfSwFi9gn/yuwKtKn54oZOQLPpFoiRwmGEK0g+US2HSqqi0jz
         EXrzLntUU8X5UYC0ZPnzq5YOr9eESlnIh0jK5KdZVi0B4NFG2cH8NGiznneB1lr/I80e
         zwd8u4gOmkk4QQe3byx1WDAHAAGQ857mwERjZp352rfoBDtRhgzb8nlxZw+AvBLBtvgG
         oJl9qxCOa040BiG4bhwpjCPc86yDhQ96q/oV8rDVsXSv2jmopfE4BwnZ47Kvg0OSfwLf
         vZo7TtZo8LSzQPM8u2Hl2iJGgL+Hpb/VSJONjRFRkqaSNuOyQDIPp9zl7NFmzhvpH2JP
         6RcQ==
X-Gm-Message-State: APuU4Z8cIkG76A0+592uNMzNewGScoF+TCb4qIZ7I4EHgVFFYZXDofCr
	vjmudrBrLIaau7+4mwm0SiKca4mYVzyRbn9PrpL0ZdeNAvBxjLXWhyNhevEAiN7F7zE=
X-Gm-Gg: AZFdTZchx35Kd9J+jYc5xteKGRa5hyvMdh4cUqJvkk+9VnAJZaq2zHY9Yu3BzF2SCuE
	HZR+HLaBd8MifbDuA/TS5YnlxNSdZ5svX4Md0OOXbecqFdht+u0yoBVSeyz173d6hMkCKBystHM
	lGtbKC8v9rWK+K7zs4SVzmObY4hqk1QwvqGL6gL7pSFr2K3TR031PvpKx4cUVK4yEKkdbPlIEHj
	jux0zWsFu2wl1VrUFkRqOoznY40MY4I8xn1ghJ1ddc1cYlVSPOr+r0khfobYqvjEvI1u9ITrnfe
	0hD6HDj/utlL8Vc28ACIKLuzt7DiMuk/v/ooqV29LLAlRvt/ocuTFSi2ca3QnxSf/xK4QeqWtP3
	Ew/Xy5fb+Z0Qr1YdsENHLvTl//YqvZzbiyCQIsOWu0JetMKw3sOPJEUfA/qhycOTc+dZlkxCOSJ
	99PDDCH2XEA+qfxqPTf3n1pjkG9Aw+xN66T+DdCX0mAB9A6ssBzGgngmF++ByVj6oIK+YB20rFJ
	Rs4LglmkqkVfl0hzSCTIIuS1DOfVZtODOeflNBtAmMSczziHTuj63PFa3HFKpYD4k+9mJv+Dlb0
	/XqQf5dHBdUMcGBczNZypyb20HPJvO9PmF+//AE+dSsbmk79smDHHjs+
X-Received: by 2002:a05:6214:1d01:b0:91e:f8bb:bfff with SMTP id 6a1803df08f44-92134a695bemr295012926d6.10.1795558609635;
        Tue, 24 Nov 2026 14:16:49 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134bfe82dsm143924506d6.0.2026.11.24.14.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 14:16:48 -0800 (PST)
Message-ID: <4c54e652e8fb714600852a3028b892c6a292c6cd.camel@ndufresne.ca>
Subject: Re: [PATCH v3 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
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
Date: Tue, 24 Nov 2026 17:16:47 -0500
In-Reply-To: <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
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
	protocol="application/pgp-signature"; boundary="=-fZhiUwItIuN4elZmSsKu"
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

--=-fZhiUwItIuN4elZmSsKu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9crit=
=C2=A0:
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 922cf74c4eb8..384ff77771ea 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *frame)
>  =09 * According to the spec, tile_cols_log2 shall be less than or equal
>  =09 * to 6.
>  =09 */
> -=09if (frame->tile_cols_log2 > 6)
> +=09if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)

Shouldn't this be 6 too? (log2(64)).

Nicolas

>  =09=09return -EINVAL;

> =20
>  =09if (frame->reference_mode > V4L2_VP9_REFERENCE_MODE_SELECT)

--=-fZhiUwItIuN4elZmSsKu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawYMzwAKCRDZQZRRKWBy
9BA6AP9PS5poldHn0LERh5sldYW2P73wx+zTyuozNl+3ELVLUQD/aj0MPvIwO2sj
O8VuT9IjLVqFj9L0GOL8uRcAYapAAAk=
=/mpK
-----END PGP SIGNATURE-----

--=-fZhiUwItIuN4elZmSsKu--
