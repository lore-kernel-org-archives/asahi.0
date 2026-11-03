Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691628;
	b=IpX5Asv3IERBB4Bzapu1mF1tsYH/bDhyWLc7Gabczuc6UCw9dmgrYOTI76UbJdk/G3fX
	 00Iqi+GFj7zGNWRbow5drvmrdK7S0ONexA8q/n45PVDrS3eD/JXAQN5n72s6/s2Y/WM7K
	 UDwBC5Dz4ke6BsRyxYffBEI/OkdIYdUNX69i6Al7c4QvZNr62v3Oypg5LSQdD89au4Ese
	 aLzfNY2aQ+Oe8l0Od1klXRstdhosoaPY9ciyPm/iRl/QTBZIGwxwUgk9N59EW95o2xZ5M
	 h+k7qWvqikuLYYI0fVCrk8gsVsxs/IWe+IiMC42ltcgFZsNcBFtrUx76nXYMOdegeHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
	b=w67XTJvM9yQofJ3t8TZB7ZdL4DJNDBnUZxYQQf50pYRwtOeAVO78e9pkg2fuVxBMwx/2
	 bMRtii8cDOBMcIh6G8Djtor28VU7rNV/AMftz69plR43pitrSPpfEJocsT1r6arubnlFJ
	 RDG7txaWnvLMS/K58jEhzoOYgtt7KJTY4P2D/fBOq2sLX4X2ZXktl5Xq4r4+BQNpFpPas
	 QcLwqT0UV9ePHsBorI/BYjZ/efFmbxeG2M0MvuapdL/mXyYaVmpVrH/E4MXmjLwHpYD1t
	 QbTHJMSRH9zBstQ57G/jJToWyv7wwkmmudin9OpF/cdvuCk/bj5QQQxIRZMedSi0nXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gnCuKLb1;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5345606A339
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5345606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gnCuKLb1
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso1251182a12.0
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691627; x=1794296427; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
        b=gnCuKLb1uXzv6/LkENkD9X5UgFmT0UnaP8hUpzYMNN1RkWxXWShcgdKf3XugPIPDs4
         w525kzlLQywaNmyiqBvo59OW51c5wkVks1UP7Ib7gpotvesCXd0IOgLRzjHy8c8KipD7
         Ok7tGKwUbI2+T/i4Hr/Aysmi+Es48FzW3vwEb/d7JGZPDYP82S+5nMcLEIcVaGLXJI9H
         upAZYacx4H/AKN4gG/nYkmmjgXo+3MKUvTOTlQqtIEAg9mPPLUoGPM5r0c0L7pyTv083
         izOeYqM6T6riEh+Gt620yUCtQzSO4qa9znokyL4hSLl9YDV9Oi4zIJXTxMlahR2GSEYW
         7xVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691627; x=1794296427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
        b=q1WQm9B2u3/1FhS0eh/AA0YVtJAnXQdTlal8c48/a+iohXqmdWlqgnWWncI0++pU4C
         pxVnlOdSI6TMm0K7oZj0yxSRl/pFPdNiv35sOa8aCmF3Bhb16d2xeT0RPdyYWABNhUlL
         +ggn84euYIhm29+8YAkyYIeBtiCwBM+x8Lnun1HQ89KhZgo3f4f9jRb/4unc/4No1s4U
         huRTmqjyZcQv/cwBQjsXcKoK+rQ3TUrYBmFOYt1kBCChTBxU6wFqtQ1BfVzEoX8nZbwl
         LhLlnf9d4puvw91+qV3fUbonyxue/iV6ScOsR1NB8dpy17kJ2CyAWpLUwOuuGINgnGnl
         gWSA==
X-Gm-Message-State: APuU4Z8qWt+lkEPlWmXSzSAkV/otCgDEyzd9JB5LCrKR0CU1DA/bwE/u
	AOx2IfKhAcA/w6binhXxJLgJ1MXVb0ac52TynfBigDK0ZBXvosginli0
X-Gm-Gg: AYBFou0E+ta41W9RirUF80hqA2WqmdvWaJ+YuY6vpFjvZL76WQfCGz9vC67bmy3pmra
	UCxzGqnPXC1B2vc679rAV34lA8POFi+H2CZQfCKEnnZTsaT3DrQMYwzv+4b520uQwsQ5o1aBD6y
	hGXaAkwdmy0cmr0uaTsi/gVl/BvZpFC9h0+lx5UJrAmuBv8wCduGCbqsJi88jrdlslh7+RO2Htc
	WbvSzV1cIdC9wqLcFYKV5S8JjlCjDTjYcCjdKie3c99XdCJTIb3DIzOfU2+QDEo1nnspazoXTrW
	c/WoJ7RqJhVBHtDt58BX79JhOvM1ldH4PJDSzl0wzry5P32/hcoCQkJiWN140A1n4sBKQaO7Rl5
	dmz1sNYd32SSY7Gx7X0xogPy+4xlHrPE4U+HPYGRawEtYytUTrrb/iOKDHngeEn9CsO8cZuYxyU
	sA99MqRDfE2bfqE6P26kn0WCAa+3dqVchBN6xdXcWeNIn1mcYi6ba+rDGVPFLgtFOk1gt8URJ5e
	LW3M2AWz9lGy1KFn6FQrXnFSnCh0Ytc3VLuy/wYPz8cePvp2pgR3WC0yd0vFxeME3QqDqAQhkCl
	Yb7UKq0NsCqsdzaKjMR/Ts2WUICIPej6sOgZRFMgabmo4kqMJ0kscg56fih6BOthIHGON+ilDV2
	hIU7ouaMzWqXDWpUE4XdMNTtM3OpWTjqHzo8X82pJR9Htq8a0fukSijt8JNvkqUXnJoA86W0IyJ
	hEMxI=
X-Received: by 2002:a17:90b:35c6:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3ae89536bdbmr10927084a91.4.1793691627024;
        Mon, 02 Nov 2026 23:40:27 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:50 +1000
Subject: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-2-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ryTg7qu92xHmjo1HEk78arPtD12ewJvnTCmnNMpKI2c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+GpzjrzeRvYWVum1gj5HNzyuvK1hVdiudFLu8N0
 n3S1ebdMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOoLSxgZrl/hNrrKf2TVhzo7z237FA8e3jH3Nf/qtR/St39hfNBQ0sHwV3TNTE5
 f7x852/mjXWfWXk/xiHl+5AhnQ2rTYwn9Iv0OLgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

We may need to define both #sound-dai-cells and sound-name-prefix on some
machines where this codec is part of a simple DAI. Allow this by refrencing
dai-common.yaml and allowing its properties to be used.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..4ac0af34c464 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description:
   The CS42L42 is a low-power audio codec designed for portable applications.
   It provides a high-dynamic range, stereo DAC for audio playback and a mono
@@ -193,7 +196,7 @@ required:
   - VL-supply
   - VA-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0

