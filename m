Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89D41B140E
	for <asahi@lists.linux.dev>; Wed, 31 Jul 2024 12:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430642; cv=none; b=oPjg6H4iRcYcGcg4Xgh4dNDj2BGDNEfacZcqH+jUc1mKV1PG4hnKlzgOvFk2QSsu8lJod4H5AaR1//jrSz1hK0nTSuuZZxid3Xc3kQgTaC44Nr+TfI9aw9WhweU+ppkGGkr7TavDkB3XRqrERdCHHv5n9iMpIzSYZr5MW9HTY8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430642; c=relaxed/simple;
	bh=+Ich+i88Ajk8gWGCEI+UfMM4Lpr1h3Awv2tyu/m29+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oFwqwcONKLLy2pcTs173axX8z8gWT6bOl89Ehv8JraAPdmw6OpQiQiSRjcUUdSHzyBn1H6CiGuXjaMfV4q2t1KbFU8eVMRvsQn9jdZh3DWO2Tnj7CWftmKdqZcB6W5W4jB0oVoZr3w5SrCXMC/+2wlh59fvHYtCG81J/nCXXAA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6b6199ef089so32752596d6.3
        for <asahi@lists.linux.dev>; Wed, 31 Jul 2024 05:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722430640; x=1723035440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HH60pPIigszmi5NT6xUYpEZJEnXe5I5RDClaVzxrNOk=;
        b=DX4lzyELJxJwtKEOP2B1pBeuL5jvCXFw1Wg+FX97OoeG7OY6/mhN8tPFRV59vPXr8u
         KqnkqT6wst1I/nGd+1/qqvf7bfneOl5iByjMTcaddXiFzQtg7hn/v0G8gxvPXz2iTZrT
         L3jpU9V/vZfVr4oD/OJmo2bDiMclOx2V2wjKnbmCUFnrA5SFuCNUiy1XZz8nj45mvEpn
         eRUOs2z8CWPsVdxetaJqt5wySFr19m6ofUJhqZ0J+WhHZCjTROEacV3308JPI8w2x99J
         eavJS/Ebqo/7lFZjYe+Rg5Dc+HBO/CyitIXW/smPIBd7E6KN+sRwN61OZtd79ryob4oh
         DhEA==
X-Gm-Message-State: AOJu0YwuR+MBYhwf5gH/rPjF1Gk7Pj2SCnB6ou68RuT6Rzq+f07AdSmM
	Kzx3PtrseRi8on0UgbUcy5d1vUhM6/nhyM27HBTPKTEOLeJBw7Qb
X-Google-Smtp-Source: AGHT+IFY63PsDshIgYxQeoWEgGzy3bTrB04am7xVVHGqHOwT0MgQryeOj1gZ9kiV80HxtDTFEM/8mg==
X-Received: by 2002:a05:6214:ac3:b0:6b5:238:2e42 with SMTP id 6a1803df08f44-6bb55a83bcbmr226653276d6.40.1722430639815;
        Wed, 31 Jul 2024 05:57:19 -0700 (PDT)
Received: from Skuld-Framework.tail03774.ts.net ([32.221.37.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3faf8f0csm73492276d6.132.2024.07.31.05.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 05:57:19 -0700 (PDT)
From: Neal Gompa <neal@gompa.dev>
To: rust-for-linux@vger.kernel.org
Cc: asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>,
	Asahi Lina <lina@asahilina.net>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v2] init/Kconfig: Only block on RANDSTRUCT for RUST
Date: Wed, 31 Jul 2024 08:54:28 -0400
Message-ID: <20240731125615.3368813-1-neal@gompa.dev>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When enabling Rust in the kernel, we only need to block on the
RANDSTRUCT feature and GCC plugin. The rest of the GCC plugins
are reasonably safe to enable.

Signed-off-by: Neal Gompa <neal@gompa.dev>
---
Changes in v2
- Drop changing !RANDSTRUCT to RANDSTRUCT_NONE 
  (they're equivalent anyway)
---
 init/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/init/Kconfig b/init/Kconfig
index a465ea9525bd..0939486938cc 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1900,7 +1900,7 @@ config RUST
 	depends on RUST_IS_AVAILABLE
 	depends on !CFI_CLANG
 	depends on !MODVERSIONS
-	depends on !GCC_PLUGINS
+	depends on !GCC_PLUGIN_RANDSTRUCT
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
 	help
-- 
2.45.2

