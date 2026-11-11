Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398885;
	b=K8UMNegNH+eupuNxGVC3MkwgeHShNK9nRfVGLbUZLJl6YUusfOCOTgmXx7fLkVzcsE8z
	 J7BetF1n1AXMKLdGPe+SS2e87gV721P8U+zLaldEf0ceVE63UQh+FFUbTuGj9cS48XTqP
	 8iMWKRTWCWscjmuhkOvX6NkCT+ZXpaJHP7rQTPuQaCaQJyTS5M8rQYRDOfHi9uwJ27XtG
	 FJAuPGYtrbVbS/bhJ9X+ilCnoh3Q49/jqaRywfRJwaa23m3UpW/MRYwEN1uJUE+fCnxAx
	 EGzueDP1T3DMy6CPn3/wJFKx485dnRIBaWVhFKAX1JLnkQq3AQbRPlnaeSP5b9lMT6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398885;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Yx7/+j7cYvfdKVAYN74kSmTnOjb0fnbvVNpzlqlvRHY=;
	b=Vn9mNjhf6AV2AWAahwNWne51Dcjp8KrUV+2+7DoB+I22wzD5uHitgO8I0UgFtr1u7HF2
	 b1Xsf8vGzkDMm4cLqEJXPSKd5TmwRdcATJRxGxlGBI6xu+p89kboW0X1M1nvhtN57gBXa
	 zoPDF/CGUNTT/CI3Wc3vT+XJxyzDW0EXd3hPdnYNjjOdgU7NIn0g20iwCYTFFJ6/Gia8s
	 lTK6a44YsYBGlGHXmtsRTBr80U4ptEs7dznH4b66HxysSBrKlF5synDwOBlqh3ENmVqjb
	 iLfeqxb62VRm1kgtFYm50SQAg35YiOBeNuotg20kkZNqYWurVSgrRNKPLSOUCwGuLDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=h8sW6XtA;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602AE60A2600;
	Wed, 11 Nov 2026 12:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 602AE60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=h8sW6XtA
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794398882;
	bh=lqxG51j8nuZCFr7wodzZYj42Ki/fIku3xbIJTm6YURI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h8sW6XtA2VZ/SINUj9X7nIwJBQI/An6yIh1D6VyYwX8at29rhoq9J8GKeQIoqhKf0
	 fi4HYpGhQRDVftHUI7d7x9kYkWhyyxxpShHLyoLP81jL4BmFTSe//VjZddAj8eprrB
	 a16Ag3XyRqwjyLkJg6YNMmh/1/Sg3AVfGhddImOq9pDqgnQ3iuotMThTR1tVizLvgr
	 +59rAlm9XvILzH2O1hfQx/PBpnuvVcjCE6AJbYx0Vft5HHxC1JSBHgHKBxUZMRiflw
	 LtzG4Kc86/ZTCO2skNNyKkf8OC+obqD6Lg1tbTUakntmKJhfWiBvtMgrPZPhJ04CYC
	 RM/vZ8H9qsH7Q==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH v2 4/5] wifi: brcmfmac: msgbuf: send the flowring delete without waiting for tx status
Date: Wed, 11 Nov 2026 13:07:47 +0100
Message-ID: <20261111120748.23795-5-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111120748.23795-1-dev@deq.rocks>
References: <20261111120748.23795-1-dev@deq.rocks>
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

The BCM4377 firmware returns the tx status of queued packets only when
it gets the flowring delete request. brcmf_msgbuf_delete_flowring()
waits up to 100 ms for them before it sends the request, so every
disconnect logs a timeout, and the cleared counter goes below zero when
the status arrives.

The race the wait was added for in commit 0fa24196e425 ("wifi: brcmfmac:
fix continuous 802.1x tx pending timeout error") is covered by
RING_CLOSING since commit 09be7546a602 ("wifi: brcmfmac: fix scheduling
while atomic issue when deleting flowring"), and late tx status still
releases the packet. Send the delete right away and reset the counter
when the ring is created.

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 23 ++++++++-----------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
index 8e5c697e7f1..a9ccf647f9a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
@@ -73,7 +73,6 @@
 #define BRCMF_MSGBUF_TRICKLE_TXWORKER_THRS	32
 #define BRCMF_MSGBUF_UPDATE_RX_PTR_THRS		48
 
-#define BRCMF_MAX_TXSTATUS_WAIT_RETRIES		10
 
 struct msgbuf_common_hdr {
 	u8				msgtype;
@@ -645,6 +644,7 @@ brcmf_msgbuf_flowring_create_worker(struct brcmf_msgbuf *msgbuf,
 	brcmf_commonring_config(msgbuf->flowrings[flowid],
 				BRCMF_H2D_TXFLOWRING_MAX_ITEM,
 				BRCMF_H2D_TXFLOWRING_ITEMSIZE, dma_buf);
+	atomic_set(&msgbuf->flowrings[flowid]->outstanding_tx, 0);
 
 	commonring = msgbuf->commonrings[BRCMF_H2D_MSGRING_CONTROL_SUBMIT];
 	brcmf_commonring_lock(commonring);
@@ -1330,6 +1330,10 @@ brcmf_msgbuf_process_flow_ring_delete_response(struct brcmf_msgbuf *msgbuf,
 	}
 	brcmf_dbg(MSGBUF, "Flowring %d Delete response status %d\n", flowid,
 		  status);
+	if (atomic_read(&msgbuf->flowrings[flowid]->outstanding_tx))
+		brcmf_dbg(MSGBUF, "Flowring %d deleted with %d tx status outstanding\n",
+			  flowid,
+			  atomic_read(&msgbuf->flowrings[flowid]->outstanding_tx));
 
 	brcmf_msgbuf_remove_flowring(msgbuf, flowid);
 }
@@ -1471,23 +1475,16 @@ void brcmf_msgbuf_delete_flowring(struct brcmf_pub *drvr, u16 flowid)
 	void *ret_ptr;
 	u8 ifidx;
 	int err;
-	int retry = BRCMF_MAX_TXSTATUS_WAIT_RETRIES;
 
-	/* make sure it is not in txflow */
+	/*
+	 * Make sure txflow posts nothing more to the ring. The firmware returns
+	 * the tx status of the posted packets when it deletes the ring, before
+	 * it sends the delete response.
+	 */
 	brcmf_commonring_lock(commonring_del);
 	flow->rings[flowid]->status = RING_CLOSING;
 	brcmf_commonring_unlock(commonring_del);
 
-	/* wait for commonring txflow finished */
-	while (retry && atomic_read(&commonring_del->outstanding_tx)) {
-		usleep_range(5000, 10000);
-		retry--;
-	}
-	if (!retry) {
-		brcmf_err("timed out waiting for txstatus\n");
-		atomic_set(&commonring_del->outstanding_tx, 0);
-	}
-
 	/* no need to submit if firmware can not be reached */
 	if (drvr->bus_if->state != BRCMF_BUS_UP) {
 		brcmf_dbg(MSGBUF, "bus down, flowring will be removed\n");
