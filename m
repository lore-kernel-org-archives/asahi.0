Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4640918DF6A
	for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 10:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724148751; cv=none; b=fZdFtve0B3tAUDiMw8a6HokcwZWZgd9AnoL1X261eVfFdGO54VU7Z2zHS8Hh0M56DaUJWXbQTmPtJsmnDO2CnpoNeqPBLS5fh+qzxj6zlQ1i3lIGsHvfCql45vx5oZxp9g0zHA1m+gl9OGnOcc1BAsF6zMYZGYb27L1XnyB+naA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724148751; c=relaxed/simple;
	bh=VewtWXS49rpJWHjz1uJir39tVL9jfwaiGXaUkx0zaPI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YJANtkJ2aTzRGYQDPI2BlKLkhjlM7f3sMLtbGWeSA9aO9yVry2hLxhkxfwgYIEcXdxnbgcTxsMcal6v8Q9YWPwF313jIGDuV5E2Ju05F4gRItdA4E0FVLGpftYDINdJsGb/J988lhmCb7s/F7fvOqCiCFVTs5lnKr2dMjZgn0wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DmiHqxgd; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DmiHqxgd"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-710d0995e21so3899381b3a.1
        for <asahi@lists.linux.dev>; Tue, 20 Aug 2024 03:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1724148749; x=1724753549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kIAhfjDAT0axAt0+BwPuqQ3ky4+ehVgWPUi5t/CRCY=;
        b=DmiHqxgd7XvRifP9G6xzwjaE4w+CLxOc6znEA/d76dd7p+NxTJiGSvGjucwV2zDtog
         mEuN5H8ylQYSNx5jh+UXTF8JJSl9W4bCDk85/6mZOUd1/yyQhOPhVFcBEwu8iAweF3/8
         pQjDVtEcKFDh/GCnByQr1epPasoQzVitnIqcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724148749; x=1724753549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8kIAhfjDAT0axAt0+BwPuqQ3ky4+ehVgWPUi5t/CRCY=;
        b=ZfZ6tH3SqXABVLErGHAtsxUTtCwM53VGMzi9YB7pmnUw2Il8sJXPzBKrBEbdtlxRj+
         3dZGh5wa6+k+nJfdxcZps/96eQ981+kscfK9hEOJuS64+44s0kaIIgo0NcipadwrWzgN
         0NLuHnhwvTqNCArBnqItbNVI+L1Bh2zI+JEz2q8BYiTz0r745gzngc+4xNV3ZqDqI8SO
         ZM1vE/3gdeqoTgjQH7+slyZLf5op8+EFgtDixTYbPsaKoi7F9lfAIe337NPqZKJgA+I/
         1CBdutmS+JHY8itPFvZmspI4BITFk+d9918k6ucPoilFUi1lBTmC7QC6Rye/LuPfqxSc
         1TbA==
X-Forwarded-Encrypted: i=1; AJvYcCUZx9/q9OQVMPKYpHRcLhFzDT2LYPdG+vH0+Kaw0MkMej2hWxWGOMSX3EfwE2ZZ0bGJeCDGRxKYP9Ce7MZZb1F5jNZ/H8w=
X-Gm-Message-State: AOJu0Yx30bT0nsaBb795NJLuiWxUddgXzBHoAADaUwuerpPChx3VeO85
	9RwVirjk8jbBj1JS+XWUiG3DJViasguXPeAv3ZylQzq8OIJYHHxskZZgFRW7iw==
X-Google-Smtp-Source: AGHT+IFn+Oek7Agv106ZiUW5dAmUwXfOggJfDPRWsSst4ULyviFLXwjGXgAlAEpvMq4hMh5bAPWL7w==
X-Received: by 2002:a05:6a21:318b:b0:1c6:fbc4:7a02 with SMTP id adf61e73a8af0-1c905060b59mr14542718637.44.1724148749225;
        Tue, 20 Aug 2024 03:12:29 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-713f3c35cf0sm3111052b3a.173.2024.08.20.03.12.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2024 03:12:28 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Kalle Valo <kvalo@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	asahi@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH 1/2] dt-bindings: wireless: restore constraint for brcm,bcm4329-fmac compatible property
Date: Tue, 20 Aug 2024 12:12:15 +0200
Message-Id: <20240820101216.355012-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20240820101216.355012-1-arend.vanspriel@broadcom.com>
References: <20240820101216.355012-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When extending the bindings for Apple PCIe devices the compatible property
specification was changed. However, it was changed such that for these
devices it was no longer necessary to have "brcm,bcm4329-fmac" listed as
string in the compatible list property as it was before that extension.
This patch restores that constraint.

Fixes: e2e37224e8b3 ("dt-bindings: net: bcm4329-fmac: Add Apple properties & chips")
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 .../net/wireless/brcm,bcm4329-fmac.yaml       | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
index e564f20d8f41..47f90446322f 100644
--- a/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Broadcom BCM4329 family fullmac wireless SDIO/PCIE devices
 
 maintainers:
-  - Arend van Spriel <arend@broadcom.com>
+  - Arend van Spriel <arend.vanspriel@broadcom.com>
 
 description:
   The Broadcom Single chip MAC part for the BCM4329 family and
@@ -27,7 +27,6 @@ properties:
               - brcm,bcm4341b0-fmac
               - brcm,bcm4341b4-fmac
               - brcm,bcm4341b5-fmac
-              - brcm,bcm4329-fmac
               - brcm,bcm4330-fmac
               - brcm,bcm4334-fmac
               - brcm,bcm43340-fmac
@@ -46,13 +45,15 @@ properties:
               - cypress,cyw43012-fmac
               - infineon,cyw43439-fmac
           - const: brcm,bcm4329-fmac
-      - enum:
-          - brcm,bcm4329-fmac
-          - pci14e4,43dc  # BCM4355
-          - pci14e4,4464  # BCM4364
-          - pci14e4,4488  # BCM4377
-          - pci14e4,4425  # BCM4378
-          - pci14e4,4433  # BCM4387
+    - items:
+          - enum:
+              - pci14e4,43dc  # BCM4355
+              - pci14e4,4464  # BCM4364
+              - pci14e4,4488  # BCM4377
+              - pci14e4,4425  # BCM4378
+              - pci14e4,4433  # BCM4387
+          - const: brcm,bcm4329-fmac
+    - const: brcm,bcm4329-fmac
 
   reg:
     description: SDIO function number for the device (for most cases
-- 
2.32.0

