Received: from mail-oa1-f66.google.com (mail-oa1-f66.google.com [209.85.160.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195B5366DB0
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 17:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767980038; cv=none; b=mu41RN0Ibuat3n5NOQf5RU4B8zNF24BZvUSuLO/xuXucIUhw55nLUiQJEn9Q1AfIL+0wHjqsiCnvOTA20DLKYp2t/+h6p20VEmS5etB38pE/nz5a+iiFPaLr6wycxAy85q/CgIuQmtuXS/gbJPfaLy8T+IiaHezQCjZnCBksJ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767980038; c=relaxed/simple;
	bh=AW7pKTa11HH9f4BPF+9uB7vJtgdJiTLDvTVzh/n1j3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3Q3n+NfRxK3HXXVTSb0Snm6EYoy8jtkYYpkyup2kYHEHi2bU64CVt3OF5C0jbqWAQDbAWcRZgJD6RXTTL8akw8PVC93aocKdyPsvAAb+TBBieKiLP3o7Qm9FL9bpmiYAhsKO8XFrV984wIjbeqe5NYIcczdyG5ydgGd61U8Cn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=pWRpCO0h; arc=none smtp.client-ip=209.85.160.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="pWRpCO0h"
Received: by mail-oa1-f66.google.com with SMTP id 586e51a60fabf-3e37ad3d95aso3108302fac.3
        for <asahi@lists.linux.dev>; Fri, 09 Jan 2026 09:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767980034; x=1768584834; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AW7pKTa11HH9f4BPF+9uB7vJtgdJiTLDvTVzh/n1j3I=;
        b=pWRpCO0h69WGzdGiQkxEhn35DElrz++tGhq+6VoyTx5/2qzjWcPDmbYy95Yd9SBTeX
         4AfqalkoIrA/aqHHQvG3inJ1ldm+8kRS8+NGwbH1mpqX2zaFaSynOZEqYQOP0VIX4n8C
         hukXIVzem5EufYbQptN1EqXvvBS2t0xJdMnWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767980034; x=1768584834;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AW7pKTa11HH9f4BPF+9uB7vJtgdJiTLDvTVzh/n1j3I=;
        b=qqZ0Vo28xJFs+68MFD4BEzhpZV48mluuFKMjFQmMIwRweja2J+b42y2f90KD8wNXPS
         Lix6iV+W3aklAKPxTlLv2PngbnHQ/EX4fbA/p/3HQqSb6Ks9ol6zWVsFvii6RpIeAmza
         HMuoeFjxGWTQt1F/3sm0XnNJjujfk7YF0G8Sov+aNnf36o3zmsDcfVgErVdmh8NjCgYQ
         HDI72PXjAoQf5VgQJu2JvGYbLnYHqHEJH7sBIU8CESHo4h2cq4o9I8ejmhTYVyd80tGK
         xwfYgr5sKtZz3Wn4Mld63G9z7wR9f/J144znst9PjBSyQfMuZiwY2kHQFhQvSZj/AVlE
         25Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWSHwoKlDVry6XQbhal6GgJt0xFDgrkmHAEt0Ge3SO/VrOGE3p3dVhDteeR74Z7QNWi+bZVpw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyK7Bn3vA1P1cGGcz7Z+2Z4DDpuxPqoEW4hXBXa3vUq9igNUUrP
	Xvu+xaeubhPFfGj5AL0WIiggYWyz9Bcenf706ju+hkr8rSnM670XfwmlEWh4palkDY4=
X-Gm-Gg: AY/fxX4GsEl9SVZvIPPPSMz5AMex7xl6TictZsObAwsB7LUlEB8UGLnn1vsAUGIfTX8
	dEbyCh6LgOKv8U4mpHbaxSTt2FCH213FiTjYQnDfz7EyEI8MLaeiCQdgpiKQsBd8i26SQxKeI1X
	JhBbm8n0eDylTgqO1ulslb+DWjecH8IS4VItjfyTC3V6euWquQZwjPFA/XXgBfyFC92NjAhbDcw
	6tGQo7M1SBCqAEHxJ+q/d/x/6y8DTDhs72WJhfK2FED5BCCE7Yh2mHMq7hXffKKBHGLITXtZNrV
	Z6FfKRkvOuk5LXwhxIZ7TFTyXtNr8LzOi+CPCOgLCp5g4FzrXDmIxnFgPI3QcvlglRLTHYkO/kz
	5qb0zN48yez4FnHg0rrU6JvxqaeXp/mBMeLtuLuPbyYpKF4VW0cec4Iz0vZ5lUGfmo1enNFayCM
	o5E4J1NvLNu7OcJhcwf5PKZpzxmmwwU2TDTxDJKAhGE71cOUrQoT5d4u13/7eEolMd2Sz+uRXl6
	WHcdghAS0FBD+73K2Hk0/traMbv85PuQ9rKNvU=
X-Google-Smtp-Source: AGHT+IGdioQnGyGloMMrVJGcvDVSbbxvDH0jSrzX/Pa5/V2yFn6XLbcCf9dcP888MP0Ihp4ifrTv/Q==
X-Received: by 2002:a4a:db8e:0:b0:65d:1636:5432 with SMTP id 006d021491bc7-65f54f7ea02mr4443104eaf.65.1767980033916;
        Fri, 09 Jan 2026 09:33:53 -0800 (PST)
Received: from bill-the-cat (fixed-189-203-103-235.totalplay.net. [189.203.103.235])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65f48be5a7esm4358048eaf.6.2026.01.09.09.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:33:53 -0800 (PST)
Date: Fri, 9 Jan 2026 11:33:51 -0600
From: Tom Rini <trini@konsulko.com>
To: Janne Grunau <j@jannau.net>
Cc: u-boot@lists.denx.de, Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev
Subject: Re: [PATCH] configs: apple: Enable SMBIOS / sysinfo
Message-ID: <20260109173351.GF3416603@bill-the-cat>
References: <20260109-apple-defconfig-smbios-v1-1-16477009c034@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+BwhojA++If/QNso"
Content-Disposition: inline
In-Reply-To: <20260109-apple-defconfig-smbios-v1-1-16477009c034@jannau.net>
X-Clacks-Overhead: GNU Terry Pratchett


--+BwhojA++If/QNso
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 09, 2026 at 06:20:30PM +0100, Janne Grunau wrote:

> Enable verbose SMBIOS table generation so that user space applications
> can use the SMBIOS table to provide details about the system. The
> desired information is chassis-type to determine whether the system is
> laptop.
> Adding the chassis-type property is proposed for the upstream device
> trees in the Linux kernel in [1].
>=20
> Link: https://lore.kernel.org/asahi/20260109-apple-dt-usb-c-atc-dwc3-v1-0=
-ce0e92c1a016@jannau.net/ [1]
> Signed-off-by: Janne Grunau <j@jannau.net>

Reviewed-by: Tom Rini <trini@konsulko.com>

> ---
> I do not plan to update u-boot's in-tree device trees. The Linux device
> trees have almost reached feature parity. The main missing features are
> the USB Type-C ports (on track for next merge window) and the laptop
> keyboards. I think it makes more sense to close the feature gap and
> switch to upstream device trees instead of adding to the in-tree device
> trees.

This sounds like a good plan to me, thanks!

--=20
Tom

--+BwhojA++If/QNso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTzzqh0PWDgGS+bTHor4qD1Cr/kCgUCaWE7+wAKCRAr4qD1Cr/k
CqRRAP9JYpq6J6Z7vbK/MERTsjfauX30Gwf+flQwimJ6Dp9XKAD+Mb9WAt75w218
vJde3JpzMz7FFgjkarbHJXoT7MZ2dwI=
=bAb4
-----END PGP SIGNATURE-----

--+BwhojA++If/QNso--
