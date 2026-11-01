Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793566026;
	b=ZUif5xoqbOCSdqg59Ruf9j0SLxSFSiXNtB08R+cyKoEpUxZvX8kYE/Ki/1d0yoAVrJkT
	 c6SlYoBQcZbl8J/BdKqtFN+e6p9mda6Tp8ILYowwnxYeHXQyIT4XHKsabMo/i15L+5V26
	 RoVRoNpIF2Wq5QLhBmapoIOJxPDqSpi99TjH4tyLRKkJi+QMT2z0D4pEs3rK84/A0Pq7u
	 OLakmlxy4vmVll5YA1p/03S3SzbRj5rABSc4vlLMekIgBpcesRLQLfj/Y1ZsN1dUKWKkf
	 4Gl0SR6T+bzlkAr2sdO9i8xEAGoSxezOMjcPzRkD9uUzh78ZXt3y1NoqRypTgAFmQGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793566026;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yMQqpQDiKs7uaSI9ZXZcOp+ka5/Pebym49yFSbFp92E=;
	b=HVTbZ69CKgniLqodByTTzq6IRJfMd0es7/jqHlcP2OGvbeQLTJCpvYi7jIkcJo2vtVgw
	 oe+c8eFpryW2fYF6N/YY7Sgq0p+7dRTr+m/T71RWYi380jb52XM83AIWjHW5L9M2Gnozh
	 jp3vneJ6WvskeJU+07a5NEGThoxkx1DfSPf/cQHo4G5IP1OC3Bn0+Z7ALv5Z7u6PRa1CT
	 GUGK7iclrV1SDYZ2HwUZIPeVvMY65Y3QV4OximkYhhgu/FlV4RM7+58SdtOHQVIDDdAY5
	 jA7lofObkJ1iJcohkgPUQFXUHKfP1TimezQGvMjcHo0GdrY0zQtfpUccv33yBJKurSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SOGts885;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1324606A325
	for <asahi@lists.linux.dev>; Sun,  1 Nov 2026 20:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1324606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SOGts885
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso24231095e9.3
        for <asahi@lists.linux.dev>; Sun, 01 Nov 2026 12:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793566024; x=1794170824; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yMQqpQDiKs7uaSI9ZXZcOp+ka5/Pebym49yFSbFp92E=;
        b=SOGts885Ut0R7slmmFL/1nCC16iauIVjLQHXzMF4ZCXZbfNtDsCW3pzLdvUuL0kODo
         nEtSeWXanyolYMIbmBpam2A+4jnf4tzrPVq8smv5NEBwKFLXkSd3vVPmKJi98LtvzNbE
         i7pH2U3krsN7pVOLgMe9A7hG3RdnzWAbSROoB3NICJZXpiiHzjR1f1m53LnqE8W4t39k
         WrwcJ79yrjzVJH9qRh9yxtOdQmJKsbZ2gnGho0vyJteCFAHJzEIVc0/nVY70g8QajDBn
         FMTqsP2NYssjo3M9HpZdc+4gareWvBf6yjcSmsQzUw7DxEM5poxkCMLBLwnGl7k4CxhX
         MXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793566024; x=1794170824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMQqpQDiKs7uaSI9ZXZcOp+ka5/Pebym49yFSbFp92E=;
        b=mnBvWB7oRmrEHnalIML0DwpDDH8pczDHqJNAa4TX+ER6Vip6FFZtWkavqRNi1SONok
         8+47/VAL6MhSAAgIsSburbPKQaedqsXjNyyAML6fxvMamyD0GY7wgEh2khYhL1QOR/2c
         mQdLoVzbEc4ikS+2Es3uk16URTmcOPjxGU0I3YfAxJqR1SRIQW3YkWmKEjlILELHiHc7
         h4SFyiHnWFhJs4vhjfRJtnh0mI+1F6CI0v5R1dK2ztHuq4Y6qcZhcnxvz7csDrgk42e7
         SgLq1EyIsMauR2FZkbI70kqZEOm/0eeAkraAtBbnvimzTJzFlt+3HRbVc64j8tsuzAVs
         kPmw==
X-Gm-Message-State: AFq9FYKEHW1tFHNexCEf+n82f53DCFpyxNuPILRMarfVQjDjswM/6HCa
	lF0uRW7jmXeDQ3W4qMD7JvQPIszUsfp0wAhpm9gEUl95hNBkKWklBOGIvxDV
X-Gm-Gg: AYBFou3bPHFD1JxEceDdILzfFQyRwC96jYGZx9ynZdaObsJHU2pxWAjjFxrAJabB05w
	VTf1Uxwj9fBfM4mIoHL+aPOSy5sHp+E9h7dVO0AqNmox/mUGRnGDcLXMGmOLUYE7zT4qiOR5ifq
	/InugN+a0G8l7NO784xIraV+xlTbAd1Nm3YZCdrSCB4ye9wHfdL+aXy1kD5xOaGSiuKhK+swJso
	yeTy99qkniQ3DCmAZAZkaXb3mkHBkgHuNWYhCHoT/vx/JMAR4To60ImBbymWoJ5ZTbxF1bwux98
	DY9DkFUjAR9MFNGHHKfUD3IO4G7+PbAIqdsI+BIkCtMIc2tNHbfHjGwiK63PTBgHaMqY6wNz8UB
	XG66ZnlNA0L++b5yxhmvEdj1FKK46wafQeG5bXAcMhfRTzZoeaR20ZcFl+7BIEJwizAYqsWfD8Y
	hA0dWBmbT6sc1c0QU9WTtQN1I0Le0PA4gmkWSrperEnCaoOVWHu4qUc4xHHEO02yJ3Hp4gLVGZJ
	LOXP4+01dYDykwF1gFVGoMz/NwvIwftDXgMc6fMw14DpdWYcEdnDwTkXkHErrx03IBbW9yoWao8
	ddZcOPg4HdFYQ0HxItyGzw/kWfYF5q4t
X-Received: by 2002:a05:600c:524d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ac18993ca7mr195820425e9.32.1793566024206;
        Sun, 01 Nov 2026 12:47:04 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf0b36853sm205314035e9.0.2026.11.01.12.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:47:02 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: asahi@lists.linux.dev,
	linux-bluetooth@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] Bluetooth: hci_bcm4377: validate completion ring entry data length
Date: Sun,  1 Nov 2026 20:47:01 +0000
Message-ID: <20261101204701.2851941-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The data_len field is read from a firmware-supplied completion ring
entry and passed to bcm4377_handle_event() as the payload length for
memcpy into a newly allocated skb. When the PAYLOAD_MAPPED flag is
not set, the payload comes from inline ring memory of payload_size
bytes, but data_len is not checked against this limit.

Add a bounds check for data_len before processing the entry.

Fixes: 8a06127602de ("Bluetooth: hci_bcm4377: Add new driver for BCM4377 PCIe boards")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/bluetooth/hci_bcm4377.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 66d49b4715440a..5d6bda4a04114f 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -755,6 +755,13 @@ static void bcm4377_handle_completion(struct bcm4377_data *bcm4377,
 	msg_id = le16_to_cpu(entry->msg_id);
 	transfer_ring = le16_to_cpu(entry->ring_id);
 
+	if (data_len > ring->payload_size) {
+		dev_warn(&bcm4377->pdev->dev,
+			 "completion event data len %zu exceeds payload size %u for ring %d\n",
+			 data_len, ring->payload_size, ring->ring_id);
+		return;
+	}
+
 	if ((ring->transfer_rings & BIT(transfer_ring)) == 0) {
 		dev_warn(
 			&bcm4377->pdev->dev,
-- 
2.47.3

