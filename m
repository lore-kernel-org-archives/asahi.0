Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9A91922DD
	for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724929541; cv=none; b=iqgKEXdouECqTYsp9xJYGQZfRtYDx43+/z389a4/IGll/ZT7HCqYcnjEhKaaSJtLkh+2ieCPolbsxEIDX6rAiQ2xp9kx0Ajs5oDbVettWLNJKe7DwKCpmnnkgGLSxayMyU2ZCSIaWMUOoLZIL35jArmD8W5eTkQSdCcyjgtdfpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724929541; c=relaxed/simple;
	bh=/j92o8XunxPaVAVtxYK+L07dpPVfhrWfpRqf2TFJOz0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ecIA4QgGRgDZWmdiqDa8x8vTkSk0ArqYWnWFqaE6lLRodgMlE2tC8DU32G6lVLuWIPopKdYdkImN9jCufzWSAvJcVh88CfpbNhGOdwwtyV15pJvVoXz12MHZ7yhDKJXDZPcI5HnC3cms3SEvFhWsaURwEhmwVelSMoY3NGrbuQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OHZ0YvcP; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OHZ0YvcP"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4feb60e525bso337354e0c.0
        for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724929539; x=1725534339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ianpNl3jL8Gv0lHeq+hByhZnx3GF6W02IwZ9uRWxMpQ=;
        b=OHZ0YvcPjK7PHGUs4705yAj9kSsb5JgitKIk9CfirwO9FeRoSiAafwHjVGtqOF7dvP
         hpT6i80OE0RRHVwVYn/qLOP+ejzW6E1aCQjHHklGkec7XvhC/DUChrKo1FE9Yc3cOlrd
         skq9+tuggRrRG0oy1AlcLL3nbgWnVXNuBnpnyH41VFbxREs+kRu0IW3kGjMTFDoSA7OM
         MhOFlmBvUzE3YU5nL/dsD4eoblfDO1MRHHOYqfj4hprOvRiPQ6eG8oCTxsx1nDkRRzUY
         DA0iZuiHQHqp9fNAQqz3WektadQVHA+wLEeN16/u7Nzid+B3/TBrXHjFJJFGQrWMw9qS
         miIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724929539; x=1725534339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ianpNl3jL8Gv0lHeq+hByhZnx3GF6W02IwZ9uRWxMpQ=;
        b=JosJgW8buoie79uyogh+fIbsrINZIrEdQF6bYy0+dDM4GEQ+BjQKO1bLytu7SGJj8n
         o38s6aJrlSzG3e3WjrRLWNb8iUocPxohmjQ2ngfA2m5lKHE2j7G+TSODcnKhp0Xfje28
         yiwqydq2KUV6P6FPljSeyNcejAPT5GdMGXTr6OBM1Gshoj2tkX0XXasdPNlvll2Tw212
         g+zF61H4IOCMyQVm93ynE256aGuXvLS1zLAPdx/VGPSl1o9ZyHgzO/zYXDn2T5v8o+kB
         G5ZEmUTyVRLwQcGFhsbmA+8t8kDjgGX2QPcHvD6C4i9qHwj56sFrVQS84h3Lw2LjSsiI
         TayQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVRE8rPGWfrbJsTkHLG2EGEeetDw4HIyyHUZbEcOlw6BeV2M9VuCc9StRHtD+0h04tVaS56A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7gH4P8HUiSuyvivgmNYEWiCPFxyuMCdoKFRtSKc2CowACpuIu
	de52Ekzr+bEzA1sMgJAEaWOfErCxH4Q9QmVMRKoE+iyFlP79RIu72SGWKytD7pM=
X-Google-Smtp-Source: AGHT+IF6yBcBMzp8rTNq8i+IQc91e14+ebz9MBYVssN2nRk8uZQahgLcP+UIaAxH9XbozPbSUz9pQw==
X-Received: by 2002:a05:6a00:a1e:b0:707:fa61:1c6a with SMTP id d2e1a72fcca58-715e78ce1b3mr2227273b3a.10.1724929527263;
        Thu, 29 Aug 2024 04:05:27 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-715e5576cc7sm906671b3a.32.2024.08.29.04.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 04:05:26 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND 1/3] dt-bindings: apple,aic: Document A7-A11 compatibles
Date: Thu, 29 Aug 2024 19:02:15 +0800
Message-ID: <20240829110436.46052-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829110436.46052-1-towinchenmi@gmail.com>
References: <20240829110436.46052-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatibles for Apple A7-A11 SoCs.

There are three feature levels:
- A7-A10: No fast IPI
- A11: fast IPI, global only
- M1: fast IPI with local and global support

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/interrupt-controller/apple,aic.yaml          | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
index 698588e9aa86..2e38b585a722 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
@@ -37,7 +37,13 @@ allOf:
 properties:
   compatible:
     items:
-      - const: apple,t8103-aic
+      - enum:
+          - apple,s5l8960x-aic
+          - apple,s8000-aic
+          - apple,t7000-aic
+          - apple,t8010-aic
+          - apple,t8015-aic
+          - apple,t8103-aic
       - const: apple,aic
 
   interrupt-controller: true
-- 
2.46.0

