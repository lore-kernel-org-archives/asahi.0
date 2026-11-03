Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691638;
	b=AWfnO4wleD9oMFb9Hc0baBkcT/WLX2PbAJNaEC0FyK+7rg/U6gmXKnEAP2c8euxnBSFo
	 AZ8lWXLuDqVR2n/hSj9HvCimqJJ9SsQBz0MbqlqlyZ7fE0FKt4qIRDAIizMiTdt+FoTUB
	 uCulDwPInoPq6qcMQmPqL1Bo8JKccGBrbIRGqOaJAGjaexQ7F553sYje+mizsWyOJVC0h
	 iGP+xuxer+vnupHVZE7k/+V6QDYapkR91t0dkL9rWz0YdB+Kvh14XhQCHdCqAQpzu5KQJ
	 0+GZ8E5XKmwHq3MTqBXtQslLcGi6rjRmQbNqVpkvvEEkPY2Y8meSQpzje2cuoBYYWvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=yp4HuB7tJhhnBtYoQ3GTZMcnVN91AFEtBm+pYgEZYA4=;
	b=I8ZswQZFEjAo9i6lsyxjClzU5vbTrdjQrakOeD28XnCLvqAr7y7lT6E0qMXx44alIScH
	 uE+GpasmRTVMtc3hABjDqsSegVqiR/zP3Im/WkYw+O2KBH/MsfbfMy2Gu6nm037jm3XFK
	 C8bKjOlGf8jA2t72njMXBlIu7EVAfrxRF8n6AO6xxvagA+tfGvxoAdk5e0Mx7XZW8fMGl
	 v++t1jz43UPcuTp+9jzgmCS2grYEqNMTyYkwNpW7zdjgenqx4JaMa309bVFfhlU8Ighfy
	 ZPBT5dHRlg/+87HClJTmYnMQ8Mk4hHlJvfhX4ACiSp6uHTQEj8Cm7Uu2Jd9D2L4N9xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gE3DqEKl;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97726606A33A
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97726606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gE3DqEKl
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso1866578a91.2
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691637; x=1794296437; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yp4HuB7tJhhnBtYoQ3GTZMcnVN91AFEtBm+pYgEZYA4=;
        b=gE3DqEKl0sWv2uIymQFv5RkqHc9/rZ0X72+PWMWimxorNujif5KBsHLtzhq0ohOfZH
         toG6vGRkRFUVMBcbq0qijD/Qj3CbAC7uJU/gaijs/58pTJJ51uSfieYNbTlu6gxzG/H8
         Pp32h3VZxwinIJUXdn/v0ptOCFRKat6aYDiBS3VCe9kGbGtZR7o2eCknxtNUSA0ZvQqn
         WHhNNQWHZSuWpmhXlhp+SL4uVCaSWQPu3RIGlG58f/Vu/kYz/HpwU8pdLIVJiid/BDro
         9V4nZNma4y2GTYrlNF1ikzsGaO7QDBMMeCRa+r3d8WfPJ1o1h3jtb1pXw3vfKC5iVcwT
         BpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691637; x=1794296437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yp4HuB7tJhhnBtYoQ3GTZMcnVN91AFEtBm+pYgEZYA4=;
        b=C5RLsGMrQEDgFMJTAHgiZXRQHZLdtzMydVjQp9rn9d/zJWHPk6mIxMgyps7lz/i8Ub
         B30OlnJQ3OUC2zdXNldYNduxWJ5yDOZg4LFmOMQI410SUjceYZFZs9rSaWShnz/VSSW/
         /0RN8Uz1S5dJBuv3rYfCwVcfo35fm6KuPimn/we87b52LJU0oFEILhjQKWjMWLWC8OZN
         3bCoww5G4S1NTwGcUJsfhFeyZrErDUnlPl+f3FECXd4dOsgIbaAbJyo0THqQcKlRffuu
         DC6mrumoTnidNEkF8EHjqNXfZDULFdtTYzNskiDjAaSyKFBgvxyKBnhOcaDHXlxVTUTB
         jnkw==
X-Gm-Message-State: APuU4Z+6q8Kro12Ae23hNNvvtnDhSLqZIOINeEYGkXkKQkt3ag1NgDHK
	3I5eM19pso/SLaYeO62U9vzwacxvc8QKMpf3cmQhqVAHbSH2S5GzmoNz
