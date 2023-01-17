Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB200D52C
	for <asahi@lists.linux.dev>; Tue, 17 Jan 2023 18:25:10 +0000 (UTC)
Received: from robin.home.jannau.net (p579ad32f.dip0.t-ipconnect.de [87.154.211.47])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 7FEC926F670;
	Tue, 17 Jan 2023 19:25:02 +0100 (CET)
From: Janne Grunau <j@jannau.net>
Date: Tue, 17 Jan 2023 19:25:00 +0100
Subject: [PATCH v2 1/2] nvme-apple: Reset controller during shutdown
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:
 <20230114-apple-nvme-suspend-fixes-v6.2-v2-1-9157bf633dba@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1570; i=j@jannau.net;
 h=from:subject:message-id; bh=qtyorAlxkkMT/6LLYB1Bf2sjPkpsduWNqrw5l5ng7OU=;
 b=owGbwMvMwCG2UNrmdq9+ahrjabUkhuRjz//une7jdPHspxsXz4QpX9JqNW8ofLKt7PmpS3uFL4W2
 pp5J6ChlYRDjYJAVU2RJ0n7ZwbC6RjGm9kEYzBxWJpAhDFycAjCRp1MZ/kd5BHDxrL5lGKkQLbzupt
 leg5POL7XC/xQ81XglfsEjewojw7qzBjVf5V6eXtwT5vDAJuO4wuKne1/GtrmEbnK+e63+PgcA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

This is a functional revert of c76b8308e4c9 ("nvme-apple: fix controller
shutdown in apple_nvme_disable").

The commit broke suspend/resume since apple_nvme_reset_work() tries to
disable the controller on resume. This does not work for the apple NVMe
controller since register access only works while the co-processor
firmware is running.

Disabling the NVMe controller in the shutdown path is also required
for shutting the co-processor down. The original code was appropriate
for this hardware. Add a comment to prevent a similar breaking changes
in the future.

Fixes: c76b8308e4c9 ("nvme-apple: fix controller shutdown in apple_nvme_disable")
Reported-by: Janne Grunau <j@jannau.net>
Link: https://lore.kernel.org/all/20230110174745.GA3576@jannau.net/
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/nvme/host/apple.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index bf1c60edb7f9..2a1f11b30615 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -829,7 +829,13 @@ static void apple_nvme_disable(struct apple_nvme *anv, bool shutdown)
 			apple_nvme_remove_cq(anv);
 		}
 
-		nvme_disable_ctrl(&anv->ctrl, shutdown);
+		/*
+		 * Always reset the NVMe controller on shutdown. The reset is
+		 * required to shutdown the co-processor cleanly.
+		 */
+		if (shutdown)
+			nvme_disable_ctrl(&anv->ctrl, shutdown);
+		nvme_disable_ctrl(&anv->ctrl, false);
 	}
 
 	WRITE_ONCE(anv->ioq.enabled, false);

-- 
2.38.2
