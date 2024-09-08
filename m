Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3CF142624
	for <asahi@lists.linux.dev>; Sun,  8 Sep 2024 09:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725786598; cv=none; b=ty9RdYze08Isml38/7BBeM1CnjuQWt5z6s9UApxfZQU2M9W/cASZlx/9lICJ9U1LEpD0Wl+JAg+zXbVpGg5pD6henf5KEC2C5tm/g3He9/9th8Hyatz1HMICE8PRojD9citMxtkAXkk02ZDJKVzPis33fOPjHz/KVypfHRR+pSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725786598; c=relaxed/simple;
	bh=VWXmO1RyWUyhWh2dn59RYX/QZ88zhjH3WSnJNNQVVnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSpwa1Q/oEmEpA+NSL0FAZHelQKZk4RKuvplBiXKGpnZbGx8vAH8tucWGKXJkrF8t1YuCMT5iXXyCg6Rs9cPk4FLpiishW/EDf9+FAW25v1Ny2i3/l6RMYUI5Ux9uF0DaZtPI/+MqDNoBqOSjUiuc9NZQgJWdSnJstsTr1T+ayA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uc3wSVsG; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uc3wSVsG"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-39f4827a07aso13407245ab.1
        for <asahi@lists.linux.dev>; Sun, 08 Sep 2024 02:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725786596; x=1726391396; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSAWxbt/KB3N4v3rcDblPZmbY76AbUJCwly8u6qq48k=;
        b=Uc3wSVsGsAd5gdLskDZVF9Sl7LRMm3scwjk9JcyVkT5Vna4trgggyLR1++YLs0lB26
         rP5RYj5dD5CFf77p+oAw2Jg/sk4pnl6Rlq60SUgR9U3VnLKV718qBOSXPOerWHTpa0Ww
         Q7w1xffN3esKJMdVVeobLzEHWp4c8+m2yBebd4cF2knwG1YnFScqpVcE2lzlJ201AEE/
         haiWohULugh4WQXDlQVJaTQ5wgpKKxCkWdLp34KkuNVbeRXL4B+8TMooibvMgqizTcMB
         YvTBnuzNCF/+InIPJ885koMjzxmuSctxhxnUfhkD1aFRja+HQuraF5tUsacpp3YtV+hZ
         AYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725786596; x=1726391396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSAWxbt/KB3N4v3rcDblPZmbY76AbUJCwly8u6qq48k=;
        b=ISUM+BfgeUtEeGQ4/Fi80xDY+8SR32orW38HaEZdAUxwvBZjhav37VfPfXF1h5sT+x
         GLZYnBIThxqfvhGSw2cVtL4zMhtxkWrh0QqtfVUPWFsOibGkIl+ryO/OFRAQHWc5o9+w
         5K1YZ1pBWoSCuzrlbEDyoCwosOX68hk9e8NZk9Rtk3gcxA3AAs5wLyLJC7NfjMq+UfXJ
         drca+y4yUboASq71jD+Nh8f9wCheJTACr4Vdtd+lZ8/YVG00rKyABwUqNBXo/+v6Z+zR
         e+C1sYEWOsobRCNmvk+QunKipGt3jGGeCfyqpmCGrTIPxygPpRpF1yNitolRR5NRkEzE
         sYzg==
X-Gm-Message-State: AOJu0Yw/59P1TyF/zqdqd0K/rkkXy7QQAxX/LjagkaZaQKHP5eTdPE8S
	1uN5MNuQb9KbZnNonO/s8jjypWfMKKmQVLMPUA3IlypXMQK8Yqra
X-Google-Smtp-Source: AGHT+IFJnCdJXCpTXb1e+steOSyM20HciaPvsoOArOX2sAu8pdaVRbLHI57gIDA3RXUNGnGBax7WMQ==
X-Received: by 2002:a05:6e02:1e03:b0:39b:4ec0:645c with SMTP id e9e14a558f8ab-3a04f069c70mr98216235ab.4.1725786595755;
        Sun, 08 Sep 2024 02:09:55 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-718e5896e10sm1821439b3a.31.2024.09.08.02.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 02:09:55 -0700 (PDT)
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
Subject: [PATCH v3 1/3] tty: serial: samsung: Use BIT() macro for APPLE_S5L_*
Date: Sun,  8 Sep 2024 17:05:10 +0800
Message-ID: <20240908090939.2745-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240908090939.2745-1-towinchenmi@gmail.com>
References: <20240908090939.2745-1-towinchenmi@gmail.com>
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

