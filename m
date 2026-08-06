Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32764534BB;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030127; cv=none; b=Xh1xksEvGP7EWXYApxV3R2aLwT6M7cxFH5vw0HsJF37T4ZUAJzgWkTUXWD88n0mcnuBKYDN7qxBDrr+4d1GxcxiUsFgdtLdcZb61rmTjj+fZVh7QHxGQPz6ujUVdLL6lTq97iAJJtDqNTv3A5SlKDCvPqhvTvYrWSMmqWIsOlJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030127; c=relaxed/simple;
	bh=rnfZSyqO5SxgLMFGkmg/ZiNzhEcvBz3iBs6yNUTN09k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WHVF1Ue7HVnCgroZypBLIb6/hEr2AFEDCRri1DjrFuytX345x/k6Pu4Sz61pZ8KcP41St0hjqYNiYMp0uHJnhjOxe+8n22AD4R7eyPhhQ2Y9X1b+O17vjYFmIoQHaRwhQp4/9yWQUasEU2ha/fXBuAXROKxf+eKbnNRzp6mfWUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXLO/y2i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXLO/y2i"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84F7CC4AF0B;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786030127;
	bh=rnfZSyqO5SxgLMFGkmg/ZiNzhEcvBz3iBs6yNUTN09k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cXLO/y2iBrkRJpz1HlXGXMF5tqD4vP6yXuiJ5N/JA9d3ES3IW3qZBa4G4qlMFW0IN
	 ANUJkZ7UyC4KE/SvOjgAnzsVTfywDMkOI1suFMLiML7oSFrApabMBQSOY4+H5cBen3
	 SMk2OgF/eoZO0kRL4aevw/IZT+lg3yxU50P4xN9YZXOONHft97Zfz3j/8F8b9PJpPs
	 U9NdZt76eGqNU72tvTaOpzHs8MhJOHfphKj9tFXjTxeRy7L5bRobDl6/IQhdBclc1x
	 7Jr7yLihREEHH+zS90U5MWzjLeLZ2btqvHnbMgLuN439+QemAVNCfepEopBhWXKkTE
	 GKn0kp0X/h5IQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDD8C5AC7C;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 06 Aug 2026 17:27:36 +0200
Subject: [PATCH 4/6] nvme: Add a quirk for page aligned admin queue buffers
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-b4-nvme-fwabi-v1-4-bde19ce8db04@kernel.org>
References: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>
In-Reply-To: <20260806-b4-nvme-fwabi-v1-0-bde19ce8db04@kernel.org>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2136; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=rnfZSyqO5SxgLMFGkmg/ZiNzhEcvBz3iBs6yNUTN09k=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1bJCq1E/91fzvDpvbrK9eVqntrGnKjps5NrFtdxfDy5a
 I3sj0t8HaUsDGJcDLJiiizb99ubPnn4RnDppkvvYeawMoEMYeDiFICJfHJm+Gf3On25DI/Ixa5f
 X4tCNr8yD+f50fPxgtROpovBzW1Sd0wZ/ie/4RQPl78t8tNZ/4W6Ye6eiPmrrz6cN38H27VrDle
 WrucCAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Apple controllers seem to require any queue buffers on the admin queue
to be aligned to the NVMe controller page size. Weirdly, this constraint
does not apply to the i/o queue where any alignment is fine. This has
always been required on pre-M1 controllers and is required starting with
macOS 15 firmware or post-M4 controllers again. On M1/M2/M3 we only got
away with this because there was a chicken bit to disable this
requirement. Let's add a quirk that enforces this alignment.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/nvme/host/core.c | 5 ++++-
 drivers/nvme/host/nvme.h | 7 +++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 453c1f0b2dd0..b76f4e4d8850 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -2071,7 +2071,10 @@ static void nvme_set_ctrl_limits(struct nvme_ctrl *ctrl,
 	lim->max_integrity_segments = ctrl->max_integrity_segments;
 	lim->virt_boundary_mask = ctrl->ops->get_virt_boundary(ctrl, is_admin);
 	lim->max_segment_size = UINT_MAX;
-	lim->dma_alignment = 3;
+	if (is_admin && (ctrl->quirks & NVME_QUIRK_ADMIN_PAGE_ALIGN))
+		lim->dma_alignment = NVME_CTRL_PAGE_SIZE - 1;
+	else
+		lim->dma_alignment = 3;
 }
 
 static bool nvme_update_disk_info(struct nvme_ns *ns, struct nvme_id_ns *id,
diff --git a/drivers/nvme/host/nvme.h b/drivers/nvme/host/nvme.h
index 824651cc898d..957ded0c6f53 100644
--- a/drivers/nvme/host/nvme.h
+++ b/drivers/nvme/host/nvme.h
@@ -178,6 +178,11 @@ enum nvme_quirks {
 	 * Align dma pool segment size to 512 bytes
 	 */
 	NVME_QUIRK_DMAPOOL_ALIGN_512		= (1 << 22),
+
+	/*
+	 * Admin queue DMA buffers must be page aligned
+	 */
+	NVME_QUIRK_ADMIN_PAGE_ALIGN		= (1 << 23),
 };
 
 static inline char *nvme_quirk_name(enum nvme_quirks q)
@@ -229,6 +234,8 @@ static inline char *nvme_quirk_name(enum nvme_quirks q)
 		return "broken_msi";
 	case NVME_QUIRK_DMAPOOL_ALIGN_512:
 		return "dmapool_align_512";
+	case NVME_QUIRK_ADMIN_PAGE_ALIGN:
+		return "admin_page_align";
 	}
 
 	return "unknown";

-- 
2.55.0


