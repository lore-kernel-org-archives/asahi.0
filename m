Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4A646B5
	for <asahi@lists.linux.dev>; Wed, 25 Jan 2023 15:11:05 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id iv8-20020a05600c548800b003db04a0a46bso2842730wmb.0
        for <asahi@lists.linux.dev>; Wed, 25 Jan 2023 07:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6k6iH6ye4eNPwympT1HKSV19Z/5AZl0oVvTiapSuckY=;
        b=ahtGBzXJtFuPzd0YkuxCd/KNvneyK5hNhBtxCyDok0bmmfzkA61L1PVcwdXDyYVd8j
         ZWhDdz9OXQCZ95mAAk3Sw7HS1SA0qZYOJ75si6XBZ85tW70ux8fwL1xmLi5YplYW9z2a
         PH041UV2DgwwizTC+w20XPFaHaQZUOZiQ9lDUH+jQEaZQptQNcU3Fcl1/0+NDdzMmmte
         7mW/hiIyrLN1j7QGBH+wRbNCOmKP3IsrkUnPah1SGSQ3zYxfGUF2EwuSMrCz0DvHj4bu
         c6Ma6go8K5KIFjNDud9ycHukymznll+Dg9ShlbbSIfTJDCWcvZcman0/qVvK6R3xP87Q
         c9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6k6iH6ye4eNPwympT1HKSV19Z/5AZl0oVvTiapSuckY=;
        b=qmuHmlAYcMtAv0prTy9lr7MG61ryvvhTUea+F8s0Rn4PUM7a9QCLrAHPES+TgTIJ8K
         23x1oEbg0zZs4+qKKR7JNHGS5VUwHSIZRt41LHM2iSiX2llk3dHlFik+ALTxdy/XQBca
         nX9EoZti6FmEoj1JeU0UCgINUosz+BFMpaS0WhJkabh5Iz9IWIKYk9yxbnURhi96qNHe
         iSWg4P5bEMeuW5EOwB+ZQErJ7ghvlJ70hynU24ZV3eB/uH4nvv94chuK/WiAPICgSyRu
         HAT0JC0XAjFYqITUSdz95+BBRIoSEq8uw8nEOp3KmllZCU1ZQ3C9/J3fQ7y1+yv+2ojh
         SFmw==
X-Gm-Message-State: AFqh2kpClFp2/BBW/NMzwvfizhfVtmPttSXr4JuJOgntrS2x9f19iQDa
	j3rwUrJtVgrBxMnO5ZZlrFg=
X-Google-Smtp-Source: AMrXdXvTpleKmDKo3XRUkgwFgruiRcTXHdOiIS+BOchozQho/sHJzli4AG0NzfGbY3k3fda9lkwFoQ==
X-Received: by 2002:a05:600c:310e:b0:3db:eb0:6f6 with SMTP id g14-20020a05600c310e00b003db0eb006f6mr28834474wmo.13.1674659464119;
        Wed, 25 Jan 2023 07:11:04 -0800 (PST)
Received: from localhost ([82.222.96.52])
        by smtp.gmail.com with UTF8SMTPSA id t19-20020a1c7713000000b003c71358a42dsm2528563wmi.18.2023.01.25.07.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jan 2023 07:11:03 -0800 (PST)
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	thierry.reding@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Cc: marcan@marcan.st,
	sven@svenpeter.dev,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 1/5] dt-bindings: pwm: Add Apple PWM controller
Date: Wed, 25 Jan 2023 18:10:37 +0300
Message-Id: <20230125151041.55483-2-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230125151041.55483-1-fnkl.kernel@gmail.com>
References: <20230125151041.55483-1-fnkl.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple SoCs such as the M1 contain a PWM controller used
among other things to control the keyboard backlight.

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Sven Peter <sven@svenpeter.dev>
---
 .../bindings/pwm/apple,s5l-fpwm.yaml          | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
new file mode 100644
index 000000000000..142157bff0cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple FPWM controller
+
+maintainers:
+  - asahi@lists.linux.dev
+  - Sasha Finkelstein <fnkl.kernel@gmail.com>
+
+description: PWM controller used for keyboard backlight on ARM Macs
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,t8103-fpwm
+          - apple,t6000-fpwm
+          - apple,t8112-fpwm
+      - const: apple,s5l-fpwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 2
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    pwm@235044000 {
+      compatible = "apple,t8103-fpwm", "apple,s5l-fpwm";
+      reg = <0x35044000 0x4000>;
+      power-domains = <&ps_fpwm1>;
+      clocks = <&clkref>;
+      #pwm-cells = <2>;
+    };
-- 
2.37.1 (Apple Git-137.1)

