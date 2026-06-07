Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAF02BD030
	for <asahi@lists.linux.dev>; Sun,  7 Jun 2026 06:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780812719; cv=none; b=V0kSJS32Qk9RFzezCBG1SJjr0a8SkMNi4u6rXdFUue/tIjfd2bvbYym4TXkaCVOWBUwAGcE6rVaCrdf4qCpJRve0clw2jckTdzhu/lcdjyNXNP1QcLXGWdghcLX088kzW/q6U7AbzIr/GV8XimklSgbkSqZq9O+MFTC12ThJROA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780812719; c=relaxed/simple;
	bh=sD96oirqm4ckkhaWc1fQu9F2uL78837hDwpVhGdgQ3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cP2iVlPJLkxNItqTgbno6kdx0xdFmkzlDAFWvvyD8h+ri2SfDLjMymatlF+iR3ma0RlQpUmy0l54MtbdCi+KhGAvDEty2PLWr+aazLKRBcfIJg64uPKsm/FFcJmOrjFtzf2VOONO3x12J55qy9YmY8nuQO99/DAarnGk4NySF78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bI32E5FA; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bI32E5FA"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36bcf3d2565so2292738a91.3
        for <asahi@lists.linux.dev>; Sat, 06 Jun 2026 23:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780812718; x=1781417518; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n4CzgW3/VXNfJs9yhqU/zZT2TtJnYVsjAwImG97RFLc=;
        b=bI32E5FAPJurzLF2GxDZYFrsPgE0aiY8ARo9ihfSSScaIeQYegMPtL1DMr04NWTZ5h
         11nATMYsy2J2HpIWAz7G2Ub8ba4MLaY3/DRFOxo/wDMhIkPclHBvr2QaVt6xccDI+21l
         SWW1oWEbyk4iKMRCena/YIYIcLfg5q+fFognOChInRvWTfNjMRxwwzdyTXvoA4qzZvXU
         6uF1RhLdhflxQTy9+X0/V+9RO67LgqvTRs8+0LkIiZPcoMy+CNa8/2C/LoUto4/LjgVx
         5oWXBDoehhCQZcZRLTIqrrFKykNpDCCcixW8bBNR47P00s77Ntgv16MwsRf/MlSYOErF
         fSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780812718; x=1781417518;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4CzgW3/VXNfJs9yhqU/zZT2TtJnYVsjAwImG97RFLc=;
        b=VK2vKl0f60m/l2MCwLMjM3F4SzVSIoRgIbVXAzoFjV/d2iJwDhHNeIEjE+rM7K3ZuY
         cJxtyU13wekHAlLcjEpWolCMLhEPTZs0iNktd2DQaBiU7YdpZi8uKn1T2tSy84ZFLGAe
         infzcyKIm+W+Myb4PUbk/uOYvkeYs7kkG8J+LObQbEKLF85f9b8gQ8L03HVh5fzOdXf6
         RbpOgRTpMpbFZzct1qFQUexivJ/LIVdo/StLjBnytaNawCFKOwQ2bQHWiI9gpi4gqDsO
         IIx+H63KQypZ7WonUZCfkvtiLAoswf9LaEPFKoNpMMSArPptD83sT4gX/31uYucdy4nj
         8G2A==
X-Gm-Message-State: AOJu0YyA5OTm8US9uj+n8+2UPDJYC2I/iU1PMcBPTJK68HUCsArC3Af1
	cyY3G5Wf19oRgy8DHPaoqWUPJOe83lrGN7WuSNHQuaK7iqhWJ+qK/mTe
X-Gm-Gg: Acq92OFxBVje9HMBK3KZ38p6Fs68dHuKso/UEc/hvbVCPFa5xTG7Ax2mPPQ1bpb4POR
	gLY2RwUGGw7JG3nQzeE0Gb77ayXdlTgZB5DfJjNaYymhZtV6QaPLM9AXOnmHkoMOTiPpo/xLrPX
	Wfst1uE/upq9QzsM6AN5ahJr+gcWMuS659RIdx9TTJ4Ly4GNB3fddHnfe8MT6rXZ1dV1Gf3mlhf
	NmeMDkyHINEgpMeCsE0/MhQiccH2GAP6rvV3xjTGwqOTo4P5tc65tQOsyGPfExVtKWDOvxJhLzU
	PxwIHh8oy0ufFOFRqQpo7bC3kXg06PL58EIG38qc7Ry6IgXxawBC9vLSxrqOdqnuL/Jd98cGWHs
	8q4P4XG9DiR9vCJjRhsWTDvpxSzU8huBkwHNKD2LCvB6hj1iLxMQOgZ7NKc3n9ykfdu/QY923q6
	uGB11ANnJzws0WaaH3S9dSKZXS68iBI2wjLE37
X-Received: by 2002:a05:6a21:134b:b0:3b4:b216:2b1f with SMTP id adf61e73a8af0-3b4ccf80159mr13680216637.28.1780812717650;
        Sat, 06 Jun 2026 23:11:57 -0700 (PDT)
Received: from [127.0.1.1] ([223.122.38.120])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c85df0a4afdsm14265308a12.19.2026.06.06.23.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jun 2026 23:11:57 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sun, 07 Jun 2026 14:10:58 +0800
Subject: [PATCH v2] nvme-apple: Prevent shared tags across queues on Apple
 A11
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260607-prevent-tag-collision-t8015-v2-1-dc4ef4fb42bc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7Zi2gEFX3sOwqMMAkwA1tCEa0
 rs7cgIzq/fz/5sdIq/CEW7FDitvEiUsCu5UAI1+GRilUwZn3MXo4UtbvCRMfkAK03QsMDXG1mi
 p8d2zdGXVMahBu728D/ujVR4lprB+jmeb/aX/eTeLBq8lUV8x+bo292H2Mp0pzNDmnL9xWMvex
 gAAAA==
