Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2FF184C
	for <asahi@lists.linux.dev>; Sat,  7 Jan 2023 09:46:48 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so7729822pjj.2
        for <asahi@lists.linux.dev>; Sat, 07 Jan 2023 01:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WC3UnsmGOPR3/UTYcySRXnOtjQN5NHU3ow6N5a9AA1g=;
        b=GZWaUiXC7G9/KoJGzS+SXfWLuchaZwqiH1G0XI1U76KjSKrw6VfHPlCHtH8LMeiSyA
         je8wA/aJvQzr0jwJAD+C6qFkNSqOBEUeKSh3vXB+7WSVzFZtRGNCV0VYKZc3Ix3eYSVn
         8sK3/5wIo/GhI78FQa4Z2IkAd2C0++LOJ+Fe5qd9dTtSXA7Cumb26i/NkpnOr4fX/UHh
         O0QC4VO9TbmhfoRDFrO2+uE6a1XrNF2vcQa93hQM0yEa1zXoIfN7rhNYPBBXnJ0l1er4
         m2G2PtNtXJI23SHIhFR/N1miuNM5nIJbEvAkViQrt2qBHSUDCSqH+xBQeIVONe1sjYCC
         nX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WC3UnsmGOPR3/UTYcySRXnOtjQN5NHU3ow6N5a9AA1g=;
        b=zXuR/DFf3qGdI2SijadZ3Po8JxWCcAx1/z/h2z48V5Ysk/eT6Y7zngflsbr2v3I3Uo
         1xVvUZ1KCUm2RL37jTC90UA01rVzZ1zEPs0+teQ0U1xxd6NR8MbCl9uJv/IsjSQHVEHe
         AL4llAlhWPgS8tiYBZg+QVq1O0Tf3cgTnsqz+cKMfU3EY7yWvkv3hDA68JBX7HP1HLGj
         0g16cu1jSvYDlFn3xfbsXLi7uC1Pcu4w6SUZicJKIuxz95XKWwyblVqvOd9b3uAaA6o3
         YV6gbpf+Pzyc1kvqlpZIFr+pZWWvq4yb5sLNXe9VfUQJy8eDakRlLB2WfXyxInxe3YKU
         ckAA==
X-Gm-Message-State: AFqh2kqPBTzs7KNRfqfVwfGzdmyHb/6cc4isSobQtIC6f3DCL6wkjMoi
	zwIa0cLn5yu42I5yfC77pekM3A==
X-Google-Smtp-Source: AMrXdXsoN7BjynbX+1FW+rDVAt3A++OMZD9/ZKjTPovZH3nsBWOYvCj2DSe9MecBeBaOcFEsZwV+vQ==
X-Received: by 2002:a17:902:a513:b0:192:fe0a:11d4 with SMTP id s19-20020a170902a51300b00192fe0a11d4mr7793194plq.64.1673084807751;
        Sat, 07 Jan 2023 01:46:47 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:a840:1e00:d54:e521:8bac:7bed])
        by smtp.gmail.com with ESMTPSA id n9-20020a170902d2c900b00183c6784704sm2263449plc.291.2023.01.07.01.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 01:46:47 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvmarm@lists.cs.columbia.edu,
	linux-arm-kernel@lists.infradead.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	James Morse <james.morse@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	asahi@lists.linux.dev,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Sven Peter <sven@svenpeter.dev>,
	Hector Martin <marcan@marcan.st>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 2/7] arm64/sysreg: Convert CCSIDR_EL1 to automatic generation
Date: Sat,  7 Jan 2023 18:46:24 +0900
Message-Id: <20230107094629.181236-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230107094629.181236-1-akihiko.odaki@daynix.com>
References: <20230107094629.181236-1-akihiko.odaki@daynix.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert CCSIDR_EL1 to automatic generation as per DDI0487I.a.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/sysreg.h |  1 -
 arch/arm64/tools/sysreg         | 10 ++++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
index 1312fb48f18b..a2a93b3fc557 100644
--- a/arch/arm64/include/asm/sysreg.h
+++ b/arch/arm64/include/asm/sysreg.h
@@ -404,7 +404,6 @@
 
 #define SYS_CNTKCTL_EL1			sys_reg(3, 0, 14, 1, 0)
 
-#define SYS_CCSIDR_EL1			sys_reg(3, 1, 0, 0, 0)
 #define SYS_AIDR_EL1			sys_reg(3, 1, 0, 0, 7)
 
 #define SYS_RNDR_EL0			sys_reg(3, 3, 2, 4, 0)
diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index f754265aec5f..45648fa89be8 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1637,6 +1637,16 @@ Sysreg	SCXTNUM_EL1	3	0	13	0	7
 Field	63:0	SoftwareContextNumber
 EndSysreg
 
+# The bit layout for CCSIDR_EL1 depends on whether FEAT_CCIDX is implemented.
+# The following is for case when FEAT_CCIDX is not implemented.
+Sysreg	CCSIDR_EL1	3	1	0	0	0
+Res0	63:32
+Unkn	31:28
+Field	27:13	NumSets
+Field	12:3	Associativity
+Field	2:0	LineSize
+EndSysreg
+
 Sysreg	CLIDR_EL1	3	1	0	0	1
 Res0	63:47
 Field	46:33	Ttypen
-- 
2.38.1

