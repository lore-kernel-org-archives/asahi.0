Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE7366
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 00:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812046; cv=none; b=i4US9LTvyWwBnUCaA2dMX0k0eH2uR0VboL9xck/y5RBj/eylJ5+L8Ar/c1FgB5BEuuDEaHY3LCGZj5x1BWoOy1LIjNARw0ABNhMToEmeyHB3D5MRQpGYL6SiY+cagjO2VjjrQ6bTRrq+pwM7/ydDormMQbeSQDqABReZEvsO/Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812046; c=relaxed/simple;
	bh=s6KM1QAANWnrCslUisPm5f5o8wdQp3/HY7jThNWGnME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XvG6oJgcNnUb6RUKoq8ef7BPgwmoYE/ac9gmzl2gRr3CxmTJBbimfQ02UDIjthav5IVibmzj4i1ZjBBqZ/XqcDUqYVWFWED+6r4T0/WdjUSRZLffHm7fqvg/5pB947V83JfRcnQK7C/XHZKcZON6fcqh/ovN9UZt94jS5xSTDLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DVWtG3rF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DVWtG3rF"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301493f461eso1901776a91.3
        for <asahi@lists.linux.dev>; Fri, 04 Apr 2025 17:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743812044; x=1744416844; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hub/Un41YMQsR7dUpdo7EJdzYgRTMgzcDJ2xtzPcSzo=;
        b=DVWtG3rFDjDovL0d3zNmxPlnDrgM/AGeSy0hNrfxVK97FVD99MBXcjCqvzygQAWYAM
         XbF0CckyK1ichBCVDVyqRBYDKxrE8Fru/1VSdUMvsUywp6kxpSM5n8s3w0VCMw8+e2Xn
         P2ZwRCURyTtBjLNTuUixz/HgKzRwlLLN+jQYXMudh++YwYqR62WeCHfO48tBfhyHZFLu
         y5NEFn2VwHQXv+vafUzFv2qKE6tlAd0WxKStI+uVPVubRMrmPTSZHSjotGwLM77RDsYG
         NkjAexVYArtEzPKmeBWyoq3s6OpkB2d8spLCXdrnq/9wWG571Y0gyaR2uCUfWnwF3l04
         tKkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743812044; x=1744416844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hub/Un41YMQsR7dUpdo7EJdzYgRTMgzcDJ2xtzPcSzo=;
        b=NSxWaRFlLOW8q7tyOwBR4wgdNg5gurASzmSne8UPx0mp1ePtJuvVhJosDMp1cQ6ZZp
         ofTTDIlGUFRcZ3EyNg+BP1xDSuLotygWDqu9nxwkzrINLzuekmJPhNaAknqP127HWjMM
         Ch5Om4exA0F8IPQbt3YfkUAv5DenlKFPxMLCQHJh93ZwdCtIdsAnkFJg2bDDXoNH4VKg
         5wxMqpZRsSsGeVRCr1+hYd4ekLKG0ye07i0zsTCswiJXPZfNpzDVVb2HwV0Dr9+a1itt
         JJNeluWeloZM6E1oNDOGUV2a7l8tBplHMHSxQ5ue+DzihLrD1GjWj+OPMYbYZZQ8jOMN
         itjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu14bTi/APyfGel9ydGBDQxNxNUWS7WFK0m2elUkUSzOFXmUPolzlLYq8+IlzW+LdrY+iYKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9xKmCEms1POzvWYoBL9VLx6P7YVRaZmMlZKMB2WqY7GpvoTwr
	c6G9pFOKXG4bfBDoIE7RtqAs/z5pZsR76PytgGO1TkG1wSoxlHwP
X-Gm-Gg: ASbGncvhQNs/7pSOCauT2DG1n24r32UlU3bLBWwU7ZLKy68cw2Q1GLQzNSYtPfCoVft
	ATnbI26I5h3a0dYhK9i3pHryyUUq5RQIrrlllDnsmY5IjMRTVf6lUYD072gWnbqlaQuskqWstpD
	OB7EXFR3b17u9cWTUxQJ9Ncr2zMqjzc8KTjK5Wt+sQK7XcUKvBJahGZ3VV+WpX4CToG+/SrA1hv
	1CwzuH6sGrFFCpQbqy++BkFY62ALtySriruV8OlPi3aQV8rCqfTxiWLbYvpilKOpoSGwRSqOTyV
	5cJ6FO2RKa//tU5dylfYSOwrKXe4x91GaQC5kXKPy4xxtWOa/blS7Qjw3pEQ11sKYdL6EZ/EKwV
	OAskpDEFo8/h4oz8jkblSxHD/3zZLClrG+UL8B7A=
X-Google-Smtp-Source: AGHT+IFQGhk4XA8B7A1Ts6D+xYDlFxRXw42UR6BIqVhV1Q2hGwHS/VR/cM81zdP6bPP11UYrO0KXdQ==
X-Received: by 2002:a17:90a:e18f:b0:2f1:2fa5:1924 with SMTP id 98e67ed59e1d1-306a62138a0mr4869142a91.26.1743812043871;
        Fri, 04 Apr 2025 17:14:03 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:14:03 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:45 +1000
Subject: [PATCH v4 08/10] ASoC: tas2764: Apply Apple quirks
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250405-apple-codec-changes-v4-8-d007e46ce4a2@gmail.com>
References: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
In-Reply-To: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
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
 bh=cUqY8I/Yl0eZkFbXiF/e5Zn9O7qbT39FuuAhn86zVgg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfStskE+4VZWSlCrnfPjK3/VVT84P70tF96t+kF8Z5C
 PRKJf/qKGVhEONikBVTZNnQJOQx24jtZr9I5V6YOaxMIEMYuDgFYCLxzAz/FOZ9DD9nPtViUVix
 6e7TW05uOzYj69okgStBGdarTupONWL4X7h05+Xopr0Tfs9duCQsbIvA41mM3/9sWpYXo3jTWjr
 yFxMA
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
index c55c6e4ea1e2ce0051e43120a71e229238204fd5..e45b34fe4ffd4ffb902e33783e9655e858ce5bb1 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -45,6 +45,8 @@ struct tas2764_priv {
 	bool unmuted;
 };
 
+#include "tas2764-quirks.h"
+
 static const char *tas2764_int_ltch0_msgs[8] = {
 	"fault: over temperature", /* INT_LTCH0 & BIT(0) */
 	"fault: over current",
@@ -122,6 +124,9 @@ static int tas2764_update_pwr_ctrl(struct tas2764_priv *tas2764)
 	else
 		val = TAS2764_PWR_CTRL_SHUTDOWN;
 
+	if (ENABLED_APPLE_QUIRKS & TAS2764_SHUTDOWN_DANCE)
+		return tas2764_do_quirky_pwr_ctrl_change(tas2764, val);
+
 	ret = snd_soc_component_update_bits(component, TAS2764_PWR_CTRL,
 					    TAS2764_PWR_CTRL_MASK, val);
 	if (ret < 0)
@@ -587,6 +592,30 @@ static uint8_t sn012776_bop_presets[] = {
 
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
@@ -656,6 +685,13 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
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
@@ -740,6 +776,9 @@ static bool tas2764_volatile_register(struct device *dev, unsigned int reg)
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
2.49.0

