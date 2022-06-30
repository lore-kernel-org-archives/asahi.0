Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD484ECE
	for <asahi@lists.linux.dev>; Thu, 30 Jun 2022 12:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C6BC341CC;
	Thu, 30 Jun 2022 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656593328;
	bh=joKbTELu6hfvzcnfhQbg80CH7lGuvl4e0eRNBxTN5D4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z2BeB0mv23BtGIANeiFMGog6uCqxPx/6Tldn1Tb6BIRFblDI7i9qTfx5CfhQNtRGQ
	 lH6m5okdm6VwhrGa/8W3/Gb6+UpGlrcnTLogtRL6ogRMoXfOMERo7ZN13UU5Vwdn9u
	 TS7YKBq95KNRvnmTFzvfABmLMe/AhqYSOdfHqguw1hmdmXlhaMtC+iPilFGtxOPby9
	 JUsHJUuhcmpRCrFZXtdHLk92j0oUmiPCvF+Bn2Zbs67hZlniVoaKgDecplprN1QyDN
	 n55/qMbov26pOpx1a7jDWSQwDinFgCqQGKgZg/8yv1bwnT5AUkoSeN2nvsVz656Z3+
	 2BacziQhH7rng==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, povik+lin@cutebit.org
Cc: dmurphy@ti.com, alsa-devel@alsa-project.org, steve@sk2.org, linux-kernel@vger.kernel.org, ckeepax@opensource.cirrus.com, asahi@lists.linux.dev, marcan@marcan.st
In-Reply-To: <20220630075135.2221-1-povik+lin@cutebit.org>
References: <20220630075135.2221-1-povik+lin@cutebit.org>
Subject: Re: [PATCH 1/4] ASoC: tas2764: Add post reset delays
Message-Id: <165659332651.455663.13893837473957568987.b4-ty@kernel.org>
Date: Thu, 30 Jun 2022 13:48:46 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 30 Jun 2022 09:51:32 +0200, Martin Povišer wrote:
> Make sure there is at least 1 ms delay from reset to first command as
> is specified in the datasheet. This is a fix similar to commit
> 307f31452078 ("ASoC: tas2770: Insert post reset delay").
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: tas2764: Add post reset delays
      commit: 4aeb04227eb4d5de83343cfbad00433019ccfdf5
[2/4] ASoC: tas2764: Fix and extend FSYNC polarity handling
      commit: a1b2cfda5616ddccd54fa10b9e72932b3f3bce8b
[3/4] ASoC: tas2764: Correct playback volume range
      commit: aea21dbec799d63393b615b73e4708a5d036df99
[4/4] ASoC: tas2764: Fix amp gain register offset & default
      commit: cabcd219cee142a0f55516d2e257c8833cbd14f6

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
