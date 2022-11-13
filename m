Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E901850
	for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 16:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=A76JdcFGl9LxRJ6UZ4vu/ALvnB2ze2HwPvZ4m1X8KwQ=; b=nsP6IM7YG9R8R5WiauyUCcZlp4
	zy+7wV0KdHmcpCzBxcilvSTUfcKkmz+Zboj0ImZzOxYXfN+APQvHRXHjJAufXvMKlhyW3pCzgxxrT
	fKljRw3wFUMPove3ThC1hjiYBH6RQHJhSH6gZU4/kVaYvtqp6MrgPGDdPUxlvROc+w1+I9eyN+lZl
	Ob7nAVbd5tEhnE1nFm5dNLlPX+3b1nz8hODOiQXJBoM0JhTDVxNHN7nw1HXTeG0IPqwz5yP0dd9qN
	ne0q5LY2PZ1qMRjXVWyYWjp9/+zx4r8+m2aAwgJtKa4zQSgEB0LgUvvvn5gRyc+LysIyLO417co3W
	jWkB80Yg==;
Received: from 213-225-8-167.nat.highway.a1.net ([213.225.8.167] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouFar-00CC8M-Q5; Sun, 13 Nov 2022 16:12:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 11/13] nvme-pci: move the HMPRE check into nvme_setup_host_mem
Date: Sun, 13 Nov 2022 17:11:36 +0100
Message-Id: <20221113161138.883195-12-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221113161138.883195-1-hch@lst.de>
References: <20221113161138.883195-1-hch@lst.de>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Check that a HMB is wanted into the allocation helper instead of the
caller.  This makes life simpler for an upcoming second caller.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/nvme/host/pci.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 4da339690ec67..54e16cf1590c3 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2102,6 +2102,9 @@ static int nvme_setup_host_mem(struct nvme_dev *dev)
 	u32 enable_bits = NVME_HOST_MEM_ENABLE;
 	int ret;
 
+	if (dev->ctrl.hmpre)
+		return 0;
+
 	preferred = min(preferred, max);
 	if (min > max) {
 		dev_warn(dev->ctrl.device,
@@ -2862,11 +2865,9 @@ static void nvme_reset_work(struct work_struct *work)
 
 	nvme_dbbuf_dma_alloc(dev);
 
-	if (dev->ctrl.hmpre) {
-		result = nvme_setup_host_mem(dev);
-		if (result < 0)
-			goto out;
-	}
+	result = nvme_setup_host_mem(dev);
+	if (result < 0)
+		goto out;
 
 	result = nvme_setup_io_queues(dev);
 	if (result)
-- 
2.30.2

