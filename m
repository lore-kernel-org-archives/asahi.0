Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691645;
	b=ShBiLrpFOidRfuLDPWQTDNZ1jK3s0b3rHlQb34I8FJvwmj/DxMbxEzWwCy7qwBZ9Q0hx
	 RJuFs78ltPl1kQtIml//Jj/S3rOxOppUsQ6M7OHd8gq8lC3Ilnk+DvEVTtJ83b1iRdNrF
	 l+LqmfWq889ItdCQSsOQYG3mKUm/Hve6Ma6u5r70vz7PVUsbnJIK6KVZmtTokw3t8qfQ8
	 tm8UZxTDhn+JfUhfxM2C4uNcqx/uYuELRxpgAbTU+GfkBD1+IaJ44C6KxEZ7PiqWRAi4d
	 pHkcq7TIo8WS9HcwBRo0apXyEsokmKuy93aqNrpD3xVQVpAKK7QLcb8nVNJrHpZN36A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=VV91sp0zgzAnNndz8lEyYpW2VQkodDRsnrajblY9z1s=;
	b=3oxGtZKrj0BKX98Mmg6gz+EowVOpfR360qA/Xu+407wfQSjLExKvL+LEiERaj9Gep3u6
	 H/UpezcP5rXbXHNVdnlrdeVOyjS+h73wbO7CZc2OqkNMJXeu7IYw6EzMEHl7OD6YUZYnb
	 cSmwVVr0PFHVGKcG0rQp4JE4pi6hRm1CC8hYfnATJqrcpGmZrvk3kpRQZfsg/a1X0NKXE
	 VzgwUU+fiX2OUViuNRx2ahABunHtzcIMd2F94qjhQJrvolK+Jh/RSxFwAOBxDNe8Z6sIf
	 EvPi/opbRV9JMjixELdvuzlEdLZDlBx8UJtD472WqOTNu3AxOinxVebSH03WfRX+4+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQp4QUli;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4B7606A32D
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C4B7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQp4QUli
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso1772146a91.0
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691645; x=1794296445; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VV91sp0zgzAnNndz8lEyYpW2VQkodDRsnrajblY9z1s=;
        b=pQp4QUliTWdZNRUxi/9ttdJhcOernSIx9dHhoj3jp2zx7IJG0xMLNuYB39E66yhEB6
         XaESAEAHVDn3hocRajL2mwgDgJrWyG2aBt9wxhPPMZZ/5eKUlyo6Iz1ubPc/amJ9jRZo
         Nyws9saIvU4Ke4OOuWbe8mG2g3FCm6YazKkdkiCv4xk3MHZSMaYzhkbFHi5BHpch+tOW
         UTGlupmzShbDRnqsbEPTO/r0R8F7GLjb9QHg5wiWMsdO5PhEhOOuy7iQpmeZsxiA39cP
         sSgSm2DtuyOPM4WAZAh54xWkFGzKwE5FeFeIibHYk9XJCw5ExrBPleA+K50AzXUV/daZ
         z4Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691645; x=1794296445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VV91sp0zgzAnNndz8lEyYpW2VQkodDRsnrajblY9z1s=;
        b=T/lOX/KcvHNHr+eqkScF39umRLK3lNpAGXU0oGUEkFRt0hLlNLgpMwToiPyw/naLKA
         AGmIhbRFcY6vgDZ6KwkAXZjRcA7CabF/B+x7/uUOgskj4UtIrkB5k9PMTlg/TNmMOqtw
         L82EL/LcS2X9VGajoXhA09gNKlp1987mDHX4/VhsbaL2tsowyHaKy0CZIipLeUgqlK0S
         xM+fWohkkcLY0q06TQDZ+ndquQM5wQDd70NVueJ/HlIrbpJRXsDrUfeKUrdRTRjKb5W8
         AVAkPYG2XjDKh9wXwEirEcaMZcHOqXNIcPfDgn963ib4wBY63t+zfEnz+Ab6Vfxrbtr4
         tLXw==
X-Gm-Message-State: APuU4Z8bksazwi0Vgo8l7PwUx1+UE3q2Z/VjnFi/RYt4+ZeQFyC+QN2b
	/4fl1QF3kXFkS012Wj16CAz/UzN0ufTzBjcqY/2HPX11KF+tGKrqLAja
