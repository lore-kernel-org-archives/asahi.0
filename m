Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5FEA3C
	for <asahi@lists.linux.dev>; Fri, 12 May 2023 04:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A43DC433D2;
	Fri, 12 May 2023 04:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683865156;
	bh=4s4KOPxQfAXypy16Av6XmHSDrmy9tNN6WXw+g/9wnHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=j3CJjGPpWDT7Glm2BMa065FlUj70/0FGFOkIbhxL6k16GYWlytEatJxmvyWbcJrzU
	 F9XcUagNSHPXr1ECnP+0eifccc409/rP2vsT4zzJ0Nmb1A0Co8sWuW+Zu0V4D0oLnL
	 nzfHLgJWhFF/5cdTYBFvhj6h+C0a8ZTDH95aeKkPVh0qQXWCKhNz6WNHpOj+ypB0pb
	 JMZUNZcfXTD1IXEzl2J86VIFeJYZZNulmCWb/3EVWTKCknxuqzc7Ilra4bsPvbii+P
	 GV03buZNAG3LYnZu/wDqqSHJq4H6qMmxvgJXIEiuywQc8WLc7stcG2HzXT4aIEkfd1
	 o+40KJIsjKidg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, alsa-devel@alsa-project.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230511150546.8499-1-povik+lin@cutebit.org>
References: <20230511150546.8499-1-povik+lin@cutebit.org>
Subject: Re: [PATCH v2 0/2] ASoC SSM3515 codec driver
Message-Id: <168386515280.352974.12145582382045315561.b4-ty@kernel.org>
Date: Fri, 12 May 2023 13:19:12 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bfdf5

On Thu, 11 May 2023 17:05:44 +0200, Martin Povišer wrote:
> Analog Devices SSM3515 is a simple speaker amp that Apple is
> using in their 2021 iMacs, possibly elsewhere. This is a v2
> of an ASoC driver for those, to be used with upcoming ASoC
> support (in upstream kernels anyway) of those platforms.
> 
> Martin
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: Add adi,ssm3515 amp schema
      commit: 51208a4d303b78642c5d5b35fb9ce963a84d21d0
[2/2] ASoC: ssm3515: Add new amp driver
      commit: 4ac690bbae02e26e36e133becd86babb657126ef

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

