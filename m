Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146704C62
	for <asahi@lists.linux.dev>; Fri,  9 Sep 2022 17:27:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF16C433D6;
	Fri,  9 Sep 2022 17:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662744437;
	bh=kaILKnrlF7r0CddZpeC4K/EwWafqCO7cxKu3AIkoRvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MlNRDRUsnF9R/Sn0n+PILjmX+poyd4gIV3SkFm7omnR1WLiGY/PBDoOrhKBq7FaR2
	 /Gi7AF9WQDTtPG1CpVWBGAqmhGqsdlCi215XYRoPp1rQ5mdSWB6OEpkpawsQzjH8sW
	 k9/E/fu3x/tDoSCKMuFsd4baSLT2L+3Phzj9hz1TdfROw49cq71ZHHNBLIiXrAnu/w
	 LhFYrtLXj3YKLJdd9eenk4+Ki8eESxY4zAobeFZnpxHJwnTX1DJT2F0Du0jRvTXjeK
	 VNzqf1DcAG32jKHBZNOdW+CJ3S58bE1nO2fqXCE0jyxfIXVpyEZGBIijV2VWuIrZew
	 YZG0P2Kh1ufkA==
Date: Fri, 9 Sep 2022 18:27:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Matt Flax <flatmax@flatmax.com>, - <patches@opensource.cirrus.com>,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH 00/10] Support for CS42L83 on Apple machines
Message-ID: <Yxt3bbs7TPLSKTaa@sirena.org.uk>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
 <a7c2df88-766a-4657-8379-649a5ae93ac4@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c7j6oBAWbbGfiDda"
Content-Disposition: inline
In-Reply-To: <a7c2df88-766a-4657-8379-649a5ae93ac4@opensource.cirrus.com>
X-Cookie: FORTH IF HONK THEN


--c7j6oBAWbbGfiDda
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 09, 2022 at 05:16:48PM +0100, Richard Fitzgerald wrote:

> Mark: I've no objection to you taking my patches from this chain instead
> of waiting for me to re-send them myself. I can rebase my remaining
> patches onto this chain. But I do have comments on patches #4 and #7.

> I've been very busy and don't have time right now to deal with
> re-sending my original patch chain.

OK, great - I guess applying stuff will make less work for you later.

--c7j6oBAWbbGfiDda
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMbd2wACgkQJNaLcl1U
h9B6LQf+MPHcw1mzNH++FkEdl0UnCVxCjYWkYqdl/1xPUX4v5Fml2caza/NofX7J
tXms945HN9eAO2JpxMSjZhr7xAwnr/M5s3mAudBceL0CplrJ5+L8vdEbEBlVUE0r
HUZKNmowpqUhuIGjzFanHy7jOVU7iOp0w9duhy4D4FPXMAwA7Y08wsDokPkyMWmd
emYKmXSa8/7IypBUKCDE0ltSnQgAUsqo/yLfjmZ7ocQvmCzQBpAuQYTgBqupfhQF
Lu5V2QUXug1xA/iWKqOXqXSxv9pY7yLX/+LLT5NijZaqtMZ0Xrt3qZzb75dF+QXT
ya9T308GWaZ7RcJWtIoPAfvVpw4qBA==
=S/yJ
-----END PGP SIGNATURE-----

--c7j6oBAWbbGfiDda--
