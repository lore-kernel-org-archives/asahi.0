Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0758413D537
	for <asahi@lists.linux.dev>; Wed, 23 Oct 2024 04:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729658701; cv=none; b=CKnieittuemkyEO15HAjc2HhThNQXfSUz1Ld6f6BzRFR5WBUPHySkpmqohO9fpFV4QQqUWqX3FNDU1IThNGSq0PW80b0Axc0Y4Q8UVIwE1VAifZgattP4v6y7KjeKaZ3qYFlRmRbtmyZJsWFwNO4xK1GfB9c5HufL1EA1XvXREA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729658701; c=relaxed/simple;
	bh=xNIV6DN/8buZvNlK0QqZPtrqGuIXmLL8oUXC00+mtW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sKS/VOoW7YXpxo4r48sADd1MvEFnIfoINlSQGlsNKicvEaXcqnRxfT85jpOHrUfOjS/o3eD7vNaVgaMV7C/Cx6faF37Q/YaSPTp69jMuCRArsPY1cmGH4hfqhXkMi1oEC8o7PFiTx7Leki4ztcTDsskDBtfpAgdwWEuGpEaFA8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B5DUk6t0; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B5DUk6t0"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20c805a0753so55562595ad.0
        for <asahi@lists.linux.dev>; Tue, 22 Oct 2024 21:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729658699; x=1730263499; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kpdjyoP29XpDiPFedkAYnCbJjAK7z6B+D6DDuXAfbg=;
        b=B5DUk6t0cOfTEf1imK63Hh3aikel4xf5jM500WHBda87SZZhCIbWpUfCU9u/KlQmzD
         StWu1oheauLJW3fGgsIWDZT1EJrw68PFnoWrCT1wTvcwQhvPoZF7S86xCsvL+D2vAdPN
         GI6JeqQipmYWzEqC6S0Ja0MSC/Nfiz+H6SkSlRKPYhKTEIYmt1GQQyaSQZv1f4QwmHii
         8zAwzf6Io2iaf8KHazXyaexHoROfN1pFVlc8nFi6SllxEwK5njDQ41+wLZsL4tCUlK6+
         3Xn2fk6OzOnKiwtt6WY4hCnUrRQvguiqjxKUzUOrE2GjbX+8OROw0qxBSUFt8TEOh2Gv
         +XMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729658699; x=1730263499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kpdjyoP29XpDiPFedkAYnCbJjAK7z6B+D6DDuXAfbg=;
        b=PSmLS7Cr7LdcrY7WEwD/XwleclOovjSuLzX20YVDibMBVF6HPnSn5RFPlz5LSJr+Gs
         z7W9HsI3DPiImmuIYBFculIOCcmBCMJL3KBH4u2hpbpSuLoWRXyKnoDvqf5MNLBuiRyD
         0yIxCeMVFUQlLz60h5u5/lsmLIIcjlNcfEG5so6NBjEfZ+NxIS68XkVT0aZGd/3IshVz
         LE5fJY1uDtMy9gQv9mLh2WT1gGvXhMeqM4LM0AEHlkbpKBULs9uRu24Q9zcjTE3PmffS
         Y/Wc3jS7RL7h+VrsSL0/BfSY59tD3X+IL4B1p+eFXA484mo5vfVYgsIxrNoZEn5yNT7G
         jrmw==
X-Forwarded-Encrypted: i=1; AJvYcCX9s2dG6ho+p+EHr/BG2yfldmKAuHLogXM+iqL01gH3mDu6LNmUlIjHm8C7qzeeJx095UWlSA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzO/L3Z15iU/oXztgrzdU7eG38qZ/QjoKLqJ2XykDAu004Tx1wS
	qxhVdbxfF9cNFgljRh4nJ1oAPJVZjHsGFE9wqVs6GDLt37Jvgu9b
X-Google-Smtp-Source: AGHT+IFZFDdv83kDhIIVLNfNpDvYr5lcyMvZPsFbMtN5Jo1HlWhITkFyccJswUnCikzDBX93+nPcsg==
X-Received: by 2002:a17:902:d4cf:b0:20c:b517:d715 with SMTP id d9443c01a7336-20fa9e5e89bmr17667155ad.25.1729658699245;
        Tue, 22 Oct 2024 21:44:59 -0700 (PDT)
Received: from nick-mbp.ust.hk ([182.153.135.7])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20e7f0de3c3sm49983125ad.207.2024.10.22.21.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 21:44:58 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 RESEND 03/20] dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
Date: Wed, 23 Oct 2024 12:40:38 +0800
Message-ID: <20241023044423.18294-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241023044423.18294-1-towinchenmi@gmail.com>
References: <20241023044423.18294-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The block found on Apple's A7-A11 SoCs are compatible with the
existing driver so add their per-SoC compatibles.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 9c07935919ea..63737d858944 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -18,6 +18,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pinctrl
+          - apple,t7000-pinctrl
+          - apple,s8000-pinctrl
+          - apple,t8010-pinctrl
+          - apple,t8015-pinctrl
           - apple,t8103-pinctrl
           - apple,t8112-pinctrl
           - apple,t6000-pinctrl
-- 
2.47.0

