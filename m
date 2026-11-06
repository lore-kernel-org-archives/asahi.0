Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980084;
	b=YEm7O6GXpkoMVz6chbsLhx64E4UGRqER1M6oxbG950g9EI4jTj4rZKZiDHnnnZtOEHzI
	 QTUgvxvrltj6tWqxjmHNZrPlcZes1P0z4hHLNQCGsj9BIZqE8XKuTIWUrCopRhWrqjTXc
	 ypFoBZ86vuIbmOK8Y7R/jT+HNaewaXtncA1/Mv7ujk8JCQiez3hn0n6Hnsq66FQoZEE+8
	 XUOuXRkY67Xy/0/KEBmkI+ib+S/dc4j7MXTlhokaPqSrbPP80isvYMUUm9ucxSqAAREle
	 6mBdq8F7tlDdxC0IwtuQ5zB+JIOLK+V39JC1O7TljWZQNArcL3JiF95I5eVxqFFubvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980084;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=BAgeKz0Vili1SlZs1hB8WmyCeJ9ALq7iJrhVHBw1A0Q=;
	b=NTbYebYI9gKSqtoaeYU/0l4dxlK9lXw0XppOqQgR9kn7NP0/PRVstYM3+hW7636jG6S8
	 0imhiphYXFVain3VCZoi5H79+fPjd3A0N2ifVcBpenKcAKX7vVOVB6mtQrjSVC3Z+wNMp
	 m3Emy9avUuB7cjgJ926dkwhEtEmmWy7Bo2DCLjlGhwEzZy7PIkoYZFaG4/qYnfhNnl/Wh
	 PLv/WyBk6AcCfi8dU+VU2L0Mc64ufBrpDY83S4+lAdDqnM+HNbw1aFRErW9lYk2MpnKwu
	 Kat1uYz78fEwwDZ1pd/40Y19X3qXMh2VxkZB1kg6VoVP6lVnj0gR6ueV8aKeXl4jjuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F70606A32F
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 15:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F70606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jLk8x2sykz5B12j;
	Fri, 06 Nov 2026 23:48:01 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 6A6FlsdT080919;
	Fri, 6 Nov 2026 23:47:54 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 6 Nov 2026 23:47:58 +0800 (CST)
X-Zmail-TransId: 2afa6aedf6ae7d9-a6760
X-Mailer: Zmail v1.0
Message-ID: <202611062347585864V0L-uDsz2x7pLLSJ623k@zte.com.cn>
In-Reply-To: <20261106234751020Egf42VCVVlsSC_Msov4HO@zte.com.cn>
References: 20261106234751020Egf42VCVVlsSC_Msov4HO@zte.com.cn
Date: Fri, 6 Nov 2026 23:47:58 +0800 (CST)
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <broonie@kernel.org>, <linux-spi@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <pjw@kernel.org>, <samuel.holland@sifive.com>,
        <william.zhang@broadcom.com>, <kursad.oney@broadcom.com>,
        <jonas.gorski@gmail.com>, <bcm-kernel-feedback-list@broadcom.com>,
        <anand.gore@broadcom.com>, <florian.fainelli@broadcom.com>,
        <rafal@milecki.pl>, <linux-arm-kernel@lists.infradead.org>,
        <sven@kernel.org>, <j@jannau.net>, <neal@gompa.dev>,
        <asahi@lists.linux.dev>, <ryan.wanner@microchip.com>,
        <nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
        <claudiu.beznea@tuxon.dev>
Subject: =?UTF-8?B?W1BBVENIIDIvNV0gc3BpOiBiY202M3h4LWhzc3BpOiBmaXggZGl2aXNpb24gYnkgemVybyBmb3IgZGV2aWNlcyB3aXRob3V0IGEgbWF4IHNwZWVk?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A6FlsdT080919
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 06 Nov 2026 23:48:01 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEDF6B1.000/4jLk8x2sykz5B12j

From: Shao Mingyin <shao.mingyin@zte.com.cn>

A SPI device whose max_speed_hz is zero (no spi-max-frequency property,
or created through the spidev sysfs new_device interface without a
speed) leaves the transfer speed at zero.  spi_setup() would only clamp
it if host->max_speed_hz was set, which this driver does not do, so
bcm63xx_hsspi_set_clk() divides by zero in DIV_ROUND_UP().

The division does not trap on MIPS or arm64.  The quotient is undefined
or zero, so the clock control register is programmed with a meaningless
value.

Clamp the requested rate to 1 Hz before computing the divider.

Fixes: 142168eba9dc ("spi: bcm63xx-hsspi: add bcm63xx HSSPI driver")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

---

diff --git a/drivers/spi/spi-bcm63xx-hsspi.c b/drivers/spi/spi-bcm63xx-hsspi.c
index abfbf97faf7b..319951fba387 100644
--- a/drivers/spi/spi-bcm63xx-hsspi.c
+++ b/drivers/spi/spi-bcm63xx-hsspi.c
@@ -469,6 +469,9 @@ static void bcm63xx_hsspi_set_clk(struct bcm63xx_hsspi *bs,
 	unsigned int profile = spi_get_chipselect(spi, 0);
 	u32 reg;
 
+	/* A device with max_speed_hz == 0 must not divide by zero */
+	hz = max_t(int, hz, 1);
+
 	reg = DIV_ROUND_UP(2048, DIV_ROUND_UP(bs->speed_hz, hz));
 	__raw_writel(CLK_CTRL_ACCUM_RST_ON_LOOP | reg,
 		     bs->regs + HSSPI_PROFILE_CLK_CTRL_REG(profile));
