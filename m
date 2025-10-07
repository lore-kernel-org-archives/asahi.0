Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8682DA76A
	for <asahi@lists.linux.dev>; Tue,  7 Oct 2025 11:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835857; cv=none; b=DuHdqNyCIkAC+5mkgbDXcDQiK2mQQz07McY2FP4iJrqkMaf3ekfXMGk7Y7mBQFYnqWsT8di9cMmv73DusSCqqMM3JzqWD0rV9pFRAsp4qTFGFbDh/LagXMWDtgJe/Kp5Ol+dodu5EM8V8lh5K3ptyw6r7gAmcGIYPcUGrQQ+PPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835857; c=relaxed/simple;
	bh=laVpP74gTzMbo2qrGHUEyEkSlszTpZA5CERei0FVY5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lskkWVWBxQN6h8HidYE1I3y2bNrTaduz9e9MxhZ3PT6Trc0HNrfHYfJUMgoUfB+vf66poNZd9gn6EGO6855KJ8rIzw2gKxJLmpH1+htt9datfpYRQ3X8BsaZSs2Z9bnl5XDmsvDsXzywB41UIgvX3/rahEWxEMIx9PcJlsy1pSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LPwhqn1c; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LPwhqn1c"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b553412a19bso4389805a12.1
        for <asahi@lists.linux.dev>; Tue, 07 Oct 2025 04:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835854; x=1760440654; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ati20Ylz/khRNYG15B4+E/fLC+jK8mAaQ816iOPHxo4=;
        b=LPwhqn1cJv+q/KVoD+G80ww+zCVod+5/wZUAyKqr+aL5ENkWgdyi1lUGJwm2hciYQT
         3nHWKWTm7DRBsIyr8qy8HUGBMmX0NmjG+0Zg5o/qyPzW7wUL7Tfv/LnDWZ2XxmQvqS1O
         zZxy6SfNyedKpf0+msrg7+nv/ZEMBPRoxq9GR9R+4cDrTpxESjgfWjPEBAFLpAVXkEOQ
         SaBXWki5Uhg8rDZ6KPMJ2ol1RhcXPzuT74UuKuU45YYwuObDTY27/vJ2SWMiVKwp52li
         xp6/zQrvNukU5ok0mQXXG7UdELfZ/AiFRfM+WoqvgvKtRlnHfFJAY5y6Xr6lugAjwIOg
         ABlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835854; x=1760440654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ati20Ylz/khRNYG15B4+E/fLC+jK8mAaQ816iOPHxo4=;
        b=mv4T1cESHVXwEv/ejDHcu52AwyR41iwa1hKc8Vzmf/hURVotnuQGtEz0jQcr6xj/qL
         hgaMwgZ9hZ3rCjf8qQZ5+nDDaiQ3ccouSjMumpI0XnzTW4gWQWygOWn731hSTkXN2Xop
         DCloIar3QchQx6a3uEJViuymYSXUNlAwXJ7XovDyGXNSgL/Faufs9NCXnWWJEP2k7KC8
         Oii7saYw0N+EKkAdmUdvmr+jql1QkLp0kvAwq1tkH/iFBWlFISJFzY5/wry5Izhf72Gf
         AO8vgjYldev7PqFnemchWhhBjhcOytDZTEB+YoDSLFvQbRwEOaxD+nUDPf9BJZnTdO0a
         MlcQ==
X-Gm-Message-State: AOJu0YzxRZ31l6qa7+oGwoEn4pmc2Clz0lZ8hRe6aNJKiEXyVD8ilYpZ
	KVW8hG6lX15kk8Ku5kQYfrRiqqGjdDNHrWkXvpTTlBWy6E1Dhyit6Jc1
X-Gm-Gg: ASbGncuMzhMMuMPDg9kqnOAZ6tz2Af+SAO7EoiBhxcTeDk6K3igoESjU/GvANScVOCM
	Bjqq8m/iK6opqM5THHkUIRZvMsS/eaeEQWlypuI+fFNx7c/HnF6K9k/pnKYibzRByHfpQ9O8/xE
	Yed98QX/6QwmHZJAotAL259KIj6YzQ7qypXunFkRw7KYpB1YoxyngP/0b8r0WZcBUCmCMMhcsFm
	LSNthgA1Xz1TV503LmWq6xDM55bTnUKHW8uyjHQX0a3DnwfTs2z1hHAWItTUKKjo9FgL643DGSw
	75iLDQBvmFOEmm8Nqak0crKU/i3kAMF58sAwF9Np41peQteDiwxH026w+jhsBkGjzOKKsDJI4+q
	jWTDXzFnhDpG6fWI+y1pgVQG7PwnMVJI4T0N8Ig7sQAt5KPH8reWsW/UQAy+YbmcvX7TsUZjG1k
	UhXW4jboenZcjYeAUvR9Q8JAfbWb0hOnpBl9tg5IhFgw==
