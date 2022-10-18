Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06A64A24
	for <asahi@lists.linux.dev>; Tue, 18 Oct 2022 11:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72814C433D6;
	Tue, 18 Oct 2022 11:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666092506;
	bh=2WaQRiHTmvcUWsaqC+uuKUaRlQvcNK/D5SC7IqqYZkA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GpNaJg7F6qGMlJB+p9vv6sO83YbXa0n7mB4RqXYTXYynFI82BGrHYrvZGoMD7DOrq
	 OcAlyol3RKdBMmurGCy9I04bXwcxKZhQCHF3RqAup46L9DPdj6hptg65d9nlOP4XGO
	 aObPQoD6L9NIVxaYdSOcrl7+Ij00+mDejhWSbhMQkYI74yFllLO7omQg8l9C5mzP82
	 zOR0UK4tQkHhd+sXSTxBRLZIDIKq2u8nbjU1j7F9r7JhQwFEjkIHBkjcrVfMqN1kHh
	 k2hqkp7jasoPsNc4iYP1PpQNtg57yToFHOhKpAoDYJi2EtlAs0TDzKQHlry2+gAohp
	 +JB9Fss4KMQpA==
From: Mark Brown <broonie@kernel.org>
To: asahi@lists.linux.dev, alsa-devel@alsa-project.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: povik+lin@cutebit.org
In-Reply-To: <20220921153123.1508144-1-yangyingliang@huawei.com>
References: <20220921153123.1508144-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] ASoC: cs42l83: change cs42l83_regmap to static
Message-Id: <166609250519.155136.17284249606778071645.b4-ty@kernel.org>
Date: Tue, 18 Oct 2022 12:28:25 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921

On Wed, 21 Sep 2022 23:31:23 +0800, Yang Yingliang wrote:
> cs42l83_regmap is only used in cs42l83-i2c.c now, change it to static.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l83: change cs42l83_regmap to static
      commit: fb07a8493a7b205116c9825b16267a07ffae129c

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
