Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08B73C4B6F
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880148; cv=none; b=DRAKTU63cESMh7CY2Ol0QXZMDZiQbPqMiKc2zojgqbwMmieHKenHhrFZ3G0tHlrauJ1TyErVShdLFZLenbCvIeZdxoFG3QYcO/pfOwgG+0/nLpsjXQvkJ5/IracyoGdrtZWPLIZoAXlFdFXNrp8BDgiTqeooJdqbg8MUT0yzplA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880148; c=relaxed/simple;
	bh=kMBkAaHfXaz58m08vArU+hc+2lbzFG3sRy/QCWibQdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SgQbtFPwzFc43O5pb1WeSNJONd+JnjYZvMQWyO3ILin04/qOkI6Hwzg/DTYjOg8PAYSN7aRcRtWYj6/GhSc0+Fif4PjVGJ/UTXtVArzVWpKsD2VbVUP1/n27PNRs2+17fqF5PZTh6PBhKiPgWk/I0HqUUjLkojvtg8pghUwW1ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpwT2pl6; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpwT2pl6"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0b25dso21880285ad.2
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880146; x=1790484946; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAVOL9koiJ+YcQGa1QFT/np1LbpIAAvGvOBmeTVIdhA=;
        b=IpwT2pl6OEy3Ruva4dqZqsxiLrGXd/YWeWqRqPrKPAnkUuJ+ZhN2hZod9q5qdLy/ts
         u1G3rmrMZT5XnC8VNUSS76OLmhkH1EOLoRX1cXcWW1amZ4wcFfSySc92ZiuGq4bNDuVj
         nMFRme1XF3FOPOiXO62Qm9d6twHD2xUAVYO/f39PObwvWgsRBFy5xnuX92Nqun10HIDT
         Ik9d8r8/OVRrEBcTI6kD7J55CPr09fXrLQmbdyAMa+E4vpEEnXfisoqZuXjn2uM15JRC
         S0K7NcsvR2t1liGxrLo5SvAi//59KY/GdYff8aBqLxqK1DkM8C5yIxkd8X+epvMJdaqz
         xJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880146; x=1790484946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAVOL9koiJ+YcQGa1QFT/np1LbpIAAvGvOBmeTVIdhA=;
        b=nHzHpm5rBq1habeB0hFnyAgmc/RnfwvtzId82M5+yuvoPqTU5lZdbqMVpOf4guoRrH
         HBqX/89er+19VILWJAK/HyCVwZy9PkLEr9yac8LhrGEGMkr8KUkcDjZgQzcYBHc7anIZ
         bLlalNI3A6lZYCqDctSshXA4MuOq6guxGrVEHYUEDVgoSArr3Mj02zElg2L8eHXPRKoJ
         kev2T0qocqb7i/xNop39ql+LluTBysMu8VwduqV6vAbpKQRbIkD3HkWupEVpF8I+3n5M
         f2TGHGbDhVxQhS6VhtMHuayV7lTdsas6e81vVfM7N2yJvxJCXzd+yBlyXpx97WkKNxb9
         tH7w==
X-Gm-Message-State: AFuF++m+cP6ob/Uj8iz98lgDQlRW0PFKu3LkqPIiWjn4RtwiEj0J7yGC
	PrVPfuldAR+/DebaS4ur+AFekcL68JWsByw25V0xAo0B2vYATXQ34o/d
