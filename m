Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67E23FD13D
	for <asahi@lists.linux.dev>; Wed, 13 May 2026 17:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693018; cv=none; b=UE6gLdfrSzWSuwbilrgYxZ2W4nN824wwYIOG0ejfTKu9jlHS6q0/Zh6lvYSNZ4cUOc5rncRrhTzExE90IAeovM/89BZS4sdr5oLrSIJaBLfepkkKJiUglowo4atz6iMZXvp7yLVVNGDDqMs9L4xzjpkRFNnIlcXNDWkCZLnizVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693018; c=relaxed/simple;
	bh=qYlOFAJXuOYPmd3JoMjk/y4DIovRZShtOYeJbYplWnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eWUqpFUBMTjPnstx0udYtrW6DUdBsldjzY43yJBPTci3K1fgshSH/b74ldl67GRh9GY4aiV11iZPIbnjeCTNavHOKT/MBBs+GAmiu5Qiz8R9mCZdtg6S+5nz/ucjoW5ePUJupsXoUQSTqvjWGq2mOXtcrcrcRkD6xHAoKoFTRpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=Oj0fDtB6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="Oj0fDtB6"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43fe62837baso3726798f8f.3
        for <asahi@lists.linux.dev>; Wed, 13 May 2026 10:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778693001; x=1779297801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YGgzMaaB2zSQiAE3VwgU0VCO9U6lYsYZJa+VV7VlNmM=;
        b=Oj0fDtB6lrNoeqsFLYQnlTNnukCfeE0L80pznDF8zB2wvDWQliecegGZw4fqQaHtMv
         f+IxFmG87xxWDdti4VDNGxOt1qYXD1aC17/cyjuiHSwclaemrgRe3Q3+nwv0JUx2P9af
         0K4R0qo3vk6Ib4GU3vjIapIAvvPcSyiYuNaeiI0vbElra+rwLvxm7qEFlmkDI9oPb32l
         7NNbUojHYw4ajzj442qaZqcUEZLmDr5bi/borqXqcb7IUtgLIwzvVLTP9u9viO+VZphK
         HP147ajNj1GsbAXoe0HaA9JJBYl47caQONH0frgJGcQyX0DJ1JTYrEdMYpAYAh3y4HM2
         u+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693001; x=1779297801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YGgzMaaB2zSQiAE3VwgU0VCO9U6lYsYZJa+VV7VlNmM=;
        b=GdA8BTjzFFaWmWaE7YJp9LsshwKUUE8pqGpisaHtdDtF3xYVWQNYMbtz45MxgMXXeV
         KR8GG7UOMtoZIf0iM/NB8LvrG9S8DbPej4I8dg28R9Cmt158GoyFZDk+bccLChO4WCHY
         I7q/OJLTd1DArazfbBifs4m9fIvcYQ5C0NV80+LtDoKLAbS5A9IHqOWBw81mf/+VlnSq
         AsU4IidxbQRf/ejD47sS5vd5pqvXCyFwsk6AQLZnhmGFAUb9Kw7zS+qEi5EtNbyGt0GO
         480KnTJovJQklH3pC19QPGs/3PliyOJZxFdPAaosyazIKGtwwLGE/VFYrpOSSIXjqi3E
         tygg==
X-Forwarded-Encrypted: i=1; AFNElJ+YUl7LNkqIdZ5y9d3JFfhTY4Ri8VhHXWglhvhXjJEbcdUtGfs2O6BL8ewyMpbvKQjnZTds3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YywcTGeY97KTPRh/IA3FtsmxhNS2yFxzFRA6nsiw3AG1X630jgm
	TMk5xscL2wBUa1WuexO9D1wzoK419cQYOObwBKx3n9C8pZmDAborffR1t/Smbx7JH98=
X-Gm-Gg: Acq92OFGooWNv5DgNVgEGRgwfSqe0DA2aBKJBQakx4kKSmgsZpyxMFwanHZ9ng9Kz0e
	Z1JjSEfR8M9kLjBQ9xc73qzppOILebjh1Fw63Kdpe2HXWlRyw3V3cNfYYMA6uwOGbzXns2k7OCB
	kqnXVD++HhF09c+Fd5g5Oxu+bhZwULDp/Qcwk2wkzX2uM9CXwx2Kl5zh8ZqIkqQhtCOWZ4wBzMR
	sWH0iWOYqvZ9UarB4VT+4FzCUr4homi2lXA99FnC4tGzT2sYFjLvp59a4gWvuHdWse1+VVx2sAr
	ye/hgfExSjcMauLa7tUXkDPal/ZQ3SQso7U0Cc72djvEEd4ps82LjsGAzDLdB3KQUtLFQ9QbP+P
	Ha+En7rHPFKc+q/rjU0QbIsVf0NBI1wdC588c73a+8BewindTNAT77zwsjpGBq5Ec5ZBNdL5ehX
	c6xkvux8f7sYJP4x9gSxuVIzIwgMHQoNfqct5hzVeDuRgO3jVq56BIRyczWyvUGXxFM3EJcyaRp
	PAct7KzHa44hT8=
X-Received: by 2002:a5d:5d13:0:b0:44b:9dca:7d93 with SMTP id ffacd0b85a97d-45c5a1a90cfmr6872092f8f.26.1778693000108;
        Wed, 13 May 2026 10:23:20 -0700 (PDT)
Received: from localhost (p200300f65f47db04379dbd4376e53036.dip0.t-ipconnect.de. [2003:f6:5f47:db04:379d:bd43:76e5:3036])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da0a19c2dsm266194f8f.21.2026.05.13.10.23.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:23:19 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	=?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	M R Swami Reddy <mr.swami.reddy@ti.com>,
	Vishwas A Deshpande <vishwas.a.deshpande@ti.com>,
	Peter Rosin <peda@axentia.se>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Fabio Estevam <festevam@gmail.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>,
	Kevin Cernekee <cernekee@chromium.org>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Aaron Kling <webgeek1234@gmail.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bharadwaj Raju <bharadwaj.raju@machinesoul.in>,
	Hsieh Hung-En <hungen3108@gmail.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Shimrra Shai <shimrrashai@gmail.com>,
	Zhang Yi <zhangyi@everest-semi.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Qasim Ijaz <qasdev00@gmail.com>,
	Sharique Mohammad <sharq0406@gmail.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Neo Chang <YLCHANG2@nuvoton.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Kees Cook <kees@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Tim Bird <tim.bird@sony.com>,
	Bram Vlerick <bram.vlerick@openpixelsystems.org>,
	Peter Korsgaard <peter@korsgaard.com>,
	Linus Walleij <linusw@kernel.org>,
	Wenyuan Li <2063309626@qq.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Xichao Zhao <zhao.xichao@vivo.com>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 2/2] ASoC: Use named initializers for arrays of i2c_device_data
Date: Wed, 13 May 2026 19:23:04 +0200
Message-ID:  <ae2ff4898eb340bd8bcafb7b75443eb4a0ce3e76.1778692164.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
References: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=109669; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=qYlOFAJXuOYPmd3JoMjk/y4DIovRZShtOYeJbYplWnE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqBLN7gDwSWV2uG4Y4HTmyw5b6G2U56eC1FTooH 3mh7y7JqmKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagSzewAKCRCPgPtYfRL+ TqDFCACdFvqLdhVWx4ASVJ4CoQkmV7Jv9qs1XCWT+PxjxXPuUkep3bFnanycFsCSWG10jsAJoVu ZjPq/v5KCrFV8EOs+p9mcRLEGEManTWabPXEyxuO434mtgBfRbja8zTBV5BuFYI8OWsYPZ9nd09 VYuQr5CqKTcVOc3W4rQrkGbo2lhoIS/SgZ0Q+XsqDcVNtceIZYQk0K39sW7osSUZ36gOXP8G6Lf kJLuW/uFnhZOyV+DSEuG9POup75ofNAy2polSnRTf6/sF2ln8Cj30JUxsnZ4JnD+8KGVEqMeqBT tetbzKvKM3O7m59eFwVdROFz9Fc8c7ABWcVStyI5QL/RNzgf
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
i2c_device_id that replaces .driver_data by an anonymous union.

While touching all these arrays, unify indention and usage of commas.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 .../hda/codecs/side-codecs/cs35l41_hda_i2c.c  |  4 +-
 .../hda/codecs/side-codecs/cs35l56_hda_i2c.c  |  8 ++--
 .../hda/codecs/side-codecs/tas2781_hda_i2c.c  |  4 +-
 sound/soc/codecs/ad193x-i2c.c                 |  4 +-
 sound/soc/codecs/adau1372-i2c.c               |  2 +-
 sound/soc/codecs/adau1373.c                   |  2 +-
 sound/soc/codecs/adau1701.c                   |  8 ++--
 sound/soc/codecs/adau1761-i2c.c               |  8 ++--
 sound/soc/codecs/adau1781-i2c.c               |  4 +-
 sound/soc/codecs/adau1977-i2c.c               |  6 +--
 sound/soc/codecs/adau7118-i2c.c               |  4 +-
 sound/soc/codecs/adav803.c                    |  2 +-
 sound/soc/codecs/ak4118.c                     |  4 +-
 sound/soc/codecs/ak4535.c                     |  2 +-
 sound/soc/codecs/ak4613.c                     |  2 +-
 sound/soc/codecs/ak4619.c                     |  2 +-
 sound/soc/codecs/ak4642.c                     |  8 ++--
 sound/soc/codecs/ak4671.c                     |  2 +-
 sound/soc/codecs/alc5623.c                    |  8 ++--
 sound/soc/codecs/alc5632.c                    |  4 +-
 sound/soc/codecs/aw87390.c                    |  4 +-
 sound/soc/codecs/aw88081.c                    |  4 +-
 sound/soc/codecs/aw88166.c                    |  2 +-
 sound/soc/codecs/aw88261.c                    |  2 +-
 sound/soc/codecs/aw88395/aw88395.c            |  2 +-
 sound/soc/codecs/aw88399.c                    |  2 +-
 sound/soc/codecs/cs35l32.c                    |  4 +-
 sound/soc/codecs/cs35l33.c                    |  4 +-
 sound/soc/codecs/cs35l34.c                    |  4 +-
 sound/soc/codecs/cs35l35.c                    |  4 +-
 sound/soc/codecs/cs35l36.c                    |  4 +-
 sound/soc/codecs/cs35l41-i2c.c                | 10 ++---
 sound/soc/codecs/cs35l45-i2c.c                |  4 +-
 sound/soc/codecs/cs35l56-i2c.c                |  6 +--
 sound/soc/codecs/cs4265.c                     |  2 +-
 sound/soc/codecs/cs4270.c                     |  4 +-
 sound/soc/codecs/cs4271-i2c.c                 |  2 +-
 sound/soc/codecs/cs42l42-i2c.c                |  4 +-
 sound/soc/codecs/cs42l51-i2c.c                |  2 +-
 sound/soc/codecs/cs42l52.c                    |  2 +-
 sound/soc/codecs/cs42l56.c                    |  2 +-
 sound/soc/codecs/cs42l73.c                    |  4 +-
 sound/soc/codecs/cs42l84.c                    |  4 +-
 sound/soc/codecs/cs42xx8-i2c.c                |  6 +--
 sound/soc/codecs/cs43130.c                    | 10 ++---
 sound/soc/codecs/cs4341.c                     |  2 +-
 sound/soc/codecs/cs4349.c                     |  4 +-
 sound/soc/codecs/cs530x-i2c.c                 | 14 +++---
 sound/soc/codecs/cs53l30.c                    |  4 +-
 sound/soc/codecs/cx2072x.c                    |  6 +--
 sound/soc/codecs/da7210.c                     |  2 +-
 sound/soc/codecs/da7213.c                     |  2 +-
 sound/soc/codecs/da7218.c                     |  4 +-
 sound/soc/codecs/da7219.c                     |  2 +-
 sound/soc/codecs/da732x.c                     |  2 +-
 sound/soc/codecs/da9055.c                     |  2 +-
 sound/soc/codecs/es8311.c                     |  2 +-
 sound/soc/codecs/es8316.c                     |  4 +-
 sound/soc/codecs/es8323.c                     |  2 +-
 sound/soc/codecs/es8326.c                     |  4 +-
 sound/soc/codecs/es8328-i2c.c                 |  4 +-
 sound/soc/codecs/es8375.c                     |  2 +-
 sound/soc/codecs/es8389.c                     |  2 +-
 sound/soc/codecs/fs210x.c                     |  6 +--
 sound/soc/codecs/isabelle.c                   |  2 +-
 sound/soc/codecs/lm4857.c                     |  2 +-
 sound/soc/codecs/lm49453.c                    |  2 +-
 sound/soc/codecs/max9768.c                    |  2 +-
 sound/soc/codecs/max98088.c                   |  4 +-
 sound/soc/codecs/max98090.c                   |  4 +-
 sound/soc/codecs/max98095.c                   |  2 +-
 sound/soc/codecs/max98371.c                   |  2 +-
 sound/soc/codecs/max98373-i2c.c               |  4 +-
 sound/soc/codecs/max98388.c                   |  4 +-
 sound/soc/codecs/max98390.c                   |  4 +-
 sound/soc/codecs/max98396.c                   |  6 +--
 sound/soc/codecs/max9850.c                    |  2 +-
 sound/soc/codecs/max98504.c                   |  2 +-
 sound/soc/codecs/max98520.c                   |  4 +-
 sound/soc/codecs/max9860.c                    |  2 +-
 sound/soc/codecs/max9867.c                    |  2 +-
 sound/soc/codecs/max9877.c                    |  2 +-
 sound/soc/codecs/max98925.c                   |  2 +-
 sound/soc/codecs/max98926.c                   |  2 +-
 sound/soc/codecs/max98927.c                   |  4 +-
 sound/soc/codecs/ml26124.c                    |  2 +-
 sound/soc/codecs/mt6660.c                     |  4 +-
 sound/soc/codecs/nau8325.c                    |  2 +-
 sound/soc/codecs/nau8540.c                    |  2 +-
 sound/soc/codecs/nau8810.c                    |  6 +--
 sound/soc/codecs/nau8821.c                    |  2 +-
 sound/soc/codecs/nau8822.c                    |  2 +-
 sound/soc/codecs/nau8824.c                    |  2 +-
 sound/soc/codecs/nau8825.c                    |  2 +-
 sound/soc/codecs/ntp8835.c                    |  4 +-
 sound/soc/codecs/ntp8918.c                    |  4 +-
 sound/soc/codecs/pcm1681.c                    |  4 +-
 sound/soc/codecs/pcm1789-i2c.c                |  2 +-
 sound/soc/codecs/pcm179x-i2c.c                |  2 +-
 sound/soc/codecs/pcm186x-i2c.c                |  8 ++--
 sound/soc/codecs/pcm3168a-i2c.c               |  2 +-
 sound/soc/codecs/pcm512x-i2c.c                | 14 +++---
 sound/soc/codecs/pcm6240.c                    | 44 +++++++++----------
 sound/soc/codecs/rt1011.c                     |  2 +-
 sound/soc/codecs/rt1015.c                     |  2 +-
 sound/soc/codecs/rt1016.c                     |  2 +-
 sound/soc/codecs/rt1019.c                     |  2 +-
 sound/soc/codecs/rt1305.c                     |  4 +-
 sound/soc/codecs/rt1308.c                     |  2 +-
 sound/soc/codecs/rt1318.c                     |  2 +-
 sound/soc/codecs/rt274.c                      |  4 +-
 sound/soc/codecs/rt286.c                      |  6 +--
 sound/soc/codecs/rt298.c                      |  4 +-
 sound/soc/codecs/rt5514.c                     |  2 +-
 sound/soc/codecs/rt5575.c                     |  2 +-
 sound/soc/codecs/rt5616.c                     |  2 +-
 sound/soc/codecs/rt5631.c                     |  4 +-
 sound/soc/codecs/rt5640.c                     |  6 +--
 sound/soc/codecs/rt5645.c                     |  4 +-
 sound/soc/codecs/rt5651.c                     |  2 +-
 sound/soc/codecs/rt5659.c                     |  4 +-
 sound/soc/codecs/rt5660.c                     |  2 +-
 sound/soc/codecs/rt5663.c                     |  4 +-
 sound/soc/codecs/rt5665.c                     |  4 +-
 sound/soc/codecs/rt5668.c                     |  4 +-
 sound/soc/codecs/rt5670.c                     |  6 +--
 sound/soc/codecs/rt5677.c                     |  2 +-
 sound/soc/codecs/rt5682-i2c.c                 |  4 +-
 sound/soc/codecs/rt5682s.c                    |  4 +-
 sound/soc/codecs/sgtl5000.c                   |  4 +-
 sound/soc/codecs/sma1303.c                    |  4 +-
 sound/soc/codecs/sma1307.c                    |  4 +-
 sound/soc/codecs/src4xxx-i2c.c                |  2 +-
 sound/soc/codecs/ssm2518.c                    |  2 +-
 sound/soc/codecs/ssm2602-i2c.c                |  6 +--
 sound/soc/codecs/ssm4567.c                    |  2 +-
 sound/soc/codecs/sta32x.c                     |  6 +--
 sound/soc/codecs/sta350.c                     |  2 +-
 sound/soc/codecs/sta529.c                     |  2 +-
 sound/soc/codecs/tas2552.c                    |  2 +-
 sound/soc/codecs/tas2562.c                    |  6 +--
 sound/soc/codecs/tas2764.c                    |  2 +-
 sound/soc/codecs/tas2770.c                    |  2 +-
 sound/soc/codecs/tas2780.c                    |  2 +-
 sound/soc/codecs/tas2781-i2c.c                | 42 +++++++++---------
 sound/soc/codecs/tas5086.c                    |  2 +-
 sound/soc/codecs/tas571x.c                    | 14 +++---
 sound/soc/codecs/tas5720.c                    |  6 +--
 sound/soc/codecs/tas5805m.c                   |  2 +-
 sound/soc/codecs/tas6424.c                    |  2 +-
 sound/soc/codecs/tda7419.c                    |  2 +-
 sound/soc/codecs/tfa9879.c                    |  2 +-
 sound/soc/codecs/tlv320adc3xxx.c              |  6 +--
 sound/soc/codecs/tlv320adcx140.c              |  8 ++--
 sound/soc/codecs/tlv320aic23-i2c.c            |  4 +-
 sound/soc/codecs/tlv320aic31xx.c              | 16 +++----
 sound/soc/codecs/tlv320aic32x4-i2c.c          |  6 +--
 sound/soc/codecs/tlv320aic3x-i2c.c            | 10 ++---
 sound/soc/codecs/ts3a227e.c                   |  2 +-
 sound/soc/codecs/tscs42xx.c                   |  4 +-
 sound/soc/codecs/tscs454.c                    |  2 +-
 sound/soc/codecs/uda1342.c                    |  2 +-
 sound/soc/codecs/uda1380.c                    |  2 +-
 sound/soc/codecs/wm1250-ev1.c                 |  2 +-
 sound/soc/codecs/wm2000.c                     |  2 +-
 sound/soc/codecs/wm2200.c                     |  2 +-
 sound/soc/codecs/wm5100.c                     |  2 +-
 sound/soc/codecs/wm8510.c                     |  2 +-
 sound/soc/codecs/wm8523.c                     |  2 +-
 sound/soc/codecs/wm8580.c                     |  4 +-
 sound/soc/codecs/wm8711.c                     |  2 +-
 sound/soc/codecs/wm8728.c                     |  2 +-
 sound/soc/codecs/wm8731-i2c.c                 |  2 +-
 sound/soc/codecs/wm8737.c                     |  2 +-
 sound/soc/codecs/wm8741.c                     |  2 +-
 sound/soc/codecs/wm8750.c                     |  4 +-
 sound/soc/codecs/wm8753.c                     |  2 +-
 sound/soc/codecs/wm8776.c                     |  4 +-
 sound/soc/codecs/wm8804-i2c.c                 |  2 +-
 sound/soc/codecs/wm8900.c                     |  2 +-
 sound/soc/codecs/wm8903.c                     |  2 +-
 sound/soc/codecs/wm8904.c                     |  6 +--
 sound/soc/codecs/wm8940.c                     |  2 +-
 sound/soc/codecs/wm8955.c                     |  2 +-
 sound/soc/codecs/wm8960.c                     |  2 +-
 sound/soc/codecs/wm8961.c                     |  2 +-
 sound/soc/codecs/wm8962.c                     |  2 +-
 sound/soc/codecs/wm8971.c                     |  2 +-
 sound/soc/codecs/wm8974.c                     |  2 +-
 sound/soc/codecs/wm8978.c                     |  2 +-
 sound/soc/codecs/wm8983.c                     |  2 +-
 sound/soc/codecs/wm8985.c                     |  4 +-
 sound/soc/codecs/wm8988.c                     |  2 +-
 sound/soc/codecs/wm8990.c                     |  2 +-
 sound/soc/codecs/wm8991.c                     |  2 +-
 sound/soc/codecs/wm8993.c                     |  2 +-
 sound/soc/codecs/wm8995.c                     |  4 +-
 sound/soc/codecs/wm8996.c                     |  2 +-
 sound/soc/codecs/wm9081.c                     |  2 +-
 sound/soc/codecs/wm9090.c                     |  4 +-
 200 files changed, 391 insertions(+), 391 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/cs35l41_hda_i2c.c b/sound/hda/codecs/side-codecs/cs35l41_hda_i2c.c
