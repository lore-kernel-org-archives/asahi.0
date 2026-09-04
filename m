Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594D43B5305
	for <asahi@lists.linux.dev>; Fri,  4 Sep 2026 19:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549782; cv=none; b=FJceJcVvZdL32rmUoXiuS3wvpDPwM4SRfFmDBiCgH/iOJy481qhFqFftGc8EdHmy2KNZnsjocHBMN+gDQSzsRc6+bVZGJAIuYcrsrSNP5UYjdmzlTWEAXmamiKBP9IupMQJEaOk3D+4vR84jmLFV7pyG32/bspTwvt3LTlsxEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549782; c=relaxed/simple;
	bh=zvMkw35f45O44XzDQ69MlImFxUFXeB1NL+qnGljK0T4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R2WqFt7J9aTVj/d0ZObXYMNxxYdDh8LqSrVnV8CUP1j8nqmIBiB070JT0X5lkDIsuhyz5vTz3gjjxzhYRFFmRZofexbw4tsPKCK8zEZIANEuX+DHRyDLBQodOoSa5J4NwsMVYcVqiH645K3ADfOymoo8K3YtSC+1XyXRQ4XA/Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=nLBhDUrw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BE5NiMFZ; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="nLBhDUrw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BE5NiMFZ"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3A3B87A00BF;
	Fri,  4 Sep 2026 15:22:59 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 04 Sep 2026 15:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788549779;
	 x=1788636179; bh=rEQEu4YmNQn2Toikh7OW6SqeZVl3jyGQWP135Hh2Adg=; b=
	nLBhDUrwxP4FV89RdeeR8S6++2qTZ3jhliBRq4cQghaTPlY+9DmeYVpN1JflQubH
	hNZKTcc134IKSsEPoXiO0jCZMy6Iqi8OT/tcPijVKctvGrGxlIDYvgkE4sSPJYfQ
	ctPQAoqK4G4TJJKPkRTcq4azs5s5m+6m1ew3Sob/ok9QPuXGshvfuEnVBr9KYiwo
	BQPRRIffxf5yeR1KMVItOrlk/2+6OwHychtAIW7302iJwGzRNwShsUERWLNmlDbU
	8hT896yJRpmfktR/ieNAg6AaoY/CK0Yq2CDjBPjg2USCaakiBMqPPsbG0NT99kSY
	rjQru1MxvhNj9LfV7z6Rhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788549779; x=
	1788636179; bh=rEQEu4YmNQn2Toikh7OW6SqeZVl3jyGQWP135Hh2Adg=; b=B
	E5NiMFZNHbtYejTCXVcNPwNYMcJbfnpfW6AiOwmD4A2xc4UPWBLPaPlj8NGTh4Yx
	v3iRfhEH8cljfQfXW4xKGh0RwmCIhOBOaiIH1kp8rYKar6e++B+z8Uox9l+juRqp
	SFR5FLZPQNjoSRQMo4AvLgSn9qehplRdjDj1LthovG4HIpTp3WqM7cR9dHuZnjiB
	NMHvJGpe8UIAxEX6sTMs8d96W592HQH/UBsxM8Q7Qj8+ilB1egmm0ishsgPEt6jY
	X6GS8rhtuK7pMGzGhKL5FadmPhsAEyzCceJbzO0XgGB8/ZI4Ffn4/MHksYxOsk0K
	5WtN89+w8Wat1CNgIL0hw==
X-ME-Sender: <xms:khqbamy_roEfoyZYX3b1rJyuEYgEaVfZFvBTpCyL3vgWFja3v4xTvA>
    <xme:khqbanM-f2SEnSeGBoAIfpuBVaE_zZ9OuDnpodBMfk4DdWFeiXsZb1-jgYCRgpvzt
    VfGF8DVRpVMYyHk_09ISExGuG_2BDBZRKTyQ4rRfaKRT7NaMYqKBTbe>
