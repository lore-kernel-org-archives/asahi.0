Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A72B54BF2
	for <asahi@lists.linux.dev>; Tue, 21 Nov 2023 23:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQcxcKD9"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3b6d88dbaa3so4020157b6e.1
        for <asahi@lists.linux.dev>; Tue, 21 Nov 2023 15:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700610208; x=1701215008; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nBS+DVGQWY8oXSxEgPe4ez0bnbZp4j8xClzB0D/ObR8=;
        b=LQcxcKD9aLI8lCfd99QvGcLnUtTydbvSZ7/PTfjq2u8Sn/Xsn9nn25z1VpZBAWw8HV
         w3Bcp6jQJOYytHoetpX5utVuWZPUw4UIjxgMTLxv7a00akPyGepHuxQ0p+13EKmZ7i6q
         y4T80LurpWgk3M+BugnQjLy61QeO+fDt+1im6Y1ng2kv/qGPf0UuF60z0+RhVYqc4ER6
         V9y2VIOpSI30uomlX3UTp5UNb8AMb8HVPj9IP+n9oD6vVhG0orMajZkcd4ZPmDwmJomL
         ArE+32cd7DQ/ZV8b4CntAn9KesvxRhP9ZeP/rlccx2jPSknyZXzTOfIqP57W65XCW9/t
         dhjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700610208; x=1701215008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBS+DVGQWY8oXSxEgPe4ez0bnbZp4j8xClzB0D/ObR8=;
        b=hLj82WULrkON1K0+uHIU24BFtZSvuMyuNQ3CrPjkycye6inGvrBFxULgsDQC8Pqf+t
         T34kM+3bVkEdWpqo6Q5cU+/SI+GX+ZxOjWo2bTzhZmmx+1P/gy1GeMz2z2mzPb8oz7TA
         kiITKyACbgs/R7aiwSMy7gras7y2c1/eB/HQEeXpLsIosPujcxb2l8rw4oggi8f0ueAW
         IZAMNNrLyywuOdu42bBo/3m39+HzUI4dc5KX+dVKJjntkYOBY96cbosS1e3491pPsxr+
         y/IXEv54gqlM/3YratxUZtdyHRI2HGnal8313OMkuTDqfP+YitNcKpV9+GUKwb9tSv52
         xctQ==
X-Gm-Message-State: AOJu0YxiNslvxdZN6eKJGYCbLTu4bXSbrUFDrMCTQVTRT9IFLEC+FehT
	hlKXWGhjHUuZmC+Y5QvCDhc=
X-Google-Smtp-Source: AGHT+IHZ6/VS/djvTTtSjXXmpmFyVh1llZ04rQQ0TgJw5/LQzTx02CtBWjROC9dZrUGxzj3LMx4Y1w==
X-Received: by 2002:a05:6808:1407:b0:3b2:dcff:9e54 with SMTP id w7-20020a056808140700b003b2dcff9e54mr1108746oiv.24.1700610208258;
        Tue, 21 Nov 2023 15:43:28 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id bw1-20020a056a02048100b005c216d903bdsm5980436pgb.89.2023.11.21.15.43.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 15:43:27 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id DB697102106EA; Wed, 22 Nov 2023 06:43:24 +0700 (WIB)
Date: Wed, 22 Nov 2023 06:43:24 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Linux perf Profiling <linux-perf-users@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>,
	Ian Rogers <irogers@google.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>
Subject: Re: [REGRESSION] Perf (userspace) broken on big.LITTLE systems since
 v6.5
Message-ID: <ZV1AnNB2CSbAUFVg@archie.me>
References: <08f1f185-e259-4014-9ca4-6411d5c1bc65@marcan.st>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fu/8SvnJ7Xc8DEer"
Content-Disposition: inline
In-Reply-To: <08f1f185-e259-4014-9ca4-6411d5c1bc65@marcan.st>


--fu/8SvnJ7Xc8DEer
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 09:08:48PM +0900, Hector Martin wrote:
> Perf broke on all Apple ARM64 systems (tested almost everything), and
> according to maz also on Juno (so, probably all big.LITTLE) since v6.5.
>=20
> Test command:
>=20
> sudo taskset -c 0 ./perf stat -e apple_icestorm_pmu/cycles/ -e
> apple_firestorm_pmu/cycles/ -e cycles ls
>=20
> Since this is taskset to CPU #0 (LITTLE core, icestorm), only events for
> icestorm are expected.
>=20
> I bisected the breakage to two distinct points:
>=20
> 5ea8f2ccffb is the first bad commit. With its parent, the output is as
> expected (same as v6.4):
>=20
>          3,297,462      apple_icestorm_pmu/cycles/
>=20
>      <not counted>      apple_firestorm_pmu/cycles/
>                        (0.00%)
>      <not counted>      cycles
>                        (0.00%)
>=20
> With 5ea8f2ccffb everything breaks:
>=20
>    <not supported>      apple_icestorm_pmu/cycles/
>=20
>    <not supported>      apple_firestorm_pmu/cycles/
>=20
>      <not counted>      cycles
>                        (0.00%)
>=20
> Somewhere along the way to 82fe2e45cdb00 things get even worse (didn't
> bother bisecting this range). With its parent:
>=20
>    <not supported>      apple_icestorm_pmu/cycles/
>=20
>    <not supported>      apple_firestorm_pmu/cycles/
>=20
>    <not supported>      apple_icestorm_pmu/cycles/
>=20
>    <not supported>      apple_firestorm_pmu/cycles/
>=20
> Then 82fe2e45cdb00 leads to the current v6.5 behavior:
>=20
>      <not counted>      apple_icestorm_pmu/cycles/
>                        (0.00%)
>      <not counted>      apple_firestorm_pmu/cycles/
>                        (0.00%)
>      <not counted>      cycles
>                        (0.00%)
>=20
> If I taskset the task to CPU#2 (big core, firestorm), I get events:
>=20
>          1,454,858      apple_icestorm_pmu/cycles/
>=20
>          1,454,760      apple_firestorm_pmu/cycles/
>=20
>          1,454,384      cycles
>=20
>=20
> So the current behavior is that all output seems to come from the
> firestorm PMU event counter, regardless of requested event.
>=20
> This is all unchanged and still broken in v6.7-rc2.
>=20

Thanks for the regression report (and it has been handled well already).
I'm adding it to regzbot for tracking:

#regzbot ^introduced: 5ea8f2ccffb239

--=20
An old man doll... just what I always wanted! - Clara

--fu/8SvnJ7Xc8DEer
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZV1AlwAKCRD2uYlJVVFO
o8aCAP9VLRaP2SCBxEoyHuPgsn0Q5WQW3SmEqOCX6a8pq9iEYAD9FltPgjVA6zjk
h9C6hLjE6H67lgw50GnDhziUTCtluAY=
=9D7c
-----END PGP SIGNATURE-----

--fu/8SvnJ7Xc8DEer--
