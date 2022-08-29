Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00F653A4
	for <asahi@lists.linux.dev>; Mon, 29 Aug 2022 15:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1B7C433C1;
	Mon, 29 Aug 2022 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661788667;
	bh=uE92TjJdIW32uGc6WG4v/qRB5zqFoqnq8jHfO2r3gss=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=K1OyCCL+PN8deD6ziryLzUoodOz+98L5PbMHn6JYTnimsFXpEMJJUDldkw1mbEkgg
	 4wdFhU9ctWQaP+OC+j5xUJmY9nqHaPXNLMf+ZU6HFbEp90O3EsKkCyW7IvMUCCrqvu
	 8+XMmR8sy3Hb7CkFQ8Abfbk4WHo9hVDlTPDsLn5CIw4loetvMYQUeih0zC4BaFwfvE
	 D1bNPZrH/OnLUch2w5Tk+pqo13ufm2g2ddgZjTBAAqm1tYMkcw9RCGOMdYrtMkfDU8
	 hdsswnu/eBN40xeCWKw6QlbjUiOGHLJwCWWMNJk5yy8+cFSVeCoh1QN6uNwaUZFM95
	 Au8fcWI2gToWw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Martin Povišer <povik+lin@cutebit.org>
Cc: linux-kernel@vger.kernel.org, navada@ti.com, shenghao-ding@ti.com, Charles Keepax <ckeepax@opensource.cirrus.com>,
 asyrus@ti.com, raphael-xu@ti.com, alsa-devel@alsa-project.org, Stephen Kitt <steve@sk2.org>,
 Dan Murphy <dmurphy@ti.com>, asahi@lists.linux.dev
In-Reply-To: <20220825140241.53963-1-povik+lin@cutebit.org>
References: <20220825140241.53963-1-povik+lin@cutebit.org>
Subject: Re: [PATCH 0/5] TAS2764 fixes/extensions
Message-Id: <166178866033.855087.6477777309558997906.b4-ty@kernel.org>
Date: Mon, 29 Aug 2022 16:57:40 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-65ba7

On Thu, 25 Aug 2022 16:02:36 +0200, Martin Povišer wrote:
> First three patches are fixes analogical to those recently done to
> the TAS2770 driver.
> Link: https://lore.kernel.org/asahi/20220808141246.5749-1-povik+lin@cutebit.org/T/#t
> 
> The latter two add IRQ handler to log faults and expose a new control.
> 
> Martin Povišer (5):
>   ASoC: tas2764: Allow mono streams
>   ASoC: tas2764: Drop conflicting set_bias_level power setting
>   ASoC: tas2764: Fix mute/unmute
>   ASoC: tas2764: Add IRQ handling
>   ASoC: tas2764: Export highpass filter setting
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/5] ASoC: tas2764: Allow mono streams
      commit: 23204d928a27146d13e11c9383632775345ecca8
[2/5] ASoC: tas2764: Drop conflicting set_bias_level power setting
      commit: 09273f38832406db19a8907a934687cc10660a6b
[3/5] ASoC: tas2764: Fix mute/unmute
      commit: f5ad67f13623548e5aff847f89700c178aaf2a98
[4/5] ASoC: tas2764: Add IRQ handling
      commit: dae191fb957f82fbf570d13c060110eb278813ec
[5/5] ASoC: tas2764: Export highpass filter setting
      commit: aca86ec9a02a4d6099dbe23d1078faa005d58422

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
