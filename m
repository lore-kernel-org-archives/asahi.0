Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793876799;
	b=Z1GcYcU31Fyo0Rgn8MQvL6gEjF4z/2Pc1wJ/2RKZ74Cvl5VtFRcha3xACO0a9H44RE9A
	 D8sK6yoW7z/5HWncPXpwnFFweMa1mNVTuQpqzMHJVZZjiyk03CQkIAk2DMBqGwSX73w32
	 1mueIB7qbF4C90pkFxras0M9PCo1K5QhWiAvRm6BmfIM0gbXsCfnmH9lwtUChD5k8hVkS
	 uiTGz6X6QqY6TRCjjyYb6H8XxrC4tgahQds9h2Afme9U9tEUZVvQ86Zq6yrt1HOjjNK+D
	 n38tjsqjT5bgZVnDtaxoT/t1jj9ThUOdRdiV21TLLtG3uOA//0GPeHUJrMTX3LzVvKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793876799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LOaUcszBeFc4BBZTn5mnxjNejVuuHalw0DHWazewRfk=;
	b=RMFmJBVTNQVQCbVT89WRtFWLrZMFok0Uzf95OlVaz2D3Ce1Gv5bFulsu/R+Bml0WpFwq
	 J2OVyPFKyntrUDyoptygVtISDWDWel/hVb0GOWds5GzrXsqzxb/AFXKurKQnUYaK2Pcq/
	 Im2KDyliu84fVNyT4WNL4KrUsnWvCWSWumY7sBPMXxQdcBk4b/vwhzuRAKYVDSypOfGcD
	 qU9E+HTFK9QPDtOEf/5T5Q8e38v8kuRwXSQUm6F2dDV3V+goEdQ/hZ+NXR12gcY1nxJnk
	 +IyW+qCOUiB4n79zVXGXVKvminLhDoHl1A7RJPKBam6zsB8q47FmOZPOmJ0i60PnbMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iyPCE9WJ;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923AD606D803
	for <asahi@lists.linux.dev>; Thu,  5 Nov 2026 11:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 923AD606D803
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=iyPCE9WJ
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1434450f8f.3
        for <asahi@lists.linux.dev>; Thu, 05 Nov 2026 03:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793876796; x=1794481596; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LOaUcszBeFc4BBZTn5mnxjNejVuuHalw0DHWazewRfk=;
        b=iyPCE9WJtN6AxAfl7nBnUXRFwasJM+VF90yjGgWGK8w/gOoTIx90RxoLfvaLsXCZce
         grFLYmo0TcDBocAb+B//slNh8loeuCCdTNHzCS7Z3PYng4MbkTcEptWiuMXkVThfxMTn
         M80RCnKHOkkjyhn/mwE19ZTKT8hUgrLQgx44PGfKnynY730WV6DLIFOWr1FNXLdVxBtq
         amavNwFMXnKS8kO9Hk/607uCgB3YAgyZqS3KoxJu7tgYP9iuPtW1wnocK3JSQjY9OZie
         1P/AmMnOMkw0Z9YSK9VV8ySrBU+Y/xVMSzCkeDuFyZtgpbwrptkayCiTfNXVWH+qpiqi
         qfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876796; x=1794481596;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LOaUcszBeFc4BBZTn5mnxjNejVuuHalw0DHWazewRfk=;
        b=BqCfxuN8tKGZViyAucGxqEKFcHXAn3l6kuUE/faqZw/9sbyFvDZb7b8ubva54Emdv9
         jin+321Bs141J10e2qvbUuCLC285EAlmODIUKum/0iCe/KWKZ9uO2lmVo4cIJUrDOmow
         TOsvcbLnMkd02tSZ53D72cJKK07ZRfvcPx+85HGXtFvDGin06me7n7M0sd+g6UWsHaQy
         Q0cjOLY2gWfP8xg1SqXwmrlaW/msEZXE4wxt4Ok68GMiDp3SfB193mRdDa2Zw9ROCAQg
         Emuctrb5mdBBnok/SYDewV+jp1I958xI815aussSqKpG6OM9MHwZS7WkFtLbbeAZKB5h
         XVAg==
