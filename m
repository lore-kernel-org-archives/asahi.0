Received: from mail-pj2-f23.google.com (mail-pj2-f23.google.com [74.125.227.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF143CA499
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880138; cv=none; b=VVqN1eeYNTcLAIzbmqlsMhodfHB6sT4gWeV9n3oquiIvMCwzlTNLQFHL39Cy52cdijEm3FEtE8d6DttmRLQn9QZ6UiPIIJK6jyhirY54EgCXliSUzhHUM3o+w8APqUQ5BM3ix369Wt6HoG3yMP85wHW428YD9uZ3EwTXEPkd1KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880138; c=relaxed/simple;
	bh=vjc8kzENgz6iKNAy+aA+ET9iiFQ96+MVJmNToH4ibVY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q4oH/irlK4nZs+OfbJD1p7ot0NLxKBeLGUu4cKzAQj4803tOiKdyGHnNSO2rEhLKtBU2IWwDWIvRAEsdprlyXLx8JZzcowk5U1FYWtpz6cxCFQXYbIQHgxguVSRAtlBRPQB3b7WUkZJ8yYBPfdlpz8Km6vD5JIHtiK1890z0by8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJbO5eao; arc=none smtp.client-ip=74.125.227.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJbO5eao"
Received: by mail-pj2-f23.google.com with SMTP id d9443c01a7336-2d747f066d8so6961925ad.1
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880137; x=1790484937; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=guh9SUKBNUNAFe1CPJL5pC07OGZIVIcs9iIVSylPf+8=;
        b=qJbO5eaoq/+5OZhu3LogPUBHRaTM5dosVGq5r4Wp+8gHVwV+dggEQU2yfRv5Bu6MIk
         G24ZFJOhvbb34MWsMI6gz+ZBvaCH4a/tLblBIQEKtBtmkpe31vqB04d73rnmi8K3Vmkb
         d5pvaecg+OkTlJFGHWZm2r8/jndclgPOQ8dTiMMD6xB3C4Wp90QmMukulrIzgArTGHs2
         kEj1Qk0sXvTJdwcw00r1dGDYTZIbTcVJiCMKvIroHJSrswWYDrgXHw4a9e22p4JD4C3f
         2ivxQJ9a+3EVgendS6XXx78IwJnCDWS0Esgrfmn7j8v4BVuKHhMySZ16f/58rZGUXmo1
         UBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880137; x=1790484937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guh9SUKBNUNAFe1CPJL5pC07OGZIVIcs9iIVSylPf+8=;
        b=BIZkECZzWPN2ec2cOf8I/sOaK1wI80X2hvsQswE8WVJMIfCZk8HTv+PIWd5Ata4hg3
         Ye2O3kcOxIYfdNLwgux0l+8Xmv0TKWDtf2Fg5HSXeiRcujMXnu62/7ZKDR5BFI/3GfxM
         R9FrMbWEXjgrtQoykxv4Sxp9z6HdoO4Wa8rEJvMSVZap4qXHvjKrIqoPsqFUoToVdar2
         3vjNY3FBsHMpoAkr0VMNKJrCLelQVAsbuq+mZ47XQ6ncHdyGX6eLi/lBfo7k5djWDD4D
         8TuVGcL86/QCJoEVVExq+sy8yNTka+mkvkmyhl/A3NvEXUooT2Ferf9vU5R2g814GpA8
         70dw==
X-Gm-Message-State: AFuF++myGsPt1RZSXtl5/lWRqeRnOTDzUItkoD902dyd9b6zvZDX/tKM
	+/reRHHoA1IHW/CQY0qHZ5dESGU1OtNtbIvh2K8ebzGKgqj1RJQIgGEX
X-Gm-Gg: AYBFou23Zkbhq8NFvO7nEzqUaIJemne1K6IgNnsk5tE7wguGPKiuHs6xYwT3MUjAZN+
	28xmDOhF2nZ56u3Wo2QOe5VINJRvgze3HVV2wCbEmDroqHtgfWFrrXEDcIBVY4tq94llxKXwbur
	tC2gwr8WQffdY/Yxh6USOCXPMMKleakYXjDeZB8mk9YlXUa6CAPrA92PWCpl+kxCIqOWWt0GE4R
	eehOL/LVArYWONIk4m4Ld3/HNylVzpSaQUOyf2i+zpLKa1rQKdKliMh0IFJrwPlBJ4/L5T0eUkv
	Vki8IkvI6z2nHt8qR9d88P9/3L1GGX+RzeGTCXOwsaDPzeUiZZl3HPTAyhGALNnEPawyCm/Jk61
	m3QelUzijL69lr0iTb4+Wybw2bN8cdVYFEoVBwVPwaC7uxRlhOqjdN8P0uk9H9KiPPX3wYMRgSl
	czbTxGtBlzuL0ye37iLbZ5KY29ciMJKY8RHBo/vWWBpgYx7Lgelk2BFf6yTW9hrdef1SlA/EGZM
	O054NDRKm//swNqbdHD9xvhnlxcuSlkKe5R+zB+FHb/Of3yDWHoR7A6yjiI9D8UpBu2bRTGbCmW
	f+SSkYVzJ8fUOb1kXmkGo+dCdK0x+WWp2SuucoKxSU7b7ro=
X-Received: by 2002:a17:903:3b90:b0:2dd:c100:251c with SMTP id d9443c01a7336-2ddc1002582mr42342795ad.37.1789880136783;
        Sat, 19 Sep 2026 21:55:36 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:36 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:42 +1000
Subject: [PATCH 03/28] ASoC: cs42l42: Set a faster digital ramp-up rate
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-3-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=OmSPjK7SUuOGMGgXmxuIo+R2IFqwguXc6h4eMDL7B9Y=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+UPyfalrpv1r+xTfu2HLE4JBaWJnIbuCs4xLr/5f
 j7JPX+yYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNU3NBj+6VWfZumKncEUeYQh9bx1/ZJCiWl7v/0OePDm0bym69Z1Oxn+F3iHLD6
 yt/urYQ8zk7cEo0T99E9aWpIxG7Ysk69699SeDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

With the default ramp-up rate, there is a noticeable fade-in when
streams start. This can be undesirable with aggressive muting for power
saving, since the beginning of the stream is lost.

Lower the digital output ramp-up time from 8 samples per period to 2
samples per period. This still leaves some fade-in to avoid pops, but it
is a lot less noticeable and no longer feels like the stream is fading
in.

Fixes: 2c394ca79604 ("ASoC: Add support for CS42L42 codec")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/cs42l42.h    |  4 ++++
 sound/soc/codecs/cs42l42.c | 10 ++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/sound/cs42l42.h b/include/sound/cs42l42.h
index 1bd8eee54f66..b3657965d491 100644
--- a/include/sound/cs42l42.h
+++ b/include/sound/cs42l42.h
@@ -62,6 +62,10 @@
 #define CS42L42_INTERNAL_FS_MASK	(1 << CS42L42_INTERNAL_FS_SHIFT)
 
 #define CS42L42_SFTRAMP_RATE		(CS42L42_PAGE_10 + 0x0A)
+#define CS42L42_SFTRAMP_ASR_RATE_MASK	GENMASK(7, 4)
+#define CS42L42_SFTRAMP_ASR_RATE_SHIFT	4
+#define CS42L42_SFTRAMP_DSR_RATE_MASK	GENMASK(3, 0)
+#define CS42L42_SFTRAMP_DSR_RATE_SHIFT	0
 #define CS42L42_SLOW_START_ENABLE	(CS42L42_PAGE_10 + 0x0B)
 #define CS42L42_SLOW_START_EN_MASK	GENMASK(6, 4)
 #define CS42L42_SLOW_START_EN_SHIFT	4
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index b5d69d5516a6..c40e8da8f6eb 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -2422,6 +2422,16 @@ int cs42l42_init(struct cs42l42_private *cs42l42)
 			(1 << CS42L42_ADC_PDN_SHIFT) |
 			(0 << CS42L42_PDN_ALL_SHIFT));
 
+	/*
+	 * Configure a faster digital ramp time, to avoid an audible
+	 * fade-in when streams start.
+	 */
+	regmap_update_bits(cs42l42->regmap, CS42L42_SFTRAMP_RATE,
+			   CS42L42_SFTRAMP_ASR_RATE_MASK |
+			   CS42L42_SFTRAMP_DSR_RATE_MASK,
+			   (10 << CS42L42_SFTRAMP_ASR_RATE_SHIFT) |
+			   (1 << CS42L42_SFTRAMP_DSR_RATE_SHIFT));
+
 	ret = cs42l42_handle_device_data(cs42l42->dev, cs42l42);
 	if (ret != 0)
 		goto err_shutdown;

-- 
2.55.0

