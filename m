Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793980085;
	b=LVrQaSkJLHUA/2EH7oSc6xY79xkLZuTw9MykHPhirei4WCpBSoquY7IWgULV22dHZ/og
	 errGYgapc1MFVbEb51rNWM5Q551pQ+tXMf7id//RtF0wJCcdJS8dPE+0u5nBiBeRwBn+i
	 D4YXM6qJmFmrZyH7E7olRyB6sgm6ogRFjkCavIwgU66weScC95BiIBu42YU3aK1aGeV5w
	 7NU1T1jsBflNI4/dlrCFw5j8HVJvrrn991U+2UafJr8l4OUmBRBbHuiZTkwxJLrKALk+/
	 A4cxzVvseUldiTl+ZJWT425SKurYo5GCKTu7qVjZm9sIdIfdBjq7O5BoHEgNiiAetZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793980085;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=ilpDC+gzi5CuJSSukh2bRj7H/3/INvb8yWuqUosFK+U=;
	b=oSj2Hq9IwBHP2jOP9iE7e8vzI9X1b4elSDXXHxJmRUTJ2p41m7DIftrabbe5L9hK2ZJt
	 7NaGKZtvGjUqEQeOT1KT0u1ikN73GhvJ6LhJ5PTi9v82I90GLAGiPTCFaQ0/HBVHvgQdQ
	 gVk/LqSfUH/DKqlDdo7s8TAVoEyUXsd7/5IAm42jZom+ouJhoJwUmMTSRnwYGaTNEmHoa
	 0rkfQ/57H9AekPH01keHK387MsWomn6MwKqygBKGr7mfha9JWySvpslHi7eYlk4Ejh87N
	 rWn4G4lixQtX8AAy38JiEDRPf3xlTxI3JtuVel1ffKxPsxyzZNZQaeI+hHCsuOahScA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBD2606A330
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 15:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CBD2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jLk8r3vDGz52RpX;
	Fri, 06 Nov 2026 23:47:56 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl1.zte.com.cn with SMTP id 6A6FlreG080918;
	Fri, 6 Nov 2026 23:47:53 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 6 Nov 2026 23:47:56 +0800 (CST)
X-Zmail-TransId: 2af96aedf6ac241-951d9
X-Mailer: Zmail v1.0
Message-ID: <20261106234756882V9wUQNCEZAYUGTAbexMSL@zte.com.cn>
In-Reply-To: <20261106234751020Egf42VCVVlsSC_Msov4HO@zte.com.cn>
References: 20261106234751020Egf42VCVVlsSC_Msov4HO@zte.com.cn
Date: Fri, 6 Nov 2026 23:47:56 +0800 (CST)
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
Subject: =?UTF-8?B?W1BBVENIIDEvNV0gc3BpOiBzaWZpdmU6IGZpeCBkaXZpc2lvbiBieSB6ZXJvIGluIGNsb2NrIGRpdmlzb3IgY2FsY3VsYXRpb24=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A6FlreG080918
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 06 Nov 2026 23:47:56 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEDF6AC.000/4jLk8r3vDGz52RpX

From: Shao Mingyin <shao.mingyin@zte.com.cn>

A SPI device without a valid speed (no spi-max-frequency property, or
created through the spidev sysfs new_device interface without a speed)
gets max_speed_hz == 0.  spi_setup() only clamps that to the controller
limit when host->max_speed_hz is set, and this driver does not set it, so
the zero reaches sifive_spi_prep_transfer() and DIV_ROUND_UP() divides
by it.

On RISC-V the divide instruction returns all ones instead of trapping,
so the controller is programmed with a bogus clock divider rather than
the rate the device asked for.

Clamp the divisor to 1 Hz so the divider calculation is well defined.

Fixes: 484a9a68d669 ("spi: sifive: Add driver for the SiFive SPI controller")
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

---

diff --git a/drivers/spi/spi-sifive.c b/drivers/spi/spi-sifive.c
index cee4d92e46f4..9c1f674f5921 100644
--- a/drivers/spi/spi-sifive.c
+++ b/drivers/spi/spi-sifive.c
@@ -168,10 +168,14 @@ sifive_spi_prep_transfer(struct sifive_spi *spi, struct spi_device *device,
 			 struct spi_transfer *t)
 {
 	u32 cr;
+	u32 speed_hz;
 	unsigned int mode;
 
+	/* A device with max_speed_hz == 0 must not divide by zero */
+	speed_hz = max_t(u32, t->speed_hz, 1);
+
 	/* Calculate and program the clock rate */
-	cr = DIV_ROUND_UP(clk_get_rate(spi->clk) >> 1, t->speed_hz) - 1;
+	cr = DIV_ROUND_UP(clk_get_rate(spi->clk) >> 1, speed_hz) - 1;
 	cr &= SIFIVE_SPI_SCKDIV_DIV_MASK;
 	sifive_spi_write(spi, SIFIVE_SPI_REG_SCKDIV, cr);
