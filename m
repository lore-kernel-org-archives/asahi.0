Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633E73F58E1
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093918; cv=none; b=LeM8kyCB1WwHGKShc/MtyLplhAq+iPOqPDpac+mi8Petu0A0CYHIu38PNEj+SSKpbcrEuWZIbm9filvgyJw9JSRsz6V4Kgnh8R+JQvwMTpnywKu5lxbdAy/UOkL4JW/fSl31tFiCM15kdgHGaLmKALrc6xMSJkFxPLz2iWsl5is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093918; c=relaxed/simple;
	bh=QMy6dp1YVq8Hg9ZfB1NudcV/OzV5CrFIMt7zVM6hKMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6dwNSerAAYaRyhRMj6a29s9LgQRHcDLOhhjdoD+CTGme7aTwiAQZ31+AG5ZzEucTN4hKYSOHEnNOOq6VVAZNlTFAS188O6zMp4X1hgszsogxO/9c3v/GLNZaXw7TXcotiYXmxJtzyOevbJ59noMo94lfek7oX4bdiHJxjsBVDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qAKPQqKR; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qAKPQqKR"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a6f8525bfbso384319a91.0
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093916; x=1791698716; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ND6Xn9LGPIbgdWx9zVUU2I1uYz7XDZMstUVT6Q27OyU=;
        b=qAKPQqKRAxVqZu6zfktvsECxTrSbdPyJxJyxi6OxMcrC71WG0G1W7FEhxhvM+VzEwr
         ycxmyxaK2Iz0qj7dcM2YWnh7e1Ac6srtkOrCB7AfraES7nidP9exfQcx/+LbtVpRLIBB
         ugD+/rk0Fpv+LiEhZ+oYIx8OZszn5SZoCIH9XxECB1GZmvy4KrXK+LuJ+VxSY3rxbji2
         ULOBvf9zsWe8DyHOVOk7TWOIthWQf5eZAXViVWmEYD7XXqo1sRpXDYuG/ALSKc8F9aSi
         1DhxlNBtFdYPwC5kgY+Qxg6l2rTjBDSGA2rPB4S/bvEm0csNiwL1mY0d6uuTuYnizHv2
         zBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093916; x=1791698716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ND6Xn9LGPIbgdWx9zVUU2I1uYz7XDZMstUVT6Q27OyU=;
        b=D8+nX5yVHOz/W1CqJZ4vi+D+XS12Qx8jZh0310Fs2DL+dWZy/qXnda4ZWjWuvFcQZx
         zKJORiayRnD+VmVKSx/4UqJRLwRKZwWG/jYb6OdyaHqvRFLZe4NQsfKocw1sixwrqQvX
         CnpN1iwcldVza4ejVm2ltS3wyY28Wr0vguVRTrQAhdVDwLVQiENmwmPy6ZVoC4BnaHzN
         WIGrmFAWau04DgsgyIpylM1zmxjPtdkxrlhPOnmHoQ8Z17IL1EDb0uyn3nZBvBfvYw2O
         NAmKBRfBasYqfUI1itMGPCN1jGkTq+1W30i/c8MhAabINGIE03Y91nrAt1+sZ8axfvlj
         eKwA==
X-Gm-Message-State: AFq9FYIDwLDWee10MuywnTO0Wrovf1ntIe6oyjTu9X/093Lr06kYz86L
	4QB3ESUOu3ZDvbgyYdil47BWc2Eiqh7Iru53I/yEPu4S4QvJpjxfd4Hw
X-Gm-Gg: AYBFou0LYVl4VjZPbMC9ZtB6GZk+nxegmNR6qxkfJN5QpMb1P08VyeqbHoBsSoOEjUx
	4/X9FzEKN3YYxpqLA24I4Lit8CI5yP8YDiaXgIjIPNPecznnNZ2Z8LFzDBh1UHfSrtSGnnvThuN
	Yh3fZB/YpXQrxhBLYxcylT3AWEDPBuSpQ9RZuzqbJiZtylUzsH5bhR2OH1L41EVaKH1bH6783bl
	eOjohwAsczwxY6/Ua+oaagT7hc2ABQMe6BcwyFi6isXIuL1hb+C/ZlvZMB8r5D3FJp+lmRVCeYi
	kDfXuMZmPqPu5ue+Z+Vxw+AIgHxgI6RGnC8tXCKPBqEncJRHoD/R3bhF33Le1iZGabwtUdCqCPb
	epZpgcBIcCimgyUEcgQlTZab0itiTTSmAYoAkoFbQ+vrrE1OJXAMU6/rD2MGlbetRgF33WI6dWq
	SzaSETWdQDj/f/6z/qack/fIkdPo5vY13Dbu2eovsuEfEkWrMElzWXkr7ZQAWlReSVA7FDlfVq+
	V17S9vMcj+l1F+h3yWpgdzYvAbT6Mu2GlJm34WxgVp+RbqNOe/BUBA5tBhQHQT+txXyNQbHdXSm
	R/W/Q5cMIeikzEFtJ7st1XcuHdPqHQNSCkVQZWpJJ5TciTg=
X-Received: by 2002:a17:90b:2812:b0:3a4:cbaf:f152 with SMTP id 98e67ed59e1d1-3a6cec2fb6emr2736881a91.33.1791093915710;
        Sat, 03 Oct 2026 23:05:15 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:15 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:32 +1000
Subject: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple Silicon
 Mac audio
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7056;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=edwYXBTQUN1BJwuH/myONPpbVVDVKxKBlGn6cvmdYcM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+T8n6S05ssjt3VXeH/5abN0rD7X8l3TwfnwMveNC
 nZTjyX/6pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEx1wlNGhib72Y9aU6bFiwarVGz6cGLlmgUJu3PeybAcaEmz/zF56yFGhvPLv85
 urNso86dFdsvVpArpA09jsy7Lmf68f8T2CUMzJwMA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Add a binding for the primary audio subsystem found on Apple Silicon
