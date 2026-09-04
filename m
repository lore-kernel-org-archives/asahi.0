Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE55D3B9D9A
	for <asahi@lists.linux.dev>; Fri,  4 Sep 2026 19:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549785; cv=none; b=sdGvJY4aLHyRwLwVSpCYjzS9X3KqGTE/v/LVr+/mhy6gcrlYcA4kxPpTrJgcG76I6ACOHneZ3LQsWX0Wl3z6Bh5cJKsu779vC66kT+5f4Co0JDUlEYRLmHdfNNMcWsX/dZxLn+wXQYVJ5pQhYdtTXwqLA/usgrQqt6SREt7MUTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549785; c=relaxed/simple;
	bh=0Mb/9G2e3EzKSZGS8ToiCmejzefFnnR1b8UnmKRZyoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CerwqF4YbE3Mt5MPoHdhOvp2BcpaigIspnVpSINYFK7ihJIj7IYNFRib0xz+HxxBQZbUFAYAXAo2di3b9pl97quwbuQ0tfzrBmr9j39CXwaFtgkPePnNaLIrbzUhZZzpAA1pVIYbaG9U5U9iqBsoqffA5btj4NfCqEUa5lUZ3cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=tZjSDTAV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=jTnBVwyS; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="tZjSDTAV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="jTnBVwyS"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id E000F1D000C4;
	Fri,  4 Sep 2026 15:23:02 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 04 Sep 2026 15:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788549782;
	 x=1788636182; bh=2EnhbLg28olLwFCMGhDnw1SXOG7+j1bsKN7T2RPq320=; b=
	tZjSDTAVNsNCTkk34aUsDYlFG+p8Q7VHI67LSW8aOoJe/K7gbKmC1JbLT69VEPRb
	2a0UdggkgRr0bYpBq5Tk1ii3YJerIQ1q+UP/DZBRXvkLQdDlpkT+tzdnSBRuiCS7
	qCknGEG6LlDQ6kn9++6TiPJI009tlcbX+JDdV+panMd4C1Dv12COnBoKk3SgIz18
	c1DeTDDyFiJGD6NMyxeLzpdwHmIDav1Wb+2r2tyZT33o6/iDczjDuD5xoXEfSlke
	FYTv47N0QVDmpyBI4fUFkfTMuCIeydm0MepL4WJo3IfOrtkIddOSOw/yUouNQOYj
	spvTeSMojCDCSBWYZ8ejRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788549782; x=
	1788636182; bh=2EnhbLg28olLwFCMGhDnw1SXOG7+j1bsKN7T2RPq320=; b=j
	TnBVwySwsHxoHVjrdqUcdUl3QG4AXxVYwmC2iYj+zhYUlMb4QujZkZs0JFgobxHA
	KgCLjwqVGOhNEFYw+4tTUQ7opf5LCQ1/iSzJ0xP763/nQEVb1J3Jjp9Hq+tLd5qH
	TXchn2Jj2yzt2dgQ5mnfzdiadsjMqnWh/83xEJ7gVvHodrBiSypmWCUh5dpjV8oj
	0ITs0FNKTY5monctFM4QQLCsXlHEZlsZX6+vSuLpGTw2Bos+rFwGRXRBn8Sriv3W
	pVZ9AzhVPwkvCvbPZewmwDEnlhO2r4hV9+dW7+71FRz3k0CDgbZrTHtIQDP+qQkD
	swSrIhlgRAPhuPQj4sb/w==
X-ME-Sender: <xms:lhqbarhC83qnYLLox1PTYP37KOOj_PmxrHNWJ_Etuhda9sY38XSkxg>
    <xme:lhqbas9tsQZaIuYRMEUPDVfLmwXw4JMzVacBGmwPeNPhKo88NlQ_eoUZ_kjvUDs_5
    trIxUof9vgJNzinLnFcQTDAgyHAJPSBqueiHZM8n9cz8Io1n2hwglh->
