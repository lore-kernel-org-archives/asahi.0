Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506280;
	b=Y5RQwnIOni2iHvzMyjeC+5wVWzB+iKLAiGFJg/HywJYtW2wf1CTgbwMOACrMF4YdXzep
	 Z65e1aY4Sn9SNkD9DnZ11pEI0rHre8jMzVE38rAYFwUWZEhfGImsA6tY7yL3UvdLY3JVd
	 9K7W7+AFhgfNWSSfh+eTt3zkhE7301+WjhpMPV/pBakN+JlMRqlgsgtHFPdNmBCgSMFQq
	 Dj8NOH1eSgZBSoNocCx83lt+bn49YfQPY9z2YmMwvk5CCqhVp0Inj8RNnQpbmVearpPpA
	 mfSc9X50wSzIAszHe1hJMC0xK1edrOLhgBnhm0mhbIBgCmp96AaqoAwQTiST2V+x93Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xUH9TM8D+EtFaS7lpDrYmCTRC7yvn6WPuIywYJpBvYg=;
	b=2AXS+fBobotNpVLiO0Ul18cTzceAWFRxBCsin8047f0q2o2FzN+DLR9psAvf0toxHeXY
	 ar6KCEYmYjnIivl7ARSXrCEZ4DFxHm7dDvGt8BabdVRpLc0aP8AsHU8YZ6/38domuJrBU
	 wqpBHmUbIGYinIu8C+Pn1IXN4Qq8GkHwrzCzlG0gmZaIemMNa8m+lzyMXa8yzlHIOB6Cp
	 bLlSTdjvyoEmpM4EemsZEB2vEpdsuatG3oPRXYySaAH1ZRfenPYfZkfoX8vtA1tWtfti+
	 th/+8nVVGLJv1R6h48HRm+pxyvfF5rHtnm2oLJRJ731znmQaPfjhGGn+9VhayGIE5sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ME5NbkGP;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE37606A321
	for <asahi@lists.linux.dev>; Thu, 12 Nov 2026 17:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BE37606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ME5NbkGP
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so1819784a12.1
        for <asahi@lists.linux.dev>; Thu, 12 Nov 2026 09:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506278; x=1795111078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xUH9TM8D+EtFaS7lpDrYmCTRC7yvn6WPuIywYJpBvYg=;
        b=ME5NbkGPwRSC5Z2pll6DQPMzXmd3/tiBejv96GkGeKHvay+q/S3JbVdfmbrmjEmV5m
         9V5a0uMvhBQmiU2iByUQ9dmElm34gCo2grCVlhnpvW7u88dtoRa5e/AbFBCDke5LRlWM
         v6yy53IRfb8uP5Ha7BwMUkYPbr19cxLXMaw1CvEXiws/GU+MA7DIogdT5HBVXEFFqmly
         hHRcFofJ3F10Up2b8J3mIXnlCpjCw1w0gG9XmHpWWkjPGhkhkyXrTaK+QPiEdW1AbvpY
         jEYN4i3rwK83IiFto9myac9lTYrUndLscETncGmF/ZbajByEaa8v62sHuaxQlqIRriTX
         07QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506278; x=1795111078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUH9TM8D+EtFaS7lpDrYmCTRC7yvn6WPuIywYJpBvYg=;
        b=kOaN7pxkTIX546EpHQBoUJcgfmy5TwbhTxeOVhfSBztgWFwrAAdRbpwze/YJjbxjQ4
         q5LEZ6t+/RD6Ubq+ySclmnqI9uLvTllOVHwGMHKtHDdFiqKrtbWAFpYRhcRuyQwAiQVt
         8zmoI2OUFnhDsvGOKTUbhVnNpIHnJXxr/FS9OUcwixZBkuGAd3LyJbqw0tKRBtUKGDt7
         EOzOO05wdc4Mmo4torTzz8yFysWyltfCJmCIUPag+s/DfUu01woyFxe8gyJ+y/h1tyUz
         HFY/KG2BqO+YKA3hMhgbg2Hh5CLa8faOpQStzdnrxgV2xBWsLud5R8Tr+7trpOhqwvwi
         KuuA==
