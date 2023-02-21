Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA4C46B8
	for <asahi@lists.linux.dev>; Tue, 21 Feb 2023 13:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7AEC433D2;
	Tue, 21 Feb 2023 13:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676987237;
	bh=E1BaK2IwvDddzDnn1BEIWQwSRUe/ogAAmqJRVaYDlf0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SfzK37HcWplIpjhNZHwIGisfJwsdWEOhDtEAmrc926R4jloA9I5vV/r0EbCqNUQi5
	 1zN50SS/VyC0i+38H5AGuebmdg1PKRlk17c1xbNmU6NwhtlQFyfzhdPNmh6vm3SdRW
	 JX+Q/OVCNWqhOGnopzg6oWh02mDQBp1Fr8oHeg6koI5xkkE3Sry0AuYnXDhuZvMRlw
	 MKaSw2sNmVaRqqbgHDfpH5oq53QiRM+aIO5AqnH1uO4kpPi6N6daPHeqqas5Mz5f+3
	 Uk0JsDzavYWtdkdlgi1pHsO1dtrH1dxJlnKf6LixslBhOeTg0AxsQWbI1jXxcsflaX
	 zvW3uheobCUjw==
From: Mark Brown <broonie@kernel.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
References: <20230202-asahi-t8112-dt-v1-0-cb5442d1c229@jannau.net>
Subject: Re: (subset) [PATCH 00/17] Device trees for Apple M2 (t8112) based
 devices
Message-Id: <167698723536.32575.6135846680290091834.b4-ty@kernel.org>
Date: Tue, 21 Feb 2023 13:47:15 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0

On Sun, 12 Feb 2023 16:41:10 +0100, Janne Grunau wrote:
> This series contains dt-bindings updates and device trees for Apple
> silicon devices based on the M2 SoC (t8112).
> 
> Device tree validation depends ont the dart-t8110 bindings queued in
> the iommu tree for 6.3 [1] and support for "local-mac-address" for
> brcm,bcm4329-fmac based devices [2]. The latter fixes validation errors
> for the existing M1 and M1 Pro/Max/Ultra device trees.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[14/17] dt-bindings: sound: apple,mca: Add t8112-mca compatible
        commit: b361d5d2464a88184f6e17a6462719ba79180b1a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

