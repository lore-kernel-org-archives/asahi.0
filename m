Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC35E1B1D74
	for <asahi@lists.linux.dev>; Mon,  9 Sep 2024 08:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725871377; cv=none; b=KKHwlpRTt0ShYTS2PvH6L7LxLwfywskFszeKhrpA2HN65Eqtf+iVp2QIRDeg5j8mPjayxVSbq4Ke6O7Axn2DHMjinUDr1pZVPcAaZFuBLQh/7hcpYS7QmoDJy9njmVw0sjqddmL+pR2/YfoJKUooI9JE1gjiawTRoT4+YvND5XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725871377; c=relaxed/simple;
	bh=VWXmO1RyWUyhWh2dn59RYX/QZ88zhjH3WSnJNNQVVnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sXpthfO9HHJRKfUIdmBf/fH2aJpQ52Rxb2XhHjLfi7JdOaoEKOl80A8N2J1vKqXHPnzdmQtOp7GIkFqGQ96EP/uqRW8YzxyITXxTxKSejtD0maaRQoBoUNEsIXxg+vWJfROnyTDhS2NqLdV0LWQt5kL8RRrDON568ZhZGni9peg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJANxvt/; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJANxvt/"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7cd8d2731d1so2751720a12.3
        for <asahi@lists.linux.dev>; Mon, 09 Sep 2024 01:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725871375; x=1726476175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSAWxbt/KB3N4v3rcDblPZmbY76AbUJCwly8u6qq48k=;
        b=kJANxvt/YpAmoCCm533zMpJ5NlvqO2PS33SMbOnFV95uRace45lk++VZ+o9VOJvA+f
         Wxurhcp8m7GyZcUqea6OAixcOxrt7QB9DpWKKIVD7IUOAyYERlVS7Mu48wNCGCCaOw7E
         iVJwnAJxKSggbtt8cAL8bHQzVeXHI/HCw9rfB6ggKOlE9axwXHvjJXw6HFcC1mKg5PkH
         jFrSQDYIke/vi4/Ab6X+R7ag4o9u6E8Y+QRe8dZ/qjwrJBqMkN4Nuqc0u011J/oXANUM
         IR8iE5QuhLfxxqm1Nvb7FK1US2PdBeVEHwYVaGCzuLuOvxhp2T7CmsVww+2LTp/aJPOl
         2+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725871375; x=1726476175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSAWxbt/KB3N4v3rcDblPZmbY76AbUJCwly8u6qq48k=;
        b=vdjin6492/EP75fnprfJc7vNPFvniPId5bpmZym57VMo8+25lIcNOv9tH2l23PWtMz
         Cy09Oju8SkdyW36HkLTextFn4d1Tbh6k4n6aPf+pZxZv5GbHn1ppn5UlNveiL23WWuc/
         gNZKQa7512YM4mFl5xYaUacBJR7SNSZhdoW16EkIPrTytn5PSAlvsK/wNAg4+6ojnLI9
         lyBtVxzAW5nGc+EgU+basjSwziZCc6RnUqAxMNBUFcKHcXUZO62w+Pivg+Pkre+Goqt2
         Y83GeEEXB07ftD+IKqNGx3zHFeOizB1Flp0qaQ6QEpDeEsl+/tQvJxUcZ4bDmbgKoeE6
         QJkQ==
X-Gm-Message-State: AOJu0Yz1aJ8h2BkvCKqwhucWpxoYfa6rZoAtNqo/OAFrj1xSIgNjS3LW
	q/rM9m/QsdEJPJeu6pjlpk8azWiAPYzRLZFhQrOV2Wtsnx5sGghf
X-Google-Smtp-Source: AGHT+IHiDYxp2luZ1A4jiUkw8o2xWduuxjjGAFTCAzkleRs2eiF+6NUWiZjUn6ZHSoKHqp3vyv42cw==
X-Received: by 2002:a17:902:ea01:b0:1fb:93d6:9fef with SMTP id d9443c01a7336-206f05f643bmr99589505ad.38.1725871375038;
        Mon, 09 Sep 2024 01:42:55 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20710f1d663sm29678675ad.188.2024.09.09.01.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 01:42:54 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: asahi@lists.linux.dev,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v4 1/3] tty: serial: samsung: Use BIT() macro for APPLE_S5L_*
Date: Mon,  9 Sep 2024 16:37:25 +0800
Message-ID: <20240909084222.3209-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909084222.3209-1-towinchenmi@gmail.com>
References: <20240909084222.3209-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New entries using BIT() will be added soon, so change the existing ones
for consistency.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 include/linux/serial_s3c.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
index 1672cf0810ef..1e8686695487 100644
--- a/include/linux/serial_s3c.h
+++ b/include/linux/serial_s3c.h
@@ -249,9 +249,9 @@
 #define APPLE_S5L_UCON_RXTO_ENA		9
 #define APPLE_S5L_UCON_RXTHRESH_ENA	12
 #define APPLE_S5L_UCON_TXTHRESH_ENA	13
-#define APPLE_S5L_UCON_RXTO_ENA_MSK	(1 << APPLE_S5L_UCON_RXTO_ENA)
-#define APPLE_S5L_UCON_RXTHRESH_ENA_MSK	(1 << APPLE_S5L_UCON_RXTHRESH_ENA)
-#define APPLE_S5L_UCON_TXTHRESH_ENA_MSK	(1 << APPLE_S5L_UCON_TXTHRESH_ENA)
+#define APPLE_S5L_UCON_RXTO_ENA_MSK	BIT(APPLE_S5L_UCON_RXTO_ENA)
+#define APPLE_S5L_UCON_RXTHRESH_ENA_MSK	BIT(APPLE_S5L_UCON_RXTHRESH_ENA)
+#define APPLE_S5L_UCON_TXTHRESH_ENA_MSK	BIT(APPLE_S5L_UCON_TXTHRESH_ENA)
 
 #define APPLE_S5L_UCON_DEFAULT		(S3C2410_UCON_TXIRQMODE | \
 					 S3C2410_UCON_RXIRQMODE | \
@@ -260,9 +260,9 @@
 					 APPLE_S5L_UCON_RXTHRESH_ENA_MSK | \
 					 APPLE_S5L_UCON_TXTHRESH_ENA_MSK)
 
-#define APPLE_S5L_UTRSTAT_RXTHRESH	(1<<4)
-#define APPLE_S5L_UTRSTAT_TXTHRESH	(1<<5)
-#define APPLE_S5L_UTRSTAT_RXTO		(1<<9)
+#define APPLE_S5L_UTRSTAT_RXTHRESH	BIT(4)
+#define APPLE_S5L_UTRSTAT_TXTHRESH	BIT(5)
+#define APPLE_S5L_UTRSTAT_RXTO		BIT(9)
 #define APPLE_S5L_UTRSTAT_ALL_FLAGS	(0x3f0)
 
 #ifndef __ASSEMBLY__
-- 
2.46.0

