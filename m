Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392F663F
	for <asahi@lists.linux.dev>; Thu, 11 May 2023 05:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A862FC433EF;
	Thu, 11 May 2023 05:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683783385;
	bh=lZHIGykf0/w5SWyGFtUgZIwxhpIradYJaIud1dnBpBc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ozh5dAUYF1mfWYlZJO31hcG6KboNE1ojUnqgKeV9ar+mpD2P1YHv6kyN30RLDTclB
	 U8EW63E2dRkW5cmgkZmbrqfRfGm/GEIyls8w8ATk0WHWrq2C410l3GO0oIXAsKRjuu
	 PNaSvVtUHaZgbouset5V9rQtB63HMNFVOyJWUvUhjQO0qj9Tqw5uicfIzw9RHBOOI7
	 sETV0bBCb9oFd59dkKXcEedcB7U4mQV5KCrH8rmoGpi4jVIjqGt+xqK8H97smXGlHq
	 B4U3GDfrhrDROk8EH/hISp2/p1mkh47pOpZfiiof+I33t8IxdVHitWTd/Cp1hbDvNp
	 UezXXq2XEmwdQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Andrew Davis <afd@ti.com>, Shi Fu <shifu0704@thundersoft.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, kevin-lu@ti.com, 
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
In-Reply-To: <20230509153412.62847-1-povik+lin@cutebit.org>
References: <20230509153412.62847-1-povik+lin@cutebit.org>
Subject: Re: [PATCH] ASoC: dt-bindings: Adjust #sound-dai-cells on TI's
 single-DAI codecs
Message-Id: <168378338222.323079.1310653155844733439.b4-ty@kernel.org>
Date: Thu, 11 May 2023 14:36:22 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bfdf5

On Tue, 09 May 2023 17:34:12 +0200, Martin Povišer wrote:
> A bunch of TI's codecs have binding schemas which force #sound-dai-cells
> to one despite those codecs only having a single DAI. Allow for bindings
> with zero DAI cells and deprecate the former non-zero value.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: Adjust #sound-dai-cells on TI's single-DAI codecs
      commit: efb2bfd7b3d210c479b9361c176d7426e5eb8663

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

