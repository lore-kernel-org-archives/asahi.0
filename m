Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FA247AF75;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030127; cv=none; b=lUTnuVRcORz46iwwo7lT+/RJAvZsWgUrlJh+jtpoLQFo8gldcJ2AHcRcD9xiCPViyTOBtL3VdeWf00g8wIQrjBT/s39J+SaONbQcVfv5GSzUDwcyDPS+Wzvxa6Aqia1EQ8a0jmvuILNGhUTgKJnx1FeRiIEnRPZ0srO7y1o6ACY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030127; c=relaxed/simple;
	bh=dAxz+dTFl0FTz8kxXwslhiRnWUyMoDrUdWvhssxEJSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PTrHFesPEWcYGhE7zSWsfPfI+KbvAbVHSePlwK6lUEvGOK81hzeasKS7e1AUsEwILic9xOG80Wk9FY0HHN0buipaNJbVWFXxZs2YswjPzOeOk4KPnyEpZnswWMYS5JBbrB/OM1SAe46mZ5MJhEQPYxPL6st5WDoyRb7VBb+Urjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUO6FoT0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUO6FoT0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 932C2C2BD01;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786030127;
	bh=dAxz+dTFl0FTz8kxXwslhiRnWUyMoDrUdWvhssxEJSw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KUO6FoT0yqyl2dQPlXccPllRhl4ypwRdrI0bAMN0cMNzqZyg8Rw+69dJWMx4hD4ry
	 GeweXlf0T1PfqIvynTaX+z7AWV1q+NMrgrhm0Ga03DXdQhalP8+yEAe6hxEb1LcHMC
	 zl0RBX2MyAjGdEi9MqObjaWtbsvhuNVyfLlb9OzlZunCzHXmUlDwbUyBTFWRAQIvZ4
	 dSIpsykUH0FQeFiOwryvDdKhVCErp7mIH9ddCLys6K60A5nvaauBGcyNelRKsXJIiW
	 IT1lKRA3o6ZJYzgmIbXCRGakroxnggLqgz6jOwSuny2l8C0k56wwmXTYWdrppjQkmG
	 EbGYaZIM4r+Iw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E1E3C56205;
	Thu,  6 Aug 2026 15:28:47 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 06 Aug 2026 17:27:37 +0200
Subject: [PATCH 5/6] nvme-apple: Require page aligned buffers on the admin
 queue
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-b4-nvme-fwabi-v1-5-bde19ce8db04@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=dAxz+dTFl0FTz8kxXwslhiRnWUyMoDrUdWvhssxEJSw=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1bJCu3jwav3XP1gL5oT/P+sw+uG28fLbRzP2HXuuqm9Y
 KqmsFZsRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiXNqMDF/OO2w1/yDVs+r0
 lENcfPv4Ll9/LSBQE+HVtm/ril16m/4x/I+tfMy6KcTqqJiu0HneHhtxU5H1wuZSM5/OCfn/7+P
 TDk4A
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Now that we have a quick to align buffers on the admin queue to the NVMe
controller page size use it for Apple controllers. This fixes pre-M1
controllers, which always rejected unaligned requests, and also makes
this driver work for M4 SoCs and for M1/M2/M3 SoCs that have been
updated to the firmware shipped with macOS 15.

Fixes: 5bd2927aceba ("nvme-apple: Add initial Apple SoC NVMe driver")
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/nvme/host/apple.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index 1ea732c3df1c..78f89b5679e5 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -1583,7 +1583,8 @@ static struct apple_nvme *apple_nvme_alloc(struct platform_device *pdev)
 	}
 
 	ret = nvme_init_ctrl(&anv->ctrl, anv->dev, &nvme_ctrl_ops,
-			     NVME_QUIRK_SKIP_CID_GEN | NVME_QUIRK_IDENTIFY_CNS);
+			     NVME_QUIRK_SKIP_CID_GEN | NVME_QUIRK_IDENTIFY_CNS |
+			     NVME_QUIRK_ADMIN_PAGE_ALIGN);
 	if (ret) {
 		dev_err_probe(dev, ret, "Failed to initialize nvme_ctrl");
 		goto put_dev;

-- 
2.55.0


