Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4238D52D
	for <asahi@lists.linux.dev>; Tue, 17 Jan 2023 18:25:10 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id F0B5B26F671;
	Tue, 17 Jan 2023 19:25:02 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 17 Jan 2023 19:25:01 +0100
Subject:
 [PATCH v2 2/2] nvme-apple: Only reset the controller when RTKit is running
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:
 <20230114-apple-nvme-suspend-fixes-v6.2-v2-2-9157bf633dba@jannau.net>
References:
 <20230114-apple-nvme-suspend-fixes-v6.2-v2-0-9157bf633dba@jannau.net>
In-Reply-To:
 <20230114-apple-nvme-suspend-fixes-v6.2-v2-0-9157bf633dba@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@fb.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Eric Curtin <ecurtin@redhat.com>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1064; i=j@jannau.net;
 h=from:subject:message-id; bh=u2Uiv1bFso8EeQe26njgU/kTCYTgJ/N9RudVytjdmsU=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuRjz//K7P3Rc/S+5fOiFZ0c4hcrs/1V1n16zHbtrIGKb0w1
 r/zJjlIWBjEOBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABMpcmBkeMTZ9OH5v9lqSRceHORvM4
 4Q9zFbz9UsNGFlye/3Jg998hj++7Hea4k33LTUPu655PbvoTG930vEfwQnzVLgzrJcpPmXCQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

NVMe controller register access hangs indefinitely when the co-processor
is not running. A missed reset is preferable over a hanging thread since
it could be recoverable.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/nvme/host/apple.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index 2a1f11b30615..3258fd7efaf9 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -991,11 +991,11 @@ static void apple_nvme_reset_work(struct work_struct *work)
 		goto out;
 	}
 
-	if (anv->ctrl.ctrl_config & NVME_CC_ENABLE)
-		apple_nvme_disable(anv, false);
-
 	/* RTKit must be shut down cleanly for the (soft)-reset to work */
 	if (apple_rtkit_is_running(anv->rtk)) {
+		/* reset the controller if it is enabled */
+		if (anv->ctrl.ctrl_config & NVME_CC_ENABLE)
+			apple_nvme_disable(anv, false);
 		dev_dbg(anv->dev, "Trying to shut down RTKit before reset.");
 		ret = apple_rtkit_shutdown(anv->rtk);
 		if (ret)

-- 
2.38.2
