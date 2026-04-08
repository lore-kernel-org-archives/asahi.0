Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3668323EA92
	for <asahi@lists.linux.dev>; Wed,  8 Apr 2026 14:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657929; cv=none; b=KcP7UsJrWmfvkRGtEXIIeRmlDGDqybv/eQ0UL5ChM+tygpbz4K0aN7QrfyAmobCVBfpy0n67OA0IsbeT9mA8CJtTaNfu64/pgB7vFN/BrM217dUB8GJI04My9XFdMbMkTup0XmiJgyY4ZUs01xf1NU63zfVu3z1DNguWn2Ye2iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657929; c=relaxed/simple;
	bh=jOCV1s/IbPPoj1IwL4TUX1Sx8qvm/V48B+YWPfEy04E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i61C8kCLNT4mIltyFQFvnQZpOgcV6vJpVy4yakqB3HsEwIaNMc3hvNv/UeixxMVhwuauuKo5lsVX4NDkmSlZ2sKw+VCJjNWelqQC60WaSXreEsQvKIPwUt/Mv04rd2hOue1BLOw6V9S7MzA1XNv2QTefCjukBAhGDCAP7UzqQQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=KkOo6rDz; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="KkOo6rDz"
Received: from debian.intra.ispras.ru (unknown [10.10.165.28])
	by mail.ispras.ru (Postfix) with ESMTPSA id 6C47745F7988;
	Wed,  8 Apr 2026 14:18:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru 6C47745F7988
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1775657925;
	bh=ac+ld7PBnDtntUMS9S8A9+sf8tF7fABnrLxBZdtfty8=;
	h=From:To:Cc:Subject:Date:From;
	b=KkOo6rDzgOhzmt/Dv2vYogRIIsqUNDCEo1aBqC06+JlxEM7oF8ShhurODjlhSnhiO
	 8Gc5YQxtPgh9priKaqEXx32AGIIOFoPduVUoOh8SjzvOQ9W+6tKlcNU4dxlOoaiB4I
	 Zx+p18z7AqSXSL1VrJzTPLlanaWSPAsQ+9NEoGH8=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@suse.de>,
	Ming Lei <ming.lei@redhat.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	"Heyne, Maximilian" <mheyne@amazon.de>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH v2] nvme-apple: drop invalid put of admin queue reference count
Date: Wed,  8 Apr 2026 17:18:14 +0300
Message-ID: <20260408141815.375695-1-pchelkin@ispras.ru>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 03b3bcd319b3 ("nvme: fix admin request_queue lifetime") moved the
admin queue reference ->put call into nvme_free_ctrl() - a controller
device release callback performed for every nvme driver doing
nvme_init_ctrl().

nvme-apple sets refcount of the admin queue to 1 at allocation during the
probe function and then puts it twice now:

nvme_free_ctrl()
  blk_put_queue(ctrl->admin_q) // #1
  ->free_ctrl()
    apple_nvme_free_ctrl()
      blk_put_queue(anv->ctrl.admin_q) // #2

Note that there is a commit 941f7298c70c ("nvme-apple: remove an extra
queue reference") which intended to drop taking an extra admin queue
reference.  Looks like at that moment it accidentally fixed a refcount
leak, which existed since the driver's introduction.  There were two ->get
calls at driver's probe function and a single ->put inside
apple_nvme_free_ctrl().

However now after commit 03b3bcd319b3 ("nvme: fix admin request_queue
lifetime") the refcount is imbalanced again.  Fix it by removing extra
->put call from apple_nvme_free_ctrl().  anv->dev and ctrl->dev point to
the same device, so use ctrl->dev directly for simplification.  Compile
tested only.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 03b3bcd319b3 ("nvme: fix admin request_queue lifetime")
Cc: stable@vger.kernel.org
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---

v2: use ctrl->dev directly for simplification (Jens Axboe)
link to v1: https://lore.kernel.org/linux-nvme/20260403202701.991276-1-pchelkin@ispras.ru/

 drivers/nvme/host/apple.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index ed61b97fde59..423c9c628e7b 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1267,11 +1267,7 @@ static int apple_nvme_get_address(struct nvme_ctrl *ctrl, char *buf, int size)
 
 static void apple_nvme_free_ctrl(struct nvme_ctrl *ctrl)
 {
-	struct apple_nvme *anv = ctrl_to_apple_nvme(ctrl);
-
-	if (anv->ctrl.admin_q)
-		blk_put_queue(anv->ctrl.admin_q);
-	put_device(anv->dev);
+	put_device(ctrl->dev);
 }
 
 static const struct nvme_ctrl_ops nvme_ctrl_ops = {
-- 
2.53.0

