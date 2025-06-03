Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C5123024D
	for <asahi@lists.linux.dev>; Tue,  3 Jun 2025 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951854; cv=none; b=eYOIYF5MTtenZqE8EIDOydqfMrtMlmmt3p4iCaMEr83kIxipXS7dnSmJwpTW7WhLinhFZ+z+WyHkpXd+PDc4gw76XfrBDuciXPd1y/6dySwNkvow8yOcsUKkx9R542pe8sgVMbdjhEMP/nQ8ipXztaVioZwgqouMj3UGnVPXkFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951854; c=relaxed/simple;
	bh=pbB5PzrHWvVUn04LbVYo2MNOE6kLsW5gBdzmEzOHczU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bElXkMgnAbPJMTUElW5pijf2yhf0AyFh4RWBx+0aaMV/LI5jQs3qlPbuiEMmNk6W5Gpsqmx0t1/2cwAEc+lCOTOWhDVFmUF+nqfLRU1cLCF1dGJHTdMM9G9wty75etFmDqEjm0zKey8ZXTfiEAmXb9dIY0bsM0ixk+wbVNLPdZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WD3bgg4D; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WD3bgg4D"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4e749d7b2so812772f8f.0
        for <asahi@lists.linux.dev>; Tue, 03 Jun 2025 04:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951851; x=1749556651; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ExhN+XF0N6J6awaTyjEwEtgTC+vyO+pqDRvv89W3ABg=;
        b=WD3bgg4Db6FIP0lhxV5J5iXmxnE3Rxk061yMSEPl1bldy6svDyoqYz385M63iq9P9z
         gDf97Uj173Ma7yZ1Amz64mTv8LdDrUtjAmRojv7DMMnqOzH3cNpEB5H6dV5V0LuJm2Y5
         E4iXF5x+zJhzspS0ViySsh3SEVrkQDln/RUxswX3lyrvE/n/9VoxmxfrCYqoCWpFzxud
         o0jsPlvJ0JLzJ+0wAC0rPwMON/Nj5iYE4Zkd+N+DynL/iH3OHbiH2buAn1HzaFmc+72f
         MeVbQMhleLuHF6UMN7tfhb6YjVMVX9mTDVvs3ukcsw8cd4VHGzYEoXt4hgktV1Cly8h7
         KBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951851; x=1749556651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ExhN+XF0N6J6awaTyjEwEtgTC+vyO+pqDRvv89W3ABg=;
        b=wIvFDtU+Z5TR5CC7UFKlQqYAky+NqZsBhsMEWs1ezQrQdWXeTMIziE/siWRZyQXYVX
         QXeaW4kOC1o0QASFIWv1/5g68fgDAPgLtZ5CtuXe3v4qF6kAz2Ksx30XM2pRSeyYeDaz
         vriwtKQYMSc4/E2xGPHH/osawsszHTkpObv8z82apVFz+crRpWLyR+NHAIWybHBv/ZMz
         UKJbsuzHIF4FOSn7nK2/33g5QS2Vw8AH0t8GHx1OAfDtBsFRLDuWrl+BsqMzU2VEWQJC
         yUOUQTUmX/fseb/QQ1LznaxXVRBKpFqxZZtX+tJ+Gvar3MFaT/XUhi+OVl9Ltz5rG/pz
         hMMg==
X-Forwarded-Encrypted: i=1; AJvYcCWgBtB6or3UktJiS9w9UYwrGDdU6QvEtMgvB32ZG7aPUKsmKi7FWCaUXFFc1cWwZFkFi1S09A==@lists.linux.dev
X-Gm-Message-State: AOJu0YybGDj7d80nJJNMg8eI1WO9fmIOPlm6Az3WNvSF8CFODbEXXk7S
	vhZyKsELVOB/aSXq73KQBJBVnitaLQe7JutNMJKl6xpNkDPesvM63yCgdBFZ33Q6iKo=
