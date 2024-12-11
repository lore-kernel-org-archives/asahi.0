Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A052E246F65
	for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 11:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916208; cv=none; b=FxuMI11tv1tEsF1cQlHldi/Eo/aS+tDVVsuyh4G+RUcgAkWXktbCQdA2IJ1tmVshcvWgBSEV4E48Liv/99Jfhy5qdJvlp/GEg6/FB7F+/7CDon+9miV7w2rjg8Nr3v5cta1PGgI3g4bLXaELpHyp3nhY1PRvz5M1Hh+EIBA/oZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916208; c=relaxed/simple;
	bh=7lcoJt3fEYxFRq8rAOGd84uCM/lkZcSDWF3TclaNims=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oVlC3NolRWRK4UNjtkj3BwoEiwKUTGLen8o4BsoU2niH3XEBx/UAwoAAasgD/ujmz3hGl8/HWCYaeE07LuguP+LV1oK7KitDk7ihUWzlDMTN89FneMFFD9/pRDVGJz8v4+8oqw78CHmSWoJYSUih4W95dDHNcbOUK9IE2foxb5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RlEmCH8r; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RlEmCH8r"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2167141dfa1so5429335ad.1
        for <asahi@lists.linux.dev>; Wed, 11 Dec 2024 03:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733916206; x=1734521006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlxPth3W7wbrCgZl9TutY0yGCH/wT/pCGymBpz4R5/s=;
        b=RlEmCH8r25mYs8TUa5vE84HlVdGMDpw/jHckbgZX65XLdG26NO+uo34IKiOLVWRqyt
         qRqL7nIZGgXj1JCOzLCkp09ty+HxRiuOhoO/tghvt0l7Z3I5UMiSQCwrdnmaKtmyUsQW
         Vy2kC2pDBe2vvRDOh1tNi6u49rQOFBOa5JIpzN7PUz82UzlisVuhV5LBv/MMtQl32PZu
         mQgVWmJfzwk0a2n97aoCsrpLmg6SrreRMPW1PTYisIXMQEmWfW6o9cOx8S5OEYA+dP3I
         agkmNf3eHiQrlkITDIKGwy0lcYc3EUlyrodllHCIewAH0ISEj64h3MkokORvqdNqAUti
         rLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733916206; x=1734521006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlxPth3W7wbrCgZl9TutY0yGCH/wT/pCGymBpz4R5/s=;
        b=dRafsNuz+U62CVBsNkHqTaxZeXUt8QI5qUN9s6KgkJg6G2VfVIR8uJC4zSp9Bf9Uu2
         lfmFVz8ok8vTv541HeQbdWqz6nTDYqPFEHWyiI1RXznL2VmRKMGlqBYK4QWDXWyGM/tk
         J9aDmOaaDxtrN7BFbI7EuBpYT8wP/Af97/twH+MVaDVsPg3ozUNFi/5d+21AKlChwnOt
         gIWn3Mp7atyxk/ftiHuedpuY5iXyLVqcB+g8N6KlmGwgpU0ef/bp8z6KWHn0DisAN5OT
         Z4IOFtuXHf12VE6HnZAmMOI0uiI29qBYN9Yzmb39xv2zlEw01iACtsRbYKQ+c7vRovLw
         rXig==
X-Forwarded-Encrypted: i=1; AJvYcCUz7eiP/8xe2E53k/om2fPR3d/lYZGJkSRaeIcCZVXe+0XcB0svgIcUTbfWJIIf8V30Vm7kZg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkA60rwpiWt7xET3/oyCz/KQeIlgxDJMst0up1vHZsfcY6gmUJ
	Fmtk5QeRtSZHce1ahnA4M5XXlgSH909vPdOtFREDPAM1n/94dbJ0
X-Gm-Gg: ASbGncufcUPWCYRfNppgmRuFKF5z0TDmandHFNC5JHoAHOHoMl5bRcx2K4wFhFseAyJ
	8ky9mVYCmr2cz4sHD5p/+SzD3eJaJdP/oHmHG94x3ZOEhxPx7yR8NHfivWlBTUQS5XE2DWk2but
	x+CAV8JjH+fkAYuuh0o6oljWTbAFGRgfms38xvMz/i8DgHmaD1sHYPTuBd9e8I9tzaMCmOzDtOW
	sglqGrhRtll2NEASmWwYpp+Q2TYg0e6ASgaWLwhu71u9s/NlnNggoDb/v5QbQg5tnpTDw==
