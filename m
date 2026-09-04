Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22243BBFAD
	for <asahi@lists.linux.dev>; Fri,  4 Sep 2026 19:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788549787; cv=none; b=FzCefIhO2qATYxJ/9Fi+6ZJ5t4tXvxI0VTpQJEz94PN6oxBxfA1d8PtXleA4wMdSgdsEwMmdioHH/l7qkiJQdbvdDl+xt1MEHFNlZ8xKI9dn5Bhbpwr2ffDEgeINBz9muUq4nIptmddDG++e0mknxi7i6IOBf3lkZ7Qi9fdF8pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788549787; c=relaxed/simple;
	bh=GIP9VgmWisWa3ANiOcObKuUXynxr0KnQdJPrclY8ILQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfLW14wVULM9PgvivXTCGLcl11PtQUBTFnlIjgsH1FRB+Xd9j12hBRRW9a9/CJzw4zuBjzQARnl3ulgbo9LIXlktZ0BlKzmRlEMizy3d3KgQEKKxCuWlsmMZQJmgznAXfh5Xsi8OTFBuXpAo0DDrOI8k0P8OBJROO7Hp1lRAKvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=UeaDHh1q; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=kKeGTNZW; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="UeaDHh1q";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kKeGTNZW"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 32AB31D000BF;
	Fri,  4 Sep 2026 15:23:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 04 Sep 2026 15:23:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788549785;
	 x=1788636185; bh=uS/UUjgYaEFVQ2qhzZuj5UG9XAwmjHiYic6WkzHF+TE=; b=
	UeaDHh1qV8SSBvgRTIkmEIvDYnlrYK653yGTUsxcAuVj185sJ/QnsifYXG9PJkIM
	OHTVMQCIZbrRbBFpbpHgUEy9t0rOjbhNP7IX6PlR1pvfRTFsyf//vRn6VJkMCSZr
	xZ01s6VQTazsM/EULS+m7DgHsYMnPbNROqtyQWS9Pgh/5WqOGkKqH1+X/tYPw3aA
	5ZKV6Bt4I2gTp/Cek6ot8j2pU3mqC/oic7WItOl/3Hx/3xFFJjufLZtLmr/sZFmn
	bujUpZxjhmLvU1dQqftoXsjJqxnuYWdFXo2rwoa4tCKzq/U7kUQ5rzGokf8OwyHN
	QYqgwu0Dn/sZN6xMrEJ4uA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788549785; x=
	1788636185; bh=uS/UUjgYaEFVQ2qhzZuj5UG9XAwmjHiYic6WkzHF+TE=; b=k
	KeGTNZW0XT2A9IIuYr4c6km/RBMX4N1qkoK59gVtPdha9MQSaa+QP7BjOAM6NMsW
	mjJa3dCXdCovPu/FudnY36teOEBNEk245Y8e87vLT/b5dM5FXbr8ACU5N4UBa/hc
	7AQfnqM+xM1Pkf/xmJ1iejKnwnhJynmJpV3Ji8rbdoZ6KzWo6iKlFE9tXiTrZI62
	C2uTh/lJXayBfiEoCg2JrPhkifKLt7FoyVA9Ll8JnpLsULDcyXNV0FCQkRcFAxBq
	xyBez/L+pr4fN4tb+p9l7yZtxkuAY4xp37xULOJcJM+0SQbB43OJSS4rSQHiMQg+
	XiP/wRgTaWzUWasyxu+Rw==
X-ME-Sender: <xms:mBqbammbVidbImeAA3tMP2R9r9WqKYgcCrmKlnqMPKVG-VDanK2sCQ>
    <xme:mBqbaiw32e8afn17GOIBLqFZfbXqksLa7lFj4pfhbtT6vKyu1TbJ10S4sRMa2COGC
    TnthYiyVmFJn7uHaP6TVvBbWm3hEzao4aJf_SrTni791cXLhDOgdwQ>
X-ME-Received: <xmr:mBqbao41Hs3rlFuctxahHvwODATLu00-ZrYdOevmfe0zSWyPoVUVdvwatJtVw6oV1MmspHTHKpqBBWjnv2WJOoSllypvwmhMk9QHTQ>
X-ME-Proxy-Cause: dmFkZTFbtEfAjjlSVyltyqEEyjJV7S/PVuuOhMj29l3ycoAQaU9HvbnRmvm9Wexk6whG/1
    JijmIqGyHbV2w1aV9qTQchVDlW5U8NVbtrcqa805BzandVH1kzwvYWbCyPp4h3/oRXKNKa
    s6V+RLdaEBpcRsIoLrCTrFC75girfJndXs0UAB17LcixOiiNvuMy5JAPaFoEFTtzRNFCbD
    5o3/z9N4+CKp6RMaoPOjOqXztQRIYmOF8GNbfy0kw467QXJGgFwvYkkbD6CNrGZ0PKd/0J
    sq5jrrnjuAPk5+yuJQfg4O5ZxDrR5Dp2iYRP5aswkWYF9urjMB/RFzIziYqOZcyLGeLyZF
    1/SciHGpghrEYdqFZ7T2QHs7JQoXcKl9nuXhzThuFsNsSwWjSCy3WwL1Riey1cBpSNlpwd
    TPdy7KaW2Xwkd0ssyoW9hqSOfxkYk1fjCuukwuVZVT5gqorL5QqJWVK1L1NqI+kbkDEDAP
    7DSrk2AQhL3FpgtuhaQtofq4enl2mte7Sw/+IoOYvgSwMh2RKryipoTaTK9vxBwmeRW9vd
    fmTkhcem//K3Ud35BdCTtpcU8ptpccTxbxyij4BZ53FZpkKc7AKR0fFtLz0Y6oRJ+Z2xn2
    c+3GcMXAbJC1UxIYa5cuKySlfqNZIdrgpaOJKKRDM4sUh9Wv3JyjsqEquehg
