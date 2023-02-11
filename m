Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4675A10E3
	for <asahi@lists.linux.dev>; Sat, 11 Feb 2023 09:13:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: linasend@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 38358424EC;
	Sat, 11 Feb 2023 09:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1676106812;
	bh=I+IK6qQ7gaXsQ1ViBTeWacu6GcpTW5fOOPr4of64kW4=;
	h=From:To:Cc:Subject:Date;
	b=PHMlETyumw5IcWqF65/BEQxoJJeVVwLmWGdfxAfFyvIU5qlDaYyQj49KuXHR8RLbB
	 JW0bMrm5Z1kmjY7woj6LHCj0cbTwGkDsluhhLXYRo9cl1hgXM02VRJsoValgx4tepJ
	 1Kpi1WTVux6WNEo2g5dW6rLIZt/IHGdCb/FOIxAheGoDcJj4/IeXrnQ0H0JFcrib/w
	 6iKiLvH7i9l9ekTjMrnAo14cuxX12Cww2m8tuJUqkWpXrmttcCaJKmh3nPSUdfpsUB
	 5qurZz4FqzaiyCtNtpBw0YsTKP6JKtWDRux7CbimErCKVKYrwp9EZ+XDSvetcoZpq2
	 hCm5mHLiTb2Ng==
From: Asahi Lina <lina@asahilina.net>
To: Arnd Bergmann <arnd@arndb.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Asahi Lina <lina@asahilina.net>
Subject: [PATCH] soc: apple: rtkit: Do not copy the reg state structure to the stack
Date: Sat, 11 Feb 2023 18:13:02 +0900
Message-Id: <20230211091302.4576-1-lina@asahilina.net>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The register state struct is 848 bytes, which ends up bloating the
apple_rtkit_crashlog_dump_regs stack frame beyond 1024 on some
32-bit platforms, triggering compile warnings.

This doesn't matter for 64BIT/ARM64, but there's also no good reason to
copy the structure to the stack in this case. We can use __packed to
avoid alignment issues, there are no double-read hazards, and this is a
fatal error path so performance does not matter.

Fixes: 22991d8d5725 ("soc: apple: rtkit: Add register dump decoding to crashlog")
Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/soc/apple/rtkit-crashlog.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/apple/rtkit-crashlog.c b/drivers/soc/apple/rtkit-crashlog.c
index dfa74b32eda2..8319e365110b 100644
--- a/drivers/soc/apple/rtkit-crashlog.c
+++ b/drivers/soc/apple/rtkit-crashlog.c
@@ -57,7 +57,7 @@ struct apple_rtkit_crashlog_regs {
 	u64 unk_X;
 	u64 esr;
 	u64 unk_Z;
-};
+} __packed;
 static_assert(sizeof(struct apple_rtkit_crashlog_regs) == 0x350);
 
 static void apple_rtkit_crashlog_dump_str(struct apple_rtkit *rtk, u8 *bfr,
@@ -126,18 +126,18 @@ static void apple_rtkit_crashlog_dump_mailbox(struct apple_rtkit *rtk, u8 *bfr,
 static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
 					   size_t size)
 {
-	struct apple_rtkit_crashlog_regs regs;
+	struct apple_rtkit_crashlog_regs *regs;
 	const char *el;
 	int i;
 
-	if (size < sizeof(regs)) {
+	if (size < sizeof(*regs)) {
 		dev_warn(rtk->dev, "RTKit: Regs section too small: 0x%zx", size);
 		return;
 	}
 
-	memcpy(&regs, bfr, sizeof(regs));
+	regs = (struct apple_rtkit_crashlog_regs *)bfr;
 
-	switch (regs.psr & PSR_MODE_MASK) {
+	switch (regs->psr & PSR_MODE_MASK) {
 	case PSR_MODE_EL0t:
 		el = "EL0t";
 		break;
@@ -160,11 +160,11 @@ static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
 
 	dev_warn(rtk->dev, "RTKit: Exception dump:");
 	dev_warn(rtk->dev, "  == Exception taken from %s ==", el);
-	dev_warn(rtk->dev, "  PSR    = 0x%llx", regs.psr);
-	dev_warn(rtk->dev, "  PC     = 0x%llx\n", regs.pc);
-	dev_warn(rtk->dev, "  ESR    = 0x%llx\n", regs.esr);
-	dev_warn(rtk->dev, "  FAR    = 0x%llx\n", regs.far);
-	dev_warn(rtk->dev, "  SP     = 0x%llx\n", regs.sp);
+	dev_warn(rtk->dev, "  PSR    = 0x%llx", regs->psr);
+	dev_warn(rtk->dev, "  PC     = 0x%llx\n", regs->pc);
+	dev_warn(rtk->dev, "  ESR    = 0x%llx\n", regs->esr);
+	dev_warn(rtk->dev, "  FAR    = 0x%llx\n", regs->far);
+	dev_warn(rtk->dev, "  SP     = 0x%llx\n", regs->sp);
 	dev_warn(rtk->dev, "\n");
 
 	for (i = 0; i < 31; i += 4) {
@@ -172,12 +172,12 @@ static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
 			dev_warn(rtk->dev,
 					 "  x%02d-x%02d = %016llx %016llx %016llx %016llx\n",
 					 i, i + 3,
-					 regs.regs[i], regs.regs[i + 1],
-					 regs.regs[i + 2], regs.regs[i + 3]);
+					 regs->regs[i], regs->regs[i + 1],
+					 regs->regs[i + 2], regs->regs[i + 3]);
 		else
 			dev_warn(rtk->dev,
 					 "  x%02d-x%02d = %016llx %016llx %016llx\n", i, i + 3,
-					 regs.regs[i], regs.regs[i + 1], regs.regs[i + 2]);
+					 regs->regs[i], regs->regs[i + 1], regs->regs[i + 2]);
 	}
 
 	dev_warn(rtk->dev, "\n");
-- 
2.35.1

