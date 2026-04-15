Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9990223183C
	for <asahi@lists.linux.dev>; Wed, 15 Apr 2026 23:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776294125; cv=none; b=gPplfRsJn27lzNVmGFWwv4WccZfhaWkV6Qr4MhZozc8Cc2hyR3omBpgO//JEKqCzaQBej0s//JIZED2SIyq0CjHPI3BPymp1UFhmkYsGQvg4butVQBJW203TDZlaKR2cQ9y9Wrvf2lKfWr4S8fzgMwqn9fow5m/qU+7xqae2QA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776294125; c=relaxed/simple;
	bh=erBODFHxB3eerf2uoeplED+Ky6AlXPF9a1q1K3XBXaU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gfh5ks01hMbKg8ZsqqOsshsAzD5fYcRpFcfDFCQHwoh7cyeZFhQsgXfekwoyq+e6AyHuQEFGX5bMzZlAp8hWAuVef70sN2NSse5qZt/FUp2Dr5IavfhB5dQ0XSoL84hPLkhZ0VTnJP0K5u0AVhpFRVYBm9shEEIcRSK6AKIBluM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fl5Lat7v; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fl5Lat7v"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso88954025e9.2
        for <asahi@lists.linux.dev>; Wed, 15 Apr 2026 16:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776294122; x=1776898922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OKmdQeKtV+AFbzb9cVnp2KCouho3xgr2x8WACSZd2Vk=;
        b=Fl5Lat7vs6G0q09wxL5G8HooKSFD0OiG0OqQ+wF2Lg1Z6FV3ZEaCtnCl/7EJI1IHwm
         p+aJ+Kgcnna1jUicWwP/w9z8b24+DzhcxsdHh56kW8YkivPkfWN5ONW1Htnx/mObskY7
         O19uw+dPa0aZhX7MnLaWLwjd+SIIPMyh2mK+2G5Tn0HzgDCUz/YqQU0FihkT0HSB2Aqj
         NcIP8wxD8k/RnLpofzd38CnIKFhz+kulnkLQ7nvoYSr83O7jZe/zh0OEonJGXgEirene
         Y2CyzuR6Wks2Y42NDgPdQQbD9y4Mt2ujojKnExPxLfsfthBoMVtx5SGvSA5MpFG1dgqe
         ON7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776294122; x=1776898922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKmdQeKtV+AFbzb9cVnp2KCouho3xgr2x8WACSZd2Vk=;
        b=FNpWk0Tc2pSYgozw0fqY2/w31o670Wt7lJWXXUQa4W9chUcSE0xrcFyR6mIYAtQ/5l
         OJj1iCO/YcVdhNyll3WxRxqIC6qVed97jLLRVh9tP/UhF1Oe2YVCnQ0UUk6+V9hJq/V6
         hy9IjLkym9yHLJioyl1EhHvc4NwQpJ60gA10ZXKy3IPJy6sFLI5eW3bQslQ/wvFOezYl
         oqM3PrQaM8O/bt6X717q5AJpqvnj0QXQfB4nhKy4NEIVoTHBuSW9GiwBs3Lfj32kpPyO
         fjlOmo0C3PLdjaXQJeiCzokfOIUc7MrNRxE6/PxX9yOinWJJGIChR3YGesn6kNJ3asPF
         UMfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/6zwdttqo/IuVImlJtGEeNKTytK9xOog9muPHxGb7IjOYGoj0SeXVEWDtGd+XmRGwyX6+SHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3IG+UCepTk5WXaj6CQbMTzWFh8LJVKlUvxey2OeAuyLVTDZ+u
	9zeSh6UlsraURHanMqsXmu1MqmdOuODF7WwsAlxTMvuF7bXckCxXLYg=
X-Gm-Gg: AeBDiesmy7zGyBk0ZAsJYEPaDmkCCxN6OBfREydOFfrmiO3Jb4s7BoSjSncXE59fs8q
	VUepZnu8KiZJkzvhkq1wFQAsBRDMU+m1f7EIsuCFt8xP1w6Gb4TlyV0swXx5p2QVE0/sozm/0B2
	0SRpaG3PRTXdRk0YD+ON2mZLSe1SfrWsJyuq5Ft/3IJhg2scLfFO+GNmM579DYD7iE3WXcxDUKF
	Er/ZQirxBW2ZgCNWpG4RSNfrrg2Tc95y2hZxT9tvs9gELJMtDR+IHWGLtwSp25bLtZiJCrhAJe+
	5oR6VY0goHIcrwbOlGcI5rgI0WlPf8P4tmFptpleDK2aRwDFDXFAHelXTzocgGFy6SLazGbd0tI
	Q3Cq35oUvsc6ZXrh3mHouspquR5EFolOp6YKZ35tydFqQ4RIY8IOcrL2kUyBrMT6NnyMv8jHiuU
	0uh2eKXpId3m+JBwtQ
X-Received: by 2002:a05:600c:1987:b0:488:b187:d8ed with SMTP id 5b1f17b1804b1-488d67bf765mr329800595e9.2.1776294121926;
        Wed, 15 Apr 2026 16:02:01 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f0e9a770sm29143005e9.19.2026.04.15.16.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 16:02:01 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: sven@svenpeter.dev
Cc: marcan@marcan.st,
	luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org,
	asahi@lists.linux.dev
Subject: [PATCH v2] Bluetooth: hci_bcm4377: fix OOB read from firmware event length in completion ring
Date: Wed, 15 Apr 2026 23:02:00 +0000
Message-ID: <20260415230200.1759546-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware-controlled entry->len is used as the memcpy size for inline
payload data without bounds checking when the PAYLOAD_MAPPED flag is not
set. This causes out-of-bounds reads from the completion ring DMA memory
for the HCI_D2H and SCO_D2H transfer rings.

Add a length validation against the completion ring payload_size.

Fixes: 8a06127602de ("Bluetooth: hci_bcm4377: Add new driver for BCM4377 PCIe boards")
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
v2: Resend with corrected diff context against current bluetooth-next tree.
    Fixed format specifiers for u16/size_t types. Original was sent via
    Gmail which caused formatting issues and stale context lines.

 drivers/bluetooth/hci_bcm4377.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 925d0a635..5129708fd 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -755,6 +755,13 @@ static void bcm4377_handle_completion(struct bcm4377_data *bcm4377,
 	msg_id = le16_to_cpu(entry->msg_id);
 	transfer_ring = le16_to_cpu(entry->ring_id);
 
+	if (data_len > ring->payload_size) {
+		dev_warn(&bcm4377->pdev->dev,
+			 "completion event data len %u exceeds payload size %u for ring %d\n",
+			 (unsigned int)data_len, ring->payload_size, ring->ring_id);
+		return;
+	}
+
 	if ((ring->transfer_rings & BIT(transfer_ring)) == 0) {
 		dev_warn(
 			&bcm4377->pdev->dev,
-- 
2.47.3

