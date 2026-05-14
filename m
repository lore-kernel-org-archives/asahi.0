Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EBD3909B5
	for <asahi@lists.linux.dev>; Thu, 14 May 2026 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756781; cv=none; b=hXzNTN92sbiALrTHbTPgoIw6IrlTd+qS/h5tXhAq6cFGwEDc3TyCYGmemYmmqJ9nu8f7D1VhJRnyE0W+cfCXRy/KD9VJxztMkiApx/Fspq6bRy9b8JzXikiEdSFX+VZM9czG5Vq7J8uovQz9+tf+fetnwwXIwk8Tvd/RxV4sfM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756781; c=relaxed/simple;
	bh=47sog5D+xEQbGjajYDAtYcSG4JoXZ0powok8EU5fFOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lqGfX7aq+14lVMY/wXz3sBKFDJOkowWpNYYACybFAeZdXYtFOID2INTE9+KPjcVIsjXnxqZlMyH5qNjNUHm3vkVlWapl829x3DJMUSj4tt7vBlt+kYiquuvLGK1k1GMKBTK9JNwmlShdgjriKE0g535R4rW2P47rtwmxPST0ruk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B3m2I5/S; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B3m2I5/S"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c8021c8c42fso3402539a12.3
        for <asahi@lists.linux.dev>; Thu, 14 May 2026 04:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778756779; x=1779361579; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=umazs7xdzJh6gNqfVRcGHxjaKuxZgvm9MNq62f5KWtU=;
        b=B3m2I5/SBybcNOvM3hpAwHRobCE+mrlh+Y+/ZhgE+uVwvGFDupr+dku4TkFINSGigS
         7KqrOP/sPiaE76fjFkWEcgDyTWAL/tMY9dhq7mlGSEKzoA8+7howziLyU1M/mrvDvXoS
         lTmofAVkTeFn7wIX3X+rChXaibuBByAbp+36gCNSUqnwu8Ws2T+rt96JAjA/rEw0hErt
         KWwExxTYvmmwh8ytXeV4P6VcnsI8AoMO9r0veH8Vzp95DcDsP2RjUOprRrFpI5FgGV/f
         LTM6jNdLkAI9ETqPgASoRvTmmMqjIqm/vesCl9cXkAiOOvVdBBmeNnmB6Dj3RkZTjIYv
         Ghvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778756779; x=1779361579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=umazs7xdzJh6gNqfVRcGHxjaKuxZgvm9MNq62f5KWtU=;
        b=FN5m8xfNqyKcrvLInlIQ5ZU2OK4z4PI8/mM/i1yoPQqDjRNxPP4xQYt1q0Oc+Iy6WM
         gi/a0qjNcPtg0CoadQpKWF4qxqO/MvcwdGuFB7jJTS9dY2bYOSGUiRfS8Fq13/giYJJB
         kAJn+mkMh64dIEAXZ2xdF4lwUb3ZtqFvA3NJW0aeFrM9c5aVZeeeGmWhqAbGvf1bBnK5
         jIF8dFSC3JmD66O54WgkGd5MdM4qZUkh97jyPsgNx1Z/W7AAaVntPHLRquBqLTZlkOce
         Mn3q72jzEsCcGiZGI6jbzTeeBf4aVu9/rjbbgDGwYn3jD8dfHmsWc95wE49LH76Wd+Et
         xD7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8RUdO0WMUitm2WnowbxOKsQZOWSwCqJZq5flnubAFd5bT34b2h9RiRrQUxWPQPaReK5VG6Nw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxwJGLg9qGMGqB3/TREPpcbt5PILfRk+d8R8/wYWbOSSr+kHxIx
	AKDG7GQiiU8LRWTfH8Rh8oYvL0skIA4AlGebf/kTH3/UY1C3hf4eCq3p
X-Gm-Gg: Acq92OHnLipyzrLp0THwQfJ7U/F4qki/7A+mWkGsxDvSqoyPofkgklRVT1BDk3/jxts
	JVdgu9YTVP90Y6hQryEGEYM24hCMMrr4jqqsyHDf0jIkZ4iuYcrkNsYAJDz+3s04upNYhHrWDAK
	meTui24Jy4yZl8qf3ExZf4AhVPEgiGAhDn6iyNNGxC0J9UPcvT2g9CRJ7Xwc9aV1+gI78BKLLo+
	dlrg0AW4vuRBhPzEPoey3CLm4apIiPh52tZx0kGYMiADrdfVWjOuavXo/w6/3dOJs6w5J+MR/0W
	iDd5BSNUkuSj9epOMROGVYW3YRvNb6awtKErWDqvyLI0iNU9awnjAc5YhQviNAHyPf0I4qzPxA2
	BFIbpJXuiRBBC09TKuL0DrbAwfu5xEa6hA8768Fwl29rmMpmXv2NUmeGJGbLMD5+LlQ6Hu44GZp
	/igxMOZxq6FXyEpUVdC3VYbscSQdBP0rMIOy20xTQLmj/B0A9qSdovbvSrRg==
