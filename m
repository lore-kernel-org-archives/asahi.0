Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7544223DB
	for <asahi@lists.linux.dev>; Tue, 13 Jun 2023 16:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91B4C433D9;
	Tue, 13 Jun 2023 16:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686673087;
	bh=Mma5cFj/i5+8iPwu53HhgwL7Bq26PgrJxBZ3tfa3OPk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Rcwob7jrGGd1lfAmM0leDN2D/2cTevP09Q/4wlSdr6yoGUGloSV7unRh3/2PWV6E7
	 +qoIHwCLZldWGcQb3kkVio9JrCLwcWjNY5dDF0RiHAguRzz+ND3IpzzCIsbxjZCsEK
	 Esi8w1/CcIQ2xxSpVnuhzewJroILmo4K+iyjEug7Gbiyi9gSSC4x7DrE3Y+rtL4MaB
	 fs77RDpPAvvJH9iBPHONRggzoVGs9ZFygUzfkai+vB4kQwTdVsxOgUG3QLt/0wKxvm
	 eOi6INtZ9+IBFlgZTG7SfrRpNthDkLk1DoGIb+abXgO0ixIG2yXCuODSRIVZq+sx+h
	 dMfgh24bZFevw==
From: Mark Brown <broonie@kernel.org>
To: James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 asahi@lists.linux.dev
In-Reply-To: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
References: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
Subject: Re: [PATCH 00/10] ASoC: Use maple tree for Cirrus Logic devices
Message-Id: <168667308442.106697.13041081726407558146.b4-ty@kernel.org>
Date: Tue, 13 Jun 2023 17:18:04 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5

On Sat, 10 Jun 2023 14:56:20 +0100, Mark Brown wrote:
> A lot of the Cirrus Logic devices only support single register
> read/write operations so they get no benefit from using the rbtree cache
> over the more modern maple tree cache, convert them to use maple tree.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: cs35l32: Use maple tree register cache
        commit: 176bb179f190682d496220be469ea20527bb5f43
[02/10] ASoC: cs35l33: Use maple tree register cache
        commit: 7a230512d335793fdc43bb85a7d5cff9dd171c26
[03/10] ASoC: cs35l34: Use maple tree register cache
        commit: e7795f2d29e08e15fbc5ad88b94cf1899915a7c3
[04/10] ASoC: cs35l35: Use maple tree register cache
        commit: 28f851babc484c86bc8e1919ad0bbe11f4fd9210
[05/10] ASoC: cs4234: Use maple tree register cache
        commit: bb1bd25ad79cf21b8fa4c0eae474307b2d24b268
[06/10] ASoC: cs42l42: Use maple tree register cache
        commit: 6b7fed83c9455f64a1509a9e1d512a92edaaf44e
[07/10] ASoC: cs42l73: Use maple tree register cache
        commit: 7e39a71876244639774c71144e4b5dee7799e1cf
[08/10] ASoC: cs42l83: Use maple tree register cache
        commit: 62145b0a537410d7ce237945c339635f9a86a895
[09/10] ASoC: cs43130: Use maple tree register cache
        commit: ce598b2f83608f3818f8a4079662d3844679b16f
[10/10] ASoC: cs35l30: Use maple tree register cache
        commit: 0eff26b13da4eb5a71a59280c3483273ccb5b9cb

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

