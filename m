Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183C524F4F
	for <asahi@lists.linux.dev>; Fri, 11 Nov 2022 17:34:13 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id ft34so14002727ejc.12
        for <asahi@lists.linux.dev>; Fri, 11 Nov 2022 09:34:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sg8vUQYLH6qQ6hP1k9ymeq/CLq0kgDdouy7o+4KV0LE=;
        b=okYUdMdVBuwxBAttFPyzw69Cgqhkovk4+Z4IVbjdXXvMv28xzhzA/StwrHhm6K7bAv
         Cuemha8ynrBIhFj5RttItckgrC15GyYilDzdBZhgiN+Q4W9P0Hdg7K8yxS3mU7sL8C9x
         Y5rUcO3ZspB8WIduNB9eSgOBzxSiIJeKnqh8Gla1J7PhW7sy/AZezpAKZwTQcgzh/ytv
         beycgcAqNTxNe6Av+jK5MkU4CPKz/sPcXHPYNvrvr0DHz1LLCAVKY/Xe/9tBJI8Ofiq4
         nma2+503ShQ6I7uw1Ax5arHEY60qE2e0bnVJP2Djl12H7sFlhcGEsX9ZPZIBo0LpH58Z
         ckyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sg8vUQYLH6qQ6hP1k9ymeq/CLq0kgDdouy7o+4KV0LE=;
        b=iLZLGFWcdp1ohvF46c/RuCIqvtmB9oQg+ES2jXL4YJrc8juwfEArN3YQOHtGh5tAKh
         6uBF/PGfQdPDjHMr20ra4ECFRJEHT1fNfhRK+Lqc5Iacxao5cgSCyxPlQSCe7q4lqYZB
         MZFLZ8ok3TA7ZiZf9w3DjaR8e+7SvNQ2tAZI6BSsUIXx9JXjXhnp5w5tFF5+7OkJ/uKr
         Ez20HTi7ThXl/kE14+LZ4GVSHG7Oj5D5c3FU2qBtA/Lf5Iqv+KdlywWjJ4gWh1VzHxHt
         0/auX6na0lnPeEue/liHN4cDN1aJ93w8c6FBi2+pq7+q+myYXtkjhHJirXrnpZFDNQz2
         V01w==
X-Gm-Message-State: ANoB5pnx2CvY6GPd12xTG674DpPtKWIFKT2xrLibhuBw+iSvhEDTfAa6
	cnRdw4AjEvoKGlQnhN7f6bM=
X-Google-Smtp-Source: AA0mqf7eFwcyXUZdKn3GQ9scJrTpWoiH4VQiki2Gz5ipZtHrb0HyTwYeHdM0YDpCqQ2lq63B1CwjXg==
X-Received: by 2002:a17:906:c18b:b0:789:d2fc:41d1 with SMTP id g11-20020a170906c18b00b00789d2fc41d1mr2642401ejz.642.1668188051450;
        Fri, 11 Nov 2022 09:34:11 -0800 (PST)
Received: from localhost ([85.153.204.139])
        by smtp.gmail.com with UTF8SMTPSA id b19-20020a056402139300b004637489cf08sm1293119edv.88.2022.11.11.09.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Nov 2022 09:34:10 -0800 (PST)
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
To: thierry.reding@gmail.com,
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
	Krzyszstof Kozlowski <krzyszstof.kozlowski@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: pwm: Add Apple PWM controller
Date: Fri, 11 Nov 2022 20:33:45 +0300
Message-Id: <20221111173348.6537-2-fnkl.kernel@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20221111173348.6537-1-fnkl.kernel@gmail.com>
References: <20221111173348.6537-1-fnkl.kernel@gmail.com>
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
Reviewed-by: Krzyszstof Kozlowski <krzyszstof.kozlowski@linaro.org>
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
2.38.1

