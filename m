Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2C733EB1A;
	Tue, 17 Mar 2026 19:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774067; cv=none; b=Ps1bcfBxNjz7RRizpydTlMuyCWvigmZnPAIdvd0BbjeiBdEEPX4E1Nez+ClLPmDQe8tROlZk+0DF5NURD9aGU1QYje9TVW15tbfwKbQEG1MEVCCCl+f5UKdQcH46vgFv4o3Rkw57Q/NB3nOavJrVKQtS7Oz9IxCKRsv3sWQCN9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774067; c=relaxed/simple;
	bh=yttuqG/ROh6hqyPcZscidz1SzkXIBSQKIkWpYPfOtpY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JJg+oz68mM4YiNeZ4F6gY+OC9fsdE5gH/rLEWsBE1pMByGKoM9GJJBT22RBZtA64398/9B0NxpKHOzLjVi78ir76hySmvmiSv2t5U5zFifrxo4qIIhaC9fHd9qPEVOTXQKmEuewc3Dfdjuh0V5bjtY+sbf7IdLEjmTgq3MHQ210=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bC0vmF4D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bC0vmF4D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFFEC4CEF7;
	Tue, 17 Mar 2026 19:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773774067;
	bh=yttuqG/ROh6hqyPcZscidz1SzkXIBSQKIkWpYPfOtpY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bC0vmF4Dgb8OUfhh0W7n5dgGJuK7HFMUDems52SrCiAN0PiM5p2BmmgjRvtE4TeNc
	 Bt0BkSD6crgrqEPyFUi4jGSDwZ9Zshf9bKtjJBEKgKDD6d6FwjCd3vy4S2gaH3m+/m
	 Nd7Wh4TkojDm5VT1spqUe2cuzjsBuvnky/w99P49vYpHrCfNLzGBdFHOtkUNxnZzwV
	 eyri4GaDg1+9xPagXgFUu+5XDNCTD+GZcF+AVuzYKkxpG3wyzLim4ZdLABzg55pwEq
	 fMXDynA9D7BdqifjbEWkAuo3+9dXSosXjNZALkPmMc+/m0d6oygHmh19//bxi+fA8n
	 idAOQ5uI6wD0A==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260314-cs42l84-rates-v2-1-ea8a5af52542@gmail.com>
References: <20260314-cs42l84-rates-v2-1-ea8a5af52542@gmail.com>
Subject: Re: [PATCH v2] ASoC: codecs: cs42l84: set up PLL for more sample
 rates
Message-Id: <177377137228.409229.5026865754870577864.b4-ty@b4>
Date: Tue, 17 Mar 2026 18:16:12 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-e1b5b
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yttuqG/ROh6hqyPcZscidz1SzkXIBSQKIkWpYPfOtpY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpuaTwQhyBUJqQArA3JzLxP7Lp9eG/QP3VxRDXa
 GlhHIsBRNyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabmk8AAKCRAk1otyXVSH
 0AzRB/9OkxFCUiIxy0qKpAjg2q8TxzNFIPwxYOK65LlVYDG/MTvsSUJLnU1hjauVIoqFhalgbcL
 Slh1s9+GbUI36BTLsP9zKhT/10ug43uNsRLUAYvXuDr9UzEErfNqiLRVhdmM1CWak+2k+Ji7pBD
 96FPPBrCl3ra61mVa+hFWA4NacsO6rl4z+te7dc266BEV47QPhZ31SRIHshTBhF5FGhDP/yUhCl
 js4m0ezuT8NEejYqtKMV8dV0EaCrwnxNTHRe3q7L3GHZsmfLr7/EJctEcEZRlWr7dzOWnVjAlt8
 ucUw9WIFJ8Z46UVmry33wmzUoBhgkGmQy2xtbAmxfB70yiEj
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 14 Mar 2026 10:27:11 +1000, James Calligeros wrote:
> ASoC: codecs: cs42l84: set up PLL for more sample rates

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: codecs: cs42l84: set up PLL for more sample rates
      https://git.kernel.org/broonie/sound/c/4ebaf9d99932

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

