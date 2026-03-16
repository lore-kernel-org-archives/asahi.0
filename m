Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220FB33B95A;
	Mon, 16 Mar 2026 17:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683557; cv=none; b=H9hfBRK0fyqdNwTioeePi1cyxLZZ3GTeK7Ron3bg4G6ijB57PdLsj0/Mq6nh+dlwcJENb94ijLoXXxgR6JzO+yuhJRDrbKNcoif464ERA9qXwRTIMAqzMgpxH8K3ql2K6y1kJ9SrTJbxYJch3AgC+Yz4Zw9C741B+DJwrHX/TT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683557; c=relaxed/simple;
	bh=1pb1aqms/tuAEyqtaZxNHK+BnZRWUIA63kS7sxzCYdM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uMf48ixcnQZz/PKFu0d+Jhuw29x8JdIHaCDcl6mdf/uWt05FcVM+aulUzPZrhT7JeyXKht7soCkmrZDj2CJBC6lZjk90nv9Wvwg7hWlY6Rnvo8JyipWMnXXimZ7nBY+7WAf15t8s+mAEQs2Fc+8138eT9YOV8BenkfJIt9JRn8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=euzR0jWn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="euzR0jWn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3315C19425;
	Mon, 16 Mar 2026 17:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683556;
	bh=1pb1aqms/tuAEyqtaZxNHK+BnZRWUIA63kS7sxzCYdM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=euzR0jWn68jPTGaqoZ1uLi6HDtCmQpCqd1SknY0547474UQR5dAIDOaEQv6In5cM1
	 8/QT8JrXVyf/IZ8cqE6AuW5eEJB+GGcbhiotXovgoi4nvk7jIGeitlCy9KmyipZltP
	 TNN6ZczPf8PKKGakm3QTN+fzlCqPeyawMingXLgcML7Vlja9AfqXTC0t+peiWmJJmz
	 1B6fplGKDB8aiaeUfDzFVl6NUJpmRRmKDp9EVlLk/f30ZcgIxi1tpaV6pqQlhF5CiX
	 XooQGmqDJ+ZHMYl9R4T1MtL1bhSWq23yxZiY0npEEzmmzZP/RrVePipVUkXdgnPajx
	 UoSpLEEbxNTOQ==
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
Message-Id: <177368355239.146755.11297173748459835851.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 17:52:32 +0000
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c239c

On Sun, 01 Mar 2026 18:05:19 +1000, James Calligeros wrote:
> This series introduces some infrastructure to allow platform drivers
> to specify what a DAI should be doing when it is not active on the
> bus. The primary use case for this is configuring bus keepers which
> may be integrated into various codecs. The instigating use case for
> this functionality is an interesting bus topology on Apple Silicon
> laptops with multiple codecs.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: dt-bindings: convert tdm-slot to YAML
      https://git.kernel.org/broonie/misc/c/5273cb8197d8
[2/7] ASoC: dt-bindings: update tdm-slot.txt references to tdm-slot.yaml
      https://git.kernel.org/broonie/misc/c/cc74890fb484
[3/7] ASoC: dt-bindings: add TDM slot idle mode properties
      https://git.kernel.org/broonie/misc/c/938c1ed56ab8
[4/7] ASoC: soc-dai: define possible idle TDM slot modes
      https://git.kernel.org/broonie/misc/c/7d8632f1ef6c
[5/7] ASoC: soc-dai: add common operation to set TDM idle mode
      https://git.kernel.org/broonie/misc/c/b758d3574e88
[6/7] ASoC: tas2764: expose SDOUT bus keeper via set_tdm_idle operation
      https://git.kernel.org/broonie/misc/c/45573ee1f2ba
[7/7] ASoC: tas2770: expose SDOUT bus keeper via set_tdm_idle
      https://git.kernel.org/broonie/misc/c/af176d0787d2

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

