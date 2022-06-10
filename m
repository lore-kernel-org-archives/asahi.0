Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9AD7C
	for <asahi@lists.linux.dev>; Fri, 10 Jun 2022 15:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C84C34114;
	Fri, 10 Jun 2022 15:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654876727;
	bh=GDubMMqKX5ziyi7uxi0ZmYERIwl7N131vwqlSO+EgJc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Cb6qvF2W0lCY6kSjtH0jA0xSmnhSAnMUWMGvz0HpazJEipNdgIwQoPd1Vmhd+h8sO
	 wI3dGE9CUlMBN0Jb14yHn5QCv/KulBspetBlFXgVXFN/SsQH9RWPXYFvnaEaQlwlXj
	 wyJI2H6JQ2V/1uBzya4Powx00zSivPq6dzrXgfjN33X7MXmfgBN1QyyOn6+1gg9Ktt
	 2Rs498gkau1LilfMgFJ0AFGnMQHFXq2dIKT3vrddswIE3yToaEyvhReKUGB1m+r6Vi
	 T8U9mpNUNj/SEMj1qnA2hteO2bJP8HBfKetqriBByXUTsH/Zd6QvQ9dbp28i39VOZP
	 VJXQTCj8z8csw==
From: Mark Brown <broonie@kernel.org>
To: krzk+dt@kernel.org, povik+lin@cutebit.org, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, robh+dt@kernel.org
Cc: sven@svenpeter.dev, asahi@lists.linux.dev, kettenis@openbsd.org, marcan@marcan.st, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220606191910.16580-1-povik+lin@cutebit.org>
References: <20220606191910.16580-1-povik+lin@cutebit.org>
Subject: Re: (subset) [RFC PATCH v2 0/5] Apple Macs machine/platform ASoC driver
Message-Id: <165487672494.1755957.15170830453341675210.b4-ty@kernel.org>
Date: Fri, 10 Jun 2022 16:58:44 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 6 Jun 2022 21:19:05 +0200, Martin Povišer wrote:
> This is again RFC with a machine-level ASoC driver for recent Apple Macs
> with the M1 line of chips. This time I attached the platform driver too
> for good measure. What I am interested in the most is checking the overall
> approach, especially on two points (both in some ways already discussed
> in previous RFC [0]):
> 
>  - The way the platform/machine driver handles the fact that multiple I2S
>    ports (now backend DAIs) can be driven by/connected to the same SERDES
>    unit (now in effect a frontend DAI). After previous discussion I have
>    transitioned to DPCM to model this. I took the opportunity of dynamic
>    backend/frontend routing to support speakers/headphones runtime
>    switching. More on this in comments at top of the machine and platform
>    driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[4/5] ASoC: Introduce 'fixup_controls' card method
      commit: df4d27b19b892f464685ea45fa6132dd1a2b6864

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
