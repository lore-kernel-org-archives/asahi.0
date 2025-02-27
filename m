Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369F822F38B
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658213; cv=none; b=R+XHd1opnFkHp0UdE9Xhz/D/+4xDUoBnh/013zyC/ZBGy7i/i/0oHE4nP94nnbu2+B/oUGZzN0FMSCeM3UjXNsj7WVDmuRGx8CgXt432PXbaQKo9fK3eErI75SDvCO8yX6u1hEFsG63+PcNNNkeT8voS/2tkQmEL2BxhNo34yrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658213; c=relaxed/simple;
	bh=78BNV0f9IzhfH/Dc6whrKtxYgFEU2FpYtAI/jNtQlE4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X0gTE5nRApMc7junrrwHWSah3KKBIcd9PDiP3AmxQLK0Ou71EMsamK8+XzzGIvVZkAUsN/2lIFUaMR2WehAlGM4mIwR0IOEGhHyeMUrGlD3Vbzus/3pi09wjP2YAsIY3Aa/OHzLqKXi8023Fx2Gn/dZwvZPYZxXMPMkd3v23Ur8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O4W0Itqv; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O4W0Itqv"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220e83d65e5so13878895ad.1
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658210; x=1741263010; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICXy0Q69y/l3myEFhe6ajODlrNN6CYKAQCNynbpj8d8=;
        b=O4W0ItqvWvCAh8GG11ZJ+1zly/5Hz7J9jAefVcRSZ2Vp67DJOO/zIs+FD/pQ3Ji4Va
         dm2XYrYmPNzpJm7awuU7E/3xb13fvvR9JJHfXjj0+h5k/G6HYKZvOKRHZ36b0M4nLhOf
         rPNtDe5IlF0V/UpZuNZ8NHpcBW1gC7NtugH5zcdkR3Xtx6aQFN62nDrkcKTVR9VqG++f
         LPqgLRWOv8d8elcrz8kS0oEaMII9Elr3xVh88d+RQDba5Rdz9ZCE9Tt4sVuuA50IySvX
         o6cibXm31ZIInt5v07LR7VjK9yXgjmWBmZG2tXmqe0N4NTlZr4t18xgep+8fTvKvu+N7
         3JdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658210; x=1741263010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICXy0Q69y/l3myEFhe6ajODlrNN6CYKAQCNynbpj8d8=;
        b=hTMSR8/fEgpMDdYleMbjm5cbHu6IssAU8GOdJJzu3xU5QDZHPSTEpGMlAkyMNkEC8u
         q50sH+0s0Ffj1a2Y/BOp4btvJtb7OGrh2Akq0FDoqsLJzvO5/24SVEOAsqL+zyClIAQp
         6bpM7BlYv7GDjwMcvWr4wZKaAHxEYrkYAxThjImdBTwTTKyKIOybmfPXltUVXNJJ9B4W
         y3KUFh4iDTc8iOhc34N19Ie8iTtp6Mdj+zM3EFBOZWIUaMRkDv2pjqGiMbtYHzv3HnxN
         pFaE8cHMKpML/7oTOszRnz+2vQeXseAH79JL2nQwtKvzlPousU4X/1B5/HhNJO/KyPBl
         w2tw==
X-Forwarded-Encrypted: i=1; AJvYcCVp0xniVuX/UdXb7trGMIBZNHHiuAshSEUoKBN8vOPbBCT+CAyDZ5UjeGGPgybyIk0gLERiqg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9GX6lLiDtbwINvWBxdoYIo3fM+g5x3Orcp2YXk9C3vbG74Bti
	1ll/N09BkCEWR/9ACdszC1L8B/e8VSbzYBTtebICwA43VIGm9dufCSUv91cy
X-Gm-Gg: ASbGnct/kJGmnltFms3qfyzp2muf5sNaHOT4zm6Luq+UEoY7T89eQvbOfMEK3xFkUgC
	1LEywXuVvJvlRk5ebrYUVlKiYKpcdT4kbmr7bJvOqD217FcXHnuXeqR44unHhkvC2i1XfvJXrPV
	S4iUYE/U4ZPpFza71iA8MHHQE3E5eVFtAaO2dE7TbtzKOwKN9p1G7DiXzP/tAt/vMZBwlU8nm1y
	fzWyHX3LowjNAELw42qFpNicgYklwgxskqgn0Ivh9YMOJn+nGOxc0H5jBGRCbBwQeEWoNvL8Fz8
	5rL6BadcF2DkXVp9sJ67zu5vxOIkfmD9Tw/t7p+OBaCJ/AGOWgoqdxy+gHZ2rNkQkZn3Rd2zmEc
	qSJx1WxEmI+c7qcjDvtqX
