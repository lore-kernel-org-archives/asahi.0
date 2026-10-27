Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094117;
	b=rlCiZwfKt4xnrdKEWhrzYz7XC/kzC7l/J/4F6sAieCF7LPLBGF8JPFxPhsgb4Eodrfa3
	 d234AWa0PHxVp1Fvtaa+YnRYsOkXBD2IRbYIjt+3iM7fvpXHe3B7Gn8c9AvDPCMPxYmjj
	 +cdSqxkSUicBJn4fLK5r0QE7FNSP+3LDLH6m1s3goAmvx7X39Ql1LOC4j1cRML8a+DjfV
	 xuwXR3O5qiBbI88OlqIzeo/8f76SuI/yBzcFOVF52rV648rsSQCIhC51LcDupWk9y3k/4
	 nZX5rqp1uIw+FU49Z2Kz5cyY/1ZY+TpatnDbvPGpjOVjKxBrPo2LhjOIrpXbGa1k3kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0G5Gh9P2KO0+5GGiKNPkOdO6AKt1oHHc652uqXaZcqY=;
	b=SfWQtZ/WcsKU+exbtg2xN2jr9bYR3sujd+pTwMxp/nvbBHZqE6uOJH5kVefZ4Y10EDpo
	 AkzXaBR3xxXm/u6T2sdiXsc0SMKmoyTV79ecZywveCd62AvBv1drZYL1kJeXPQJfJqIre
	 SZqAPCYbOccCUcNeXMKBOb6AxDnmLik71PPHFXd6K/edpVh52EciLnJ5Vc9jaDgVALlPA
	 nr7QjYSe3N508ph0xpsDzoJROB4i/fzlcxfvQ9xFiR5u7USaQaH7lszafd0JX7CnkDkSI
	 a/gZGQHPYAdr0ZOQYU87OCW7gxUI4jhRu6poqGJ+FsCEWP63OtYj4j9P2kJMoB3CJBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=S5DRW+v5;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F5E606A322
	for <asahi@lists.linux.dev>; Tue, 27 Oct 2026 09:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77F5E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=S5DRW+v5
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so25370455e9.3
        for <asahi@lists.linux.dev>; Tue, 27 Oct 2026 02:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793094115; x=1793698915; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0G5Gh9P2KO0+5GGiKNPkOdO6AKt1oHHc652uqXaZcqY=;
        b=S5DRW+v5ox8KWDXg++5gcUaSJaw5S4WhtOYRJ04fnzQpYlFeWrCiDmCRTQXPceSeTh
         WmAyFzIIOv8p45qUrg0Gsi/uZX8scIhvEtXZ8Zllj0ZUvEBypMgGlOfU5YJfI/kt+U+q
         K1j7rTRTkmrJV3AIblbMV1393Q9uJjL7WKYHCQfEhblIt+bD0Xv+QuL4gncFRAkSMN6F
         /3QoZ9kr4706c7yanbrCz/+iPdsQjmyIiXKcCv/n7ruaP5UKFqjy4YvqJDxFo+FAwsVq
         V92gd5SXwnivklhTY1Kc9+fk/7QFI+EwGFMLS4l/tq+IpbiDz42z3rp+4LQt/5kSHnAb
         ra9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094115; x=1793698915;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0G5Gh9P2KO0+5GGiKNPkOdO6AKt1oHHc652uqXaZcqY=;
        b=JRUdYJZHHRDYqxwy5Bt+lkMaSuAHM9DpgfAgxQvXgm96SCPN/EM0+h/5SUwdxARRi/
         /y1P+ZNWv8HvTobWzUkcehfBulmhodqfGSM6T/j+Z4gULetDLwOK+1e/y2Jn7jrhLOsy
         alPsHWKHsdwzMF9r9jioiI4dsjRkiCcz578vVCjFGNbwPfhx/laqZxuRpElmp8dsSnvg
         BWrHKfePUaL5dZ1Y0nufLW95qGzMrw2kGFkZWfCp+gItRq1ip3ZNmZ0PskOZwNnFuET1
         5iLLDyrnerV6XOxn4YhEG6Nhi09jP52BzPOMWyuetx0tYkHDkS4ozpbQ2k7gXwuLALPC
         9tXA==
X-Forwarded-Encrypted: i=1; AKwUvBx/njC8DTj4/qBH5i0GW4bt7eCVkPbPSDH1Dj2Vn5rb70gb/XRhEzmPSulJKjTkbBsezAt0sg==@lists.linux.dev
X-Gm-Message-State: AFq9FYKwLBmueY+Eey3GtxpJUkduN0j1kwMCrRNqATNCDNiapE/R5oKf
	xfJy1U44ltYX73XIwcOnormSLxyv2pNPd5vpmPrAW9wcoJ2Uc7jRJPc86nnGb/KVYTQ=
