Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667F82253A1
	for <asahi@lists.linux.dev>; Sat,  7 Feb 2026 16:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770482451; cv=none; b=omSw+kMmLaRIfLAUIMnc+DitPqg1P/B4SEvdl6curkdACsn0yzg40S66b46rZYWq/Sn9d0I9UHn2pms5b64bpe1wUg3vQyBvuguq0SVSQfoSee77Yf+31y9GWj5iLzZfccpPczMH4rfVBbNZRHb/x3PCrg9NHUHQNH5sPO2Uzug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770482451; c=relaxed/simple;
	bh=gXKmpNpYUfje69UnUeQRkjWXqxdVdCEP+0abPCWnBcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eFPCL5kTWlqVZ6sqKuGlrVvvr+uo+GyAa4HX4KhljQOvAADymeVjn0zrPtUk/VrUvJYfRWb/S8FDZ8OPjtb/N6tkVfsDYn+KWO6aBO52MTC9Mj7zZ8I/HExO91CTFEFbDuXL0WjoH7VjCmuxPj+KYiSaXNCNYUpNqJYN3oV77GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=VitwxPVC; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=cECKFyNp; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="VitwxPVC";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="cECKFyNp"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 0E845EC011F;
	Sat,  7 Feb 2026 11:40:50 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 07 Feb 2026 11:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1770482450; x=1770568850; bh=jU
	BEXhsSeC5uIqTFNxthrxtRMhomBleIOTGrKRAiolE=; b=VitwxPVCmY0i9Of2Ef
	CpV2pOTDwIp1LDUmV2txqZEf1eO381LmSUAlpztbX13HGUPzu/lFHegSXDrKjZTJ
	lgX6eadX4IhX1zlA60PnmPqV4MJwhzu8jeskT66+vIOxJokqrOrqI2fyoPpEh1LQ
	fzrJqj+kcFfJPLlLTsOfnCBhIzfnb7sVkpfY9bom9YtiqtHlmiM94/z1pw2UkXaW
	ILcndZrR02Y7WQLqhcAB3CLHDO/1HVoH/D67w03cpLEUB5NiIrO4AthO9eGgX9O+
	tc0TAn7R1/LjZOLxwuICHwTCElf7jepHHdbGN7qTS43ekKtN2hw5quUTDcuaM8pD
	WP+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1770482450; x=1770568850; bh=jUBEXhsSeC5uIqTFNxthrxtRMhom
	BleIOTGrKRAiolE=; b=cECKFyNpBEe1XJiMBWc/sYPBAdHw9019gwFCA0t3+ppP
	vs/I4Er40V85OH1mhMYn2T/pojWkFJkgPfKAZWLbMhzoZ4w5IgmH1yYDhfkVi01e
	OxvXR6a0mb/zPOizDsMLhhcRV3L5R6lq9dAdl4sVq/HgMG37xfTVLb0treMsvCxH
	a4PD0a76nsGV/ikyDc5aXBa8+cUzXdYLKXh3oeoTlk4GUGD92ip+kD8zzBjalwp9
	XVf6Mb4CHq7cEH4NRa/H9qVYbo3yppxCmhnoh/NBimPgiuxTV8LmOY/W1q41wQV0
	Rb6IL1yZ2Z+hq2Jj7UgR1yRVBA7so3Jb8Tl/YmORaQ==
X-ME-Sender: <xms:EWuHaYztydNBunP9xLyyftuHlKn5FXap50BLloMDcaBt62XO79jktA>
    <xme:EWuHaZpVNpFRgf3KdRIRRJKSXZ2pvLwDHWD1MIoxtSlDNV24lLS-5tps2UQ2CWQEK
    Tf2-zfhtL5_nbav1yH0alwt0cQd7GC1Jrditf_Vftcf17v4i9K1RA>