X-Received: by 2002:a17:902:d392:b0:2ba:7610:3f21 with SMTP id d9443c01a7336-2bd270fbe07mr63185415ad.5.1778756778730;
        Thu, 14 May 2026 04:06:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c0600b4sm23053735ad.28.2026.05.14.04.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 04:06:18 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: ti: omap-mcbsp: Remove mixed goto/scoped cleanup handling
Date: Thu, 14 May 2026 18:06:02 +0700
Message-ID: <20260514110602.30480-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

After converting to guard()/scoped_guard() helpers,
omap_mcbsp_request() still mixes scoped cleanup with
goto based error handling.

Remove the remaining goto based cleanup paths for a more
consistent cleanup flow.

Suggested-by: Mark Brown <broonie@kernel.org>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-mcbsp.c | 46 +++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index d82fef629867..26af616c33f5 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -307,7 +307,7 @@ static int omap_mcbsp_request(struct omap_mcbsp *mcbsp)
 		reg_cache = NULL;
 	}
 
-	if(mcbsp->pdata->ops && mcbsp->pdata->ops->request)
+	if (mcbsp->pdata->ops && mcbsp->pdata->ops->request)
 		mcbsp->pdata->ops->request(mcbsp->id - 1);
 
 	/*
@@ -322,42 +322,40 @@ static int omap_mcbsp_request(struct omap_mcbsp *mcbsp)
 				  "McBSP", (void *)mcbsp);
 		if (err != 0) {
 			dev_err(mcbsp->dev, "Unable to request IRQ\n");
-			goto err_clk_disable;
 		}
 	} else {
 		err = request_irq(mcbsp->tx_irq, omap_mcbsp_tx_irq_handler, 0,
 				  "McBSP TX", (void *)mcbsp);
 		if (err != 0) {
 			dev_err(mcbsp->dev, "Unable to request TX IRQ\n");
-			goto err_clk_disable;
-		}
-
-		err = request_irq(mcbsp->rx_irq, omap_mcbsp_rx_irq_handler, 0,
-				  "McBSP RX", (void *)mcbsp);
-		if (err != 0) {
-			dev_err(mcbsp->dev, "Unable to request RX IRQ\n");
-			goto err_free_irq;
+		} else {
+			err = request_irq(mcbsp->rx_irq, omap_mcbsp_rx_irq_handler, 0,
+					  "McBSP RX", (void *)mcbsp);
+			if (err != 0) {
+				dev_err(mcbsp->dev, "Unable to request RX IRQ\n");
+				free_irq(mcbsp->tx_irq, (void *)mcbsp);
+			}
 		}
 	}
 
-	return 0;
-err_free_irq:
-	free_irq(mcbsp->tx_irq, (void *)mcbsp);
-err_clk_disable:
-	if(mcbsp->pdata->ops && mcbsp->pdata->ops->free)
-		mcbsp->pdata->ops->free(mcbsp->id - 1);
+	if (err != 0) {
+		if (mcbsp->pdata->ops && mcbsp->pdata->ops->free)
+			mcbsp->pdata->ops->free(mcbsp->id - 1);
 
-	/* Disable wakeup behavior */
-	if (mcbsp->pdata->has_wakeup)
-		MCBSP_WRITE(mcbsp, WAKEUPEN, 0);
+		/* Disable wakeup behavior */
+		if (mcbsp->pdata->has_wakeup)
+			MCBSP_WRITE(mcbsp, WAKEUPEN, 0);
 
-	scoped_guard(spinlock, &mcbsp->lock) {
-		reg_cache = mcbsp->reg_cache;
-		mcbsp->free = true;
-		mcbsp->reg_cache = NULL;
+		scoped_guard(spinlock, &mcbsp->lock) {
+			reg_cache = mcbsp->reg_cache;
+			mcbsp->free = true;
+			mcbsp->reg_cache = NULL;
+		}
+
+		return err;
 	}
 
-	return err;
+	return 0;
 }
 
 static void omap_mcbsp_free(struct omap_mcbsp *mcbsp)
-- 
2.43.0

