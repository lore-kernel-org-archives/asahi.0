Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EC832FA2C;
	Mon, 13 Jul 2026 17:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783964999; cv=none; b=n3h6jn4pIggygWDC8hBdvZSscSsO/D1bVgx4XcD3vNZTSScP00KUIheYfF9PzomwMlOlpJgoHmw2rLV2R5PmMKS+l8Tk8FNCQKIQxql5pDMBK+mdkhbHrcf88kpIoYAvzB/05V2wLfMsTq40asDnyjLl2lnQakrJcSradvslfu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783964999; c=relaxed/simple;
	bh=EdBCH5dd+Q2QtgXmbzmLCph1xdgtSkuOxy/KJSgUQGs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sLk8/AFnuEObnI2Je7Pn5Ja9IUksP3V1TVM1qN19dZmkUze+MMMY285ePCbalFVL1T/ToySiz3/0KMTg5q0xt0zY8GqfTb7I59nDsSVr9JzkVZyDPPdIf9nFckssruUruST2PniuNvpKNrtkuIh0zNk3g+dmiQHVuI9bpc4sBXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeIkudY2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeIkudY2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DDC1F00A3D;
	Mon, 13 Jul 2026 17:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783964998;
	bh=Fa5TT7A7iaJiXQk7cDzWrcccsXQ1AmFPBgeZw6vo3Kk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oeIkudY260diCJSQ180U3sbXGFrYTgvquUEo6c6E/H5baUd2zX92IrLkpo4+SULPl
	 RQftAWQ8Vq0q8ky7aeRmdmFsEH35aZhNCNrxCFI1oc+/yeaS0HLDquqwzlwpY9RIcp
	 RZKPh8k3aQ0vPV5NouggYU5pzaVayKPiL5oUNOcYXPQETEjtibfQjCnbR2lt/MRRKe
	 bBHMdKdktAyat2GOhy8nd/UOh/vlHOXrukIDYzUrcB88nlhqShh5645CCPg95Mx91G
	 egnpM09lxCOH0nFpNrax0dgQV9V13NeepmTxbP+qGioOLYhZrgtkrwfLTdRMFDhUIQ
	 eK06G+RQ5K45Q==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
In-Reply-To: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
References: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
Subject: Re: [PATCH v4 0/7] ASoC: apple: mca: support simultaneous I2S
 capture on the frontend
Message-Id: <178394656784.7914.15876722756156903983.b4-ty@b4>
Date: Mon, 13 Jul 2026 13:42:47 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2172; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EdBCH5dd+Q2QtgXmbzmLCph1xdgtSkuOxy/KJSgUQGs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqVSVDhdOgL1wxEVz/vduoL+nULsCHvqWT4NC3F
 Ll3ZKq/FrOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalUlQwAKCRAk1otyXVSH
 0NLpB/4n4YUXqH3WNvZCBAANZopBaFRX/qJmaFsvGxs5hVjQ0KK6cegVA/tOVRZNL54PPbjoz/s
 qdE7Z39jBXi/X0O+xuXPje5uXGjvxIZ4fTAEw2dYm4lofbdK9EC/Ce0wJMXs9DXutHyFaBtrq5g
 yoLQ+NdWdk5Gdhh+zqO3M+9qnoHqvDNbkvpo7JbEpJQX9X2EWNwb08YqvEDziT9Cl8fgVn4Xz8f
 ZwePfHlAk897lQtr4y784c1eE6aK4nzth7xehIkMAMNZsKPBprUsePDBcssJGuzuIfGav4IqQ2+
 uQV78Kni1tzgSIVhUAcemYLHZNi1QTrKOnEg6pkrt4FQev24
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 11 Jul 2026 11:11:18 +1000, James Calligeros wrote:
> ASoC: apple: mca: support simultaneous I2S capture on the frontend
> 
> Hi folks,
> 
> This series introduces a number of changes to the ASoC driver
> for the Apple MCA peripheral to enable support for bidirectional
> I2S. This is achieved by allowing frontends to act as clock consumers
> and logically ORing data input lines when multiple backends are linked
> to a frontend.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[1/7] ASoC: apple: mca: increase SERDES reset delay
      https://git.kernel.org/broonie/sound/c/cccd721e5aab
[2/7] ASoC: apple: mca: Separate data & clock port setup
      https://git.kernel.org/broonie/sound/c/108d4b654d82
[3/7] ASoC: apple: mca: Factor out mca_be_get_fe
      https://git.kernel.org/broonie/sound/c/2aab6230f8d8
[4/7] ASoC: apple: mca: Support FEs being clock consumers
      https://git.kernel.org/broonie/sound/c/00309bfb1f54
[5/7] ASoC: apple: mca: Support capture on multiples BEs
      https://git.kernel.org/broonie/sound/c/108a14b20f95
[6/7] ASoC: apple: mca: Do not mark clocks in use for non-providers
      https://git.kernel.org/broonie/sound/c/889c26cfb98d
[7/7] ASoC: apple: mca: Add delay after configuring clock
      https://git.kernel.org/broonie/sound/c/8dd595bca51a

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