X-ME-Received: <xmr:EWuHaT3fdN20Bplt2lPJd_041oIuX0gwTIJAd2WIs4fCQuS4O6UKfXPDzy7uL1tZkQygaPN6ybAQLB6VG5p8knMyES0pQiifGRkgLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleduheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfeehle
    dtheefteejfedvheetuedttdetleegudeuteejveetieefuedvfeffvdeinecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepuddt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepphdrii
    grsggvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepuggrnhdrtggrrhhp
    vghnthgvrheslhhinhgrrhhordhorhhgpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvg
    htpdhrtghpthhtoheplhhinhhugidqphhhhieslhhishhtshdrihhnfhhrrgguvggrugdr
    ohhrghdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorh
    hgpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvh
X-ME-Proxy: <xmx:EWuHaRydCofoszGR5cvKQS7I0v4W5AEG1rf_J4l5I_U2wmnaPNStRg>
    <xmx:EWuHafiS9Ih-7-rWtMz4bNJqvAQWl6oFJeVx1N3WUKCriv9IUvx0JQ>
    <xmx:EWuHaUqnG5CyMcBL6J8nBqIi85fMUw4QL9I7Rjxu8vACnAq9ds1qPA>
    <xmx:EWuHaWiJL4-1YLA_J9l1SpJ6qk7vls-ZD3y6vbxUrYg_PKnMLOCjsA>
    <xmx:EmuHaVGBf2cvpyJQ0aqQXA9ccBCuFyw8e9OoLcCCzaLYi62xRMjDMSAF>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Feb 2026 11:40:48 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Sat, 07 Feb 2026 17:40:34 +0100
Subject: [PATCH phy-next] phy: apple: apple: Check the actual ioremap
 return value
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-phy-apple-resource-err-ptr-v1-1-78735b07ed2d@jannau.net>
X-B4-Tracking: v=1; b=H4sIAAFrh2kC/x3MQQqDMBBG4avIrDuQxKq0VykuRH91QOIwsUUR7
 960y2/x3kkJJkj0LE4yfCTJGjP8raB+7uIEliGbggu1C65hnQ/uVBewIa1v68EwY92Mq0coB+9
 Ld68rygM1jLL/5y/6dRH7Ru11fQGEpHp4dgAAAA==
X-Change-ID: 20260207-phy-apple-resource-err-ptr-5923d1130465
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=gXKmpNpYUfje69UnUeQRkjWXqxdVdCEP+0abPCWnBcU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsz2bL5czctTKpsv+pl5HnaVknGNP77Gc+/u6fHS0so/2
 TKK9Qo6SlkYxLgYZMUUWZK0X3YwrK5RjKl9EAYzh5UJZAgDF6cATOTLE0aGFVsr/C96WShHzqiX
 /+8i9uHayfIZl1hTDhS+fyD12SNBlOGv8NloHTMmxpfZX1ccV1v6pukWj+xjrpYuzsib3RldiwV
 ZAQ==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The address where the devm_ioremap_resource() return value is stored is
always a valid pointer. Check the actual return value instead as that
that might be an error value.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/asahi/aYXvX1bYOXtYCgfC@stanley.mountain/
Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/phy/apple/atc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index dc867f368b68748ea953e594ad998d7f965d8d1d..c144e273a555a741b49adfccbe046df83d193e03 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -2206,7 +2206,7 @@ static int atcphy_map_resources(struct platform_device *pdev, struct apple_atcph
 	for (int i = 0; i < ARRAY_SIZE(resources); i++) {
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resources[i].name);
 		*resources[i].addr = devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(resources[i].addr))
+		if (IS_ERR(*resources[i].addr))
 			return dev_err_probe(atcphy->dev, PTR_ERR(resources[i].addr),
 					     "Unable to map %s regs", resources[i].name);
 

---
base-commit: dbeea86fecef7cf2b93aded4525d74f6277376ef
change-id: 20260207-phy-apple-resource-err-ptr-5923d1130465

Best regards,
-- 
Janne Grunau <j@jannau.net>

