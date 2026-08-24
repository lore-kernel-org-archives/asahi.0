Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5A73ACEFE
	for <asahi@lists.linux.dev>; Mon, 24 Aug 2026 08:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560031; cv=none; b=qS2RJq0eJy1R53l+TU92Zd6duYC5AAZiQvXjaQ56oQsxdy+CYt9TzhlBV2pLRpEp5cBT8HY9m6SONCmamWS7CSwshh5UVzaYgB7pODdPkoFGEktOd8tlATxpxji09lTukCAQ/GKv3cEvekiQ7+UGXabl5dJo7uMgpVCM3LZWFmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560031; c=relaxed/simple;
	bh=iO0WOKLJYHeCiXQSmFOX5WJAULuW7dOAGV7QorpsBUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q2XY84KX11/k5sLq6//PpQSmI6yLiF49xZiFJnwXIyqtw8aCfT3djp3C2lMt7bZHJ88Dm3IcHTTUZEo5s0QNeLwbR14D2RC3cMS8l+6s7H5nnkPQ14TzzclP6oNc4sNSHhM7vamD8QEGNDUDfkMYt/zDfuIpUONlZdU4zzJ0oAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQC4XZK0; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQC4XZK0"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso4778723a91.1
        for <asahi@lists.linux.dev>; Mon, 24 Aug 2026 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787560028; x=1788164828; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSkAieVQa1JTe8qhVM2kCKaOCfjEKvx10b2NLcrDjss=;
        b=pQC4XZK0lCDnMTU3ytEjZlDApjzoNrRfpz5wEcj9GMrFgHBFcGJg+ByTNulfLhE60w
         NvAQlkxU6qGWGfDcsWjAMmxmyo5PjjvvrxfIMxjJaMO6kPAmSMSqJ4JoyZMPAjTeGE1z
         35mMJl6eS8D3gReqf6c2IQGt2uvDmfYCgFWczQjQFOpED5AN/ths3W+w7HEY/Y7t9gtP
         fDQ9Atn3gUquRcvVBv75Aqw72jFp06eq7ox1wG5iEt7R0hVQOk3EQQWivj5U5dLZAxmY
         DJwAUIFXH/buhrp2YAg5SDZ+m0JIePT86teo+2NQMkVmUh4AxFzaPuGfaPQKAvv5l+Sy
         +NsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560028; x=1788164828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HSkAieVQa1JTe8qhVM2kCKaOCfjEKvx10b2NLcrDjss=;
        b=jQUoUHGPEiVh4Enju4msE8EvD15DEZtgiDbVHSxIbBTFRV3+dE6AdYubYcodi0W7jA
         3aScsqUW7Wh71vC9yW4g5elWHKRbldx10b9LN5tO1JTF0UY9Xf/H3WpIujXx6a8GOu4V
         kdgzaIljEkT9sbIlOaKHMplX1tZhev6/HEWi+IBtQKZ9tTwEe59JXBrwaB9t5cwX4N7g
         R8XvBkhYwJ3Mf3O+wjyhg8rGB2ESG6JxVNuGJJngeDY19sYpB0wv+NPeGpyhOxi6JFd1
         BI0smes7g0oqFEXqI+axES8U9S9Cjtmp8eKgBRCT5kZ67Pcmtr55KtsWz/MqmGMY2GpJ
         0Ocw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1CieHj6FQ9gsmf7URJA6SQjPGZXrd6nDyPKvpxJ2jUidO7ALNVXyQW2y0cIP9IBuhpDCkZA==@lists.linux.dev
X-Gm-Message-State: AFuF++nVcXL7ku9xj9MBTo9ndxPuAwiKYF19c0U/ryKtelDSfzhHWaY9
	xgGZnU2W2o8NOBP1ObozQ5Wqah+3Gy2FJ0FWo4cT5qkDzrOCpIc0lYlg
