Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CED804
	for <asahi@lists.linux.dev>; Sun, 18 Dec 2022 05:15:36 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id d7so6067339pll.9
        for <asahi@lists.linux.dev>; Sat, 17 Dec 2022 21:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WsGIW0prujF8xnGwWysGoOLhN4qrtpWJqnT9WJSTvs=;
        b=20KqTZ7p9hZYfryC+Vfixvt3usjH4QB21HhVNGKbyBUuo9FRcdt5pDtUHZ0C4OB00k
         Pxkb4TBy4j5Ucx4LvEqYvxz/DBSczM93egGac/fvIai58XcwYxQmzbaOaTH5tfndBTxj
         JRi/iiyrq7N9LEDYbMOd0d/shMofzgLH7ExucYoWaDUQvs4RFnTKTKgOLHcox3BCkcz/
         qlDlCjh4+wKxwbqjTtDSlSaAePBt7ceu4mPvnka+GHbiTPbBdhbiA/SQ5rGpvs+PtiGm
         YBbNd2hkCWttAqwAgUDSjtnqR+YIhmIQXXDUneGSDReHXU81LIFM9OiZ2/6KYcqPMIQp
         yPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WsGIW0prujF8xnGwWysGoOLhN4qrtpWJqnT9WJSTvs=;
        b=nitrKlWxdM3tcbKZyz1/GArChnDJvDR9C9yiiXkzz7MsRd1kWAWdBQgpp02YesnMgs
         wLqbwVBo69qAhelQ9CB5GCxFBcLo2S377KCz9hVc62RFEg3tCn7VcFziqRN85160aZ5T
         Ba/ph9csnSmaUveLYt+BEkOi+q9tmcWWnV3nMKmSuFASGUnpZLI2YfutOQIiEX1XGV19
         PVwLRNSXNMmHH0anP63LiPGHmlcLH1qPJVx//0qUA/VdhaxSZbXef6iGvNl827b11POr
         F3bCD35MgPXHRwgtXAeswpXABYZtV6mhljmE3aDa3rbl5dlSxBdFeSwIFfCtCrVaRFQk
         dwTA==
X-Gm-Message-State: AFqh2kpXvY4YNJgy51BZMqBPRSBDYCWVZpXqrBi8rQz9ZH4Z5vscGVOi
	Ryz1pExm0w8c2KmwZoCossntMQ==
X-Google-Smtp-Source: AMrXdXtRnhfNE+X0n0H526OoGg60rNUh3zsQ7HI3r0L3dVAMmDfmA+k1y46jlVAC89lTx/mkAJPjBw==
X-Received: by 2002:a17:90a:2eca:b0:223:b920:28df with SMTP id h10-20020a17090a2eca00b00223b92028dfmr1736781pjs.29.1671340536313;
        Sat, 17 Dec 2022 21:15:36 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b1-20020a17090a6ac100b002139459e121sm7002417pjm.27.2022.12.17.21.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 21:15:35 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH v3 3/7] arm64/cache: Move CLIDR macro definitions
Date: Sun, 18 Dec 2022 14:14:08 +0900
Message-Id: <20221218051412.384657-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221218051412.384657-1-akihiko.odaki@daynix.com>
References: <20221218051412.384657-1-akihiko.odaki@daynix.com>
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