X-Gm-Gg: AYBFou1X7AGj6aFI+JLuF5dzPyIWgIWv4S1GOV9voDzz2Vm2VdSPc7vfwCd5WHTm7kf
	SIlPm5JvO02zPhOMD6RUPClUqEL2WqBACsfyHxEKP+7FDb/5Pi+UPqVjy9/vl5dx9C43W/ySOCw
	qF10+x8LwdKExh9KNkV3kdEAXhYTqJwYwY1oaX/73J/koppXO3yDaWIz+zFnZl3HzKPkFCTlUoe
	RFLJZhaCKr4tB8ZopN9TE4+aWD87MdER65BKeIdHw4XW9FsCPmIoK7z0BOmsqIz/T45fwRzzJ2+
	uY/nvtChCzC/P7fL4F7ByYaNbR8b6f2EU7jqO0mGtAko4mJdYL7S5DYSo8C1rnUZ53lODj+FIgf
	4tAJx1tnxaPOeT5BTjMRctQlt+aWmFUJiyZuDXKcW9GVfPrlcNMwZP1fBQtiEFEBUxtM8HSb1fH
	1bmxib3t/1Ghpw5lsdS409YSPUhthhx/A+lOGP9Irbh9rB435nNf3Asoy/m9r1fJNDUvbD/dfhS
	cpRUrR1hWNVUisaQGpRHtnSVdGlaho0BvMT6cPyq2XDUqwh2sm9BdQ2Aq2KSn33kq4go+FMimef
	QhnIO8iA7jBSt3x0Vxyg/iy++HHFIkdlicxnZ/7FkpqvILpTFkXolQeFaQ==
X-Received: by 2002:a17:902:d4c6:b0:2dd:c100:3130 with SMTP id d9443c01a7336-2ddc100319amr56593615ad.44.1789880146239;
        Sat, 19 Sep 2026 21:55:46 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:43 +1000
Subject: [PATCH 04/28] ASoC: apple: mca: Fix PD link double-frees
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-4-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=l6ILyllDJHogvaPe0jQmA0G3c3totE6rg0ScLhCeibc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+U5j3Q8K1d7n3zG7LTOxmmXz5Q2XzaeunGxT7HUc
 45m1SaHjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRPesTwT+HVJhMTvqn60VdsGRn0HgazSXQf/Jq76funXvH8tlWL1RgZWk4ftrd
 /oNc+ddnUN1O2mJZWhlTNltBy1Hz0+n246IQNHAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Add additional checks to ensure MCA PD links are not double freed.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index be702b2942a5..66196c6a9273 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -303,6 +303,7 @@ static int mca_fe_enable_clocks(struct mca_cluster *cl)
 	 * the power state driver would error out on seeing the device
 	 * as clock-gated.
 	 */
+	WARN_ON(cl->pd_link);
 	cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
 				      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
 					      DL_FLAG_RPM_ACTIVE);
@@ -326,7 +327,11 @@ static void mca_fe_disable_clocks(struct mca_cluster *cl)
 	mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN, 0);
 	mca_modify(cl, REG_STATUS, STATUS_MCLK_EN, 0);
 
-	device_link_del(cl->pd_link);
+	if (cl->pd_link) {
+		device_link_del(cl->pd_link);
+		cl->pd_link = NULL;
+	}
+
 	clk_disable_unprepare(cl->clk_parent);
 }
 
@@ -392,6 +397,7 @@ static int mca_fe_prepare(struct snd_pcm_substream *substream,
 	if (!cl->syncgen_in_use) {
 		int port = ffs(mca_fe_get_portmask(substream));
 
+		WARN_ON(cl->pd_link);
 		cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
 					      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
 						DL_FLAG_RPM_ACTIVE);
@@ -423,8 +429,10 @@ static int mca_fe_hw_free(struct snd_pcm_substream *substream,
 		return 0;
 
 	mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN, 0);
-	if (cl->pd_link)
+	if (cl->pd_link) {
 		device_link_del(cl->pd_link);
+		cl->pd_link = NULL;
+	}
 
 	return 0;
 }
@@ -1145,8 +1153,10 @@ static void apple_mca_release(struct mca_data *mca)
 			dev_pm_domain_detach(cl->pd_dev, true);
 	}
 
-	if (mca->pd_link)
+	if (mca->pd_link) {
 		device_link_del(mca->pd_link);
+		mca->pd_link = NULL;
+	}
 
 	if (!IS_ERR_OR_NULL(mca->pd_dev))
 		dev_pm_domain_detach(mca->pd_dev, true);

-- 
2.55.0

