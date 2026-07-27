Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E997042CAFC
	for <asahi@lists.linux.dev>; Mon, 27 Jul 2026 20:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184267; cv=none; b=QaBtrIQDSowJpjwdLK64bLCnB2Xgo3E7i38GLHhAlvxwm8xCDbsfOgyx2OrX8H3V3eSzhjN0l8sz2zJDNdrBRr43TRHybRj5hLdFI5UMmslMT8zEiQD5mRBL6W59GBu1eagyA6jRZYO9KNRM5uoUPbJFzYOBUGmZlAoOGIK9Itc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184267; c=relaxed/simple;
	bh=52mgaibdl5c58d3AYAN5WRtXVWbPgmpaRi1q76IfdMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sQZ2rginaixdb1QiQxw4IUAln0Nx+OXafjLykCAfplANcp9Y5sxFK2dq9lDFqKHAGrqEOrGpJeSarbcsqRC8O4YpUPom4K8jL9fv7x7hkj1KtDMxTLKiDwWNgof4QI85V2bRtbGeJDQI7TKwHILwUYHVbgzSsvbs5GbDFetGBvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjdGNoC1; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjdGNoC1"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso29136475ad.3
        for <asahi@lists.linux.dev>; Mon, 27 Jul 2026 13:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184265; x=1785789065; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wtr6C7a2bWw56KI7UgkJ9lIBa9lQozueu7UESTIAJSY=;
        b=bjdGNoC1E5cru7kcwdLPoj/JoAdDUWfP+eaumwqXndY33TjgdWNv8eCoilsUTHGCqb
         bdOGBFz9vBVfI85SXCpnkKPx9cfAVpiG+i/kAsz28OS9ZT3mSd2/5Nj1wQkYtR9vtN+X
         euGNcabd3NTLMlsM+ydSPUlbfEXrf2XUaQ8tA9vSmMBBCJIv+7niUk/yaUKD9GtBjVZo
         X217MC+hsuclWFz304GwNkpqaFFQnQ1uvDdsjL/B5oBk6tQQqpSDGSh7oXDIscMvmIGX
         qXNfqUfSSFHIFztpZiy0IrwP08dJUQHUytvsuBhKdd+cTDKwucJ49C/fwyTzzi26604E
         5CcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184265; x=1785789065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wtr6C7a2bWw56KI7UgkJ9lIBa9lQozueu7UESTIAJSY=;
        b=I4mrNIopECNbyH0FR+mXIMaSYXCKobO9ko/udKPKwLeq/keRETRNmJk0wvlJvw11Bl
         qYnZD3yDU+MOEf0KyeZ4qely3UpcSnq+8yL+UvZA4uRuaCuOpSUC23soAWdjIPt/N1XK
         sygTSO+kx+HQgJKvm2+skxctN2jM3jO66xKVElXNjxHMkAwlx4vJgI49po7W51XoJMKY
         rCLv+ryqs35aXQhGk7YTYoX3pmqSv0N8LbvJXHaPcilmano9M3pkncwmWaeT8AFQaxXz
         G4SatjvYo3kYiWBhM59Uc7xGAIAUZPDPGGUOyfYqpXJ3kG9sKT9PzBUy8aLu7hKlUXQ8
         d5NQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro7tqeBucr1zLJzUBY7h2q8KmG9veMHOS4y4qvq2LlIdV4u5bycrEmmW1GiUT98CFfwguXRnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyL7vVTfEtbhghwDO1SIsHun6pmFRGgf7dyLZr0D3OfDo7LXKx8
	iTXrnb6hQZ031EC/gS4nEBevh7uyjQF9aXKAI0tsb6dS55TJ2Tw70cSe
