Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0632368F1
	for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 11:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916198; cv=none; b=PwMvZ18ZSXocUxhSXu2k/2U8HDYMp9VvL5cOkMnZI3wtBjb6ahNwbNpojMDQX9n243wA6xTHqqQXzRwP5xu+jcDCMyPEzQ/QDqEjE0HiRG4m3Bjlt8hX4w7la+9Y82r6/0zwAvIdktTA08rscX4H+5eg7njqaIEiuDNcFv0trB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916198; c=relaxed/simple;
	bh=xZAYewJHUZWNR4AiiFT7ZCFsiAmElXgtdpZlXkHdURc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twQzR29Mu6KP+grINHrO69QXgQprZUsN1h88ZUqjcwcECLpUV1qAQJUh40ujO/oEnnT+2gBFFbTh61x/nVU0zGpjmpQEnjX1TOImSswyFcOr7uO8Q5l1u66ykiK+5sEIcdTHBcYQi92HtyURhQpJuN1wJ43aPK/jB2TD3cRA840=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alNI52FJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alNI52FJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2163b0c09afso35131985ad.0
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 03:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916196; x=1734520996; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=;
        b=alNI52FJbllJQMNi1p9rj0ApUQPh7H8CBBeH44SCbCbVQgEoVOv6DBrBZfgEGssBnk
         Bs0jezrTedU6A43ImuE774aL7lpOu46RB82mUrBNJJWjd23gJF6rLXRaL6i5e5CZK+gu
         /U3ZGwUr6Q9t3WUqe4X81mBo3wv52hnBq6zWqebRoX2hM2HO4fRK+XjwgQuzKX0zZvAr
         vlynyo9cy3dBQOgaUZUEQe4yS06uJfo1ujIhiTlfA8/1wluz62P4YaS1nQPicWDKyXpQ
         jICVUzX3+4n1sBADKtPbhYpJUzzwgxcj+FCI3Pq+MTV0oOrVJoQe/0kTJjgDp35TdQQu
         uy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916197; x=1734520997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=;
        b=q8rlCG1zxu3MlLYkAFAtvB34qls4hgyuk5klej8BtZGEk2nvwJQZNZ4Z/SndIlT8Sh
         Bsr7QTqTHukrngOLr/i7JU7ZoiI0Hkh/nXfgC7ICXQoPTYxvk/ENLBh7XB2HVAVaWUP1
         S29eLGrxzYrQnoBef70f4shFnHPq8vFo797sBwJDI/LdBNTfw+BsVQShbTErBmAtTZ9C
         Owu7jh/6S2rZvgNTMPTcz7fIlmO35XKeqZClUXOKKirKievIb8iDEKYx+23Kj2A72t5z
         XhM3ew7KlqNvHo5eXSUwKmp0lDJ/OgLJGWAqipa8hxgyHN/lu9O9VRNlvq4504RXL/Bn
         wAyA==
X-Forwarded-Encrypted: i=1; AJvYcCUJQkEHSvPa/gmxKmIegVUt0JBZQmi4l+uhSa39ASYxA/ex2GsGr5JxWZ0nbAC4nnqqcP3nvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFLP70kq1G3BmsMRfdn3cpWIuclWRdZcABh8g5y8s0TBwfe7FW
	7pXyFUqLDPrbBq4YctXTTbnWsgVg3ouBG/cGWZgKnnxxhIb5MBM8
X-Gm-Gg: ASbGncuxX3gX+rTeSH0XBj6BlIYqT5XjLywtp363umL15QbYVu3RhG81dHTypKxkWqz
	o4sS5ehrQgYVUrIPSq4rb+9vp5L3meDsLgHDKKRB/6EmBEK9R6nD/DmczJXijGEYBbSAYHD6spM
	4Vss2vzTtk09zOiqpeXkX+JjQIqYigMEOPhy99xp5bRkjCFp7u1G/PFaMW/CMUjF0bl2zYSxk8d
	lV1PQl24j1tvhJIHJA7Lyt2zngO0hRTTWPA+/PcdWi0jwPVyhfEvvxk2k4Q4W9UvQ4HKg==
X-Google-Smtp-Source: AGHT+IH1hLAgeQvAxnVwe+D4VMDsSZTriCt++kQ7emPExGGKhpzABy5H4MFcc6Iy+zePAn8dZNzF/Q==
X-Received: by 2002:a17:902:d503:b0:216:6c88:efd9 with SMTP id d9443c01a7336-2177851dec4mr41331435ad.15.1733916196279;
        Wed, 11 Dec 2024 03:23:16 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:15 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH 4/7] cpufreq: apple-soc: Use 32-bit read for status register
Date: Wed, 11 Dec 2024 19:19:31 +0800
Message-ID: <20241211112244.18393-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241211112244.18393-1-towinchenmi@gmail.com>
References: <20241211112244.18393-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple A7-A9(X) SoCs requires 32-bit reads on the status register. Newer
SoCs accepts 32-bit reads on the status register as well.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 90e34105b50b..b27d261fe5a6 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -122,7 +122,7 @@ static unsigned int apple_soc_cpufreq_get_rate(unsigned int cpu)
 	unsigned int pstate;
 
 	if (priv->info->cur_pstate_mask) {
-		u64 reg = readq_relaxed(priv->reg_base + APPLE_DVFS_STATUS);
+		u32 reg = readl_relaxed(priv->reg_base + APPLE_DVFS_STATUS);
 
 		pstate = (reg & priv->info->cur_pstate_mask) >>  priv->info->cur_pstate_shift;
 	} else {
-- 
2.47.1

