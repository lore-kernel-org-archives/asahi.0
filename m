Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186061F428C
	for <asahi@lists.linux.dev>; Mon,  3 Mar 2025 15:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741016462; cv=none; b=nyqoG/b0rvurbMxPBmfVjq/ZuZxFQbVJkjSKSinGpcBP0C47GM/ItfBQdEQ4v8Swgv0Cko/hBYF7SY018CxNKUtCmxp6tvJAKvQuZqjyJKUd21UxKHp5PXpI86rSJ8jJQrR5Ahj71jABatb1e8ygY4f0LI751H0rj7jU2jS6Dyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741016462; c=relaxed/simple;
	bh=C1voShr7QZBAZN+zbd70EoBJvqupFDaWLGBECIThba4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fcbam2qugAy3wePsF7JYHuSwhZ8TMr8R4G2ARxnXgb1sUTD3IQjbyGjLDHd4sC3lqA6sWvHe53w7QXsYU78ql0eYboZw7a83psE95Rp2PvkByyk6d/xWPJzIa06PaQdUTR6vSr59WuzJIS3q9Ud5GbqQ9XEF64rO30d3vuH54hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c081915cf3so612713085a.1
        for <asahi@lists.linux.dev>; Mon, 03 Mar 2025 07:41:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741016459; x=1741621259;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9Q1CGP4dTc4ReWFNLDCwkt5znmDQGNIDebPCmoEtHE=;
        b=PiguwryENOlh2cOsF/uhq/t8iKTW1TbjMfBVUWc9lnUZ51K5b73nwBSdo8q07lWrqr
         vULZpjfnP2vaJ62jXyyuePWafOR5wglzfcElZSrV7IZy3nVBmBifSYRWuYkMluK1wh6f
         OFi2QvWICFDYqkeg0lQ7cnW+Ii3oi67x013eCMFDngR4BoHh0uv8aD0ackjmY1edDplC
         qarBbxP2E8ROfBCWdskKemPIRfSMLkn/z+SxQUEMy2bbxIpZVQwFzzTNaHDhX/nbGC31
         +FhaaRCyuPthaKRRu96x+aBzisPTNRf3We0YUL6NWca2HpGVWIfJDYvNUJOiVbkD8wAP
         W1Iw==
X-Gm-Message-State: AOJu0YxbxHyoIj523CjZTaeKl8rPmM+Ix+AsL/feSjPumRdd0Of9XPPC
	0d0CXNRnY6sJ39mEIaesNZ3SrFDvJuJAnQs/i0thjCJp1cZw461zqE05c88+L/4=
X-Gm-Gg: ASbGnctKSOsN2/8durRgU2eUOw2jwRxsskXUqRGQcH5nt9eSl32aUF0EUnzpCKfvInE
	jRWvzS9YGLx8IIrDoLPnRK8iGmK5lTQlqMVEv0SXTX1jEVuMPetIVZFwe4UO1YcSJ3mege/kxeX
	9lNkT2kzF3/K9bLfEL9bG9yecOY8JlNRMqMZcTwAQCJobIjUMPit5PiR97dCZC/TTwKUSnbFPnH
	bN1EKagWhT40O7Yoa4NVBM73qp7WBdhUoNATk68ajx0RIwQ5SADnvrTwz7z9JNOPRFX4TUPyD0V
	l47S1Pj3MAMrUk8PJaVPxNok1NxWnp+jaIz6EW0JrTXs5e9uP2S5cN0=
X-Google-Smtp-Source: AGHT+IGMYW21aDwHdBh2fatxOmmOzXnLq+QcGm1yyhgrEjUujkrtZp4lmeRrA3XkLXCqUwF33zdaag==
X-Received: by 2002:a05:620a:5641:b0:7c3:9d35:2c91 with SMTP id af79cd13be357-7c39d353655mr1526898185a.5.1741016459115;
        Mon, 03 Mar 2025 07:40:59 -0800 (PST)
Received: from Skuld-Framework.gompa.lan ([32.221.37.233])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c36fee9d22sm613629685a.21.2025.03.03.07.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:40:58 -0800 (PST)
From: Neal Gompa <neal@gompa.dev>
To: asahi@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH] MAINTAINERS: Add myself (Neal Gompa) as a reviewer for ARM Apple support
Date: Mon,  3 Mar 2025 10:40:10 -0500
Message-ID: <20250303154012.1417088-1-neal@gompa.dev>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As a member of the Asahi Linux project, I (Neal) have been involved in
reviewing the patches downstream as part of enabling the Fedora Asahi Remix
distribution for years and have recently been reviewing patches for upstream
submission as well.

This formalizes my role as a reviewer for ARM Apple system support patches.

Signed-off-by: Neal Gompa <neal@gompa.dev>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8e0736dc2ee0..052e6e997817 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2212,6 +2212,7 @@ ARM/APPLE MACHINE SUPPORT
 M:	Sven Peter <sven@svenpeter.dev>
 M:	Janne Grunau <j@jannau.net>
 R:	Alyssa Rosenzweig <alyssa@rosenzweig.io>
+R:	Neal Gompa <neal@gompa.dev>
 L:	asahi@lists.linux.dev
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-- 
2.48.1

