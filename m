Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534163F4D7
	for <asahi@lists.linux.dev>; Thu, 26 Oct 2023 23:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="H37wqWIK"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id D78DC43BE4;
	Thu, 26 Oct 2023 23:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1698362230; bh=J8HOCd+U3ebZ5pNtyFmwjtYqXpKM+8tLg/iBNPdEqHQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H37wqWIKB/P08vTRJcdQA59YRK0H/q6sPcJJw+ASCLTTiQqRlBZKYL9Cgv1RNFEQO
	 9+X6fhKxRDH/quzBle/pFtrHCykfinTYEzpjUF5McjT4gYQ4y1IWaw5UiCUzAxaWKy
	 Cw/sEaAgsqa7V9NySoiaJxDRfsprh2EDvG6mb28UOKWDUPE13NQOsbYWw3rPmcQJMt
	 GXs4gJoZxVVzHXFb6mGqS3QqWA8uv6XjJe4lV2J6Hjbtc3xGz4dAJw6QQjJm+fmsJ6
	 I+yiJUTZ5jzR97eXzKKJuXPS9UP5NlRvOZ0C8fv+rm6tFy6VbpYarKSPUV2Uw43Mmm
	 XyU8e6ozx/59w==
From: Hector Martin <marcan@marcan.st>
Date: Fri, 27 Oct 2023 08:16:50 +0900
Subject: [PATCH 7/8] usb: xhci: Fix DMA address calculation in queue_trb
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231027-usb-fixes-1-v1-7-1c879bbcd928@marcan.st>
References: <20231027-usb-fixes-1-v1-0-1c879bbcd928@marcan.st>
In-Reply-To: <20231027-usb-fixes-1-v1-0-1c879bbcd928@marcan.st>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>
Cc: Mark Kettenis <kettenis@openbsd.org>, u-boot@lists.denx.de, 
 asahi@lists.linux.dev, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=marcan@marcan.st;
 h=from:subject:message-id; bh=J8HOCd+U3ebZ5pNtyFmwjtYqXpKM+8tLg/iBNPdEqHQ=;
 b=owGbwMvMwCEm+yP4NEe/cRLjabUkhlSrz8nyx5fohj1yM7VaMfV26Y7zNX1XpNbq7Vt/cu7uz
 zIVetJZHaUsDGIcDLJiiiyNJ3pPdXtOP6eumjIdZg4rE8gQBi5OAZhI7g9GhkmR0+wWc7S1cmgl
 povr7l26Paa5JVTtXeGTq9sO1tfMLWf471pcm+y44l3a0X1qXI8LlzO32T4yEH1xqNb8t+nHB6v
 t2QA=
X-Developer-Key: i=marcan@marcan.st; a=openpgp;
 fpr=FC18F00317968B7BE86201CBE22A629A4C515DD5

We need to get the DMA address before incrementing the pointer, as that
might move us onto another segment.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/usb/host/xhci-ring.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index b95f20642943..b9518e4a6743 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -202,18 +202,22 @@ static dma_addr_t queue_trb(struct xhci_ctrl *ctrl, struct xhci_ring *ring,
 			    bool more_trbs_coming, unsigned int *trb_fields)
 {
 	struct xhci_generic_trb *trb;
+	dma_addr_t addr;
 	int i;
 
 	trb = &ring->enqueue->generic;
 
+
 	for (i = 0; i < 4; i++)
 		trb->field[i] = cpu_to_le32(trb_fields[i]);
 
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

