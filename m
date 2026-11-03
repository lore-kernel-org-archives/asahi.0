Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691619;
	b=GKdDic14bwBNyBX6Er7a/dSYj4EcGZnJvBTTn1164IES+Eh67y4GwqCD9VVyUev8jZSn
	 ezS98SuE77lv4iiNBkDgW/q3xSQJidpm7sVxrFpOH4e6UxZ1dXdrKY1cbv/49HSVQK0xf
	 wZxHd/YiWROincGOLGKWAwLsjtg8esYOzWDeqnISWBkDhdNRReif14G54ULgMLqo8JzPw
	 +fm1qOST78nfKeCJRI53lUcZXw5CY1df00GGtWrKwuAvuTZynE14FA0a5yfqXM3rVr/Nw
	 8tLvnOb8vOJ+V7RIcKlrS/xERsECB0hMYg8JL3qAxrR4ZiBsqDeoBxgI290T5blyvdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
	b=Ed9oOhhHZN9ltluKiHn3fceqynCiRuw/76bf+J6so62ctctUPEp9sK+NibzLwiaWmIGR
	 fklntiy2oUGgSNGnPyBds2RO6XsFnQmKMpBhNYHHg8QCB6nFv8lq6mBzYigz6iW3f2Q3C
	 8U58xXso++i3QFEeSpWoIZZGzbZJ/MASrRxewmaTRFUOFHdXH43gioceMogYEjE8OP8jb
	 B8frQd3H+apcN7uacXchNIU2WmQi6hZXpBZvn2XVJy9c3zV6Ir3FU1E/VzFMCQYbEoRCB
	 uwHfrrWDf6LCWraBQL8sl3MFJsPF45GBo/eo+m6jX9bC4c9wPl72zXvMfsUnIKRiMBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zhbcArjQ;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BFF606A332
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12BFF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zhbcArjQ
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso2279676a91.3
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691618; x=1794296418; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
        b=zhbcArjQpKgnj36QSl8mR0Zoad+a5+vseF4wEEIMaj1aQHomwFaSb1P7buMJEntdC/
         A4+55ObMcX0JYC8+/Mv04pjgrNPmGeSWCmUIYmhOU+k16G3uqSdtNxt4G1cprQOMhmcs
         K6KbLByw/9psxDGkVxGH0kghERKVjC9O/MTUKyWixuKtmHICbeL4BzB4Q0UgML4RPQlh
         714VLchJO5HKGl8I/11+RabCPvKbaDxlwFsnJxdVkaKlzqDiNhgQla83xWgMqyOIyznZ
         QHMedR9QMupYP5sXDcBJObTdh6MBlh/eYYrz1Aidmc4pv4It5BhJaztdb4kFgkvQdZZm
         o1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691618; x=1794296418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
        b=w4SMjBiOPh6pHvRCTjmNlx7d57c7IUDLaZWp5xSawgGwPFmo1wVPGOH5J84Mlx1kRZ
         89RUAGiZge+bKowEeLeCC4GbGCQlbnCbk7Hbj0l94GPDXEkr+iCoUU8GqIoJTkV4Be/U
         WPGEV/kUFCT2PrBviffurLLWJ587+07dKJkgUwUhFZ4NoFxm3dN0kG7QNs4Y6J18NgXO
         eG8juRrZpJIFZINTHAWBfsz/EYW3iPNVnyIRcjBsF/nHWgUW6fIxFA4x2e67uM4xAbxL
         zBufVuW1ArmDqVF6uoyKR/bAyn7Nd5WFasow6VehJdWnNdi9xwrrY37aP4DuZVIphEt2
         Xdtg==
X-Gm-Message-State: APuU4Z9wKt1HIAY/VinHrHX2EFGDhCjmjbNBFoIqL2ey1EkERSiLA4WW
	HAsPCvNYDAJjDvjSIcVKJbYKZYlleeUkCg8Sw382oNcL7HRaqUzwUxlj
X-Gm-Gg: AYBFou3yGSFnq7Fg49nFwSwcgIMT7skFam3eojm0cNADsi2s12O8UDVm36RlDF3DuKk
	fFY69n+TvK9HUqdLafkKbcgUAuS0z3GeximGIysgd++q0TcHPs9L9Hj3K0D5EjOlrhGPIIjUC7o
	grTYENshD3jeulZjQU8GcJsLDSfa0rEtJoGZgztzCmIuw5KtuD2jIfvHfxIqSz92B2gA0b128Ah
	WSdLH1G2/KBbpGrFUcucJwQhLbiGmLo2hJ/XZsqaWYaRRIP8C3mKoKu00c9MW9RyGml31LaNTV5
	5z0PTwwp9ahmEgCJBb4Zg+sD6meGDkaqSvvYQ2gV9NDm6wXBu9A5zp2TsHEqnp7QGV7E7mUP84J
	CCEO+josPkAaJSErQgn08O4cne+UlOWnLWUvMhME30c3pm1EIRDE/EIGWctWh50VcS46amgx5aH
	VT869b/shjKPj8Nd7j+0EoMtqpyQld7hUErlvZeSk2H/4eXb6LzF29vunG+JjjgnV7orgAuNd/J
	ei0/6wiii5OUWHFWGx9gY6zFRWa1noPsylMTSsoFxRD3vd4/1xqxF6avRkpvEk+5jxcCu4pNwq+
	osw9D48xwSgl6Q577R2/lpM37OkAuKdFM2MDx9RtNh1pfTiVfPtR2FEDZJD7XsLrBZ+ZYredn5f
	fZ3nlDqZeuFw06mrj0zV3ygniczrEUHP4VhA+CzhDKfoWiz42/ktm+jAVJqBhnrP8spICNHrykk
	jba0o=
X-Received: by 2002:a17:90b:380c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3ae89749415mr9681387a91.29.1793691618392;
        Mon, 02 Nov 2026 23:40:18 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:18 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:49 +1000
Subject: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced
 dai-common properties
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
Message-Id: <20261103-macaudio-v4-1-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fSXLE44RdgYerdaSvSI97z5S0Urixj0efXODzvWnMbw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+uzimxE9rIuctleWOHd6XpBtbrKs2M2dzt87ke7
 DI/p5jTMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOr3DQz/02ICznJcm/+k9ciposevG2vm7L/yXF3ud8sENTubx31fbBkZVsRWc1z
 fEHvLY2916xEr702FD3vrZ8gFMXfwbnqoa3eJHQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many and set #sound-dai-cells. Allow
this by allowing referenced properties from dai-common.yaml.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..66cae8b7db5d 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
 maintainers:
   - Martin Povišer <povik+lin@cutebit.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description: |
   The CS42L84 is a headphone jack codec made by Cirrus Logic and embedded
   in personal computers sold by Apple. It was first seen in 2021 Macbook
@@ -29,14 +32,11 @@ properties:
   interrupts:
     maxItems: 1
 
-  '#sound-dai-cells':
-    const: 0
-
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0

