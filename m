Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0B17F
	for <asahi@lists.linux.dev>; Mon, 12 Sep 2022 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Iqv2ZNon/0V6qOMjnZaExwEfo5N/cA+0Vtwvr2YuKdI=; b=0VYJqPGXPmPKrgaFNBFpS44RNq
	1kQEUZcU80lxKls6t5QmZldkQ3desg4NAWXZlNS0Pz06+kUihjmeP/ZKuoKgYoe34s9EsAbibvt1G
	wQETFsvTRGrbmAfytJO/0bmcUF1FLpoprGOz4iMaDRxPKApW3v3xbaTX8SaSqu2QyvMlZdegRomGg
	itnIIWNJJ2McjIX7F9QazyoC1pTART3Mp6MjxMh+pG7CasHdZKOpn1P4WR4CKF08g/hxaPwL5QDcE
	X3MzPD1jtX6wqcIs74DPEnb1BgHlXRnjs3uTMSt5PAPexDs8Q+UeMjLgqulMT+YOj64DFr+LarnNE
	UutnG+/w==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60536 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oXg83-0001UD-7a; Mon, 12 Sep 2022 10:53:23 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oXg82-0064vT-HX; Mon, 12 Sep 2022 10:53:22 +0100
In-Reply-To: <Yx8BQbjJT4I2oQ5K@shell.armlinux.org.uk>
References: <Yx8BQbjJT4I2oQ5K@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: Arend van Spriel <aspriel@gmail.com>,
	Franky Lin <franky.lin@broadcom.com>,
	Hante Meuleman <hante.meuleman@broadcom.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	"David S. Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Hector Martin <marcan@marcan.st>,
	Jakub Kicinski <kuba@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafa__ Mi__ecki" <zajec5@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	SHA-cyfmac-dev-list@infineon.com,
	Sven Peter <sven@svenpeter.dev>
Subject: [PATCH wireless-next v2 09/12] brcmfmac: msgbuf: Increase RX ring
 sizes to 1024
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oXg82-0064vT-HX@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 12 Sep 2022 10:53:22 +0100

From: Hector Martin <marcan@marcan.st>

Newer chips used on Apple platforms have a max_rxbufpost greater than
512, which causes warnings when brcmf_msgbuf_rxbuf_data_fill tries to
put more entries in the ring than will fit. Increase the ring sizes
to 1024.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.h
index 2e322edbb907..6a849f4a94dd 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.h
@@ -8,10 +8,10 @@
 #ifdef CONFIG_BRCMFMAC_PROTO_MSGBUF
 
 #define BRCMF_H2D_MSGRING_CONTROL_SUBMIT_MAX_ITEM	64
-#define BRCMF_H2D_MSGRING_RXPOST_SUBMIT_MAX_ITEM	512
+#define BRCMF_H2D_MSGRING_RXPOST_SUBMIT_MAX_ITEM	1024
 #define BRCMF_D2H_MSGRING_CONTROL_COMPLETE_MAX_ITEM	64
 #define BRCMF_D2H_MSGRING_TX_COMPLETE_MAX_ITEM		1024
-#define BRCMF_D2H_MSGRING_RX_COMPLETE_MAX_ITEM		512
+#define BRCMF_D2H_MSGRING_RX_COMPLETE_MAX_ITEM		1024
 #define BRCMF_H2D_TXFLOWRING_MAX_ITEM			512
 
 #define BRCMF_H2D_MSGRING_CONTROL_SUBMIT_ITEMSIZE	40
-- 
2.30.2

