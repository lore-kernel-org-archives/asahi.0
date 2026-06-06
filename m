Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A443AEF58
	for <asahi@lists.linux.dev>; Sat,  6 Jun 2026 13:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780752377; cv=none; b=SPZ+3fzBub/CKEnkAG2hNKUgMensLZmrujfv0upNPIcYOJtC5ATgSrmRyKwdUJq3bxMaTtI412ChzSWbp2k6aZE++3JYHoawaXg3CwSuLcKU+8Baa2bTHRCzcR9H6uuKd+tWhAhEPF+PvznKNTs8kPihHsQQtf7ubRtjHGGACZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780752377; c=relaxed/simple;
	bh=lrseDDwhEGzRyA1udiirpwFfKwyONLsk+j6dkut+Ezs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WqtyaIF5+DnjFlCbvmBoVveBDkxMDhFdO/VzNRBhIGShe9tL9dJF3mDcqnA2ifN1Nms9ysudNo2wRVsCHkKgVq6WA/spDK+o4ybIjl7dooR/3V+nz9G1IZXDp0eIFadaf+tXqd3/bsHQe8yZVKh6feIhFO3vqrKQ0eHo6hoGVtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nr+PoLu2; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nr+PoLu2"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-842307473b5so2005732b3a.2
        for <asahi@lists.linux.dev>; Sat, 06 Jun 2026 06:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780752376; x=1781357176; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=42lbift3GUSRsYsWcu6WULLrIkIIMX8MmeNmUG1RfTM=;
        b=Nr+PoLu2H8zOYQO0dWtUe4chJn/e/2T6vTIDPHcVgq933Nb7avkwtLTZLkKnOcpUVS
         cqWshC+DfnT5KIN6H+dj1HjR0mT0Ch3aM5zNyYHDaLXjVgiRgVEHUMuIUrm1Ds3Zxu8r
         RcLecNSvSUjMVEbH+zEp6VqgUurAInbqWs/FxvFaKVYBqsjf71geviN1+lXA86ftws22
         UvIW0Z3sy4tdeyoDkIWFq1/CUqCJjRJbhxO6NqjnZSyA5Y+g/Gn6avTMDUQp2CdDJAal
         d+10h7s4PmhhdQXSfvfvPahkb6CTytwKJG5RTyr89PIoy2Wtyfe0piFvuiKFD+Hk5J4g
         ZEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780752376; x=1781357176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=42lbift3GUSRsYsWcu6WULLrIkIIMX8MmeNmUG1RfTM=;
        b=q9wZq2y6ug9KJH800f7z2WWQLBcW1syDVXJs2AtePkGhSSI8UHAixRInMJlJlPTGhX
         tI2JuRp3NleE28yh+2vy0Aq1lS4qX7PEmu7GsFJnmtAxc9oIF0+4/bqs9X5/fCOR+gMe
         ChfLCMzYN2AvOW5GaI42HTkOsSiSDQMAWhu8PJm69lZQc2c3tJpTVnicfMIDHlcmrJri
         SNDeuMbc2iGpXEJ1nyPaAIHHNcmnALr2WXunmoJtCzCxEjpMQdkVRAbdAtPpNF0lBIJ4
         aRqLwSdWxA4ZWq2XdRBKcJ4T1VcQZdKOvP6oCvkhIYjSdsJFzCn3zm/3kPBkIUnyy7o5
         sjhQ==
X-Gm-Message-State: AOJu0YzEPsgXSdOZNINmmYEhGZMFgnYFSREoEacxoq/lQzv+FW+e4Id3
	pCTiqcKzlROmM4qF+4tGcIeC5VZi8ntnyoacS8/1vcweEKWa1mYGGE1I
X-Gm-Gg: Acq92OHvflXJnYK84QTkuwtcBaILwuNb0GDRO2YKSWDjVcWFt0yJ8tAJdIOBpUJ2zLs
	GgOxUZgkJZJky3sASErHbu9Rk3aa2bLMBhcphHzgxZqPCYkUB7z8bEuQUXtJ69XHwA7+7ogoyri
	EU2++TlPxOgTBUS0+9fdRA+KmuhJEHnr9PdFd2PAjS4rbF2ypAbECwUmszTL/bTHPmMyM39QAmq
	6KCXhIC4pyfxt2qlgkrRNCh/1MRPUr4/7hysc2It2+0Mohdxaf3qlixVCz+sAZOfDR31zCUBTCG
	3SWTuxf3KwYAojAdurNrhgMb/Ck6A9OicRMuPAIh1t6IA4I75yezuJmogMCHkpF1F/Fcfp2SOU6
	9m/HPS1DbJ98QipLoJG3AfauLQo8Wv/nj39S/NlR9BXg8ZcO+3afmGjJ5qNNYtiqdHiAufvLe5g
	MWGJgxhKF4Jg5ojnOBmBg2rECnc657v23WHdjh
