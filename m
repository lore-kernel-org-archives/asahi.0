Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939B51869
	for <asahi@lists.linux.dev>; Sun, 13 Nov 2022 16:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=d4y9CJwLVJ91ugribnIUaGmc0GKqSNoJlHsWOuP77Gw=; b=NPmAYtid5bVOwUo2jDCN0yImJJ
	NEBi1Jm5Xv1rmAozF9gR5XvUh1jYRuWUixe/+CzhYBTztJ19eNsdphj8LYOH9cz7nrZCR1MeBE4u0
	iHWV+segTYe0Wpu8jzBVe3q52rybFHCEXWXWHIbqxQZAPfcPuQatnGcHQM/ZbzPhK+WC2ejWdW59B
	rKChfmV+AgkpJDRxsuRx/AUkn0RajjJiIKFaVDXon/M5e9nFsiiQFef3Is0+yQnzwsi9KAcuIFC99
	cnVBxPwALgHe3hrie5TcQTbMRtMItXJ794s9/ZMPKX0zbijBvn3htLd4la/rGOaPhdpSBYMpVIRJ1
	pkQDHK5g==;
Received: from 213-225-8-167.nat.highway.a1.net ([213.225.8.167] helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouFaj-00CC27-D7; Sun, 13 Nov 2022 16:12:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	asahi@lists.linux.dev,
	linux-nvme@lists.infradead.org
Subject: [PATCH 09/13] nvme-pci: call nvme_pci_configure_admin_queue from nvme_pci_enable
Date: Sun, 13 Nov 2022 17:11:34 +0100
Message-Id: <20221113161138.883195-10-hch@lst.de>
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

nvme_pci_configure_admin_queue is called right after nvme_pci_enable, and
it's work is undone by nvme_dev_disable.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
Tested-by Gerd Bayer <gbayer@linxu.ibm.com>
---
 drivers/nvme/host/pci.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 9dcb35f148009..c2e3a87237da8 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -2639,7 +2639,8 @@ static int nvme_pci_enable(struct nvme_dev *dev)
 
 	pci_enable_pcie_error_reporting(pdev);
 	pci_save_state(pdev);
-	return 0;
+
+	return nvme_pci_configure_admin_queue(dev);
 
  disable:
 	pci_disable_device(pdev);
@@ -2829,10 +2830,6 @@ static void nvme_reset_work(struct work_struct *work)
 	if (result)
 		goto out_unlock;
 
-	result = nvme_pci_configure_admin_queue(dev);
-	if (result)
-		goto out_unlock;
-
 	if (!dev->ctrl.admin_q) {
 		result = nvme_pci_alloc_admin_tag_set(dev);
 		if (result)
-- 
2.30.2