X-Google-Smtp-Source: AGHT+IEhXXBkgS53UtOPSU9xv9VmoipHjlFpFVZVBxm49fBbGCyRWBRrkT0xdjC0nLzp6fPABCn6yg==
X-Received: by 2002:a17:902:d50e:b0:269:96db:939 with SMTP id d9443c01a7336-28e9a6b0dcdmr219162705ad.58.1759835854077;
        Tue, 07 Oct 2025 04:17:34 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:33 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:43 +1000
Subject: [PATCH v3 02/13] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-2-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6641;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=laVpP74gTzMbo2qrGHUEyEkSlszTpZA5CERei0FVY5s=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3lO6Wf/5I7V2qC1Ml9R6Ydsd7NdJ59yXP/soyL+
 24UKrJrd5SyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjCRGR0M/xTu2asYrrj+vODf
 srBTN445tcez9GjOXjBtZcEitRPzX9xgZNj0a8/XzrTaNUGh7DKPxFMffmFw4LbqyX7tE/jHczH
 PKhYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple Silicon devices integrate a vast array of sensors, monitoring
current, power, temperature, and voltage across almost every part of
the system. The sensors themselves are all connected to the System
Management Controller (SMC). The SMC firmware exposes the data
reported by these sensors via its standard FourCC-based key-value
API. The SMC is also responsible for monitoring and controlling any
fans connected to the system, exposing them in the same way.

For reasons known only to Apple, each device exposes its sensors with
an almost totally unique set of keys. This is true even for devices
which share an SoC. An M1 Mac mini, for example, will report its core
temperatures on different keys to an M1 MacBook Pro. Worse still, the
SMC does not provide a way to enumerate the available keys at runtime,
nor do the keys follow any sort of reasonable or consistent naming
rules that could be used to deduce their purpose. We must therefore
know which keys are present on any given device, and which function
they serve, ahead of time.

Add a schema so that we can describe the available sensors for a given
Apple Silicon device in the Devicetree.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/hwmon/apple,smc-hwmon.yaml  | 86 +++++++++++++++++++++++++
 .../bindings/mfd/apple,smc.yaml          | 36 +++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
new file mode 100644
index 000000000000..2eec317bc4b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/apple,smc-hwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC Hardware Monitoring
+
+description:
+  Apple's System Management Controller (SMC) exposes a vast array of
+  hardware monitoring sensors, including temperature probes, current and
+  voltage sense, power meters, and fan speeds. It also provides endpoints
+  to manually control the speed of each fan individually. Each Apple
+  Silicon device exposes a different set of endpoints via SMC keys. This
+  is true even when two machines share an SoC. The CPU core temperature
+  sensor keys on an M1 Mac mini are different to those on an M1 MacBook
+  Pro, for example.
+
+maintainers:
+  - James Calligeros <jcalligeros99@gmail.com>
+
+$defs:
+  sensor:
+    type: object
+
+    properties:
+      apple,key-id:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: The SMC FourCC key of the desired sensor.
+          Must match the node's suffix.
+
+      label:
+        description: Human-readable name for the sensor
+
+    required:
+      - apple,key-id
+
+properties:
+  compatible:
+    const: apple,smc-hwmon
+
+patternProperties:
+  "^current-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^fan-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+    properties:
+      apple,fan-minimum:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: SMC key containing the fan's minimum speed
+
+      apple,fan-maximum:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: SMC key containing the fan's maximum speed
+
+      apple,fan-target:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: Writeable endpoint for setting desired fan speed
+
+      apple,fan-mode:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: Writeable key to enable/disable manual fan control
+
+
+  "^power-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^temperature-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^voltage-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 0410e712c900..34ce048619f5 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -49,6 +49,9 @@ properties:
   rtc:
     $ref: /schemas/rtc/apple,smc-rtc.yaml
 
+  hwmon:
+    $ref: /schemas/hwmon/apple,smc-hwmon.yaml
+
 additionalProperties: false
 
 required:
@@ -89,5 +92,38 @@ examples:
           nvmem-cells = <&rtc_offset>;
           nvmem-cell-names = "rtc_offset";
        };
+
+        hwmon {
+          compatible = "apple,smc-hwmon";
+
+          current-ID0R {
+            apple,key-id = "ID0R";
+            label = "AC Input Current";
+          };
+
+          fan-F0Ac {
+            apple,key-id = "F0Ac";
+            apple,fan-minimum = "F0Mn";
+            apple,fan-maximum = "F0Mx";
+            apple,fan-target = "F0Tg";
+            apple,fan-mode = "F0Md";
+            label = "Fan 1";
+          };
+
+          power-PSTR {
+            apple,key-id = "PSTR";
+            label = "Total System Power";
+          };
+
+          temperature-TW0P {
+            apple,key-id = "TW0P";
+            label = "WiFi/BT Module Temperature";
+          };
+
+          voltage-VD0R {
+            apple,key-id = "VD0R";
+            label = "AC Input Voltage";
+          };
+        };
       };
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index 745d85b66365..10f4c0034b5e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2418,6 +2418,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
+F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.51.0

