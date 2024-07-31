Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F8E17BCC
	for <asahi@lists.linux.dev>; Wed, 31 Jul 2024 03:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722396116; cv=none; b=fnZVPOeqoeTBpSPzZWLxqwAhL45L46NCh/U/bMJmqtrYaWDZVdVHhf5xFZxBqsx14ED2JryTlXXJE+yAsv8SujFeTnLKj7uRndAXZltHDMv2OBA5Pam7Ch+evMzKM1TUhcVjQvfyzPBAnVPD/mSSJVAMr0o/IU7050CbUK0QZ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722396116; c=relaxed/simple;
	bh=isqzIf4s3qMUZ8My6mFhEjnaHYoieCTfWgOZR5uvZ2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=igIXX1PW9sUqM0m9Dk+f+CqHRcvojqvUWspjCegyjhB8V51+nWfJfhUNOq7HSzHHdmws+8yiwKLQKCvR6mkDxt6Jf7b9l2XhXmZyUghLjxH0glj/QKdD4uYfgByDEURM1+u14N7Z99m26CQIMbeSeFNblEmmkFcatdwhqA8r38s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6b797234b09so4879826d6.0
        for <asahi@lists.linux.dev>; Tue, 30 Jul 2024 20:21:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722396114; x=1723000914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c3C2/N4K1xh38THuuw6D5r1n07fbTdknI23+xK02pxo=;
        b=ZN0/R47hPEx+XSBXrXoMw/RNn3tQeHcTQeSJ2rIYThQbXjGno5yntmef0JUhhbrkMy
         EpAb0OyGyFfGqtpb/cyfOnNF/QhqcXpTDB2rnNzoPJxMoHqdNhmuFMpjIM3JJZZMOAyo
         UBNIAOtyHnBynz3kRj2gq5HfDL1GkxsV8Q0fRWqj98DkDwDzSCKsNQuDAUsbPupHqdAc
         Bt1jfQk4AyneT91xEKlJNaEXudcqtT6shoyPXETOFNv17GsiPi7Yz791FEmyNp6GXbmR
         uzA51+5yyMamdp/G4oKw3MTuy/baxVJOZCGDRgF2pnyjt5NkosJYTb6xtUDZteZIRad/
         v4CA==
X-Gm-Message-State: AOJu0YzSvlKkLMsh7iuuZ4IuwOhbIQLJHXf/6RkJywQ6PFg7bXpnoTn8
	AIy9ScfOeXVMO++pHbutTgeYVDNlznTkagfE9n1AqROrqv+wJZa+
X-Google-Smtp-Source: AGHT+IEUYKOY2SmqasPgX/XsLnQNDHFQXA+wfOnR76VGJ49T3X55xaAs2T7uWsPrw/MBb9xNPiM90Q==
X-Received: by 2002:a05:6214:4012:b0:6b5:2bfa:edd5 with SMTP id 6a1803df08f44-6bb77fbd843mr77079556d6.17.1722396113728;
        Tue, 30 Jul 2024 20:21:53 -0700 (PDT)
Received: from Skuld-Framework.tail03774.ts.net ([32.221.37.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb3f93e53fsm69828856d6.70.2024.07.30.20.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 20:21:53 -0700 (PDT)
From: Neal Gompa <neal@gompa.dev>
To: rust-for-linux@vger.kernel.org
Cc: asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>,
	Asahi Lina <lina@asahilina.net>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH] init/Kconfig: Only block on RANDSTRUCT for RUST
Date: Tue, 30 Jul 2024 23:20:09 -0400
Message-ID: <20240731032030.2847151-1-neal@gompa.dev>
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
 init/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index a465ea9525bd..ff4ecfa62569 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1900,8 +1900,8 @@ config RUST
 	depends on RUST_IS_AVAILABLE
 	depends on !CFI_CLANG
 	depends on !MODVERSIONS
-	depends on !GCC_PLUGINS
-	depends on !RANDSTRUCT
+	depends on !GCC_PLUGIN_RANDSTRUCT
+	depends on RANDSTRUCT_NONE
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
 	help
 	  Enables Rust support in the kernel.
-- 
2.45.2