X-ME-Received: <xmr:lhqbavXqh4B4569X5STbkAL8H68133_78X617dnIQ0AT5HCeCaDFrtndgptWjv8aL80MKWyOQjkbVjjd-z7EYX7ZauRFVsojVy1jPQ>
X-ME-Proxy-Cause: dmFkZTFhLblgTp/RyFQl23C14rT0SEBDcNw88qFkG1Sjc//VwetKpmOdtpxYzmQ4HKpCRi
    WBWnCVMU2EGydlXKZXpN4GNFt4Po4D+3kDHVhKtDhcrmsA6vMw/aZ4CLxA5j0ad2EKcEfs
    SgNSkNyyQS622tAHjfnflrHQwlqXX8UQ539CSLwQKOb+S8QrnE+JnVdQQIAtSW9EHnZH+J
    aNzX4d/wSKpvcjAN04RWhdS+sJxOsdXy4Qem2t0VBqF/KObmyr/C5/zcL3D0YFqBmBPB9j
    zxTYbA2s4UrrRjKj0xA8M8I7z3kvPT/fbYJaDWqg0cwhkzJJpeLlqeJigRtHef77+eQAOV
    5S+ydIiEkPt8uv09ncpWQP+UMqT70VUo9MAiLW963vTUXVeYlal37hLGnaq+ts3EHCGi1Y
    LZxQHLjMjaLKem7/s9QCnoG1PrKDmr9nvChIOjaNnJXQ+20z/P3THjsg3VghvHTifK5VT+
    6j6Kr63egewiSKJ0jQAW9H3RVX+HmnwKyK0BPGG/LMhLNWXTXzylKlVijGyslEgOYDnP/e
    YxsO1hUNyQs1/5eZw5AGy3mFbf/ww/SKQsPdaHnvL/2yi5hirIUA2Ii2rbgm/2u7EH+Lz6
    ANLKTd+y+ENjHTbroWP0hNKR+tYSLkc1tB+o8Y/DrU7HlMgcYK7eyqhc8Bqg
X-ME-Proxy: <xmx:lhqbaoDedPgNLwShwXghkP3T5vSWnuhKC-Qs0-FbWQdfSed--VMKBw>
    <xmx:lhqbasG4sLBNFVXh23iTckEzcpXUZ7lgyrOdmVtxrK-RMnOxSuwCJQ>
    <xmx:lhqbah738yjK_oUS0XUyfBR2XHiy2vFojnh57gGiFPO79vTLq-pIog>
    <xmx:lhqbaqlkM-crlNRjYKQLhF85jTdPE6HALX_ghfwvpQvsvh68-z35Iw>
    <xmx:lhqbaseNOeLSDCxdhGEqtVOJE_lg3Vokragss2umAKpTpDRHZTvDBUr0>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 15:23:01 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 04 Sep 2026 21:22:40 +0200
Subject: [PATCH 2/4] nvme: apple: Never set the opcode in the NVMMU TCB
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-apple-nvme-fwabi-v1-2-f7ede661c469@jannau.net>
References: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net>
In-Reply-To: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net>
To: u-boot@lists.u-boot-project.org
Cc: asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>, 
 Sven Peter <sven@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>, 
 Francois Berder <fberder@outlook.fr>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=0Mb/9G2e3EzKSZGS8ToiCmejzefFnnR1b8UnmKRZyoU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzZUr2bJ7Svyfz4viP/1RVx0YqNql8ST9ftjjz7XGiy4
 vUrCnoXOkpZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAExkix7D/+Qiq/ONM1+1plcn
 XQj4q7VXXHrpj84r/Vekpv5wrLG7YMHwP+tj/8yFJ+vfL9q+b7tbysGERye1xO7cEpB22pq97mD
 JKRYA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

macOS always sets this to zero and the firmware starting with macOS 15
has started to complain about what we're doing here.

Based on Linux kernel commit cc0fec9b42cf ("nvme-apple: Never set the
opcode in the NVMMU TCB").

Link: https://lore.kernel.org/asahi/20260806-b4-nvme-fwabi-v1-3-bde19ce8db04@kernel.org/
Fixes: 50333c94f2de ("nvme: apple: Add driver for Apple NVMe storage controller")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/nvme/nvme_apple.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/nvme_apple.c b/drivers/nvme/nvme_apple.c
index dc94988e2ff..f615f8fac4a 100644
--- a/drivers/nvme/nvme_apple.c
+++ b/drivers/nvme/nvme_apple.c
@@ -121,7 +121,7 @@ static void apple_nvme_submit_cmd(struct nvme_queue *nvmeq,
 
 	tcb = ((void *)priv->tcbs[nvmeq->qid]) + tail * ANS_NVMMU_TCB_PITCH;
 	memset(tcb, 0, sizeof(*tcb));
-	tcb->opcode = cmd->common.opcode;
+	tcb->opcode = 0;
 	if (cmd->common.prp1)
 		tcb->flags = ANS_NVMMU_TCB_WRITE | ANS_NVMMU_TCB_READ;
 	else

-- 
2.55.0

