Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795749254;
	b=PrL8RRD9a15m8v0KbEynz+YN69i9L4AOqrwTqluXfDrLEn4RiEBWe5MK2VmxtRTBY3Iy
	 2qxvPCa337+u3AiQLe4NcOUdw6WYRMW72CpVwxkliLlkVpUBRviavoXHc7jjhLgA2l4V+
	 xHK4sTDMiNctl4mkgffSJJIuMiF2/IE/P56NfMwmA4MLPD6hrsemIcBdC4M5NygoM1Syd
	 Z2r0FrDzSte5tUQlvCF3Bt1oixlOZMxgG0auUhpq1paEEhK+4ICI9xjShIpHG+/z0dtTp
	 509rTTEnMIIS6H7YGF2SHGvNgN+/PYVh+2uTfz5w5tTTh3SUjr+Nvq+ZXh+xgOzfFMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795749254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=;
	b=v+au0ennuRuZ2nCKdk7rgeCYRcX6DnjsJcSBZmEyXXLjjMPY3iht3QT7nncRSNLslUw+
	 JeOklPLifniy0fwsC+vcOpPvFZtwqZoOM7sqT04Bjcev6qaZiCdkZ8AfUw24yddNHh1VM
	 2UoN2PD9qEnszVPY6WckumnVB7JhbxryVmWCiVG1RJOZt7pUZZKY7jxFJYFXaiQXHf0G1
	 5kwX0f43l9QGjzw7qrwBPqKdUhr4gTN5DoCB/ZBeNgiEI9NDcVTDEFv7LgGVl0l3Sh0Ko
	 2+CXeMztsrSs3+HQv0mWgay6h9g+Zpv0xy5rnHlA6V2ScqdL0XSdC3ZE9r8FR411aXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K0PqLJOs;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A15606A326
	for <asahi@lists.linux.dev>; Fri, 27 Nov 2026 03:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A15606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=K0PqLJOs
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-537548b811aso61187801cf.3
        for <asahi@lists.linux.dev>; Thu, 26 Nov 2026 19:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795749253; x=1796354053; darn=lists.linux.dev;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=;
        b=K0PqLJOsEWR2n1IOj0kFW+QpDNjw1FytzSVy47yrAmGKCDpKoqBcMZLXqJ1d2ZDR0R
         7Q8TajQ0hbSCe6xwv958+4DrtAMxJPEEwLMLcwgpmP7bcLIuNBWbaR7Ugy2i/05GJdAJ
         +1IkndFHcUOWvTUHgrHyaqjHRqP6TdlZKjqBHNl5Xjt055R+cSp7aq7iMgUuhHD5s4BU
         /3zGYWuoHbwwQRcFgt+Qh1FYiyIy/P2/1ZGCv54SOQqAfoyIQmsAvgQDVqCCQ57phu54
         DQ9mqJM/fysXKV3OGwC7D1K7tycNn0eTwE3NMOZwjrw5eUZVl87/pijXJBBp5D5Vjx37
         lxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795749253; x=1796354053;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ugJPjuyaKFJxRku2cqxFQd5DwZah1E7qey/0WnvGBI=;
        b=uJMvixLzQyen6K0TC2MwNIoxUXQpq0vnHdPsQ9reFzqRAJizwSOezveE0i6IghZOrg
         y4beK55Nq2bkO+QfJrH2PumoTib5b6pLgfVYmVc62xenU1HspGG75FoVoD/j4zVnuc07
         xM1WQB2zg0NqG4vVRO+ns+/MVoCKoxY8aRzDw0SGEM9Y56r7aFDic8/U+kcvMAoRYRP/
         rlBe0GnWZwg+hSghgcaQ5wigy4pnBCu96f7G39NF81I+kwWvII5vZEVRNd4ScB+DOz6n
         2OGdep5BpHunBQjGKqFVejsFia7JTwKY3Fzub/ZeK3oND0rTKgZNNP00K4VWolp5nhXx
         4yNg==
X-Forwarded-Encrypted: i=1; AL+hErG7Bf6V9DnjnC8Vc6LlbuUIgSOm+XMdK4kVPXFzkzmKaN6eDOGttBkVDiyUzx24whHr+5ivhg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+uO7FGqv/k+rBgqExUM8fATu5n3kgMndlL3TbhiCVtaK24biVb
	TUx+DSdiAS1Kbr7n2ZrkaEmbB+ZkvdS6TcfKllQqBz7Zc89EOwAU+zJcjuh9FVrXmzrxQA1wTX3
	pxRZSOwY=
