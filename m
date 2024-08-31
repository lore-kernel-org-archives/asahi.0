Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50A68528F
	for <asahi@lists.linux.dev>; Sat, 31 Aug 2024 05:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725083832; cv=none; b=Itdxcpr13Ekc5dF69WPZYUpD6AoGMDsmge/9wqqfcYbZ9pCjNjWshQWiNAR8vL0A1BZTjGzjVoq+Rc03GaijBLFzSId+X5GGUxEedPp2rYoYrxN+cbCwHVcVtIcbTk87GodE9bgJUnXzCKefoBnuyolhm0vZDzDevhVaiLOnAu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725083832; c=relaxed/simple;
	bh=5tgSRq5lvBi6wvc1wgAZq4DW7ZKyyVnTtG108xrA/dY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJQqx1if6h8plKSPUxtBjGFNXkR40pyJ4MwU6tVkswaZ8VnOEJ3Kue4tk+Dgou1uGEuLwmACv9jEteKfA+uBNjCbMh3tQS5Agy3NA2aC+PX8sTjzXpkaU2q8Gs2TZANFWXUREnxfU4h+tk5KlVevjE/2WOyX9moHE5ybehPwNRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfTlhzEl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfTlhzEl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-202146e93f6so25179205ad.3
        for <asahi@lists.linux.dev>; Fri, 30 Aug 2024 22:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725083830; x=1725688630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UZMOJ9tZhYVHk/YEPl6bWyPievm93YsDD+e3s9SDgs=;
        b=cfTlhzElbuBsqJEyuDVC54sCX2tF4X2fH3Re3rGzNRha/3qIvd9BFWJ+7K91L3+Vk4
         mFGDoXCW6BukwZe2tZMgfwVvBFenGojV3nN7bwksH5m7lzlva4iVWULkDYyhdkBzfn+o
         mkdSzX4D172B8JgfVoU4/hSUpOkk4Dt0G4hP3hOw0YCVGs48rx310yRsLNGrt2p2ce6R
         4BFsoKG0qI5k2TOCl/RmgmU+f/AZmUxSvTvOvmf9s33QG3xiG+/1wcBDEG4s8hndQX40
         8Wg547ELYhycHgL4d1HJJU1Ck9ZaD9+gKuyvGyqEj4rH/6Ibhr753WtVTuhcQqHEybMI
         7jSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725083830; x=1725688630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UZMOJ9tZhYVHk/YEPl6bWyPievm93YsDD+e3s9SDgs=;
        b=eqcKdBlQPJPEAjTaH7gpD2AP2p1z9BcuGuVZGI1eVMa2ApVfZFbjm0t6ilwyvwzLoD
         TA4fXKd0Z41n8sJ/nSE8pVdg/+K2pH1Km742mBHP8c84L8ASqKZBQaIgDqxFsOeY8vqG
         VD0qeaAjIsEXE9x/Mmwyy6apUqQ3VBZ0qCn9QjVFMsqAiVKKf7DKGfUOpFBJaOyMifTV
         qAMZgnPpk5S91rrYLzjUgM7hxvJMfxvDUawG+4nRFN7myOtCXEvEWvMyNGPtCt2TtYW1
         8QYFUBmWC2AkVOHAx4xEGhXUOQcbmT4z7I1Fd8zTetmb00Zv6VvY7qEFshjvhv3YPO0B
         0xEA==
X-Forwarded-Encrypted: i=1; AJvYcCWZKNF+cfFOg91QeEHMPjfS6FN7XJ5IAQc1zLcqYXom4S9WJbiWktMlozvx70P1dTqUK/iVrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZh0pO5jTuvveR6QVRkSnG66obzI3SXLhElHRq0kZ61TSV/BY6
	jKktDEEmdvJADW7Vo2g+wQkJwSgeEOtDxtBMcJes2XyhadDPcwDrD+1fXnolOcU=
X-Google-Smtp-Source: AGHT+IGgyopLwUfSPL49E8730EhvLqPDRmGJc0WWS5mZWfB25NqZV3DvqNch7iHLN016VoFzOLtscA==
X-Received: by 2002:a17:903:41c7:b0:205:3832:ecc4 with SMTP id d9443c01a7336-2053832f198mr30229735ad.28.1725083829837;
        Fri, 30 Aug 2024 22:57:09 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2053aa8cb4asm12027045ad.271.2024.08.30.22.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 22:57:09 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	konrad.dybcio@somainline.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: apple,aic: Document A7-A11 compatibles
Date: Sat, 31 Aug 2024 13:48:16 +0800
Message-ID: <20240831055605.3542-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240831055605.3542-1-towinchenmi@gmail.com>
References: <20240831055605.3542-1-towinchenmi@gmail.com>
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

