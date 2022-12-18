Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC509804
	for <asahi@lists.linux.dev>; Sun, 18 Dec 2022 05:15:32 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id z8-20020a17090abd8800b00219ed30ce47so9949833pjr.3
        for <asahi@lists.linux.dev>; Sat, 17 Dec 2022 21:15:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOI4ejQZZiODftrBSHrXI1yj065pP5UP36eyaXzR3dw=;
        b=5vOoY2ROQYHTbYM3+RnIE9hlmPwzzQgFUeowIh+C/4V9gTf+l5bnTa2QzkNUnqQwxr
         3GgkF6GUjCXw9MZFqkdBaBeMYIL59Cc0WtqAI9/oj1HmwjGy3flLLlS8WOMO6Pbob/Gx
         jfGlhJe3VFYnBiWMGf8du0YwYHYTQB0gnZUmWqLr2GwB9S6eTRGdZdtbF+a+mxGQ8lVb
         8Mj1VU5avG7zyE24Rk/OHZnHGBhit9avvW+NyeY4DKssVug5N7YvvKNSYQPL3FBzsHI8
         0DgZwsBfWfirRYsZFPZKwCAEOdbAIL0GAH+UYx221RmJDoHsYlz8pxB7RMqDMZ1rho4b
         1x3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOI4ejQZZiODftrBSHrXI1yj065pP5UP36eyaXzR3dw=;
        b=RwM+xZ66MAC375VO88HDfkUITkY0hQHAz50lMwFm3l+5+nNGRgFdEWFZk64annAjE5
         lhA+q5ii37HaORuvJSub1XD8il87pw+CwJzoLosHom0rMVolnTjWxybFZv/34iqY4+uE
         bHm3qFAAmeW7wBO7DP5mS79caU71rbsttE93Ut2uijwNhAFix5PnH4TWWJ73nQ6AgLRy
         YRSGlMVQ0QcRD5dQWJdwfqFOlgekJO+bOXLmMiboWYgHdtYFpiZTMUbp1zpkTwgdmw8M
         J3f3FUqYcbcLdHs/9+5RGeOwK7bhuTxDgktxARkz4BqDzbMb+5Pw8TN/ARsPjXmtbx1h
         uyrw==
X-Gm-Message-State: ANoB5pmZjgqTSzfzIHd/uN78oLSy51M3xLHLGBTplx8+BAymGbDjDbr4
	Ql8CSScUkxbojqs1GVtiVDI9sQ==
X-Google-Smtp-Source: AA0mqf40ve5metyNeR9pqP85whi8pYrughaxn166zWUj52zuKSORgShjFuv3JDhVbBqfLRVYmrDThQ==
X-Received: by 2002:a17:90a:f681:b0:219:6bf0:9861 with SMTP id cl1-20020a17090af68100b002196bf09861mr39034573pjb.10.1671340532431;
        Sat, 17 Dec 2022 21:15:32 -0800 (PST)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b1-20020a17090a6ac100b002139459e121sm7002417pjm.27.2022.12.17.21.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 21:15:32 -0800 (PST)
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
Subject: [PATCH v3 2/7] arm64/sysreg: Add CCSIDR2_EL1
Date: Sun, 18 Dec 2022 14:14:07 +0900
Message-Id: <20221218051412.384657-3-akihiko.odaki@daynix.com>
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

CCSIDR2_EL1 was added with FEAT_CCIDX.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 arch/arm64/tools/sysreg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index acc79b5ccf92..0a302b4e6d7a 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -898,6 +898,11 @@ Field	5:3	Ctype2
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