X-Gm-Gg: AYBFou1AXx5JR8ycMq4/paQRPI30SEh45c/Pe8WaDQLHUSg8/04Pbbx4YoGMrDS/7bV
	teeQ6Om9odOlhwOZev685juWkjyVj4kP82aw7p9vbOp5wg7/YaAR1f8M6hT65AN+wgferCxE3Jq
	yAPvkxdYanQMDeGb3BSOXopMB9zzYfJTrz+k67O5wgiGR5+wywZTs1v1lIq5zpkSBEvcuXqHPO6
	TJhZhx8y+Rbz5PGC/dvKh9/49cwl4R5B2rXPZk5ph/ANhds5ETr6drGoEZb5PcMKkKmQRieirlZ
	EtbM/FAJ7aRc3r0yYgqZbsWeBqfDUswyL+zUeRhq56P3+/q+1vE4wWqljr06C45T5iYkC99l8yM
	kYlnctL8XrdP/0ES1LKMMInRG7vRKCtRz7zL8rcLtntcRA63f4Rnu1uSE9m2pFUp+vValpcRBDb
	SFtNhQlIQvlMrLIPLw9QJpIBkINHHv0LLzTApnM1BPGiqysRsss0TdQayfjr+sareo4XSd1IaBY
	HV5iddYT7qStzRh+JAyiB3KbWFg0uZMZoItqni4FI/ilyLaE8ayZ3na4fmNvRYJ6cclTrQZrzo+
	wb8XqJjiv67czQwDAblmv+NEWHsfnjdFWOR9emN2DLhITlf1pHB3C9mGTV3JuMyhA4fnDFjAedi
	QtxWogOnWEpZtnPZ/go+lMnbPYOZCHYka40Qtywx1PwlnMYlp/KAty95iO4uC/ZAdxJzm7zx+z6
	Jf304=
X-Received: by 2002:a17:90a:e7cf:b0:3ac:9a54:e3ce with SMTP id 98e67ed59e1d1-3ae8986e718mr10689427a91.63.1793691644616;
        Mon, 02 Nov 2026 23:40:44 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:44 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:52 +1000
Subject: [PATCH v4 04/22] ASoC: dt-bindings: Add binding for Apple Silicon
 Mac audio
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-4-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6733;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=q6cZjCz9R++Ba7lkffXrC5JosZFNf04Vy9Rd1123Uys=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/usmxdxzhdZvNmS70e5/1RxxwvHDTkPndTUn2iz
 dTIEv8JHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKleEszw369Bo9xKgbn9AUfmUx9e8xcLJE4bb5K+/OLMi3PdO9y+azIyTPryTHz
 tkXnx6kdq9HTaPS9t+bA42k7a7+b+nyInzQ/1cgEA
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
 .../devicetree/bindings/sound/apple,macaudio.yaml  | 195 +++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
new file mode 100644
index 000000000000..7a97ce5bb7a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
@@ -0,0 +1,195 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sound peripheral integration for Apple Silicon Macs
+
+description:
+  The speakers and headphone jack on Apple Silicon Macs are part of an
+  integrated audio subsystem comprising of Apple's I2S peripheral (MCA) and a
+  series of codecs. The machines have a wide variety of topologies ranging
+  from a simple mono speaker in the desktops to complex stereo arrays with
+  dual-opposed woofers and tweeters all driven by their own mono amplifiers.
+  This arrangement can be expressed as a set of DAI links, where the MCA ports
+  each codec is connected to are represented by the CPU side of the link.
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
+              - apple,j456-macaudio
+              - apple,j473-macaudio
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
+              - apple,j457-macaudio
+          - const: apple,j456-macaudio
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
+  "^([a-z]+-)?dai-link$":
+    description: Node for each sound peripheral such as the speaker array,
+      headphones jack, or microphone.
+    type: object
+    $ref: tdm-slot.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      link-name:
+        description: Name for the peripheral
+        enum: [ Headphone Jack, Speaker, Speakers ]
+        $ref: /schemas/types.yaml#/definitions/string
+
+      codec:
+        type: object
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
+    required:
+      - link-name
+      - codec
+      - cpu
+
+required:
+  - '#address-cells'
+  - '#size-cells'
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
+      headphone-dai-link {
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
+
+      speaker-dai-link {
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
+    };

-- 
2.56.0

