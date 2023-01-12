Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C515386
	for <asahi@lists.linux.dev>; Thu, 12 Jan 2023 02:39:19 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id y1so18824256plb.2
        for <asahi@lists.linux.dev>; Wed, 11 Jan 2023 18:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4yHUC+FGbuzxyoJZZC/oBJ6Z9AMmMcVj10+sB33bo44=;
        b=G/FOM0msaVTnwbw4qK7VT0i0xMSkmfkyRGDTsBaISva6prL+2i+MtiYYTrs6j81RKE
         Xu2bDqDgZaVkxuFejICevS6TtnB35IfREiU/iajqcizWkJNlb3WijoSa/TRdfPGqKADw
         LyX2WIBosI7Qxneyp8J/C/YzlAYTTyFZxfemeY9cax1oeuZHYaQ3M7EtZpFS+m7nIX8F
         OMiYaX1MTQLZKsNoGCEKifkw6Gr4hiKXTXgrQ+o6c4Vm21ou2Djgx/gQ4EpbSneqoemn
         fzxVnXZ8pbFBPME0FGlPWdx8OQjR3r4+z9jq7Ijx4k0q4ItH5HXwWvC/0BfRLm+i6Y2o
         k8jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yHUC+FGbuzxyoJZZC/oBJ6Z9AMmMcVj10+sB33bo44=;
        b=GKpz0c+YK5DKf5nb0JC23j0M3Rph0GthhPOh4gJycqUJSqV23UnR3FEYqycBIeazs1
         /Lr0QZ0iDoS1S6mgIc7tG8jOlBOCVBVhN3zByRp5bWGmNuiT6r5K83Y6xHssST+eXqwL
         onDeqClKmMLKz78dj3yKgOkwrJ6TRDWavmYH8JT4AHpfIp1QT2ZVTEbngSRUYyBnhzsK
         SnlsUE2tdPwAjMWf6RkWlzg+VohlmMyIsIMUlmFNuHIF5CN6tUn+rCJnRlRqwK+0RWlt
         APhrexOgrUBCgnBQphmH8yYJv8XH2P/WhfZxQN85CZ/85OYUL0tHI6qYqWizpOj4q1JR
         s6Wg==
X-Gm-Message-State: AFqh2kqt5xl0bBbxNDwzYQANLMFj6abJapcgfLrUU6tBwhfDfUU1SXUV
	h7Gu1thf7lkh9KMQ0YXJgaU7AQ==
X-Google-Smtp-Source: AMrXdXue0xJ4HI4ans4UT8lvfrGxwgsi/5eRclODGohFrlmU4bptOcxuvjj7ju88KrgTJpZTkJnbGg==
X-Received: by 2002:a17:902:7889:b0:192:6bc9:47ba with SMTP id q9-20020a170902788900b001926bc947bamr63652434pll.31.1673491158898;
        Wed, 11 Jan 2023 18:39:18 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:a840:1e00:d54:e521:8bac:7bed])
        by smtp.gmail.com with ESMTPSA id w7-20020a1709027b8700b001944b1285easm2310331pll.198.2023.01.11.18.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 18:39:18 -0800 (PST)
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
Subject: [PATCH v7 3/7] arm64/sysreg: Add CCSIDR2_EL1
Date: Thu, 12 Jan 2023 11:38:48 +0900
Message-Id: <20230112023852.42012-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112023852.42012-1-akihiko.odaki@daynix.com>
References: <20230112023852.42012-1-akihiko.odaki@daynix.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CCSIDR2_EL1 is available if FEAT_CCIDX is implemented as per
DDI0487I.a.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 45648fa89be8..90b64697345f 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1663,6 +1663,11 @@ Field	5:3	Ctype2
 Field	2:0	Ctype1
 EndSysreg
 
+Sysreg	CCSIDR2_EL1	3	1	0	0	2
+Res0	63:24
+Field	23:0	NumSets
+EndSysreg
+
 Sysreg	GMID_EL1	3	1	0	0	4
 Res0	63:4
 Field	3:0	BS
-- 
2.39.0

