Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7FB15099E
	for <asahi@lists.linux.dev>; Sat, 31 Aug 2024 05:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725083837; cv=none; b=Li1Qw3CpykrtIH7DVws+axltW7FsKjpdUyY3Wc5/bT/JOIz2BMsRgz+0Rfs8KGkWVDa/uw7AVc21i8Ki7PfCXUFjucKTxYxOhV/6FGiPxzEjMBIc8QBwdehqBcAjxcJ1tf2Saz/KjR+hfQw5cBx0zx65VN6YU2us0S8hmEKl+js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725083837; c=relaxed/simple;
	bh=9su/Y9MlO6MXAM8Bt2sijpIlEdQJjfOz4vTGsWn3PGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K9YoXOKmSKXEwRNk+haLZCRQwzVdEb0Dzf8wIQce9zFHNHZsGXbTGtzmqIjTbe8M3APXWALT3wdJ0S4txHa2HBn4CUPJJAPRomnLTvtQcPN4Aj84OmmATSYosGRaANh+tqirXaVDby4a6xf/C9c00LHsBnLQ0ObgBKAextN0riA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EX1gMp4j; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EX1gMp4j"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2053f6b8201so6749825ad.2
        for <asahi@lists.linux.dev>; Fri, 30 Aug 2024 22:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725083835; x=1725688635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/aYPkj2NtDergsDX2rHe3JcKu2TUi+kPfkt+iApdo8=;
        b=EX1gMp4jBGJMTnBwj8FSfZtn7ssYM1Xb7jRW0mpYfkl5QpCG7XHuQdIJ0l9Z09XH71
         x3uXEUeI6LMRv8N9134/Tmng4k2VPK07u7baaHstJiCXrkCFrsgrrncaPM4dE2f0104f
         ZLSMbXul4ltupiLpJmW7EKaoACTxH246IzdyHuOB4iSJfeMidhZy9mbi4wKPzAuTIF3b
         GI+bSrLAtmriSwCsRWEFmJiDHU5nzS9Ii9s8SBvplAJ99EppyqQ4w4BZ8vKrjqDxfNGG
         p0aT2OxptDU2MuuBY9sdA1CUoZ81e7D9qDkDX1VHCgn+E8NQfV+82Fhl3viBJJ8ZmjsM
         IG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725083835; x=1725688635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/aYPkj2NtDergsDX2rHe3JcKu2TUi+kPfkt+iApdo8=;
        b=qH/6oD4RCYYpVzRtSN5htAJpbocM5uv5Y9SN0z1fv//w2T5/pBVwo3aqDtcRXszWN/
         1tCq50GxcWiFskNQ5w3P367gqVBLMa3OHwlLTWyuyLOWz7rtnDyRiNcOzwJDIN8TTr6S
         VlLBztnaBpugL9M3JHUWh6xkyc7idplnjyj98Tl/qP0V/+J5+Ln5+Kw/7r2RVUlTHAhB
         jLID32yML1IGHULwsnGr3c9/okwKGqrn7sSpPjG7f9z1Q1NEHVwKg+Twv4S48FmTuv9R
         gCqUUo5/cOTGXZvrKK1zd/O468zzWgs4PqSjix0Sa4vOtiMp1rYCRPNg5MiPyTjXS+u0
         gJ/A==
X-Forwarded-Encrypted: i=1; AJvYcCVJ/IOQo0IK3b8auhipe0dSe9hM1KVSIXfV6HilWPBEx9e+KnK9S3afIyMvjiaJap7DLaKvyw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfuVw7Xlcpz/An7n/f2ciNL6ruOBDM/lD9SKx5UfjUGRbGH+7n
	VRs6c/qXRxpIlZhWH2eDmo/wFkvh2Octza8RSsTKGJQUztIOStb+
X-Google-Smtp-Source: AGHT+IGMvuTVKZ6LSJxB8CtCU4+d+sEou4o2/Fylk2vt34a2ffeFEJ4j/x7jh+K22k3uivREqt3WOA==
X-Received: by 2002:a17:902:d545:b0:1fd:9e6e:7c1f with SMTP id d9443c01a7336-20546b553bdmr14689055ad.56.1725083835095;
        Fri, 30 Aug 2024 22:57:15 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2053aa8cb4asm12027045ad.271.2024.08.30.22.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 22:57:14 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	konrad.dybcio@somainline.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 2/4] irqchip/apple-aic: Skip unnecessary setting of use_fast_ipi
Date: Sat, 31 Aug 2024 13:48:17 +0800
Message-ID: <20240831055605.3542-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240831055605.3542-1-towinchenmi@gmail.com>
References: <20240831055605.3542-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

use_fast_ipi is true by default and there is no need to "enable" it.

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

