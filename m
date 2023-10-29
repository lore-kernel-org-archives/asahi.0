Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F27E53A4
	for <asahi@lists.linux.dev>; Sun, 29 Oct 2023 06:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="Aq41iN2v"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 86A834269A;
	Sun, 29 Oct 2023 06:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1698561526; bh=2Ezazxo/l/m35b7gLCXnhikSTgV+JLOV/BkAoTnghb8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Aq41iN2vSj1jmEASSvUX71dgP+TITRQKSlkJKMn2fZ7H+u0a1npZDva57A06BFejS
	 StalOh4HeKMqghLGHgPhAvSkTrHLOEqHmuJFE+3b7yCr6alwZBRAOETR5zyU5GPLEU
	 deCk0RW+cxeaQi+6N+b1+T+RheLjo+o9l9hjeYTrnAsDetzDMYnjqzbz+8g4WVv3LV
	 a6Kk1UDdtGfBY7kzF8+pKwIurpTcYT71wUHvDF7TVT0w7UM6Zag3obykHelVESpXDd
	 gXCAsXjhwDosMR2zumcLnA2BYtaxyLf422VhvlnTM7HAa89pDiNJBhDeLCEEO+Y1Fg
	 G/Bb+LanyRzKQ==
From: Hector Martin <marcan@marcan.st>
Date: Sun, 29 Oct 2023 15:37:43 +0900
Subject: [PATCH v2 6/8] usb: xhci: Do not panic on event timeouts
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231029-usb-fixes-1-v2-6-623533f6316e@marcan.st>
References: <20231029-usb-fixes-1-v2-0-623533f6316e@marcan.st>
In-Reply-To: <20231029-usb-fixes-1-v2-0-623533f6316e@marcan.st>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>
Cc: Mark Kettenis <kettenis@openbsd.org>, Neal Gompa <neal@gompa.dev>, 
 u-boot@lists.denx.de, asahi@lists.linux.dev, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=837; i=marcan@marcan.st;
 h=from:subject:message-id; bh=2Ezazxo/l/m35b7gLCXnhikSTgV+JLOV/BkAoTnghb8=;
 b=owGbwMvMwCEm+yP4NEe/cRLjabUkhlTbvw+36Io27DAslbS5tk85RcS+zGPvzrnzcs9Hrn7Uy
 MIn4vyto5SFQYyDQVZMkaXxRO+pbs/p59RVU6bDzGFlAhnCwMUpABM59omR4VOR+uSl14t9tcMy
 /e9Yikp12wsetr1rrVX3VmK/ZpNgLSPD9HmMak/0pjhmX7vYut9MOd01TPPMc/M6v+W7ztt/PsP
 ECgA=
X-Developer-Key: i=marcan@marcan.st; a=openpgp;
 fpr=FC18F00317968B7BE86201CBE22A629A4C515DD5

Now that we always check the return value, just return NULL on timeouts.
We can still log the error since this is a problem, but it's not reason
to panic.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/usb/host/xhci-ring.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index a969eafdc8ee..ae0ab5744df0 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -494,8 +494,9 @@ union xhci_trb *xhci_wait_for_event(struct xhci_ctrl *ctrl, trb_type expected)
 	if (expected == TRB_TRANSFER)
 		return NULL;
 
-	printf("XHCI timeout on event type %d... cannot recover.\n", expected);
-	BUG();
+	printf("XHCI timeout on event type %d...\n", expected);
+
+	return NULL;
 }
 
 /*

-- 
2.41.0

