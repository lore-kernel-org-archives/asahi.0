Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D422F616B;
	Mon, 27 Apr 2026 10:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285277; cv=none; b=bn/zezqzeLzA1xcyBNypbqXoLVyubhbt/krptNCcU/pfHyfb5HQRD/Bedxox3ye6y+vSQsaLJCv4j9EF9608q54UpSIeQ/d/GcaT4X0FwTfP/aiEST7/lbPMKRXw8PyODkv6gzLPmy7taM5uhQkmec2E9jjo9VWGz6ey8haLkQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285277; c=relaxed/simple;
	bh=7Qty8DwkTmllGqENaE6i9N8L01jntNuzBHKmBfohAMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=MNle7lR8byEuO+PUklNc9IoWPrpLuMzgf3tK4d5dYYDCR6Dfv4HGC/6NQWNK9jKOHp7+/MvoAHvkNhNDeBPxU3lTLdaJkeXYvUm0/fpW2ay5nwTiOZsR1xYDldHy20PZUGB+Rs/AeidvMLXczzjpGrKsUVIx3OitBNu8mA0iPjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Co7AsZRg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Co7AsZRg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D336C2BCB4;
	Mon, 27 Apr 2026 10:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777285277;
	bh=7Qty8DwkTmllGqENaE6i9N8L01jntNuzBHKmBfohAMc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Co7AsZRgQu+3qj2BDqwwMRgybolAgS0EK5LesGPbiN9Y/1ohCfCK4tdmyD3EvdtZ9
	 C13vwWkb1ty6LSAWJOEi6kunRuCJoYRx4MsqPkCO8m9Rwd3MMJysn7i87yzLKU1mWH
	 E9H18X1fm33T0WzF0inzmfLl+eTqFsZoU2Z2HNbHYwOZWvvKSg6wkQmHJs18xhSuFh
	 bs3KyMtJvN1Veq1xQBdUXKHCFsOW5j8roEnoA4R54Iq8dIOHhGnMpQRhwn7q4pV/5E
	 Skm6vKDajVpOm9o+MQE9mL9qlUZsTUlR2d9ADqHMfuybQs3UC5QLd8E3lgst4Sc1pM
	 /w09PKTCxekJw==
From: Mark Brown <broonie@kernel.org>
To: phucduc.bui@gmail.com
Cc: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, asahi@lists.linux.dev, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260423125646.156599-1-phucduc.bui@gmail.com>
References: <20260423125646.156599-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/5] ASoC: samsung: Use guard() for spin locks
Message-Id: <177724610467.266775.11938385437413240828.b4-ty@b4>
Date: Mon, 27 Apr 2026 08:28:24 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1855; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7Qty8DwkTmllGqENaE6i9N8L01jntNuzBHKmBfohAMc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7ziahrLktKeit2lBZjNLOg9n09tAYNApg61Zc
 QOpr3DAxWCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae84mgAKCRAk1otyXVSH
 0PzaB/4rdIKWVqtUvyTglVBgc3MiIpk1PrdfTbVBDlrFdkaRY+RdoZyFtx4ETf0JOMWt0iYz4dh
 KvohTCLIErdTzvkH636Tn1svoNMYxoSZ9MDGnhkymUDP2McbOXUjJvnmFZV/8fUIPI+tpcsDjX1
 GXU6DlFPNgLftdqNXG+Qb3TBBl7woHPpkN6vGRTuVZBc8PBXItpB/4weVgzP62KWYE+FpIn2sDa
 cZNvFyuv8tdBhjTiuIVcXn3dwZF3+tY7f4zbrT+pG2Q8rxGSE+0ukFwY1kldnOY4R4CxT01x2Ej
 ic0qRA37fHfBBozgT8yUIj3qvPsWapNueyDMQjyNdKJ9M0VJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 23 Apr 2026 19:56:41 +0700, phucduc.bui@gmail.com wrote:
> ASoC: samsung: Use guard() for spin locks
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series simplifies spinlock management across several Samsung ASoC
> drivers by adopting the guard() macro.
> All patches are strictly code refactoring with no functional changes
> intended.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/5] ASoC: samsung: i2s: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/3d08517b5c67
[2/5] ASoC: samsung: idma: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/a54f20fe8897
[3/5] ASoC: samsung: odroid: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/1d4dfb27554c
[4/5] ASoC: samsung: pcm: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/02f43a0d0dc6
[5/5] ASoC: samsung: spdif: Use guard() for spin locks
      https://git.kernel.org/broonie/sound/c/922fc982af98

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

