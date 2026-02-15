Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A741FC7C5
	for <asahi@lists.linux.dev>; Sun, 15 Feb 2026 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771142578; cv=none; b=VGjY+q4jVDjmpnIUcMra5VhEkipY7V5wxiDKruSv/PsS3M1Cjowua34SXucR5GRhRBVmwrAH4AK5RoPUIXSfz8jLP1Du6i5S5lkhqNxp38M9NoFf3PyL2bIc1uLpvhS4KG/dixn4Ay1VqjJ49fcvls3tUu75WeJmUD+paOZDmJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771142578; c=relaxed/simple;
	bh=k6Pu3hp4o8H6H3NimaF8MDzlCw3MXZsNEGNQ1rIeNOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mLv6hb0PnQVbJqsJmph8yMS1Lmb71i6nxGUWbWcJg8IxKR2TKG4FL1v4wyG8KwvZGvO3N9UIiKiGK7f/93mRsiz+Lii4cJy/c87tHPdnyUlljA5fT2hq0XYxj2Q7yobRft8pWcblQmYz39RMGVsXSWVPLyMCVkHj9Jmyr/d/f9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=S90IxM2N; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Q9nKH51F; arc=none smtp.client-ip=202.12.124.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="S90IxM2N";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Q9nKH51F"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 165901D00129;
	Sun, 15 Feb 2026 03:02:56 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 15 Feb 2026 03:02:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1771142575; x=1771228975; bh=Vj
	HuDUCBdPuzPfZZ59hYejkXpV6FXrKXKbP88JxRbR0=; b=S90IxM2N5qUv15/Czj
	XLOpP6/qAxOfHwagyIXkhS0W066iTYi1+9NOq2gqaXLc3aw6KAe1KEKKnN6MCL7/
	zZFVpTCs0OfmRuaifL/9jLrJoJeQbuplnbowUDbakXIk9HUqXo/zR7PXfDdW1NKI
	gCnt8K3HJ/T2pSk6MYs9wRRgsQVBHZR4cJBcO3oeHyohRcOVEfCXtJ9jF+iWRGTk
	Mf0BDmxnDFDHRuLu0/gZbYqw5oKKiZge823v0uP9LryqWRyff6AEmjPBOaZJUsZw
	+KMuki0VJIq5bsNKz85Qht9AA7zMeLUm13R9bGO93jFCkNADGOj8NJeuokEm6GJW
	TgZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1771142575; x=1771228975; bh=VjHuDUCBdPuzPfZZ59hYejkXpV6F
	XrKXKbP88JxRbR0=; b=Q9nKH51Fk7FSD2Sz3PRLlOBg6dmwCOjfD8HSE/ernlsA
	GAiwJ3L6MgFzw/rhZRl2kycqVnLIHCSAyA6tQxW9GX1WbhovNhlE3sb4I1DsS2UH
	lN/evFwpvUAgOYXkUKv8HyeVIJcplsul/5lC7COH8LoKlxjgLTCRuCBvg7j2UWh5
	pUnfS3neme1IaYxIWcVl1rlxJkhuchQMrj2IZsRo9p+6ZiPnjC10ukJKhoKcZP/g
	ypRisZCczPWAmOTfxB4XnHTHvDrPqI2BUGz4y+hGAALrzNUmI+VupcqbKifILeOv
	poKxfSklof4ad8N9AUQ8UlZlsdge7Dw0UfP6ycg+sg==
X-ME-Sender: <xms:r32RaaASTCO0YH3nEKpObdSL2DBVsZBjeQAmtoHj-keQcqznH5sm0g>
    <xme:r32Raa4sCp4G-wIOWuJoa3LyDndJbO6khD5RVgyHQAOHN5R9dHd3DADsducaPkBId
    XAvYOainRAlEClxagfoopXErueoSwXeJTJWVmqoWUx05BbvjAMWFfE>
