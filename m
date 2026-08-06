Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B461744C65C;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030127; cv=none; b=kJ57MI6sMIZFX4WIG5XwziB8/Mtuaqr/pVw1F08m0qhj20q7zeMIkoFf7RUP7LbSjAY2E5QtmGGzPEBARMyH1O5QcRNSMMIgmOaMyjb463TAzJGigbvmBL0DPw92GF+QQxZ64NsX7RugtRFbGV+UANQaLUVZ54OaYNJxKJ3cACY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030127; c=relaxed/simple;
	bh=ZLJDszrW9HD7IRTiZASdqbu+USSjGBXGFe43o7bNZrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oT525PvNpH4nZrOHzGuDLXq6xeMSopwN9UbqRlSWz0PDCkd/1auYUMSB55wGa+1U+X3HQW6L7xJK6CB4dMxbkwcm5KstfuVB4PevAfofeGNGlpVLK2k/Tp8WMjIz0wDRFxMUdWydi8ZPAviLQNh9zbQ2eGzqAMGyAk9A/HFbGSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9KSw6SS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9KSw6SS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78CEBC2BCFB;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786030127;
	bh=ZLJDszrW9HD7IRTiZASdqbu+USSjGBXGFe43o7bNZrE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Y9KSw6SS00/FkdWaCDU9ttBeuCnjmYqQurygFg7wS8q2EP1VwVUKScUZbrJ0raRvP
	 9xwdJxOGyKJbQT4pq57PAKXV/DGr2CU+zsoU2827PDka30p2Afnw0+iMnOz5dlNwwQ
	 r35hP3i1Br7B+iRY2CjlSmaXXsUFjjtCWDI7TUvD/XJEFtovT2d5QMp+xq79Uuj0S5
	 BCoTCdy1S8K4hNi2AsiaV9H9KA7bXdRyYdwLzijHh+dQFHvOhNKgs+H16bDBkdeyUw
	 ws/MzQY2VcMYlHVjdESr9zlgXybt9sH4VOtgyfcyizJ1k7MuSFnWBY7Ohmhv6CweCV
	 P3jLA9FXuLPwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F343C5AC80;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 06 Aug 2026 17:27:35 +0200
Subject: [PATCH 3/6] nvme-apple: Never set the opcode in the NVMMU TCB
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-b4-nvme-fwabi-v1-3-bde19ce8db04@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=886; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=ZLJDszrW9HD7IRTiZASdqbu+USSjGBXGFe43o7bNZrE=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1bJCs1X7mvXfs/qzv/Z+SRtRfHCDXzeYa3rU07/nnaAW
 4A5xXVJRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiClwM/xSr2SOetRTk7dYq
 b5eMDpu0sOv1iupH95N6u4XWXgkMSWb4nxZbsJudseTDGu8vb72W7N96Yv9x994rH97JTROx4J+
 /jh0A
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

macOS always sets this to zero and the firmware starting with macOS 15
has started to complain about what we're doing here.

Fixes: 5bd2927aceba ("nvme-apple: Add initial Apple SoC NVMe driver")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/nvme/host/apple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index f134b5ffb774..1ea732c3df1c 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -318,7 +318,7 @@ static void apple_nvme_submit_cmd_t8103(struct apple_nvme_queue *q,
 	u32 tag = nvme_tag_from_cid(cmd->common.command_id);
 	struct apple_nvmmu_tcb *tcb = &q->tcbs[tag];
 
-	tcb->opcode = cmd->common.opcode;
+	tcb->opcode = 0;
 	tcb->prp1 = cmd->common.dptr.prp1;
 	tcb->prp2 = cmd->common.dptr.prp2;
 	tcb->length = cmd->rw.length;

-- 
2.55.0