X-Gm-Gg: ASbGncuz2b5CojlMLZ0BVwTDjkYpnuXWCX309dadZ7Ou5ctquc6vtgiWXbv7zsWLooI
	iboPtXoJyoi7gTs5VO9Eg5veWQVnNDWpUVX7Fg3IfcHnugpgAs2IwmxoWnb1Z9BsUFIABvnmQc6
	IJKLZqm0HqyAQrQG4U9SGZ+ZA4IeUM0lp335ylPcpoVxIcJxgwFGIDAc/T7eAZWlrgVAfIQcLrm
	lHmXb94kIHlr6kj8uROQKi/w8QP88myJa8ZGiPDJBz/uuYmGwobFCSkhbV+1ukX1bBWH7VrKc7Q
	raIXGHl6CWjq+PMPtUYHzZTM3ZasFa2MV8iWCSbrjOjkabdbym/VyAflLReDf+6bns6kA44ZTYh
	TqSqEyqX6Yyzd25anJ4hnsQ==
X-Google-Smtp-Source: AGHT+IFtYARGpAfUwedcZUr+rv2i3DwXIs+E+vyvXAOm1JZEhhjjlgKaNxSVWr0jm35V1p0FWxTuuQ==
X-Received: by 2002:a05:6000:144a:b0:3a4:d7c7:89d1 with SMTP id ffacd0b85a97d-3a512c0dcf3mr920895f8f.4.1748951850998;
        Tue, 03 Jun 2025 04:57:30 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:10 +0200
Subject: [PATCH 3/5] dt-bindings: mailbox: Correct example indentation
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-3-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5065;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=pbB5PzrHWvVUn04LbVYo2MNOE6kLsW5gBdzmEzOHczU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMdIBzxTrvdsP5gds/d0vjogFtPZqCCBexkU
 t2g8c+MQ+iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jHQAKCRDBN2bmhouD
 1xFyD/9L4+1GTV5DN1265YZBVsYfGT671n0VhpafJSb91mwvevxDWPkwfY40WAvavWVSdnU+oKt
 Oul+mg/UJQ89kOSzcxD5LsRCQ9Acsti3Mrc2v+VcXQ5aaKGlGq7jt1acfeHhjeNosEAA5Q/7GGm
 eGS3YqpRuHV86siWBlHPpFj41TaROQ96ys/d/JfM1FXitBk+o3yBl/OYpWLB7yPVR2Z10titntk
 KnMS7dslZtULk5I/aSaL/TbCHAPuqYMwom+/SLCL+0+ujJZiLU4XJoZ+lOGclDgOgoRXIVmFHLy
 irFm7Ztc9RUbHsC/CWQiAZSY3kGwQHDfxSbCfdceTq8dLC8feQ5/8UwFAvJP5pHuUCGmLp4nOj9
 NCR3wksI5Jhat9TOXbmwNu8Kz2+urDI5jTQ3cX7HOojU8O4d+lByyUWVZIP2AlA/C20a6gv+e4p
 P02u3sMkeIYYEcZYgTdJAs+VqRVrdEHt2IO21B9N3257zT4/OF95e2urmhCQyJ+Bi8SjdskB7jQ
 zyl774llaFFuVkbXNBCuRXGiLGYdXtf5iES9z33x77UWRyzpUFqldA4EucRbBYnQR3KT5SomaK+
 yDnULbjaDeWyLOrtLDh2fBnybkwPfmkdFDiBKfXFCiWAmJFWEfh/RFzExHvT0ZxT9pmyAT0IrdY
 RkEvLVdycgzd0KA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS example in the bindings should be indented with 2- or 4-spaces, so
correct a mixture of different styles to keep consistent 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml     | 14 +++++++-------
 .../bindings/mailbox/amlogic,meson-gxbb-mhu.yaml         |  8 ++++----
 .../devicetree/bindings/mailbox/apple,mailbox.yaml       | 16 ++++++++--------
 .../devicetree/bindings/mailbox/ti,secure-proxy.yaml     | 16 ++++++++--------
 4 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml b/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