X-ME-Received: <xmr:r32RaZ170f8DbzioOdn9Re-eFQ3iuvGLRvVDhh_lni5q5Vroleg60FQAObWAQyZw-i0l_wKXoyVAdIjq5TpfbahUADkn2lpAFaxLWg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvudefgeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfeehle
    dtheefteejfedvheetuedttdetleegudeuteejveetieefuedvfeffvdeinecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepuddv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlih
    hnuhigrdguvghvpdhrtghpthhtoheplhhinhhugidqphhhhieslhhishhtshdrihhnfhhr
    rgguvggrugdrohhrghdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehvkhhouhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvghilhdrrghrmh
    hsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepnhgvrghlsehgohhmphgr
    rdguvghvpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhordhorh
    hgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhf
    rhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:r32RaWlPaqHeBRU5NR7jUKqtU9gVr9-eJefxE-FufBFvyY4kAZPH4g>
    <xmx:r32RaX4wUhkGOIEHk0hSndqMKSxyMAu_eGRqPSr6nMg-7ufU3545Zg>
    <xmx:r32RaZklYqX-q1q9OdMtyK3QD4je9w9ijLzxBBZpwAvLn1WTt6J2yg>
    <xmx:r32RaSVbi2kDPBAFqsaovAe3h-7k8hv910rePKv_hYHhKe-4JMQU9w>
    <xmx:r32RaXWQTHJNCT-7b5CyPljOwtOX4UeM99oXw2uhYjqeuHadWEo1OKNN>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Feb 2026 03:02:55 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Sun, 15 Feb 2026 09:02:51 +0100
Subject: [PATCH phy-next v2] phy: apple: apple: Use local variable for
 ioremap return value
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260215-phy-apple-resource-err-ptr-v2-1-e43c22453682@jannau.net>
X-B4-Tracking: v=1; b=H4sIAKp9kWkC/42NQQ6CMBBFr0Jm7Zi2CFVW3sO4qHS0NaY0UyAQw
 t2tPYHLl5f//gaJ2FOCrtqAafbJDyGDOlTQOxNehN5mBiVUK5TQGN2KJsYPIVMaJu4JiRnjyNh
 cVG2lrMWpbSAHItPTLyV+g98u0DLCPRvn0zjwWl5nWfw/B7NEifqs6+YhNFllr28TgpmOgXJ33
 /cvR8pQ5M8AAAA=
X-Change-ID: 20260207-phy-apple-resource-err-ptr-5923d1130465
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Vladimir Oltean <olteanv@gmail.com>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2061; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=k6Pu3hp4o8H6H3NimaF8MDzlCw3MXZsNEGNQ1rIeNOs=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsyJtetetQpGnf/pL9vm/svKLZDzzlW3u15q09a3iqr/a
 1ErXF7WUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCIPbjMy/K5w5Tqdp3r5UPRG
 +ww/x9Y25okMHlzBxe8rRJZ0W56XYPif37m2eE6xyDd1FgOrJ5WuVh7la+/yNwrdvCAbLs66Tp0
 bAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The indirection through the resources array is unnecessarily complicated
and resuling in using IS_ERR() and PTR_ERR() on a valid address. A local
variable for the devm_ioremap_resource() return value is both easier to
read and matches expectations when reading code.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/asahi/aYXvX1bYOXtYCgfC@stanley.mountain/
Suggested-by: Vladimir Oltean <olteanv@gmail.com>
Fixes: 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY")
Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v2:
- Use a local variable instead of the complex indirection with the
  resources array
- Link to v1: https://lore.kernel.org/r/20260207-phy-apple-resource-err-ptr-v1-1-78735b07ed2d@jannau.net
---
 drivers/phy/apple/atc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index dc867f368b68748ea953e594ad998d7f965d8d1d..64d0c3dba1cbb95f867d338da706225ee0bf79f7 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -2202,14 +2202,16 @@ static int atcphy_map_resources(struct platform_device *pdev, struct apple_atcph
 		{ "pipehandler", &atcphy->regs.pipehandler, NULL },
 	};
 	struct resource *res;
+	void __iomem *addr;
 
 	for (int i = 0; i < ARRAY_SIZE(resources); i++) {
 		res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resources[i].name);
-		*resources[i].addr = devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(resources[i].addr))
-			return dev_err_probe(atcphy->dev, PTR_ERR(resources[i].addr),
+		addr = devm_ioremap_resource(&pdev->dev, res);
+		if (IS_ERR(addr))
+			return dev_err_probe(atcphy->dev, PTR_ERR(addr),
 					     "Unable to map %s regs", resources[i].name);
 
+		*resources[i].addr = addr;
 		if (resources[i].res)
 			*resources[i].res = res;
 	}

---
base-commit: dbeea86fecef7cf2b93aded4525d74f6277376ef
change-id: 20260207-phy-apple-resource-err-ptr-5923d1130465

Best regards,
-- 
Janne Grunau <j@jannau.net>

