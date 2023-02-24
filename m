Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B911D7C
	for <asahi@lists.linux.dev>; Fri, 24 Feb 2023 06:50:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: linasend@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id DDC724206F;
	Fri, 24 Feb 2023 06:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1677221398;
	bh=XEjX9AY/rxbyfPg1iE4VKDJGbOP+C/8aCuR0EDho4L0=;
	h=From:Date:Subject:To:Cc;
	b=RJNC2gX2MTkdFFrlC2XQ1+QOCIDwewtCU9rFAbNyqdbstuuKPcoGknHHgmWYl3JXT
	 ffqH7j6PQz7v8fh0QNQS5odDEY+5+SfD71x5uba9eldJvea0aOhZPs9SwcktTGMOxh
	 vM/wIgPK/23P4cGgWTS1wFSLG3/RHpvynTYQ3rK8kfS0EnbObYpKi0rOgqS3FDCzcB
	 faLlt8QSxD+AZO+EfCkkjDNNYFU2UepDqpioFa1b563VtB5k3bLj1eMDGmtGqiKVUt
	 laV1oK4GHQTxci+yRHsfsZwlVUyc67A2CNYb6Gx83CAv2zjRh2NwNKW08YBBQgjkVR
	 nH/QMAotQYoGA==
From: Asahi Lina <lina@asahilina.net>
Date: Fri, 24 Feb 2023 15:49:44 +0900
Subject: [PATCH] soc: apple: rtkit: Fix buffer address field width
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230224-gpu-up-rtkit-v1-1-671178cb2a5e@asahilina.net>
X-B4-Tracking: v=1; b=H4sIAAde+GMC/x2NwQrCMBBEf6Xs2cU2Fgz+inhI4rZdhBh2k1II/
 XcTj29mHlNBSZgUHkMFoZ2Vv7HBdBkgbC6uhPxuDGY0t9GYGddUsCSU/OGMy+zDZOlug3XQFO+
 U0IuLYetS216laMae9z4JLXz8756v8/wBgXTYKH4AAAA=
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Asahi Lina <lina@asahilina.net>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677221396; l=994;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=XEjX9AY/rxbyfPg1iE4VKDJGbOP+C/8aCuR0EDho4L0=;
 b=2cGAkzXmm2kGa9fJLiypOR7qW7WO91eNDpFnITNoCLa72VF/iKWxb6QTZ6LDnRDpYw6LVm5hx
 +zxE9TPOBR0DEpl2fCyeB4hC+F6L8aBXAygukJSxy5swsiuQeGdX9qh
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=

The buffer address field is missing two bits. This matters for the GPU,
which uses upper-half 64-bit addresses on the ASC and those get sign
extended from the mailbox message field, so the right number of high
bits need to be set.

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/soc/apple/rtkit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 35ec35aa500d..a02a44a745f6 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -55,7 +55,7 @@ enum {
 
 #define APPLE_RTKIT_BUFFER_REQUEST	1
 #define APPLE_RTKIT_BUFFER_REQUEST_SIZE GENMASK_ULL(51, 44)
-#define APPLE_RTKIT_BUFFER_REQUEST_IOVA GENMASK_ULL(41, 0)
+#define APPLE_RTKIT_BUFFER_REQUEST_IOVA GENMASK_ULL(43, 0)
 
 #define APPLE_RTKIT_SYSLOG_TYPE GENMASK_ULL(59, 52)
 

---
base-commit: 83f978b63fa7ad474ca22d7e2772c5988101c9bd
change-id: 20230224-gpu-up-rtkit-f4bc18e78c8a

Thank you,
~~ Lina