Macs. This binding integrates the codecs and SoC I2S peripheral
used for driving the headset jack and speaker arrays on all Apple
Silicon Macs. The internal microphones on this platform are
connected to a distinct coprocessor and are not part of this
"main" audio subsystem.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/apple,macaudio.yaml   | 210 +++++++++++++++++++++++++
 1 file changed, 210 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..c0a04fab82d3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,210 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sound peripheral integration for Apple Silicon Macs
+
+description:
+  The speakers and headphone jack on Apple Silicon Macs are
+  part of an integrated audio subsystem comprising of Apple's
+  I2S peripheral (MCA) and a series of codecs. The machines
+  have a wide variety of topologies ranging from a simple
+  mono speaker in the desktops to complex stereo arrays with
+  dual-opposed woofers and tweeters all driven by their own
+  mono amplifiers. This arrangement can be expressed as a
+  set of DAI links, where the MCA ports each codec is connected
+  to are represented by the CPU side of the link.
+
+maintainers:
+  - James Calligeros <jcalligeros99@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - apple,j180-macaudio
+              - apple,j274-macaudio
+              - apple,j293-macaudio
+              - apple,j313-macaudio
+              - apple,j314-macaudio
+              - apple,j316-macaudio
+              - apple,j375-macaudio
+              - apple,j413-macaudio
+              - apple,j415-macaudio
+              - apple,j473-macaudio
+              - apple,j456-macaudio
+              - apple,j457-macaudio
+      - items:
+          - enum:
+              - apple,j493-macaudio
+          - const: apple,j293-macaudio
+      - items:
+          - enum:
+              - apple,j414-macaudio
+              - apple,j504-macaudio
+              - apple,j514-macaudio
+          - const: apple,j314-macaudio
+      - items:
+          - enum:
+              - apple,j416-macaudio
+              - apple,j516-macaudio
+          - const: apple,j316-macaudio
+      - items:
+          - enum:
+              - apple,j475-macaudio
+              - apple,j575-macaudio
+          - const: apple,j375-macaudio
+      - items:
+          - enum:
+              - apple,j613-macaudio
+          - const: apple,j413-macaudio
+      - items:
+          - enum:
+              - apple,j615-macaudio
+          - const: apple,j415-macaudio
+      - items:
+          - enum:
+              - apple,j474-macaudio
+          - const: apple,j473-macaudio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  model:
+    description:
+      Model name for presentation to users
+    $ref: /schemas/types.yaml#/definitions/string
+
+patternProperties:
+  "^dai-link(@[0-9a-f]+)?$":
+    description: |
+      Node for each sound peripheral such as the speaker array, headphones jack,
+      or microphone.
+    type: object
+    $ref: tdm-slot.yaml#
+
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      link-name:
+        description: Name for the peripheral
+        enum: [ Headphone Jack, Speaker, Speakers ]
+        $ref: /schemas/types.yaml#/definitions/string
+
+      codec:
+        type: object
+
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 8
+            description: |
+              DAI list with the CODEC-side DAIs connected to the above CPU-side
+              DAIs and involved in this sound peripheral.
+
+              The list is in left/right order if applicable. If there are more
+              than one CPU-side DAIs (there can be two), the CODECs must be
+              listed first those connected to the first CPU, then those
+              connected to the second.
+
+              In addition, on some machines with many speaker codecs, the CODECs
+              are listed in this fixed order:
+
+              Four speakers: Left Front, Left Rear, Right Front, Right Rear
+              Six speakers: Left Woofer 1, Left Tweeter, Left Woofer 2,
+                            Right Woofer 1, Right Tweeter, Right Woofer 2
+
+        required:
+          - sound-dai
+
+      cpu:
+        type: object
+
+        additionalProperties: false
+
+        properties:
+          sound-dai:
+            minItems: 1
+            maxItems: 2
+            description: |
+              DAI list with CPU-side I2S ports involved in this peripheral.
+
+        required:
+          - sound-dai
+
+    patternProperties:
+      "^dai-tdm-idle-mode-[0-9]$":
+        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode
+
+      "^dai-tdm-slot-tx-idle-mask-[0-9]$":
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description: Idle slot mask. A bit being set to 1 indicates
+          that the corresponding TDM slot is inactive/idle.
+
+    required:
+      - reg
+      - codec
+      - cpu
+
+required:
+  - compatible
+  - model
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+      compatible = "apple,j416-macaudio", "apple,j316-macaudio";
+      model = "MacBook Pro J416";
+
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      dai-link@0 {
+        reg = <0>;
+        link-name = "Speakers";
+
+        dai-tdm-idle-mode-0 = "zero";
+        dai-tdm-idle-mode-3 = "zero";
+        dai-tdm-slot-tx-idle-mask-0 = <0xf0f0f0>;
+        dai-tdm-slot-tx-idle-mask-3 = <0x0f0f0f>;
+
+        codec {
+          sound-dai = <&speaker_left_woof1>,
+                      <&speaker_left_tweet>,
+                      <&speaker_left_woof2>,
+                      <&speaker_right_woof1>,
+                      <&speaker_right_tweet>,
+                      <&speaker_right_woof2>;
+        };
+
+        cpu {
+          sound-dai = <&mca 0>, <&mca 1>;
+        };
+      };
+
+      dai-link@1 {
+        reg = <1>;
+        link-name = "Headphone Jack";
+
+        codec {
+          sound-dai = <&jack_codec>;
+        };
+
+        cpu {
+          sound-dai = <&mca 2>;
+        };
+      };
+    };

-- 
2.55.0