X-Gm-Gg: AR+sD11hRS/0m9Qgh1x8FWmSC64layCuPqoRG+8VxW4J064Qfids4vaWrURtpMDyhch
	05QD+lpGhJs+wm6nN3hkHLExImafSAObKKXbblIYDIDe5XmLdN5gYR6AbtccCHfVCfklb/63vco
	xB/tNKKOtUUq0P1FznD7YD/D/GxoLVQoOsi4LtHCFYZS6570TWPsf38tpPNOLfZkC8PR17Vn1/r
	UAZ67/KKiKDHs2WcuyAhsWR3l1BlH69Aod0+QRcdfIDQ4nDh5P/v6uskDp0CmLrKbmOi7GrFSEc
	toU14qP/eGns2H8rnnj1Q1bumP2MhM/7PeavPeBnFeqCOugWOYmq/Ydsz39EE/rqFKjItkMrJ60
	XpzU/5GxbZx1lusc2ISl99r5ir+4C2LBdsvzG7F9O5oMLeCmUFYWW9IYsInAxOB54yVI6m/jElz
	SCCRlL
X-Received: by 2002:a17:902:f547:b0:2cf:9344:b80c with SMTP id d9443c01a7336-2cfde7aca4dmr86641865ad.18.1785184265001;
        Mon, 27 Jul 2026 13:31:05 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:31:04 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 03/64] dmaengine: apple-admac: use dma_chan BH callback
Date: Mon, 27 Jul 2026 13:28:31 -0700
Message-ID: <3804b35d529e0b80d8d0898f1dad1fd4cb917fcb.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dma_chan BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/apple-admac.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 14a5ee14a481..84483247bde6 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -89,7 +89,6 @@ struct admac_chan {
 	unsigned int no;
 	struct admac_data *host;
 	struct dma_chan chan;
-	struct tasklet_struct tasklet;
 
 	u32 carveout;
 
@@ -521,10 +520,7 @@ static int admac_terminate_all(struct dma_chan *chan)
 		list_add_tail(&adchan->current_tx->node, &adchan->to_free);
 		adchan->current_tx = NULL;
 	}
-	/*
-	 * Descriptors can only be freed after the tasklet
-	 * has been killed (in admac_synchronize).
-	 */
+	/* Descriptors are released once the BH is flushed in admac_synchronize */
 	list_splice_tail_init(&adchan->submitted, &adchan->to_free);
 	list_splice_tail_init(&adchan->issued, &adchan->to_free);
 	spin_unlock_irqrestore(&adchan->lock, flags);
@@ -543,7 +539,7 @@ static void admac_synchronize(struct dma_chan *chan)
 	list_splice_tail_init(&adchan->to_free, &head);
 	spin_unlock_irqrestore(&adchan->lock, flags);
 
-	tasklet_kill(&adchan->tasklet);
+	dma_chan_kill_bh(&adchan->chan);
 
 	list_for_each_entry_safe(adtx, _adtx, &head, node) {
 		list_del(&adtx->node);
@@ -662,7 +658,7 @@ static void admac_handle_status_desc_done(struct admac_data *ad, int channo)
 		tx->reclaimed_pos %= 2 * tx->buf_len;
 
 		admac_cyclic_write_desc(ad, channo, tx);
-		tasklet_schedule(&adchan->tasklet);
+		dma_chan_schedule_bh(&adchan->chan);
 	}
 	spin_unlock_irqrestore(&adchan->lock, flags);
 }
@@ -712,9 +708,9 @@ static irqreturn_t admac_interrupt(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
-static void admac_chan_tasklet(struct tasklet_struct *t)
+static void admac_chan_bh(struct dma_chan *chan)
 {
-	struct admac_chan *adchan = from_tasklet(adchan, t, tasklet);
+	struct admac_chan *adchan = to_admac_chan(chan);
 	struct admac_tx *adtx;
 	struct dmaengine_desc_callback cb;
 	struct dmaengine_result tx_result;
@@ -886,7 +882,7 @@ static int admac_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&adchan->issued);
 		INIT_LIST_HEAD(&adchan->to_free);
 		list_add_tail(&adchan->chan.device_node, &dma->channels);
-		tasklet_setup(&adchan->tasklet, admac_chan_tasklet);
+		dma_chan_init_bh(&adchan->chan, admac_chan_bh);
 	}
 
 	err = reset_control_reset(ad->rstc);
-- 
2.43.0

