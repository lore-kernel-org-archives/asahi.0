Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87954DA55A
	for <asahi@lists.linux.dev>; Wed, 13 May 2026 17:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693004; cv=none; b=X4VUDIB90v3SHMYWJzzCsEEviD0z20xLO28Ka2UeqUV2BwIFhJ58qlXu9uCZSFpyS7I5LlZ4q3odC4Lh8zXDSGjoyyi54o3t1jOOVYnfZYRarMVD9IQuFOv7wILom0Q98WgdoH3V4UZk/3mN6TXFuvMsiGA7uR3WG06QMfr5jpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693004; c=relaxed/simple;
	bh=0kx9nXHgcrCeA+wtwjRfMNhh1Ea6m6Da/DfM7P1VOcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iMgbxMRxtwCe5SZP8nXws+MqTte5Qiwpb+xA041joPgX94JjkIcMgzTm6nwHhBnHaAFp6NKxRovy0eXHVcIpqxQllljgS3BW9ZQeUQcnrIK7uIZmEfNPqtJyYw16yK75oMDxb5FiGsZ2IVoi5+vYo5wd4Va8cxTh+8OroDT+2hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=MVtSSrNA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="MVtSSrNA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso80864055e9.1
        for <asahi@lists.linux.dev>; Wed, 13 May 2026 10:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778692997; x=1779297797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WBiwKaJQY0yLoEZVoPD+i2CuAdzYgrrUN0KXkB5SBzk=;
        b=MVtSSrNANC9yBLpejZXDhJcCxIJQFRSRSzP9tQUSd2DVfg/sCKBBw5Gh2iKjVyhJXE
         AOiqONlT2A801Zmh/2/Pofb7psp5x9D6/Y1E71b+Ab/IXnOPrXo8UABbaCYpMQZg/EGo
         OPAAVz1gqCZRX4HQ1yk1ihtXpB2XLPdnoFcpsw9TXMp91SYYKVAQJQg0qKCsXK8p8XK1
         oBtw1om9c4/QN0iLfn8Sg2YO5wgispgeGAfvIaD6V8X15EbT+/5uDLQy4sDnKFcrWW2/
         x+FdTTuAheW24nuhKPc3U3y4+Yeg2EXPXGpZeEu8JX6X/ycLJTZiE06XnGOcBY+9p/od
         05ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778692997; x=1779297797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WBiwKaJQY0yLoEZVoPD+i2CuAdzYgrrUN0KXkB5SBzk=;
        b=Le7nyfcIBNlN43HGDUTk+1FUrbiG1DcyTuTiqgL1NDUi37VeTAM5pCVN9l5GhiRF/4
         Fsud4BG2ExP+43WyUfYYb/e2NkfASzFpPRtV5TdpJTRb+gvMbKpdSIIOqe5i2fdwDhVr
         AoF6bZFpE+N1zHarER08GsFGkLiFkeQcClhiqyDQnGqZ9Ap2oX+3MxeDEZu9mD8dQpgP
         VA2O0iRwUFR4sgNCkR4xAXomqLAqP1k02ot4Ip+smRfd+S15w0V6DyKEukP0rlXR8v3t
         JGaByAFM59KoPAmouzSzT19zhDqk9fVj8pFJj/skQ6FZHRQDRsw9YHz++lfcV+6MEY46
         efXg==
X-Forwarded-Encrypted: i=1; AFNElJ+eGlqpw8D9dez+3g4FFU0oXG+uYw2/XSfgBCbkDuGF4ZqJW4EaIP0bkmQ5W+yNomHguHXYug==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzajildg1bVSwvTnmLlwYWbcWmmxI5hn0gcvDhVU8lIjmwgEbnl
	GdAQgQ/zIjVjzsyouYmBgub8WjZRr8rlPhnbMqTLIMWCP4i3+XgXwgieaAoaABxSNIQ=
