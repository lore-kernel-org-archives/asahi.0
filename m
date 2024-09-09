Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6041B3737
	for <asahi@lists.linux.dev>; Mon,  9 Sep 2024 09:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725873307; cv=none; b=SYOEtWR7RnuxbXlqJZrrilGwUQaEwG5GMIRTfHLsxHYFBAbpXXIL8IJqidSgJNzNRmRWMKPPLB9uJYapJW+1kp69YS7DzmPDg77IYgUKkte1sjLNK+V0qheZNddxNE+dGnEEK8lZe7ET2/u0Wd2oLfZKywvlvQE4Ld/UvoXLS2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725873307; c=relaxed/simple;
	bh=YU6QP8uJtGFoIVYhmGyZCVl9ofUYe6UsMilEzmxLu/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uuwFDnfiSdZq52LUCvfW5UFoSYObzr4ErR0Hxg7HikNgaBQGRGOoTh8DxbFf1d/lWZiNOmANv0rIXb/kcgJwj9DVcUTkEj2I7lGbFSvXEyrxknj+m5FpH9C/ojgBdProlWPFho91F0Aj+hD14XDo4PwcG0Xtfvd/eq/KwJuANpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NS5Deuyc; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NS5Deuyc"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-39fbf29379bso13028975ab.0
        for <asahi@lists.linux.dev>; Mon, 09 Sep 2024 02:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725873305; x=1726478105; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Eo9sJgLOWOaaCnwXfrOB5SuCDRwkFg5JIzaAB99dcs=;
        b=NS5DeuycQ79oFyBpIXdgNc17PPcF3GkRuxrXshzVtIiTg6UngTtbkOjXXAaxeZ6x5R
         +Q+I/Ur8sFufgy5Aef8Mbdj9o8yFDdNt0EFwZO8ug6m19obnMYNy6oGVtSYRo09PpTHD
         BoWhbHjH9LgDuLXAbBshh2jnzRoz5+Nz+Xva0Pm2qgPBW+pnHIr/MZ19g49FUV4CUcVY
         BGK0owVksXIAGMmEL0Dw7x7muVyYn88hSWBXMKCiRPj6vo0Wphgzh/eEM4w7wJCB54sF
         fzmgQAFScPr76SsCf50glgAdYYaIkNQkA27qV8ZkFs84bdcYRUI5iRKe7Pur9WW92TEK
         yYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725873305; x=1726478105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Eo9sJgLOWOaaCnwXfrOB5SuCDRwkFg5JIzaAB99dcs=;
        b=q8z8wii0xuoVbFhvZun35IDOs5SeVGQBS7o6yKPVuNQV7s055rR46qnrGqQw9qxbN9
         jYWX1Bmt4nEYdmlz8VDMSxYlTaMWj/qQdjIv1TZEkpyIvF8zugDGCwFmB3L/4oMq9ZRb
         G3h5TQQoH+eDq5eXqRXuCdqaQ4BkVUqQD09HKWDL7/F8j4cvCnoRHuLt1n3fnVwqXAMv
         SuUN5gGSI6bSFxgtvDw21GTZkNlP3/lu5KtUDAr51Mb7w+Nb+gpG6Tuiw6i55LrV+9pS
         u+Mk6vpru1NLHk8lLzAcjFYOT/O3TZEhHFfGCJ1mttoUYUi1awDJtNU85AnRPZPR+pdq
         jqRg==
X-Gm-Message-State: AOJu0YxFxyPVbJqbZqCcHUG+ttp0bJM+uVyU2pvswLH9rgRQd5qYqgbi
	vfCjMev/oFY+/ugzKwt1U3AfDGMrEZtAJoh1AKRFM1VWv6b8WEFM8Hd22pNq
X-Google-Smtp-Source: AGHT+IGnEFngkTKpjSEMZRiQSYgmD24daAMiIh9huUiLdtNbk1QpHDCyAjGRDBm54VN4JckyYtJAcA==
X-Received: by 2002:a05:6e02:1388:b0:39f:7a74:e6d2 with SMTP id e9e14a558f8ab-3a05685615bmr64866705ab.3.1725873305516;
        Mon, 09 Sep 2024 02:15:05 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-718e596882esm3120689b3a.135.2024.09.09.02.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 02:15:05 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: asahi@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 2/2] arm64: cpufeature: Pretend that Apple A10 family does not support 32-bit EL0
Date: Mon,  9 Sep 2024 17:10:00 +0800
Message-ID: <20240909091425.16258-3-towinchenmi@gmail.com>
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

The Apple A10 family consists of physical performance and efficiency
cores, and only one of them can be active at a given time depending on
the current p-state. However, only the performance cores can execute
32-bit EL0. This results in logical cores that can only execute 32-bit
EL0 in high p-states.

Trying to support 32-bit EL0 on a CPU that can only execute it in certain
states is a bad idea. The A10 family only supports 16KB page size anyway
so many AArch32 executables won't run anyways. Pretend that it does not
support 32-bit EL0 at all.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/kernel/cpufeature.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 718728a85430..386698f42172 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3529,6 +3529,31 @@ void __init setup_boot_cpu_features(void)
 	setup_boot_cpu_capabilities();
 }
 
+static void __init bad_aarch32_el0_fixup(void)
+{
+	static const struct midr_range bad_aarch32_el0[] = {
+		MIDR_ALL_VERSIONS(MIDR_APPLE_A10_T2_HURRICANE_ZEPHYR),
+		MIDR_ALL_VERSIONS(MIDR_APPLE_A10X_HURRICANE_ZEPHYR),
+		{}
+	};
+
+	/*
+	 * The Apple A10 family can only execute 32-bit EL0 when in high
+	 * p-states. Pretend it does not support 32-bit EL0.
+	 */
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
+}
+
 static void __init setup_system_capabilities(void)
 {
 	/*
@@ -3562,6 +3587,8 @@ static void __init setup_system_capabilities(void)
 
 void __init setup_system_features(void)
 {
+	bad_aarch32_el0_fixup();
+
 	setup_system_capabilities();
 
 	kpti_install_ng_mappings();
-- 
2.46.0

