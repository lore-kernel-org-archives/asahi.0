Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3495205ACB
	for <asahi@lists.linux.dev>; Thu, 12 Dec 2024 07:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733987095; cv=none; b=ZicvEkmmGwk0dfdWG8ykjASI/Gly4vtjq1uRxKOaEJdUUqccFkWzWRFzNUO4GG/uDyEaF+63HivH80im75BSdnuFqZs3ZOwRZj17Q3i6uZi5xX65rtDEu8cWNaLEvx+C4NFR1N+g1w4zrOXe1vm2WjxPUU2dUODY7B1RMCysMkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733987095; c=relaxed/simple;
	bh=xZAYewJHUZWNR4AiiFT7ZCFsiAmElXgtdpZlXkHdURc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZ/GnWvnQlds38IAxBgfbUG49Seq6kLHCXYlCqfySDyn1ZR+Ua1nK+7JXVPzwCG35IqRQ3xBmWOOgrwISYAQfrZfPXDoauR7gVGEku8rFcGyorTMG6rF9I6yYMcFczCLEq3LJL3bBmRdgxzX1KPK6fRWmQpngeMTZjaLHBiEDT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBDFv+ya; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBDFv+ya"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-725dac69699so248329b3a.0
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 23:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733987093; x=1734591893; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=;
        b=FBDFv+yav8KeNVyAxnkfNrIYNtFvGbaXvz3Nr9Xe/1hxcaBpjs29CMDnluzx+7/VXO
         yS98v3YUTOnEEpHggERBwvQHRHclIvRKPHiUf+hgjxwPaSk/ylm0luIsSE7ia0/8yO8M
         mXq+jr29Pa3nhjCucKWUsUURSlfrcoKMsAe+eQbAp7WRxMs9xzc/IXyeCIp7oGrD23U1
         Q8YQzD8wqhNFBFP67gqqNtHWPRqPNxZQuKbDl2VHewjfeFYi8gTn2abAZtnMgWcHIal6
         kOf1cf3gFdtk0Cr/UhdVPTAAjbBws+/x9JlOQxFqn/E3+Q0H9Kre2rx5FUKBXTkTVKHp
         IA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733987093; x=1734591893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WbzFAeUuXXanJwe/RhcZGcox5IaVXp9hGHM//yffMwQ=;
        b=QCmFwlIh9eP6IU9CxeQftZ1yWtGGZH0+YRcED1N6QTyROW8T0HL25RRngK6NzEd0Tm
         1oD5GvzhuO1EP0vtl3iUWazhHZYGs7TodaDWEQvPY6BuTN4IDtrd5g4FQAbo7cU+jjeb
         j+1nzR6IyJXicnTmhKUsJyTCTnmXxgRABqduN335ruFQn6g6GOKJi4ggR4k3Lw8f/Abl
         RL3QblOXqUzukq94Ni1krwFj4d5IlKXC3YTa6f9EfL2Q+hO3C+ASGj10AH9NTVzUn8h2
         gIkCLbSWRGMRkKXB+7XT2slF8Xui2NnjB4CD/f4ABzRqGK27kCVydpsdQHlSjruMgfKx
         KpKg==
X-Forwarded-Encrypted: i=1; AJvYcCWUm/MxzI8QvTtOLnuY4TU0UVlYcGuxvfhp3TDs0GH5syPbbPKDJNswVHilStmzO1xFMI9RYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8LpCbYkW1dOyFUaCcV19gS960UvfqHGoAXd28kqVB6ZQINZkZ
	394NdJf5vT/KYwKbmYnAGZfRnC8+ATfB8Sz6EhMJBKAJywbGgMaWO2m1Q5d8
X-Gm-Gg: ASbGnct4SfOJGp4kagUfHEAu96iRDnaoCXc5bTGog6e9/JrzLewENiGyp2bDKmuzr53
	1klcWOBFbbCCvcjY0UeZX9450wQ6HHXfV+8RFWLX9S9D+5xyNk57hndu3S/UvAyRby6fV5jTBFU
	wpjykAI6ru7QIKWZvzY4iuoz4o8x2eyYzNNBqlks+fls26gl7+QGVYAw1+2G16nZtS+rGm7ecSH
	oBrPh9rGE0PzbpU/bdoxVJNOr6ZPE1EdTy/z7jMiDIgJ7RwbsRtP6OQOsH/GPcwMc0TUxTx
X-Google-Smtp-Source: AGHT+IEmXq444oBwmD5u2gt6hQ4Y1b6qVPA6zh/gRHg0XG/Uu/LCdJJ6Nmc53XVFX072F+jsIRC8gw==
X-Received: by 2002:a05:6a00:3e09:b0:725:30f3:67d8 with SMTP id d2e1a72fcca58-728fa87787bmr2990369b3a.0.1733987093085;
        Wed, 11 Dec 2024 23:04:53 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725ee10f928sm6519386b3a.32.2024.12.11.23.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 23:04:52 -0800 (PST)
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
Subject: [PATCH v2 4/7] cpufreq: apple-soc: Use 32-bit read for status register
Date: Thu, 12 Dec 2024 15:03:03 +0800
Message-ID: <20241212070344.3858-5-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241212070344.3858-1-towinchenmi@gmail.com>
References: <20241212070344.3858-1-towinchenmi@gmail.com>
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