X-Google-Smtp-Source: AGHT+IE7Z4TG7vI2cULV+y/ZR7KpFzVeU0xvIMbKRX3PTbA3lPGbPZu1mJPNJgb7SKL8owgHdIKK6w==
X-Received: by 2002:a05:6a20:7488:b0:1e1:a75a:c452 with SMTP id adf61e73a8af0-1f10ad33597mr12269606637.19.1740658210329;
        Thu, 27 Feb 2025 04:10:10 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:10:10 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:37 +1000
Subject: [PATCH v3 10/20] ASoC: tas2764: Apply Apple quirks
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250227-apple-codec-changes-v3-10-cbb130030acf@gmail.com>
References: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
In-Reply-To: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9009;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=bJ0MmPOyTgu2RgCg5PxNjdhOAIiVqXj/vIODjE8vMfU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk/x3GLLO3FrY1PgvRu1Cw4KMTUfjHLY/UmyTn/bX
 lWXhX3TO0pZGMS4GGTFFFk2NAl5zDZiu9kvUrkXZg4rE8gQBi5OAZjIKl9GhlMvg1eIZK6bclS+
 49Munw5bcdHVLH8O6ugVdd+M99rK/5ThJ+P2klg9tUdKiSZTzVucrZ8lJnWIWfSr9QtpsHJYm2i
 yAAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Apple's SN012776 driver has some peculiar aspects to its behavior that
are suspected to work around issues in the codec part. Add a module
parameter for enabling individual quirks that should be imitated after
the Apple driver.

Setting some of these by default seems to be required. For example,
setting 0xf fixes an issue with transient overcurrent errors which
can crash the chip until the next system reboot. To be safe, let's
enable all of them by default.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Co-developed-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764-quirks.h | 180 +++++++++++++++++++++++++
 sound/soc/codecs/tas2764.c        |  39 ++++++
 2 files changed, 219 insertions(+)

