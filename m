Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964241FC7EC
	for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 18:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546554; cv=none; b=NyEPpD+wdLQzadllql3OTVzzn0fOTBTGE3i9ZRdloqxsqKuT0GPe/zN0dVGi883nfiv637ruENj3gODjjM15lobUjG/J6jqAS7b62j3IhVmn5bov4zzrRKLHE4J63wTj/jqKV6j/sNGbJBJcXxObXC0HQ9RfhwwrIUI7C4VNA78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546554; c=relaxed/simple;
	bh=xZAYewJHUZWNR4AiiFT7ZCFsiAmElXgtdpZlXkHdURc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PVcj2w0NCieoDUxUlBzF3js8l8kMknFNhgsv6fkQPmmhGoR9NR8y7gTBInvIOarw5Vs2hAb5Bi0MaVxfrysTBaBpUPxn+cNkZWKwiaFeGSUT3y96rJ8VdwDmuUuuVLyhqFdcZhyDjGP2LWccjqlIG5i6ssERcKDa/P68SCyukM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bzrsdcdo; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bzrsdcdo"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2166022c5caso56297385ad.2
        for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 10:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546552; x=1735151352; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=;
        b=bzrsdcdoIQOe51eB1OH4UNflIjuzka8SvVmnU5zL9f6AabVhnfYqiC/dXM/YhsCwZd
         LzC6gdYfF7hQxZbocdrwRU5/zPd/2zYMxlCAq96Izfmbc/SRaStpF7pf2DKLUfb2T5BE
         Tl4AP+izQ/a/FfnfSizbJqRF5C3UHHItyzWSGMY5NbDY7YP6nZdXXc/WrGjmIzAN6jfL
         JpuVqNDgzHHXIUyQbrh7dbxgiBQufsxRPCK5WQD68bX/Z251ykLANVywbpOaw7cDg9dO
         UGdwcXG61JjOJ6y3G82ljNHyx4duKaisFvIRuwZfMVS1sf6dOmrTJJ7gIq5ir8NkhpHr
         BT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546552; x=1735151352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=;
        b=ooUllqexYLJInvRxzyuiO1AgH/xl0OB3Hi9IGKOI6LGb1JcgfrzLjkxCQ6o/MuRwAV
         cDMyCokFuWf0d2bRyjRLkZDDZlRwTgRwyssuGaqYUsdGRkkrbiHtrI9FeoCygXTuVtM7
         vye5NVOv6yfLymtRr0WhpBkp0rMlwgoOtHgpRCM5jXLWCenLkQCk5KIr3d7pmORsMyo8
         4doj3dZKSrrNkHrtH8S3VkoeIHRBMqaxVdAt7vf1TtR2wIdarjt0SEqP3HdLBaSj0N9Z
         vjAmCc1K6r0vhKq/gzruyXHy/fSiXD0HTsndfaP++EKE1YcOPUKEN7eb8bmueBRaHovd
         Whww==
X-Forwarded-Encrypted: i=1; AJvYcCXyRgwGVYKpqMR9o2KU66Cf1t9l0R9bcRYVgNdp+ohRQXgVYFOGbbMYp2p41tH3YMskvv5adA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8fkRWqfTszvUXrbuGDKA/3e0logH68xt+nMYEhppcuLIi9zzt
	e8FaOWpikSgKyT4uXmxE0O4WwDO5aSTCWu4FAxijKAUj9/MrVTTD
X-Gm-Gg: ASbGncuo3HASCFy+KhD6GhSM+TPqul12uciw5oPgF/rZeMTryjarPqtYJNjAy+Pywvy
	/3X4SwNRnrtC1nh+9nZlrj49p6yPltwsV6RVTwX7YNW/KSdAcZ1HB+OTZM01Bb3oKGjREnZgokK
	XAp8DPRBnv2Pxo7dOlx15gTkjrafu4KSYu5ObAnPQHwi1gK2u3pexjZVTSqRh+lgOOFDsx+HORm
	7nGyE8MjUk6XpwuDsmgWc7uIERq2jr+M054CRTuPLx3qois8jdaHPMe6g==
X-Google-Smtp-Source: AGHT+IG6QDCToV6vGIVydE11zTBp/e2m6aHQJC8DmNhZClGIJeJEeU+1619CoVuk/ihQMDgpM2XnQA==
X-Received: by 2002:a17:902:e546:b0:216:3e9a:89e with SMTP id d9443c01a7336-218d725a7b1mr45675445ad.35.1734546551897;
        Wed, 18 Dec 2024 10:29:11 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:29:11 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 4/7] cpufreq: apple-soc: Use 32-bit read for status register
Date: Thu, 19 Dec 2024 02:25:06 +0800
Message-ID: <20241218182834.22334-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218182834.22334-1-towinchenmi@gmail.com>
References: <20241218182834.22334-1-towinchenmi@gmail.com>
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