X-Forwarded-Encrypted: i=1; AKwUvBzuQ0Cb/8mXOB5+zu5Atw0+E6V8BXNS90vROpgbJusgPq4GmUr1Ep35+CdNefjI5eBUaeDb5A==@lists.linux.dev
X-Gm-Message-State: APuU4Z9BnZRwxBi7go0qj1NnS2QQ+2P1UPNBVMb2z89noO98OY8FkvsU
	9iUmzenznKq9eZ90s5QDgXx6YmtPNwX/egdJkFYwfOZ3qauc905fN0q+b4l/poUo7ao=
X-Gm-Gg: AYBFou1FQzYkxr4yCFEGjWOcna2kGjDoIE9pjn4s76mFItboZhjv48zwIvEOU/qG6Dz
	lNg0xxhWM0aF8gjnm1CnnDY2KMQhL5KO9qAF55sF017TBFARRHAK6cC3OP3cZmN4jGXqX4IRQ9g
	bj3JS+jibThsFYZY2+iW1LxoytYWbvQXb3zoLrEWg0/XGHACczbKZFMigGxDkwjiYm/8HZP+uGF
	xLM+2z11o4dAnwj0Sh0n/NORtbAp0zkA0Nm9EgMk6q6nhjWGsjJT0stESsQPspd199mY77KUI5G
	8+L181hCT2PM3U9tlqShgg5tsxLaHK0fPxULNZw716DeBeYBxTHtWt51B67lQq7P6R5wzGXX5qr
	HTSQQevw5ZWF13MF4ij/+ltX7sP5X2G7vZdIj3sE7iFoPp6xOdWj2v66sJ8XomOtLRaZfq0YLfv
	MWD7cwWx5IHZzmvQZi5xIBp9E+7GqnLXPOOxCyUdZtJfzu9udGyNs6WDXlsqjtgHsM8KwR0JGRI
	neQiPq0ykkqIdizMMFDFHCVzlIitmCoQQ4S9idZFc6Ec/airKM9v/TLEHDfdemweBh1x/Czv+Pa
	0zZ2ZDEjSXIXMT2t0Fb2UvBcUidinEKsTWV6S2SBpTL7RsXEQMHtM3t2NyMa9HKdRUT+e7YF/Ya
	vlP9vbRLs6QGHU/Lz
X-Received: by 2002:a05:6000:40e0:b0:48f:bb86:cc03 with SMTP id ffacd0b85a97d-48fbb86d828mr15698548f8f.11.1793876795617;
        Thu, 05 Nov 2026 03:06:35 -0800 (PST)
Received: from localhost (p200300f65f19a904ae40ca5165ccacb8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:ae40:ca51:65cc:acb8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48fece998absm10176189f8f.22.2026.11.05.03.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:06:34 -0800 (PST)
Date: Thu, 5 Nov 2026 12:06:33 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, linux-hwmon@vger.kernel.org, 
	Matti Vaittinen <mazziesaccount@gmail.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, 
	Viresh Kumar <vireshk@kernel.org>, virtualization@lists.linux.dev, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-aspeed@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Michael Buesch <m@bues.ch>, William Breathitt Gray <wbg@kernel.org>, 
	Robert Richter <rric@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 00/23] gpio: Improvements around device-id arrays
Message-ID: <auxh9PxpJScFO3i2@monoceros>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
 <2hfpcbk6r56vvhkqyiex2apl3pinieybad5sd3vkvvabqs3uto@lydt3gin5kxe>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qsdpu7ny4ekdton4"
Content-Disposition: inline
In-Reply-To: <2hfpcbk6r56vvhkqyiex2apl3pinieybad5sd3vkvvabqs3uto@lydt3gin5kxe>


