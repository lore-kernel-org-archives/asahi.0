Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B502EAB72
	for <asahi@lists.linux.dev>; Fri,  3 Apr 2026 20:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775248147; cv=none; b=uf90hXSAWFAxUDAstB2t3dzdqezMMldfbBcWF20sAT/bZH6qLamDrkyHftATDcQMJx3W/RaOCtZGcc477rlpNyz6eOuEcURHpjQ6S6EjxJ0ph5mjpDL1Mo6a2nq9m+9lJ03Z8+xwA43xiMkXrzJ0ZvvZxF+a3rrcWxALKL3xZm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775248147; c=relaxed/simple;
	bh=3unORSCN4s2sh8aP3asXtDv5qrrMJJ2xu+YUzP+1EUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fi0tx98AG6lUxhItGtUyQHr8FoYL5Adc4wRIlaglinNXHX+pMD3X5lpdAzosoT8xC6srxFdC512iFHQm3LxPlmwvtyADN2gDTN+ArlHCe8ZCZJevmNwfRQrl3oN+CXzhJmOhcG6JXbgR0hmm7ykURlzv0ETNvxS/PRW84WctdVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=kOolXopk; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="kOolXopk"
Received: from debian.lan (unknown [79.139.252.175])
	by mail.ispras.ru (Postfix) with ESMTPSA id CB3C045A1D06;
	Fri,  3 Apr 2026 20:29:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru CB3C045A1D06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1775248142;
	bh=rkMgPId7pYnnvNbAuwYM5wExpHWHyYhMeO7FUfW2+ho=;
	h=From:To:Cc:Subject:Date:From;
	b=kOolXopkJtnCfd+9m8RNpBDmXydllXw3oykDCDNbEpSHP0DisAbGRJiGpW3FTRp6p
	 0dkuNbDhU9KFyGKb4JdvMVGzHOOgLGFHuABWqABZOiVj6x0yAlJKaigNotN5Es24jh
	 j9xqoW7gspk2ovsJBViM+PvF5ADZlvItRSQhTTgs=
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Keith Busch <kbusch@kernel.org>,
	Christoph Hellwig <hch@lst.de>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Jens Axboe <axboe@kernel.dk>,
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
Subject: [PATCH] nvme-apple: drop invalid put of admin queue reference count
Date: Fri,  3 Apr 2026 23:27:00 +0300
Message-ID: <20260403202701.991276-1-pchelkin@ispras.ru>
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
queue reference") which intended to drop having an extra admin queue
reference.  Looks like at that moment it accidentally fixed a refcount
leak, which existed since the driver's introduction.  There were an
initial ->set and an extra ->get call at driver's probe function, and only
a single ->put inside apple_nvme_free_ctrl().

However now after commit 03b3bcd319b3 ("nvme: fix admin request_queue
lifetime") the refcount is imbalanced again.  Fix it by removing extra
->put call from apple_nvme_free_ctrl().  Compile tested only.

Found by Linux Verification Center (linuxtesting.org).

Fixes: 03b3bcd319b3 ("nvme: fix admin request_queue lifetime")
Cc: stable@vger.kernel.org # depends on 941f7298c70c
Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
---

Also nvme-apple seems not to have a blk_mq_destroy_queue() call for
admin queue since introduction - if it's needed, the proper place would
be in apple_nvme_remove() just before calling nvme_uninit_ctrl(), I guess?

 drivers/nvme/host/apple.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index ed61b97fde59..1d82f0541b0b 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1269,8 +1269,6 @@ static void apple_nvme_free_ctrl(struct nvme_ctrl *ctrl)
 {
 	struct apple_nvme *anv = ctrl_to_apple_nvme(ctrl);
 
-	if (anv->ctrl.admin_q)
-		blk_put_queue(anv->ctrl.admin_q);
 	put_device(anv->dev);
 }
 
-- 
2.53.0

