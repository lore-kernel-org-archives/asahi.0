Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABDB7E
	for <asahi@lists.linux.dev>; Wed,  7 Sep 2022 07:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RTMIwL35n5PqDT3Ek+KURvJy7JWn0/URB8eBvCX1/bg=; b=iIf7L9npab0hQVyET/6FntggIN
	SI/ITEVHrdUILr8pKE8/RwGs5S//eMWRRe7/6oYUuR4udhgYdlYUlqb6HYm7u+ISNIPixWjKskKjN
	4TT25tq3IcvrG0gaY26YEbsQhpno4S3unJd9RhX+kybQeJTyJ4NYr0Ct6Tmzics80U7oO3eML8F0i
	foGBmqjo3opR1Y6DcMMecXoBvKOZtxuxQzOcDEZmwDnpa0GeSQ8VMSzepkaBav5uFaW/8mowgxfbM
	SqOUcAVmrw7NRnwtg9hRKVLR8JBxAEHXcyX4PsyF31vavGQeaAzghT6a1w9CTPMgVwecMfU3PL4Fa
	/+HxhMKg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46830 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oVpnA-0004vq-Mh; Wed, 07 Sep 2022 08:48:12 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oVpn9-005LBq-Up; Wed, 07 Sep 2022 08:48:12 +0100
In-Reply-To: <YxhMaYOfnM+7FG+W@shell.armlinux.org.uk>
References: <YxhMaYOfnM+7FG+W@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 06/12] brcmfmac: of: Fetch Apple properties
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oVpn9-005LBq-Up@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 07 Sep 2022 08:48:11 +0100

From: Hector Martin <marcan@marcan.st>

On Apple ARM64 platforms, firmware selection requires two properties
that come from system firmware: the module-instance (aka "island", a
codename representing a given hardware platform) and the antenna-sku.
We map Apple's module codenames to board_types in the form
"apple,<module-instance>".

The mapped board_type is added to the DTS file in that form, while the
antenna-sku is forwarded by our bootloader from the Apple Device Tree
into the FDT. Grab them from the DT so firmware selection can use
them.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../wireless/broadcom/brcm80211/brcmfmac/common.h    |  1 +
 .../net/wireless/broadcom/brcm80211/brcmfmac/of.c    | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.h
index 6c5a22a32a96..aa25abffcc7d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.h
@@ -53,6 +53,7 @@ struct brcmf_mp_device {
 	struct brcmfmac_pd_cc *country_codes;
 	const char	*board_type;
 	unsigned char	mac[ETH_ALEN];
+	const char	*antenna_sku;
 	union {
 		struct brcmfmac_sdio_pd sdio;
 	} bus;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
index 79388d49c256..a83699de01ec 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
@@ -70,14 +70,24 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
 {
 	struct brcmfmac_sdio_pd *sdio = &settings->bus.sdio;
 	struct device_node *root, *np = dev->of_node;
+	const char *prop;
 	int irq;
 	int err;
 	u32 irqf;
 	u32 val;
 
+	/* Apple ARM64 platforms have their own idea of board type, passed in
+	 * via the device tree. They also have an antenna SKU parameter
+	 */
+	if (!of_property_read_string(np, "brcm,board-type", &prop))
+		settings->board_type = prop;
+
+	if (!of_property_read_string(np, "apple,antenna-sku", &prop))
+		settings->antenna_sku = prop;
+
 	/* Set board-type to the first string of the machine compatible prop */
 	root = of_find_node_by_path("/");
-	if (root) {
+	if (root && !settings->board_type) {
 		char *board_type;
 		const char *tmp;
 
-- 
2.30.2

