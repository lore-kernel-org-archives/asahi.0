Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316549;
	b=4auW1w/v96BoHuadjAaR5B2gDKqYiIEUhe4yOBT4Z5W70GcrM/KDjj8Kx9h8SuxwcyiZ
	 P4CvXghPMdsyLriD0jnCz0/FPc1OH5cmmLe7DmYHNjV7O+9RGpx43HiCexl+NQAaLYA1p
	 eytNUqGUGGgICYxuR6DeligDDViwEgtHz3rx0MFDQ0j2mP8oRW4L9/dMy2Ce1SoKRAoSa
	 D+GN47QyoGF7mPekvVCLx2X44aH8o6DvkEMptK60De0abdBH/A95ottmMzGdY1ERj5oLE
	 CDfxJUlBTuShWukPuzCYfTNRhEMP4wLRVvvaET8MBLhju+u3WU/mvpiNC7RhwQHD6VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tmWyDYjfuijNjJiMSishS4j7xOVi0f/pb9IeEqewhlw=;
	b=JB5O7uAYQcVlRm1e//gg7Qja5tHNhPciczhC3szkRrBL5aKAVtsEQ51B6VPR/DMZF741
	 NhHjNejZ3cDLv8lescXRxCg1k1rd7fjHBPWZh4Ar2Ie1x6lWKMMxjr70D+ST7W5PL8cGw
	 b8GaY5LdjoxHLEBm4pLjhiV9ooYUMnFL68X31EAxEpoa6vjTz7lB6Cv05DCLah5B9Ma4s
	 7At90M0FO4csVYYQl2gA6kTCIkNarNzt6dWpbeEgp4nKC7w+qV62pfdbPQsog4oeATNuw
	 V/Hqs2/ucNa0i+JA+p5JnM5Bt0ygEeJTBQZtd5j4D2wB+UKuLdeBRs4mQUD01Pf8m+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dl1GA1GI;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E81A606E47D
	for <asahi@lists.linux.dev>; Tue, 10 Nov 2026 13:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E81A606E47D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dl1GA1GI
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso988717a12.2
        for <asahi@lists.linux.dev>; Tue, 10 Nov 2026 05:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316548; x=1794921348; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tmWyDYjfuijNjJiMSishS4j7xOVi0f/pb9IeEqewhlw=;
        b=Dl1GA1GIfVLen0kmtxvGg4vbdJWVsXr3lLqqTS8ZENHP88RGtYm3gF47xkJlhunwoS
         3qvc5WAjkTcJ/Gyh5q737AvNRwg/k+9y+FreQfIF+u6+t3gco+UvjiV/7Qbt1lYrOX6B
         QAheno3AeKDtbtSiTpha4q1nD7K0onNelghikW2SojugCmn6edH1ruLy45uCvBRxkmHZ
         bggjBVJjLahNHdPtM/Xd0H2zRBSqW71GXCoJLB93u6KwFpLXICAJyC3G3hSSFWDmzUsX
         HQHu3CKEd12O34kHOO6aCTlxSW4hYf6qVZ3GQ84WVTmlxZBGNuYxJiIBTmJbmKG96xGC
         wweg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316548; x=1794921348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tmWyDYjfuijNjJiMSishS4j7xOVi0f/pb9IeEqewhlw=;
        b=G2z3oUkA0qLcFiOnvPhiaL2w505JNwVhcp6o0GBurKzTZyAv4SD0oEfVy2V6wnOoop
         zTH+EULWZrduWgtDe9QvH0h6fmra5kqCcX0KoYmUnKGyQfEimTeTanuaQM53NNRyigv1
         XNZMd/K+8Zz1EXBdasKLmq+LkQVrlH8Dvt48PPTgSnTPWcDNiPo9/hbTNrG752cId4kL
         nwMWVhKM7mwoUvhcABU6u8Akhx1hHeBM2vksTeDiKRMNd3ceqbqqCGCHIxhX/THqUOyM
         B7StwH9WjGRdzNCFG0FS9jEpuiqJIZIaW5uKNQsHY082CQv6AtFlxFuaZqjQLvhmDtac
         0X3Q==