X-Forwarded-Encrypted: i=1; AL+hErGzZLutg7yCDFy2Fe5fbpdmLUrotr6yhfpYEBNRsKRbwHmIKt8lzzgrUwyFaIykQlkbOfYR8Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Q9WGWtPRm9WN/WBMaequvSx+euhLsV/xmbkOQy1F+Cct8OOzH
	UijQwSUtU3IrsK+dDi9OWCYQZDCWgYUURqxOwFuCwBi8y/p0LiwAHzbi
X-Gm-Gg: AYBFou3YDPfKTnOF1Og67/aSLp601nAZQ7QwIQpVMpqtDtiGXwvYagrCNfY24k4q1Vw
	eEuaccwea6WZRdrJA/5Q4zu+daQ2dZr4QI2vZquxf1iBRVYky2oMMafxg0pb4krlaXhmHXJ2XyN
	5BULS/DgttKtAVkKHHlXNd2oLCNT7vXr7USexFD27A0E8JnuH3oLERw9sunezw5VQIpy2opsVt9
	rlp3tI7Tv1nz9kFVNJz6LaSYm3vBg2Iou/m6Od1ktWVLwzkC1892gGL7pPQVwpNxecBMXC+r17S
	WV54G0ssEAFmwBKctW6zez7xzLThsVgrAAI43EuQI+PDSvLVYu2krOova0SlUXYdvxYm1bkrdBg
	TMOIsvWjrblzCOS/LaAARf5u2YczO37M46R3jcS/eAwtnHP6tn6cN4ioRXLM3x1bY4kppHO8kIX
	8idzsQydUjfCh39QwkVRyHpAh0A6Aeg6U4LWYFbuow4OdzJECGiMPj6Pjnh63CCNUhipH0/zRID
	tLuw+fW28/f6qHRsplLtzNvdlCXMlGW0N75Z5Ab1JSR83TGVx2qOE+mcjQUmvD8O1tVX7RCCaou
	gle+WfqMPB+mvrYcfwNIhOkRHkDo6N120TqDpR37
X-Received: by 2002:aa7:c706:0:b0:6b7:a647:d6ec with SMTP id 4fb4d7f45d1cf-6b7c0ba594cmr249234a12.5.1794506277847;
        Thu, 12 Nov 2026 09:57:57 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b5606sm18111a12.2.2026.11.12.09.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:57:57 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: dev@deq.rocks,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	j@jannau.net,
	marcan@marcan.st,
	sebastian.reichel@collabora.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2] wifi: brcmfmac: msgbuf: count tx status only for the current flowring
Date: Thu, 12 Nov 2026 18:57:54 +0100
Message-ID: <20261112175754.396469-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
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

brcmf_msgbuf_delete_flowring() waits for the outstanding_tx counter of a
flowring to reach zero before it sends the delete. When the wait times
out, it sets the counter to zero with packets still out. Their tx status
still comes and takes the counter below zero, and since the counter
lives in the commonring of the flowid and nothing resets it, the next
flowring that gets the flowid starts from there. With the counter below
zero, the next delete of that flowring waits until it times out as well.

A tx status can also come after the flowid has been released:
brcmf_proto_msgbuf_rx_trigger() reads the tx complete ring before the
control complete ring, so when the firmware writes the tx status of a
packet shortly before the delete response of its flowring, the host can
see the response in one pass and the status only in the next one, after
brcmf_msgbuf_remove_flowring() has released the flowid. If a new
flowring got the flowid in the meantime, the status decrements its
outstanding_tx, which brcmf_msgbuf_schedule_txdata() and the trickle
check in brcmf_proto_msgbuf_rx_trigger() rely on.

Reset the counter when a flowring is created. Give each flowid a
generation that goes up when the flowid is released, and keep it in the
tx pktid of every packet posted to the flowring. A tx status of an older
generation still releases its packet, but no longer touches the counter.

Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
---

