Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF39C1D54E0
	for <asahi@lists.linux.dev>; Fri,  6 Sep 2024 17:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725642930; cv=none; b=tAvcASqcUchGYrrKn+LbJKMG1qQSUgu+WOneeaqB9fZCsqsdv7SjcyhJHOHdfmYXfq3FkdwycGlxGppDgrPETX8OhZiMtpvt6CJ2LjhpxaF8bDfstCiZWr2PtdmnqVNSUeUFujr6y9GiR+JkQ/WhLpG7csOkYywE7Diq2w2rmco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725642930; c=relaxed/simple;
	bh=uqVFwUB/0TxQaJs2TOgKnw2jAoMSxxHld8KhtvpAURw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ImuPbRxfrqezJTVPaP85G9nHBeLumuXWsXyRyuvB8gwdZkvFgJFVoibAC2dxnkNWq1dXbOftcnikWwGYhHaiVpOrJ5Qwth0n3tRX4Fm+XWFSnAe9pmb7WO8CE3FafslQZl8BTSG+uXrgZyeD0cuCHOApC8IJigmVQ3yuYMhsmuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yjr8wgn9; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yjr8wgn9"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2da4ea973bdso1729170a91.1
        for <asahi@lists.linux.dev>; Fri, 06 Sep 2024 10:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725642928; x=1726247728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2Awb8QHiwgK4hQKj8EI8RJlryPJ8iCefANxC9lVPtM=;
        b=Yjr8wgn9MU0sSl+4pio2wS5gjxd6QE5DPHLZXYC+K+zNjo/AVSdNITEXzweuJYiH93
         57yUcoRKixM1gl/bDn4cukpyD6PCFEUlwh/aNG4Y+s+J3EGveEgQWAQe/vaY7W0xUPin
         AXIGVXW1ecRjLrArUj0mgj1gwy+b2tBjLSjl0ziP8wsTSUsoWg91baU7l7A9i3iEqrLM
         lIoRH9TDzTb1edKOyIxie6Hnz7Xewr7maO0zETCtaKDgnLiMYmciduYjSJO/f7cQTpMj
         CZZx5u4IabBQbUYdU/KN3citTKjZZOFgFa98RS5zbaYiZ/Arz4k/Xzakd03OErpp/QAh
         vCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725642928; x=1726247728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2Awb8QHiwgK4hQKj8EI8RJlryPJ8iCefANxC9lVPtM=;
        b=LYGlKuOTuSMIJmo6HbKe2cverjmCwWh86fAN5TX10Pkr8Qbyp5kYuD8nW/2Up3It49
         oGlENlFzvOIPQ/E8S4AuRELRvJBtxI4YIMIEipKTTZ6Ju2jfVuEV3A7B+iox+h0CTIUW
         5qsLb6/2DiG1At4MBTz2KJj2ud6/mzv1gu8pHEmOO1sRmloOHDsHqRpa843BIl7QOYZn
         rIt8DYcwiCbDgcFj10Fdz4NKmC3q5eR0TbK+yrgmhcehHoL0cdruStiEl5rESpIIa8ww
         qlmQa6YwqfMIbav1ycN8jwk2hWpm+7Anan1JDAfyHsOZonIq5YJcu8k+2o+JgJRXecrE
         YEVw==
X-Gm-Message-State: AOJu0YxdMapUKWWDzF2gCy5g3/mQIyozplMjziwn7UShbmk+DOZAThu4
	+Q6xFEC3BaBUgoQvZvlLNnXfh69P8hp/KwWD+vpFRoGgUQNq47Oc
X-Google-Smtp-Source: AGHT+IEitKjL9pf51BQRfyrnIhp+JSQo2gkjFGgr1MpgdrNgRy39LdtoUZno7Bc9XWCc1kIaXZP2HA==
X-Received: by 2002:a17:90b:68a:b0:2da:6812:c1bd with SMTP id 98e67ed59e1d1-2dafcf1ac51mr112698a91.15.1725642928140;
        Fri, 06 Sep 2024 10:15:28 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dadc10fa99sm1841519a91.39.2024.09.06.10.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 10:15:27 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: asahi@lists.linux.dev,
	~postmarketos/upstreaming@lists.sr.ht,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND 2/2] arm64: cpufeature: Pretend that Apple A10(X), T2 does not support 32-bit EL0
Date: Sat,  7 Sep 2024 01:13:26 +0800
Message-ID: <20240906171449.324354-4-towinchenmi@gmail.com>
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

The Apple A10(X), T2 consists of logical cores that can switch
between P-mode and E-mode based on the frequency. However, only
P-mode supported 32-bit EL0.

Trying to support 32-bit EL0 on a CPU that can only execute it in certain
states is a bad idea. The A10(X), T2 only supports 16KB page size anyway so
many AArch32 executables won't run anyways. Pretend that it does not
support 32-bit EL0 at all.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/kernel/cpufeature.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 718728a85430..458bcbc4f328 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3529,6 +3529,29 @@ void __init setup_boot_cpu_features(void)
 	setup_boot_cpu_capabilities();
 }
 
+static void __init bad_aarch32_el0_fixup(void)
+{
+#ifdef CONFIG_ARCH_APPLE
+	static const struct midr_range bad_aarch32_el0[] = {
+		MIDR_ALL_VERSIONS(MIDR_APPLE_A10_T2_HURRICANE_ZEPHYR),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_A10X_HURRICANE_ZEPHYR),
+		{}
+	};
+
+	if (is_midr_in_range_list(read_cpuid_id(), bad_aarch32_el0)) {
+		struct arm64_ftr_reg *regp;
+
+		regp = get_arm64_ftr_reg(SYS_ID_AA64PFR0_EL1);
+		if (!regp)
+			return;
+		u64 val = (regp->sys_val & ~ID_AA64PFR0_EL1_EL0_MASK)
+		  | ID_AA64PFR0_EL1_EL0_IMP;
+
+		update_cpu_ftr_reg(regp, val);
+	}
+#endif
+}
+
 static void __init setup_system_capabilities(void)
 {
 	/*
@@ -3562,6 +3585,8 @@ static void __init setup_system_capabilities(void)
 
 void __init setup_system_features(void)
 {
+	bad_aarch32_el0_fixup();
+
 	setup_system_capabilities();
 
 	kpti_install_ng_mappings();
-- 
2.46.0