--qsdpu7ny4ekdton4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 00/23] gpio: Improvements around device-id arrays
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 09:47:39AM +0100, Bartosz Golaszewski wrote:
> On Tue, Oct 27, 2026 at 11:48:37AM +0100, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
> > Hello,
> >=20
> > the original motivation for this series are the patches that convert the
> > arrays to use named initializers, see
> > https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylib=
re.com/
> > for the idea behind it. Looking left and right a bit while implementing
> > that, the series grew a bit.
> >=20
>=20
> Hi Uwe!
>=20
> This no longer applies, can you rebase it on top of gpio/for-next and
> resend? I'll apply it right away before any additional conflicts.

Hmm:

	$ git fetch https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git=
 gpio/for-next
	From https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
	 * branch                      gpio/for-next -> FETCH_HEAD

	$ git checkout FETCH_HEAD
	HEAD is now at d66b6b86d5a6 gpio: 74x164: add support for 74lv164 shift re=
gister variant

	$ b4 am -3 2hfpcbk6r56vvhkqyiex2apl3pinieybad5sd3vkvvabqs3uto@lydt3gin5kxe
	Looking up 2hfpcbk6r56vvhkqyiex2apl3pinieybad5sd3vkvvabqs3uto@lydt3gin5kxe
	Analyzing 33 messages in the thread
	Looking for additional code-review trailers on lore.kernel.org
	Analyzing 99 code-review messages
	Checking attestation on all messages, may take a moment...
	---
	  =E2=9C=93 [PATCH v4 1/23] gpio: Remove __maybe_unused annotations from a=
cpi_device_id arrays
	    + Acked-by: Frank Li <Frank.Li@nxp.com> (=E2=9C=97 DKIM/nxp1.onmicroso=
ft.com)
	    + Acked-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com> (=
=E2=9C=93 DKIM/intel.com)
	  =E2=9C=93 [PATCH v4 2/23] gpio: fxl6408: Remove __maybe_unused annotatio=
ns from of_device_id array
	[...]
	 Link: https://patch.msgid.link/cover.1793097104.git.u.kleine-koenig@bayli=
bre.com
	       git checkout -b v4_20261027_u_kleine_koenig_baylibre_com 20a33c6b6c=
be7e4805dfb6cd68816937443aa148
	       git am -3 ./v4_20261027_u_kleine_koenig_gpio_improvements_around_de=
vice_id_arrays.mbx

	$ git am -3 ./v4_20261027_u_kleine_koenig_gpio_improvements_around_device_=
id_arrays.mbx
	Applying: gpio: Remove __maybe_unused annotations from acpi_device_id arra=
ys
	Applying: gpio: fxl6408: Remove __maybe_unused annotations from of_device_=
id array
	Applying: gpio: Drop unused assignment of acpi_device_id driver data
	...
	Applying: gpio: Unify style of pci_device_id arrays
	Applying: gpio: Unify style of various *_device_id arrays

	$ echo $?
	0

Maybe you just need to add `-3` to your workflow? ISTR this should be
the default for b4, but it seems if failed to mention the -3 in the git
am cmdline.

Should I still resend?

Best regards
Uwe

--qsdpu7ny4ekdton4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsYzcACgkQj4D7WH0S
/k6COAf+I352qHa+kMUOH9ETW9KNHC8dWhUfB6E/IB+8yoRbH4tQy5C0mLg76J11
sJdUuJGD2XjvAv2tgSWACC8Cq1A+CnMvgQXXDsLtC7JuQ0aQYwSFMTIEphdECYue
42itRdsMlxubgjyK4Ku9YeDItioMv2A2EX+InXlNcO6MoK9ty5ZgCfsCY3OyHGVT
OwfU948a3DowaasJORDv1w6dhDNg/sCysegJvjnBoz2vhmoeYeyxxNHTGIzcjxt/
CWYJqu4/QDxJQ9FDuS6d2VhmXYOGL2Dl/wntyyQZjatVXHe6I2wwFBNQoOWJvPaA
BRQb0uNoTqeBvO/Bc5+AYD34/xDKkg==
=tsLa
-----END PGP SIGNATURE-----

--qsdpu7ny4ekdton4--
