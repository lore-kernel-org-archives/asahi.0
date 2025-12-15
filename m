Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4EA2DC352
	for <asahi@lists.linux.dev>; Mon, 15 Dec 2025 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791509; cv=none; b=LfBFffSrgF2u7wLFRyqyrEYWFSvK+G6a7Sah1gzGu9w43PZFchqeIIkwhBma+FArJxnSu4XGi3pjxBUNL90hd1YhVPxA504BRkMuKfCpyLhYERkLXYrVE/9dKpZtzt+ymcCsdIK5lyWWXqTTzwBN/8tdbDRWYiA9zVibfc+42jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791509; c=relaxed/simple;
	bh=1YhAJ71JAqllcUxuxUDlvMTFEA7zknc8xk9iFLWBSoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S0EsBF/N9Eu29+N18Bx45Sq18ryFnYx+vK3r4dr9Qn5uA2ziugDMXnodPvYZmWTNB8p4OqYOykaPhiZCnC4GxmHI0A+HWfcE/hWXuttxeB7OSRmAZqBIigSqjwnWkgdEP88Wb1cAQf65J9Oc1q7KEFocX43PhKBGh4rURdgGx0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAorzPsq; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAorzPsq"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a081c163b0so19693595ad.0
        for <asahi@lists.linux.dev>; Mon, 15 Dec 2025 01:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791507; x=1766396307; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQd1CFACF7OPtngAk8oFYqrLhlc/9YnP6z76rt/UJmA=;
        b=IAorzPsqjQt7AVxY8ecHU8/WLRxwkuhTI8LdIZ4BJfcttMzWtqNnXuSX3oNEljMaoM
         GJx1IdntIzeAUQ4nNlyY7qayKOhunSRsZpFzVYFeK2e5FL9d/Avv9vdL8vPWxoVhkYBw
         CMg8Szjy4S31XVF1ZQDlmPX0we5lN1oQq5nPhIHW7y/V1ROTGvJp6JeriSZ/sZpJbKUe
         O24wix8hoJxLJoy2farwg+GR+7B3s9DbrMUOhAUGfHRVTtWPFpVaqrbrcMFv2jkmJcc8
         AzAl7uMbJrMchSxVILNBtIKw0mAXLXfTG2JFB6Hyuuy6vWsV0hzQNN7/KRMeBMaEyxm8
         1NCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791507; x=1766396307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bQd1CFACF7OPtngAk8oFYqrLhlc/9YnP6z76rt/UJmA=;
        b=o2pA1LIQxZGYVANj3DB2RMi+kuyzpizY1ub71sOBsUYtc9ZoUH2Hd6EfpzEt33yYHI
         rBU/Lj4SsXHvM9b+bELlMjTUCxP6zTA9kzi2u6Akz5XVIVfemvXctSXvYEMOchXKgr+x
         1kP2EP9ITkqXpnfJS3v/XThsvSDkQuGREqEi9gNoiNRizKnERopVmtGK06CV6AqAFDPw
         P9hnpDchfFOaoFcqtsfgojymFYPyorCTZeoRy/HYRGVFTxILrK1QqdiSCKRlPj0t594i
         1PorZGE7fllUTVnnal/qdQHZ1DRbROATtZY/07TyoWpqohIjDlARTpBxqpxs9/2Sbz7K
         +PgA==
X-Gm-Message-State: AOJu0Yxl5EoqNZz56Xfg0BMRHoCF9DDoCZZHfLQyXjCgUHYwlqQJmMkh
	HNAhxN0ND3Tl9hEFepxLC/5EG2U9bw8fHJrbSI0tyaaDK4C0j0UpNT0Z
X-Gm-Gg: AY/fxX4UdKymFBNSPQDskdriT8iz7DxdjObatihy/KxzsqMQ9gkbgcK1IQq37fmBDU8
	kEzi+kufsC8hNdwZete/bqV28GOEty0LeCHTqf4JXFexHOAoUAob1G/sxt4JQoy7UMBhdDgZJq1
	3qAQoUQJgR7v2xV5gAOkYP2aFhUnNT5yIXeY7iptVuHZFBXSK8oX9PAkhzdp+351D85Z0MFMAIw
	Vj0726q1yyIb4rE3b8BFodQLNxykX0i6cfI5pGtY2UFn0Elj52gDl2YA0ixVSPiKxc2EMaLLUVl
	t59Z7+KQR0CdvCzK+m4yEnhxfvTaUVR6cHpDZru92G+KXeaXdcFupfBiQb9zgg51UHFpL3WYgmF
	xwZAQudn2yRVu0QWA0yOJ2W4qEoIvRw8TJ8wVRZbehZXni0JWsSGaXih0gBL+3ij0uyBh9KHwvE
	HfKs6/2dahfOq21wx89ulpZZuiKQx2C/VMRow9fPM/rF2X3nDGDBnPOzvwbkfOZOJN1ukiO+UGG
	uJxw8vHYp+cLrxsbxogaLnpyBHE7S4SsLLpL+lRrTKUQG4uKqmW7OQ2/dahhozpyW697YMb5BSp
	idc6IA6AGWNhy22kHREZ3bGPIZs2M0JUArpen1faxHvr2tafoug=
X-Google-Smtp-Source: AGHT+IHXjaO0kZdI0jvqgos1WrDuGav3uz9uPzrIQ/XBD2ij7oSPEGrTgf+//QBfvWQ0XjlmdCFENg==
X-Received: by 2002:a17:903:8cc:b0:297:f0a8:e84c with SMTP id d9443c01a7336-29f24386514mr104092335ad.52.1765791506920;
        Mon, 15 Dec 2025 01:38:26 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:45 +1000
Subject: [PATCH v6 1/7] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6691;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=1YhAJ71JAqllcUxuxUDlvMTFEA7zknc8xk9iFLWBSoc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215k3aCQdqL9kFX3Dy31+Ft+WOeXTaqtd8nmEOP86H
 /HtnbWgYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNUKNowMk4t+dz4091c+cuxot3MQj18u2+Gtdsd3Xd+n2n6z5fcsTYZfTKHWRS7
 C/1s+CnecWs7h/1z69ebCX589Alx0pI46m9hxAQA=
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
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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
index 5b11839cba9d..5f160eb6762e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2458,6 +2458,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
+F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.52.0

