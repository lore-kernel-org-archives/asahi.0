Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A860A3A28D
	for <asahi@lists.linux.dev>; Sun,  1 Sep 2024 03:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725162163; cv=none; b=uwTJbnTToih5+bBjhNMdpeW276fkNZMtCjf2amQxx5VkPYdNerFZWPEKOnw8NOw5W1HyA7Q4VdkFohwDmoyAbVBTM7UNAs0UIyXQ99EWL+BTXP6KDr/6zvGRo/D9itI+Wlna8Tx8GQ88ePZfJ2nKcLvOYPdk06PTqNjpWF6GluE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725162163; c=relaxed/simple;
	bh=/O+xoU3YukFNUl7NhIeid6XseqUUuazw4yq/PqekXOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9Vuorc+Yhto0hwXNEcEYKHbiNSzl6FGy8CCSbDn2Cx3w9Vchh5trzgDCpSvOehjaT4/LqeanGTZHrH6YC3pr5yBWgUP7hpN8f9kBa2eGzTc4vi+K4+3s0FvshdbXoSFwqGJYcD4/RIzBl16FxlMJdrwa1GAmFOPeKgmRpHY/+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7y49swk; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7y49swk"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7141feed424so2536153b3a.2
        for <asahi@lists.linux.dev>; Sat, 31 Aug 2024 20:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725162161; x=1725766961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5X+/CCCJdHsPQtIkli72FdNOUA83CpBm1xJ/DRLJla8=;
        b=g7y49swkkLbvV4L/9Rm2VHN+Wm9Yh8vl8sO+0y0sOznMdyeO1UCA+KZumaOSzUdtPJ
         L74rAmet8h4CgwXNUF1CS6fTI7UM1cRISkVyKfDx2C7KydgrwGYKHuMNWi3XXlonp/kT
         eUdqS/le9LfYjfX1n4Xb56pKfTYDcxdZiQI/ZoWgkyhkNfLXPp3g98IDw7ht8LU6IAVB
         v6mFYr5k04GChWcNvP/6kWLgIGluD1nTWJgSV0gjC1/tXMa2Z6Yy+3M2/x6SWoOoPWA5
         +htB97HmTwJv6O4O7xy4W/tVjnsIC8mV/w6kOdiBTmWRzhix+aiI+Ct9mF/JpTKkVFI1
         CIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725162161; x=1725766961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5X+/CCCJdHsPQtIkli72FdNOUA83CpBm1xJ/DRLJla8=;
        b=uTWmpPDPa6yb8uMAYAlSVJBbwTlkKV2MWe78F/ZrPfCHV3LByIf6VxW+3zyD6o08BB
         NwRoOart89lSvDAt2kqAd46dRQFrpe+FF2jE2WZ+wBhrY72VJMNl1BkqQirPdbScuAVI
         5fsbLTrvXtkBNyOiy/jCqV9Pkvbwm+lZkza7KmgSpwar0XTGLiGdSFsgCEajdIiOGOp4
         xo4/qkHtELtAK7AxHRVI7zcK2d0hkVklu/O4H3qodlO3fk8RMBfmKWb75EXrOFf+J9WV
         T70DVc9bV9o0QDqILRcsojzEenaiw31AS40lxGkljI18gQC/v/RG+eeZVlEAvIFkjnTR
         yllQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoeCUrzY7yHSUl8kcsBPUka2zc/RNesAikTsnGSXjILuUKTy1gmvSYYC9SebiKKjAcjNUUQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLr6oOCPxYHAFyyzuvzVRSY99C5Fmf6SA2kW7Oj9laGvdd5xlC
	C3csO5VCi2n4DWHBKdaJwq6uDeLoBjE2LZYvWaUliBfUOi3zqkkK
X-Google-Smtp-Source: AGHT+IErgWsZXv7smRglnCflkeOjudhULFolSyci/zrSk+ZWtbqCA1BERr3NORnUsdJcn5DSCwfNaw==
X-Received: by 2002:a05:6a00:1786:b0:714:1d96:e6bd with SMTP id d2e1a72fcca58-7173fa7c84dmr2181901b3a.13.1725162160903;
        Sat, 31 Aug 2024 20:42:40 -0700 (PDT)
Received: from localhost.localdomain ([49.130.72.113])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-715e55771ccsm4826767b3a.43.2024.08.31.20.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 20:42:40 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	konrad.dybcio@somainline.org,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 2/4] irqchip/apple-aic: Skip unnecessary setting of use_fast_ipi
Date: Sun,  1 Sep 2024 11:40:05 +0800
Message-ID: <20240901034143.12731-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901034143.12731-1-towinchenmi@gmail.com>
References: <20240901034143.12731-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

use_fast_ipi is true by default and there is no need to "enable" it.

Reviewed-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/irqchip/irq-apple-aic.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
index 5c534d9fd2b0..8d81d5fb3c50 100644
--- a/drivers/irqchip/irq-apple-aic.c
+++ b/drivers/irqchip/irq-apple-aic.c
@@ -987,9 +987,7 @@ static int __init aic_of_ic_init(struct device_node *node, struct device_node *p
 	off += sizeof(u32) * (irqc->max_irq >> 5); /* MASK_CLR */
 	off += sizeof(u32) * (irqc->max_irq >> 5); /* HW_STATE */
 
-	if (irqc->info.fast_ipi)
-		static_branch_enable(&use_fast_ipi);
-	else
+	if (!irqc->info.fast_ipi)
 		static_branch_disable(&use_fast_ipi);
 
 	irqc->info.die_stride = off - start_off;
-- 
2.46.0