X-Gm-Gg: AYBFou3+ODl8Q7jQJxLuTmMD3daaWXllJNEd5HLOAwtQfHygcGQVgwnyNbEI9+DmqFS
	k+HkZhhP6rG1x2lz5njGgyBK+MMmDYfwIuiaGUAUh9caMbUjIiKhThVMWCctPPi5Fl8Tz7EG/ar
	0Hhtn7Hx4LvR+6J4WHh3b6D7mWRI+JuisdVsXMuw399jpodMieRRraNZJ2HWmsC8U86XK49uCxw
	E2g1J0fuY72rHtjXiR+6f2PyEKe+uItY/jD8MJhmHPAjyDhfHsyHou2DTWDqD7/echAPkLDzdRH
	V/9tHq8hLgtVP+pJyiJBaK1+V03Z/GLoMcYJgy93lX0G6JsiV/tmp6zYBoZd9NcVZOfJPub5Lzf
	pl7JdeHrd1rfdLtgERDg5wENABkKkekYKpGI6RXAXkk7dfVXtDC0orwG/A9q5P1LvRVOH6Iw84y
	foXPkCnolMqAyc6YCFdL0E9k35I1SjhMzZfLmWOJwyZrsY0DDyA40zz2Mh67buzHAJJDxtsIG1c
	GTJfr2giNfhMvgmKdnn9PnLOt2jjG2AoltHHaPdRqr0iWcnw47JEXXtg90cazG7klUs5PauUbxD
	FD/ZhF+eEo31xWd3ERyaj+qJMJjMbpGwGJfMiyPQcXXNdPwxQ3HIS5OT87UQIhzCzMrQQGEyeQI
	BXkfb953rp6vKMy/hj4iv7P52J2O7Co/630tTFIPh1RXxv+l5dDKN7s+unjxSRHSs0AcTsnQK/m
	AYSSqb5NKrtRvCvIW+9m0FWlC9
X-Received: by 2002:a17:90b:4f8e:b0:3ac:7f4c:a690 with SMTP id 98e67ed59e1d1-3ae897dfcdemr8833525a91.35.1793691636036;
        Mon, 02 Nov 2026 23:40:36 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:35 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:51 +1000
Subject: [PATCH v4 03/22] ASoC: dt-bindings: tdm-slot: Allow indexed TDM
 idle properties
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-3-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3352;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=lpUwLsyqda9INXeRL6PY6VLEX817T5qBt0mzKx25Jk8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+882p0/bfXvzvcc3vMICv64vqJBaIVJ45PaMIOl+0
 aK7r7k7OiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFP99h3D/9DvUYsCT528siPA3/Og83/xD+uzqmR/8m9/EH6Lp3dqyFyG3+ybZb5
 ebCpyWXD+8WpvzoYfbbyaIawF84VcgxrqJ9+TYgYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to configure a codec's TDM idle properties
at runtime based on specific dai-link-level conditions. This could
be achieved by doing something like

dai-link@0 {
    dai-tdm-idle-mode = "pulldown";
    dai-tdm-slot-tx-idle-mask = <0xf0f0>;

    cpu {
        sound-dai = <&some_cpu>;
    };
    codec {
        sound-dai = <&some_codec>;
    };
};

But what if we have a dai-link with multiple codecs across multiple
CPUs? What if the machine driver parsing the dai-link only expects
idle properties for specific codecs? We can extend the idle properties
with an index, allowing unique idle configurations for specific
components in the dai-link:

dai-link@1 {
    dai-tdm-idle-mode-0 = "zero";
    dai-tdm-idle-mode-2 = "zero";
    dai-tdm-slot-tx-idle-mask-0 = <0xf0f0>;
    dai-tdm-slot-tx-idle-mask-2 = <0x0f0f>;

    cpu {
        sound-dai = <&some_cpu0>, <&some_cpu2>;
    };
    codec {
        sound-dai = <&some_codec0>, <&some_codec1>,
                    <&some_codec2>, <&some_codec3>;
    };
};

Extend the TDM idle properties to optionally allow this indexing.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../devicetree/bindings/sound/tdm-slot.yaml        | 34 ++++++++++++----------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
index 457a899e8872..dafa5fa77006 100644
--- a/Documentation/devicetree/bindings/sound/tdm-slot.yaml
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -20,20 +20,6 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Width, in bits, of each slot
 
-  dai-tdm-idle-mode:
-    $ref: /schemas/types.yaml#/definitions/string
-    enum:
-      - none
-      - off
-      - zero
-      - pulldown
-      - hiz
-      - pullup
-      - drivehigh
-    description: Drive mode for inactive/idle TDM slots. For hardware that
-      implements .set_tdm_idle(). Optional. "None" represents undefined
-      behaviour and is the same as not setting this property.
-
 patternProperties:
   '^dai-tdm-slot-[rt]x-mask$':
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -44,9 +30,25 @@ patternProperties:
       a mask. The first element of the array is slot 0 (LSB). Any nonzero
       value will be treated as 1.
 
-  '^dai-tdm-slot-[rt]x-idle-mask$':
+  '^dai-tdm-slot-[rt]x-idle-mask(-[0-9]+)?$':
     $ref: /schemas/types.yaml#/definitions/uint32
     description: Idle slot mask. Optional. A bit being set to 1 indicates
-      that the corresponding TDM slot is inactive/idle.
+      that the corresponding TDM slot is inactive/idle. Can be defined on
+      a per-component basis.
+
+  '^dai-tdm-idle-mode(-[0-9]+)?$':
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - none
+      - off
+      - zero
+      - pulldown
+      - hiz
+      - pullup
+      - drivehigh
+    description: Drive mode for inactive/idle TDM slots. For hardware that
+      implements .set_tdm_idle(). Optional. "None" represents undefined
+      behaviour and is the same as not setting this property. Can be defined
+      on a per-component basis.
 
 additionalProperties: true

-- 
2.56.0

