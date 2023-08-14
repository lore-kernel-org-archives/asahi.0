Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC48161;
	Mon, 14 Aug 2023 00:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4822C433C7;
	Mon, 14 Aug 2023 00:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691973209;
	bh=hhzk3CoCzoUmIzvYF+9ERXn0jLZ8kN4BZJDwzOq7VBE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=LbXvGA0gtpbpnKZd2KdyjgVS0tjBoqroWIa09uSOnZsD83+Xc5teNPj/Umv1te9GV
	 UP/xkQT9R2KLv9Z+S9sFVKJ45tYwbNAGUdgu3uU//c30GmFsTvnShffTudkMz/sJnE
	 I38OmS8SohLbMxYdHrOKxwmH0Bz2CpY9k0wT6I8okZH6RQE3MJtTGSpK6JLlFAeppH
	 MxSRxPaioINRpLTIRajIbkWmlwBb4bKB5HwDAS720ags5APTJSrhdHd4AC9U5+WUDn
	 t+x8X5ddasyMFuX+EGNNpDIPcNsbNlQxHmd2RA3UANjUgtixSdw4Z/wIQoVjBO9HhK
	 cEFqU2n8ly0Ng==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, claudiu.beznea@tuxon.dev, 
 lgirdwood@gmail.com, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, peda@axentia.se, lars@metafoo.de, 
 nuno.sa@analog.com, povik+lin@cutebit.org, wens@csie.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, robh@kernel.org, 
 u.kleine-koenig@pengutronix.de, alsa-devel@alsa-project.org, 
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230811071426.2343133-1-ruanjinjie@huawei.com>
References: <20230811071426.2343133-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH -next 0/5] sound: Remove redundant of_match_ptr() macro
Message-Id: <169197320455.2741913.15830734476730877425.b4-ty@kernel.org>
Date: Mon, 14 Aug 2023 01:33:24 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9

On Fri, 11 Aug 2023 15:14:21 +0800, Ruan Jinjie wrote:
> Since these sound drivers depend on CONFIG_OF, there is
> no need to wrap the macro of_match_ptr() here.
> 
> Ruan Jinjie (5):
>   ASoC: atmel: Remove redundant of_match_ptr()
>   ASoC: atmel: tse850-pcm5142: Remove redundant of_match_ptr()
>   ASoC: sunxi: sun4i-spdif: Remove redundant of_match_ptr()
>   ASoC: ssm3515: Remove redundant of_match_ptr()
>   ALSA: Remove redundant of_match_ptr()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: atmel: Remove redundant of_match_ptr()
      commit: 67ed781228bdcca7a0d2058cf62d0c1860898330
[2/5] ASoC: atmel: tse850-pcm5142: Remove redundant of_match_ptr()
      commit: f83e34034fcc5fd0551d9257b710b61d999a8174
[3/5] ASoC: sunxi: sun4i-spdif: Remove redundant of_match_ptr()
      commit: 29546c3af6319a8a5308d4add1226343031da65b
[4/5] ASoC: ssm3515: Remove redundant of_match_ptr()
      commit: 6136b6a281b40cb795a76f1769eeb7ef5026b86f
[5/5] ALSA: Remove redundant of_match_ptr()
      commit: f479832b42df596775c1e787e02c7277bfba6a4a

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

