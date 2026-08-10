Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528DA43551D
	for <asahi@lists.linux.dev>; Mon, 10 Aug 2026 18:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385479; cv=none; b=aGX9O61uwhk105KvZ5he2PTypYjI45RH8VhE8Ad2HVlmWUtPxDhcZkfFeEy3T1dM8gsiCFf8OMbDepZlU4z4fzm0pFW7++MlDtIFFoYgWGAPbP1BccBb7UtAY3/BfTINHx+5ycZZqiG57RMcQCgBwMt4qL8uZf6sVRw9sKU6yhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385479; c=relaxed/simple;
	bh=esXYBAfmKoYjtMYG1Fhxmw5GV454BNtliriMAheUUpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oNMY3skB2ZL9hPxkiNJXX025gMxSjQIpx9iY7XNY3SesLj9I7GH7h81hzP+kye2s18LSkhOCLgRCDf42ArZVtmd/aCFEsvdODCXZxBEF3EQ3eTIw8olYSP7eB9emG/V7gP4r95Z2gq7WxcyBGcjKk4RB6x72ppnVuBA6nm7/SW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYS8kSIR; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYS8kSIR"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso1935686a91.1
        for <asahi@lists.linux.dev>; Mon, 10 Aug 2026 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385478; x=1786990278; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkIvExABzzIA572IGBET5kLr9qvjxhndAMy4fFMeZZY=;
        b=hYS8kSIRTI9lxANU21Xc+rj23WufdfTz8BExsecI5OTHtimDS7xtPU7ifIPRhQJfVu
         5SCVcPUNZI87NlZ6lBgdFMYQLh5ZRtVQ8CxaOP357O7/CJej5X0OC0NYSJ5+PPxAtMYA
         PNikyz+Kqn2aOqAQ843OxEnlKY4PXNO4c6Z5UCokEzREGwOu3Hdm/UGdS+/tx8fRN2Kt
         K+QEgA7e+EcMgCJyKlgj5ORFLse8YCIf79SbFOCG83k1bmm6vXZa9eA9dm2g/GnNgpOK
         KP/83dyLOS4O9x+EyhXjTDGm/4zZBEpjCcktYEwQyK91VSAROt0+5MC2g9pM34lv3O19
         HjdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385478; x=1786990278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkIvExABzzIA572IGBET5kLr9qvjxhndAMy4fFMeZZY=;
        b=maVj3SvTjRmWUCgt/TWLqIBblzWu8oWK/wcHj1LkMFJdbp84Nm19PY5GLDxm9He+J3
         ZYjmljtx3MYayoMWozOxSzWLXO+0TG/3DYHiMn3XvPB1NAl5K8J2KHTs1Zv5KHmxk14u
         YS4kUVj7cZoboXKBDFJxgrKwXQEj1IvWNcn1e0uv4cL4GdKLwNW4x3f62NJdwNQydHM0
         e+Z0se3PmucysbapHGmeOzP+i0Hctqqjd3IHrQED6x6KzKQL50Dlq4f/CrYeV4t/Zw/9
         ux3nXgC4lhU4eqxWHt7xt6coBfs7CVj+SK/0cyk3/RreJzOqueApLF22+yM+NcGA5CDi
         BdwQ==
X-Forwarded-Encrypted: i=1; AHgh+RofLcY3GnHdKrpIybyam1u2XnGVV36yh3x40cnCLm+TQB95/FsE10qXnUqNHRvlDUcq4oyuIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzyFDxkoztfmZ2mW3SIw5q0hSdp/bbjUOati02Mw/oLvzMEt3sR
	0C8Gc8LBbgno24ZRk9iW/ofgzVAnWgRTzj0tQAJ7PzPkw4Sg8rjdPhcS
X-Gm-Gg: AR+sD12hU4tTS6OZUMMAdrxgiXdTbFOYroPO2x/kLBaUyqO8QrB6hdor/kst6VIFDYC
	z0gxpAdP9c4WzjLb2yze307uO/hAwSfBKWc79yw503NPf6DdPrc6ibS8+bhk9+c/oZoTMxXmK6E
	9ZH0j2mYK4dX4m+0VIg/doVKDH0P2wcIse+1ZdYqqIezulmyzFYOFn5EuLcpyB2LPB25AGt2p2c
	pDLK33qo5j3Co3KCmya7h7En02jREip3/vYUXZJU4PTqQtrEPTHKfwBty22cAqs+FwwsAs6l+Rs
	gWwfx5KQXO4HinnbbaLRTA8Jz+IbiD0bku9RkhwIoMV08+p7AnyhQC3akzRe9JGJDP5VoqkClqp
	DK1YjdA5zkI6IVtulCpCEc8pXwBK9omJ+MNw8O4qj+sLr5Na1/w/qyL8p1UBi4P3b6p7ixdGEOO
	fgfUJTGE6tWw0w9I82lslzCSZHMLom//MD/D0LDCzAGcqwCJhn8JaMWXbhUQgwocM=
X-Received: by 2002:a17:90a:c2c4:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-392cca3507dmr3372142a91.15.1786385477700;
        Mon, 10 Aug 2026 11:11:17 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:17 -0700 (PDT)
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
Subject: [PATCH v3 03/34] dmaengine: apple-admac: use dmaengine BH callback
Date: Mon, 10 Aug 2026 11:09:04 -0700
Message-ID: <cc5172b8779e4cd15f2c1c7fa93174aaf09dbffd.1786384168.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/apple-admac.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 14a5ee14a481..c5d4fb96d3c4 100644
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
+	dmaengine_kill_bh(&adchan->chan);
 
 	list_for_each_entry_safe(adtx, _adtx, &head, node) {
 		list_del(&adtx->node);
@@ -662,7 +658,7 @@ static void admac_handle_status_desc_done(struct admac_data *ad, int channo)
 		tx->reclaimed_pos %= 2 * tx->buf_len;
 
 		admac_cyclic_write_desc(ad, channo, tx);
-		tasklet_schedule(&adchan->tasklet);
+		dmaengine_schedule_bh(&adchan->chan);
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
+		dmaengine_init_bh(&adchan->chan, admac_chan_bh);
 	}
 
 	err = reset_control_reset(ad->rstc);
-- 
2.43.0