diff --git a/sound/soc/codecs/tas2764-quirks.h b/sound/soc/codecs/tas2764-quirks.h
new file mode 100644
index 0000000000000000000000000000000000000000..7a62b3ba5b40b3f06fc1ebeb590d9c32b1b2c7d3
--- /dev/null
+++ b/sound/soc/codecs/tas2764-quirks.h
@@ -0,0 +1,180 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __TAS2764_QUIRKS__
+#define __TAS2764_QUIRKS__
+
+#include <linux/regmap.h>
+
+#include "tas2764.h"
+
+/* Bitmask of enabled Apple quirks */
+#define ENABLED_APPLE_QUIRKS	0x3f
+
+/*
+ * Disable noise gate and flip down reserved bit in NS_CFG0
+ */
+#define TAS2764_NOISE_GATE_DISABLE	BIT(0)
+
+static const struct reg_sequence tas2764_noise_gate_dis_seq[] = {
+	REG_SEQ0(TAS2764_REG(0x0, 0x35), 0xb0)
+};
+
+/*
+ * CONV_VBAT_PVDD_MODE=1
+ */
+#define TAS2764_CONV_VBAT_PVDD_MODE	BIT(1)
+
+static const struct reg_sequence tas2764_conv_vbat_pvdd_mode_seq[] = {
+	REG_SEQ0(TAS2764_REG(0x0, 0x6b), 0x41)
+};
+
+/*
+ * Reset of DAC modulator when DSP is OFF
+ */
+#define TAS2764_DMOD_RST		BIT(2)
+
+static const struct reg_sequence tas2764_dmod_rst_seq[] = {
+	REG_SEQ0(TAS2764_REG(0x0, 0x76), 0x0)
+};
+
+/*
+ * Unknown 0x133/0x137 writes (maybe TDM related)
+ */
+#define TAS2764_UNK_SEQ0		BIT(3)
+
+static const struct reg_sequence tas2764_unk_seq0[] = {
+	REG_SEQ0(TAS2764_REG(0x1, 0x33), 0x80),
+	REG_SEQ0(TAS2764_REG(0x1, 0x37), 0x3a),
+};
+
+/*
+ * Unknown 0x614 - 0x61f writes
+ */
+#define TAS2764_APPLE_UNK_SEQ1		BIT(4)
+
+static const struct reg_sequence tas2764_unk_seq1[] = {
+	REG_SEQ0(TAS2764_REG(0x6, 0x14), 0x0),
+	REG_SEQ0(TAS2764_REG(0x6, 0x15), 0x13),
+	REG_SEQ0(TAS2764_REG(0x6, 0x16), 0x52),
+	REG_SEQ0(TAS2764_REG(0x6, 0x17), 0x0),
+	REG_SEQ0(TAS2764_REG(0x6, 0x18), 0xe4),
+	REG_SEQ0(TAS2764_REG(0x6, 0x19), 0xc),
+	REG_SEQ0(TAS2764_REG(0x6, 0x16), 0xaa),
+	REG_SEQ0(TAS2764_REG(0x6, 0x1b), 0x0),
+	REG_SEQ0(TAS2764_REG(0x6, 0x1c), 0x12),
+	REG_SEQ0(TAS2764_REG(0x6, 0x1d), 0xa0),
+	REG_SEQ0(TAS2764_REG(0x6, 0x1e), 0xd8),
+	REG_SEQ0(TAS2764_REG(0x6, 0x1f), 0x0),
+};
+
+/*
+ * Unknown writes in the 0xfd page (with secondary paging inside)
+ */
+#define TAS2764_APPLE_UNK_SEQ2		BIT(5)
+
+static const struct reg_sequence tas2764_unk_seq2[] = {
+	REG_SEQ0(TAS2764_REG(0xfd, 0x0d), 0xd),
+	REG_SEQ0(TAS2764_REG(0xfd, 0x6c), 0x2),
+	REG_SEQ0(TAS2764_REG(0xfd, 0x6d), 0xf),
+	REG_SEQ0(TAS2764_REG(0xfd, 0x0d), 0x0),
+};
+
+/*
+ * Disable 'Thermal Threshold 1'
+ */
+#define TAS2764_THERMAL_TH1_DISABLE	BIT(6)
+
+static const struct reg_sequence tas2764_thermal_th1_dis_seq[] = {
+	REG_SEQ0(TAS2764_REG(0x1, 0x47), 0x2),
+};
+
+/*
+ * Imitate Apple's shutdown dance
+ */
+#define TAS2764_SHUTDOWN_DANCE		BIT(7)
+
+static const struct reg_sequence tas2764_shutdown_dance_init_seq[] = {
+	/*
+	 * SDZ_MODE=01 (immediate)
+	 *
+	 * We want the shutdown to happen under the influence of
+	 * the magic writes in the 0xfdXX region, so make sure
+	 * the shutdown is immediate and there's no grace period
+	 * followed by the codec part.
+	 */
+	REG_SEQ0(TAS2764_REG(0x0, 0x7), 0x60),
+};
+
+static const struct reg_sequence tas2764_pre_shutdown_seq[] = {
+	REG_SEQ0(TAS2764_REG(0xfd, 0x0d), 0xd), /* switch hidden page */
+	REG_SEQ0(TAS2764_REG(0xfd, 0x64), 0x4), /* do write (unknown semantics) */
+	REG_SEQ0(TAS2764_REG(0xfd, 0x0d), 0x0), /* switch hidden page back */
+};
+
+static const struct reg_sequence tas2764_post_shutdown_seq[] = {
+	REG_SEQ0(TAS2764_REG(0xfd, 0x0d), 0xd),
+	REG_SEQ0(TAS2764_REG(0xfd, 0x64), 0x0), /* revert write from pre sequence */
+	REG_SEQ0(TAS2764_REG(0xfd, 0x0d), 0x0),
+};
+
+static int tas2764_do_quirky_pwr_ctrl_change(struct tas2764_priv *tas2764,
+					     unsigned int target)
+{
+	unsigned int curr;
+	int ret;
+
+	curr = snd_soc_component_read_field(tas2764->component,
+					       TAS2764_PWR_CTRL,
+					       TAS2764_PWR_CTRL_MASK);
+
+	if (target == curr)
+		return 0;
+
+	/* Handle power state transition to shutdown */
+	if (target == TAS2764_PWR_CTRL_SHUTDOWN &&
+	   (curr == TAS2764_PWR_CTRL_MUTE || curr == TAS2764_PWR_CTRL_ACTIVE)) {
+		ret = regmap_multi_reg_write(tas2764->regmap, tas2764_pre_shutdown_seq,
+					ARRAY_SIZE(tas2764_pre_shutdown_seq));
+		if (!ret)
+			ret = snd_soc_component_update_bits(tas2764->component,
+							TAS2764_PWR_CTRL,
+							TAS2764_PWR_CTRL_MASK,
+							TAS2764_PWR_CTRL_SHUTDOWN);
+		if (!ret)
+			ret = regmap_multi_reg_write(tas2764->regmap,
+						tas2764_post_shutdown_seq,
+						ARRAY_SIZE(tas2764_post_shutdown_seq));
+	}
+
+	ret = snd_soc_component_update_bits(tas2764->component, TAS2764_PWR_CTRL,
+						    TAS2764_PWR_CTRL_MASK, target);
+
+	return ret;
+}
+
+/*
+ * Via devicetree (TODO):
+ *  - switch from spread spectrum to class-D switching
+ *  - disable edge control
+ *  - set BOP settings (the BOP config bits *and* BOP_SRC)
+ */
+
+/*
+ * Other setup TODOs:
+ *  - DVC ramp rate
+ */
+
+static const struct tas2764_quirk_init_sequence {
+	const struct reg_sequence *seq;
+	int len;
+} tas2764_quirk_init_sequences[] = {
+	{ tas2764_noise_gate_dis_seq, ARRAY_SIZE(tas2764_noise_gate_dis_seq) },
+	{ tas2764_dmod_rst_seq, ARRAY_SIZE(tas2764_dmod_rst_seq) },
+	{ tas2764_conv_vbat_pvdd_mode_seq, ARRAY_SIZE(tas2764_conv_vbat_pvdd_mode_seq) },
+	{ tas2764_unk_seq0, ARRAY_SIZE(tas2764_unk_seq0) },
+	{ tas2764_unk_seq1, ARRAY_SIZE(tas2764_unk_seq1) },
+	{ tas2764_unk_seq2, ARRAY_SIZE(tas2764_unk_seq2) },
+	{ tas2764_thermal_th1_dis_seq, ARRAY_SIZE(tas2764_thermal_th1_dis_seq) },
+	{ tas2764_shutdown_dance_init_seq, ARRAY_SIZE(tas2764_shutdown_dance_init_seq) },
+};
+
+#endif /* __TAS2764_QUIRKS__ */
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index f33ac89ffc598c39f3a7e0d620724098ca5bc3d3..d21ad23f59ee1b393a27014d403dab1d99836012 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -46,6 +46,8 @@ struct tas2764_priv {
 	bool unmuted;
 };
 
