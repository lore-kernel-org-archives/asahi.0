Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BFC6FBB
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 16:22:04 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1677255722; bh=5doeosS9EHjVo4INuIYpNqv+kkFiPbeHbMYZHjoGVWM=;
	h=From:To:Cc:Subject:Date;
	b=G8ZShmzQ+zrOvl6A66hdsEM7QQBjCPXjk1zWtDJaDT8gF3BVhGVnR6C3HfcxhjbeJ
	 AWCsjd7GvztCq8pMIfE5F5nN/EgBJgRDJfSBHW+ySkqU09iBnihIg6FlbjgFHmwtRN
	 aHG1X9lB98Yeds3fsNOurHa40DgtwZ5ptNq7OKfA=
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH] soc: apple: rtkit: Crop syslog messages
Date: Fri, 24 Feb 2023 17:21:59 +0100
Message-Id: <20230224162159.46348-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Crop trailing whitespace, null, and newline characters in syslog
messages received from coprocessors. Notably DCP sends its messages
including a trailing newline, so prior to this change we would end up
cluttering the kernel log by repeated newlines at the end of messages.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 drivers/soc/apple/rtkit.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 35ec35aa500d..639f5134d159 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -409,11 +409,17 @@ static void apple_rtkit_syslog_rx_init(struct apple_rtkit *rtk, u64 msg)
 		rtk->syslog_n_entries, rtk->syslog_msg_size);
 }
 
+static bool should_crop_syslog_char(char c)
+{
+	return c == '\n' || c == '\r' || c == ' ' || c == '\0';
+}
+
 static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 {
 	u8 idx = msg & 0xff;
 	char log_context[24];
 	size_t entry_size = 0x20 + rtk->syslog_msg_size;
+	int msglen;
 
 	if (!rtk->syslog_msg_buffer) {
 		dev_warn(
@@ -446,7 +452,13 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 			   rtk->syslog_msg_size);
 
 	log_context[sizeof(log_context) - 1] = 0;
-	rtk->syslog_msg_buffer[rtk->syslog_msg_size - 1] = 0;
+
+	msglen = rtk->syslog_msg_size - 1;
+	while (msglen > 0 &&
+		   should_crop_syslog_char(rtk->syslog_msg_buffer[msglen - 1]))
+		msglen--;
+
+	rtk->syslog_msg_buffer[msglen] = 0;
 	dev_info(rtk->dev, "RTKit: syslog message: %s: %s\n", log_context,
 		 rtk->syslog_msg_buffer);
 
-- 
2.33.0