index 75d5d97305e19f50059e61a4db2632765885e850..87d31963c1b73c956b9782f029b1a5ad2654f507 100644
--- a/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/allwinner,sun6i-a31-msgbox.yaml
@@ -68,13 +68,13 @@ examples:
     #include <dt-bindings/reset/sun8i-h3-ccu.h>
 
     msgbox: mailbox@1c17000 {
-            compatible = "allwinner,sun8i-h3-msgbox",
-                         "allwinner,sun6i-a31-msgbox";
-            reg = <0x01c17000 0x1000>;
-            clocks = <&ccu CLK_BUS_MSGBOX>;
-            resets = <&ccu RST_BUS_MSGBOX>;
-            interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
-            #mbox-cells = <1>;
+        compatible = "allwinner,sun8i-h3-msgbox",
+                     "allwinner,sun6i-a31-msgbox";
+        reg = <0x01c17000 0x1000>;
+        clocks = <&ccu CLK_BUS_MSGBOX>;
+        resets = <&ccu RST_BUS_MSGBOX>;
+        interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
+        #mbox-cells = <1>;
     };
 
 ...
diff --git a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
index 0849799ee0c5caaeb27fe1e3e3714a630a7c2b09..79963c9878bad1684fa0810ad71554af2ceeb75d 100644
--- a/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
+++ b/Documentation/devicetree/bindings/mailbox/amlogic,meson-gxbb-mhu.yaml
@@ -46,8 +46,8 @@ additionalProperties: false
 examples:
   - |
     mailbox@c883c404 {
-          compatible = "amlogic,meson-gxbb-mhu";
-          reg = <0xc883c404 0x4c>;
-          interrupts = <208>, <209>, <210>;
-          #mbox-cells = <1>;
+        compatible = "amlogic,meson-gxbb-mhu";
+        reg = <0xc883c404 0x4c>;
+        interrupts = <208>, <209>, <210>;
+        #mbox-cells = <1>;
     };
diff --git a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
index 4c0668e5f0bdc1e03404cbd58a392465d30b0e8e..474c1a0f99f34777e1bed7fc0a34f89320a93b7c 100644
--- a/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/apple,mailbox.yaml
@@ -78,11 +78,11 @@ additionalProperties: false
 
 examples:
   - |
-        mailbox@77408000 {
-                compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
-                reg = <0x77408000 0x4000>;
-                interrupts = <1 583 4>, <1 584 4>, <1 585 4>, <1 586 4>;
-                interrupt-names = "send-empty", "send-not-empty",
-                 "recv-empty", "recv-not-empty";
-                #mbox-cells = <0>;
-        };
+    mailbox@77408000 {
+        compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
+        reg = <0x77408000 0x4000>;
+        interrupts = <1 583 4>, <1 584 4>, <1 585 4>, <1 586 4>;
+        interrupt-names = "send-empty", "send-not-empty",
+                          "recv-empty", "recv-not-empty";
+        #mbox-cells = <0>;
+    };
diff --git a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
index 682ccd76f5c25fc13bb3375007d39e6208cdddc0..c321b69f0ccd3cdc7cedefadf46982b42cce915e 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,secure-proxy.yaml
@@ -68,12 +68,12 @@ examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     secure_proxy: mailbox@32c00000 {
-          compatible = "ti,am654-secure-proxy";
-          #mbox-cells = <1>;
-          reg-names = "target_data", "rt", "scfg";
-          reg = <0x32c00000 0x100000>,
-                <0x32400000 0x100000>,
-                <0x32800000 0x100000>;
-          interrupt-names = "rx_011";
-          interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+        compatible = "ti,am654-secure-proxy";
+        #mbox-cells = <1>;
+        reg-names = "target_data", "rt", "scfg";
+        reg = <0x32c00000 0x100000>,
+              <0x32400000 0x100000>,
+              <0x32800000 0x100000>;
+        interrupt-names = "rx_011";
+        interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
     };

-- 
2.45.2

