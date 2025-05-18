Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E67218ADD
	for <asahi@lists.linux.dev>; Sun, 18 May 2025 10:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565479; cv=none; b=NIiVJLLj4EDKvYwTHL8qeqNZPEDXBBPRi+1QXlhlzpapeyWrOb/JUNnZ2IzoYlyDeoyslBQP5s75ZsmRQUMb7V7YKgOGVFUsOCwaBAfBasS1KZdzNjeXgAxvShnCJ6WqF4BYKvMn8tG3x/2sZA1oMT/NZMSo1ITZWw+Ux4K8sfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565479; c=relaxed/simple;
	bh=SwU7Igjk1OKbEDVoSx0S67xb5ZjoJ9Fk34L5QbHSCFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXslItP0ERa+2I6Sstx8bWoiH1ZyZzqhm2HsY+EMmIqgckrZ0l0UG+VRKiz1FodVP7SpqfGx6TK94NkNzD1meWHYdoHPnbmnko/ZSZ3zyM3R0O9lRgtel0/CKqSMTd6raPq4UVIMTpeYWdo+7iYhj4bVYs7b8aA0TWQqwttPGIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLePJU+V; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OLePJU+V"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7fd35b301bdso3911328a12.2
        for <asahi@lists.linux.dev>; Sun, 18 May 2025 03:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565476; x=1748170276; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g13jfsVMMfWu8pewYbMs0wefEJmwd0O3Dz3BH7Y5ODY=;
        b=OLePJU+VLWbdipvk8LIpzONbwD7rOdMDmMszTo8u2NZ/yP9+f3zNMRtaOKouD4G33o
         BluelRb/VXYygcG+UBwg+x+8hnAhRij7fzEZm+Il1iD96dGAvYmlV+rbz5HaIgb0yPrM
         u144J/y7Vfn4wt1+M42zGV9k44GeIpk2scxLjNbDO7bBAFiR3r6tHVb75CAguz1dOykF
         mdPA4HO3CjaG60+7vgqyh3VLRmeY74+ZYaJB+ULR1AYT3++rRkDjfKAH9sV7H+WY5/Yb
         Cj/55s4VpQDn8VzLwgYc8zB4FNe4eqIITxXVmXhfEAkBUQDUj7eVe026EBDi3EVgIeBm
         4FHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565476; x=1748170276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g13jfsVMMfWu8pewYbMs0wefEJmwd0O3Dz3BH7Y5ODY=;
        b=hR2D3UlbRvxXdTM8C3R9HtpkqR/7W6efB5LX2q5CH0rj9YGaOwx+vUSS5uz8T8Tkae
         d6x2FRVmUHHRBiQJYkFOqq7uIEoOL00Eetxu5smNeoP99Qd5a2BJnYGGpsyZy1L1ezm+
         fxmR8SD8l1kCdIyBBh67eDzjKVdA26j/K9a1diVLF3bzUsGd3KdHctolgVFtKjJ6RkM0
         29C3mIyO6jJMyOF4mftV2olHPMlMFnHZyFaly7u6JuEAlvok8ES3iQKVYBY4TkME1r9b
         kgMeArAwuvOC8S5OWNsTnF8Z8SrdpLcbDSn70AjqD//kxZjcAbSWQ1NHGl0NSszsD1cP
         1mWg==
X-Gm-Message-State: AOJu0Yz4XkEH2BBLHVhXhdUosrFHsk6a5ZqFVjfcw+atcpSpt4HGpZVk
	ofA/3rWV1hNN7r4KfTz+pOxiD6bAKEkH8e6mzOGb67lsOnmzejvL84kS
X-Gm-Gg: ASbGnctErKL01yWeCwlC4Q+IggTOK8TCKQJxxpYLp1zbOAHTwgAQFzBL4pN7+ubUnQC
	ifA1hEjXXCID1+KsWdYJQjqjsgqCRzjhiHI35h7SAksRPY8tDerxqIHuaevQHIQJIpuruXyRnXO
	LpKk7V9cf8bjmsl/1w3fPetYWhAMQg64VkKdzuEyxzs5X9G+3t1FE+uQbhiFS0PEH7fkCU672Ek
	HaGS2QKAY9nl9wlMeHFb8CNQm3tVFlpQJntYFGfdNjq7SJT5h8S1BjZ1bpi7mMVt254xFlzK9x9
	VxbMZSxDSCkSJ2vSeHZoOH3vQjjHJr6093zi0hb7GYTTCo+R72c9f5PEn6riCoeI9pRRRLv8bwz
	CCdKt3BhiiqopqW1C5mZz7IBPaS7nEpmGBZgsWdhTXF3L4w==
X-Google-Smtp-Source: AGHT+IH0++ZEekfseuEpGWz7SUdCTKKDqWzyZxz5uA1rOlUbjvPfNHqeN14zJ3GRIw57pcl2hG74Og==
X-Received: by 2002:a17:903:1b6d:b0:223:f639:69df with SMTP id d9443c01a7336-231de3ba65amr146473675ad.41.1747565476301;
        Sun, 18 May 2025 03:51:16 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:16 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:47 +1000
Subject: [PATCH 2/9] ASoC: apple: mca: use readx_poll_timeout to check for
 cluster reset
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-mca-fixes-v1-2-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2194;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=SwU7Igjk1OKbEDVoSx0S67xb5ZjoJ9Fk34L5QbHSCFM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau6dfETisfvmXRu8ftgalvxu5ls8+nWX8ppvz4M+pv
 JNyYo60d5SyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjARtkCGP5zvRdMsbmsaLlsm
 JCWguLUqM2PJPbY1NQ+Wzf3El1qykoORoX3jArYPKebGUReTteTKPr7y0yi/5LyUUWXN9QCxmnY
 nLgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

MCA clusters should take no longer than 1 microsecond to reset, however
it has been observed to take longer on very rare occasions.

Rather than just add an unreasonably long usleep(), use readx_poll_timeout
to poll the status register for a clear reset bit. This lets us have a
very safe maximum wait time, but continue early if we are ready to do so.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 5dd24ab90d0f052bb48f451cf009dc2e9128014d..7113da4bdea7b687c0d44d2bbf3a511b8299056f 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -24,6 +24,7 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/init.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -197,6 +198,7 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 	int serdes_unit = is_tx ? CLUSTER_TX_OFF : CLUSTER_RX_OFF;
 	int serdes_conf =
 		serdes_unit + (is_tx ? REG_TX_SERDES_CONF : REG_RX_SERDES_CONF);
+	int ret, status;
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -211,11 +213,15 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   SERDES_STATUS_RST);
 		/*
 		 * Experiments suggest that it takes at most ~1 us
-		 * for the bit to clear, so wait 2 us for good measure.
+		 * for the bit to clear, however this has been seen to fail.
+		 * Wait up to 50 us for the reset bit to clear.
 		 */
-		udelay(2);
-		WARN_ON(readl_relaxed(cl->base + serdes_unit + REG_SERDES_STATUS) &
-			SERDES_STATUS_RST);
+		ret = readx_poll_timeout(readl_relaxed,
+					 cl->base + serdes_unit + REG_SERDES_STATUS,
+					 status, !(status & SERDES_STATUS_RST), 2, 50);
+		if (ret || (status & SERDES_STATUS_RST))
+			dev_warn(cl->host->dev, "MCA cluster failed to reset\n");
+
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,
 			   FIELD_PREP(SERDES_CONF_SYNC_SEL, 0));
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,

-- 
2.49.0

