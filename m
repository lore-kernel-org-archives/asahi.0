Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BB83B8111;
	Fri, 10 Jul 2026 22:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783722065; cv=none; b=sM1bsz9b1vB+IAafFlZLvjt3i956Rwi2DmDauoT/NewBqoC7uUKILAVYoRaAKTVRx+GlbLJZU3hy4Eo7Na5c8LcdmsU1mb8q+oQ8FM/IG4fguHnWeuj+wcbw7bHm2U8azVQgI4xwWu2EJa6W1SHkMDl8NrY7VtSJ6YnGJDbt+2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783722065; c=relaxed/simple;
	bh=IimZ9Ad7nkHLAiXBgICJ06g4iWZA4vFqOLDor/2SRzQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NhD6nK+M34sisjPFzpckZVUKmqTyfC8oWI3nw7R1jBHExPKHBL0E6IYn12hL/nJQhbQVzeYDkoSyKR/9fb8cy4LCQ5a9wj+qUmkxT9BGoeypfG+GZx3uS5uTHGa4bXN6SeM6J/ykmrKux5bUSoBq3s/9+8A3qJHBxtCAME+gp+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DpKdv695; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DpKdv695"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FE11F000E9;
	Fri, 10 Jul 2026 22:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783722064;
	bh=SH7pPtd6eXmTEFsLCzrvDd9p7dzrIf3Y0vcdRKzL4oo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=DpKdv695cFNEzDmE/0R5PTOCQ0O/P8d4f+jE5Jq/D7kg2iBeMg1N0r1wDH0PRZ7uq
	 XiTA3OkegFSKZuOjGlrfvvClXdOv4TzZGDvL8hZ7Lu2lUhpKPlzbVttp4tvqUbIJ6j
	 NlGmahMiB1XvePAsJvml+gaB03p95f0wOhW++kFQujI3rFwnH/44eNOQDMGyCM3D7w
	 JpmIQ0yv7IgCIjKaVX03KTj3RydhYqUq/ZXgCKn6GDhJKzunOg81gkCvAW7JMdMfr2
	 v8WNNmNt85vv44XZ40+hyaDcyCrGmKMr5EeQd0GpNYUjVsGveMeGVuqjuq2tqAlTJD
	 qlorF0CzTOpMA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>
In-Reply-To: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
References: <20260705-apple-audio-redux-v3-0-ff7a7afe2b6b@gmail.com>
Subject: Re: [PATCH v3 0/7] ASoC: apple: mca: support simultaneous I2S
 capture on the frontend
Message-Id: <178370665528.82617.13561476084775898427.b4-ty@b4>
Date: Fri, 10 Jul 2026 19:04:15 +0100
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
 h=from:subject:message-id; bh=IimZ9Ad7nkHLAiXBgICJ06g4iWZA4vFqOLDor/2SRzQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqUXBNYxbzrNwMexKf1iBU1PGSHovrEYfRmQ7RL
 wQXVX5zy6uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalFwTQAKCRAk1otyXVSH
 0BZZB/0SSCuwXfxJFSMR+RC2+ZPW1HfHuSpkP7HHomr5vFIEslH1kpcezZjRreVA0ma2ufALX7L
 cIOqNmoceTZd3ZmhXUpkBbz4s3Pkvdur8mBSuWK1QdExIwl95/DWqptolmWLlqVelvqctyTua/Y
 eiKeHt+zn2hfOYZFMQf58lGTBqezMVAuh2AQmD2mYDHStpPeCsdcWWE/Rx1dxhsSI36SbQc2/zT
 YClC4kT+tox9q5pod7EK7tF1ln3UpHH3Gi7ZXIY8HAVnWE/PuuWAAFjizIcu1FQVmWyOX7YzV2O
 4aDwtq8aZznJgZ9+dwirtpwQEJfNbfZKmWSLow6dFSkBrCUT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 05 Jul 2026 13:37:49 +1000, James Calligeros wrote:
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
      https://git.kernel.org/broonie/sound/c/10171d80685c
[2/7] ASoC: apple: mca: Separate data & clock port setup
      https://git.kernel.org/broonie/sound/c/95f5c4c18bfe
[3/7] ASoC: apple: mca: Factor out mca_be_get_fe
      https://git.kernel.org/broonie/sound/c/67dcaba8e3c2
[4/7] ASoC: apple: mca: Support FEs being clock consumers
      https://git.kernel.org/broonie/sound/c/bb8feda69a78
[5/7] ASoC: apple: mca: Support capture on multiples BEs
      https://git.kernel.org/broonie/sound/c/7721f43c1a7f
[6/7] ASoC: apple: mca: Do not mark clocks in use for non-providers
      https://git.kernel.org/broonie/sound/c/62e0495e140e
[7/7] ASoC: apple: mca: Add delay after configuring clock
      https://git.kernel.org/broonie/sound/c/3663fb104b08

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