X-Gm-Gg: Acq92OFxDc6lrRK/3/KGGz7Cn3VPZEe85EAXzqR1KhIiB8GNVrrYwMihJ24kWwm1Vqi
	xuAhIGWhpzCFUs/bS5o14ciYDmZw347YftEUTAgTGKIHwcrb4EcZ85LQeuSO1j/ONbjGGvZKiBW
	hklpFwYOeF4iyDiEZAH2zGYHMeCg1+8VwBDCHmlO8BvH/42dNiZpjQk5vm8Iiz0YTesh+qVDhmA
	zqvWexzuweL8QmgE0sTlrYrXTSs/ZOPG7rSHEB2voOsTs1DK5tUFtOLKTsURvFX9wp5rZj0loW6
	kw1/LQMXBYCB32VhdZJdNaZ/AoSAo33PWJ8+656vpEr0jnmbI5PzxPrtbtsj0zSXpF9hVxeCUJB
	NTi/SUutz5JMPy7SE46Pa8jHcd3gWz9NviKnnllTuHEGFrdbekMHUz0VyoLp2BRamKV4FpWybCG
	1hslkzOY+joBl/vy/TNxoSu/7R5kzNtLIuaBByWmXwh9rOOxqLaG+jXiULt/ul3N8bZIkuFV7fa
	H8UjujJETLdrRVZkDiUncLBOg==
X-Received: by 2002:a05:600c:1792:b0:488:b811:51c4 with SMTP id 5b1f17b1804b1-48fcff534edmr31119785e9.25.1778692996712;
        Wed, 13 May 2026 10:23:16 -0700 (PDT)
Received: from localhost (p200300f65f47db04379dbd4376e53036.dip0.t-ipconnect.de. [2003:f6:5f47:db04:379d:bd43:76e5:3036])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fd648a6casm5365505e9.4.2026.05.13.10.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:23:16 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
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
	Fabio Estevam <festevam@gmail.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>,
	Kevin Cernekee <cernekee@chromium.org>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
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
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v1 0/2] ASoC: Rework initialization of i2c_device_ids
Date: Wed, 13 May 2026 19:23:02 +0200
Message-ID: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=14547; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=0kx9nXHgcrCeA+wtwjRfMNhh1Ea6m6Da/DfM7P1VOcA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqBLN2Nm3PEL/Sz0K+vQWH1XxUY//RfwT4gR/sc PXjrKxV01qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagSzdgAKCRCPgPtYfRL+ TgCzB/4tkpOYSSUU/IdtpZiBaOH7zqSllHElRHgZ1q63Ume5K5IygtuZyROolQNaDGgbpgbZ4gg XSsljcYTDD7ygjhXMQWNyxRTbZze+Lj/s6ylX+dvjfHC9HUtF1eSH4TyJ6UkZ2s98tYeEvIS7LC KziMrzweb2xnIV4GphNtOPHXkjovnRINC6OEdTZULV1gWXZSwoQxHXFiHafrIu65aCSu3GVVeUs HwDduA1gaUGTfb3+LBKl+ftiRBy7hJC6Gnkf6TCOAT+qoZLXuGvU1wGavrnK8nkbUpOM3NLSFue sBfbX8HfmrZzYHDGGydvMPlB/ziJWpA1SBX5QA5pav1Oof+2
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

