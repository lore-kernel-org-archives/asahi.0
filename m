Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96858F77
	for <asahi@lists.linux.dev>; Wed, 12 Oct 2022 11:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GNuK1I9LmI1x69V0Ov3aH6YP9HznMUvQUCXmFoWVHYI=; b=EvkGFnTcaHrp9VGyg92t5ydp5b
	upZ6ePsj5SKXCvSzwEbSzJ/dsa+VS+KttiA1FwPc1NKc+YrDMBYXonSOUEyicakTwiEO5KKArgOej
	Xkq2qJBIx8Cf8TMMLoDcInKTUNx90zRvkfIWA1dqF7Xf6knD8H19kCK7GbVS0ofh2B5X4p9ggrGxS
	eRmfR0Fl2Jxlmeq1TNtpqiJnS40zvx+WLQpTaldpYDr5nofYhWi0YJIgi1i7ONoDAdf054ln4EYgZ
	r/q9Zlmt6mCMVJXGAOBz40JkZgknz948UHDsr404sGV+RFDRZ/y2UO8ZNZuskYFjSM4YVQTUsMO6y
	X1NQzZJQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43214 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oiaBb-0007J6-GP; Wed, 12 Oct 2022 12:46:07 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oiaBa-00Dz7S-SK; Wed, 12 Oct 2022 12:46:06 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Sven Peter <sven@svenpeter.dev>
Cc: Hector Martin <marcan@marcan.st>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@fb.com>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org
Subject: [PATCH] nvme-apple: fix DMA-API warning
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oiaBa-00Dz7S-SK@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 12 Oct 2022 12:46:06 +0100

Fix the following DMA-API warning:

DMA-API: nvme-apple 27bcc0000.nvme: mapping sg segment longer than device claims to support [len=69632] [max=65536]
WARNING: CPU: 3 PID: 1 at kernel/dma/debug.c:1160 debug_dma_map_sg+0x310/0x3a0
Modules linked in: tps6598x roles typec rtc_macsmc gpio_macsmc nvme_apple apple_mailbox apple_sart pcie_apple macsmc_rtkit macsmc pinctrl_apple_gpio i2c_apple
CPU: 3 PID: 1 Comm: init Not tainted 6.0.0+ #1081
Hardware name: Apple Mac mini (M1, 2020) (DT)
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : debug_dma_map_sg+0x310/0x3a0
lr : debug_dma_map_sg+0x310/0x3a0
...
Call trace:
 debug_dma_map_sg+0x310/0x3a0
 __dma_map_sg_attrs+0x98/0xf4
 dma_map_sg_attrs+0xc/0x1c
 apple_nvme_queue_rq+0x218/0x67c [nvme_apple]
 blk_mq_dispatch_rq_list+0x198/0x81c
 blk_mq_do_dispatch_sched+0x2b0/0x340
 __blk_mq_sched_dispatch_requests+0x104/0x154
 blk_mq_sched_dispatch_requests+0x38/0x70
 __blk_mq_run_hw_queue+0x80/0x130
 __blk_mq_delay_run_hw_queue+0x84/0x90
 blk_mq_run_hw_queue+0x134/0x170
 blk_mq_sched_insert_requests+0xec/0x300
 blk_mq_flush_plug_list+0x104/0x430
 __blk_flush_plug+0xe8/0x130
 blk_finish_plug+0x30/0x1f0
 read_pages+0x1ec/0x334
 page_cache_ra_unbounded+0x158/0x1bc
 page_cache_ra_order+0x80/0x2c0
 filemap_fault+0x4bc/0x970
 __do_fault+0x38/0x144
 __handle_mm_fault+0x7c4/0xc60
 handle_mm_fault+0x120/0x2a0
 do_page_fault+0x130/0x47c
 do_translation_fault+0xa0/0xb0
 do_mem_abort+0x40/0x90
 el0_da+0x2c/0x80
 el0t_64_sync_handler+0x60/0xb4
 el0t_64_sync+0x168/0x16c
---[ end trace 0000000000000000 ]---

Suggested-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/nvme/host/apple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index 5fc5ea196b40..ff8b083dc5c6 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1039,6 +1039,8 @@ static void apple_nvme_reset_work(struct work_struct *work)
 					 dma_max_mapping_size(anv->dev) >> 9);
 	anv->ctrl.max_segments = NVME_MAX_SEGS;
 
+	dma_set_max_seg_size(anv->dev, 0xffffffff);
+
 	/*
 	 * Enable NVMMU and linear submission queues.
 	 * While we could keep those disabled and pretend this is slightly
-- 
2.30.2

