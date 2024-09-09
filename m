Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54031B372D
	for <asahi@lists.linux.dev>; Mon,  9 Sep 2024 09:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725873305; cv=none; b=enxgSVp7P8+zw76mL6n4apqbLX0JEiL0F+DdctyTCBiBD/m0e7V9E/OI9KeWqwp9/SDxPiQWjph9b5qZF6wlUJJ9LiWsosikpS1eAdVr5ZN0AWuzJrNL5rMV7pr6vFV0DsIO374QKf+sAbYbJrv7bKMi4RM4f5m3LmKO+Ho9X20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725873305; c=relaxed/simple;
	bh=5lOko4x++LaiuMBYnIcL5wTu9SP0pMlfceld25rlKVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bniNrtMjxgP6I2tbEbxbGXC0m6iQrye6VDDD9uBPRs1h8Jn/DJUOObvo1qfprj8eDqUwIo6tNBqudkr9Tsn+Fv5dApl+w24AslilJKtLPr+xLuIlaIxZB4R4+OnR18Lw63Rb8xqCjZJMBlQ8Rrlcuc++aUgIllRx/6QMjucRuFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QoOmE5tq; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QoOmE5tq"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-718e2855479so1245494b3a.1
        for <asahi@lists.linux.dev>; Mon, 09 Sep 2024 02:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725873303; x=1726478103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KTx9T0QsthgtMWPrZGO+mOSHexmLZhoXS2lkiJJqmPw=;
        b=QoOmE5tq1BXuqxYrCLDzlR/hbBbZzUI5A3XqYlcbFE3k574sSeT4XgQZduf/D4lDYw
         falqTWdhSJI9wQtzfmwu/tdQQMPSFibms8z3UKUgOC4wDwE+iyj7u11N/QwnnSLnlNoQ
         WgI0pZkN8Ks/aSQeTMOqTfYbHRFsg4cXsSZjUpTdLWjkStYB8cOPZeAF+4bJt9S+6GYH
         8DjE0Yxy3kNLEpqyd+19cKd4DfS/GxwAB0Q5dZv3jqJGABxp+i1YBNQ1iu5vdXVIVKbg
         /8LcZ2QW4lJvBJTHjlWuLdFfCcpwEWSHUHJbPXFO4cm2b+oospygmzOD4bnM253vypeM
         XCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725873303; x=1726478103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KTx9T0QsthgtMWPrZGO+mOSHexmLZhoXS2lkiJJqmPw=;
        b=XgOOo49R6B+utdUOEBXkaeMip7djzO8n3W1YcirwNr1qYjWCWCIJzsoXI9/iI24cHJ
         WM4tHYEGN4RPN8G0gEvaqRq1SO2XoYZN3DVtg6vPSA05JZSV0U/oyrWOWeNgSbchBSQ4
         S7i7NGKiEyU/T6VKPjkdMsdNF0RejcOHX1RGAnn6/TyszLpsII1hRx1KlKUmv263TTw+
         +f/YeYz6ufDlu9McKQKTZpkRNiTMCzPjMhUaPEfR3+UySF1Hf9vjdh7gLahnDjeAFTOQ
         2oalydJcT1vQ+EazFXNNkBWcr1nue2hQ2fJP/zk6UOpp9E6p2w27FrRFc+PdeNRa9joY
         J6AQ==
X-Gm-Message-State: AOJu0YwMHtAkUBe7y3eFu0yiiqC2GmagNiNTelB/I2vajs2n8MXVmJe1
	oSnVt70SByZDiUzjPNRtgDENXJUasl/gDGgU8v9EjBoxCPBDaEF1
X-Google-Smtp-Source: AGHT+IFyAFMt/LIKFXTa3+bAyovdbUUEGUIYAFMyLkRq/6rL8sAHUjO2qqjXljlfaVO7kyqBr25C4Q==
X-Received: by 2002:a05:6a00:4b4c:b0:70e:a524:6490 with SMTP id d2e1a72fcca58-718d5dedc1cmr14550954b3a.1.1725873302845;
        Mon, 09 Sep 2024 02:15:02 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-718e596882esm3120689b3a.135.2024.09.09.02.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 02:15:02 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: asahi@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 1/2] arm64: cputype: Add CPU types for A7-A11, T2 SoCs
Date: Mon,  9 Sep 2024 17:09:59 +0800
Message-ID: <20240909091425.16258-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909091425.16258-1-towinchenmi@gmail.com>
References: <20240909091425.16258-1-towinchenmi@gmail.com>
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