X-Received: by 2002:a05:6a00:4c87:b0:81f:5037:a317 with SMTP id d2e1a72fcca58-842b0d4a0d8mr8693533b3a.11.1780752375873;
        Sat, 06 Jun 2026 06:26:15 -0700 (PDT)
Received: from [127.0.1.1] ([223.122.38.120])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-842829188b9sm12910688b3a.59.2026.06.06.06.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 06:26:15 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 06 Jun 2026 21:25:26 +0800
Subject: [PATCH 2/2] nvme-apple: Prevent tag collision across queues even
 if tag space is shared
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-prevent-tag-collision-t8015-v1-2-93ccf4eca550@gmail.com>
References: <20260606-prevent-tag-collision-t8015-v1-0-93ccf4eca550@gmail.com>
In-Reply-To: <20260606-prevent-tag-collision-t8015-v1-0-93ccf4eca550@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>, 
 Yuriy Havrylyuk <yhavry@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4840; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=bXuJzOynK1zfJuBlVU0RMP2QsgG1y48fTK+be2Wr0r0=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqJB/qdLOi84lIuVdy6NqUXI4/UNSlZb9mI5/IT
 TzMsAgCn/aJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaiQf6gAKCRABygi3psUI
 JCCYD/9ncU6Tq/2SE3eURPnZaKM+kVw7fBhpQAjY9+yQc/aPkV4qvYhN7uabU4XpKUOsCw0XmL4
 QjX+clJQRQ3x0ZutsbGUAE9xuC2BX5oUT6UVf7kFr+3QixZJVD2s3kC+noa8DdEaojRR1SC+5L8
 gLEc8CTiDTNqzk3VB/Tvu+2YP1uV+83zggrvi4SasU2wiKjhph9ccd0+sKtS9psNuas9W9TETJL
 LwpAwBJcSlsBCH6fZwI6bZl7IV+lKc4K+/kVDVysKsh1+S4Kz5lNoYE4fiya/aPRa6AojVohiRn
 lgtDpBoveWqFY+92x6g6BrBan2YUuht8Bn1Y4fkfLx7IfMzbFLr0GxrvP8Y6o08aF/WTS/JsXB8
 5jJ5mdavfE6DvflFCt/I8Onc5LqvcJ8kX0rcNgHY5JSATbkd/AjyJxiKVn4vO9zdHH6gqb3W6wp
 t86AS6Zq5SplBtxiRoYzbtjKwFI4lLtt+U27B7GcPAvwKL1eCumB4K8AW11xZFLtLa/SFlfZK9p
 rJSQpX4a6ldMMR3PTzRz6sAOmiaubhFXJDmZ9OYy/EbRICgvp0wTvf0YddUz+Gh4dFlUpMAKLJ7
 +n8bf5cY6855i6t87C7tlfCxfxCh4dokI9XjYDNEjU2835AK0lVGWTFx8zAQa1EwLf9DrXoBJ/w
 7/tbxNCNCdymomw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

From: Yuriy Havrylyuk <yhavry@gmail.com>

Apple NVMe controllers require tags of pending commands to not be shared
across admin and IO queues. However, on Apple A11 without linear SQ, it is
not possible for either queue to skip over some tags and must go from 0 to
the configured maximum before wrapping around.

If a pending command tag is duplicated across queues, the firmware
crashes with: "duplicate tag error for tag N", with N being the tag.

Instead of partitioning the tag space, which is not possible without
linear SQ, prevent tag collisions by keeping track of which tags are
currently in-flight across either queues, and return BLK_STS_RESOURCE to
temporaily block command submission when a collision would have occurred.

Cc: stable@vger.kernel.org
Fixes: 04d8ecf37b5e ("nvme: apple: Add Apple A11 support")
Signed-off-by: Yuriy Havrylyuk <yhavry@gmail.com>
Co-developed-by: Nick Chan <towinchenmi@gmail.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/nvme/host/apple.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index c1115e27a0d6..6354edf27225 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -203,6 +203,20 @@ struct apple_nvme {
 
 	int irq;
 	spinlock_t lock;
+
+	/*
+	 * Tags of pending commands must be unique across both Admin and IO
+	 * queue. However, on T8015, unlike T8103, without linear submission
+	 * queues, it is not possible for the either queue to skip some tags,
+	 * and both queues must go from 0 to their respective configured
+	 * maximum.
+	 *
+	 * Instead of reserving some tags for the admin queue, use a bitfield
+	 * to keep track of pending commands on either queue, and temporaily
+	 * block command submission by returning BLK_STS_RESOURCE until the
+	 * tag is freed on the other queue.
+	 */
+	unsigned long t8015_active_tags;
 };
 
 static_assert(sizeof(struct nvme_command) == 64);
