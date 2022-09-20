Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE231C03
	for <asahi@lists.linux.dev>; Tue, 20 Sep 2022 20:46:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29016C433D6;
	Tue, 20 Sep 2022 20:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663706793;
	bh=tRmySnzyxJtvKAKwBC3of+F/OYOk3Qbmx+SXQY2cawg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XQeUHjq9Pj072MUFjdlkgmhlsm6Ii6T4hBL32a9gi0MLiF4zTVHr1IuZ9ChsR49q2
	 ywhc6tm8Wx7e6jmtIEbtQpss5umPnEwk1KKbAm2ZbHSo8NqArqDYZjEZrJgpfCVUsb
	 tM0XQmWuOcd1ttz2tokjpkswBqdgptfnboj58u8woxnqtHmc39crve4KESdNpltLut
	 Vh/M9cPSD5Nub4VBhgCTIVO8o6/dhbY4HjBVgFhU0oBQqfBPj+81KxQ+5lqNowo1cF
	 PUQ2CZ1J+9ynttgI4yt2cIqFDqyo8MdiJXD3Jrc2owq2/GsWMmFHXT96rYBUcXCKRC
	 IfMaQ9beLaDVQ==
From: Mark Brown <broonie@kernel.org>
To: Martin Povišer <povik+lin@cutebit.org>, David Rhodes <david.rhodes@cirrus.com>,
 Lucas Tanure <tanureal@opensource.cirrus.com>, James Schulman <james.schulman@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: ChiYuan Huang <cy_huang@richtek.com>, devicetree@vger.kernel.org, Matt Flax <flatmax@flatmax.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-kernel@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, asahi@lists.linux.dev,
 - <patches@opensource.cirrus.com>
In-Reply-To: <20220915094444.11434-1-povik+lin@cutebit.org>
References: <20220915094444.11434-1-povik+lin@cutebit.org>
Subject: Re: [PATCH v2 00/11] Support for CS42L83 on Apple machines
Message-Id: <166370678777.361668.609808774566315229.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 21:46:27 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31

On Thu, 15 Sep 2022 11:44:33 +0200, Martin Povišer wrote:
> [Changes for v2: Collected ack on compatible. Addressed Richard's
> comments pertaining to error handling. Rebased. Switched to
> dev_err_probe() in few places (added patch #11). Fixed authorship of
> one of Richard's patches.]
> 
> Hi all,
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[01/11] ASoC: dt-bindings: cs42l42: Add 'cs42l83' compatible
        commit: 23162672ff85c24afc19293309500d3a63134ef8
[02/11] ASoC: cs42l42: Add bitclock frequency argument to cs42l42_pll_config()
        commit: 7e178946c3e4e64cebda4e60d0b7e5c02a502d13
[03/11] ASoC: cs42l42: Use cs42l42->dev instead of &i2c_client->dev
        commit: 2feab7e7d8c01b67d9ffbfb902d1591c08e9d564
[04/11] ASoC: cs42l42: Split probe() and remove() into stages
        commit: 0285042feda799edca63b35cea0cda32ed0c47c2
[05/11] ASoC: cs42l42: Split cs42l42_resume into two functions
        commit: 56746683c2560ba5604bb212f73eb01f5edfd312
[06/11] ASoC: cs42l42: Pass component and dai defs into common probe
        commit: 52c2e370df07092437d1515e773d28a5f53fc810
[07/11] ASoC: cs42l42: Split I2C identity into separate module
        commit: ae9f5e607da47104bc3d02e5c0ed237749f5db51
[08/11] ASoC: cs42l42: Export regmap elements to core namespace
        commit: 30b679e2cb058c3dcf6d3ebdf10999f0a7a1644d
[09/11] ASoC: cs42l83: Extend CS42L42 support to new part
        commit: 94d5f62a91aab6ac9c3f4abfd048cbe5f77153ac
[10/11] ASoC: cs42l42: Implement 'set_bclk_ratio'
        commit: ab2940a72dfa823af09abf593512459afe3da460
[11/11] ASoC: cs42l42: Switch to dev_err_probe() helper
        commit: ac088c31d496b885d8268bd1c9746c3c76bf7078

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