+#include "tas2764-quirks.h"
+
 static const char *tas2764_int_ltch0_msgs[8] = {
 	"fault: over temperature", /* INT_LTCH0 & BIT(0) */
 	"fault: over current",
@@ -123,6 +125,9 @@ static int tas2764_update_pwr_ctrl(struct tas2764_priv *tas2764)
 	else
 		val = TAS2764_PWR_CTRL_SHUTDOWN;
 
+	if (ENABLED_APPLE_QUIRKS & TAS2764_SHUTDOWN_DANCE)
+		return tas2764_do_quirky_pwr_ctrl_change(tas2764, val);
+
 	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
 					    TAS2764_PWR_CTRL_MASK, val);
 	if (ret < 0)
@@ -549,6 +554,30 @@ static uint8_t sn012776_bop_presets[] = {
 
 static const struct regmap_config tas2764_i2c_regmap;
 
+static int tas2764_apply_init_quirks(struct tas2764_priv *tas2764)
+{
+	int ret, i;
+
+	for (i = 0; i < ARRAY_SIZE(tas2764_quirk_init_sequences); i++) {
+		const struct tas2764_quirk_init_sequence *init_seq =
+						&tas2764_quirk_init_sequences[i];
+
+		if (!init_seq->seq)
+			continue;
+
+		if (!(BIT(i) & ENABLED_APPLE_QUIRKS))
+			continue;
+
+		ret = regmap_multi_reg_write(tas2764->regmap, init_seq->seq,
+					     init_seq->len);
+
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 static int tas2764_codec_probe(struct snd_soc_component *component)
 {
 	struct tas2764_priv *tas2764 = snd_soc_component_get_drvdata(component);
@@ -635,6 +664,13 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 			if (ret < 0)
 				return ret;
 		}
+
+		/* Apply all enabled Apple quirks */
+		ret = tas2764_apply_init_quirks(tas2764);
+
+		if (ret < 0)
+			return ret;
+
 		break;
 	default:
 		break;
@@ -719,6 +755,9 @@ static bool tas2764_volatile_register(struct device *dev, unsigned int reg)
 	case TAS2764_INT_LTCH0 ... TAS2764_INT_LTCH4:
 	case TAS2764_INT_CLK_CFG:
 		return true;
+	case TAS2764_REG(0xf0, 0x0) ... TAS2764_REG(0xff, 0x0):
+		/* TI's undocumented registers for the application of quirks */
+		return true;
 	default:
 		return false;
 	}

-- 
2.48.1