X-Change-ID: 20260606-prevent-tag-collision-t8015-1c8adb3234de
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2577; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=sD96oirqm4ckkhaWc1fQu9F2uL78837hDwpVhGdgQ3s=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqJQuj5X7yX0st4BSLbvwlG4Y23Krqmjcv8kUJK
 eJmcCRztTuJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaiULowAKCRABygi3psUI
 JAj2D/9pVvXx4a209XoxNjr9ggO6sjnN9gdaSZUU6WD/bPUTGFUyk2mhMNzxfWJ2wIQQ89SnX6W
 pJGIZH55vvdXeN3NI6t9RwdBoS98XmqHS9nGZFb9Wqb7dFhkxTGMVVOuSEn9661DibNck167UDu
 boT1wYaIcB+T8RCR2QkqfaKq603iB1OizXUU+OQEqVCkIH5MigRf2S5/+AwzcqHYDh/epJyCk3Z
 B6PSTSWNm7puzXwLDXdH3+o5WP8VWoPisatGyzTt70KMTs3wrFNIqK4aQ3rq06GXPC5f5RCWS+D
 d6XVaiIIHuB60G7mJXVaETbfMIyhJZ/rEJb2BChuQXl9jv7O0vduj1977TUgaAG5LIHqY0EVDRD
 SbIgcxt4EIYW6+JZJC2l6EFajmHi1wicQq9199JbTkLav7ZS1dTbuQDeEl6pLLqjI8Av16OoIkw
 G3F1xlvBUoEEFi4h2cEFa4EqWFOmE6bNVqCpou1qHZq6zfovkqiRlmNi85ZcHg1+h66Tq+LZpZ1
 BgdcHV89lsGc1vpmhWbRhnCD2CfWnKgiWdqU1u3rXXcNOD4IJeCFV3ejOk+xxfl9b9KhmbH36PQ
 Ev6rU6o2iuHBvAzxFinW4zH3znRlCBPoZ6FYiClWNy1EbJUYGMiR2J9GK6PiFvOD/7x+D2eVKcp
 Fa8BpKVdI21En8g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

On Apple A11, tags of pending commands must be unique across the admin
and IO queues, else the firmware crashes with
"duplicate tag error for tag N", with N being the tag.

Apply the existing workaround for M1 of reserving two tags for the admin
queue to A11.

Cc: stable@vger.kernel.org
Fixes: 04d8ecf37b5e ("nvme: apple: Add Apple A11 support")
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v2:
- Complete rewrite to use the existing workaround for M1.
- Link to v1: https://lore.kernel.org/r/20260606-prevent-tag-collision-t8015-v1-0-93ccf4eca550@gmail.com
---
 drivers/nvme/host/apple.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/nvme/host/apple.c b/drivers/nvme/host/apple.c
index c692fc73babf..da6e983e2005 100644
--- a/drivers/nvme/host/apple.c
+++ b/drivers/nvme/host/apple.c
@@ -225,7 +225,7 @@ static unsigned int apple_nvme_queue_depth(struct apple_nvme_queue *q)
 {
 	struct apple_nvme *anv = queue_to_apple_nvme(q);
 
-	if (q->is_adminq && anv->hw->has_lsq_nvmmu)
+	if (q->is_adminq)
 		return APPLE_NVME_AQ_DEPTH;
 
 	return anv->hw->max_queue_depth;
@@ -303,7 +303,7 @@ static void apple_nvme_submit_cmd_t8015(struct apple_nvme_queue *q,
 		memcpy((void *)q->sqes + (q->sq_tail << APPLE_NVME_IOSQES),
 			cmd, sizeof(*cmd));
 
-	if (++q->sq_tail == anv->hw->max_queue_depth)
+	if (++q->sq_tail == apple_nvme_queue_depth(q))
 		q->sq_tail = 0;
 
 	writel(q->sq_tail, q->sq_db);
@@ -1139,10 +1139,7 @@ static void apple_nvme_reset_work(struct work_struct *work)
 	}
 
 	/* Setup the admin queue */
-	if (anv->hw->has_lsq_nvmmu)
-		aqa = APPLE_NVME_AQ_DEPTH - 1;
-	else
-		aqa = anv->hw->max_queue_depth - 1;
+	aqa = APPLE_NVME_AQ_DEPTH - 1;
 	aqa |= aqa << 16;
 	writel(aqa, anv->mmio_nvme + NVME_REG_AQA);
 	writeq(anv->adminq.sq_dma_addr, anv->mmio_nvme + NVME_REG_ASQ);
@@ -1325,8 +1322,7 @@ static int apple_nvme_alloc_tagsets(struct apple_nvme *anv)
 	 * both queues. The admin queue gets the first APPLE_NVME_AQ_DEPTH which
 	 * must be marked as reserved in the IO queue.
 	 */
-	if (anv->hw->has_lsq_nvmmu)
-		anv->tagset.reserved_tags = APPLE_NVME_AQ_DEPTH;
+	anv->tagset.reserved_tags = APPLE_NVME_AQ_DEPTH;
 	anv->tagset.queue_depth = anv->hw->max_queue_depth - 1;
 	anv->tagset.timeout = NVME_IO_TIMEOUT;
 	anv->tagset.numa_node = NUMA_NO_NODE;

---
base-commit: e43ffb69e0438cddd72aaa30898b4dc446f664f8
change-id: 20260606-prevent-tag-collision-t8015-1c8adb3234de

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