@@ -290,6 +304,28 @@ static void apple_nvmmu_inval(struct apple_nvme_queue *q, unsigned int tag)
 				     "NVMMU TCB invalidation failed\n");
 }
 
+static bool apple_nvme_reserve_tag_t8015(struct apple_nvme *anv,
+					 struct nvme_command *cmd)
+{
+	u16 tag = nvme_tag_from_cid(cmd->common.command_id);
+
+	if (WARN_ON_ONCE(tag >= BITS_PER_LONG))
+		return false;
+
+	return !test_and_set_bit(tag, &anv->t8015_active_tags);
+}
+
+static void apple_nvme_release_tag_t8015(struct apple_nvme *anv,
+					 __u16 command_id)
+{
+	u16 tag = nvme_tag_from_cid(command_id);
+
+	if (WARN_ON_ONCE(tag >= BITS_PER_LONG))
+		return;
+
+	clear_bit(tag, &anv->t8015_active_tags);
+}
+
 static void apple_nvme_submit_cmd_t8015(struct apple_nvme_queue *q,
 				  struct nvme_command *cmd)
 {
@@ -652,6 +688,8 @@ static inline void apple_nvme_update_cq_head(struct apple_nvme_queue *q)
 static bool apple_nvme_poll_cq(struct apple_nvme_queue *q,
 			       struct io_comp_batch *iob)
 {
+	struct apple_nvme *anv = queue_to_apple_nvme(q);
+	unsigned long completed_tags = 0;
 	bool found = false;
 
 	while (apple_nvme_cqe_pending(q)) {
@@ -664,11 +702,26 @@ static bool apple_nvme_poll_cq(struct apple_nvme_queue *q,
 		dma_rmb();
 		apple_nvme_handle_cqe(q, iob, q->cq_head);
 		apple_nvme_update_cq_head(q);
+
+		if (!anv->hw->has_lsq_nvmmu) {
+			struct nvme_completion *cqe = &q->cqes[q->cq_head];
+			u16 tag = nvme_tag_from_cid(READ_ONCE(cqe->command_id));
+
+			if (!WARN_ON_ONCE(tag >= BITS_PER_LONG))
+				__set_bit(tag, &completed_tags);
+		}
 	}
 
 	if (found)
 		writel(q->cq_head, q->cq_db);
 
+	if (!anv->hw->has_lsq_nvmmu && completed_tags) {
+		unsigned long tag_bit;
+
+		for_each_set_bit(tag_bit, &completed_tags, BITS_PER_LONG)
+			clear_bit(tag_bit, &anv->t8015_active_tags);
+	}
+
 	return found;
 }
 
@@ -790,6 +843,12 @@ static blk_status_t apple_nvme_queue_rq(struct blk_mq_hw_ctx *hctx,
 	if (ret)
 		return ret;
 
+	if (!anv->hw->has_lsq_nvmmu &&
+	    !apple_nvme_reserve_tag_t8015(anv, cmnd)) {
+		ret = BLK_STS_RESOURCE;
+		goto out_free_cmd;
+	}
+
 	if (blk_rq_nr_phys_segments(req)) {
 		ret = apple_nvme_map_data(anv, req, cmnd);
 		if (ret)
@@ -806,6 +865,9 @@ static blk_status_t apple_nvme_queue_rq(struct blk_mq_hw_ctx *hctx,
 	return BLK_STS_OK;
 
 out_free_cmd:
+	if (!anv->hw->has_lsq_nvmmu)
+		apple_nvme_release_tag_t8015(anv, cmnd->common.command_id);
+
 	nvme_cleanup_cmd(req);
 	return ret;
 }
@@ -1165,6 +1227,9 @@ static void apple_nvme_reset_work(struct work_struct *work)
 	if (ret)
 		goto out;
 
+	if (!anv->hw->has_lsq_nvmmu)
+		WRITE_ONCE(anv->t8015_active_tags, 0);
+
 	dev_dbg(anv->dev, "Starting admin queue");
 	apple_nvme_init_queue(&anv->adminq);
 	nvme_unquiesce_admin_queue(&anv->ctrl);

-- 
2.54.0

