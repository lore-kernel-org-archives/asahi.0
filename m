Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840D4231A41;
	Mon, 16 Mar 2026 01:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773625057; cv=none; b=HAT142LXPFiGYCreRLdwkxQNJ0wfZqysbkjU7KaWTnEvAynsZ/DertuxCB0SoL7an+rj70HMsV41WRc1NkDZRUnsPzXX/SUekQR3ZsjRRqtzcQjC4QX7jGjP1mC2VXsGuauFELvdLh9RBQIVTKsozrGa/BGlOmllPTZiJjS762o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773625057; c=relaxed/simple;
	bh=A9rEb2IEckfnXsbwv5XiP675av+TQ/D0j01/OowheSQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Sgcl0GDZAsuRmyXxDlZC2Xq7NKtZWDwx+EthaoIrfIKwst4X/ixtLrEcERzB7SKcyDlmDgH/f9AEi5tJdxGmYK+Y8GkUx2EskkuHxs00Z4V5uSUWLCa5uEltwZMJ9WiiNsYcFqCNT5uU+35K4Z5DMhJvhm03iGNlVp2fUXiO5jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J5oWAq/e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J5oWAq/e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20231C4CEF7;
	Mon, 16 Mar 2026 01:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773625057;
	bh=A9rEb2IEckfnXsbwv5XiP675av+TQ/D0j01/OowheSQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=J5oWAq/eq51bLsJwCaUGB5kxWFoau54Zi7X0awrFGrF4WZsSTXfybBfFMLrHdmdZQ
	 JeuYYAEfX4/s833ZsJVAhRuN1oUwTShbU7Q3GeK45+U9R9oG87xRQxtnW2+1oVOmnx
	 ykAQ6ATv2lcVmmAhDvOf7hk5yuMKCxR2P3Zcf7gom9SA+ZHSQARntL8axWg3dvxUGi
	 SyTWtxuxonXYFdLT5uEM7Te5xGSapdRE1JQhk8x/Ae3ozNWV+bqTvMBs5TBHv9ieZl
	 V1EG8f75bgk4HF/ER85F/TexxHDyJ5uybByH5X6cTo0WZZpmloUobFKAbcf2glNbdD
	 0bRY/ZiYzSgvw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>, James Calligeros <jcalligeros99@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev
In-Reply-To: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
Subject: Re: [PATCH v3 0/7] ASoC: basic support for configuring bus keepers
Message-Id: <177362359868.208027.1594556804102192049.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 01:13:18 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-5154a
X-Developer-Signature: v=1; a=openpgp-sha256; l=2277; i=broonie@kernel.org;
 h=from:subject:message-id; bh=A9rEb2IEckfnXsbwv5XiP675av+TQ/D0j01/OowheSQ=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhsztcbebHU5VSx8Kde3Sz1fWymh/t6vr9PqEyxm6DxReN
 SU53+3oZDRmYWDkYpAVU2RZ+yxjVXq4xNb5j+a/ghnEygQyhYGLUwAmsuUSB0PjQ0OpHTydm7rm
 m/AuemRdkN322N3r65F9Db61fW4NG5anng9z/7fd5X7YRdZTJWoS0i2+rmmrbmaIT+Nh3xP/UHe
 2xjv+iU8+xxp4LDPoX2wV3LjkU5Tent0qe5vv/Wd4fTjkdure1DYR/9kGsuGPeAXfsjSXvGbedc
 tUxrmk5/i0p2kTHPhvWQgbl8f5Hrf2e9fCYKNx9qfuntRn38L/hYRvZr+e8OhxfnXgRKfkQ81s7
 B/eXOOKUnl3Y4bJMf981qPauRO9U6albTTY9PJFsYsUT73Tda0XufOLW1Wmnt7Y43fJU+HYr09i
 iZ3V/UlOkRMyyzgfXN+7LciGfaWKO6/aYY7o8vnO+iEdAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sun, 01 Mar 2026 18:05:19 +1000, James Calligeros wrote:
> ASoC: basic support for configuring bus keepers
> 
> Hi all,
> 
> This series introduces some infrastructure to allow platform drivers
> to specify what a DAI should be doing when it is not active on the
> bus. The primary use case for this is configuring bus keepers which
> may be integrated into various codecs. The instigating use case for
> this functionality is an interesting bus topology on Apple Silicon
> laptops with multiple codecs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/7] ASoC: dt-bindings: convert tdm-slot to YAML
      https://git.kernel.org/broonie/sound/c/5273cb8197d8
[2/7] ASoC: dt-bindings: update tdm-slot.txt references to tdm-slot.yaml
      https://git.kernel.org/broonie/sound/c/cc74890fb484
[3/7] ASoC: dt-bindings: add TDM slot idle mode properties
      https://git.kernel.org/broonie/sound/c/938c1ed56ab8
[4/7] ASoC: soc-dai: define possible idle TDM slot modes
      https://git.kernel.org/broonie/sound/c/7d8632f1ef6c
[5/7] ASoC: soc-dai: add common operation to set TDM idle mode
      https://git.kernel.org/broonie/sound/c/b758d3574e88
[6/7] ASoC: tas2764: expose SDOUT bus keeper via set_tdm_idle operation
      https://git.kernel.org/broonie/sound/c/45573ee1f2ba
[7/7] ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle
      https://git.kernel.org/broonie/sound/c/af176d0787d2

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