X-ME-Received: <xmr:khqbaskYzenLDuOWLX0kpI2dyjQobs-ygJpyRPDSy7G-jU8YodmWElF3CYQB0QPwMhKO5-ZqYb0RbdzQoaUrG9sGljNiGHWsTjhURw>
X-ME-Proxy-Cause: dmFkZTFhLblgTp/RyFQl23C14rT0SEBDcNw88qFkG1Sjc//VwetKpmOdtpxYzmQ4HKpCRi
    WBWnCVMU2EGydlXKZXpN4GNFt4Po4D+3kDHVhKtDhcrmsA6vMw/aZ4CLxA5j0ad2EKcEfs
    SgNSkNyyQS622tAHjfnflrHQwlqXX8UQ539CSLwQKOb+S8QrnE+JnVdQQIAtSW9EHnZH+J
    aNzX4d/wSKpvcjAN04RWhdS+sJxOsdXy4Qem2t0VBqF/KObmyr/C5/zcL3D0YFqBmBPB9j
    zxTYbA2s4UrrRjKj0xA8M8I7z3kvPT/fbYJaDWqg0cwhkzJJpeLlqeJigRtHef77+eQAGq
    V6BbQd2Y61km9k61BEZNXQiyrTXdu0CYEnLF0hX5OLbLLDA71F3ObKXSNbQbnut/SQWPnZ
    xDOJY50DxRrE/tX+ttnDfv3mH/WUK0tT/7oNtK7eaAb9T0Am+O3TzKFFxFZRz1jkqY1v3M
    qiabcP0H6AxK7dboFg+B+xQbRInh6hbbhuNZ/MhU7c5odbxuTcIYtDo0JDhElsjop+RlkZ
    57lWXJ6bVBh1kdatrjNIexsV0mglxAack1VP1Q+0Xsldfh3ftZwks8ToWkLro8vIZyBgmQ
    RQhn8/BFKzR8krB1gUgx/HN9GjORG8+xtBpoqbQJldlemgCiSehqCjyOeS1A
X-ME-Proxy: <xmx:khqbasTZhQk24k_I8hL5y4c2iyRMbGVohsOo8vc48KbIlqAFCDZ2mQ>
    <xmx:khqbarXMWtH6n6IUuStTOOhYPbByX7GPVsmW19tjqTJe7GWn_hCClA>
    <xmx:khqbagKuO9yp9xWnNtj_pD8af9ycak3-plm-adRZy8STj1ndefcsNQ>
    <xmx:khqbar0bPf1igDp-FcPx2cvP8DS0k0m9BuKvanwQNccpkUHaQjSw5A>
    <xmx:kxqbaqZoDmVQkgHUcJweDLDRlBfGz2qHVnV91LcIjv0Al_h35dm2M8vN>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 15:22:58 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 04 Sep 2026 21:22:39 +0200
Subject: [PATCH 1/4] nvme: apple: Don't set a DMA direction for commands
 without a data transfer
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-apple-nvme-fwabi-v1-1-f7ede661c469@jannau.net>
References: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net>
In-Reply-To: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net>
To: u-boot@lists.u-boot-project.org
Cc: asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>, 
 Sven Peter <sven@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>, 
 Francois Berder <fberder@outlook.fr>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=zvMkw35f45O44XzDQ69MlImFxUFXeB1NL+qnGljK0T4=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzZUr1L3p6dk7v/QNKUVS8vsyYzhv+58Wfir2xf4SD1M
 9GnnZ5GdJSyMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZjIYT9Ghnn/uzzE7hcXsltE
 9QbPL192/4DzB83+bW4fix3TG9dIBDIybDS9M7f27wXG/TMnbZ2zZPfVx11chX08n1b15oqxHj0
 SyQ0A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Setting the DMA direction for commands that don't do any transfer likely
triggered the PRP NULL check for which we needed a chicken bit. That bit
has disappeared starting with macOS 15 so let's just do this correctly
instead.

Based on Linux kernel commit 94dd5804938d ("nvme-apple: Don't set a DMA
direction for commands without a data transfer").

Link: https://lore.kernel.org/asahi/20260806-b4-nvme-fwabi-v1-2-bde19ce8db04@kernel.org/
Fixes: 50333c94f2de ("nvme: apple: Add driver for Apple NVMe storage controller")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/nvme/nvme_apple.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/nvme_apple.c b/drivers/nvme/nvme_apple.c
index e674eda8344..dc94988e2ff 100644
--- a/drivers/nvme/nvme_apple.c
+++ b/drivers/nvme/nvme_apple.c
@@ -122,7 +122,10 @@ static void apple_nvme_submit_cmd(struct nvme_queue *nvmeq,
 	tcb = ((void *)priv->tcbs[nvmeq->qid]) + tail * ANS_NVMMU_TCB_PITCH;
 	memset(tcb, 0, sizeof(*tcb));
 	tcb->opcode = cmd->common.opcode;
-	tcb->flags = ANS_NVMMU_TCB_WRITE | ANS_NVMMU_TCB_READ;
+	if (cmd->common.prp1)
+		tcb->flags = ANS_NVMMU_TCB_WRITE | ANS_NVMMU_TCB_READ;
+	else
+		tcb->flags = 0;
 	tcb->slot = tail;
 	tcb->prpl_len = cmd->rw.length;
 	tcb->prp1 = cmd->common.prp1;

-- 
2.55.0

