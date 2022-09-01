Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9393166F7
	for <asahi@lists.linux.dev>; Thu,  1 Sep 2022 13:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2BBC433D6;
	Thu,  1 Sep 2022 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662037428;
	bh=90Pu4Z0995xDSMUAbDdhc76aEoKg03ejpjrv0Doj9I4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FBK7hgZsdA+O5pr1NwvSIynPqfNnuMlgbe5zK4vUQdsKhp5Vz4ym9Gjrck1eyTNQi
	 kWzRXOCY9G/1dIqOwItDAAcBBzh5b8l4yItefGPPxUKdU4rl0b4VigzCQSmBjSr9WL
	 hqTEdP8izC2H3R5i4svNsQ1Y9G3e4nU4Cq/Vs4+bSjaVwLcfHr6/HCnCf28b16UQ9f
	 rZv/PL9/QX/avS9CHNIgFkFrjZKNiYtBSmwh2zc286cwJoZe+kXKDC4vLCn6dRCe3h
	 2YUFbX52qqKPPoQg2xblYM/7CdFeEEAK3JrkVXCF+ccrMQVVZdmwo09lKieuiyFTOr
	 bdWpsCZBp6szQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Martin Povišer <povik+lin@cutebit.org>
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, alsa-devel@alsa-project.org
In-Reply-To: <20220901113415.27449-1-povik+lin@cutebit.org>
References: <20220901113415.27449-1-povik+lin@cutebit.org>
Subject: Re: [PATCH 1/2] ASoC: apple: mca: Unselect COMMON_CLK in Kconfig
Message-Id: <166203742666.66780.529814779896263080.b4-ty@kernel.org>
Date: Thu, 01 Sep 2022 14:03:46 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df

On Thu, 1 Sep 2022 13:34:14 +0200, Martin Povišer wrote:
> The MCA driver selects COMMON_CLK, which leads to misconfiguration
> on platforms with HAVE_LEGACY_CLK (under compile test). Kconfig catches
> the conflict with the following warning:
> 
>   WARNING: unmet direct dependencies detected for COMMON_CLK
>   Depends on [n]: !HAVE_LEGACY_CLK [=y]
>   Selected by [m]:
>   - SND_SOC_APPLE_MCA [=m] && SOUND [=m] && !UML && SND [=m] &&
>     SND_SOC [=m] && (ARCH_APPLE || COMPILE_TEST [=y])
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: apple: mca: Unselect COMMON_CLK in Kconfig
      commit: 7d2497b7fd3bf45706360bfe289f19d61d37f536
[2/2] MAINTAINERS: Fix file pattern for ARM/APPLE MACHINE SOUND DRIVERS
      commit: 55e2bd9c41e800638676dce3f19dcfd16b309a08

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
