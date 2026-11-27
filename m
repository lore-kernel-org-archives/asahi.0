Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795800969;
	b=TBQJ0aybu+M0xb2YQWQq1lof6faip7yjXLqTWfRM5zeX/ByWuF8DeDMJBFEw7y3nwioB
	 Z+vXMbrR12vN4Wat8xpRiJmp/C6w2DInjFcwNduKUf6AaRG2A20VBXetIzK8yZqZQNqLd
	 TpPzwVfd3Ls6q+Hgze1B7LsFK+Gkcd9c+n1cAkd77g+hXjYmMxwIUxTcsDA1vmEJDPxgH
	 wldLzaKtq8nz33oHotfxsG0fp1JFjrFvHy/s9XhsYt/PMYAobgdZ0ExM+37QjvcU5VEzJ
	 S0XhS2yGaxh4bWKxi6ENwcgv3KAr2vwKe4mF9mA6D0cjdhY4VavYXmgEuOaenvSKVSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800969;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Mxq2ajFAdc7BHde2lquSmjBeWvjKHqLe2URNnjWYuSI=;
	b=YnQiR5CJ354E9+QwTT1gKlE0XxHYLyDolrCagfHbHig8rX24UfEdoFdmiWBmTAXbJ38H
	 lIQJXNdli11Nc81AzWU4eZLfQVYLkFjwM5Ahf+yFQYHQp32c5spx1nciYeAPgPY3TqLzX
	 VWw2I1Gn2fuFw5/V2KE26Iv6+ZWY3GjFFmu9J5w+VQ8q76TSvDtWX7lDcvbcDIOgdcgRP
	 ylVYz3bj77bJx2KjFahrPiyh1WzBfo/JkvqbVun/K1igMP3anXa5n638tZyPgaanMfhwV
	 wpmiOQs9OzWw5OYWMIfNDT9l6I6ni419Yf9Ddp8voCj7wFjTtjtrLhUAlS3AfgstQnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=nB9AairJ;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946F4606A687;
	Fri, 27 Nov 2026 17:36:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 946F4606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=nB9AairJ
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795800966;
	bh=NwD2EqHuGoBkwsa+FPnF+xUDZsP/uuYBvzKeBFxFKtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nB9AairJm9DhieAOj/2R2KRDKnq7RoRBSG/NWp7v3RJWhIe9oJMCppt//HZLIGq0w
	 CsGq68bGbDLfNWMk1UF/C3SQ+KcHgXbkPlE5LeWEeXA/XgBSTeV6li+Psq2SocCN3Y
	 vHQ1h0oFvovuKi82taHc6AP3n9rifkttbkpLxDNZ/jDMA3s9RLnEEu/cf+ewdN8tUW
	 7cYtJH88de7+f64iMn8oIKT7Kd+B39v0nasEoLa6fY0Yf0JeMqLjR35FNdO4qU3i49
	 b1DX+hBCzq5M3euTyruVYeRzNlLAwqVlX7zKN57ryjNg+KA6mdrJ84jlMjbxdi87cC
	 CUcwGczUIhTrA==
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
	Soeren Coremans <sorencoremans@gmail.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: [PATCH wireless-next v3 4/5] wifi: brcmfmac: msgbuf: do not wait for tx status on the BCM4377
Date: Fri, 27 Nov 2026 18:35:48 +0100
Message-ID: <20261127173549.29335-5-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127173549.29335-1-dev@deq.rocks>
References: <20261127173549.29335-1-dev@deq.rocks>
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

The BCM4377 firmware returns the tx status of the queued packets only
when it gets the flowring delete request, before the delete response.
brcmf_msgbuf_delete_flowring() waits up to 100 ms for them before it
sends the request, so every disconnect logs a timeout.

Send the delete right away on the BCM4377. Its tx status still comes
before the delete response, so pend_8021x_cnt drains as before. Other
chips keep the wait.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
index 79c1891db59..195a1a362ba 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
@@ -14,6 +14,7 @@
 
 #include <brcmu_utils.h>
 #include <brcmu_wifi.h>
+#include <brcm_hw_ids.h>
 
 #include "core.h"
 #include "debug.h"
@@ -1505,8 +1506,13 @@ void brcmf_msgbuf_delete_flowring(struct brcmf_pub *drvr, u16 flowid)
 	flow->rings[flowid]->status = RING_CLOSING;
 	brcmf_commonring_unlock(commonring_del);
 
-	/* wait for commonring txflow finished */
-	while (retry && atomic_read(&commonring_del->outstanding_tx)) {
+	/*
+	 * Wait for commonring txflow finished. The BCM4377 firmware returns
+	 * the tx status of the posted packets only on the delete request,
+	 * before the delete response.
+	 */
+	while (drvr->bus_if->chip != BRCM_CC_4377_CHIP_ID && retry &&
+	       atomic_read(&commonring_del->outstanding_tx)) {
 		usleep_range(5000, 10000);
 		retry--;
 	}
-- 
2.56.0

