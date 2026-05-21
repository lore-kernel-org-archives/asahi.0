Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07523CE490;
	Fri, 22 May 2026 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445325; cv=none; b=rNhL4Ej8AmZZv/JCxjqq4/uFZpULggDQueajjX0PIRU2eN9d/MN8q/ndZjLSuL3DgV4uqWONZ6cZR5lwsygLDi4LxcRYfrQjm45LEqB5MC/9q3qyXAmEiJ0wReBU9/YZUMmm5Eyms1FJTeMN+hPKzxBXElhIP7gH2GNXgaussfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445325; c=relaxed/simple;
	bh=Q3EmgiS0xb2HZNxg/RftK2CygD26EtkORNTMm15D0f4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tSMe1HjYdZzGCLU9/d7ymMlwQrnSg6D0/7HLgqO5SFeNFtTAU5rNWbUbx592kz0QgYdNej42Q1ocmc3Y8wnh2Cy9YmMOKmn05MWVu/dC5u8PoeY/W1VMLRBljQuANJCR7ivEbg1h2LQDtM3RnKo5zowmPjE1wa59US7sfAMnYUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fkn3S8E2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fkn3S8E2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51AD91F000E9;
	Fri, 22 May 2026 10:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445322;
	bh=Xkp9iXSwBMxfkLoiFAco0YIr6FIaGNxMqOiskAens2w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fkn3S8E20iag5WUtkXqt10BtP9VOR3jHd2nrGXWdCeT76Esode9SfVrRhSL9j/Oqs
	 y7cS4qsN2oKytuOsy1WGnkxexcFbBgQZ6e7CFV+JiQiysCST8P9KuoEgKnO3Lrt0Ng
	 d4eU05l+KGH8o72bA7sD3KlNV+U49gJjZrCodYPz4ai/HaCt61G301WunHnQzBJnMq
	 7NbDKL6qoSPxegl8CVv1un/4SntbH6VTTh1wueKyTfFN29akfB8Tz3wJZUP+FQ3HTR
	 HjKnYGSo6Qmf9+5JacpJuF8ktiQ+KEJi/XDk1vcR9DZyvdg0A9/KYrzWplZOaWg81R
	 N0OWVsriMO5FQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Oder Chiou <oder_chiou@realtek.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Support Opensource <support.opensource@diasemi.com>, 
 Nick Li <nick.li@foursemi.com>, M R Swami Reddy <mr.swami.reddy@ti.com>, 
 Vishwas A Deshpande <vishwas.a.deshpande@ti.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Fabio Estevam <festevam@gmail.com>, Kiseok Jo <kiseok.jo@irondevice.com>, 
 Kevin Cernekee <cernekee@chromium.org>, 
 Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
 Thorsten Blum <thorsten.blum@linux.dev>, 
 Chris Morgan <macromorgan@hotmail.com>, 
 Marco Crivellari <marco.crivellari@suse.com>, 
 Weidong Wang <wangweidong.a@awinic.com>, 
 Aaron Kling <webgeek1234@gmail.com>, Teguh Sobirin <teguh@sobir.in>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>, 
 Hsieh Hung-En <hungen3108@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Shimrra Shai <shimrrashai@gmail.com>, Zhang Yi <zhangyi@everest-semi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Qasim Ijaz <qasdev00@gmail.com>, Sharique Mohammad <sharq0406@gmail.com>, 
 Chen Ni <nichen@iscas.ac.cn>, Neo Chang <YLCHANG2@nuvoton.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Kees Cook <kees@kernel.org>, Qianfeng Rong <rongqianfeng@vivo.com>, 
 Tim Bird <tim.bird@sony.com>, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>, 
 Peter Korsgaard <peter@korsgaard.com>, Linus Walleij <linusw@kernel.org>, 
 Wenyuan Li <2063309626@qq.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Xichao Zhao <zhao.xichao@vivo.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Peter Rosin <peda@lysator.liu.se>, Dan Carpenter <error27@gmail.com>
In-Reply-To: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
References: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1 0/2] ASoC: Rework initialization of i2c_device_ids
Message-Id: <177936315178.58022.6647400711614620844.b4-ty@b4>
Date: Thu, 21 May 2026 12:32:31 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Q3EmgiS0xb2HZNxg/RftK2CygD26EtkORNTMm15D0f4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqEC4+xfmyychPuCUwk/jiLXspmo/BcLb856BbX
 308jyaWUsiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCahAuPgAKCRAk1otyXVSH
 0AzCB/0ZVReZqZGERUELDL4MyBklwJcxn2eozuE4QgHL/zTKaedA/xJb7gGN9GSz8PaH8EvPZ3/
 G7ADNjyOLY1H1oAJLKTP0vfM1KuRNwUuB720DV/dtITwL49AmQ7lPgQbXUTSW84RRNo+ZZxdXUy
 DEmEAgmH+IHk0wi6M7ZeHVKyyevKUvEr1Mrg+MGzHAQSAFSGNLgOyvyDKIuod66cT+531JOSSnr
 bAGE0YgBWc8EqBIXsbSDJ7/Cyob/0FEKMKu2xkrq+qhNDMNJAC2fMv+8BgapN6/e+1uJAAaHjQC
 Jr68ZQFKhKJRw6zWX8KedYHp6/QESUgrzn4TCVaNVf0C5GwS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 13 May 2026 19:23:02 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> ASoC: Rework initialization of i2c_device_ids
> 
> Hello,
> 
> this series is a preparation for
> 
> 	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> 	index 23ff24080dfd..aebd3a5e90af 100644
> 	--- a/include/linux/mod_devicetable.h
> 	+++ b/include/linux/mod_devicetable.h
> 	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/2] ASoC: Drop empty i2c remove callbacks
      https://git.kernel.org/broonie/sound/c/2e0389f3689c
[2/2] ASoC: Use named initializers for arrays of i2c_device_data
      https://git.kernel.org/broonie/sound/c/910714d4e79b

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

