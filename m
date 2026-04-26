Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593B230C62D;
	Mon, 27 Apr 2026 10:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285288; cv=none; b=pMsqycb0yGatC+kWF8/3s8cgJSL3J5VUWUAx73oJceKK12Sb32c3abyMXCSkyD+c6RBPcH03MiRtvaFPvMzyLkRKGR0e4r2WIW/caZslUGXNUTuHOP/EZGC3ykfmH7UG3Oq5AXs+OCNCzQei13Gg9I9eXthgcBjqBSs3wqaKiLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285288; c=relaxed/simple;
	bh=6oCimQ81i3iJ2tB9rQv7XOudFnZoYFTg3njOnEDtoaA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Zj8qxdKOER1BcHYUbNEfU+34/HhzvdwwxJ1+URbl1kI/JrslCiwL2ZCI6Qa2fdWOj8icYU+O4c047asydMVs6c5FgYfI5BY612Fux2Cm1/ACKoiEMTxhQI9hRxgywhYiL+LldKcMFpIowg7NpoWqzksBSxZgtVueLxjCMEv/hqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wps5XYnc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wps5XYnc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C9EC2BCB4;
	Mon, 27 Apr 2026 10:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777285288;
	bh=6oCimQ81i3iJ2tB9rQv7XOudFnZoYFTg3njOnEDtoaA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Wps5XYnc1kdJqf09WN1Zfey0pTki4rmHJNDdICIw8GBnDCDrTFJWKpZYNSTK+GElb
	 F7QmQvtfyXePQvzTJf6cIwEnBeWQ+9CzFJW5190rbkIM8voOpoBEx487tVSAFnnmva
	 Bfxd7fplPVcezDbWE8FqjkKGC68ZH6Y3mQC98Mo2JPH4mCE9QnusPRapg/tOKPLee9
	 NXt97JVa/EgcuMPGImnEb2eglV6+7UAnxmN65xDOspFsfKyjUnd981Hqrr/p9Jq4ID
	 WeeTYzaQAnIldMP4QeHPiJ+edL0A6jFBctrvTS9sWQMDAhCVCN67XnC4lYKU6oBz6T
	 ta2oOR5QlJwfA==
From: Mark Brown <broonie@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev
In-Reply-To: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
References: <20260425-tas27xx-hwmon-fixes-v1-0-83c13b8e8f54@gmail.com>
Subject: Re: (subset) [PATCH 0/4] ASoC: tas27{64,70}: Fixes for hwmon
 temperature readout
Message-Id: <177724583534.266775.7120869912944867731.b4-ty@b4>
Date: Mon, 27 Apr 2026 08:23:55 +0900
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6oCimQ81i3iJ2tB9rQv7XOudFnZoYFTg3njOnEDtoaA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7zikqJUHJFUm8pxOEpfWUAPrqUkogAc8Ct5dA
 ZWTBUjf+I6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae84pAAKCRAk1otyXVSH
 0IexB/9lJHHg2EkeA4F8oTmyOyhLtB+2nvaBhuhdE6rwh2ziiDWs6ky28Yb89HnOIp+fjzZfKY3
 m3qiCw5XIfkbeQcJwVPNF8/tNZbOjnEwd55xiaZ5Euke0rxacJiiDc1CCx8srS/ovfaSaZZrNBk
 EHfvM38AmZpuLATUFlinxOkJ11cT+uPlZ7l4AHiR+ZZ2g43o3jg0dX9Cc1WkRis9imjzwc5EUf3
 EFYaNOsSB0mhO4ZqwvKbWhznrXQoqOCvFCLmDEPR7uMlN8ZqvfOVk/PGKeUho1IG+ewu/qe1o+k
 HiKamSUnrbJHT/P9V35SjdPbeGLIeH77u2bZWVAEy0+/AoNh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 25 Apr 2026 10:44:02 +1000, James Calligeros wrote:
> ASoC: tas27{64,70}: Fixes for hwmon temperature readout
> 
> Hi folks,
> 
> This series makes some fixes to the hwmon temperature reading
> functionality added as part of [1].
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/4] ASoC: tas2764: Mark die temp register as volatile
      https://git.kernel.org/broonie/sound/c/4cfb5971c2fb
[3/4] ASoC: tas2770: Fix order of operations for temperature calculation
      https://git.kernel.org/broonie/sound/c/c7ecb6a61908

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