X-Forwarded-Encrypted: i=1; AL+hErGsK0X6XXEX9s5lXHD6g8HQDMD9KVV7kYUzTpp+tsWe9+R0dPbmGyqFBuD9UEpQFvKcUNk9Pg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Qr4wNQ3bsMHgUKb9H60p+dgFtYJU/dZdsG6CbKo7bCNGa+JvQ
	21nKBAUyjc7AgSNG/3HUztbXRLF374DF3mfut+KktNe7OFMJJmPdO2IZ
X-Gm-Gg: AYBFou0YaAtKE+uRRBKU962zv262z7tJs8lCpzLuzr2wHLNTb70qJXRW0HkTlp4xDSX
	MjHUZnvVY+zX5aEhKVE5aDdPZtkxkWdeJXm1K8tcKp2RIBK83WrNsx/nkCbtB0XnSXn6Up5ox2n
	LonEAwLRryZngJIAobbiuM/KLCVMODRzPrjoO8JK0BGztTPmFE1xAe8VIzCmiJDqR8wkX1deqtF
	qvy9h6eVGM1YQHvJcczkEdKzeM1U5mm2JHwGEkSqKyYP/blSqPv62Oj8rAOOHSl3EHTGI5FFk+i
	nqhum4Fjc1jYEAmAT1Td1itDoNl4nPT7drmUV6SdK/VQ0Wk0Ese841ewdy0Av2u4ETXseI4LCqz
	077z0Dq9UXg2EIjMBsizzy17pnwqsCEFlRUYLurtYEnr2RofpLhFrtVPToLcV5OVU0TaRA6nqox
	9h/QIlEy8HMIDoOBBFJ+e97SXDVbFUJjR6FpGIafgtIm7hC51Y1lV1laRruPq4AIxh+lGrbw6xw
	zZn9QKIGkrjpoC6/+CB15ZiV7pN2sFE4hPjjJT1igxuTWu9BR+xQY7mhvTH7UvdIsPtC9wZHCar
	xLSDGGNWdZHUSyiQtJL7gcXBzFso8lSZ
X-Received: by 2002:a17:90a:d450:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3b166cdd823mr2893205a91.30.1794316548329;
        Tue, 10 Nov 2026 05:15:48 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:48 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Frank Li <Frank.Li@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 03/33] dmaengine: apple-admac: use dmaengine BH callback
Date: Tue, 10 Nov 2026 05:13:03 -0800
Message-ID: <c1c55434e01772a1ecd12044feffe220f06cd72e.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/apple-admac.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 4531a301c018..2eb863d1bb58 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -97,7 +97,6 @@ struct admac_chan {
 	unsigned int no;
 	struct admac_data *host;
 	struct dma_chan chan;
-	struct tasklet_struct tasklet;
 
 	u32 carveout;
 
@@ -530,10 +529,7 @@ static int admac_terminate_all(struct dma_chan *chan)
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
@@ -552,7 +548,7 @@ static void admac_synchronize(struct dma_chan *chan)
 	list_splice_tail_init(&adchan->to_free, &head);
 	spin_unlock_irqrestore(&adchan->lock, flags);
 
-	tasklet_kill(&adchan->tasklet);
+	dmaengine_kill_bh(&adchan->chan);
 
 	list_for_each_entry_safe(adtx, _adtx, &head, node) {
 		list_del(&adtx->node);
@@ -671,7 +667,7 @@ static void admac_handle_status_desc_done(struct admac_data *ad, int channo)
 		tx->reclaimed_pos %= 2 * tx->buf_len;
 
 		admac_cyclic_write_desc(ad, channo, tx);
-		tasklet_schedule(&adchan->tasklet);
+		dmaengine_schedule_bh(&adchan->chan);
 	}
 	spin_unlock_irqrestore(&adchan->lock, flags);
 }
@@ -721,9 +717,9 @@ static irqreturn_t admac_interrupt(int irq, void *devid)
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
@@ -909,7 +905,7 @@ static int admac_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&adchan->issued);
 		INIT_LIST_HEAD(&adchan->to_free);
 		list_add_tail(&adchan->chan.device_node, &dma->channels);
-		tasklet_setup(&adchan->tasklet, admac_chan_tasklet);
+		dmaengine_init_bh(&adchan->chan, admac_chan_bh);
 	}
 
 	err = reset_control_reset(ad->rstc);
-- 
2.43.0

