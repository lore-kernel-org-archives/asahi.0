Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA567E
	for <asahi@lists.linux.dev>; Mon, 31 Oct 2022 15:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF920C433C1;
	Mon, 31 Oct 2022 15:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667229509;
	bh=5ImeOscq9YaVQO2U0AE/eN73YuOvrFN9YE64Im7ZJHE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=br+E86JjMHh2jBZwsZwp/uN/u8/4wKJQ9uqAhqizX04RCJGO7Kg4aRfYVLlJCcTd6
	 N0sejut8Oy3ss2MW531oSyPudi1m1i2WzLrn+3UOkedrTk1xtv4gkE8T9M3WukAdCt
	 KQoLMRmIgPXhw4AYhZ3dTgIL+YmV9reQvBczkjzXKR66puUiD+a/+t0UBALZigQCIL
	 C6LqQ2KBRMYrxunja/fZrbHoVghySp38ZdRYAee40qmBbZzBWqeT4uJjvI1ovif35X
	 wm25dzuoK4t+sm0tqSWcsOLnpHbSRip3+mYvUxcTlOR8QXpLEXRlvy2LrJz6liNW+l
	 RALDZIbi/tcyg==
From: Mark Brown <broonie@kernel.org>
To: Martin Povišer <povik+lin@cutebit.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jos Dehaes <jos.dehaes@gmail.com>, linux-kernel@vger.kernel.org, kevin-lu@ti.com, alsa-devel@alsa-project.org,
 Raphael-Xu <13691752556@139.com>, Frank Shi <shifu0704@thundersoft.com>, Stephen Kitt <steve@sk2.org>,
 asahi@lists.linux.dev, shenghao-ding@ti.com
In-Reply-To: <20221027095800.16094-1-povik+lin@cutebit.org>
References: <20221027095800.16094-1-povik+lin@cutebit.org>
Subject: Re: [PATCH 1/3] ASoC: tas2770: Fix set_tdm_slot in case of single slot
Message-Id: <166722950654.326387.4999935001407082845.b4-ty@kernel.org>
Date: Mon, 31 Oct 2022 15:18:26 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921

On Thu, 27 Oct 2022 11:57:58 +0200, Martin Povišer wrote:
> There's a special branch in the set_tdm_slot op for the case of nslots
> being 1, but:
> 
>  (1) That branch can never work (there's a check for tx_mask being
>      non-zero, later there's another check for it *being* zero; one or
>      the other always throws -EINVAL).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: tas2770: Fix set_tdm_slot in case of single slot
      commit: e59bf547a7dd366f93bfebb7487959580ca6c0ec
[2/3] ASoC: tas2764: Fix set_tdm_slot in case of single slot
      commit: faac764ea1ea6898d93e46c403271fb105c0906e
[3/3] ASoC: tas2780: Fix set_tdm_slot in case of single slot
      commit: 6f934afa6a980bb8d3ce73836b1a9922685e50d7

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