X-Gm-Gg: AR+sD11bBtQTSi9DJvkkIO1jAJizonC4c12jhXiELRhO85tAQ/+/7NyfRJeFksrLT19
	ORZ4b2gj9m8TZTxP6Mf4aY3/SoJP0ZLe8v8ya+2Yt1zs+TxjJIS6JvV9z7oq+IrYG4EYs86kqdb
	B7bukK6UfUUiGzQoOcGNVp97M8h5zFn8fuUYhTdtN6TrtulNpiR0XpyDr3ynbKhbfrEiOd5ESUl
	CIJ/zqp2bewZhqbFr+EXQ5JmlJ8VkjP7USezAM5GVZn5y0cyc8KRr16TKI/Z0R/J5Ih/UMoG91k
	tsOF/+SJcQDKsK5jgmafxGLOFRhypBe1wkZC+v3t4yRfoL4Hoi0FGUEb+Oom8iuVv+6WiAva+Ir
	hXB+FxjZr+vaeC0yDzTBWJCXMRVWQM6l0IblR8cu+svTYEZMgH898X/wUQkl4OyUStGuMmlTSmC
	TS0yO4EL/3x3xuVNFg0Pf1YswS74MZLlivI71RZqR++x7CEAMH1cC/r0iKIg3sRurSwQBQbh1Mq
	2wBwrVge0hBVyKOpPUxBilFUlrQWRTw6sKHemtfmtUjjpIPnOOLpafVQ11T7TBD4kU67m7t5eWs
	zCicfPv91VbU4YZzjl1GWPt8KOL+MQH/nJaOwLe2gO4vzAdwRkTJe8GdnGhlh4IH6qdmAIGJN51
	NT5O3UbS2gIP1BK7D1FiEtZCojZlzSSwUSZ9gZJzpYE8sTxM=
X-Received: by 2002:a17:90b:50c3:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-395c39e6433mr48365891a91.11.1787560027941;
        Mon, 24 Aug 2026 01:27:07 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0dd3sm25994595eec.7.2026.08.24.01.27.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Aug 2026 01:27:07 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] soc: apple: rtkit: rate limit malformed syslog warnings
Date: Mon, 24 Aug 2026 14:11:40 +0545
Message-ID: <fa4dd49adf1579d6fa378e4115d4e678e8dc12a6.1787559303.git.acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1787559303.git.acharyalaxman8848@gmail.com>
References: <cover.1787559303.git.acharyalaxman8848@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The coprocessor can repeatedly send malformed syslog messages and flood
the kernel log with warnings. Use the rate-limited warning helper for
the validation failures in the syslog receive path.

Fixes: 9bd1d9a0d8bb ("soc: apple: Add RTKit IPC library")
Cc: stable@vger.kernel.org
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 drivers/soc/apple/rtkit.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index da766df5a6d7..e70e3d2cfa08 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -439,7 +439,8 @@ static void apple_rtkit_syslog_rx_init(struct apple_rtkit *rtk, u64 msg)
 	rtk->syslog_msg_size = FIELD_GET(APPLE_RTKIT_SYSLOG_MSG_SIZE, msg);
 
 	if (rtk->syslog_msg_size == 0) {
-		dev_warn(rtk->dev, "RTKit: syslog msg_size is zero\n");
+		dev_warn_ratelimited(rtk->dev,
+				     "RTKit: syslog msg_size is zero\n");
 		return;
 	}
 
@@ -464,26 +465,24 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 	int msglen;
 
 	if (!rtk->syslog_msg_buffer || rtk->syslog_msg_size == 0) {
-		dev_warn(
-			rtk->dev,
-			"RTKit: received syslog message but no syslog_msg_buffer\n");
+		dev_warn_ratelimited(rtk->dev,
+				     "RTKit: received syslog message but no syslog_msg_buffer\n");
 		goto done;
 	}
 	if (!rtk->syslog_buffer.size) {
-		dev_warn(
-			rtk->dev,
-			"RTKit: received syslog message but syslog_buffer.size is zero\n");
+		dev_warn_ratelimited(rtk->dev,
+				     "RTKit: received syslog message but syslog_buffer.size is zero\n");
 		goto done;
 	}
 	if (!rtk->syslog_buffer.buffer && !rtk->syslog_buffer.iomem) {
-		dev_warn(
-			rtk->dev,
-			"RTKit: received syslog message but no syslog_buffer.buffer or syslog_buffer.iomem\n");
+		dev_warn_ratelimited(rtk->dev,
+				     "RTKit: received syslog message but no syslog_buffer.buffer or syslog_buffer.iomem\n");
 		goto done;
 	}
 	if (idx >= rtk->syslog_n_entries) {
-		dev_warn(rtk->dev, "RTKit: syslog index %d out of range\n",
-			 idx);
+		dev_warn_ratelimited(rtk->dev,
+				     "RTKit: syslog index %d out of range\n",
+				     idx);
 		goto done;
 	}
 
-- 
2.51.2

