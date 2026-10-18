Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A30C36CDF2
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302894; cv=none; b=JbQ5ZbIRJ4iw6w0hFDVxr0ffO4wG/Ws/QY7OoI42WnCTC9iCSn+dN+Oy1VTOO4dNtj5F+og2vf22yRG3OiKGl2gdu10yCA66TUGXb81oa7AhySQQHjGjCCTBAyxUJ2s4U8M+iLxD8E9//dNSvAMWrq1EvbglfQMyfdoTaB0LaZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302894; c=relaxed/simple;
	bh=5IK2m6ZAqwOkwCJ6kC825xvIJPDhLKuUDHcpYolWipk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RMz8KbvZS9cswydglD/z8fzXPsHFJwt0EgHgQRtPti/MjLg1sW7TmPkLBXG5YVxO6QDUfpDMTWJV4MVVEAjpfIRE+3mnVohL2Njoo5rDg4famVDwMuCO43FPdwzwYtAhNdzm+Nciq0wrQuHJ30O9WYik4/qXfR+JYyscXuoKtiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=McJ6qzNf; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="McJ6qzNf"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so709017a91.2
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302891; x=1792907691; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cHPjo/FatMXlsf97zuv28872kDRqNq1vxWPR3qNxVw=;
        b=McJ6qzNfv9upEePnKBsqsbLgiGhWInPD602+DgoaooHncFOXEwvHqRKy/A6Pac0WUE
         JbPzndyrwMHOzEWR6wsfaRK+NEGX+ScfYkYqPEfLV5XY1wUU08/zJbF3vMxz/np8DzHz
         pSWIVOPnXUE5ztiEcDxLuHVNNGc1l/oK7562iBJ6+aP5gKBRur8fdnE1KzhOrmCtnwnd
         b/RKQEtaD+nX8XXQXhCpwjsW/YFz/ZmDa08vDwYR+jYMhQ4QUsMBf0MyzUAfjwgYrwvr
         poht4ZSTVixmCEjlcCqwNlMNHdhFE1ErrV9Bqr4FRkCeTzkYpyicr+hRIrd/kRMPaENq
         Bk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302891; x=1792907691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cHPjo/FatMXlsf97zuv28872kDRqNq1vxWPR3qNxVw=;
        b=A/PMTE7xemEITUXN1QFSVsAoMxt2OykIZPX6m46PpKJ74vfIp98m0nvLj1m/fipVjJ
         L0SpWJqVyzbwV1kG5xmsiRqXuOpVEU2NgnmW88Md1d+YmkSFP28hMQbl7T7kLyUt2xSx
         dAWXcZsLHw0RJ58W6Wo/1KMM8xxKZzewQWHmKTdmBm/+F9d8ehuEAN1B9nP3LClGQtMx
         U6LDzRs0RPTqUYo1m5BnTuR1TKpMNLh+nhwY90p/nlIVjXAE5zXCWLav703or3Kk2SVz
         3yiVIbOSKJf89XbmB7Cectrrm/6i/plJ1jm2XINRLvYRm1FREX+3C32fzE3Bk3fRQ4CZ
         aOug==
X-Gm-Message-State: AFq9FYK13UpUdHpbZsZapqRgLxm/2IlHCvc93D7asyVyTjJZRx7VLoOP
	LKjqkN9putvOv4/CxmsQ3BUjJBTs9je3FginfSLQibqpn1W1i7elywDe
X-Gm-Gg: AYBFou2A1OuElnP68Lcx0hY6OGEfuNsV1eySkoikb1iHPIdRlCEW+8Q8Ii7/i0KCx/N
	S/bS+633Hr02XW+ixZJ2jQxnSoOl5CTE7BVlLwIkSUSakSNwUoW2u/FfmnPy4YTdbPwF3L5QMt7
	QAE4vsBwEx6XJExnoQX2h0W8VccBLscLkokHJ/qCNX4sR3Mi31aQxYUeIg+xfISGuxlpUBOXl4O
	I5lEQQp0D0RXN6eVLoGzIPIDhwclaF+A1+lFvtzF3ZFOitVcYr/6CdpJiBGNimWi4ZfyxEH2NWZ
	l82v8CqKk+4pyqoenIlk/aZTGKITZOJaf5yHasz4QOMPPA2IOXWxDf1LVbRPK9PjiMAK6PxqF33
	XhiqNycuoMJMRGuoNL0wr/nzcK/MDgxJIxlkmYz59GuCOYIJhrDIr9mj7DGcix5ZnyaQJipx2RO
	mABpWMI55AL/nFHTP5oCTT4h5qLOKi6EF/fiAVlN+FM3+iV/C+so2xx3Kil59InFp2scT3yi8EA
	TiO1oxZuafL7Lt9Ae6tl6nx6dasbvImbT9ieAMkjfiqEQz5GoYGK5dC2oTGnlmxggPNMAHC4akO
	M44JVDGsabNLYJ7bVlEUQ1wM57AY5PcCCq5iF6fgeL8LNQ==
X-Received: by 2002:a17:90b:58d0:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3acef4fecf6mr3732599a91.44.1792302891525;
        Sat, 17 Oct 2026 22:54:51 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:54:51 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:56 +1000
Subject: [PATCH v3 02/21] ASoC: dt-bindings: cs42l42: Document additional
 dai-common properties
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-2-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5IK2m6ZAqwOkwCJ6kC825xvIJPDhLKuUDHcpYolWipk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rlTeKpVfv6wUL6uLDBT3M/t/rxVmzZdc+bY0etwM
 WGyWP2BjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTvjGFkOC4T3xDivMi+Xp+N9cutX7f53geaWFz59lmMK0t9j0zUWoZ/Ju+z2xn
 DitQ87ulqlx/71RBsrtutrMOfZxNj/tP5rzQHAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

We may need to define both #sound-dai-cells and sound-name-prefix on some
machines where this codec is part of a simple DAI. Document them with
reference to dai-common to keep the style checker happy.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..aba2121ac64a 100644
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
@@ -26,6 +29,10 @@ properties:
       The I2C address of the CS42L42.
     maxItems: 1
 
+  '#sound-dai-cells': true
+
+  sound-name-prefix: true
+
   VP-supply:
     description:
       VP power supply.

-- 
2.56.0

