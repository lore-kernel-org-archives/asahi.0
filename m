Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32EE28FA
	for <asahi@lists.linux.dev>; Fri, 11 Nov 2022 21:29:24 +0000 (UTC)
Received: by mail-oo1-f42.google.com with SMTP id g15-20020a4a894f000000b0047f8e899623so821963ooi.5
        for <asahi@lists.linux.dev>; Fri, 11 Nov 2022 13:29:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIp7jd8BG+VyztOlnNrMSKLknJT+C5EdBhL10GKzhBU=;
        b=LfPKdt0ztPkpylJoFtIqqZTeE37Ii04b924exNMI1288BQGS9ejlj4pJBX8bB1yKPj
         tEH3lkqYx9AWffhdeMwcfKwbTs0lZYGfiU/ZIliywxIAnpWdATSEBVO9mkCRrIHwuYNS
         iVuYOEI9D38WjZ7AsSvvaYg+UXndLJzjbtFELmin2CbNKYR8ACcrA1o+N4ECyZXmIxEM
         5s/s/7HY+ldCDLioS9Eep/vDfT6qtAoMtl5/5EmUXFU+7eypFpdOZePcVTb/yge1lEmb
         vx9Cw3YPo2p1IOuo3QZR66X0xNme4zNCBTsR03Peo/YBPsE55w5fYXngLK8xnEoY51SR
         GVkA==
X-Gm-Message-State: ANoB5pnL1iJcLsebwTZ5Xq6Ek5LhPhZWwxiO1T8DeX1lP5IdXL4x/2uV
	N6T8ftT5YCanPii6m+6flw==
X-Google-Smtp-Source: AA0mqf4qpdSnYe3yq24GgO3dKhAyK4uUgFYDUEN8XGhdue/Iag212Co/ECLO5w9c0X6gMaWFOQI4fg==
X-Received: by 2002:a4a:5884:0:b0:498:9589:b7ac with SMTP id f126-20020a4a5884000000b004989589b7acmr1706732oob.56.1668202163616;
        Fri, 11 Nov 2022 13:29:23 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t9-20020a056870638900b0013c955f64dbsm1802406oap.41.2022.11.11.13.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 13:29:23 -0800 (PST)
Received: (nullmailer pid 4104940 invoked by uid 1000);
	Fri, 11 Nov 2022 21:29:24 -0000
From: Rob Herring <robh@kernel.org>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Robin Murphy <robin.murphy@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Thara Gopinath <thara.gopinath@linaro.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [PATCH] dt-bindings: Drop type from 'cpus' property
Date: Fri, 11 Nov 2022 15:28:56 -0600
Message-Id: <20221111212857.4104308-1-robh@kernel.org>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'cpus' is a common property, and it is now defined in dtschema schemas,
so drop the type references in the tree.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/interrupt-controller/apple,aic.yaml | 1 -
 Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml     | 3 ---
 Documentation/devicetree/bindings/power/renesas,apmu.yaml   | 6 ++----
 Documentation/devicetree/bindings/thermal/qcom-lmh.yaml     | 2 +-
 4 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
index e18107eafe7c..698588e9aa86 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
@@ -90,7 +90,6 @@ properties:
             maximum: 5
 
           cpus:
-            $ref: /schemas/types.yaml#/definitions/phandle-array
             description:
               Should be a list of phandles to CPU nodes (as described in
               Documentation/devicetree/bindings/arm/cpus.yaml).
diff --git a/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml b/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml
index c87821be158b..a740378ed592 100644
--- a/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml
+++ b/Documentation/devicetree/bindings/perf/arm,dsu-pmu.yaml
@@ -32,11 +32,8 @@ properties:
       - description: nCLUSTERPMUIRQ interrupt
 
   cpus:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
     minItems: 1
     maxItems: 12
-    items:
-      maxItems: 1
     description: List of phandles for the CPUs connected to this DSU instance.
 
 required:
diff --git a/Documentation/devicetree/bindings/power/renesas,apmu.yaml b/Documentation/devicetree/bindings/power/renesas,apmu.yaml
index f2cc89e7f4e4..2b4d802ef4b2 100644
--- a/Documentation/devicetree/bindings/power/renesas,apmu.yaml
+++ b/Documentation/devicetree/bindings/power/renesas,apmu.yaml
@@ -34,10 +34,8 @@ properties:
     maxItems: 1
 
   cpus:
-    $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      minItems: 1
-      maxItems: 4
+    minItems: 1
+    maxItems: 4
     description: |
       Array of phandles pointing to CPU cores, which should match the order of
       CPU cores used by the WUPCR and PSTR registers in the Advanced Power
diff --git a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
index e1587ddf7de3..92762efc2120 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-lmh.yaml
@@ -37,7 +37,7 @@ properties:
   cpus:
     description:
       phandle of the first cpu in the LMh cluster
-    $ref: /schemas/types.yaml#/definitions/phandle
+    maxItems: 1
 
   qcom,lmh-temp-arm-millicelsius:
     description:
-- 
2.35.1

