Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BA953A4
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 06:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="ir13GisZ"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 0640F4268B;
	Sun, 29 Oct 2023 06:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1698561528; bh=ppe6Yz6eRH+7A2U81PZqJ6AYVRQhDWwxRmqdPM5NSoE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ir13GisZhJfTavqDCoF76XgmTswkQBpkE38IkRGLmQ78zzo9nYCHfYTwKi8WVfwKp
	 P/tTt/orR7g3T3JPfZm4CnDfZA6zA34eyrv1B4kXf0qZP3mN75EGgjsBW1rBFQ5G/f
	 FyXa0rwfaMxK6otp4DsQSZvCAbLn6VS4CZL/FUvKzj9pR7TGinKu+T7u29vdrdGWys
	 P+Te1KsOUwQ5qkCzbZMtq+zXYaaGiGZJWEQDcPYSW+Xoy5qwx+sNfv3VnnRp5E4b/o
	 HnijC5ub53ofHHiHXdbDctn6JLqfg+LxUtPljDWaiBKLHlYOiDZQPSYS8CqTEOFqWY
	 XgGV0hkCknhoQ==
From: Hector Martin <marcan@marcan.st>
Date: Sun, 29 Oct 2023 15:37:44 +0900
Subject: [PATCH v2 7/8] usb: xhci: Fix DMA address calculation in queue_trb
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231029-usb-fixes-1-v2-7-623533f6316e@marcan.st>
References: <20231029-usb-fixes-1-v2-0-623533f6316e@marcan.st>
In-Reply-To: <20231029-usb-fixes-1-v2-0-623533f6316e@marcan.st>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>, 
 u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110; i=marcan@marcan.st;
 h=from:subject:message-id; bh=ppe6Yz6eRH+7A2U81PZqJ6AYVRQhDWwxRmqdPM5NSoE=;
 b=owGbwMvMwCEm+yP4NEe/cRLjabUkhlTbv4/TjN75K2/cPC9hz6Ivxet3HtlgELbxgJnK4td5d
 pv2fdm/qqOUhUGMg0FWTJGl8UTvqW7P6efUVVOmw8xhZQIZwsDFKQATWV/MyHB8JxePZlC6XshP
 df9vK4JexLXFSml3sH6rN7H9/mpxaDIjw3lG9iIxl/1X98SEfc1P4pzxbCPXy8mfjpee5ryW8K3
 +BQcA
X-Developer-Key: i=marcan@marcan.st; a=openpgp;
 fpr=FC18F00317968B7BE86201CBE22A629A4C515DD5

We need to get the DMA address before incrementing the pointer, as that
might move us onto another segment.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/usb/host/xhci-ring.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index ae0ab5744df0..b60661fe05e7 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -202,6 +202,7 @@ static dma_addr_t queue_trb(struct xhci_ctrl *ctrl, struct xhci_ring *ring,
 			    bool more_trbs_coming, unsigned int *trb_fields)
 {
 	struct xhci_generic_trb *trb;
+	dma_addr_t addr;
 	int i;
 
 	trb = &ring->enqueue->generic;
@@ -211,9 +212,11 @@ static dma_addr_t queue_trb(struct xhci_ctrl *ctrl, struct xhci_ring *ring,
 
 	xhci_flush_cache((uintptr_t)trb, sizeof(struct xhci_generic_trb));
 
+	addr = xhci_trb_virt_to_dma(ring->enq_seg, (union xhci_trb *)trb);
+
 	inc_enq(ctrl, ring, more_trbs_coming);
 
-	return xhci_trb_virt_to_dma(ring->enq_seg, (union xhci_trb *)trb);
+	return addr;
 }
 
 /**

-- 
2.41.0

