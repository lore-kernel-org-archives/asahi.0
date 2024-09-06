Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3C654648
	for <asahi@lists.linux.dev>; Fri,  6 Sep 2024 17:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725642922; cv=none; b=bwTNallX5FTxGgOuetnO9G3Xc9FGekav3Uu4DLqg1+xM/48ZwjGyLRJyBPQCd8retf11NOBUGIRMvfSfgACcg0ucK3cP8zYuE1v1pIolUVP2HcTzdqUw+CU6sgtT+fX3peyRtGdaf+ZOkONzecltozim+6S3eqhonqed7kJfKl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725642922; c=relaxed/simple;
	bh=5lOko4x++LaiuMBYnIcL5wTu9SP0pMlfceld25rlKVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MddKy2kd7ZDPMw1JJFJAkd2X5Zer1PV0sbBqhtkXclennGHFu2il1URNX5eW8Nq4bs9GF1h+AiUq1KUOEJ7au3BCbE0OGUPwgSBXgsIFxtpDex3yFb1Q/3SN94NtKYSMZK7CjOL/VOB4BxWafj4XU1KNaG74XBmeN69IpbR4eWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/KXX9Uz; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/KXX9Uz"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7d4f8a1626cso1741884a12.3
        for <asahi@lists.linux.dev>; Fri, 06 Sep 2024 10:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725642920; x=1726247720; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTx9T0QsthgtMWPrZGO+mOSHexmLZhoXS2lkiJJqmPw=;
        b=b/KXX9UzAk/Roe1t8pNcLGU+SHZR6BWp2YnjenRmr6wCp7VM4GKS1XHELC1PFpRzD4
         TFAkVAE32CpSBWVsmrAZNPqQtcU8eKt3WCBoTn4GTeebh5XbajnN3kxLwwGqwbt4yiOz
         33jQaot8QCjbiv+1otqEDHiPL6OjqZpfYtG4jTKRVTBLoXXgSvaIDE/7QM1m4LbIWF06
         8LV8Of4icgnwMXprBYPzaGwbZz+T8oPj/aGP/MSSAm44BQNXXvlGODQI5Q9l+ruw8+qK
         Z/JrG7MO9v592ynu3iEAr8raZSlgSuy3AVJLzoXGcsROlibk39b/Pl5mCnExR+kX+jwy
         9lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725642920; x=1726247720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTx9T0QsthgtMWPrZGO+mOSHexmLZhoXS2lkiJJqmPw=;
        b=FOM6RZKVrD4UzCYBOzQgB6bVilgZWrsb/0RlpCukA3pRo6/iRgpQZeXsNpOePQvb0a
         6oo2g39XpT8HxWuO4Vrfp3FFkLblv6gdKham9vGIubyeWfs8hyJw0Nt8TurWXmaSkoog
         rV1FlxvOefuYdiAXm76DxQl34izNC93KGPAqekkDHDEY91pQN7XsdkbkKvLuRYYQZo3V
         PTlIlAivXB5U0zNvfZzvIYUqR92WysRZKadDJSvbT7pgeCSr3G8G16d40PnO41RQo0P3
         yoLK5PsTdtF6vIM2l16wqPxb+IYe7JuMW4dt6nkQSZy1beRhCatfJdwOLbKsPLqBtkZU
         OUFg==
X-Gm-Message-State: AOJu0Yy1uDYsOvzmCOvgr27aTAOnpxCoSRWzF+T8rFWsRWFfYp9kd9Jq
	uhx2LNXanIXwYu8A6pwMeLxYaFHPEXJ6BnP+xzOFwOVqZk9Jimt/
X-Google-Smtp-Source: AGHT+IHFpxzGKP7uZ+bLuIto3ZkdFlTSlbTArs9pk4dQhGEvEew0w4wkM3mOpXuijDV8JQXfBH9a8g==
X-Received: by 2002:a17:90a:348e:b0:2d3:d7f4:8ace with SMTP id 98e67ed59e1d1-2dad4dddd7cmr3729535a91.8.1725642920458;
        Fri, 06 Sep 2024 10:15:20 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dadc10fa99sm1841519a91.39.2024.09.06.10.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:15:20 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: asahi@lists.linux.dev,
	~postmarketos/upstreaming@lists.sr.ht,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND 1/2] arm64: cputype: Add CPU types for A7-A11, T2 SoCs
Date: Sat,  7 Sep 2024 01:13:24 +0800
Message-ID: <20240906171449.324354-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240906171449.324354-1-towinchenmi@gmail.com>
References: <20240906171449.324354-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A10(X), T2 types will be used soon, and the rest are added for
documentation purposes.

The A9 is made in two different fabs and those have different part
numbers, and the TSMC cores are also used in A9X, so it cannot use
the usual naming scheme.

The A10(X), T2 performance/efficiency core pairs appears as single
logical cores to software, so both the performance and efficiency
core codenames needs to be included.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/include/asm/cputype.h | 42 +++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
index 5a7dfeb8e8eb..f1720158a54f 100644
--- a/arch/arm64/include/asm/cputype.h
+++ b/arch/arm64/include/asm/cputype.h
@@ -129,18 +129,27 @@
 
 #define HISI_CPU_PART_TSV110		0xD01
 
