Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4675A315AF
	for <asahi@lists.linux.dev>; Tue, 10 Oct 2023 20:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gERlxxet"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31465C433C7;
	Tue, 10 Oct 2023 20:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696971419;
	bh=suuDB+tTBn5ITRqlAhlU4jlW36SzhBMty2iyCgJJw2Q=;
	h=From:To:Cc:Subject:Date:From;
	b=gERlxxet+vSuTV0nBpq1b95B3MXWdMN5p3S2iGJH+MZIRov5R9XRwjB7y9B/IHzUd
	 L1WBf/8vjv+v0Lv0ssNKOfI2lJm/auJXwOXG2BbZeBQ3U+pOdSFRV5oZaB3J4RvLzs
	 fMRr/ttbXyl1FIAZ2Iv+lcGYIVrOBKP2MwiXaLmlzoC42qoJE1o6EH9QGEUb4rDPcm
	 rQi73Phyy4CRSsrdT2mS3jrMVJ6YL04tdJ6g+DrYRtukYvuqo0bdy24g6q2PDWoKQ/
	 V5SQV+y1mFRscNG8K7o1+99gVUkTJT18nbzJBBRpWkYPwA3ZxwGIp7/rhdz7mMXoiu
	 5FEeINj4a6+EQ==
Received: (nullmailer pid 1584974 invoked by uid 1000);
	Tue, 10 Oct 2023 20:56:58 -0000
From: Rob Herring <robh@kernel.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: apple: mailbox: Add explicit include of platform_device.h
Date: Tue, 10 Oct 2023 15:56:49 -0500
Message-ID: <20231010205649.1584790-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other and pull in various other headers. In
preparation to fix this, adjust the includes for what is actually needed.

platform_device.h is implicitly included by of_platform.h, but that's going
to be removed.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Note this was added in the merge window and missed the last round.
---
 drivers/soc/apple/mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/apple/mailbox.c b/drivers/soc/apple/mailbox.c
index 0cbd172f435e..780199bf351e 100644
--- a/drivers/soc/apple/mailbox.c
+++ b/drivers/soc/apple/mailbox.c
@@ -26,6 +26,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spinlock.h>
 #include <linux/types.h>
-- 
2.42.0

