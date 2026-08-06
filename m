Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47C043FD2B;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030127; cv=none; b=EzDSOYe7RUzMlj7EbzXpHfeYR/d4A3XiaPiiWLinJbR1AjNMs92LGsOi8O0m8qoM02JLQx2yjBmsp4lXAXbarAYUjAip0Vh9DqRbldOADg0ccGwK8i0fMvv7ZpvTg/aKeEzM/7juCW5tg5O9m7jH5fq/NDqjoUGPA+dFNFnas8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030127; c=relaxed/simple;
	bh=6Q/s+CU1jpcGZ6EF4+2fc7K8wZes4JUuaLdDIeWZEvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VmDWg4UANg5/s0dBQViLaiXsX6jXUGlcKJIHxMS812U/1zd6lxFlfym4JYeRoEHmvzjYYAlEs09y/NiUFgjkL0T+M+Z/Z52Z3hXJbjDmaH7mDF02NT80PmqpHt9mR2j4RBzaIYm1RPLjkuQgTsANAIMcx1NC5gbZoiTsGkurW/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNu2pfiN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNu2pfiN"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 682B3C2BCF5;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786030127;
	bh=6Q/s+CU1jpcGZ6EF4+2fc7K8wZes4JUuaLdDIeWZEvE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bNu2pfiNPO4rW4yxyAemjAMMYATMfOi6mdBgliZjLTQcrhoRNrlYFegVi0mkLAfJ3
	 MHtwE4yAHq7TF3uqkuoW2CPxToTFe2VWJ3odxjrAlnthbkuDVgHsH8DkVMhU/DJRF+
	 9rWwsPdMwxBICp1+8z++18hTILaxvdZ6vJdiCOcjPAi9HdBOUq9PK0cwgc2EnJSo5A
	 h/Hu1+8zuShRDVvIWwFnB+I/gibFlx1ioAUDv9Hn+tTlDeC5TQqW/PthHtP12dgUwc
	 mc3pj1bW6t9uI/r7x/g3FuqarXinXS8a/fF1YpfJ9jzbggCLK40kApiezD1Z8+cUE2
	 +QI39Sm/avgeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D187C56207;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 06 Aug 2026 17:27:34 +0200
Subject: [PATCH 2/6] nvme-apple: Don't set a DMA direction for commands
 without a data transfer
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-b4-nvme-fwabi-v1-2-bde19ce8db04@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1006; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=6Q/s+CU1jpcGZ6EF4+2fc7K8wZes4JUuaLdDIeWZEvE=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1bJCo1Ci7YTJ/Rde1f9ieC46p6heE9usf/Ngm1HjzDnu
 nlx87R1lLIwiHExyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACbia8bwm0VC95rI952nKy5O
 k+yrOnvNPvxZiqP1g4rFlnrf6tO1axj+KUirywmJL1G+vHKK1P2DUx+5l/DL5W+7ub7a6YPfq7y
 5/AA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Setting the DMA direction for commands that don't do any transfer likely
triggered the PRP NULL check for which we needed a chicken bit. That bit
has disappeared starting with macOS 15 so let's just do this correctly
instead.

Fixes: 5bd2927aceba ("nvme-apple: Add initial Apple SoC NVMe driver")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/nvme/host/apple.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index 321502847a2c..f134b5ffb774 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -324,7 +324,9 @@ static void apple_nvme_submit_cmd_t8103(struct apple_nvme_queue *q,
 	tcb->length = cmd->rw.length;
 	tcb->command_id = tag;
 
-	if (nvme_is_write(cmd))
+	if (!cmd->common.dptr.prp1)
+		tcb->dma_flags = 0;
+	else if (nvme_is_write(cmd))
 		tcb->dma_flags = APPLE_ANS_TCB_DMA_TO_DEVICE;
 	else
 		tcb->dma_flags = APPLE_ANS_TCB_DMA_FROM_DEVICE;

-- 
2.55.0


