Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 784D5184C
	for <asahi@lists.linux.dev>; Sat,  7 Jan 2023 09:46:56 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id c6so4249781pls.4
        for <asahi@lists.linux.dev>; Sat, 07 Jan 2023 01:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WsGIW0prujF8xnGwWysGoOLhN4qrtpWJqnT9WJSTvs=;
        b=uwwO51i+XHTXo8O9nKgbbA0lOkbriZTkrqa8jcN0VhIN4prie8UVuu7ej+GkwXbm5y
         jK0FWBckpsVp4AvFJIy2ne2goeAO3ym6QnETeO+6noasVeGVFnrKBMnXYfgicYGudp4b
         ESP+A9AzOlNEOZ3mCInyRtZC8an612XUuza95ok2/JoQy/eWFZ5NBP18Kv2hjxIFc+Ct
         DHp3cmMlP9f/519jZ5CvvPu8kjHLiPxFMeTDPglFVthapVvf4DgIzplS2sgkvx1CuQRK
         YaJkL5h4dVVQUO2DUetmoWH7VYCHdFRDFR8hj1dYIpgvDmrWn3WObSGNJAH7MrUOXUvQ
         MGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WsGIW0prujF8xnGwWysGoOLhN4qrtpWJqnT9WJSTvs=;
        b=pMHjn/gBFuJcT1v5Ah30M6/sAFPSTJIl+2FGTfLBZzczQ8KlFF95HSbJVSZGqbIhsq
         WbUlGBrk2UyRc7Y1XdFs3/EVk6YAF2QIoqWQOMHRAqtnAQGu1wrqoR6xIUKr2CEcvS3h
         GYo6FCZXBgsasQH6/sWP/V3lsqjNl+202ZNrJ0rmZIYki0Us3KQHsE0xYEOopuCgvvPv
         FGGdIKQwbQhrg92I674+Oxmv1YfLTdXY03FJGDbDVjMP7AQZuHGt8Ms9e6mJUkvVJ/7M
         rcIb3qOBzg2GUqTtA2f2RIlxNLvMTDfpya4yWjDsqoQAwpPYEpmZJcIE180BlDxXHYYb
         EvvQ==
X-Gm-Message-State: AFqh2kr11OevjXR21fao5WveChiJhSNGthq1hvbVDd6gxkvUa+xsADds
	P2+pFvuCfLQ4PmYS8zqYP2/tRQ==
X-Google-Smtp-Source: AMrXdXsdJ6TeUQc1Kx3Tfav35gNPG1ueF1TbZrqaKgy0AtqGnB9bhh4LQY40bWlMQSU35445eoUkfg==
X-Received: by 2002:a17:902:cf0f:b0:188:f5de:8908 with SMTP id i15-20020a170902cf0f00b00188f5de8908mr60574722plg.65.1673084816052;
        Sat, 07 Jan 2023 01:46:56 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:a840:1e00:d54:e521:8bac:7bed])
        by smtp.gmail.com with ESMTPSA id n9-20020a170902d2c900b00183c6784704sm2263449plc.291.2023.01.07.01.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 01:46:55 -0800 (PST)
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
Subject: [PATCH v6 4/7] arm64/cache: Move CLIDR macro definitions
Date: Sat,  7 Jan 2023 18:46:26 +0900
Message-Id: <20230107094629.181236-5-akihiko.odaki@daynix.com>
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

The macros are useful for KVM which needs to manage how CLIDR is exposed
to vcpu so move them to include/asm/cache.h, which KVM can refer to.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/include/asm/cache.h | 6 ++++++
 arch/arm64/kernel/cacheinfo.c  | 5 -----
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
index c0b178d1bb4f..ab7133654a72 100644
--- a/arch/arm64/include/asm/cache.h
+++ b/arch/arm64/include/asm/cache.h
@@ -16,6 +16,12 @@
 #define CLIDR_LOC(clidr)	(((clidr) >> CLIDR_LOC_SHIFT) & 0x7)
 #define CLIDR_LOUIS(clidr)	(((clidr) >> CLIDR_LOUIS_SHIFT) & 0x7)
 
+/* Ctypen, bits[3(n - 1) + 2 : 3(n - 1)], for n = 1 to 7 */
+#define CLIDR_CTYPE_SHIFT(level)	(3 * (level - 1))
+#define CLIDR_CTYPE_MASK(level)		(7 << CLIDR_CTYPE_SHIFT(level))
+#define CLIDR_CTYPE(clidr, level)	\
+	(((clidr) & CLIDR_CTYPE_MASK(level)) >> CLIDR_CTYPE_SHIFT(level))
+
 /*
  * Memory returned by kmalloc() may be used for DMA, so we must make
  * sure that all such allocations are cache aligned. Otherwise,
diff --git a/arch/arm64/kernel/cacheinfo.c b/arch/arm64/kernel/cacheinfo.c
index 97c42be71338..daa7b3f55997 100644
--- a/arch/arm64/kernel/cacheinfo.c
+++ b/arch/arm64/kernel/cacheinfo.c
@@ -11,11 +11,6 @@
 #include <linux/of.h>
 
 #define MAX_CACHE_LEVEL			7	/* Max 7 level supported */
-/* Ctypen, bits[3(n - 1) + 2 : 3(n - 1)], for n = 1 to 7 */
-#define CLIDR_CTYPE_SHIFT(level)	(3 * (level - 1))
-#define CLIDR_CTYPE_MASK(level)		(7 << CLIDR_CTYPE_SHIFT(level))
-#define CLIDR_CTYPE(clidr, level)	\
-	(((clidr) & CLIDR_CTYPE_MASK(level)) >> CLIDR_CTYPE_SHIFT(level))
 
 int cache_line_size(void)
 {
-- 
2.38.1

