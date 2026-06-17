Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501153DC86E
	for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692825; cv=none; b=JOXDWOzXDsRz8+8U4hZka66LbOj4LTyGx8p0BL3xD6G0A2gtMidlP/mVeXxzHHTFDvsySjKV8n1Ef1VngsyqHHET54qwR6Er1WezUWvits21QCKyt+kD1lNFH6VV9S9BS7QC7qFOZDA2d7aMvd4ZzFSVMufWUKbx9doDas/C7ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692825; c=relaxed/simple;
	bh=hnVgSVk2XjKkHVJ2nHstb4qGftdMio+vZ/e9nU127qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Job+zorKE1w2WYzX4mHYmEyNjale7xaZnI94COwK+MHtyBjzC4lAC9O/bMvPocDJ/mLEmKcfB9CV+ra/oLTAiBT1m2UF/LxUv94s06jRYCp42nhux8vzK8EmzkwgWREChVrMuDi7T8ZznuhufuZo7yLZqgM/1oEDeIGMMSpT7Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUBXfVdN; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUBXfVdN"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3078e0dcd67so5793817eec.0
        for <asahi@lists.linux.dev>; Wed, 17 Jun 2026 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692824; x=1782297624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiB2cTlRUl71yyu1OdTexyxMokBPzW7qW0HIhsxCVIg=;
        b=YUBXfVdNjCNzSVHfNDT3P3EFlIlnhVV/AMLpCT2DWSwO1SOG/bK011G/w0PB9ejCdD
         LXucO+yn9oZr4CIRxFP2Liw8rry+Q+DbgKnv000/H/tJ4jX48GlphYEmShEoAF0nCbhH
         1gDikWPZ5MkopotCAs0krveNF+YvX6JPwRZ/d9v0nFSAyiUEA9IAj+73L07landOD/NG
         YqMNjTudDnRYuN6xKBWzNovAJVCmuU4StzGFDmkUlMH74NdI/yjm4v63ATbI2xeaGkpE
         NsokvC0rJkDsP7Mwf6GwWPAU4GSqVK24eBpY43Gl5EBSRo2xWHdIrZXm+l7BQjT3s6dZ
         tsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692824; x=1782297624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiB2cTlRUl71yyu1OdTexyxMokBPzW7qW0HIhsxCVIg=;
        b=HqlkRJ90fyg/YjDk87Zji/2SYwUCE08Mxkna7mBMNXNEpMdjQWt2XWzsAO+usYN/Fv
         /6sLBOV4ONreHid3ntgxtvXNcgixTeL17Li5lsX0tiMfuMCrABWkTjpDJVo2WjU+/IVY
         QG+tzmNU0ThbQ4SQ+GM+YpY7ILunI6R+oIUY+Tru/jcVYsyT3+kwZ5wNL4qFNQM44ldE
         rTW07SnPQyDObLrQ3IgVKuUt8lu9/ni0AVf9nCGJViD4KnD+zePDnhGB+KyqImvHRpL9
         8MjtrGy8C0iN+5P1FkpUdway91L1VtDzppJ2jM8f1M7yDgq+k1VOmBaHbFwYpV62Xjp5
         eRcg==
X-Forwarded-Encrypted: i=1; AFNElJ+BMQTFYlYzfFPHWTLxRb1u8xt4jlkNYeH5+ewqkDMQLoR/Gt4gKNFLYOXaRmW4qOIezkxWMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyebnN9tGE6R3s5uvBI2vIxw7Dv/zLVZHiMi5PwGbO18MXKZIfx
	zmMC50t5gRs26BLuYDVvcir+YYYtFQ/NtwCO2Fjv+yJL379Oo8Vpb5BE
X-Gm-Gg: AfdE7cmbt6OtcKVVhXlh33ER0Mb25rjVdSc97TPeWvriIodl64fnVdGRKseTtVmHxUc
	DtJYTkCQeNSKiCulPHLAxJRomGVBptAnAUc54fPkL6Yh0dBMuMfhu7zrXJ0ziil80T84V1P7Jkl
	R8zO66vMNp9vxMJblD/ArRf3j45aFQB6ib2G/oJC9m078mVvRbLCjb48UQ4ee/3Nf8euo/+vu18
	9MMzVNHXnBl85BDWVAPCHttQAjoQySyxt0jR2UxuNqTHP1mcqFJgLpX3RR0iw3BsrYdifGFpF4b
	ZaYaXMqH3EasQNfNouLWLUCsHwO+pJBtSMC8cgxaKASWlYP2E1XzaMpYnktJKTmAHxGgsuVGRme
	DRrFnZtJoJPv1STQ0FiwbnjIxevRoPBeVSi77UVClgD0Eq0b8oo/pZsCJITfYMGBilpPp2la/1K
	0lEpt3WxfCjyNlBJLCMWbFW2D/tEFk2RY9a0OXViW8LCLMDCNN7s2rceLqAg==
X-Received: by 2002:a05:7301:6583:b0:304:e59a:e3d1 with SMTP id 5a478bee46e88-30bca0e2049mr1526809eec.24.1781692823559;
        Wed, 17 Jun 2026 03:40:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:23 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 47/78] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:04 +0700
Message-ID: <20260617103235.449609-48-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt700-sdw.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 30fcca210f05..8b15bbc31ac3 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -416,12 +416,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt700->disable_irq_lock);
+	guard(mutex)(&rt700->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt700->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt700->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt700->disable_irq_lock);
 
 	return 0;
 }
@@ -502,11 +501,11 @@ static int rt700_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt700->disable_irq_lock);
-	rt700->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt700->disable_irq_lock);
+	scoped_guard(mutex, &rt700->disable_irq_lock) {
+		rt700->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
-- 
2.43.0