this series is a preparation for

	diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
	index 23ff24080dfd..aebd3a5e90af 100644
	--- a/include/linux/mod_devicetable.h
	+++ b/include/linux/mod_devicetable.h
	@@ -477,7 +477,11 @@ struct rpmsg_device_id {
	 
	 struct i2c_device_id {
		char name[I2C_NAME_SIZE];
	-	kernel_ulong_t driver_data;	/* Data private to the driver */
	+	union {
	+		/* Data private to the driver */
	+		kernel_ulong_t driver_data;
	+		const void *driver_data_ptr;
	+	};
	 };
	 
	 /* pci_epf */

and this requires that .driver_data is assigned via a named initializer
for static data. This requirement isn't a bad one because named
initializers are also much better readable than list initializers.

The union added to struct i2c_device_id enables further cleanups like:

        diff --git a/drivers/iio/accel/kxcjk-1013.c b/drivers/iio/accel/kxcjk-1013.c
        index 8a082ff034dd..b2aac7348d22 100644
        --- a/drivers/iio/accel/kxcjk-1013.c
        +++ b/drivers/iio/accel/kxcjk-1013.c
	@@ -1429,7 +1429,7 @@ static int kxcjk1013_probe(struct i2c_client *client)
	 
		if (id) {
			name = id->name;
	-		data->info = (const struct kx_chipset_info *)(id->driver_data);
	+		data->info = id->driver_data_ptr;
		} else {
			name = iio_get_acpi_device_name_and_data(&client->dev, &ddata);
			data->info = ddata;
	@@ -1630,11 +1630,11 @@ static const struct dev_pm_ops kxcjk1013_pm_ops = {
	 };
	 
	 static const struct i2c_device_id kxcjk1013_id[] = {
	-	{ .name = "kxcjk1013", .driver_data = (kernel_ulong_t)&kxcjk1013_info },
	-	{ .name = "kxcj91008", .driver_data = (kernel_ulong_t)&kxcj91008_info },
	-	{ .name = "kxtj21009", .driver_data = (kernel_ulong_t)&kxtj21009_info },
	-	{ .name = "kxtf9", .driver_data = (kernel_ulong_t)&kxtf9_info },
	-	{ .name = "kx023-1025", .driver_data = (kernel_ulong_t)&kx0231025_info },
	+	{ .name = "kxcjk1013", .driver_data_ptr = &kxcjk1013_info },
	+	{ .name = "kxcj91008", .driver_data_ptr = &kxcj91008_info },
	+	{ .name = "kxtj21009", .driver_data_ptr = &kxtj21009_info },
	+	{ .name = "kxtf9", .driver_data_ptr = &kxtf9_info },
	+	{ .name = "kx023-1025", .driver_data_ptr = &kx0231025_info },
		{ }
	 };
	 MODULE_DEVICE_TABLE(i2c, kxcjk1013_id);

that are an improvement for readability (again!) and it keeps some
properties of the pointers (here: being const) without having to pay
attention for that. (I didn't find a good example in sound/soc, so an
iio driver was used to demonstrate the gain.)

My additional motivation for this effort is CHERI[1]. This is a hardware
extension that uses 128 bit pointers but unsigned long is still 64 bit.
So with CHERI you cannot store pointers in unsigned long variables.

The first patch drops a few empty remove callbacks that I found while
working on patch #2. The second converts all hwmon drivers to use named
initializers.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (2):
  ASoC: Drop empty i2c remove callbacks
  ASoC: Use named initializers for arrays of i2c_device_data

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
 sound/soc/codecs/nau8825.c                    |  6 +--
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
 sound/soc/codecs/rt5616.c                     |  6 +--
 sound/soc/codecs/rt5631.c                     | 10 ++---
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
 sound/soc/codecs/sta350.c                     |  8 +---
 sound/soc/codecs/sta529.c                     |  2 +-
 sound/soc/codecs/tas2552.c                    |  2 +-
 sound/soc/codecs/tas2562.c                    |  6 +--
 sound/soc/codecs/tas2764.c                    |  2 +-
 sound/soc/codecs/tas2770.c                    |  2 +-
 sound/soc/codecs/tas2780.c                    |  2 +-
 sound/soc/codecs/tas2781-i2c.c                | 42 +++++++++---------
 sound/soc/codecs/tas5086.c                    | 12 ++---
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
 sound/soc/codecs/wm8900.c                     |  8 +---
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
 sound/soc/codecs/wm9081.c                     |  8 +---
 sound/soc/codecs/wm9090.c                     |  4 +-
 200 files changed, 398 insertions(+), 426 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3

