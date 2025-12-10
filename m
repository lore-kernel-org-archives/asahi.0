Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780C52512FF;
	Wed, 10 Dec 2025 02:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765333368; cv=none; b=cJKbOb1cPRZHXwImxcKvVfLN/5eeK64oO1WB7k5gJRsuzB7nYIoJQBSF0/MoMUaRAYn5Mz2a4RvZVHWM2nmhYhMad5o3QOAxV5hpJf/e01hi9oymKCg4xYsM1CfGRbl0u7jCDB+FcuYExmUNRVK5Itrl4DteVJgQCjR+0oZIBB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765333368; c=relaxed/simple;
	bh=BdZF2pNd4UIWn0TZnS2/oExdzTkeLzEDfnMcg2OQOR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IR26+iCdDNjqV5uVO0OPxNLPqX8C6FD4oT0HFNntRMRizpuZD2kLhNaSp1o6YneYEdh37h/qDfMgslCPpO3Dj17E81nPVcp2fUTmqN/TY5Xgb6B78XTJ17VMNzUY7ihvBfBf5GaEm8+kmrUX4/YOMc+mJbgMvG1AdiSYjWx6ajU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gs06zghp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gs06zghp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A46C4CEF5;
	Wed, 10 Dec 2025 02:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765333366;
	bh=BdZF2pNd4UIWn0TZnS2/oExdzTkeLzEDfnMcg2OQOR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gs06zghpqLzTxOlMoiGA6jMiwlvq+UADOE1DnQMhmYIAiH9dfmhXppHkd7jTOIOvM
	 o60UV+4uvP/ZZU9H1EnCRMXukPh7rtYrlp9VxoHq9ahIcHuDm4qbQs/JZAFnSS6Li4
	 A0rzwvJIrSnAqhpuA6mJHcxE1ffLvU4d2z9o/WtL4fuS8jIfrH0bIE/vqTrJJ4TMnM
	 mpVEtHuOHcV8SRZ/ZIvCF5UWiOhzSdGcLrvk/AVgCzT/pupFCYa9uQOnwPvf5amC2S
	 Tz3Biw7vN4skwOcLOr0daKLTs1n5L4cEcH1JvAtjIMzKQgBwluE1d8mj6zo5JIgPnK
	 ZKB1oPLrt9zEw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4E38E1ACB974; Wed, 10 Dec 2025 02:22:43 +0000 (GMT)
Date: Wed, 10 Dec 2025 11:22:43 +0900
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 4/7] ASoC: soc-dai: define TDM idle behaviour modes
Message-ID: <aTjZc3mgu7CQOkDU@sirena.co.uk>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
 <20251209-tdm-idle-slots-v1-4-38dabf6bc01e@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="er/1OtNA51My+cwA"
Content-Disposition: inline
In-Reply-To: <20251209-tdm-idle-slots-v1-4-38dabf6bc01e@gmail.com>
X-Cookie: It's clever, but is it art?


--er/1OtNA51My+cwA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 09, 2025 at 07:31:17PM +1000, James Calligeros wrote:

> Imagine for example two codecs sharing a bus. When one codec is
> transmitting, the other must ensure that it is holding its side
> to 0, or data from the transmitting codec will be corrupted. We
> can trust the "idle" codec to simply do this itself, however
> this is undefined behaviour. Some devices may leave the line
> floating, others still may pull the line high. We need a way to
> control this behaviour.

I'm finding this explanation quite confusing - you appear to be
describing the situation where two devices simultaneously drive the same
signal which would be extremely unusual and I can't see how it would
work electrically.

> Thus, we define five possible bus-keeping modes that a device can
> be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
> (actively transmit a 0), PULLDOWN, and HIZ (floating).

What is "explicitly disabled" in ths context?  Why aren't pull up or
drive high options?

--er/1OtNA51My+cwA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmk42XIACgkQJNaLcl1U
h9Dvngf/Q8hLsUPgUG/WCbl9wKOoJ0KFzFLX0pXGLPoa5P1aal4uK1pP4erJN/7L
qegwM8H6BSQ3wD6l2JBGYmZJKH/UKEr3b+n7pFh4ek40r8h+Y/g9QOZknIHaTtrs
07areWAyrXXVr20+YcHlsKGmyV1xqBMNoMiA9r6cs8d3LRfNprkXzN9YQN2fcKcQ
AUJYg01zlsOkdjcoSeJFmnIhgv9klROT7xGj1gNmUKMp+lVUkRV3mHRr56g0enE8
Q5nWUQ4G2UqxNMBJmMVij7Oz3QHfuK8zwk/x3t+M/wXWkK5zSUo3a0ceJIH09u3/
0IX7nNttZTCXalNXZzVMtPnxRwCIbw==
=RadW
-----END PGP SIGNATURE-----

--er/1OtNA51My+cwA--
