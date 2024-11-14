Received: from ssh248.corpemail.net (ssh248.corpemail.net [210.51.61.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC3270818
	for <asahi@lists.linux.dev>; Thu, 14 Nov 2024 07:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.51.61.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731569384; cv=none; b=HldeVS4CNgiUjpNL3NWH8GMBHsUhznX8e0Jff3l/qQM6LpqfltFwrVZVuNAgU10TNuriOY4JcJ6HNFcBTsy0eka8ERj1AZ800/BF2/LCiM0Jip3P0A+dlQ8RGVCVO4hID5dxLt9bSyGkYPDv1fm1Ndo/L21vYJcp1XWROxIyeEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731569384; c=relaxed/simple;
	bh=acBptjapK7kzPOdStc8+QYj62YMc9TrANEj3tmzuYVc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EKhGwhaHfWbixxoFJ6KtqcygDKQFA3I5WOQ8Mw1/CxrSC3dNYom40aajYsbp4y5vkGAkj20pKGUDiJdQ46k4h1BFhnuTWaC0OBoGSmuCqv2+Zfer3CFtVgKsuQaFruP0hgthlYp0xe1tnggPwMMqQWbQMHHXeEMPrUfh+nEhZRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com; spf=pass smtp.mailfrom=inspur.com; arc=none smtp.client-ip=210.51.61.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=inspur.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inspur.com
Received: from ssh248.corpemail.net
        by ssh248.corpemail.net ((D)) with ASMTP (SSL) id KIQ00021;
        Thu, 14 Nov 2024 15:28:21 +0800
Received: from localhost.localdomain (10.94.17.107) by
 jtjnmail201605.home.langchao.com (10.100.2.5) with Microsoft SMTP Server id
 15.1.2507.39; Thu, 14 Nov 2024 15:28:22 +0800
From: Charles Han <hanchunchao@inspur.com>
To: <povik+lin@cutebit.org>, <marcan@marcan.st>, <sven@svenpeter.dev>,
	<alyssa@rosenzweig.io>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <asahi@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>, Charles
 Han <hanchunchao@inspur.com>
Subject: [PATCH] clk: clk-apple-nco: Add NULL check in applnco_probe
Date: Thu, 14 Nov 2024 15:28:20 +0800
Message-ID: <20241114072820.3071-1-hanchunchao@inspur.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
tUid: 20241114152821c48c35476f4317224c4d5eff58881383
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com

Add NULL check in applnco_probe, to handle kernel NULL pointer
dereference error.

Fixes: 6641057d5dba ("clk: clk-apple-nco: Add driver for Apple NCO")
Signed-off-by: Charles Han <hanchunchao@inspur.com>
---
 drivers/clk/clk-apple-nco.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/clk-apple-nco.c b/drivers/clk/clk-apple-nco.c
index 39472a51530a..457a48d48941 100644
--- a/drivers/clk/clk-apple-nco.c
+++ b/drivers/clk/clk-apple-nco.c
@@ -297,6 +297,9 @@ static int applnco_probe(struct platform_device *pdev)
 		memset(&init, 0, sizeof(init));
 		init.name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 						"%s-%d", np->name, i);
+		if (!init.name)
+			return -ENOMEM;
+
 		init.ops = &applnco_ops;
 		init.parent_data = &pdata;
 		init.num_parents = 1;
-- 
2.31.1

