Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637E014F9EF
	for <asahi@lists.linux.dev>; Fri, 12 Apr 2024 18:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712947043; cv=none; b=DcOIF55N6L/XoANA3lDKSwq+MR8eS/q8KkHrfrodA8FqNcP2zuf2CQUXCJjHuO92qERPSPNteTQNctXs38hY8DnkXyq6UdV7H/Oy9VAlT0gYl7Hju4Jg/ZRR9/roE1ZBqmVY7lwZo9w8kwRdheia+9G39VP4Qg+M95BJ3PRit0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712947043; c=relaxed/simple;
	bh=dpLtXkD6Akw0rRGGH7LXr338LjU5pfpzuxNcHLtO4Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGRRifWh5aUTpld8HVsQXFYb53+CH/QAzRDx9wziqRKzBOxgAiwC5LbnWvy0ss1KXee2uVRnVjamV2m3v3FCRgYqPmPN9ag5ZeRD5QKtmW9Dv3w16wrSK+6I6WnzWHoOMl+50TKwBJTh3L8aqeO6K7PTFdP3HoIBbP/8Xbda8CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=purykqaA; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="purykqaA"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-78d62c1e82bso73312485a.3
        for <asahi@lists.linux.dev>; Fri, 12 Apr 2024 11:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1712947039; x=1713551839; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dpLtXkD6Akw0rRGGH7LXr338LjU5pfpzuxNcHLtO4Rg=;
        b=purykqaAilD28tEqD9+sIF0y/uJExS5E8yhPfY8X21ZmNXKC7uN9kZe3hyT5PvYA4H
         kji4gpKlK8dXe3N22J9dR29ddHyt8FmW+L7k7z+J2Ad8nV09NptQWDQUXyb7zUqvxTR9
         sKKSLmB00hydItYE/mNQMu6V5ZG+ZJG/OkRd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712947039; x=1713551839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dpLtXkD6Akw0rRGGH7LXr338LjU5pfpzuxNcHLtO4Rg=;
        b=cEHT+BOgAy/LVsGF86iQtoe0WQkqjAeA255REZ3i5UTxUa3IUTrAJrWea1suVH9DQL
         Kkmo6EON7s+Hs5ICjoQJwYzx9knh5qb03eyKIfUEYW4wqCJ49vIUUabbkM+e6QTkvppQ
         O7jREd9YGmdSUJXjb/PO5vPTUscHLYp0zEIJdnUgj45nLcfdi964G6yxNzSn+5zamR2D
         rUnmpUrwUikyj391Py2Lycz91w/H5VufUx7DAy3wVUQIqcJGPQUa2aDTMW00o3asKZWG
         TKjULPZN+p6JqSXcSWMcnsgO3furgcxGxyUlOuifDBvTdizqXRtozqhYWVKTkhOm4Fnh
         PkIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWo2YgLG1Xb5ylf4F5Ck7EgnGfPiq+ZJsuKFCdbfgmS4GTyiFIQP8wo3Mzb3cO08Y1W479qLKcTGxGYTkPmiyvnDibVYFc=
X-Gm-Message-State: AOJu0YxMdcjvj4ltxQpK2r9v5I87/7N4b+TryIgDo9X+e7rwECCUK7Lf
	dfWlajCda6uU5UK/4dt5rYEk8jN6GRQHFH0PIIHQ3D+HCm6zIhskOIKovK4YxjA=
X-Google-Smtp-Source: AGHT+IF4+09w3MRreZiR6QFlK7drCaXDg1lMVmhTPOlVAelqk45clM0VXW/smp7n7ZjMo5GXV2ikaA==
X-Received: by 2002:a05:620a:1022:b0:78d:6574:8230 with SMTP id a2-20020a05620a102200b0078d65748230mr3569127qkk.56.1712947039194;
        Fri, 12 Apr 2024 11:37:19 -0700 (PDT)
Received: from bill-the-cat ([2806:102e:18:245e:b648:93e1:5c61:68a3])
        by smtp.gmail.com with ESMTPSA id qp13-20020a05620a388d00b0078ec3c4452dsm2344803qkn.9.2024.04.12.11.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:37:18 -0700 (PDT)
Date: Fri, 12 Apr 2024 12:37:15 -0600
From: Tom Rini <trini@konsulko.com>
To: Marek Vasut <marex@denx.de>
Cc: Janne Grunau <j@jannau.net>, Bin Meng <bmeng.cn@gmail.com>,
	Simon Glass <sjg@chromium.org>,
	Joe Hershberger <joe.hershberger@ni.com>, u-boot@lists.denx.de,
	asahi@lists.linux.dev, Neal Gompa <neal@gompa.dev>
