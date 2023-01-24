Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E68663BF
	for <asahi@lists.linux.dev>; Tue, 24 Jan 2023 13:42:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B0AC4339C;
	Tue, 24 Jan 2023 13:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674567757;
	bh=SGhr37+TV6G0LvjAGKsSRgYYqvpyCDZRUG+oipTEypM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UEi45r/UAbC442wDJLx6BHQxWVk1QKplGfYHlR/d8kP25L0WmKsTlanhyRdS7CFQK
	 PKxA2y4l7H6+5v9cfwKK6WJMCyxlQmQJSrrPF0J7JFnquWEuHlvoeZZqXdexOwr7EJ
	 37NlPM8wZ9Wrztu1PXBBe2AU72sYnMaZ9cW6TCdQ6lBxfx8UBE51BTcm0C+WX0CZmL
	 QJ1BKZRzdgnk2IN0BlQjM6vtMqTBbGx4B5UuUMEJTG6oU7KfuBXmJesuKd1zZn2OKR
	 PkFs0Z2QwEfmhub82JnuixBCaI+MoW5itipwMKbDBmvlZJgT4jKalcXgkZh1bXG9zQ
	 Rg1KdU8eh75wQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Janne Grunau <j@jannau.net>,
	Christoph Hellwig <hch@lst.de>,
	Sasha Levin <sashal@kernel.org>,
	marcan@marcan.st,
	sven@svenpeter.dev,
	kbusch@kernel.org,
	axboe@fb.com,
	sagi@grimberg.me,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH AUTOSEL 6.1 26/35] nvme-apple: only reset the controller when RTKit is running
Date: Tue, 24 Jan 2023 08:41:22 -0500
Message-Id: <20230124134131.637036-26-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124134131.637036-1-sashal@kernel.org>
References: <20230124134131.637036-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Janne Grunau <j@jannau.net>

[ Upstream commit c0a4a1eafbd48e02829045bba3e6163c03037276 ]

NVMe controller register access hangs indefinitely when the co-processor
is not running. A missed reset is preferable over a hanging thread since
it could be recoverable.

Signed-off-by: Janne Grunau <j@jannau.net>
Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/nvme/host/apple.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index ff8b083dc5c6..262d2b60ac6d 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -987,11 +987,11 @@ static void apple_nvme_reset_work(struct work_struct *work)
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
2.39.0