X-ME-Proxy: <xmx:mBqbaqUXhA52IdhjH6zWh4g5PaBVeK6k6fvNntLoWnRL2bmXBmNhdg>
    <xmx:mBqbaoJLn4ZNalkdTCBkAJ1VxQCdrfAOq7wnwB577TsEuTnx-LOqXA>
    <xmx:mBqbakvZTT-Zc1dNwa9tojhP1x0W0E-qfj-CYI66TURm5B-cK2bTGA>
    <xmx:mBqbatIfKbQhxUQVPwaXwlfzNlb_AZ-Q0XE1MPcI6Qf178hgAXb-Pg>
    <xmx:mRqbau9muO7-_W4xENTDEf5K0zK3OU4gQZ0DI9pudyRwksHPMXf9VxF6>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Sep 2026 15:23:04 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Fri, 04 Sep 2026 21:22:41 +0200
Subject: [PATCH 3/4] nvme: apple: Add WARN_ON_ONCE for non page-aligned
 admin queue buffers
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-apple-nvme-fwabi-v1-3-f7ede661c469@jannau.net>
References: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net>
In-Reply-To: <20260904-apple-nvme-fwabi-v1-0-f7ede661c469@jannau.net>
To: u-boot@lists.u-boot-project.org
Cc: asahi@lists.linux.dev, Mark Kettenis <kettenis@openbsd.org>, 
 Sven Peter <sven@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Bin Meng <bmeng.cn@gmail.com>, Tom Rini <trini@konsulko.com>, 
 Francois Berder <fberder@outlook.fr>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1647; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=GIP9VgmWisWa3ANiOcObKuUXynxr0KnQdJPrclY8ILQ=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzZUr1/eQX5RML+5r81ct7Q89I6pv5s1+o/B9s/beTeL
 6nruEimo5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwEQi/zEytG+rP6yzX/ORdmt3
 9uSznGufb77zN/DTpEamfcb77Bqf72f4Z72bo2zrrfuTss9ZdlxLs/Rf8PhgHtvVqS+nie69a55
 swQwA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Apple controllers seem to require any queue buffers on the admin queue
to be aligned to the NVMe controller page size. Weirdly, this constraint
does not apply to the i/o queue where any alignment is fine. This has
always been required on pre-M1 controllers and is required starting with
macOS 15 firmware or post-M4 controllers again. On M1/M2/M3 there was a
chicken bit to disable this requirement.

U-boot appears to always use page-aligned buffers for the admin queue.
Add WARN_ON_ONCE to make it very obvious if/when that changes or wasn't
true to begin with.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 drivers/nvme/nvme_apple.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/nvme/nvme_apple.c b/drivers/nvme/nvme_apple.c
index f615f8fac4a..54821f80c81 100644
--- a/drivers/nvme/nvme_apple.c
+++ b/drivers/nvme/nvme_apple.c
@@ -12,6 +12,7 @@
 #include <asm/io.h>
 #include <asm/arch/rtkit.h>
 #include <asm/arch/sart.h>
+#include <linux/bug.h>
 #include <linux/iopoll.h>
 #include <linux/sizes.h>
 
@@ -116,9 +117,15 @@ static void apple_nvme_submit_cmd(struct nvme_queue *nvmeq,
 {
 	struct apple_nvme_priv *priv =
 		container_of(nvmeq->dev, struct apple_nvme_priv, ndev);
+	u32 page_size = nvmeq->dev->page_size;
 	struct ans_nvmmu_tcb *tcb;
 	u16 tail = nvmeq->sq_tail;
 
+	if (nvmeq->qid == NVME_ADMIN_Q) {
+		WARN_ON_ONCE(!IS_ALIGNED(cmd->common.prp1, page_size));
+		WARN_ON_ONCE(!IS_ALIGNED(cmd->common.prp2, page_size));
+	}
+
 	tcb = ((void *)priv->tcbs[nvmeq->qid]) + tail * ANS_NVMMU_TCB_PITCH;
 	memset(tcb, 0, sizeof(*tcb));
 	tcb->opcode = 0;

-- 
2.55.0