X-Gm-Gg: AZFdTZe0OFviz+GdCwfijiSiCfsrjvOA70vtrKRs7cyXMXuEaRtdm5KmqaE/Nx4kMhQ
	gagUZ4mBjG3khpUvGaObCTzfHOrLjocltd3wI+bIukfc/tfmLQNSzmGfIlTieuaBgTcWjJXd7O7
	5dgcPqGaNMXe5ZZxQtSUJ4p6CN1LWxMma5kbDZVkOTcjb3c4Z3fs4jFvy3IXneD2QShnbmGBxtC
	9g8DL0v5RwGpYQJhuQrw6VgbaGR3St8OHJhINCOigFqSKxI4LdCSX5PiXy2fY09lCOuLETKssyj
	3cd6XpXLcCU63htJ1HrpkHHga5SX02E+khnnejHndlcHcIHVIrgtzRyG6tHAgAjmOFOKV8UdtE4
	37CILnk17iUtrhZ8VHE5RBSpOjGnyaTrlQUnzVMWyIqtk5O1Eogyt+EiaxpzS1BT8oCaaAc9U+O
	5RS46GMSPmVeFD+XcoGuMAH09rgQp5JWDMjbdGsKuWTB3Xu3grJykN+V8w5FJoqC68g+s2nRl4o
	UEU06W9itEX0ge7UDXT15chfRCtpQt3w3wtRagI1h7qfl42mdtbr9MX6f0M6N41Q1tKDsKw/1zc
	S1IJixNLnZ3o70F72w9idRTHHW0owHFTuh5yCApAAgbniVylksqDDvQ=
X-Received: by 2002:a05:620a:4446:b0:949:70f1:de2f with SMTP id af79cd13be357-949ba8260f2mr3894266285a.8.1795749252644;
        Thu, 26 Nov 2026 19:14:12 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::5ac? ([2606:6d00:11:8ec9::5ac])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0354a9sm1733363985a.5.2026.11.26.19.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 19:14:11 -0800 (PST)
Message-ID: <1f649c8c2c08c31f1f6ff7d7a17ea02301d89579.camel@ndufresne.ca>
Subject: Re: [PATCH v3 05/17] media: v4l2-ctrls: validate vp9 tile_rows_log2
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sofus Forstreuter <sofus.c@icloud.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa	
 <neal@gompa.dev>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko
 Stuebner	 <heiko@sntech.de>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org
Date: Thu, 26 Nov 2026 22:14:10 -0500
In-Reply-To: <awanusdfmrjYpdHT@m3>
References: <20261020-avd-v3-0-85cbaa2125d8@icloud.com>
	 <20261020-avd-v3-5-85cbaa2125d8@icloud.com>
	 <4c54e652e8fb714600852a3028b892c6a292c6cd.camel@ndufresne.ca>
	 <awanusdfmrjYpdHT@m3>
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
	protocol="application/pgp-signature"; boundary="=-KBWr4qryrDMK+mhbuy3u"
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

--=-KBWr4qryrDMK+mhbuy3u
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 25 novembre 2026 =C3=A0 10:17 +0100, Sofus Forstreuter a =C3=A9=
crit=C2=A0:
> On Tue, Nov 24, 2026 at 05:16:47PM -0500, Nicolas Dufresne wrote:
> > Le mardi 20 octobre 2026 =C3=A0 11:37 +0200, Sofus Forstreuter a =C3=A9=
crit=C2=A0:
> > > Reviewed-by: Neal Gompa <neal@gompa.dev>
> > > Signed-off-by: Sofus Forstreuter <sofus.c@icloud.com>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/medi=
a/v4l2-core/v4l2-ctrls-core.c
> > > index 922cf74c4eb8..384ff77771ea 100644
> > > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > > @@ -638,7 +638,7 @@ validate_vp9_frame(struct v4l2_ctrl_vp9_frame *fr=
ame)
> > >  =09 * According to the spec, tile_cols_log2 shall be less than or eq=
ual
> > >  =09 * to 6.
> > >  =09 */
> > > -=09if (frame->tile_cols_log2 > 6)
> > > +=09if (frame->tile_cols_log2 > 6 || frame->tile_rows_log2 > 2)
> >=20
> > Shouldn't this be 6 too? (log2(64)).
> >=20
>=20
> The max for tile_rows_log2 is derived from the spec (6.2.13 Tile info syn=
tax):
>=20
> tile_rows_log2 =3D f(1)
> if (tile_rows_log2 =3D=3D 1)
>   tile_rows_log2 +=3D f(1)
>=20
> This is also what eg. gstreamer does. I will add that to the commit messa=
ge.

Thanks, note that I was also confusing AV1, my fault for hopping codecs tha=
t are
similar but different.

Nicolas

--=-KBWr4qryrDMK+mhbuy3u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCawj1ggAKCRDZQZRRKWBy
9DsUAP9PRVkjRHpiRiSLgzM8l9UhjnS0sDzgmwo4BJV1vzvvAgD9FAmOhu7fqhJ0
E9UOn92W7ZLiKmduKFmpzDXkPI9rEQE=
=QqIL
-----END PGP SIGNATURE-----

--=-KBWr4qryrDMK+mhbuy3u--