Subject: Re: [PATCH v4 0/6] USB keyboard improvements for asahi / desktop
 systems
Message-ID: <20240412183715.GN2493117@bill-the-cat>
References: <20240404-asahi-keyboards-v4-0-2266033feaff@jannau.net>
 <356b892a-a681-4ae0-a6c8-ed1b4b5a8717@denx.de>
 <ZhBLfQfxB_UEwvyY@robin>
 <5467f380-de35-4776-8c32-90b8e08aeda7@denx.de>
 <ZhGq0U_pkrYMe4S1@robin>
 <5ed4e6d2-edc7-461d-8183-e91d7b994aa5@denx.de>
 <ZhOg81sBEDLgCSIa@robin>
 <83e48e51-f88d-49d4-bcf9-340e229fdf76@denx.de>
 <d65ea7c0-cb89-4cb9-8378-11839a6ee63e@denx.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a84fH7bpEQysGXgq"
Content-Disposition: inline
In-Reply-To: <d65ea7c0-cb89-4cb9-8378-11839a6ee63e@denx.de>
X-Clacks-Overhead: GNU Terry Pratchett


--a84fH7bpEQysGXgq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2024 at 08:26:18PM +0200, Marek Vasut wrote:
> On 4/12/24 2:53 PM, Marek Vasut wrote:
>=20
> Hi,
>=20
> > > Seems to work here with a broken imx8 config from the CI. Is it ok to
> > > rely on dead code elimination? Apparently it is, build with KCFLAGS=
=3D-O0
> > > has already several other missing symbols.
> > >=20
> > > See attached fixup
> >=20
> > Thanks, squashed, let's see how CI likes this.
>=20
> I think we are getting closer, but still ...
>=20
> Pipeline #20308 has failed!
>=20
> Project: USB U-Boot Custodian Tree (
> https://source.denx.de/u-boot/custodians/u-boot-usb )
> Branch: master (
> https://source.denx.de/u-boot/custodians/u-boot-usb/-/commits/master )
>=20
> Commit: 63f6a449 ( https://source.denx.de/u-boot/custodians/u-boot-usb/-/=
commit/63f6a449bffe46beca89580d3efa48e5d041025c
> )
> Commit Message: usb: kbd: Add probe quirk for Apple and Keychro...
> Commit Author: Janne Grunau
> Committed by: Marek Vasut ( https://source.denx.de/marex )
>=20
>=20
> Pipeline #20308 (
> https://source.denx.de/u-boot/custodians/u-boot-usb/-/pipelines/20308 )
> triggered by Marek Vasut ( https://source.denx.de/marex )
> had 1 failed job.
>=20
> Job #815411 (
> https://source.denx.de/u-boot/custodians/u-boot-usb/-/jobs/815411/raw )
>=20
> Stage: world build
> Name: build all 64bit ARM platforms

That looks like the machine doing the build failed, I've kicked the
retry button.

--=20
Tom

--a84fH7bpEQysGXgq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmYZf1gACgkQFHw5/5Y0
tyy+EAwAlfzwSPW9gGqIWOidlmlK3bbiFmZgyMFkYJ/pv3DmO+hZnNKik8K9W//u
p74BHLwZ5dpzpItjXgHYid3OZlQLH1TPnNOg4+d47Rkaj2A4/pZYlXgx0jp1CLuJ
LU05GWouCVh/m4HmZ6Db3VtmqTOCxKz/DKAAR/auAgScAw/6/U22TNJlT2bH00Iv
9xnex5y4LJbBgLkOJjSaI06+5WkwfFM+h0wANHzUv7vl8sUhj73Dfvhyzrfdw/Ap
6PY+nxm97IqohtJQUgwNO0/HXUvQEcrmGuiHVSVgyvazpLJh/sMfjD1CI9Yr877S
GhV02jbJ+2G/fyoyUXZa26ka+PnF1gWnN1fhVb+WkAEgkCS5thCHfDqKC13GNfTI
cQDAt+MNAO572nabYdl3OXTpAmeMVTkkOaL8JO33L5XsptZNYx97QlyBRViVoEhl
IdMqHrSx/pb1Pu+TUlO8BldJXp6ykVPQfOSBRna9+YLDyRti+E+KFwMWKM1L1BTx
ebTsuieH
=rTPy
-----END PGP SIGNATURE-----

--a84fH7bpEQysGXgq--
