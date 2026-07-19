Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C677262A;
	Sun, 19 Jul 2026 13:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784466044; cv=none; b=YVjJ+3vhFXAQgz40XAooRHySzSupGEGN/ztnaXJHVA9HFEBMaE75EJe6py6sJZ6QraVc+edOCpybhwz69C+n1iURcmFBy25x3TPuKwHqivK7eOJFubvwSh1c3quKNd//hOmqg24boW+p3TS7lU7CDVsGXlr8H0gMJuQlS3QXl1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784466044; c=relaxed/simple;
	bh=IpCdIvtqrUwzVFJ1/y1oYQ0klko2f12CuHINIX6XHp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B5GOUx5AKcnlYjS/PPwSw/YHlPiF6NihBSWw0llryAQSN5j4Fuyt/Zt7ZJz+X6KdkKJEirnVyklTifFYQH5ubwjxwk5C5u2c9RtCz6uI977BnVQxZTlMfUWbEhk0pWlNixmfsHk83FEOSPBsbRdwUAq0TJdk3BsQ3ithU4U+2vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aX4hm9Mu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aX4hm9Mu"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B6A0C19425;
	Sun, 19 Jul 2026 13:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784466043;
	bh=IpCdIvtqrUwzVFJ1/y1oYQ0klko2f12CuHINIX6XHp0=;
	h=From:Date:Subject:To:Cc:From;
	b=aX4hm9Muu7/kgalY7O/TrueR7ctjDyk5xAcBofehBQP7ZEECG8mg9W/Bo+X1DWDF0
	 ydDl7AY3fHDNdRGuT9CiHdvM+tnXV/HDI/S24JQj2hpp6vWod+dnlbh2MtnUN4RaPw
	 R+ovp5pkB0AK7CqmxyyrMOWLcRn2Tt1q2Ny48hcFyslETDgvRJzf0hYNvOqtaYLGzw
	 9RcaizH2jjraBP6ma67xMNJsc3pqIoVrm7FIA2N2ixurCq029wIRwAjS1HAhCOgCmF
	 kxXLvMRoOzCSjRnZDGmro1Us581VTlUx9D4e/HIQ7yct5mSHJBzfGNbLk63K1rs1TY
	 MXGppGvr+UV1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B14C4450A;
	Sun, 19 Jul 2026 13:00:43 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 19 Jul 2026 15:00:32 +0200
Subject: [PATCH] mfd: macsmc: Fix key count endianness annotation
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-b4-macsmc-be32-fix-v1-1-c7b1936307fa@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrB0wUaL2KuIik47tCNqSURHEu
 5vW5ffg/QcoR2GFR3ZA5E1UPnOCyTMIbz+/GOWZDLawrqhNi1Th5INOAYlLi4Ps6MqaGyLjWus
 hHb+R0/yPdv1tXWnksPxKcJ4XwjqYl3YAAAA=
X-Change-ID: 20260719-b4-macsmc-be32-fix-637e8bb1692a
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=IpCdIvtqrUwzVFJ1/y1oYQ0klko2f12CuHINIX6XHp0=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1bMqYp2pYikT13FLYG8HiX/uY447mATeXFkerccB8NL5
 zcbVzzvKGVhEONikBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAEzkZSgjw68OU/fSLdsbN6bc
 1tWeMfFvoIe3y+LLupXNc0KeBC/KPczwm11+6qTM9Zd3FcutOsh6dt9GpTnTlqpbT/p7J8vgx8z
 J4rwA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

SMC firmware returns the value of the #KEY key in big-endian unlike most
other keys. Reading it through apple_smc_read_u32() into a plain u32
and then converting with be32_to_cpu() makes sparse complain:

  drivers/mfd/macsmc.c:462:26: sparse: cast to restricted __be32

Read the raw value into a __be32 using apple_smc_read() instead.

Fixes: e038d985c982 ("mfd: Add Apple Silicon System Management Controller")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607181046.OANjIoqR-lkp@intel.com/
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/mfd/macsmc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 358feec2d088..514cba7dc897 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -410,7 +410,7 @@ static int apple_smc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct apple_smc *smc;
-	u32 count;
+	__be32 count;
 	int ret;
 
 	smc = devm_kzalloc(dev, sizeof(*smc), GFP_KERNEL);
@@ -461,8 +461,10 @@ static int apple_smc_probe(struct platform_device *pdev)
 	dev_set_drvdata(&pdev->dev, smc);
 	BLOCKING_INIT_NOTIFIER_HEAD(&smc->event_handlers);
 
-	ret = apple_smc_read_u32(smc, SMC_KEY(#KEY), &count);
-	if (ret)
+	ret = apple_smc_read(smc, SMC_KEY(#KEY), &count, sizeof(count));
+	if (ret >= 0 && ret != sizeof(count))
+		ret = -EINVAL;
+	if (ret < 0)
 		return dev_err_probe(smc->dev, ret, "Failed to get key count");
 	smc->key_count = be32_to_cpu(count);
 

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260719-b4-macsmc-be32-fix-637e8bb1692a

Best regards,
--  
Sven Peter <sven@kernel.org>


