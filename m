Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA0741CB4C;
	Tue, 14 Jul 2026 21:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784064258; cv=none; b=fjH4HE207u0Jc2zD1s9cplvJoxydcqcFfOwr0I1/OM31gaa2qKoDWPvJkfoVLCVm4b3uoA0Of9u0pV2BYp8kHhSl54/2Ho5tEgxAQVM7b3/URGU52DBVhkBWFXfrh5MQz8zIlC1x5tNvWXboGIK8HPE8NudKAIbw1REGofL+LSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784064258; c=relaxed/simple;
	bh=5J+8x5cP67a5bW2eICKJ/SVuzEbFNwtvCWU8QnU2AjQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HrJNPh3wUt8AwT9RIuJeggCUvdvNG9JOaRaIvJA0Ba/EHDLP3r164/HtDBWqutm3caZF29RF2t8EW65gzY9vWMIjUuWw/8y3teoqxvkscyVWbr5JxGnA8JocHDix0MB6yUaqYnxiyL+38om6okrmXIroM5F2B9Ir3w6Rci9g2X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MBaWuvlD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MBaWuvlD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0772F1F00A3A;
	Tue, 14 Jul 2026 21:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784064257;
	bh=F6GUstE40smkqjKEvWWvd2FWAnyj7XXV63ur3oYmDn0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MBaWuvlDNfyJ/x3C/hN+zHBXT68fit/oeWlJVQEXYCtbBT5WzhOx64388XzyD5Ukz
	 68n56+dqSZ8QG5IBimmeeXC5rk2LGD52N+PY2PB0djH6VB4H6lGASwUfQV5PeTml4o
	 xcx/98+ZbjE+6SohrUBVhUGiaYBtq+6Y5Lf8JYySrbFVB0JMsK6qdpL3Jr8/5LH0vf
	 H9ujsTnSQF26LtbZjHcqwYoxPJcMqeJfG9aXLoiGPNeYEGsGRG8bBtQRIH9e8WYaOs
	 8Z+4Pq4lVkOsZ+Z/I2C8aRzGwGBWei5bp0qHucH99MG2ntmdMVRstQgBByL8GIkqvK
	 3guNfGIAOvJ9g==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Cheng-Yi Chiang <cychiang@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Benson Leung <bleung@chromium.org>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, povik+lin@cutebit.org, 
 u.kleine-koenig@baylibre.com, kuninori.morimoto.gx@renesas.com, 
 christian.ehrhardt@codasip.com, Linus Walleij <linusw@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thorsten Blum <thorsten.blum@linux.dev>, 
 Chris Morgan <macromorgan@hotmail.com>, Dan Carpenter <error27@gmail.com>, 
 Marco Crivellari <marco.crivellari@suse.com>, 
 Rosen Penev <rosenp@gmail.com>, Weidong Wang <wangweidong.a@awinic.com>, 
 Teguh Sobirin <teguh@sobir.in>, Val Packett <val@packett.cool>, 
 Luca Weiss <luca.weiss@fairphone.com>, wangdicheng <wangdicheng@kylinos.cn>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com, chrome-platform@lists.linux.dev, 
 asahi@lists.linux.dev, Cezary Rojewski <cezary.rojewski@intel.com>
In-Reply-To: <20260708125002.202515-1-phucduc.bui@gmail.com>
References: <20260708125002.202515-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v4 00/24] ASoC: codecs: Use guard() for mutex & spin
 lock - part 1
Message-Id: <178402971474.7661.12638019222593752211.b4-ty@b4>
Date: Tue, 14 Jul 2026 12:48:34 +0100
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4164; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5J+8x5cP67a5bW2eICKJ/SVuzEbFNwtvCWU8QnU2AjQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqVqj6a1iytHUEZUl5+SQm8F7VJWON07lqVPma9
 VgOjULeqsCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalao+gAKCRAk1otyXVSH
 0BrzB/9zOPrSoY4NHz7RW+3P59Pe8GBIl96K+JcMZkK2wJ87zlF07+ToPXXFaKpyiJ1CfZrLtpG
 37wUPhJ2aXKcNd83m5Uyx8SD+eVxYn7O6gdcxaRzuQgNtWFWdhSUD4fP2pmZ3SkjlUH+pCrDBti
 Rau9SXdEH7SpJEsNpxYOTjniAlwaOcE0rc7QAohvE+ydgYMzc4g1e0+ZvXcejQ604i0FYbgO4YA
 zsMadyZbrnjZNUg7kK4iYuhgPx+VZU1pD0aYelELD0qOIYbYqivgysAVypxZFfR6xIVHqQMS9i7
 gLOirMik5cQYNRKa8OFWtpxJNbFPhzcIFnOGwdrmL1mOzQPH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Wed, 08 Jul 2026 19:49:37 +0700, phucduc.bui@gmail.com wrote:
> ASoC: codecs: Use guard() for mutex & spin lock - part 1
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts mutex and spinlock handling in ASoC codec drivers
> to use the guard() and scoped_guard() helpers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.3

Thanks!

[01/24] ASoC: codecs: ab8500: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/350b7eae8e8b
[02/24] ASoC: codecs: ak4613: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/da41b1716fad
[03/24] ASoC: codecs: arizona-jack: Use guard() cleanup helpers
        https://git.kernel.org/broonie/sound/c/d46421aeac5a
[04/24] ASoC: codecs: arizona: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/fa58edfcce1c
[05/24] ASoC: codecs: aw87390: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/95cc462fe421
[06/24] ASoC: codecs: aw88081: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/9c3035088593
[07/24] ASoC: codecs: aw88166: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/a0c8cd0ecfe7
[08/24] ASoC: codecs: aw88261: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/9d8e98091f5a
[09/24] ASoC: codecs: aw88395: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/6699b73f0080
[10/24] ASoC: codecs: aw88399: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/49204ed80350
[11/24] ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/35150d26cb41
[12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/53651103db92
[13/24] ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
        https://git.kernel.org/broonie/sound/c/fa08036d5d5b
[14/24] ASoC: codecs: cs42l42: Use guard() cleanup helpers
        https://git.kernel.org/broonie/sound/c/6e982e8f5a23
[15/24] ASoC: codecs: cs42l43: Use guard() and PM runtime scope helpers
        https://git.kernel.org/broonie/sound/c/d1b5d20f53df
[16/24] ASoC: codecs: cs42l84: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/2f952d2ff5f2
[17/24] ASoC: codecs: cs43130: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/e6eb5e269d88
[18/24] ASoC: codecs: cs47l15: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/a97c200c2fed
[19/24] ASoC: codecs: cs47l35: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/db698e37213b
[20/24] ASoC: codecs: cs47l85: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/cea70877a2a1
[21/24] ASoC: codecs: cs47l90: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/1b681fda5e51
[22/24] ASoC: codecs: cs47l92: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/f452b00f97ce
[23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/6ced86b1e21b
[24/24] ASoC: codecs: cx2072x: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/1b302f955ecb

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