X-Gm-Gg: AYBFou0WoZt4E3gdJaX49e1YW2AXbWST+xR+BWL58D2H/XtemS3+zJ9VDXxzOvxQXTU
	VTucY/dKZhhO73xMSwBLTGtdPzWk/z9PaW4OGvJynqxHHyyP9o+AJq0HLm0pfkRbGpaAUEXwjN1
	j7CB4q21MZnTbKC+VnWq2+G9Dn8nX9G9gjb2XubYuzS2jUE+SpKTnyGkoCFu5u+yfI7niqU+E0I
	AHCc5hx7/iyRc8StcaDLecWh1jYm1wA3qTOe8EbqoqyJ+m7mjOrP2EAGpgDvoAlZb6Wi3K38+Oa
	q/2iyrZTigP1gWJKLfrE57tP3kdML8AvsoQD4V/6FIZs2di8h72hxtDLO5krxLoTRyvrL0K7EXt
	PaZUktmYHYhH2USwdctpbuw47eLBAZk3DWiOOOMxnEvZI8iZoZr7QtgZaxTUi2RnUhdmrLQug5J
	z0C2R1io9w8z2jnhc/oiNmfLEIMVsTthvXYqwArIWC108UyLQvYVzog+sH21SHxn5qNCtXfppLx
	M94xdBSoBqLfT+N0Jgkt/WknREBXtY0l36Ot0YJrqdv2wivy0eYqnoI93YrCSFr6zMwxxDEFHy7
	O68Jl4wmg89GMT73idbK6p01KYY0l88pQsCFG87qqFM=
X-Received: by 2002:a05:600c:8a08:b0:4a4:7a8d:c736 with SMTP id 5b1f17b1804b1-4a47a8dc93bmr110335135e9.9.1793094114509;
        Tue, 27 Oct 2026 02:41:54 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a35a59d998sm263939065e9.15.2026.10.27.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:41:53 -0700 (PDT)
Date: Tue, 27 Oct 2026 10:41:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
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
Subject: Re: [PATCH v3 00/22] gpio: Improvements around device-id arrays
Message-ID: <auBxfVzkveb7KlEk@monoceros>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
 <at-CGVq5jVsMQief@SMW015318>
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
	protocol="application/pgp-signature"; boundary="qlk6jmpzfns64bdk"
Content-Disposition: inline
In-Reply-To: <at-CGVq5jVsMQief@SMW015318>


--qlk6jmpzfns64bdk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 00/22] gpio: Improvements around device-id arrays
MIME-Version: 1.0

Hello,

On Mon, Oct 26, 2026 at 11:38:49AM -0500, Frank Li wrote:
> On Mon, Oct 26, 2026 at 05:28:11PM +0100, Uwe Kleine-K=F6nig (The Capable=
 Hub) wrote:
> > [...]
> >  drivers/gpio/gpio-imx-scu.c         |  1 +
> > [...]
> >  drivers/gpio/gpio-mxc.c             |  2 +-
> >  drivers/gpio/gpio-mxs.c             |  4 ++--
>=20
> For all imx part:
>=20
> Acked-by: Frank Li <Frank.Li@nxp.com>

I'll apply this to all patches touching the three files left in my
quote.

Best regards
Uwe

--qlk6jmpzfns64bdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrgcd0ACgkQj4D7WH0S
/k4RSwf+IK0Zg4d+0uYc5szRXc18DV2GOQKuWytvc6Mb7rb8wBUlhLcCzHXfHJw5
GKyFFUIrW1GHu/p4aSlsaOLm8RjGYbgR1RTnxQySdf79td9IxG/EXqQcp6FcxSH5
30Ema9IFNIy1Z1fLQlqcQWR4FaujBuohFx12psbgjzkhMn3OY0x3w6FsZddRxBu6
hjb1B8M89jP2R7VcM2CC+KYKqlxNoQYiS/XOiE7oyKj9CqBRDIrGPNwKtLxUelaD
kKhTCJUSL4uTa26RZDC42xIr79ip8u0RW/+hzEwjtlicpsH0uFemsO1TO74xS/ol
PbKbBRoQJlRhoDMBJ7sTb6K4gJHPEA==
=KSfn
-----END PGP SIGNATURE-----

--qlk6jmpzfns64bdk--
