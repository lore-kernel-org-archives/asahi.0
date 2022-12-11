Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53981363
	for <asahi@lists.linux.dev>; Sun, 11 Dec 2022 05:17:29 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 65so6421808pfx.9
        for <asahi@lists.linux.dev>; Sat, 10 Dec 2022 21:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5kiwn5okie3cYkwLwnJvTGi40F+wMTuMjX2LuHOS+A=;
        b=WM+yFLRXJy6JnBZbZOpn5+t8atNOLnueKar48v96qp2NwU/8Ik1wwnuxmytttty2z9
         ITUmFGcOh29D6O6PlCO0PlhB2szHk7iTkSdA0gLqBptODhfUF520Gbgw7MZBVwLwLiTw
         0CSCnOHilk+hhVw4IuvHirujaQAZXrBuPE4ZmouZYqe2dHTtICsf6+0xz/CW8OWjOcpj
         JOCFkmrSinl+xQUfrSMRl/7MyercuXij7RIG389zwGUekxyDAo63H1HbdgfXDq4JFyI8
         2HRfGSO+Go17DonBkq5ok61YEIAdu2j4o7pvrlOMtTlhWZV7F0tGbfILJBgZ/rE6SGs2
         p8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5kiwn5okie3cYkwLwnJvTGi40F+wMTuMjX2LuHOS+A=;
        b=Dzqvi9itIvu01Ot++qW1cGtpocEe/9Bt5nrvFT/XQNx703Q7DBNdvTW64IXQEVQvDJ
         rRs5rubZPrzJTMMZyW1DrNEH8vOqkNRGdQvT5WRDi1f1M3mGaddQehf/KLpUK0+BolmA
         g8/LbLPrl2nYyfnGNUSw13BQQEec0FAst6UQjvavGPAw5R3IF7jaauK4EIAAUsoks7qe
         7uF9PdJz3V/0gQFeKns60KcwiuybzzJX0mHCwUl9q+qu+4h8OE4QgGjXyE2QExmoCoXG
         U2Pj2Qu77gZZGAbNqffF+ZMDBJsr63sxJD4aFG5XK/u/2aMp6OEhsAga5iedIxRSsKe3
         9wwQ==
X-Gm-Message-State: ANoB5pkoyGSs42ItZY/7OZaKh+cmpNKF00rM8xoX15nNVXWqU6ugp5Kj
	WTZl/Zs2NmIodLdlpD7Q3UQ6Ig==
X-Google-Smtp-Source: AA0mqf4MODz3PRgxNZCX+N8VP2CyAydeEtYzkGUUPBV3KsYk9uUNpuHV9OrohMyN3dXkAHtnQP7GRQ==
X-Received: by 2002:a05:6a00:1c81:b0:577:8bae:29a7 with SMTP id y1-20020a056a001c8100b005778bae29a7mr10830364pfw.33.1670735849244;
        Sat, 10 Dec 2022 21:17:29 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id f125-20020a623883000000b00575d90636dcsm3463684pfa.6.2022.12.10.21.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 21:17:28 -0800 (PST)
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
Subject: [PATCH 1/3] arm64/sysreg: Add CCSIDR2_EL1
Date: Sun, 11 Dec 2022 14:16:58 +0900
Message-Id: <20221211051700.275761-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221211051700.275761-1-akihiko.odaki@daynix.com>
References: <20221211051700.275761-1-akihiko.odaki@daynix.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CCSIDR2_EL1 was added with FEAT_CCIDX.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/tools/sysreg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 384757a7eda9..0fb08c53fcdb 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -887,6 +887,11 @@ Field	5:3	Ctype2
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
2.38.1

