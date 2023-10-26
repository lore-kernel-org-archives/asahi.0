Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23333FE2A
	for <asahi@lists.linux.dev>; Thu, 26 Oct 2023 23:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=marcan.st
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marcan.st
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marcan.st header.i=@marcan.st header.b="E+aWuk3C"
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sendonly@marcansoft.com)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 53C03425F5;
	Thu, 26 Oct 2023 23:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1698362226; bh=N1Sbb9SfCCZNynXuo33xTW3HW9rBx3oN5fKw3t+vu5k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=E+aWuk3CuGwjR2BbDJua0fPIZR2vmwm5gbFgdzRvb0AwLnJNGCLNhso+fplkmIhky
	 gPx0/hgsT3s8FnyK9hk2K4eIKcm0ANT+x1YKxJlAoZ7QIwTkfIHwPeCNLkMzQBgrZW
	 yldVYw9PnGi3zV+MBUBZSYa+hpJmj8HK2U4Ai8zpviXkPHV4LRQJnJRzbbxS07LBVK
	 4jyhvED2zkmjeeDTJWa0KK1wQqQD7BjaW2EWZRP+lKiFJAUDO4yhvT1HXRDMaWKWMb
	 ROBixEX6EQpyBG9G9OK+qsbGQz0dF6NdoomXbGAjZsdEfJjpJ+XH1bTEBoToD8jU97
	 wkETnujS2s0cw==
From: Hector Martin <marcan@marcan.st>
Date: Fri, 27 Oct 2023 08:16:48 +0900
Subject: [PATCH 5/8] usb: xhci: Fail on attempt to queue TRBs to a halted
 endpoint
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231027-usb-fixes-1-v1-5-1c879bbcd928@marcan.st>
References: <20231027-usb-fixes-1-v1-0-1c879bbcd928@marcan.st>
In-Reply-To: <20231027-usb-fixes-1-v1-0-1c879bbcd928@marcan.st>
To: Bin Meng <bmeng.cn@gmail.com>, Marek Vasut <marex@denx.de>
Cc: Mark Kettenis <kettenis@openbsd.org>, u-boot@lists.denx.de, 
 asahi@lists.linux.dev, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=828; i=marcan@marcan.st;
 h=from:subject:message-id; bh=N1Sbb9SfCCZNynXuo33xTW3HW9rBx3oN5fKw3t+vu5k=;
 b=owGbwMvMwCEm+yP4NEe/cRLjabUkhlSrz0mXe8JqdQ/lLLjYcazwr+1P3a++cXsCi56YtH9yf
 pK+eWVoRykLgxgHg6yYIkvjid5T3Z7Tz6mrpkyHmcPKBDKEgYtTACay9AXDP5NtF1oz13Y6SP6V
 uq/w0mq7dJGNqMnLndezP+itilpi18DIsClh2Vb1kPD2YNfWyNjy1MLar83qEflcbgwfplTKXKn
 mBQA=
X-Developer-Key: i=marcan@marcan.st; a=openpgp;
 fpr=FC18F00317968B7BE86201CBE22A629A4C515DD5

This isn't going to work, don't pretend it will and then end up timing
out.

Signed-off-by: Hector Martin <marcan@marcan.st>
---
 drivers/usb/host/xhci-ring.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 60f2cf72dffa..3ef8c2f14ccc 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -243,7 +243,8 @@ static int prepare_ring(struct xhci_ctrl *ctrl, struct xhci_ring *ep_ring,
 		puts("WARN waiting for error on ep to be cleared\n");
 		return -EINVAL;
 	case EP_STATE_HALTED:
-		puts("WARN halted endpoint, queueing URB anyway.\n");
+		puts("WARN endpoint is halted\n");
+		return -EINVAL;
 	case EP_STATE_STOPPED:
 	case EP_STATE_RUNNING:
 		debug("EP STATE RUNNING.\n");

-- 
2.41.0