-#define APPLE_CPU_PART_M1_ICESTORM	0x022
-#define APPLE_CPU_PART_M1_FIRESTORM	0x023
-#define APPLE_CPU_PART_M1_ICESTORM_PRO	0x024
-#define APPLE_CPU_PART_M1_FIRESTORM_PRO	0x025
-#define APPLE_CPU_PART_M1_ICESTORM_MAX	0x028
-#define APPLE_CPU_PART_M1_FIRESTORM_MAX	0x029
-#define APPLE_CPU_PART_M2_BLIZZARD	0x032
-#define APPLE_CPU_PART_M2_AVALANCHE	0x033
-#define APPLE_CPU_PART_M2_BLIZZARD_PRO	0x034
-#define APPLE_CPU_PART_M2_AVALANCHE_PRO	0x035
-#define APPLE_CPU_PART_M2_BLIZZARD_MAX	0x038
-#define APPLE_CPU_PART_M2_AVALANCHE_MAX	0x039
+#define APPLE_CPU_PART_A7_CYCLONE		0x1
+#define APPLE_CPU_PART_A8_TYPHOON		0x2
+#define APPLE_CPU_PART_A8X_TYPHOON		0x3
+#define APPLE_CPU_PART_SAMSUNG_TWISTER		0x4 /* Used in Samsung A9 */
+#define APPLE_CPU_PART_TSMC_TWISTER		0x5 /* Used in TSMC A9 and A9X */
+#define APPLE_CPU_PART_A10_T2_HURRICANE_ZEPHYR	0x6
+#define APPLE_CPU_PART_A10X_HURRICANE_ZEPHYR	0x7
+#define APPLE_CPU_PART_A11_MONSOON		0x8
+#define APPLE_CPU_PART_A11_MISTRAL		0x9
+#define APPLE_CPU_PART_M1_ICESTORM		0x022
+#define APPLE_CPU_PART_M1_FIRESTORM		0x023
+#define APPLE_CPU_PART_M1_ICESTORM_PRO		0x024
+#define APPLE_CPU_PART_M1_FIRESTORM_PRO		0x025
+#define APPLE_CPU_PART_M1_ICESTORM_MAX		0x028
+#define APPLE_CPU_PART_M1_FIRESTORM_MAX		0x029
+#define APPLE_CPU_PART_M2_BLIZZARD		0x032
+#define APPLE_CPU_PART_M2_AVALANCHE		0x033
+#define APPLE_CPU_PART_M2_BLIZZARD_PRO		0x034
+#define APPLE_CPU_PART_M2_AVALANCHE_PRO		0x035
+#define APPLE_CPU_PART_M2_BLIZZARD_MAX		0x038
+#define APPLE_CPU_PART_M2_AVALANCHE_MAX		0x039
 
 #define AMPERE_CPU_PART_AMPERE1		0xAC3
 #define AMPERE_CPU_PART_AMPERE1A	0xAC4
@@ -200,6 +209,15 @@
 #define MIDR_NVIDIA_CARMEL MIDR_CPU_MODEL(ARM_CPU_IMP_NVIDIA, NVIDIA_CPU_PART_CARMEL)
 #define MIDR_FUJITSU_A64FX MIDR_CPU_MODEL(ARM_CPU_IMP_FUJITSU, FUJITSU_CPU_PART_A64FX)
 #define MIDR_HISI_TSV110 MIDR_CPU_MODEL(ARM_CPU_IMP_HISI, HISI_CPU_PART_TSV110)
+#define MIDR_APPLE_A7_CYCLONE MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_A7_CYCLONE)
+#define MIDR_APPLE_A8_TYPHOON MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_A8_TYPHOON)
+#define MIDR_APPLE_A8X_TYPHOON MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_A8X_TYPHOON)
+#define MIDR_APPLE_SAMSUNG_TWISTER MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_SAMSUNG_TWISTER)
+#define MIDR_APPLE_TSMC_TWISTER MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_TSMC_TWISTER)
+#define MIDR_APPLE_A10_T2_HURRICANE_ZEPHYR MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_A10_T2_HURRICANE_ZEPHYR)
+#define MIDR_APPLE_A10X_HURRICANE_ZEPHYR MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_A10X_HURRICANE_ZEPHYR)
+#define MIDR_APPLE_A11_MONSOON MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_A11_MONSOON)
+#define MIDR_APPLE_A11_MISTRAL MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_A11_MISTRAL)
 #define MIDR_APPLE_M1_ICESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM)
 #define MIDR_APPLE_M1_FIRESTORM MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_FIRESTORM)
 #define MIDR_APPLE_M1_ICESTORM_PRO MIDR_CPU_MODEL(ARM_CPU_IMP_APPLE, APPLE_CPU_PART_M1_ICESTORM_PRO)
-- 
2.46.0

