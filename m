Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A848218E367
	for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 09:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724923638; cv=none; b=N0z9rxOpOqUGS8ZOFN+O+FYoish1V1Vxl+eDvRNBc+b8W7SHXagQ/pB0JdLYrCtcglD9Lp+vcCBmomwCwPzwc08b6SwhObdYl9eUziVpONSSP7U3ySTlKDuSn7U2ccx9TVICI6ZcgYbPabQspTpvdR8KA1L0JYrEIvOHEcWZgL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724923638; c=relaxed/simple;
	bh=uT/olKuIlcr3QC6mwRur4wcEv7An/PaeW6enq2v+qoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HvDtceMqfLUYbbgozUcOCwNmb+qQVouGIkPH2Fu7uB2UhIK78oL9M8uQzdsbGZqKWUZYkfAuNWHuIsccnKnzs2wiGnpII0BW87Zg2xTZWUNWbHPlxwRo/RJJYmentNroErIIY84v68JeWlCax4Fg6TxpKSSex+bL99MGxu2LRIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b1tK7LSO; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b1tK7LSO"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20219a0fe4dso3545085ad.2
        for <asahi@lists.linux.dev>; Thu, 29 Aug 2024 02:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724923636; x=1725528436; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egoeKFBc4uhrvcZ8Ktzuy2NXVWTzG66ZP4Z1nx7Pk4U=;
        b=b1tK7LSOgS/rAnOingTTvJfYTBejPTDscOkt1NXr+P95V5PwkYLR+KGDz7m01WQR0k
         FXui2jzfs0e8rfYKGigolbdOpWJ4jcjMH43jj6doy0IgnH9h8vOj8N4DZxbWvO/BKTwA
         gSJAOKq8rtkvuf9gvHYH5u3rg5s6E72F0LnWWuA8G0Ae7APW8Q5WqpGLqwj3gn+uvmLe
         aZjp7Fcfigx4VpTA7ida6OB5HXSkcTnOAHMTEL3JWnrTyeuywMKPlkj2Hvn6toZOZVCx
         pVsWuMpwbpGjmvatp0vYONbK25U5B3MLAQNjIKSJb1TUaCN/UyjZY+pv8orIX439ASvc
         obFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724923636; x=1725528436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egoeKFBc4uhrvcZ8Ktzuy2NXVWTzG66ZP4Z1nx7Pk4U=;
        b=p/UTUmp0ZQu4QZO6c0uvHYJoPWIXPrXK6DW3Jij8Q5atN5TXnAK1xyD4XC3ohXMYDY
         zl5AmdGMIhCzi3W+uBQ3bsK8Zh8T7wiCjR6V41g1lrLhBUob5QAPaDUZ7Jv/o5SVHCmB
         fkSdU4gijJ/mBI9tNmS9Ezqpqf5IU10JB+K063V5ikvxAW1IsDRwJj8wCgVFmlKhkNkv
         CFktLAe+dvYbYfcInruhVwP5Hmbj7zTsys8yEhWTI2XpNh4P9Ze37AxLNKPNYPcVidDh
         56TwpnMcd6gkOMSUJUDzdvXWDnYdOh2kLglGPF4OCPi6aDIYGGKH2qQu7ccBBQagApwd
         aLJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaR6PkEkpuwa2duZ/feaXAyChhX2r6iDOhCyDDDK4K0iqyTVuxfDjPHEO7PTMhMwMr2G80/A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxmzJJZ4wVujfiS6yDwvqTehnCnaLq9SaLpKaJsmL/6S21Ez20g
	Jq4lKQW7JNdph0UuM4OOosSPMzfm4LKrB+Xn1BKrD+1bdWDbyLpN
X-Google-Smtp-Source: AGHT+IE9a3/PA7Hcwin2yUXCWfoh1SSkESId1pC/M9tB8Z80zr6jplNAzD80CEsYGdj0Bz74E/IN/w==
X-Received: by 2002:a17:902:e848:b0:203:a20a:a596 with SMTP id d9443c01a7336-2050c21a680mr23635065ad.7.1724923635850;
        Thu, 29 Aug 2024 02:27:15 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20515552b6dsm7469245ad.249.2024.08.29.02.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 02:27:15 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: apple,aic: Document A7-A11 compatibles
Date: Thu, 29 Aug 2024 17:03:11 +0800
Message-ID: <20240829092610.89731-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829092610.89731-1-towinchenmi@gmail.com>
References: <20240829092610.89731-1-towinchenmi@gmail.com>
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

Each feature level is an extension of the previous. For example, M1 will
also work with the A7 feature level.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/interrupt-controller/apple,aic.yaml  | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
index 698588e9aa86..28e09b933087 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
@@ -36,9 +36,18 @@ allOf:
 
 properties:
   compatible:
-    items:
-      - const: apple,t8103-aic
-      - const: apple,aic
+    oneOf:
+      - const: apple,s5l8960x-aic
+      - items:
+          - enum:
+              - apple,s8000-aic
+              - apple,t7000-aic
+              - apple,t8010-aic
+          - const: apple,s5l8960x-aic
+      - items:
+          - const: apple,t8103-aic
+          - const: apple,t8015-aic
+          - const: apple,aic
 
   interrupt-controller: true
 
-- 
2.46.0

