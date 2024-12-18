Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5901FCD07
	for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 18:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546556; cv=none; b=bYU6BNlxfeC+e5Y6H3UzbMqyjsM5z9ILxqNS0zlKpf+LdJZYJWmMHBGfRsvjLURua49oB7t8RO7L/x7t/7NbSWlp9ZQApECj2i/GggRaLyDNl7XAHsdAIBt1At8/DQfDkr79XwKDk1/WP6Xg5nR8Xwhb0YrEnrMH62yK77M0Ez4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546556; c=relaxed/simple;
	bh=lSmc5lpStkRdh6T2UaHkJlaMrEahYyD8GNIRGOk35wk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EV6S+ZWzG6Jf7ujxUG+VRvMdMGJ9b4h3SDxYd6VDasq96TPgIxhWf6CBSfvL4puTzauA5eoBTBIi/5ENWgnIaA8kD53mZ2LFjDZFbD9NMi3yqQTzC796ykSnlPc/ilwhrtuh4Tg4unBoFf+PtMNQbdP1RaiTdGy6d3fQVYmHeqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hv9uDI/U; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hv9uDI/U"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2163bd70069so108575ad.0
        for <asahi@lists.linux.dev>; Wed, 18 Dec 2024 10:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546555; x=1735151355; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=;
        b=hv9uDI/UsXhPeuqbI9C8ox2btbX6C8DCOrn4LAVoqiSFlVPqPTW+6ea7Yk1FTIQyAx
         YOuxToG3BNpS+mZKJdI/pd+h8QPq3LOSBiCpD2b0gaOSx0hx65MwS0VKok3Vwm5Y+ApY
         Yr+qcFdRz6lZ0B5c4s7Ma+YVpHzP8m/CLhtaoX4+fuUa3aLT1c/f7atleReD0BRY5PLG
         T29gD8QjJetUdcNEsLdGnNnfU17GohZDLRpfL2XmjEHUsIqwBmQk7Es10FDPK88h5ybk
         C/ObwWu5tdoPzGXVgdDyNJSK6qpw/tm2lhEnDAqrbMFfIzFNjUIQkOeufrb8nU6hYkva
         14ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546555; x=1735151355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=11W4ToO5h1HZTorB4p+IfX/arkj3h4R3MbzsYg+yGqg=;
        b=qq98uQTF/DYIAu3ny92K2dwUB42PmaQfkbFSTYAUGk35GEN+XTE7RkrT2DnPTtVEzn
         wpcykjHuvoG+o/XbAZcxeZT0bTjD3hdP11Z5y237iowAqOxonXoWjZ9vL4q3Fi2ksXU3
         IfEM3cZ7miRWbYrs8eVGQEwk42jVRaVUUcZ0hEqQmuQAAQPC6UdVtGSn6mgsHCDB/QUp
         7LOgOc9z83DSkE6jjWvtwQpC4/5Klphqp9R3gkoNqnhG7/3gG8OF8Cx/M8YTC6/GrYJq
         Tlm7QHyqDNlYa8yQ4iptl1aM1V492grmMkGkDg3Ev0Fs6Ww42bjjlcbuWPkUE+aVogBi
         N3kQ==
X-Forwarded-Encrypted: i=1; AJvYcCW432sl+SFCcSygbQnJqgGc12ssF6QtI3TvnPCs3X4sYVBSb1JWLKEhqbB+8dOS3O3NzVRSow==@lists.linux.dev
X-Gm-Message-State: AOJu0YyC3vb+8Dy6j6n3lBlzsPLnX46NTLARbbbbvLLc9AKO/bK+t+FN
	1Hmef51XwqssENRpsZZpYYyr6Phm8ry4I18JhtzXjvNq8Txrbql6
X-Gm-Gg: ASbGncuXIgT8oZf4NAdj7tr8BcD6YmuNm9TRL777QESgsjNEiRea7DN8sr8XU1FFZ7p
	5MZLKqlAmRXqEULpL9vRnM1UL/mncNwVhPBCH+z4INhzQvZRu+qdTb9mlIyME0VlNlb9QBLGz0f
	K97MgTrEoMDMJZ7RiAEd2c+oqTAVdT/F+jTlnEeWhAX8Lw9cNfF3X4zetMfHs/leRrHLNZmHGKC
	1kWftGh/u35tjTOgcLS5DhypWnucpconoS9KpmOL3X7k6YRiUCLenK+9g==
X-Google-Smtp-Source: AGHT+IGGkzD5I1MEo0iKpf3ViMZnzuOuLHWt5lenYWuouWbqfIDA4yXHbjCexInJBE+6e0MeVf9ggQ==
X-Received: by 2002:a17:902:c410:b0:216:56c7:98a7 with SMTP id d9443c01a7336-219d97f7eb5mr9892435ad.53.1734546554836;
        Wed, 18 Dec 2024 10:29:14 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:29:14 -0800 (PST)
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
Subject: [PATCH v3 5/7] cpufreq: apple-soc: Increase cluster switch timeout to 400us
Date: Thu, 19 Dec 2024 02:25:07 +0800
Message-ID: <20241218182834.22334-6-towinchenmi@gmail.com>
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

Apple A11 SoC takes a long time to switch. Maximum switch time
observed is 345us, so increase the cluster switch timeout to 400us
to be safe.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index b27d261fe5a6..94e57f055a5f 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -53,7 +53,7 @@
 #define APPLE_DVFS_PLL_FACTOR_MULT	GENMASK(31, 16)
 #define APPLE_DVFS_PLL_FACTOR_DIV	GENMASK(15, 0)
 
-#define APPLE_DVFS_TRANSITION_TIMEOUT 100
+#define APPLE_DVFS_TRANSITION_TIMEOUT 400
 
 struct apple_soc_cpufreq_info {
 	bool has_ps2;
-- 
2.47.1

