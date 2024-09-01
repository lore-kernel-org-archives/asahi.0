Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBCE249ED
	for <asahi@lists.linux.dev>; Sun,  1 Sep 2024 03:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725162157; cv=none; b=ED7FDZhtEDz4uyhU/taIO1sA2hH1iKau9GAhahwr1twTCmFkK9XX307lW/xxxkSHVjX43Gk/oP0w1b/gdJ081Ze0VWwUXTn1GEMWR2QxtKl67P+pa6JXsgNJwoHD7q22w+OshZpVMUyJz9/DyHrZwchdp81jM8XtpYoDTbav+Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725162157; c=relaxed/simple;
	bh=XTKSZNA1PDZHsBQHwS6oF9do6WxomCMOodlSA/e5p34=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VhxlMidNcteYXP7ix3d3TYZCEVNeYxh2uhgLE5gNlDEdreCzGCd2YgmA5TbZhKBQZ7R0udieB8xvv2jKNWff6FRkrum6n106I2Z1ME6lFqmacWUVxB3F6do1KPlcYAaGImqutMb265YI6ecQFmGqqTLLKMRv2Ob8mbqrdjXpUo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jtmn3KeL; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jtmn3KeL"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-715cdc7a153so2242181b3a.0
        for <asahi@lists.linux.dev>; Sat, 31 Aug 2024 20:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725162155; x=1725766955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yH9DpB2vOqWFl9C9V+jaABjITs0KYB7EL4dBUQbha48=;
        b=Jtmn3KeLCzikHdmJpz/8u89UGR2UrCCLBW/qBCEIHr6Wq2UBUgCkg+mDVFaX85HWN1
         YAw3RpljuF9tvblSoSBzn8INui8I7mC+phQNwGA9afIKzLo+xvng1Va8DbahViXI5kvP
         QKkUXPtAPL2on/PyRZB7qNd5Q7dZr7+ucKBcFfabJdLKdeiziEg/X1GuSyiGQjHhkUbF
         KjGMZh17qa1/nOpPlj9zcH6oaP/WXQDcptON7g0AiF2SxtH1yJC0qHL4RqWXcfxSie3D
         8b1TdgIh5ctjRTFjkLfXMlg5vkbkBh8jsMEZo1ZfDVkPbtjYUBYToLTob7qrMOs3d/EL
         Yhjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725162155; x=1725766955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yH9DpB2vOqWFl9C9V+jaABjITs0KYB7EL4dBUQbha48=;
        b=kLBSvdHpfxe3ug7A25PbGTOnoFeV44RUqxGV6KQ6RN1aa4cVFYOiEnErN3yIlRC5kH
         5Gy4KdoA0pkFJ2ih9Byog80TPmK2EKb/3AbCNBbg8KdZS8Y+Lu6HoRYKrWZI52kbPil0
         7jLixfUIrbbglezSxefCcRtWx7KP/PLRXHXrIGcv+NxnN9H/g9tqzTHjqQXnovBN/dAO
         sHDPgvQd5lptvMqHk/Z4KO6tOOFfTquXBeC5DHLZewa0/LuVr9ci3pVMpvP5A8RHsZTi
         BdwFD4LEjPugeXWtBKbl16bd5Ubdv9evni/uXuSKTYGB/qNriFNUEiWzxx+IMMDm0Wye
         a1gg==
X-Forwarded-Encrypted: i=1; AJvYcCVVg3bfEOsc+kv4zzsjLnjVd4gRSgjBrPsB9DCr8k98Um9UTTk5FkV1sKAeUf3BeskLh3ug8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0xWpRlw0OSNR5cb7Ee9zgwQV/mLJkStf9GnzjBF+MzI5haMlB
	j7tmwXjrJ9hTqg66nilgHZziEdExIV69Dll18gETEVMI9rwqZXlOKzPObW0WdBo=
X-Google-Smtp-Source: AGHT+IEObdUwisREopDN74WlXGu+MwK3ECILVmBEK+u0lfuO5t0y0gHsYBPq4cQjNKSsi8PuduAg6w==
X-Received: by 2002:a05:6a00:181a:b0:714:2922:7c6d with SMTP id d2e1a72fcca58-715e101f8d7mr19711987b3a.12.1725162155177;
        Sat, 31 Aug 2024 20:42:35 -0700 (PDT)
Received: from localhost.localdomain ([49.130.72.113])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-715e55771ccsm4826767b3a.43.2024.08.31.20.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 20:42:34 -0700 (PDT)
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
	konrad.dybcio@somainline.org,
	Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: apple,aic: Document A7-A11 compatibles
Date: Sun,  1 Sep 2024 11:40:04 +0800
Message-ID: <20240901034143.12731-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240901034143.12731-1-towinchenmi@gmail.com>
References: <20240901034143.12731-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document and describe the compatibles for Apple A7-A11 SoCs.

There are three feature levels:
- apple,aic: No fast IPI, for A7-A10
- apple,t8015-aic: fast IPI, global only, for A11
- apple,t8103-aic: fast IPI with local and global support, for M1

Each feature level is an extension of the previous, for example, M1 will
also work with the A7 feature level.

All of A7-M1 gets its own SoC-specific compatible, and the "apple,aic"
compatible as a fallback.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/interrupt-controller/apple,aic.yaml   | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
index 698588e9aa86..4be9b596a790 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
@@ -31,13 +31,25 @@ description: |
   This device also represents the FIQ interrupt sources on platforms using AIC,
   which do not go through a discrete interrupt controller.
 
+  IPIs may be performed via MMIO registers on all variants of AIC. Starting
+  from A11, system registers may also be used for "fast" IPIs. Starting from
+  M1, even faster IPIs within the same cluster may be achieved by writing to
+  a "local" fast IPI register as opposed to using the "global" fast IPI
+  register.
+
 allOf:
   - $ref: /schemas/interrupt-controller.yaml#
 
 properties:
   compatible:
     items:
-      - const: apple,t8103-aic
+      - enum:
+          - apple,s5l8960x-aic
+          - apple,t7000-aic
+          - apple,s8000-aic
+          - apple,t8010-aic
+          - apple,t8015-aic
+          - apple,t8103-aic
       - const: apple,aic
 
   interrupt-controller: true
-- 
2.46.0

