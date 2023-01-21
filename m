Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB467E
	for <asahi@lists.linux.dev>; Sat, 21 Jan 2023 07:38:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: linasend@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id C3AB541EF0;
	Sat, 21 Jan 2023 07:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1674286705;
	bh=q7UBuSh0sNqJzA71lhmY5ZED0bNc4qbRW1noW7A6qYw=;
	h=From:To:Cc:Subject:Date;
	b=yYmj28ndySj3bYRPSK8vfFu+T1cou8hjuwnfxx+HdjpmBgfHnOF55c8O1zi8bNKG+
	 RaRPj87tkE1F40fYCrSXWJPVRnzONuI/1vdKJBvEDTA9lxmCrgFP5P0FdMB9mkqBbn
	 31PnJI3s+2W14td6akGOixk6d2eoFQUCuDVmTM7gE6t/bRI3oTsZzNcCHzLpuU+bd7
	 oZ2K2jzQ82T1WfPbLmLe+sA0BWfEm1Mczm6//BB0ZU3QytOslyfUI8Cnnyej+J+qyC
	 QFX0HDeLkXnxSb7JLT1KdK9hBehxe/AzqY6NISr+MNzRmt+Q97n/gyILMyhBlS8JCb
	 4aZbTFKRJnReA==
From: Asahi Lina <lina@asahilina.net>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Asahi Lina <lina@asahilina.net>
Subject: [PATCH] soc: apple: rtkit: Add register dump decoding to crashlog
Date: Sat, 21 Jan 2023 16:37:41 +0900
Message-Id: <20230121073741.3807-1-lina@asahilina.net>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the coprocessor crashes, it's useful to get a proper register dump
so we can find out what the firmware was doing. Add a decoder for this.

Originally this had ESR decoding by reusing the ARM64 arch header for
this, but that introduces some module linking and cross-arch compilation
issues, so let's leave that out for now.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/soc/apple/rtkit-crashlog.c | 83 ++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/soc/apple/rtkit-crashlog.c b/drivers/soc/apple/rtkit-crashlog.c
index 732deed64660..e29ef0a80ab8 100644
--- a/drivers/soc/apple/rtkit-crashlog.c
+++ b/drivers/soc/apple/rtkit-crashlog.c
@@ -13,6 +13,7 @@
 #define APPLE_RTKIT_CRASHLOG_VERSION FOURCC('C', 'v', 'e', 'r')
 #define APPLE_RTKIT_CRASHLOG_MBOX FOURCC('C', 'm', 'b', 'x')
 #define APPLE_RTKIT_CRASHLOG_TIME FOURCC('C', 't', 'i', 'm')
+#define APPLE_RTKIT_CRASHLOG_REGS FOURCC('C', 'r', 'g', '8')
 
 struct apple_rtkit_crashlog_header {
 	u32 fourcc;
@@ -31,6 +32,24 @@ struct apple_rtkit_crashlog_mbox_entry {
 };
 static_assert(sizeof(struct apple_rtkit_crashlog_mbox_entry) == 0x18);
 
+struct apple_rtkit_crashlog_regs {
+	u32 unk_0;
+	u32 unk_4;
+	u64 regs[31];
+	u64 sp;
+	u64 pc;
+	u64 psr;
+	u64 cpacr;
+	u64 fpsr;
+	u64 fpcr;
+	u64 unk[64];
+	u64 far;
+	u64 unk_X;
+	u64 esr;
+	u64 unk_Z;
+};
+static_assert(sizeof(struct apple_rtkit_crashlog_regs) == 0x350);
+
 static void apple_rtkit_crashlog_dump_str(struct apple_rtkit *rtk, u8 *bfr,
 					  size_t size)
 {
@@ -94,6 +113,66 @@ static void apple_rtkit_crashlog_dump_mailbox(struct apple_rtkit *rtk, u8 *bfr,
 	}
 }
 
+static void apple_rtkit_crashlog_dump_regs(struct apple_rtkit *rtk, u8 *bfr,
+					   size_t size)
+{
+	struct apple_rtkit_crashlog_regs regs;
+	const char *el;
+	int i;
+
+	if (size < sizeof(regs)) {
+		dev_warn(rtk->dev, "RTKit: Regs section too small: 0x%lx", size);
+		return;
+	}
+
+	memcpy(&regs, bfr, sizeof(regs));
+
+	switch (regs.psr & PSR_MODE_MASK) {
+	case PSR_MODE_EL0t:
+		el = "EL0t";
+		break;
+	case PSR_MODE_EL1t:
+		el = "EL1t";
+		break;
+	case PSR_MODE_EL1h:
+		el = "EL1h";
+		break;
+	case PSR_MODE_EL2t:
+		el = "EL2t";
+		break;
+	case PSR_MODE_EL2h:
+		el = "EL2h";
+		break;
+	default:
+		el = "unknown";
+		break;
+	}
+
+	dev_warn(rtk->dev, "RTKit: Exception dump:");
+	dev_warn(rtk->dev, "  == Exception taken from %s ==", el);
+	dev_warn(rtk->dev, "  PSR    = 0x%llx", regs.psr);
+	dev_warn(rtk->dev, "  PC     = 0x%llx\n", regs.pc);
+	dev_warn(rtk->dev, "  ESR    = 0x%llx\n", regs.esr);
+	dev_warn(rtk->dev, "  FAR    = 0x%llx\n", regs.far);
+	dev_warn(rtk->dev, "  SP     = 0x%llx\n", regs.sp);
+	dev_warn(rtk->dev, "\n");
+
+	for (i = 0; i < 31; i += 4) {
+		if (i < 28)
+			dev_warn(rtk->dev,
+					 "  x%02d-x%02d = %016llx %016llx %016llx %016llx\n",
+					 i, i + 3,
+					 regs.regs[i], regs.regs[i + 1],
+					 regs.regs[i + 2], regs.regs[i + 3]);
+		else
+			dev_warn(rtk->dev,
+					 "  x%02d-x%02d = %016llx %016llx %016llx\n", i, i + 3,
+					 regs.regs[i], regs.regs[i + 1], regs.regs[i + 2]);
+	}
+
+	dev_warn(rtk->dev, "\n");
+}
+
 void apple_rtkit_crashlog_dump(struct apple_rtkit *rtk, u8 *bfr, size_t size)
 {
 	size_t offset;
@@ -140,6 +219,10 @@ void apple_rtkit_crashlog_dump(struct apple_rtkit *rtk, u8 *bfr, size_t size)
 			apple_rtkit_crashlog_dump_time(rtk, bfr + offset + 16,
 						       section_size);
 			break;
+		case APPLE_RTKIT_CRASHLOG_REGS:
+			apple_rtkit_crashlog_dump_regs(rtk, bfr + offset + 16,
+						       section_size);
+			break;
 		default:
 			dev_warn(rtk->dev,
 				 "RTKit: Unknown crashlog section: %x",
-- 
2.35.1

