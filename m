Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E524416
	for <asahi@lists.linux.dev>; Mon,  5 Sep 2022 15:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1622FC433D7;
	Mon,  5 Sep 2022 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662392331;
	bh=4u4jqbKnjxr0740mYmvnkQwNn7DrSy8Qxd94JXxLGcQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OEgjefpByYac9OU8DroWmjFX+lWlkrXwKE8GdJel8JEq+Su4YUw7IzQVabm9lKlI8
	 cxqLJhRxGZ6XpNMezUOBl2UgHwgOAxu5yg+px/ZXH6xqeq1uj86/84OBWY77fEm8T/
	 VVy/rcG41Tft2jBwtjbFF1YzvyBbff50UABY5bUCzxMUb80Q7XBdC4u9XfHywfk1Av
	 hcVTdMWqLMzeWx6qCyRKDTtg+c+NAsl4RW1mLsLUkeSzAyYpz3hWDkxRCnPpEDIaJT
	 2Ot2+PfD4r/SYO9XXr3XSDbAugs0YDpnB1MF0ez46dbpG6zVM00/a6h4+aACEshauh
	 8E/kc9yz+jX2g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Martin Povišer <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220905074030.1293-1-povik+lin@cutebit.org>
References: <20220905074030.1293-1-povik+lin@cutebit.org>
Subject: Re: [PATCH] ASoC: apple: mca: Postpone requesting of DMA channels
Message-Id: <166239232981.736206.16201162567715763451.b4-ty@kernel.org>
Date: Mon, 05 Sep 2022 16:38:49 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921

On Mon, 5 Sep 2022 09:40:30 +0200, Martin Povišer wrote:
> Move the requesting of DMA channels further down from 'probe' to
> 'pcm_new'. This is to spare the allocated DMA channel resources as we
> typically only ever use one or two of the clusters for PCM streaming.
> Before we would request DMA channels for all clusters.
> 
> (This is prompted by a change in the Audio DMA Controller driver, which
> will now be allocating cache SRAM to channels.)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: apple: mca: Postpone requesting of DMA channels
      commit: 4ec8179c212fb1530df4a1df6db75756c06da5f6

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