X-Google-Smtp-Source: AGHT+IFMuiaI6I3IF80U3p4jkCdMcH2pHwrnp13N4Jra+xHLG9sBJnqMa1fKJOB7LKNxTMS5auBS3g==
X-Received: by 2002:a17:903:186:b0:215:742e:5cff with SMTP id d9443c01a7336-21779e6245amr31917835ad.16.1733916205923;
        Wed, 11 Dec 2024 03:23:25 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21650ccdc7esm48956615ad.133.2024.12.11.03.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 03:23:25 -0800 (PST)
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
Subject: [PATCH 7/7] cpufreq: apple-soc: Add Apple A7-A8X SoC cpufreq support
Date: Wed, 11 Dec 2024 19:19:34 +0800
Message-ID: <20241211112244.18393-8-towinchenmi@gmail.com>
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

These SoCs only use 3 bits for p-states, and have a different
APPLE_DVFS_CMD_PS1 mask value.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 30 +++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 0af36f911bea..12ee9123a1c2 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -22,12 +22,14 @@
 #include <linux/pm_opp.h>
 #include <linux/slab.h>
 
-#define APPLE_DVFS_CMD			0x20
-#define APPLE_DVFS_CMD_BUSY		BIT(31)
-#define APPLE_DVFS_CMD_SET		BIT(25)
-#define APPLE_DVFS_CMD_PS2		GENMASK(15, 12)
-#define APPLE_DVFS_CMD_PS1		GENMASK(4, 0)
-#define APPLE_DVFS_CMD_PS1_SHIFT	0
+#define APPLE_DVFS_CMD				0x20
+#define APPLE_DVFS_CMD_BUSY			BIT(31)
+#define APPLE_DVFS_CMD_SET			BIT(25)
+#define APPLE_DVFS_CMD_PS1_S5L8960X		GENMASK(24, 22)
+#define APPLE_DVFS_CMD_PS1_S5L8960X_SHIFT	22
+#define APPLE_DVFS_CMD_PS2			GENMASK(15, 12)
+#define APPLE_DVFS_CMD_PS1			GENMASK(4, 0)
+#define APPLE_DVFS_CMD_PS1_SHIFT		0
 
 /* Same timebase as CPU counter (24MHz) */
 #define APPLE_DVFS_LAST_CHG_TIME	0x38
@@ -36,6 +38,9 @@
  * Apple ran out of bits and had to shift this in T8112...
  */
 #define APPLE_DVFS_STATUS			0x50
+#define APPLE_DVFS_STATUS_CUR_PS_S5L8960X	GENMASK(5, 3)
+#define APPLE_DVFS_STATUS_CUR_PS_SHIFT_S5L8960X	3
+#define APPLE_DVFS_STATUS_TGT_PS_S5L8960X	GENMASK(2, 0)
 #define APPLE_DVFS_STATUS_CUR_PS_T8103		GENMASK(7, 4)
 #define APPLE_DVFS_STATUS_CUR_PS_SHIFT_T8103	4
 #define APPLE_DVFS_STATUS_TGT_PS_T8103		GENMASK(3, 0)
@@ -72,6 +77,15 @@ struct apple_cpu_priv {
 
 static struct cpufreq_driver apple_soc_cpufreq_driver;
 
+static const struct apple_soc_cpufreq_info soc_s5l8960x_info = {
+	.has_ps2 = false,
+	.max_pstate = 7,
+	.cur_pstate_mask = APPLE_DVFS_STATUS_CUR_PS_S5L8960X,
+	.cur_pstate_shift = APPLE_DVFS_STATUS_CUR_PS_SHIFT_S5L8960X,
+	.ps1_mask = APPLE_DVFS_CMD_PS1_S5L8960X,
+	.ps1_shift = APPLE_DVFS_CMD_PS1_S5L8960X_SHIFT,
+};
+
 static const struct apple_soc_cpufreq_info soc_t8103_info = {
 	.has_ps2 = true,
 	.max_pstate = 15,
@@ -99,6 +113,10 @@ static const struct apple_soc_cpufreq_info soc_default_info = {
 };
 
 static const struct of_device_id apple_soc_cpufreq_of_match[] __maybe_unused = {
+	{
+		.compatible = "apple,s5l8960x-cluster-cpufreq",
+		.data = &soc_s5l8960x_info,
+	},
 	{
 		.compatible = "apple,t8103-cluster-cpufreq",
 		.data = &soc_t8103_info,
-- 
2.47.1

