Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31C53AFD0D
	for <asahi@lists.linux.dev>; Mon, 24 Aug 2026 08:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787560025; cv=none; b=kLJWJaR9G9+DnfnLPpvWbbR3sjV3It6UsDwBBNW/vCDhQYdWnWT4wxsKZ+8YGqHu9cTR6WeuaI94mv0Bk54miVjx6zxULBuPRFtOZB4UIyx6lgijjN7Gx6fBEIsD3l0q257PweUM+DcSPFfueuZqySMSfeVMPR1R91l5lSea6y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787560025; c=relaxed/simple;
	bh=b2dLsDV6tovfS12A2h3XWlDcuFM60nmNNktagNvfK6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7l0UXzq/dvP9yhpT6n9I4S+pWH4/f5yTEqvRy6fMoPueVKBmmDMnxl3TizOp+Tefvmuw63bJupa2OhO0rzosgSx6oOWyrYPDBBEmbZQZPwGTvN3yEU9jkkZo/k2hr80ULpub1G9eu60LClplTMPV4EjNZAQpxzbXwT0oWwltQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WqoIAaVS; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WqoIAaVS"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d049069377so26554255ad.0
        for <asahi@lists.linux.dev>; Mon, 24 Aug 2026 01:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787560023; x=1788164823; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v4P4xEM9InT1ACkFaSbk9oo50Oi4Re2PcJ8ZK5DAW0k=;
        b=WqoIAaVS6ge1iWqxcu8aC1g6WWkW0oSdVzsrLL/yugszc/lQt2XyfBT0njh0HwJfrA
         fmi3U7RQMdyft5zYP396q0ajSA293z75XX72MKQMPDCvnvfyu7RW5KjgPMS1wOXyYPYk
         N5UhiIuzNspMD9B99//3sOBazBEl9MMc64t9FQPtpKPTgoOW30+a59MCxdMYE7jbOPk6
         oXAKLqEHmRzEe0j7ePnlheSqTGCzM3uqsXqqYxxzWddsMwJFosbj66YB1MYebmgN90Hl
         m/nxBG9tnhGXnc/w0iStZKbgtVmfmN57mPN+Ip8AQNy8/bxQe+xwjjN+HJUHzjCV1Q+w
         HJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560023; x=1788164823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v4P4xEM9InT1ACkFaSbk9oo50Oi4Re2PcJ8ZK5DAW0k=;
        b=MhiNunW+mPEz/Ir5QaZXaE5HVSkvN7kc24096TZ+ro4oJTpkxxfLcd9G8ovdRNFacn
         ls5Yw49RjkxDlyawHohWQcwhYdSzwEZIFFq1bBUdzcd0BfNLa9gn+JXnNpT5WYdzp90g
         WIwxObQa3Kx23VGi/4n92DZYRNQ3zzUzembq8h5qKunQ8XSMOybl5DwpuGUVDcS8Tr6z
         oIvY7B37PR1sTa5CNRwxzKCqhP2/iimMwV44kEJ+GzOixg6joun4IPNZrA+eetWuQ6KR
         yNvDsW3Fo8xRujRUWnOs1V0XviVRH5PgJrXgkyRBdNymU038luS8StfcQyTP4cBTQVtP
         w1QA==
X-Forwarded-Encrypted: i=1; AHgh+RpNTl1WUmJ0rJboeCH3gz2pwZJMBQiIeI2wgrPJ/pCmqRBN5VvVG+iCML2eOYDU+kO5JAT+bA==@lists.linux.dev
X-Gm-Message-State: AFuF++lnA+uxWT033MPgrYEe3NZwE8HjX1KBBC13SARadyIXUI/cyuRu
	otdbmx5avZyp4iNb2oLgWQcyE5uw/CrA5A4LdsZILWqFyYQMUhsYYCjx
X-Gm-Gg: AR+sD119NLw6BDnfD9Y5tOx3M17PNXWIVDu2vZJBxCdZ2mELjgkGVJs0gYwP2zBjaO1
	Uyk4epeU9yqTiLDcFXTCrCoiUBw710bWlVShyijntqmm9s0jQ6DW6yIaryjzeDVeZ6hcxRn0wqK
	JmxqNNmIYXPmgkcqVynom7pskcNoJlvDaOUBt7Gi/xdp58WsH7i4wVRqNj4Zs10O9LSqAHJFnQL
	3WHtyebKVAH5gATK+eqSsgr61UAoF+WMiZQ0dySqiiUFTpsEnQ1BVqgxkrM+ki+kNPGAh2yts9j
	W1Qr06oYPtijdWcjqL/N8SMHrhki3M9j3V9VKSNwwCeZI+uiRSWHyVovDIV+nm51XCZHtCamHbw
	uVifVeAyhyQPnqQXFV8doGhWff7pSIDfFAcphD9O3Y+BNMrKFyEM7Ea24Gb/+gG5a4lrhweCUSz
	ckjzSWNglQOnY976IY1qMZOwHKPbrE0FgZZukexbhvYoaCScUjxoxvAwzK7EA4Aiq2V7MTh6/nV
	1SGI6KcGCwlxH9blBU4Ih62qxaHccOTwyNtMOH/w42GNIoIhj9zw5GvAiIoZ57o1ZGTFvC9LO2z
	h0RL4OfW2JqNyLDbUS+kJZS5w7DgLrh8XJxGeYdaw2argNy1XI2Wakr0R0ge/EvV7zMsdAVpGEo
	S7XuiVNkhxpObAcVyhjFvTej9ZKnqkZD0bxxdeTLxrmDJOR0=
X-Received: by 2002:a17:90b:3d8a:b0:395:4de9:b30 with SMTP id 98e67ed59e1d1-395c353e28dmr45053163a91.5.1787560023127;
        Mon, 24 Aug 2026 01:27:03 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0dd3sm25994595eec.7.2026.08.24.01.26.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Aug 2026 01:27:02 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] soc: apple: rtkit: reject syslog indices outside the entry count
Date: Mon, 24 Aug 2026 14:11:39 +0545
Message-ID: <930eb129c35cdffb877b8fd16662a3250a0e2ecf.1787559303.git.acharyalaxman8848@gmail.com>
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

syslog_n_entries is a count, so valid indices range from zero through
syslog_n_entries - 1. The current check also accepts syslog_n_entries
itself.

Reject that index before deriving the shared-buffer offset. The shared
copy bounds check remains the final protection against inconsistent
firmware-provided layouts.

Fixes: 9bd1d9a0d8bb ("soc: apple: Add RTKit IPC library")
Cc: stable@vger.kernel.org
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 drivers/soc/apple/rtkit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index 2e62f9b3c948..da766df5a6d7 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -481,7 +481,7 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 			"RTKit: received syslog message but no syslog_buffer.buffer or syslog_buffer.iomem\n");
 		goto done;
 	}
-	if (idx > rtk->syslog_n_entries) {
+	if (idx >= rtk->syslog_n_entries) {
 		dev_warn(rtk->dev, "RTKit: syslog index %d out of range\n",
 			 idx);
 		goto done;
-- 
2.51.2