Notes:
    v2:
    - sent on its own, as Andre asked; v1 was on top of his series:
      https://lore.kernel.org/all/20261111195559.160650-1-kudzo51@gmail.com/
    - based on wireless-next, so it now also resets the counter when a
      flowring is created. Andre's 4/4 adds the same line:
      https://lore.kernel.org/all/20261107154810.89780-5-dev@deq.rocks/
    - "This happens whatever order the firmware sends the two messages in"
      was too strong, it can happen
    
    The counter carrying over and its effect on the next delete come from
    reading the code. The mainline driver does not run my BCM43684 (it needs
    the BCA host interface), so this version is compile-tested only. In my
    tree, on a BCM43684 access point and with the delete sent without
    waiting, as in Andre's series, the host saw every tx status before the
    delete response in normal operation. The reused flowid case only showed
    when I held back the tx status of a flowring being deleted for 3 s in
    the driver: with the generation check, all 531 such statuses left the
    counter of the new flowring alone, and it matched the frames still out
    at each of the 15 deletes; with the check turned off, it was wrong at 14
    of the 15 deletes, by 787 frames in total, and went below zero.

 .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 36 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
index 5ad46d7ec..f0c3c26fe 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
@@ -248,6 +248,7 @@ struct brcmf_msgbuf {
 	struct brcmf_commonring **commonrings;
 	struct brcmf_commonring **flowrings;
 	dma_addr_t *flowring_dma_handle;
+	u16 *flowring_gen;
 
 	u16 max_flowrings;
 	u16 max_submissionrings;
@@ -294,6 +295,7 @@ struct brcmf_msgbuf {
 struct brcmf_msgbuf_pktid {
 	atomic_t  allocated;
 	u16 data_offset;
+	u16 gen;	/* tx: flowring_gen of its flowid when posted */
 	struct sk_buff *skb;
 	dma_addr_t physaddr;
 };
@@ -560,6 +562,22 @@ static void brcmf_msgbuf_rxreorder(struct brcmf_if *ifp, struct sk_buff *skb)
 {
 }
 
+/*
+ * Called when a flowid is released. A tx status can still come for a packet
+ * of the old flowring after that: brcmf_msgbuf_delete_flowring() sends the
+ * delete with packets still out when its wait times out, and
+ * brcmf_proto_msgbuf_rx_trigger() reads the tx complete ring before the
+ * control complete ring, so it can see a delete response before a tx status
+ * the firmware wrote first. The flowid may have gone to a new flowring by
+ * then, and the status must not decrement the outstanding_tx of the new one.
+ */
+static void brcmf_msgbuf_flowring_next_gen(struct brcmf_msgbuf *msgbuf,
+					   u16 flowid)
+{
+	WRITE_ONCE(msgbuf->flowring_gen[flowid],
+		   msgbuf->flowring_gen[flowid] + 1);
+}
+
 static void
 brcmf_msgbuf_remove_flowring(struct brcmf_msgbuf *msgbuf, u16 flowid)
 {
@@ -567,6 +585,7 @@ brcmf_msgbuf_remove_flowring(struct brcmf_msgbuf *msgbuf, u16 flowid)
 	void *dma_buf;
 
 	brcmf_dbg(MSGBUF, "Removing flowring %d\n", flowid);
+	brcmf_msgbuf_flowring_next_gen(msgbuf, flowid);
 
 	dma_sz = BRCMF_H2D_TXFLOWRING_MAX_ITEM * BRCMF_H2D_TXFLOWRING_ITEMSIZE;
 	dma_buf = msgbuf->flowrings[flowid]->buf_addr;
@@ -645,6 +664,7 @@ brcmf_msgbuf_flowring_create_worker(struct brcmf_msgbuf *msgbuf,
 	brcmf_commonring_config(msgbuf->flowrings[flowid],
 				BRCMF_H2D_TXFLOWRING_MAX_ITEM,
 				BRCMF_H2D_TXFLOWRING_ITEMSIZE, dma_buf);
+	atomic_set(&msgbuf->flowrings[flowid]->outstanding_tx, 0);
 
 	commonring = msgbuf->commonrings[BRCMF_H2D_MSGRING_CONTROL_SUBMIT];
 	brcmf_commonring_lock(commonring);
@@ -768,6 +788,8 @@ static void brcmf_msgbuf_txflow(struct brcmf_msgbuf *msgbuf, u16 flowid)
 			bphy_err(drvr, "No PKTID available !!\n");
 			break;
 		}
+		msgbuf->tx_pktids->array[pktid].gen =
+			READ_ONCE(msgbuf->flowring_gen[flowid]);
 		ret_ptr = brcmf_commonring_reserve_for_write(commonring);
 		if (!ret_ptr) {
 			brcmf_msgbuf_get_pktid(msgbuf->drvr->bus_if->dev,
@@ -920,10 +942,13 @@ brcmf_msgbuf_process_txstatus(struct brcmf_msgbuf *msgbuf, void *buf)
 	struct sk_buff *skb;
 	u16 flow_ring_id;
 	u16 flowid;
+	u16 gen = 0;
 
 	tx_status = (struct msgbuf_tx_status *)buf;
 	idx = le32_to_cpu(tx_status->msg.request_id) - 1;
 	flow_ring_id = le16_to_cpu(tx_status->compl_hdr.flow_ring_id);
+	if (idx < msgbuf->tx_pktids->array_size)
+		gen = msgbuf->tx_pktids->array[idx].gen;
 	skb = brcmf_msgbuf_get_pktid(msgbuf->drvr->bus_if->dev,
 				     msgbuf->tx_pktids, idx);
 	if (!skb)
@@ -937,7 +962,9 @@ brcmf_msgbuf_process_txstatus(struct brcmf_msgbuf *msgbuf, void *buf)
 
 	set_bit(flowid, msgbuf->txstatus_done_map);
 	commonring = msgbuf->flowrings[flowid];
-	atomic_dec(&commonring->outstanding_tx);
+	/* not for a packet of a flowring that had the flowid before */
+	if (gen == READ_ONCE(msgbuf->flowring_gen[flowid]))
+		atomic_dec(&commonring->outstanding_tx);
 
 	brcmf_txfinalize(brcmf_get_ifp(msgbuf->drvr, tx_status->msg.ifidx),
 			 skb, true);
@@ -1325,6 +1352,7 @@ brcmf_msgbuf_process_flow_ring_delete_response(struct brcmf_msgbuf *msgbuf,
 
 	if (status) {
 		bphy_err(drvr, "Flowring deletion failed, code %d\n", status);
+		brcmf_msgbuf_flowring_next_gen(msgbuf, flowid);
 		brcmf_flowring_delete(msgbuf->flow, flowid);
 		return;
 	}
@@ -1684,6 +1712,10 @@ int brcmf_proto_msgbuf_attach(struct brcmf_pub *drvr)
 			     msgbuf->max_flowrings);
 	if (!msgbuf->flowring_dma_handle)
 		goto fail;
+	msgbuf->flowring_gen = kzalloc_objs(*msgbuf->flowring_gen,
+					    msgbuf->max_flowrings);
+	if (!msgbuf->flowring_gen)
+		goto fail;
 
 	msgbuf->rx_dataoffset = if_msgbuf->rx_dataoffset;
 	msgbuf->max_rxbufpost = if_msgbuf->max_rxbufpost;
@@ -1735,6 +1767,7 @@ int brcmf_proto_msgbuf_attach(struct brcmf_pub *drvr)
 		kfree(msgbuf->txstatus_done_map);
 		brcmf_msgbuf_release_pktids(msgbuf);
 		kfree(msgbuf->flowring_dma_handle);
+		kfree(msgbuf->flowring_gen);
 		if (msgbuf->ioctbuf)
 			dma_free_coherent(drvr->bus_if->dev,
 					  BRCMF_TX_IOCTL_MAX_MSG_SIZE,
@@ -1775,6 +1808,7 @@ void brcmf_proto_msgbuf_detach(struct brcmf_pub *drvr)
 				  msgbuf->ioctbuf, msgbuf->ioctbuf_handle);
 		brcmf_msgbuf_release_pktids(msgbuf);
 		kfree(msgbuf->flowring_dma_handle);
+		kfree(msgbuf->flowring_gen);
 		kfree(msgbuf);
 		drvr->proto->pd = NULL;
 	}

base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.56.0

