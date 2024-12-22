Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02158192D8F
	for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 17:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734889097; cv=none; b=X4pxsNAEF/BpEYnJH//lb+pU5T3VET/YB03Mk6A4lcMFALmr/4okuLYvaCHDVktIP/EwIiA4O8C9clJwZ/fxt3JC+wSnSggnu8rXl9XJ7vXgDG/TABcdgDT1fqledlFV75ldUtMOYu9KsbtPXg7h000mzs9Zti2sN+zw54xi8wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734889097; c=relaxed/simple;
	bh=6pZiuvJaNtb/CqZdgPcO1kRdrv9vQuk8hv7BwCYOsp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GY7GYii5qddj0uIdxo6YmaxIo4znQS9Ougx0LHEIEPQUfWSN3hXKpS7TAnDv1snJXIt8JAN9TIUL0uS0beiXKObcEKvmRRo/pfB7+DR24Z3d1BJB+jXPEMrrNRo5DrSlV+DN304kBJdsCfkXInguBiUahb09AeMqnhHOkyDtyBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e71UkVTh; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e71UkVTh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21669fd5c7cso32149795ad.3
        for <asahi@lists.linux.dev>; Sun, 22 Dec 2024 09:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734889095; x=1735493895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=;
        b=e71UkVTh0wMkANJKA6ltMHEA0Zs0tmfjZBOH6H0z9c/SJbasoOS0ulJYz/hmIanqXN
         sQZB3YABF3+oRCS6E79ZXl/YQItMXdVrOZro02vUW/7G0oH1jWz73HG1TRyrZvEVIj1z
         qe0yb7U9Rc/W31NskqW1RDMyAaUYIMQbFtzVZmwQRnW3nVLMwSAK+EXCsafmMh7MtHwM
         mA4GUlODPWJBSmJ3M4RpuzekUDl/daDOucBzOMoJ53ZkKAc8/I4vYqd5vhuE5L2Bcmgd
         KGY3xLxaalVFQL7oGVaNBIELiKsvRJaw+e4Hsv9By0n/pXBM+HdBoS01QuN87+6ipTmy
         kYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734889095; x=1735493895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=;
        b=Xn9ygY08Lz7P+hFdO5tXO6rfCGFY3lR0Tv9VcN57xKoXD1m301XB2naCB940XY+nGI
         +21vNoxSYVAHPGB4GselafwBbSYUk55yBvahQ52Dxvnglg6daSMTF/Z71JyfsXXOig/p
         DZ3/rn8go/z6KBr6CQeUWljmCi1uyBc/XQqGcbUCJe6wa3+Lgw7TZ/5kzNrK88XUMY2Z
         VLQmTIsR3wbrVz6y60n+54YwIbBi9FpO1ui+6S7tpuvBEFuXpi9DgoUiU7TQAsB6pgsE
         pNm0ha59VlE6U3+DgzNA4efZEGD8NKly7b/Zh78I39tdVo7AkZrFajS2czShnBhl9MNE
         cmpw==
X-Forwarded-Encrypted: i=1; AJvYcCWNCn21Ehkn26yq60+nyaV9qtmjbx8O3D7fqrQ2gzmizn+SbJPt8/E56ZaPDaofpSVrElRRjg==@lists.linux.dev
X-Gm-Message-State: AOJu0YytZt2ENM6GsIdsOtHwJtaEJdhDYBMmL+6YoxOu4cR3q440N7Mf
	stXO3ptVWCbgctOz/KdlEuQtr6PnJxWjEZC5qqUH//uLf1dNwxPj
X-Gm-Gg: ASbGncs3YDd/zRJnurWiMNHqUvqOtEk0ZbisDfnt/lLld7CBZLVqmUrZ65CuQKmvRZz
	1jC6OQ9quYwEAaM13aLBd2slNcPojPQgKEyqFGTs6yeCcUZXFIAHXQzT83ijPnoKb9hgHpa3u08
	KBUsgFNVAi5LaWMWZGiAT8W+f22pqE+pvhKI4PFaDxXQe2kd8/W5xsIvt23XhnSYevGjGknpQ6h
	aPxGnPdG+Cw/BILcDArsmuisOoi1rbqSABVI+vVed49L7Gjx8yMvb2L1A==
X-Google-Smtp-Source: AGHT+IHTIsviKSZ1LKilIoOjqzYkBQpMrGt61rnjhIo4zoH5+CmZSeIBYKiQb7rgGn8rEI4N9j1c7A==
X-Received: by 2002:a17:903:2287:b0:216:682f:175 with SMTP id d9443c01a7336-219e6f42c4dmr149570225ad.49.1734889095279;
        Sun, 22 Dec 2024 09:38:15 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc964a73sm59328175ad.45.2024.12.22.09.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:38:14 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v6 02/11] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2 compatibles
Date: Mon, 23 Dec 2024 01:34:52 +0800
Message-ID: <20241222173750.148071-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241222173750.148071-1-towinchenmi@gmail.com>
References: <20241222173750.148071-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.47.1

