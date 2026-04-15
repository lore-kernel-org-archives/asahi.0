Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143F0396593
	for <asahi@lists.linux.dev>; Wed, 15 Apr 2026 22:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776291898; cv=none; b=gGUnXn1yN/4nNB+sN8UMv3unKdmFHTehNeUOyVBuF2G86K/SvYdQNqZp92SQub85fwE2yWEryl0Nk4xMjGOY7YCa2IIy8/NWCXXN1DjFa/blUOQwJUQYNLeAbKdyP1fvdeW6nEhaiHsW+VUc65yY2ZZ8yNlorFuTTHd9J25WeT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776291898; c=relaxed/simple;
	bh=3OL1zEuQN0fn++jqXDTIIT051LlJXz7a/EpbpSTJFyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q72usBbZRo3u2n+cP/xvxPCeoZEm6Vs0ue9qFSX2gkH4/LDi1fpuc3MjvgNWOIK0fSg3Y5IgJhbglJURDlq6JsAR88ochDH67eNu2PtQtmdPTwvAW5AVTpEy+8GqRx29Kz1VIVEUFnJdukUFrcutB0Dnrx4SHVBrq5OAoHzsatc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PzKitx8k; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PzKitx8k"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so97227175e9.2
        for <asahi@lists.linux.dev>; Wed, 15 Apr 2026 15:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776291895; x=1776896695; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b15IkafPfIRKQwId3wrpIPX17TVkjx2r9u0B11S3rRY=;
        b=PzKitx8k08QzocLkjByFbrujy57J0NkRk3CzDnJ+MiiiQKwdL0SsNEX7aS+efu9uqL
         edQvGAAG0kTsXQXh1jVN74ZFT3puaQjKzQPhXHxE1fcw+qPzSN06F/UxGpREC0y784I7
         AlK5TQxetZqqnzZPIsuy6YxC/KtWdFGktmkcvT0wpK00L2OSk4jj1cupYsHOTkNiJdaG
         zePC2bzV8UoZ4KYjhdmHy5ejS2oBgDML5X4df/me+YGdY5FyeLakfIda/1tsqPtkwjFC
         GHwPdOye1AkrXU54R8Z3VnDda4kozoTlWVsGcOpgE/43jieC61JRIUE7MUiHebP8y/sB
         ZTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776291895; x=1776896695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b15IkafPfIRKQwId3wrpIPX17TVkjx2r9u0B11S3rRY=;
        b=MWedPu1cfw67YUcetXBGRC8d2oY7cQ+Zg0gfCqXaSUPtXvIjScU2/e+hyc60KIhL9u
         wuP/5EComO1Yv26vrMR2rFSEG5JNowrIm76nOXgQIAkiS0e8ofhu1TSnWareM8W53ajY
         QSJuwbNuYrGouPu6IDegsk1oBVmpLMUx+CqDbJAKzmeCehuoFmD51sCvaFSncgVH/ekg
         JDwIYlEEl2+9I45mFCt/HpRoVB/3nK5d3BnbxAUmLUu83wvYjCLZCKGHtPeYbSijejIM
         niGF7Z/rAMtX5Ti66vq+lrFy3/PxPeReJXdF16SvhnhVnyxFpQ+/KJX6rszxuwWHupKL
         30kw==
X-Forwarded-Encrypted: i=1; AFNElJ87T2Zb3QRtW34Yf/794U+mibSQN/4Pg3FKW79l7/JhleiMd0YMY7VkeL3BZ40rzAuJ7jlPrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFJselP9bZGBKnfkz77fAbJEl5aw6VT1jM6YyrQFSc02x2Ih7I
	xf0JZbirgq58oQfZOgIUadNwadTQuvkf7fxvye5stwA3y6aiOY1Rch8=
X-Gm-Gg: AeBDiev+N0ZkgOoDQYugG5R8XgR5SBHjZTARFcRbuwZhPjhHLnxZueK2CcRke37InVG
	5D8DFpGc+Sm8K4f7aZ7OwJu9vAvxhenoh+PTDD93pSOeiqKXXrW5gmPByUWyG4wrotaIrZqTu1J
	/K5e6bUagku5X8olLcxwWck/K8xuc+OPnAjdZEK2LovTbLAQWZ0SAcHdyJepqGf1t7IZAuflsBW
	7aWlmoFsZVaDQqctFofOVPvWZWt3pW+a9Ie4Trz0k8ivVVtOB6BZf9on/N6cj/XemiHm+jWpcbG
	aCjH5exoT5gIJIfxo8jeWyZnfloLJhSeytJWgscFk24rjug7SXJxF7kwLodb6/sUs+rrBUgZvrW
	ZwPUQWzwJEUD28FnqKgr8fwiFXnOKcZ45/2SGjFo0e1TKPgNbdjn7TgrMQwRGiGdpeKjLAEdPHd
	qxPCI=
X-Received: by 2002:a05:600c:4a18:b0:488:e6cf:671a with SMTP id 5b1f17b1804b1-488e6cf67d6mr109815055e9.25.1776291895440;
        Wed, 15 Apr 2026 15:24:55 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f581b8f8sm2482665e9.4.2026.04.15.15.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 15:24:54 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: Hector Martin <marcan@marcan.st>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	asahi@lists.linux.dev
Subject: [PATCH v2] Bluetooth: hci_bcm4377: fix OOB read from firmware event length in completion ring
Date: Wed, 15 Apr 2026 22:24:54 +0000
Message-ID: <20260415222454.1547214-1-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tristan Madani <tristan@talencesecurity.com>

The firmware-controlled entry->len is used as the memcpy size for inline
payload data without bounds checking when the PAYLOAD_MAPPED flag is not
set. This causes out-of-bounds reads from the completion ring DMA memory
for the HCI_D2H and SCO_D2H transfer rings.

Add a length validation against the completion ring payload_size.

Fixes: 8a06127602de ("Bluetooth: hci_bcm4377: Add new driver for BCM4377 PCIe boards")
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Note: v2 resubmission -- original sent via Gmail had HTML rendering
issues. This version uses git send-email for plain-text formatting.

drivers/bluetooth/hci_bcm4377.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -754,6 +754,14 @@ static void bcm4377_handle_completion(struct bcm4377_data *bcm4377,
 	data_len = le32_to_cpu(entry->len);
 	msg_id = le16_to_cpu(entry->msg_id);
 	transfer_ring = le16_to_cpu(entry->ring_id);
+
+	if (data_len > ring->payload_size) {
+		dev_warn(&bcm4377->pdev->dev,
+			 "event data len %zu exceeds payload size %zu for completion ring %d\n",
+			 data_len, ring->payload_size, ring->ring_id);
+		return;
+	}
+
 	if ((ring->transfer_rings & BIT(transfer_ring)) == 0) {
 		dev_warn(