index e77495413c21..96d8cc6c2324 100644
--- a/sound/hda/codecs/side-codecs/cs35l41_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/cs35l41_hda_i2c.c
@@ -39,8 +39,8 @@ static void cs35l41_hda_i2c_remove(struct i2c_client *clt)
 }
 
 static const struct i2c_device_id cs35l41_hda_i2c_id[] = {
-	{ "cs35l41-hda" },
-	{}
+	{ .name = "cs35l41-hda" },
+	{ }
 };
 
 static const struct acpi_device_id cs35l41_acpi_hda_match[] = {
diff --git a/sound/hda/codecs/side-codecs/cs35l56_hda_i2c.c b/sound/hda/codecs/side-codecs/cs35l56_hda_i2c.c
index 1072f17385ac..e2f51612a73d 100644
--- a/sound/hda/codecs/side-codecs/cs35l56_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/cs35l56_hda_i2c.c
@@ -51,10 +51,10 @@ static void cs35l56_hda_i2c_remove(struct i2c_client *clt)
 }
 
 static const struct i2c_device_id cs35l56_hda_i2c_id[] = {
-	{ "cs35l54-hda", 0x3554 },
-	{ "cs35l56-hda", 0x3556 },
-	{ "cs35l57-hda", 0x3557 },
-	{}
+	{ .name = "cs35l54-hda", .driver_data = 0x3554 },
+	{ .name = "cs35l56-hda", .driver_data = 0x3556 },
+	{ .name = "cs35l57-hda", .driver_data = 0x3557 },
+	{ }
 };
 
 static const struct acpi_device_id cs35l56_acpi_hda_match[] = {
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 67240ce184e1..d59110402c7a 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -791,8 +791,8 @@ static const struct dev_pm_ops tas2781_hda_pm_ops = {
 };
 
 static const struct i2c_device_id tas2781_hda_i2c_id[] = {
-	{ "tas2781-hda" },
-	{}
+	{ .name = "tas2781-hda" },
+	{ }
 };
 
 static const struct acpi_device_id tas2781_acpi_hda_match[] = {
diff --git a/sound/soc/codecs/ad193x-i2c.c b/sound/soc/codecs/ad193x-i2c.c
index 6aa168e01fbb..d4d6560bdb80 100644
--- a/sound/soc/codecs/ad193x-i2c.c
+++ b/sound/soc/codecs/ad193x-i2c.c
@@ -14,8 +14,8 @@
 #include "ad193x.h"
 
 static const struct i2c_device_id ad193x_id[] = {
-	{ "ad1936", AD193X },
-	{ "ad1937", AD193X },
+	{ .name = "ad1936", .driver_data = AD193X },
+	{ .name = "ad1937", .driver_data = AD193X },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ad193x_id);
diff --git a/sound/soc/codecs/adau1372-i2c.c b/sound/soc/codecs/adau1372-i2c.c
index 73f83be38f74..4217b7fc349c 100644
--- a/sound/soc/codecs/adau1372-i2c.c
+++ b/sound/soc/codecs/adau1372-i2c.c
@@ -21,7 +21,7 @@ static int adau1372_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adau1372_i2c_ids[] = {
-	{ "adau1372" },
+	{ .name = "adau1372" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adau1372_i2c_ids);
diff --git a/sound/soc/codecs/adau1373.c b/sound/soc/codecs/adau1373.c
index 16b9b2658341..5dd961b233ce 100644
--- a/sound/soc/codecs/adau1373.c
+++ b/sound/soc/codecs/adau1373.c
@@ -1599,7 +1599,7 @@ static int adau1373_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adau1373_i2c_id[] = {
-	{ "adau1373" },
+	{ .name = "adau1373" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adau1373_i2c_id);
diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 6876462d8bdb..329ab01b62c0 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -860,10 +860,10 @@ static int adau1701_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adau1701_i2c_id[] = {
-	{ "adau1401" },
-	{ "adau1401a" },
-	{ "adau1701" },
-	{ "adau1702" },
+	{ .name = "adau1401" },
+	{ .name = "adau1401a" },
+	{ .name = "adau1701" },
+	{ .name = "adau1702" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adau1701_i2c_id);
diff --git a/sound/soc/codecs/adau1761-i2c.c b/sound/soc/codecs/adau1761-i2c.c
index eba7e4f42c78..a329e5bddb99 100644
--- a/sound/soc/codecs/adau1761-i2c.c
+++ b/sound/soc/codecs/adau1761-i2c.c
@@ -33,10 +33,10 @@ static void adau1761_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adau1761_i2c_ids[] = {
-	{ "adau1361", ADAU1361 },
-	{ "adau1461", ADAU1761 },
-	{ "adau1761", ADAU1761 },
-	{ "adau1961", ADAU1361 },
+	{ .name = "adau1361", .driver_data = ADAU1361 },
+	{ .name = "adau1461", .driver_data = ADAU1761 },
+	{ .name = "adau1761", .driver_data = ADAU1761 },
+	{ .name = "adau1961", .driver_data = ADAU1361 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adau1761_i2c_ids);
diff --git a/sound/soc/codecs/adau1781-i2c.c b/sound/soc/codecs/adau1781-i2c.c
index cb67fde8d9a8..0e7954148af7 100644
--- a/sound/soc/codecs/adau1781-i2c.c
+++ b/sound/soc/codecs/adau1781-i2c.c
@@ -33,8 +33,8 @@ static void adau1781_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adau1781_i2c_ids[] = {
-	{ "adau1381", ADAU1381 },
-	{ "adau1781", ADAU1781 },
+	{ .name = "adau1381", .driver_data = ADAU1381 },
+	{ .name = "adau1781", .driver_data = ADAU1781 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adau1781_i2c_ids);
diff --git a/sound/soc/codecs/adau1977-i2c.c b/sound/soc/codecs/adau1977-i2c.c
index 441c8079246a..fc7ed5c1dd74 100644
--- a/sound/soc/codecs/adau1977-i2c.c
+++ b/sound/soc/codecs/adau1977-i2c.c
@@ -28,9 +28,9 @@ static int adau1977_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id adau1977_i2c_ids[] = {
-	{ "adau1977", ADAU1977 },
-	{ "adau1978", ADAU1978 },
-	{ "adau1979", ADAU1978 },
+	{ .name = "adau1977", .driver_data = ADAU1977 },
+	{ .name = "adau1978", .driver_data = ADAU1978 },
+	{ .name = "adau1979", .driver_data = ADAU1978 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adau1977_i2c_ids);
diff --git a/sound/soc/codecs/adau7118-i2c.c b/sound/soc/codecs/adau7118-i2c.c
index f9dc8f4ef9a4..7cccb4c6cff7 100644
--- a/sound/soc/codecs/adau7118-i2c.c
+++ b/sound/soc/codecs/adau7118-i2c.c
@@ -68,8 +68,8 @@ static const struct of_device_id adau7118_of_match[] = {
 MODULE_DEVICE_TABLE(of, adau7118_of_match);
 
 static const struct i2c_device_id adau7118_id[] = {
-	{"adau7118"},
-	{}
+	{ .name = "adau7118" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adau7118_id);
 
diff --git a/sound/soc/codecs/adav803.c b/sound/soc/codecs/adav803.c
index 8b96c41f0354..9e5f8e866acb 100644
--- a/sound/soc/codecs/adav803.c
+++ b/sound/soc/codecs/adav803.c
@@ -14,7 +14,7 @@
 #include "adav80x.h"
 
 static const struct i2c_device_id adav803_id[] = {
-	{ "adav803" },
+	{ .name = "adav803" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adav803_id);
diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
index 23e868e4e3fb..03dadba0b038 100644
--- a/sound/soc/codecs/ak4118.c
+++ b/sound/soc/codecs/ak4118.c
@@ -395,8 +395,8 @@ MODULE_DEVICE_TABLE(of, ak4118_of_match);
 #endif
 
 static const struct i2c_device_id ak4118_id_table[] = {
-	{ "ak4118" },
-	{}
+	{ .name = "ak4118" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ak4118_id_table);
 
diff --git a/sound/soc/codecs/ak4535.c b/sound/soc/codecs/ak4535.c
index aadc46a47280..37555674cd15 100644
--- a/sound/soc/codecs/ak4535.c
+++ b/sound/soc/codecs/ak4535.c
@@ -430,7 +430,7 @@ static int ak4535_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id ak4535_i2c_id[] = {
-	{ "ak4535" },
+	{ .name = "ak4535" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ak4535_i2c_id);
diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index de9e43185555..3b198b9b4605 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -303,7 +303,7 @@ static const struct of_device_id ak4613_of_match[] = {
 MODULE_DEVICE_TABLE(of, ak4613_of_match);
 
 static const struct i2c_device_id ak4613_i2c_id[] = {
-	{ "ak4613", (kernel_ulong_t)&ak4613_regmap_cfg },
+	{ .name = "ak4613", .driver_data = (kernel_ulong_t)&ak4613_regmap_cfg },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ak4613_i2c_id);
diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
index daf6e15b7077..755c002f0f15 100644
--- a/sound/soc/codecs/ak4619.c
+++ b/sound/soc/codecs/ak4619.c
@@ -831,7 +831,7 @@ static const struct of_device_id ak4619_of_match[] = {
 MODULE_DEVICE_TABLE(of, ak4619_of_match);
 
 static const struct i2c_device_id ak4619_i2c_id[] = {
-	{ "ak4619", (kernel_ulong_t)&ak4619_regmap_cfg },
+	{ .name = "ak4619", .driver_data = (kernel_ulong_t)&ak4619_regmap_cfg },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ak4619_i2c_id);
diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index fe035d2fc913..08ec2035b270 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -672,10 +672,10 @@ static const struct of_device_id ak4642_of_match[] = {
 MODULE_DEVICE_TABLE(of, ak4642_of_match);
 
 static const struct i2c_device_id ak4642_i2c_id[] = {
-	{ "ak4642", (kernel_ulong_t)&ak4642_drvdata },
-	{ "ak4643", (kernel_ulong_t)&ak4643_drvdata },
-	{ "ak4648", (kernel_ulong_t)&ak4648_drvdata },
-	{}
+	{ .name = "ak4642", .driver_data = (kernel_ulong_t)&ak4642_drvdata },
+	{ .name = "ak4643", .driver_data = (kernel_ulong_t)&ak4643_drvdata },
+	{ .name = "ak4648", .driver_data = (kernel_ulong_t)&ak4648_drvdata },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ak4642_i2c_id);
 
diff --git a/sound/soc/codecs/ak4671.c b/sound/soc/codecs/ak4671.c
index d545aa2e0a39..aac54e9d54ee 100644
--- a/sound/soc/codecs/ak4671.c
+++ b/sound/soc/codecs/ak4671.c
@@ -646,7 +646,7 @@ static int ak4671_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ak4671_i2c_id[] = {
-	{ "ak4671" },
+	{ .name = "ak4671" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ak4671_i2c_id);
diff --git a/sound/soc/codecs/alc5623.c b/sound/soc/codecs/alc5623.c
index ec229b315f9f..f5a666c49361 100644
--- a/sound/soc/codecs/alc5623.c
+++ b/sound/soc/codecs/alc5623.c
@@ -963,10 +963,10 @@ static const struct regmap_config alc5623_regmap = {
 };
 
 static const struct i2c_device_id alc5623_i2c_table[] = {
-	{"alc5621", 0x21},
-	{"alc5622", 0x22},
-	{"alc5623", 0x23},
-	{}
+	{ .name = "alc5621", .driver_data = 0x21 },
+	{ .name = "alc5622", .driver_data = 0x22 },
+	{ .name = "alc5623", .driver_data = 0x23 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, alc5623_i2c_table);
 
diff --git a/sound/soc/codecs/alc5632.c b/sound/soc/codecs/alc5632.c
index 72f4622204ff..2fd3dd7ef8b3 100644
--- a/sound/soc/codecs/alc5632.c
+++ b/sound/soc/codecs/alc5632.c
@@ -1092,8 +1092,8 @@ static const struct regmap_config alc5632_regmap = {
 };
 
 static const struct i2c_device_id alc5632_i2c_table[] = {
-	{"alc5632", 0x5c},
-	{}
+	{ .name = "alc5632", .driver_data = 0x5c },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, alc5632_i2c_table);
 
diff --git a/sound/soc/codecs/aw87390.c b/sound/soc/codecs/aw87390.c
index 37ca42a25889..020213e0ca4b 100644
--- a/sound/soc/codecs/aw87390.c
+++ b/sound/soc/codecs/aw87390.c
@@ -599,8 +599,8 @@ static const struct of_device_id aw87390_of_match[] = {
 MODULE_DEVICE_TABLE(of, aw87390_of_match);
 
 static const struct i2c_device_id aw87390_i2c_id[] = {
-	{ AW87390_I2C_NAME },
-	{ AW87391_I2C_NAME },
+	{ .name = AW87390_I2C_NAME },
+	{ .name = AW87391_I2C_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw87390_i2c_id);
diff --git a/sound/soc/codecs/aw88081.c b/sound/soc/codecs/aw88081.c
index 8c5bb3ea0227..a5ba177a48df 100644
--- a/sound/soc/codecs/aw88081.c
+++ b/sound/soc/codecs/aw88081.c
@@ -1240,8 +1240,8 @@ static const struct snd_soc_component_driver soc_codec_dev_aw88081 = {
 };
 
 static const struct i2c_device_id aw88081_i2c_id[] = {
-	{ AW88081_I2C_NAME, AW88081},
-	{ AW88083_I2C_NAME, AW88083},
+	{ .name = AW88081_I2C_NAME, .driver_data = AW88081 },
+	{ .name = AW88083_I2C_NAME, .driver_data = AW88083 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw88081_i2c_id);
diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index ea277a940c44..3f15f4ac51f7 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -1801,7 +1801,7 @@ static int aw88166_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id aw88166_i2c_id[] = {
-	{ AW88166_I2C_NAME },
+	{ .name = AW88166_I2C_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw88166_i2c_id);
diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index a6805d5405cd..50521dd2ebb1 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1274,7 +1274,7 @@ static int aw88261_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id aw88261_i2c_id[] = {
-	{ "aw88261" },
+	{ .name = "aw88261" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw88261_i2c_id);
diff --git a/sound/soc/codecs/aw88395/aw88395.c b/sound/soc/codecs/aw88395/aw88395.c
index 3602b5b9f7d7..74708a47209e 100644
--- a/sound/soc/codecs/aw88395/aw88395.c
+++ b/sound/soc/codecs/aw88395/aw88395.c
@@ -558,7 +558,7 @@ static int aw88395_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id aw88395_i2c_id[] = {
-	{ AW88395_I2C_NAME },
+	{ .name = AW88395_I2C_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw88395_i2c_id);
diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index b588c27909b5..b2ec3503f7e2 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -2146,7 +2146,7 @@ static int aw88399_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id aw88399_i2c_id[] = {
-	{ AW88399_I2C_NAME },
+	{ .name = AW88399_I2C_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aw88399_i2c_id);
diff --git a/sound/soc/codecs/cs35l32.c b/sound/soc/codecs/cs35l32.c
index 0bb4bdb3deec..c835088de578 100644
--- a/sound/soc/codecs/cs35l32.c
+++ b/sound/soc/codecs/cs35l32.c
@@ -555,8 +555,8 @@ MODULE_DEVICE_TABLE(of, cs35l32_of_match);
 
 
 static const struct i2c_device_id cs35l32_id[] = {
-	{"cs35l32"},
-	{}
+	{ .name = "cs35l32" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, cs35l32_id);
diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index 98b4d371d931..f49edb9ea1f2 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -1262,8 +1262,8 @@ static const struct of_device_id cs35l33_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs35l33_of_match);
 
 static const struct i2c_device_id cs35l33_id[] = {
-	{"cs35l33"},
-	{}
+	{ .name = "cs35l33" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, cs35l33_id);
diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index a5a8075598ff..e80984b22159 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -1175,8 +1175,8 @@ static const struct of_device_id cs35l34_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs35l34_of_match);
 
 static const struct i2c_device_id cs35l34_id[] = {
-	{"cs35l34"},
-	{}
+	{ .name = "cs35l34" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs35l34_id);
 
diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 7a01b1d9fc9d..b2439ec3c19f 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -1639,8 +1639,8 @@ static const struct of_device_id cs35l35_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs35l35_of_match);
 
 static const struct i2c_device_id cs35l35_id[] = {
-	{"cs35l35"},
-	{}
+	{ .name = "cs35l35" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, cs35l35_id);
diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index 93818d7ec1a7..89645327945f 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -1918,8 +1918,8 @@ static const struct of_device_id cs35l36_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs35l36_of_match);
 
 static const struct i2c_device_id cs35l36_id[] = {
-	{"cs35l36"},
-	{}
+	{ .name = "cs35l36" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, cs35l36_id);
diff --git a/sound/soc/codecs/cs35l41-i2c.c b/sound/soc/codecs/cs35l41-i2c.c
index 34097996b784..23f59f3025bd 100644
--- a/sound/soc/codecs/cs35l41-i2c.c
+++ b/sound/soc/codecs/cs35l41-i2c.c
@@ -20,11 +20,11 @@
 #include "cs35l41.h"
 
 static const struct i2c_device_id cs35l41_id_i2c[] = {
-	{ "cs35l40" },
-	{ "cs35l41" },
-	{ "cs35l51" },
-	{ "cs35l53" },
-	{}
+	{ .name = "cs35l40" },
+	{ .name = "cs35l41" },
+	{ .name = "cs35l51" },
+	{ .name = "cs35l53" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, cs35l41_id_i2c);
diff --git a/sound/soc/codecs/cs35l45-i2c.c b/sound/soc/codecs/cs35l45-i2c.c
index a09aa3b92ae1..3eba61e107a5 100644
--- a/sound/soc/codecs/cs35l45-i2c.c
+++ b/sound/soc/codecs/cs35l45-i2c.c
@@ -53,8 +53,8 @@ static const struct of_device_id cs35l45_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs35l45_of_match);
 
 static const struct i2c_device_id cs35l45_id_i2c[] = {
-	{ "cs35l45" },
-	{}
+	{ .name = "cs35l45" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs35l45_id_i2c);
 
diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index 0492ddc4102d..0f64ab628b03 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -72,9 +72,9 @@ static void cs35l56_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id cs35l56_id_i2c[] = {
-	{ "cs35l56", 0x3556 },
-	{ "cs35l63", 0x3563 },
-	{}
+	{ .name = "cs35l56", .driver_data = 0x3556 },
+	{ .name = "cs35l63", .driver_data = 0x3563 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs35l56_id_i2c);
 
diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index 3f759c13d6d1..286d5ca29854 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -638,7 +638,7 @@ static const struct of_device_id cs4265_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs4265_of_match);
 
 static const struct i2c_device_id cs4265_id[] = {
-	{ "cs4265" },
+	{ .name = "cs4265" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs4265_id);
diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index a48980e746ff..47cb10eb21bb 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -732,8 +732,8 @@ static int cs4270_i2c_probe(struct i2c_client *i2c_client)
  * cs4270_id - I2C device IDs supported by this driver
  */
 static const struct i2c_device_id cs4270_id[] = {
-	{"cs4270"},
-	{}
+	{ .name = "cs4270" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs4270_id);
 
diff --git a/sound/soc/codecs/cs4271-i2c.c b/sound/soc/codecs/cs4271-i2c.c
index 1d210b969173..869a5317f677 100644
--- a/sound/soc/codecs/cs4271-i2c.c
+++ b/sound/soc/codecs/cs4271-i2c.c
@@ -23,7 +23,7 @@ static int cs4271_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id cs4271_i2c_id[] = {
-	{ "cs4271" },
+	{ .name = "cs4271" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs4271_i2c_id);
diff --git a/sound/soc/codecs/cs42l42-i2c.c b/sound/soc/codecs/cs42l42-i2c.c
index 98b6718ccabf..c0942f28723b 100644
--- a/sound/soc/codecs/cs42l42-i2c.c
+++ b/sound/soc/codecs/cs42l42-i2c.c
@@ -78,8 +78,8 @@ static const struct acpi_device_id __maybe_unused cs42l42_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, cs42l42_acpi_match);
 
 static const struct i2c_device_id cs42l42_id[] = {
-	{"cs42l42"},
-	{}
+	{ .name = "cs42l42" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, cs42l42_id);
diff --git a/sound/soc/codecs/cs42l51-i2c.c b/sound/soc/codecs/cs42l51-i2c.c
index ba7e237619f2..a20a1030c498 100644
--- a/sound/soc/codecs/cs42l51-i2c.c
+++ b/sound/soc/codecs/cs42l51-i2c.c
@@ -14,7 +14,7 @@
 #include "cs42l51.h"
 
 static const struct i2c_device_id cs42l51_i2c_id[] = {
-	{ "cs42l51" },
+	{ .name = "cs42l51" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs42l51_i2c_id);
diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 662dc1a4835b..9d6bcfbbf0b2 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -1226,7 +1226,7 @@ MODULE_DEVICE_TABLE(of, cs42l52_of_match);
 
 
 static const struct i2c_device_id cs42l52_id[] = {
-	{ "cs42l52" },
+	{ .name = "cs42l52" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs42l52_id);
diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index aabb74f1f43c..4d9a22a1029c 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1353,7 +1353,7 @@ MODULE_DEVICE_TABLE(of, cs42l56_of_match);
 
 
 static const struct i2c_device_id cs42l56_id[] = {
-	{ "cs42l56" },
+	{ .name = "cs42l56" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs42l56_id);
diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index bda8442c1d66..6ddc6549492a 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -1369,8 +1369,8 @@ static const struct of_device_id cs42l73_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs42l73_of_match);
 
 static const struct i2c_device_id cs42l73_id[] = {
-	{"cs42l73"},
-	{}
+	{ .name = "cs42l73" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, cs42l73_id);
diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index e590a43559e4..f2a58163de0e 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -1101,8 +1101,8 @@ static const struct of_device_id cs42l84_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs42l84_of_match);
 
 static const struct i2c_device_id cs42l84_id[] = {
-	{ "cs42l84" },
-	{}
+	{ .name = "cs42l84" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs42l84_id);
 
diff --git a/sound/soc/codecs/cs42xx8-i2c.c b/sound/soc/codecs/cs42xx8-i2c.c
index 0faca384073a..31debe2d8231 100644
--- a/sound/soc/codecs/cs42xx8-i2c.c
+++ b/sound/soc/codecs/cs42xx8-i2c.c
@@ -49,9 +49,9 @@ static const struct of_device_id cs42xx8_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs42xx8_of_match);
 
 static const struct i2c_device_id cs42xx8_i2c_id[] = {
-	{"cs42448", (kernel_ulong_t)&cs42448_data},
-	{"cs42888", (kernel_ulong_t)&cs42888_data},
-	{}
+	{ .name = "cs42448", .driver_data = (kernel_ulong_t)&cs42448_data },
+	{ .name = "cs42888", .driver_data = (kernel_ulong_t)&cs42888_data },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs42xx8_i2c_id);
 
diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index a3bdaac9c059..e7b06f962790 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -2753,11 +2753,11 @@ MODULE_DEVICE_TABLE(acpi, cs43130_acpi_match);
 
 
 static const struct i2c_device_id cs43130_i2c_id[] = {
-	{"cs43130"},
-	{"cs4399"},
-	{"cs43131"},
-	{"cs43198"},
-	{}
+	{ .name = "cs43130" },
+	{ .name = "cs4399" },
+	{ .name = "cs43131" },
+	{ .name = "cs43198" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, cs43130_i2c_id);
diff --git a/sound/soc/codecs/cs4341.c b/sound/soc/codecs/cs4341.c
index b726e22ef57d..a44e6b3c298e 100644
--- a/sound/soc/codecs/cs4341.c
+++ b/sound/soc/codecs/cs4341.c
@@ -248,7 +248,7 @@ static int cs4341_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id cs4341_i2c_id[] = {
-	{ "cs4341" },
+	{ .name = "cs4341" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs4341_i2c_id);
diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
index d9a9c34fffe3..ced1270c4d68 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -358,8 +358,8 @@ static const struct of_device_id cs4349_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs4349_of_match);
 
 static const struct i2c_device_id cs4349_i2c_id[] = {
-	{"cs4349"},
-	{}
+	{ .name = "cs4349" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, cs4349_i2c_id);
diff --git a/sound/soc/codecs/cs530x-i2c.c b/sound/soc/codecs/cs530x-i2c.c
index 52b02ceaa7e3..98cb61dd88c1 100644
--- a/sound/soc/codecs/cs530x-i2c.c
+++ b/sound/soc/codecs/cs530x-i2c.c
@@ -40,13 +40,13 @@ static const struct of_device_id cs530x_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs530x_of_match);
 
 static const struct i2c_device_id cs530x_i2c_id[] = {
-	{ "cs4282", CS4282 },
-	{ "cs4302", CS4302 },
-	{ "cs4304", CS4304 },
-	{ "cs4308", CS4308 },
-	{ "cs5302", CS5302 },
-	{ "cs5304", CS5304 },
-	{ "cs5308", CS5308 },
+	{ .name = "cs4282", .driver_data = CS4282 },
+	{ .name = "cs4302", .driver_data = CS4302 },
+	{ .name = "cs4304", .driver_data = CS4304 },
+	{ .name = "cs4308", .driver_data = CS4308 },
+	{ .name = "cs5302", .driver_data = CS5302 },
+	{ .name = "cs5304", .driver_data = CS5304 },
+	{ .name = "cs5308", .driver_data = CS5308 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cs530x_i2c_id);
diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 93ea2fb4dae9..511453b4c375 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -1083,8 +1083,8 @@ static const struct of_device_id cs53l30_of_match[] = {
 MODULE_DEVICE_TABLE(of, cs53l30_of_match);
 
 static const struct i2c_device_id cs53l30_id[] = {
-	{ "cs53l30" },
-	{}
+	{ .name = "cs53l30" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, cs53l30_id);
diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index b0033bf9be3a..83c6cbd40804 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1681,9 +1681,9 @@ static void cx2072x_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id cx2072x_i2c_id[] = {
-	{ "cx20721" },
-	{ "cx20723" },
-	{}
+	{ .name = "cx20721" },
+	{ .name = "cx20723" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, cx2072x_i2c_id);
 
diff --git a/sound/soc/codecs/da7210.c b/sound/soc/codecs/da7210.c
index 94e59546c2fe..4df1a25e318b 100644
--- a/sound/soc/codecs/da7210.c
+++ b/sound/soc/codecs/da7210.c
@@ -1238,7 +1238,7 @@ static int da7210_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id da7210_i2c_id[] = {
-	{ "da7210" },
+	{ .name = "da7210" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da7210_i2c_id);
diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 19f69a523f22..98b8858ded02 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -2271,7 +2271,7 @@ static const struct dev_pm_ops da7213_pm = {
 };
 
 static const struct i2c_device_id da7213_i2c_id[] = {
-	{ "da7213" },
+	{ .name = "da7213" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da7213_i2c_id);
diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index 5c80839704c7..93bd045ed870 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -3282,8 +3282,8 @@ static int da7218_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id da7218_i2c_id[] = {
-	{ "da7217", DA7217_DEV_ID },
-	{ "da7218", DA7218_DEV_ID },
+	{ .name = "da7217", .driver_data = DA7217_DEV_ID },
+	{ .name = "da7218", .driver_data = DA7218_DEV_ID },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da7218_i2c_id);
diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index ec4059f381be..f0874d891e12 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -2712,7 +2712,7 @@ static int da7219_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id da7219_i2c_id[] = {
-	{ "da7219", },
+	{ .name = "da7219" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da7219_i2c_id);
diff --git a/sound/soc/codecs/da732x.c b/sound/soc/codecs/da732x.c
index 140e449d3ef4..12d1ac98461e 100644
--- a/sound/soc/codecs/da732x.c
+++ b/sound/soc/codecs/da732x.c
@@ -1547,7 +1547,7 @@ static int da732x_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id da732x_i2c_id[] = {
-	{ "da7320"},
+	{ .name = "da7320" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da732x_i2c_id);
diff --git a/sound/soc/codecs/da9055.c b/sound/soc/codecs/da9055.c
index a52276e32f2f..a88c13533145 100644
--- a/sound/soc/codecs/da9055.c
+++ b/sound/soc/codecs/da9055.c
@@ -1513,7 +1513,7 @@ static int da9055_i2c_probe(struct i2c_client *i2c)
  * and PMIC, which must be different to operate together.
  */
 static const struct i2c_device_id da9055_i2c_id[] = {
-	{ "da9055-codec" },
+	{ .name = "da9055-codec" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, da9055_i2c_id);
diff --git a/sound/soc/codecs/es8311.c b/sound/soc/codecs/es8311.c
index 564af5c04dbb..6fe3ae41afbd 100644
--- a/sound/soc/codecs/es8311.c
+++ b/sound/soc/codecs/es8311.c
@@ -955,7 +955,7 @@ static int es8311_i2c_probe(struct i2c_client *i2c_client)
 }
 
 static const struct i2c_device_id es8311_id[] = {
-	{ "es8311" },
+	{ .name = "es8311" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, es8311_id);
diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 9245c33700de..6a428387e496 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -895,8 +895,8 @@ static int es8316_i2c_probe(struct i2c_client *i2c_client)
 }
 
 static const struct i2c_device_id es8316_i2c_id[] = {
-	{"es8316" },
-	{}
+	{ .name = "es8316" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, es8316_i2c_id);
 
diff --git a/sound/soc/codecs/es8323.c b/sound/soc/codecs/es8323.c
index 605375b154c8..d067f7bda03a 100644
--- a/sound/soc/codecs/es8323.c
+++ b/sound/soc/codecs/es8323.c
@@ -787,7 +787,7 @@ static int es8323_i2c_probe(struct i2c_client *i2c_client)
 }
 
 static const struct i2c_device_id es8323_i2c_id[] = {
-	{ "es8323" },
+	{ .name = "es8323" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, es8323_i2c_id);
diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 55a65ef99208..a79b2da35099 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -1347,8 +1347,8 @@ static void es8326_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id es8326_i2c_id[] = {
-	{"es8326" },
-	{}
+	{ .name = "es8326" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, es8326_i2c_id);
 
diff --git a/sound/soc/codecs/es8328-i2c.c b/sound/soc/codecs/es8328-i2c.c
index 56bfbe9261ce..36a4987e1a59 100644
--- a/sound/soc/codecs/es8328-i2c.c
+++ b/sound/soc/codecs/es8328-i2c.c
@@ -16,8 +16,8 @@
 #include "es8328.h"
 
 static const struct i2c_device_id es8328_id[] = {
-	{ "es8328" },
-	{ "es8388" },
+	{ .name = "es8328" },
+	{ .name = "es8388" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, es8328_id);
diff --git a/sound/soc/codecs/es8375.c b/sound/soc/codecs/es8375.c
index 0b9406e93c0e..e8747bc24433 100644
--- a/sound/soc/codecs/es8375.c
+++ b/sound/soc/codecs/es8375.c
@@ -752,7 +752,7 @@ static void es8375_i2c_shutdown(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id es8375_id[] = {
-	{"es8375"},
+	{ .name = "es8375" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, es8375_id);
diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 8d418cae371a..de47b24417d6 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -1015,7 +1015,7 @@ MODULE_DEVICE_TABLE(of, es8389_if_dt_ids);
 #endif
 
 static const struct i2c_device_id es8389_i2c_id[] = {
-	{"es8389"},
+	{ .name = "es8389" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, es8389_i2c_id);
diff --git a/sound/soc/codecs/fs210x.c b/sound/soc/codecs/fs210x.c
index e6195b71adad..9394922f3d7a 100644
--- a/sound/soc/codecs/fs210x.c
+++ b/sound/soc/codecs/fs210x.c
@@ -1557,9 +1557,9 @@ static void fs210x_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id fs210x_i2c_id[] = {
-	{ "fs2104" },
-	{ "fs2105s" },
-	{}
+	{ .name = "fs2104" },
+	{ .name = "fs2105s" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, fs210x_i2c_id);
 
diff --git a/sound/soc/codecs/isabelle.c b/sound/soc/codecs/isabelle.c
index b7a94631d77d..fa1c23dda4eb 100644
--- a/sound/soc/codecs/isabelle.c
+++ b/sound/soc/codecs/isabelle.c
@@ -1133,7 +1133,7 @@ static int isabelle_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id isabelle_i2c_id[] = {
-	{ "isabelle" },
+	{ .name = "isabelle" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, isabelle_i2c_id);
diff --git a/sound/soc/codecs/lm4857.c b/sound/soc/codecs/lm4857.c
index 26cdb750cbca..06add7fb6737 100644
--- a/sound/soc/codecs/lm4857.c
+++ b/sound/soc/codecs/lm4857.c
@@ -128,7 +128,7 @@ static int lm4857_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id lm4857_i2c_id[] = {
-	{ "lm4857" },
+	{ .name = "lm4857" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm4857_i2c_id);
diff --git a/sound/soc/codecs/lm49453.c b/sound/soc/codecs/lm49453.c
index 043030509795..6e2e292d143b 100644
--- a/sound/soc/codecs/lm49453.c
+++ b/sound/soc/codecs/lm49453.c
@@ -1443,7 +1443,7 @@ static int lm49453_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id lm49453_i2c_id[] = {
-	{ "lm49453" },
+	{ .name = "lm49453" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, lm49453_i2c_id);
diff --git a/sound/soc/codecs/max9768.c b/sound/soc/codecs/max9768.c
index 7ad7a9fb7255..8621d9bdb9fd 100644
--- a/sound/soc/codecs/max9768.c
+++ b/sound/soc/codecs/max9768.c
@@ -213,7 +213,7 @@ static int max9768_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max9768_i2c_id[] = {
-	{ "max9768" },
+	{ .name = "max9768" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max9768_i2c_id);
diff --git a/sound/soc/codecs/max98088.c b/sound/soc/codecs/max98088.c
index 9f40ca4b60d5..df438baf05dc 100644
--- a/sound/soc/codecs/max98088.c
+++ b/sound/soc/codecs/max98088.c
@@ -1722,8 +1722,8 @@ static const struct snd_soc_component_driver soc_component_dev_max98088 = {
 };
 
 static const struct i2c_device_id max98088_i2c_id[] = {
-       { "max98088", MAX98088 },
-       { "max98089", MAX98089 },
+       { .name = "max98088", .driver_data = MAX98088 },
+       { .name = "max98089", .driver_data = MAX98089 },
        { }
 };
 MODULE_DEVICE_TABLE(i2c, max98088_i2c_id);
diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index 13a15459040f..aaa34ba86802 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2572,8 +2572,8 @@ static const struct regmap_config max98090_regmap = {
 };
 
 static const struct i2c_device_id max98090_i2c_id[] = {
-	{ "max98090", MAX98090 },
-	{ "max98091", MAX98091 },
+	{ .name = "max98090", .driver_data = MAX98090 },
+	{ .name = "max98091", .driver_data = MAX98091 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max98090_i2c_id);
diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index aae6423156e1..ced9bd4d94da 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -2109,7 +2109,7 @@ static const struct snd_soc_component_driver soc_component_dev_max98095 = {
 };
 
 static const struct i2c_device_id max98095_i2c_id[] = {
-	{ "max98095", MAX98095 },
+	{ .name = "max98095", .driver_data = MAX98095 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max98095_i2c_id);
diff --git a/sound/soc/codecs/max98371.c b/sound/soc/codecs/max98371.c
index 852db211ba1e..c8d4c68af562 100644
--- a/sound/soc/codecs/max98371.c
+++ b/sound/soc/codecs/max98371.c
@@ -400,7 +400,7 @@ static int max98371_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max98371_i2c_id[] = {
-	{ "max98371" },
+	{ .name = "max98371" },
 	{ }
 };
 
diff --git a/sound/soc/codecs/max98373-i2c.c b/sound/soc/codecs/max98373-i2c.c
index f58b8c8625a7..20de379d08de 100644
--- a/sound/soc/codecs/max98373-i2c.c
+++ b/sound/soc/codecs/max98373-i2c.c
@@ -576,8 +576,8 @@ static int max98373_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max98373_i2c_id[] = {
-	{ "max98373"},
-	{ },
+	{ .name = "max98373" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, max98373_i2c_id);
diff --git a/sound/soc/codecs/max98388.c b/sound/soc/codecs/max98388.c
index 076f15a9867e..2576841b7de2 100644
--- a/sound/soc/codecs/max98388.c
+++ b/sound/soc/codecs/max98388.c
@@ -977,8 +977,8 @@ static int max98388_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max98388_i2c_id[] = {
-	{ "max98388"},
-	{ },
+	{ .name = "max98388" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, max98388_i2c_id);
diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 65f095c47191..2bbedf84ee5d 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -1096,8 +1096,8 @@ static int max98390_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max98390_i2c_id[] = {
-	{ "max98390"},
-	{},
+	{ .name = "max98390" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, max98390_i2c_id);
diff --git a/sound/soc/codecs/max98396.c b/sound/soc/codecs/max98396.c
index 18fd90227187..9c1d7213410c 100644
--- a/sound/soc/codecs/max98396.c
+++ b/sound/soc/codecs/max98396.c
@@ -1871,9 +1871,9 @@ static int max98396_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max98396_i2c_id[] = {
-	{ "max98396", CODEC_TYPE_MAX98396},
-	{ "max98397", CODEC_TYPE_MAX98397},
-	{ },
+	{ .name = "max98396", .driver_data = CODEC_TYPE_MAX98396 },
+	{ .name = "max98397", .driver_data = CODEC_TYPE_MAX98397 },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, max98396_i2c_id);
diff --git a/sound/soc/codecs/max9850.c b/sound/soc/codecs/max9850.c
index 1fcbc64a2771..9bd6a61212c1 100644
--- a/sound/soc/codecs/max9850.c
+++ b/sound/soc/codecs/max9850.c
@@ -321,7 +321,7 @@ static int max9850_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max9850_i2c_id[] = {
-	{ "max9850" },
+	{ .name = "max9850" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max9850_i2c_id);
diff --git a/sound/soc/codecs/max98504.c b/sound/soc/codecs/max98504.c
index c94142768c81..8b2620eaf9b0 100644
--- a/sound/soc/codecs/max98504.c
+++ b/sound/soc/codecs/max98504.c
@@ -363,7 +363,7 @@ MODULE_DEVICE_TABLE(of, max98504_of_match);
 #endif
 
 static const struct i2c_device_id max98504_i2c_id[] = {
-	{ "max98504" },
+	{ .name = "max98504" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max98504_i2c_id);
diff --git a/sound/soc/codecs/max98520.c b/sound/soc/codecs/max98520.c
index 5bc3d95ade5a..4fb98505db1a 100644
--- a/sound/soc/codecs/max98520.c
+++ b/sound/soc/codecs/max98520.c
@@ -734,8 +734,8 @@ static int max98520_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max98520_i2c_id[] = {
-	{ "max98520"},
-	{ },
+	{ .name = "max98520" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, max98520_i2c_id);
diff --git a/sound/soc/codecs/max9860.c b/sound/soc/codecs/max9860.c
index 716d16daf7d7..0d7ac37850bb 100644
--- a/sound/soc/codecs/max9860.c
+++ b/sound/soc/codecs/max9860.c
@@ -709,7 +709,7 @@ static void max9860_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max9860_i2c_id[] = {
-	{ "max9860", },
+	{ .name = "max9860" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max9860_i2c_id);
diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 9cad9b698cf2..07a53ec2a18a 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -689,7 +689,7 @@ static int max9867_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max9867_i2c_id[] = {
-	{ "max9867" },
+	{ .name = "max9867" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max9867_i2c_id);
diff --git a/sound/soc/codecs/max9877.c b/sound/soc/codecs/max9877.c
index 1bd0d4761ca6..7cd07b6f9dd6 100644
--- a/sound/soc/codecs/max9877.c
+++ b/sound/soc/codecs/max9877.c
@@ -151,7 +151,7 @@ static int max9877_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max9877_i2c_id[] = {
-	{ "max9877" },
+	{ .name = "max9877" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max9877_i2c_id);
diff --git a/sound/soc/codecs/max98925.c b/sound/soc/codecs/max98925.c
index 124af6408d96..4302ab16a642 100644
--- a/sound/soc/codecs/max98925.c
+++ b/sound/soc/codecs/max98925.c
@@ -617,7 +617,7 @@ static int max98925_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max98925_i2c_id[] = {
-	{ "max98925" },
+	{ .name = "max98925" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max98925_i2c_id);
diff --git a/sound/soc/codecs/max98926.c b/sound/soc/codecs/max98926.c
index ae962bda163e..5305e1f9d97f 100644
--- a/sound/soc/codecs/max98926.c
+++ b/sound/soc/codecs/max98926.c
@@ -565,7 +565,7 @@ static int max98926_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max98926_i2c_id[] = {
-	{ "max98926" },
+	{ .name = "max98926" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max98926_i2c_id);
diff --git a/sound/soc/codecs/max98927.c b/sound/soc/codecs/max98927.c
index 0e9b8970997c..65e6fdb30eec 100644
--- a/sound/soc/codecs/max98927.c
+++ b/sound/soc/codecs/max98927.c
@@ -873,8 +873,8 @@ static void max98927_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id max98927_i2c_id[] = {
-	{ "max98927"},
-	{ },
+	{ .name = "max98927" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, max98927_i2c_id);
diff --git a/sound/soc/codecs/ml26124.c b/sound/soc/codecs/ml26124.c
index fad0cc902346..8a14626d43ff 100644
--- a/sound/soc/codecs/ml26124.c
+++ b/sound/soc/codecs/ml26124.c
@@ -573,7 +573,7 @@ static int ml26124_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id ml26124_i2c_id[] = {
-	{ "ml26124" },
+	{ .name = "ml26124" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ml26124_i2c_id);
diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index ef63fd113cb7..21741afc80ef 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -557,8 +557,8 @@ static const struct of_device_id __maybe_unused mt6660_of_id[] = {
 MODULE_DEVICE_TABLE(of, mt6660_of_id);
 
 static const struct i2c_device_id mt6660_i2c_id[] = {
-	{"mt6660" },
-	{},
+	{ .name = "mt6660" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, mt6660_i2c_id);
 
diff --git a/sound/soc/codecs/nau8325.c b/sound/soc/codecs/nau8325.c
index 58ef5c493835..236d94c29c24 100644
--- a/sound/soc/codecs/nau8325.c
+++ b/sound/soc/codecs/nau8325.c
@@ -877,7 +877,7 @@ static int nau8325_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id nau8325_i2c_ids[] = {
-	{ "nau8325" },
+	{ .name = "nau8325" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nau8325_i2c_ids);
diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index caf2edb23088..fefbd5722c00 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -965,7 +965,7 @@ static int nau8540_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id nau8540_i2c_ids[] = {
-	{ "nau8540" },
+	{ .name = "nau8540" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nau8540_i2c_ids);
diff --git a/sound/soc/codecs/nau8810.c b/sound/soc/codecs/nau8810.c
index 9870e62d372e..a050387dd485 100644
--- a/sound/soc/codecs/nau8810.c
+++ b/sound/soc/codecs/nau8810.c
@@ -896,9 +896,9 @@ static int nau8810_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id nau8810_i2c_id[] = {
-	{ "nau8810" },
-	{ "nau8812" },
-	{ "nau8814" },
+	{ .name = "nau8810" },
+	{ .name = "nau8812" },
+	{ .name = "nau8814" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nau8810_i2c_id);
diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index ffb526de0021..c45c5b864ea4 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -1968,7 +1968,7 @@ static int nau8821_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id nau8821_i2c_ids[] = {
-	{ "nau8821" },
+	{ .name = "nau8821" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nau8821_i2c_ids);
diff --git a/sound/soc/codecs/nau8822.c b/sound/soc/codecs/nau8822.c
index a11759f85eac..19fee5f4bf5f 100644
--- a/sound/soc/codecs/nau8822.c
+++ b/sound/soc/codecs/nau8822.c
@@ -1193,7 +1193,7 @@ static int nau8822_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id nau8822_i2c_id[] = {
-	{ "nau8822" },
+	{ .name = "nau8822" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nau8822_i2c_id);
diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 6ce763762443..426a488ff2a3 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -2020,7 +2020,7 @@ static int nau8824_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id nau8824_i2c_ids[] = {
-	{ "nau8824" },
+	{ .name = "nau8824" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nau8824_i2c_ids);
diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index c6df21b91e36..8db90b933eeb 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -2931,7 +2931,7 @@ static int nau8825_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id nau8825_i2c_ids[] = {
-	{ "nau8825" },
+	{ .name = "nau8825" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, nau8825_i2c_ids);
diff --git a/sound/soc/codecs/ntp8835.c b/sound/soc/codecs/ntp8835.c
index 2b93bea11752..5837b9379fee 100644
--- a/sound/soc/codecs/ntp8835.c
+++ b/sound/soc/codecs/ntp8835.c
@@ -454,8 +454,8 @@ static int ntp8835_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id ntp8835_i2c_id[] = {
-	{ "ntp8835" },
-	{}
+	{ .name = "ntp8835" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ntp8835_i2c_id);
 
diff --git a/sound/soc/codecs/ntp8918.c b/sound/soc/codecs/ntp8918.c
index 5593d48ef696..a18d79aa80aa 100644
--- a/sound/soc/codecs/ntp8918.c
+++ b/sound/soc/codecs/ntp8918.c
@@ -370,8 +370,8 @@ static int ntp8918_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id ntp8918_i2c_id[] = {
-	{ "ntp8918" },
-	{}
+	{ .name = "ntp8918" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ntp8918_i2c_id);
 
diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index f4e5f3133f2b..cb923cecb47f 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -290,8 +290,8 @@ static const struct snd_soc_component_driver soc_component_dev_pcm1681 = {
 };
 
 static const struct i2c_device_id pcm1681_i2c_id[] = {
-	{"pcm1681"},
-	{}
+	{ .name = "pcm1681" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcm1681_i2c_id);
 
diff --git a/sound/soc/codecs/pcm1789-i2c.c b/sound/soc/codecs/pcm1789-i2c.c
index abadf4f8ed5e..4f1bb13fd4c3 100644
--- a/sound/soc/codecs/pcm1789-i2c.c
+++ b/sound/soc/codecs/pcm1789-i2c.c
@@ -41,7 +41,7 @@ MODULE_DEVICE_TABLE(of, pcm1789_of_match);
 #endif
 
 static const struct i2c_device_id pcm1789_i2c_ids[] = {
-	{ "pcm1789" },
+	{ .name = "pcm1789" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcm1789_i2c_ids);
diff --git a/sound/soc/codecs/pcm179x-i2c.c b/sound/soc/codecs/pcm179x-i2c.c
index effc1dd6df22..5337bcc7c62c 100644
--- a/sound/soc/codecs/pcm179x-i2c.c
+++ b/sound/soc/codecs/pcm179x-i2c.c
@@ -38,7 +38,7 @@ MODULE_DEVICE_TABLE(of, pcm179x_of_match);
 #endif
 
 static const struct i2c_device_id pcm179x_i2c_ids[] = {
-	{ "pcm179x" },
+	{ .name = "pcm179x" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcm179x_i2c_ids);
diff --git a/sound/soc/codecs/pcm186x-i2c.c b/sound/soc/codecs/pcm186x-i2c.c
index a50f9f6e39c1..3bd9d557e3c2 100644
--- a/sound/soc/codecs/pcm186x-i2c.c
+++ b/sound/soc/codecs/pcm186x-i2c.c
@@ -23,10 +23,10 @@ static const struct of_device_id pcm186x_of_match[] = {
 MODULE_DEVICE_TABLE(of, pcm186x_of_match);
 
 static const struct i2c_device_id pcm186x_i2c_id[] = {
-	{ "pcm1862", PCM1862 },
-	{ "pcm1863", PCM1863 },
-	{ "pcm1864", PCM1864 },
-	{ "pcm1865", PCM1865 },
+	{ .name = "pcm1862", .driver_data = PCM1862 },
+	{ .name = "pcm1863", .driver_data = PCM1863 },
+	{ .name = "pcm1864", .driver_data = PCM1864 },
+	{ .name = "pcm1865", .driver_data = PCM1865 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcm186x_i2c_id);
diff --git a/sound/soc/codecs/pcm3168a-i2c.c b/sound/soc/codecs/pcm3168a-i2c.c
index ff18c74b616c..334f344761aa 100644
--- a/sound/soc/codecs/pcm3168a-i2c.c
+++ b/sound/soc/codecs/pcm3168a-i2c.c
@@ -33,7 +33,7 @@ static void pcm3168a_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id pcm3168a_i2c_id[] = {
-	{ "pcm3168a", },
+	{ .name = "pcm3168a" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcm3168a_i2c_id);
diff --git a/sound/soc/codecs/pcm512x-i2c.c b/sound/soc/codecs/pcm512x-i2c.c
index a1d849b0c50f..836865d11d22 100644
--- a/sound/soc/codecs/pcm512x-i2c.c
+++ b/sound/soc/codecs/pcm512x-i2c.c
@@ -35,13 +35,13 @@ static void pcm512x_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id pcm512x_i2c_id[] = {
-	{ "pcm5121", },
-	{ "pcm5122", },
-	{ "pcm5141", },
-	{ "pcm5142", },
-	{ "pcm5242", },
-	{ "tas5754", },
-	{ "tas5756", },
+	{ .name = "pcm5121" },
+	{ .name = "pcm5122" },
+	{ .name = "pcm5141" },
+	{ .name = "pcm5142" },
+	{ .name = "pcm5242" },
+	{ .name = "tas5754" },
+	{ .name = "tas5756" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcm512x_i2c_id);
diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 78b21fbfad50..27ff8d0983b0 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -27,28 +27,28 @@
 #include "pcm6240.h"
 
 static const struct i2c_device_id pcmdevice_i2c_id[] = {
-	{ "adc3120",  ADC3120  },
-	{ "adc5120",  ADC5120  },
-	{ "adc6120",  ADC6120  },
-	{ "dix4192",  DIX4192  },
-	{ "pcm1690",  PCM1690  },
-	{ "pcm3120",  PCM3120  },
-	{ "pcm3140",  PCM3140  },
-	{ "pcm5120",  PCM5120  },
-	{ "pcm5140",  PCM5140  },
-	{ "pcm6120",  PCM6120  },
-	{ "pcm6140",  PCM6140  },
-	{ "pcm6240",  PCM6240  },
-	{ "pcm6260",  PCM6260  },
-	{ "pcm9211",  PCM9211  },
-	{ "pcmd3140", PCMD3140 },
-	{ "pcmd3180", PCMD3180 },
-	{ "pcmd512x", PCMD512X },
-	{ "taa5212",  TAA5212  },
-	{ "taa5412",  TAA5412  },
-	{ "tad5212",  TAD5212  },
-	{ "tad5412",  TAD5412  },
-	{}
+	{ .name = "adc3120", .driver_data = ADC3120 },
+	{ .name = "adc5120", .driver_data = ADC5120 },
+	{ .name = "adc6120", .driver_data = ADC6120 },
+	{ .name = "dix4192", .driver_data = DIX4192 },
+	{ .name = "pcm1690", .driver_data = PCM1690 },
+	{ .name = "pcm3120", .driver_data = PCM3120 },
+	{ .name = "pcm3140", .driver_data = PCM3140 },
+	{ .name = "pcm5120", .driver_data = PCM5120 },
+	{ .name = "pcm5140", .driver_data = PCM5140 },
+	{ .name = "pcm6120", .driver_data = PCM6120 },
+	{ .name = "pcm6140", .driver_data = PCM6140 },
+	{ .name = "pcm6240", .driver_data = PCM6240 },
+	{ .name = "pcm6260", .driver_data = PCM6260 },
+	{ .name = "pcm9211", .driver_data = PCM9211 },
+	{ .name = "pcmd3140", .driver_data = PCMD3140 },
+	{ .name = "pcmd3180", .driver_data = PCMD3180 },
+	{ .name = "pcmd512x", .driver_data = PCMD512X },
+	{ .name = "taa5212", .driver_data = TAA5212 },
+	{ .name = "taa5412", .driver_data = TAA5412 },
+	{ .name = "tad5212", .driver_data = TAD5212 },
+	{ .name = "tad5412", .driver_data = TAD5412 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, pcmdevice_i2c_id);
 
diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 03f31d9d916e..15488a059283 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -2201,7 +2201,7 @@ MODULE_DEVICE_TABLE(acpi, rt1011_acpi_match);
 #endif
 
 static const struct i2c_device_id rt1011_i2c_id[] = {
-	{ "rt1011" },
+	{ .name = "rt1011" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt1011_i2c_id);
diff --git a/sound/soc/codecs/rt1015.c b/sound/soc/codecs/rt1015.c
index ca1ed9d5a24e..ff0c08ff610e 100644
--- a/sound/soc/codecs/rt1015.c
+++ b/sound/soc/codecs/rt1015.c
@@ -1094,7 +1094,7 @@ static const struct regmap_config rt1015_regmap = {
 };
 
 static const struct i2c_device_id rt1015_i2c_id[] = {
-	{ "rt1015" },
+	{ .name = "rt1015" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt1015_i2c_id);
diff --git a/sound/soc/codecs/rt1016.c b/sound/soc/codecs/rt1016.c
index 9f86f071fca8..11c8c45574a1 100644
--- a/sound/soc/codecs/rt1016.c
+++ b/sound/soc/codecs/rt1016.c
@@ -608,7 +608,7 @@ static const struct regmap_config rt1016_regmap = {
 };
 
 static const struct i2c_device_id rt1016_i2c_id[] = {
-	{ "rt1016" },
+	{ .name = "rt1016" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt1016_i2c_id);
diff --git a/sound/soc/codecs/rt1019.c b/sound/soc/codecs/rt1019.c
index 86539c6f6cc1..370521149ac8 100644
--- a/sound/soc/codecs/rt1019.c
+++ b/sound/soc/codecs/rt1019.c
@@ -540,7 +540,7 @@ static const struct regmap_config rt1019_regmap = {
 };
 
 static const struct i2c_device_id rt1019_i2c_id[] = {
-	{ "rt1019" },
+	{ .name = "rt1019" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt1019_i2c_id);
diff --git a/sound/soc/codecs/rt1305.c b/sound/soc/codecs/rt1305.c
index 26b7382f97ef..2d5fad76cf52 100644
--- a/sound/soc/codecs/rt1305.c
+++ b/sound/soc/codecs/rt1305.c
@@ -981,8 +981,8 @@ MODULE_DEVICE_TABLE(acpi, rt1305_acpi_match);
 #endif
 
 static const struct i2c_device_id rt1305_i2c_id[] = {
-	{ "rt1305" },
-	{ "rt1306" },
+	{ .name = "rt1305" },
+	{ .name = "rt1306" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt1305_i2c_id);
diff --git a/sound/soc/codecs/rt1308.c b/sound/soc/codecs/rt1308.c
index df50b38c24b9..630946cd7cdf 100644
--- a/sound/soc/codecs/rt1308.c
+++ b/sound/soc/codecs/rt1308.c
@@ -795,7 +795,7 @@ MODULE_DEVICE_TABLE(acpi, rt1308_acpi_match);
 #endif
 
 static const struct i2c_device_id rt1308_i2c_id[] = {
-	{ "rt1308" },
+	{ .name = "rt1308" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt1308_i2c_id);
diff --git a/sound/soc/codecs/rt1318.c b/sound/soc/codecs/rt1318.c
index a80643099644..d13fd0e14125 100644
--- a/sound/soc/codecs/rt1318.c
+++ b/sound/soc/codecs/rt1318.c
@@ -1139,7 +1139,7 @@ static const struct regmap_config rt1318_regmap = {
 };
 
 static const struct i2c_device_id rt1318_i2c_id[] = {
-	{ "rt1318" },
+	{ .name = "rt1318" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt1318_i2c_id);
diff --git a/sound/soc/codecs/rt274.c b/sound/soc/codecs/rt274.c
index bba714020c70..63b5fc439773 100644
--- a/sound/soc/codecs/rt274.c
+++ b/sound/soc/codecs/rt274.c
@@ -1098,8 +1098,8 @@ MODULE_DEVICE_TABLE(of, rt274_of_match);
 #endif
 
 static const struct i2c_device_id rt274_i2c_id[] = {
-	{"rt274"},
-	{}
+	{ .name = "rt274" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt274_i2c_id);
 
diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index 195658f626cc..ded0ea332480 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -1077,9 +1077,9 @@ static const struct regmap_config rt286_regmap = {
 };
 
 static const struct i2c_device_id rt286_i2c_id[] = {
-	{"rt286"},
-	{"rt288"},
-	{}
+	{ .name = "rt286" },
+	{ .name = "rt288" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt286_i2c_id);
 
diff --git a/sound/soc/codecs/rt298.c b/sound/soc/codecs/rt298.c
index 7d532a5a5f73..5414a1712b57 100644
--- a/sound/soc/codecs/rt298.c
+++ b/sound/soc/codecs/rt298.c
@@ -1138,8 +1138,8 @@ static const struct regmap_config rt298_regmap = {
 };
 
 static const struct i2c_device_id rt298_i2c_id[] = {
-	{"rt298"},
-	{}
+	{ .name = "rt298" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt298_i2c_id);
 
diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 649b44b790b0..00a4a208d2fa 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1200,7 +1200,7 @@ static const struct regmap_config rt5514_regmap = {
 };
 
 static const struct i2c_device_id rt5514_i2c_id[] = {
-	{ "rt5514" },
+	{ .name = "rt5514" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5514_i2c_id);
diff --git a/sound/soc/codecs/rt5575.c b/sound/soc/codecs/rt5575.c
index 24e41af29689..5c3e60eaa6a4 100644
--- a/sound/soc/codecs/rt5575.c
+++ b/sound/soc/codecs/rt5575.c
@@ -325,7 +325,7 @@ static int rt5575_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id rt5575_i2c_id[] = {
-	{ "rt5575" },
+	{ .name = "rt5575" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5575_i2c_id);
diff --git a/sound/soc/codecs/rt5616.c b/sound/soc/codecs/rt5616.c
index 005a2ffe90ae..46ee412dc81d 100644
--- a/sound/soc/codecs/rt5616.c
+++ b/sound/soc/codecs/rt5616.c
@@ -1321,7 +1321,7 @@ static const struct regmap_config rt5616_regmap = {
 };
 
 static const struct i2c_device_id rt5616_i2c_id[] = {
-	{ "rt5616" },
+	{ .name = "rt5616" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5616_i2c_id);
diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index 2c404a50b120..ed1233973eb8 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -1671,8 +1671,8 @@ static const struct snd_soc_component_driver soc_component_dev_rt5631 = {
 };
 
 static const struct i2c_device_id rt5631_i2c_id[] = {
-	{ "rt5631" },
-	{ "alc5631" },
+	{ .name = "rt5631" },
+	{ .name = "alc5631" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5631_i2c_id);
diff --git a/sound/soc/codecs/rt5640.c b/sound/soc/codecs/rt5640.c
index f6c6294e1588..8ae4033508ab 100644
--- a/sound/soc/codecs/rt5640.c
+++ b/sound/soc/codecs/rt5640.c
@@ -2958,9 +2958,9 @@ static const struct regmap_config rt5640_regmap = {
 };
 
 static const struct i2c_device_id rt5640_i2c_id[] = {
-	{ "rt5640" },
-	{ "rt5639" },
-	{ "rt5642" },
+	{ .name = "rt5640" },
+	{ .name = "rt5639" },
+	{ .name = "rt5642" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5640_i2c_id);
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index f7701b8d0d3c..8a9af260e5f7 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3646,8 +3646,8 @@ static const struct regmap_config temp_regmap = {
 };
 
 static const struct i2c_device_id rt5645_i2c_id[] = {
-	{ "rt5645" },
-	{ "rt5650" },
+	{ .name = "rt5645" },
+	{ .name = "rt5650" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5645_i2c_id);
diff --git a/sound/soc/codecs/rt5651.c b/sound/soc/codecs/rt5651.c
index 23c4bf3da298..5c729135f71b 100644
--- a/sound/soc/codecs/rt5651.c
+++ b/sound/soc/codecs/rt5651.c
@@ -2202,7 +2202,7 @@ MODULE_DEVICE_TABLE(acpi, rt5651_acpi_match);
 #endif
 
 static const struct i2c_device_id rt5651_i2c_id[] = {
-	{ "rt5651" },
+	{ .name = "rt5651" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5651_i2c_id);
diff --git a/sound/soc/codecs/rt5659.c b/sound/soc/codecs/rt5659.c
index 3590ebd41c27..3097ee6d4e89 100644
--- a/sound/soc/codecs/rt5659.c
+++ b/sound/soc/codecs/rt5659.c
@@ -3814,8 +3814,8 @@ static const struct regmap_config rt5659_regmap = {
 };
 
 static const struct i2c_device_id rt5659_i2c_id[] = {
-	{ "rt5658" },
-	{ "rt5659" },
+	{ .name = "rt5658" },
+	{ .name = "rt5659" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5659_i2c_id);
diff --git a/sound/soc/codecs/rt5660.c b/sound/soc/codecs/rt5660.c
index 84cdfb810c66..edf2e3e346e4 100644
--- a/sound/soc/codecs/rt5660.c
+++ b/sound/soc/codecs/rt5660.c
@@ -1225,7 +1225,7 @@ static const struct regmap_config rt5660_regmap = {
 };
 
 static const struct i2c_device_id rt5660_i2c_id[] = {
-	{ "rt5660" },
+	{ .name = "rt5660" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5660_i2c_id);
diff --git a/sound/soc/codecs/rt5663.c b/sound/soc/codecs/rt5663.c
index eee1c98cc4aa..262d3bba1f3d 100644
--- a/sound/soc/codecs/rt5663.c
+++ b/sound/soc/codecs/rt5663.c
@@ -3307,8 +3307,8 @@ static const struct regmap_config temp_regmap = {
 };
 
 static const struct i2c_device_id rt5663_i2c_id[] = {
-	{ "rt5663" },
-	{}
+	{ .name = "rt5663" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5663_i2c_id);
 
diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 38fb3a277e26..48f57cd0920d 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -4534,8 +4534,8 @@ static const struct regmap_config rt5665_regmap = {
 };
 
 static const struct i2c_device_id rt5665_i2c_id[] = {
-	{"rt5665"},
-	{}
+	{ .name = "rt5665" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5665_i2c_id);
 
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index c551696ae11a..fed6de40b8c8 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -2334,8 +2334,8 @@ static const struct regmap_config rt5668_regmap = {
 };
 
 static const struct i2c_device_id rt5668_i2c_id[] = {
-	{"rt5668b"},
-	{}
+	{ .name = "rt5668b" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5668_i2c_id);
 
diff --git a/sound/soc/codecs/rt5670.c b/sound/soc/codecs/rt5670.c
index cb5d03bf4c7f..1d120b5dc2be 100644
--- a/sound/soc/codecs/rt5670.c
+++ b/sound/soc/codecs/rt5670.c
@@ -2876,9 +2876,9 @@ static const struct regmap_config rt5670_regmap = {
 };
 
 static const struct i2c_device_id rt5670_i2c_id[] = {
-	{ "rt5670" },
-	{ "rt5671" },
-	{ "rt5672" },
+	{ .name = "rt5670" },
+	{ .name = "rt5671" },
+	{ .name = "rt5672" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5670_i2c_id);
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 60a93c3fe2e7..ac084ca008f3 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5210,7 +5210,7 @@ static const struct acpi_device_id rt5677_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, rt5677_acpi_match);
 
 static const struct i2c_device_id rt5677_i2c_id[] = {
-	{ "rt5677", RT5677 },
+	{ .name = "rt5677", .driver_data = RT5677 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5677_i2c_id);
diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index e556a365adc8..286cf0d17968 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -324,8 +324,8 @@ static const struct acpi_device_id rt5682_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, rt5682_acpi_match);
 
 static const struct i2c_device_id rt5682_i2c_id[] = {
-	{"rt5682"},
-	{}
+	{ .name = "rt5682" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5682_i2c_id);
 
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 98de94a79260..3624067950c0 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -3325,8 +3325,8 @@ static const struct acpi_device_id rt5682s_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, rt5682s_acpi_match);
 
 static const struct i2c_device_id rt5682s_i2c_id[] = {
-	{"rt5682s"},
-	{}
+	{ .name = "rt5682s" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, rt5682s_i2c_id);
 
diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index 320312f8db92..59642673b4cb 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -1809,8 +1809,8 @@ static void sgtl5000_i2c_shutdown(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sgtl5000_id[] = {
-	{"sgtl5000"},
-	{},
+	{ .name = "sgtl5000" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, sgtl5000_id);
diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 06de2b4fce5e..c7aaf98ef71e 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -1782,8 +1782,8 @@ static void sma1303_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sma1303_i2c_id[] = {
-	{"sma1303"},
-	{}
+	{ .name = "sma1303" },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sma1303_i2c_id);
 
diff --git a/sound/soc/codecs/sma1307.c b/sound/soc/codecs/sma1307.c
index 5850bf6e71ca..1de6bd1e4ee7 100644
--- a/sound/soc/codecs/sma1307.c
+++ b/sound/soc/codecs/sma1307.c
@@ -2008,8 +2008,8 @@ static void sma1307_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id sma1307_i2c_id[] = {
-	{ "sma1307a" },
-	{ "sma1307aq" },
+	{ .name = "sma1307a" },
+	{ .name = "sma1307aq" },
 	{ }
 };
 
diff --git a/sound/soc/codecs/src4xxx-i2c.c b/sound/soc/codecs/src4xxx-i2c.c
index 55f00ce7c718..34b3abdb9a70 100644
--- a/sound/soc/codecs/src4xxx-i2c.c
+++ b/sound/soc/codecs/src4xxx-i2c.c
@@ -19,7 +19,7 @@ static int src4xxx_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id src4xxx_i2c_ids[] = {
-	{ "src4392" },
+	{ .name = "src4392" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, src4xxx_i2c_ids);
diff --git a/sound/soc/codecs/ssm2518.c b/sound/soc/codecs/ssm2518.c
index 9008e5416004..5192569ba6a8 100644
--- a/sound/soc/codecs/ssm2518.c
+++ b/sound/soc/codecs/ssm2518.c
@@ -794,7 +794,7 @@ MODULE_DEVICE_TABLE(of, ssm2518_dt_ids);
 #endif
 
 static const struct i2c_device_id ssm2518_i2c_ids[] = {
-	{ "ssm2518" },
+	{ .name = "ssm2518" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ssm2518_i2c_ids);
diff --git a/sound/soc/codecs/ssm2602-i2c.c b/sound/soc/codecs/ssm2602-i2c.c
index 49c74cba17c7..23570d0a2f53 100644
--- a/sound/soc/codecs/ssm2602-i2c.c
+++ b/sound/soc/codecs/ssm2602-i2c.c
@@ -26,9 +26,9 @@ static int ssm2602_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id ssm2602_i2c_id[] = {
-	{ "ssm2602", SSM2602 },
-	{ "ssm2603", SSM2602 },
-	{ "ssm2604", SSM2604 },
+	{ .name = "ssm2602", .driver_data = SSM2602 },
+	{ .name = "ssm2603", .driver_data = SSM2602 },
+	{ .name = "ssm2604", .driver_data = SSM2604 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ssm2602_i2c_id);
diff --git a/sound/soc/codecs/ssm4567.c b/sound/soc/codecs/ssm4567.c
index 15f88624faeb..8415dd163edd 100644
--- a/sound/soc/codecs/ssm4567.c
+++ b/sound/soc/codecs/ssm4567.c
@@ -472,7 +472,7 @@ static int ssm4567_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id ssm4567_i2c_ids[] = {
-	{ "ssm4567" },
+	{ .name = "ssm4567" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ssm4567_i2c_ids);
diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index b9f9784f5164..652c6e3a9e63 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -1154,9 +1154,9 @@ static int sta32x_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id sta32x_i2c_id[] = {
-	{ "sta326" },
-	{ "sta328" },
-	{ "sta329" },
+	{ .name = "sta326" },
+	{ .name = "sta328" },
+	{ .name = "sta329" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sta32x_i2c_id);
diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 0d36cb06dced..99c7f7ac807b 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -1237,7 +1237,7 @@ static int sta350_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id sta350_i2c_id[] = {
-	{ "sta350" },
+	{ .name = "sta350" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sta350_i2c_id);
diff --git a/sound/soc/codecs/sta529.c b/sound/soc/codecs/sta529.c
index 946aa6a4e57c..7d57999f9cb1 100644
--- a/sound/soc/codecs/sta529.c
+++ b/sound/soc/codecs/sta529.c
@@ -361,7 +361,7 @@ static int sta529_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id sta529_i2c_id[] = {
-	{ "sta529" },
+	{ .name = "sta529" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, sta529_i2c_id);
diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index 80206c2e0946..1a7650b9b2a7 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -745,7 +745,7 @@ static void tas2552_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tas2552_id[] = {
-	{ "tas2552" },
+	{ .name = "tas2552" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas2552_id);
diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index ceb367ae05ba..2f7cfc2be970 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -711,9 +711,9 @@ static int tas2562_parse_dt(struct tas2562_data *tas2562)
 }
 
 static const struct i2c_device_id tas2562_id[] = {
-	{ "tas2562", TAS2562 },
-	{ "tas2564", TAS2564 },
-	{ "tas2110", TAS2110 },
+	{ .name = "tas2562", .driver_data = TAS2562 },
+	{ .name = "tas2564", .driver_data = TAS2564 },
+	{ .name = "tas2110", .driver_data = TAS2110 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas2562_id);
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 423b7073b302..ea3f92499fc6 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -1016,7 +1016,7 @@ static int tas2764_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tas2764_i2c_id[] = {
-	{ "tas2764"},
+	{ .name = "tas2764" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas2764_i2c_id);
diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index d4d7d056141b..7b75ae3bff4a 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -937,7 +937,7 @@ static int tas2770_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tas2770_i2c_id[] = {
-	{ "tas2770"},
+	{ .name = "tas2770" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas2770_i2c_id);
diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
index cf3f6abd7e7b..1ec1c076204f 100644
--- a/sound/soc/codecs/tas2780.c
+++ b/sound/soc/codecs/tas2780.c
@@ -621,7 +621,7 @@ static int tas2780_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tas2780_i2c_id[] = {
-	{ "tas2780"},
+	{ .name = "tas2780" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas2780_i2c_id);
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index a78a8f9b9833..620ed4ef577d 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -100,27 +100,27 @@ static const struct bulk_reg_val tas2781_cali_start_reg[] = {
 };
 
 static const struct i2c_device_id tasdevice_id[] = {
-	{ "tas2020", TAS2020 },
-	{ "tas2118", TAS2118 },
-	{ "tas2120", TAS2120 },
-	{ "tas2320", TAS2320 },
-	{ "tas2563", TAS2563 },
-	{ "tas2568", TAS2568 },
-	{ "tas2570", TAS2570 },
-	{ "tas2572", TAS2572 },
-	{ "tas2574", TAS2574 },
-	{ "tas2781", TAS2781 },
-	{ "tas5802", TAS5802 },
-	{ "tas5806m", TAS5806M },
-	{ "tas5806md", TAS5806MD },
-	{ "tas5815", TAS5815 },
-	{ "tas5822", TAS5822 },
-	{ "tas5825", TAS5825 },
-	{ "tas5827", TAS5827 },
-	{ "tas5828", TAS5828 },
-	{ "tas5830", TAS5830 },
-	{ "tas5832", TAS5832 },
-	{}
+	{ .name = "tas2020", .driver_data = TAS2020 },
+	{ .name = "tas2118", .driver_data = TAS2118 },
+	{ .name = "tas2120", .driver_data = TAS2120 },
+	{ .name = "tas2320", .driver_data = TAS2320 },
+	{ .name = "tas2563", .driver_data = TAS2563 },
+	{ .name = "tas2568", .driver_data = TAS2568 },
+	{ .name = "tas2570", .driver_data = TAS2570 },
+	{ .name = "tas2572", .driver_data = TAS2572 },
+	{ .name = "tas2574", .driver_data = TAS2574 },
+	{ .name = "tas2781", .driver_data = TAS2781 },
+	{ .name = "tas5802", .driver_data = TAS5802 },
+	{ .name = "tas5806m", .driver_data = TAS5806M },
+	{ .name = "tas5806md", .driver_data = TAS5806MD },
+	{ .name = "tas5815", .driver_data = TAS5815 },
+	{ .name = "tas5822", .driver_data = TAS5822 },
+	{ .name = "tas5825", .driver_data = TAS5825 },
+	{ .name = "tas5827", .driver_data = TAS5827 },
+	{ .name = "tas5828", .driver_data = TAS5828 },
+	{ .name = "tas5830", .driver_data = TAS5830 },
+	{ .name = "tas5832", .driver_data = TAS5832 },
+	{ }
 };
 
 static const struct of_device_id tasdevice_of_match[] = {
diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
index 36596b00ca69..4d1c122c8f04 100644
--- a/sound/soc/codecs/tas5086.c
+++ b/sound/soc/codecs/tas5086.c
@@ -891,7 +891,7 @@ static const struct snd_soc_component_driver soc_component_dev_tas5086 = {
 };
 
 static const struct i2c_device_id tas5086_i2c_id[] = {
-	{ "tas5086" },
+	{ .name = "tas5086" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas5086_i2c_id);
diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index 19ccf8641e16..8b5f9accf120 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -1064,13 +1064,13 @@ static const struct of_device_id tas571x_of_match[] __maybe_unused = {
 MODULE_DEVICE_TABLE(of, tas571x_of_match);
 
 static const struct i2c_device_id tas571x_i2c_id[] = {
-	{ "tas5707", (kernel_ulong_t) &tas5707_chip },
-	{ "tas5711", (kernel_ulong_t) &tas5711_chip },
-	{ "tas5717", (kernel_ulong_t) &tas5717_chip },
-	{ "tas5719", (kernel_ulong_t) &tas5717_chip },
-	{ "tas5721", (kernel_ulong_t) &tas5721_chip },
-	{ "tas5733", (kernel_ulong_t) &tas5733_chip },
-	{ "tas5753", (kernel_ulong_t) &tas5753_chip },
+	{ .name = "tas5707", .driver_data = (kernel_ulong_t)&tas5707_chip },
+	{ .name = "tas5711", .driver_data = (kernel_ulong_t)&tas5711_chip },
+	{ .name = "tas5717", .driver_data = (kernel_ulong_t)&tas5717_chip },
+	{ .name = "tas5719", .driver_data = (kernel_ulong_t)&tas5717_chip },
+	{ .name = "tas5721", .driver_data = (kernel_ulong_t)&tas5721_chip },
+	{ .name = "tas5733", .driver_data = (kernel_ulong_t)&tas5733_chip },
+	{ .name = "tas5753", .driver_data = (kernel_ulong_t)&tas5753_chip },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas571x_i2c_id);
diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index 2dcdd0a4bf80..0bbcfaadf3f2 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -716,9 +716,9 @@ static struct snd_soc_dai_driver tas5720_dai[] = {
 };
 
 static const struct i2c_device_id tas5720_id[] = {
-	{ "tas5720", TAS5720 },
-	{ "tas5720a-q1", TAS5720A_Q1 },
-	{ "tas5722", TAS5722 },
+	{ .name = "tas5720", .driver_data = TAS5720 },
+	{ .name = "tas5720a-q1", .driver_data = TAS5720A_Q1 },
+	{ .name = "tas5722", .driver_data = TAS5722 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas5720_id);
diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index 867046b7aaa0..bcc8cab8d667 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -580,7 +580,7 @@ static void tas5805m_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id tas5805m_i2c_id[] = {
-	{ "tas5805m", },
+	{ .name = "tas5805m" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas5805m_i2c_id);
diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index 85ecc246896f..f5d50f8a1cfb 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -794,7 +794,7 @@ static void tas6424_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tas6424_i2c_ids[] = {
-	{ "tas6424" },
+	{ .name = "tas6424" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas6424_i2c_ids);
diff --git a/sound/soc/codecs/tda7419.c b/sound/soc/codecs/tda7419.c
index 7d6fcba9986e..7ddea2fbe2d2 100644
--- a/sound/soc/codecs/tda7419.c
+++ b/sound/soc/codecs/tda7419.c
@@ -614,7 +614,7 @@ static int tda7419_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id tda7419_i2c_id[] = {
-	{ "tda7419" },
+	{ .name = "tda7419" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tda7419_i2c_id);
diff --git a/sound/soc/codecs/tfa9879.c b/sound/soc/codecs/tfa9879.c
index ac0c5c337677..f30479f1f53b 100644
--- a/sound/soc/codecs/tfa9879.c
+++ b/sound/soc/codecs/tfa9879.c
@@ -296,7 +296,7 @@ static int tfa9879_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id tfa9879_i2c_id[] = {
-	{ "tfa9879" },
+	{ .name = "tfa9879" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tfa9879_i2c_id);
diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index 270eee1ea534..d7d958ecd8db 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -1391,9 +1391,9 @@ static const struct snd_soc_component_driver soc_component_dev_adc3xxx = {
 };
 
 static const struct i2c_device_id adc3xxx_i2c_id[] = {
-	{ "tlv320adc3001", ADC3001 },
-	{ "tlv320adc3101", ADC3101 },
-	{}
+	{ .name = "tlv320adc3001", .driver_data = ADC3001 },
+	{ .name = "tlv320adc3101", .driver_data = ADC3101 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adc3xxx_i2c_id);
 
diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index e4f27a734501..4eb9cea27276 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -1326,10 +1326,10 @@ static int adcx140_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id adcx140_i2c_id[] = {
-	{ "tlv320adc3140", 0 },
-	{ "tlv320adc5140", 1 },
-	{ "tlv320adc6140", 2 },
-	{}
+	{ .name = "tlv320adc3140", .driver_data = 0 },
+	{ .name = "tlv320adc5140", .driver_data = 1 },
+	{ .name = "tlv320adc6140", .driver_data = 2 },
+	{ }
 };
 MODULE_DEVICE_TABLE(i2c, adcx140_i2c_id);
 
diff --git a/sound/soc/codecs/tlv320aic23-i2c.c b/sound/soc/codecs/tlv320aic23-i2c.c
index a31fb95048b8..2f928ae23887 100644
--- a/sound/soc/codecs/tlv320aic23-i2c.c
+++ b/sound/soc/codecs/tlv320aic23-i2c.c
@@ -28,8 +28,8 @@ static int tlv320aic23_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id tlv320aic23_id[] = {
-	{"tlv320aic23"},
-	{}
+	{ .name = "tlv320aic23" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, tlv320aic23_id);
diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 4362c2c06ce8..1d2e0ea6d4fe 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -1630,14 +1630,14 @@ static void aic31xx_configure_ocmv(struct aic31xx_priv *priv)
 }
 
 static const struct i2c_device_id aic31xx_i2c_id[] = {
-	{ "tlv320aic310x", AIC3100 },
-	{ "tlv320aic311x", AIC3110 },
-	{ "tlv320aic3100", AIC3100 },
-	{ "tlv320aic3110", AIC3110 },
-	{ "tlv320aic3120", AIC3120 },
-	{ "tlv320aic3111", AIC3111 },
-	{ "tlv320dac3100", DAC3100 },
-	{ "tlv320dac3101", DAC3101 },
+	{ .name = "tlv320aic310x", .driver_data = AIC3100 },
+	{ .name = "tlv320aic311x", .driver_data = AIC3110 },
+	{ .name = "tlv320aic3100", .driver_data = AIC3100 },
+	{ .name = "tlv320aic3110", .driver_data = AIC3110 },
+	{ .name = "tlv320aic3120", .driver_data = AIC3120 },
+	{ .name = "tlv320aic3111", .driver_data = AIC3111 },
+	{ .name = "tlv320dac3100", .driver_data = DAC3100 },
+	{ .name = "tlv320dac3101", .driver_data = DAC3101 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aic31xx_i2c_id);
diff --git a/sound/soc/codecs/tlv320aic32x4-i2c.c b/sound/soc/codecs/tlv320aic32x4-i2c.c
index b27b5ae1e4b2..449353d5f088 100644
--- a/sound/soc/codecs/tlv320aic32x4-i2c.c
+++ b/sound/soc/codecs/tlv320aic32x4-i2c.c
@@ -38,9 +38,9 @@ static void aic32x4_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id aic32x4_i2c_id[] = {
-	{ "tlv320aic32x4", (kernel_ulong_t)AIC32X4_TYPE_AIC32X4 },
-	{ "tlv320aic32x6", (kernel_ulong_t)AIC32X4_TYPE_AIC32X6 },
-	{ "tas2505", (kernel_ulong_t)AIC32X4_TYPE_TAS2505 },
+	{ .name = "tlv320aic32x4", .driver_data = (kernel_ulong_t)AIC32X4_TYPE_AIC32X4 },
+	{ .name = "tlv320aic32x6", .driver_data = (kernel_ulong_t)AIC32X4_TYPE_AIC32X6 },
+	{ .name = "tas2505", .driver_data = (kernel_ulong_t)AIC32X4_TYPE_TAS2505 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, aic32x4_i2c_id);
diff --git a/sound/soc/codecs/tlv320aic3x-i2c.c b/sound/soc/codecs/tlv320aic3x-i2c.c
index 0b585925c1ac..71528ad3a3b6 100644
--- a/sound/soc/codecs/tlv320aic3x-i2c.c
+++ b/sound/soc/codecs/tlv320aic3x-i2c.c
@@ -18,11 +18,11 @@
 #include "tlv320aic3x.h"
 
 static const struct i2c_device_id aic3x_i2c_id[] = {
-	{ "tlv320aic3x", AIC3X_MODEL_3X },
-	{ "tlv320aic33", AIC3X_MODEL_33 },
-	{ "tlv320aic3007", AIC3X_MODEL_3007 },
-	{ "tlv320aic3104", AIC3X_MODEL_3104 },
-	{ "tlv320aic3106", AIC3X_MODEL_3106 },
+	{ .name = "tlv320aic3x", .driver_data = AIC3X_MODEL_3X },
+	{ .name = "tlv320aic33", .driver_data = AIC3X_MODEL_33 },
+	{ .name = "tlv320aic3007", .driver_data = AIC3X_MODEL_3007 },
+	{ .name = "tlv320aic3104", .driver_data = AIC3X_MODEL_3104 },
+	{ .name = "tlv320aic3106", .driver_data = AIC3X_MODEL_3106 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, aic3x_i2c_id);
diff --git a/sound/soc/codecs/ts3a227e.c b/sound/soc/codecs/ts3a227e.c
index 5a7beeadb009..39284e4d420e 100644
--- a/sound/soc/codecs/ts3a227e.c
+++ b/sound/soc/codecs/ts3a227e.c
@@ -423,7 +423,7 @@ static const struct dev_pm_ops ts3a227e_pm = {
 };
 
 static const struct i2c_device_id ts3a227e_i2c_ids[] = {
-	{ "ts3a227e" },
+	{ .name = "ts3a227e" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, ts3a227e_i2c_ids);
diff --git a/sound/soc/codecs/tscs42xx.c b/sound/soc/codecs/tscs42xx.c
index 7390ab250ebb..dba581857920 100644
--- a/sound/soc/codecs/tscs42xx.c
+++ b/sound/soc/codecs/tscs42xx.c
@@ -1483,8 +1483,8 @@ static int tscs42xx_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id tscs42xx_i2c_id[] = {
-	{ "tscs42A1" },
-	{ "tscs42A2" },
+	{ .name = "tscs42A1" },
+	{ .name = "tscs42A2" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tscs42xx_i2c_id);
diff --git a/sound/soc/codecs/tscs454.c b/sound/soc/codecs/tscs454.c
index 64d0da40fbaf..aad394937ce6 100644
--- a/sound/soc/codecs/tscs454.c
+++ b/sound/soc/codecs/tscs454.c
@@ -3454,7 +3454,7 @@ static int tscs454_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id tscs454_i2c_id[] = {
-	{ "tscs454" },
+	{ .name = "tscs454" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tscs454_i2c_id);
diff --git a/sound/soc/codecs/uda1342.c b/sound/soc/codecs/uda1342.c
index b0b29012842d..12f5757f4210 100644
--- a/sound/soc/codecs/uda1342.c
+++ b/sound/soc/codecs/uda1342.c
@@ -319,7 +319,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(uda1342_pm_ops,
 				 uda1342_suspend, uda1342_resume, NULL);
 
 static const struct i2c_device_id uda1342_i2c_id[] = {
-	 { "uda1342" },
+	 { .name = "uda1342" },
 	 { }
 };
 MODULE_DEVICE_TABLE(i2c, uda1342_i2c_id);
diff --git a/sound/soc/codecs/uda1380.c b/sound/soc/codecs/uda1380.c
index 55c83d95bfba..e11884669d1c 100644
--- a/sound/soc/codecs/uda1380.c
+++ b/sound/soc/codecs/uda1380.c
@@ -803,7 +803,7 @@ static int uda1380_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id uda1380_i2c_id[] = {
-	{ "uda1380" },
+	{ .name = "uda1380" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, uda1380_i2c_id);
diff --git a/sound/soc/codecs/wm1250-ev1.c b/sound/soc/codecs/wm1250-ev1.c
index 1f59309d8c69..5c1b00acb5bf 100644
--- a/sound/soc/codecs/wm1250-ev1.c
+++ b/sound/soc/codecs/wm1250-ev1.c
@@ -204,7 +204,7 @@ static int wm1250_ev1_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm1250_ev1_i2c_id[] = {
-	{ "wm1250-ev1" },
+	{ .name = "wm1250-ev1" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm1250_ev1_i2c_id);
diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 126be2a2a8f3..9b68ee69324b 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -929,7 +929,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm2000_i2c_id[] = {
-	{ "wm2000" },
+	{ .name = "wm2000" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm2000_i2c_id);
diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index 87418c838ca0..ba8ce2e6e615 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -2471,7 +2471,7 @@ static const struct dev_pm_ops wm2200_pm = {
 };
 
 static const struct i2c_device_id wm2200_i2c_id[] = {
-	{ "wm2200" },
+	{ .name = "wm2200" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm2200_i2c_id);
diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index 96fd098a9d36..bd94fa53c362 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -2669,7 +2669,7 @@ static const struct dev_pm_ops wm5100_pm = {
 };
 
 static const struct i2c_device_id wm5100_i2c_id[] = {
-	{ "wm5100" },
+	{ .name = "wm5100" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm5100_i2c_id);
diff --git a/sound/soc/codecs/wm8510.c b/sound/soc/codecs/wm8510.c
index bebee333d3fd..589a89564813 100644
--- a/sound/soc/codecs/wm8510.c
+++ b/sound/soc/codecs/wm8510.c
@@ -669,7 +669,7 @@ static int wm8510_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8510_i2c_id[] = {
-	{ "wm8510" },
+	{ .name = "wm8510" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8510_i2c_id);
diff --git a/sound/soc/codecs/wm8523.c b/sound/soc/codecs/wm8523.c
index f003f19766e2..65108a041c92 100644
--- a/sound/soc/codecs/wm8523.c
+++ b/sound/soc/codecs/wm8523.c
@@ -518,7 +518,7 @@ static int wm8523_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8523_i2c_id[] = {
-	{ "wm8523" },
+	{ .name = "wm8523" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8523_i2c_id);
diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 2be265bb0751..ca7bbe5d4fc3 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -1034,8 +1034,8 @@ static const struct of_device_id wm8580_of_match[] = {
 MODULE_DEVICE_TABLE(of, wm8580_of_match);
 
 static const struct i2c_device_id wm8580_i2c_id[] = {
-	{ "wm8580", (kernel_ulong_t)&wm8580_data },
-	{ "wm8581", (kernel_ulong_t)&wm8581_data },
+	{ .name = "wm8580", .driver_data = (kernel_ulong_t)&wm8580_data },
+	{ .name = "wm8581", .driver_data = (kernel_ulong_t)&wm8581_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8580_i2c_id);
diff --git a/sound/soc/codecs/wm8711.c b/sound/soc/codecs/wm8711.c
index 2bab9d189519..5271966b1615 100644
--- a/sound/soc/codecs/wm8711.c
+++ b/sound/soc/codecs/wm8711.c
@@ -455,7 +455,7 @@ static int wm8711_i2c_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id wm8711_i2c_id[] = {
-	{ "wm8711" },
+	{ .name = "wm8711" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8711_i2c_id);
diff --git a/sound/soc/codecs/wm8728.c b/sound/soc/codecs/wm8728.c
index 4c1a80561f06..6e6fd77c3020 100644
--- a/sound/soc/codecs/wm8728.c
+++ b/sound/soc/codecs/wm8728.c
@@ -296,7 +296,7 @@ static int wm8728_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8728_i2c_id[] = {
-	{ "wm8728" },
+	{ .name = "wm8728" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8728_i2c_id);
diff --git a/sound/soc/codecs/wm8731-i2c.c b/sound/soc/codecs/wm8731-i2c.c
index 1254e583af51..5d19fcc46606 100644
--- a/sound/soc/codecs/wm8731-i2c.c
+++ b/sound/soc/codecs/wm8731-i2c.c
@@ -47,7 +47,7 @@ static int wm8731_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8731_i2c_id[] = {
-	{ "wm8731" },
+	{ .name = "wm8731" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8731_i2c_id);
diff --git a/sound/soc/codecs/wm8737.c b/sound/soc/codecs/wm8737.c
index fee8a37ed1df..4eb42d19bc7e 100644
--- a/sound/soc/codecs/wm8737.c
+++ b/sound/soc/codecs/wm8737.c
@@ -641,7 +641,7 @@ static int wm8737_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8737_i2c_id[] = {
-	{ "wm8737" },
+	{ .name = "wm8737" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8737_i2c_id);
diff --git a/sound/soc/codecs/wm8741.c b/sound/soc/codecs/wm8741.c
index 4dfbb33edb09..ca56fdfb5088 100644
--- a/sound/soc/codecs/wm8741.c
+++ b/sound/soc/codecs/wm8741.c
@@ -606,7 +606,7 @@ static int wm8741_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8741_i2c_id[] = {
-	{ "wm8741" },
+	{ .name = "wm8741" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8741_i2c_id);
diff --git a/sound/soc/codecs/wm8750.c b/sound/soc/codecs/wm8750.c
index 0e1d3ebb15c4..d3f1178c2d34 100644
--- a/sound/soc/codecs/wm8750.c
+++ b/sound/soc/codecs/wm8750.c
@@ -803,8 +803,8 @@ static int wm8750_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8750_i2c_id[] = {
-	{ "wm8750" },
-	{ "wm8987" },
+	{ .name = "wm8750" },
+	{ .name = "wm8987" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8750_i2c_id);
diff --git a/sound/soc/codecs/wm8753.c b/sound/soc/codecs/wm8753.c
index a532a95e8048..95b23504f68d 100644
--- a/sound/soc/codecs/wm8753.c
+++ b/sound/soc/codecs/wm8753.c
@@ -1581,7 +1581,7 @@ static int wm8753_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8753_i2c_id[] = {
-	{ "wm8753" },
+	{ .name = "wm8753" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8753_i2c_id);
diff --git a/sound/soc/codecs/wm8776.c b/sound/soc/codecs/wm8776.c
index c3f340657f0c..f3b02c77314f 100644
--- a/sound/soc/codecs/wm8776.c
+++ b/sound/soc/codecs/wm8776.c
@@ -513,8 +513,8 @@ static int wm8776_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8776_i2c_id[] = {
-	{ "wm8775", WM8775 },
-	{ "wm8776", WM8776 },
+	{ .name = "wm8775", .driver_data = WM8775 },
+	{ .name = "wm8776", .driver_data = WM8776 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8776_i2c_id);
diff --git a/sound/soc/codecs/wm8804-i2c.c b/sound/soc/codecs/wm8804-i2c.c
index 3380d7301b17..3c49abd33d28 100644
--- a/sound/soc/codecs/wm8804-i2c.c
+++ b/sound/soc/codecs/wm8804-i2c.c
@@ -31,7 +31,7 @@ static void wm8804_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8804_i2c_id[] = {
-	{ "wm8804" },
+	{ .name = "wm8804" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8804_i2c_id);
diff --git a/sound/soc/codecs/wm8900.c b/sound/soc/codecs/wm8900.c
index 5312eb70dd29..a9128cfa6ff1 100644
--- a/sound/soc/codecs/wm8900.c
+++ b/sound/soc/codecs/wm8900.c
@@ -1287,7 +1287,7 @@ static int wm8900_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8900_i2c_id[] = {
-	{ "wm8900" },
+	{ .name = "wm8900" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8900_i2c_id);
diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index f73f6ad06b38..320d7737699d 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -2203,7 +2203,7 @@ static const struct of_device_id wm8903_of_match[] = {
 MODULE_DEVICE_TABLE(of, wm8903_of_match);
 
 static const struct i2c_device_id wm8903_i2c_id[] = {
-	{ "wm8903" },
+	{ .name = "wm8903" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8903_i2c_id);
diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 4c73a340f25f..9e5782e50f47 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -2621,9 +2621,9 @@ static int wm8904_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8904_i2c_id[] = {
-	{ "wm8904", WM8904 },
-	{ "wm8912", WM8912 },
-	{ "wm8918", WM8904 },   /* Actually a subset, updates to follow */
+	{ .name = "wm8904", .driver_data = WM8904 },
+	{ .name = "wm8912", .driver_data = WM8912 },
+	{ .name = "wm8918", .driver_data = WM8904 },   /* Actually a subset, updates to follow */
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8904_i2c_id);
diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index 2f55d0c572a4..e631ec072249 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -851,7 +851,7 @@ static int wm8940_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8940_i2c_id[] = {
-	{ "wm8940" },
+	{ .name = "wm8940" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8940_i2c_id);
diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index e1c61e026cbc..c897a9ab764d 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -996,7 +996,7 @@ static int wm8955_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8955_i2c_id[] = {
-	{ "wm8955" },
+	{ .name = "wm8955" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8955_i2c_id);
diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 384e8e703446..a810732c6af0 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -1551,7 +1551,7 @@ static void wm8960_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id wm8960_i2c_id[] = {
-	{ "wm8960" },
+	{ .name = "wm8960" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8960_i2c_id);
diff --git a/sound/soc/codecs/wm8961.c b/sound/soc/codecs/wm8961.c
index cfb8cfc91873..504fc59e4be2 100644
--- a/sound/soc/codecs/wm8961.c
+++ b/sound/soc/codecs/wm8961.c
@@ -967,7 +967,7 @@ static int wm8961_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8961_i2c_id[] = {
-	{ "wm8961" },
+	{ .name = "wm8961" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8961_i2c_id);
diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 8d2435bf44ea..de18b1f85a32 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -3991,7 +3991,7 @@ static const struct dev_pm_ops wm8962_pm = {
 };
 
 static const struct i2c_device_id wm8962_i2c_id[] = {
-	{ "wm8962" },
+	{ .name = "wm8962" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8962_i2c_id);
diff --git a/sound/soc/codecs/wm8971.c b/sound/soc/codecs/wm8971.c
index 46aa556b44fa..a5d2e91b66bb 100644
--- a/sound/soc/codecs/wm8971.c
+++ b/sound/soc/codecs/wm8971.c
@@ -692,7 +692,7 @@ static int wm8971_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8971_i2c_id[] = {
-	{ "wm8971" },
+	{ .name = "wm8971" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8971_i2c_id);
diff --git a/sound/soc/codecs/wm8974.c b/sound/soc/codecs/wm8974.c
index 0bb5e947f46d..4656652b8e97 100644
--- a/sound/soc/codecs/wm8974.c
+++ b/sound/soc/codecs/wm8974.c
@@ -712,7 +712,7 @@ static int wm8974_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8974_i2c_id[] = {
-	{ "wm8974" },
+	{ .name = "wm8974" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8974_i2c_id);
diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 935761e50865..ad8064bbaaac 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -1059,7 +1059,7 @@ static int wm8978_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8978_i2c_id[] = {
-	{ "wm8978" },
+	{ .name = "wm8978" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8978_i2c_id);
diff --git a/sound/soc/codecs/wm8983.c b/sound/soc/codecs/wm8983.c
index cd34f71cf42a..fab25f35fd14 100644
--- a/sound/soc/codecs/wm8983.c
+++ b/sound/soc/codecs/wm8983.c
@@ -1060,7 +1060,7 @@ static int wm8983_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8983_i2c_id[] = {
-	{ "wm8983" },
+	{ .name = "wm8983" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8983_i2c_id);
diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index be23c0c608d1..2a64d5a851da 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -1195,8 +1195,8 @@ static int wm8985_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8985_i2c_id[] = {
-	{ "wm8985", WM8985 },
-	{ "wm8758", WM8758 },
+	{ .name = "wm8985", .driver_data = WM8985 },
+	{ .name = "wm8758", .driver_data = WM8758 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8985_i2c_id);
diff --git a/sound/soc/codecs/wm8988.c b/sound/soc/codecs/wm8988.c
index 9bffe7a6ccec..741aecc7641a 100644
--- a/sound/soc/codecs/wm8988.c
+++ b/sound/soc/codecs/wm8988.c
@@ -897,7 +897,7 @@ static int wm8988_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8988_i2c_id[] = {
-	{ "wm8988" },
+	{ .name = "wm8988" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8988_i2c_id);
diff --git a/sound/soc/codecs/wm8990.c b/sound/soc/codecs/wm8990.c
index 9f2b42025ec9..11dfbbbdcd92 100644
--- a/sound/soc/codecs/wm8990.c
+++ b/sound/soc/codecs/wm8990.c
@@ -1241,7 +1241,7 @@ static int wm8990_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8990_i2c_id[] = {
-	{ "wm8990" },
+	{ .name = "wm8990" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8990_i2c_id);
diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index b8ed2a3e699b..225c235d3d89 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -1315,7 +1315,7 @@ static int wm8991_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8991_i2c_id[] = {
-	{ "wm8991" },
+	{ .name = "wm8991" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8991_i2c_id);
diff --git a/sound/soc/codecs/wm8993.c b/sound/soc/codecs/wm8993.c
index 1c9299979898..2a94b23319b5 100644
--- a/sound/soc/codecs/wm8993.c
+++ b/sound/soc/codecs/wm8993.c
@@ -1735,7 +1735,7 @@ static void wm8993_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8993_i2c_id[] = {
-	{ "wm8993" },
+	{ .name = "wm8993" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8993_i2c_id);
diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index 104ce09c02e0..799989a5bf0f 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -2259,8 +2259,8 @@ static int wm8995_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm8995_i2c_id[] = {
-	{"wm8995"},
-	{}
+	{ .name = "wm8995" },
+	{ }
 };
 
 MODULE_DEVICE_TABLE(i2c, wm8995_i2c_id);
diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index 2d9cbf66f7d4..dface555f928 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -3072,7 +3072,7 @@ static void wm8996_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id wm8996_i2c_id[] = {
-	{ "wm8996" },
+	{ .name = "wm8996" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm8996_i2c_id);
diff --git a/sound/soc/codecs/wm9081.c b/sound/soc/codecs/wm9081.c
index 521c55280f07..2e4e0a76499d 100644
--- a/sound/soc/codecs/wm9081.c
+++ b/sound/soc/codecs/wm9081.c
@@ -1358,7 +1358,7 @@ static int wm9081_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm9081_i2c_id[] = {
-	{ "wm9081" },
+	{ .name = "wm9081" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm9081_i2c_id);
diff --git a/sound/soc/codecs/wm9090.c b/sound/soc/codecs/wm9090.c
index 5182f0839b7c..8fc24b19313d 100644
--- a/sound/soc/codecs/wm9090.c
+++ b/sound/soc/codecs/wm9090.c
@@ -607,8 +607,8 @@ static int wm9090_i2c_probe(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id wm9090_id[] = {
-	{ "wm9090" },
-	{ "wm9093" },
+	{ .name = "wm9090" },
+	{ .name = "wm9093" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, wm9090_id);
-- 
2.47.3

