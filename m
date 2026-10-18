Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E654436CDF2
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302884; cv=none; b=GqPlytumlPsTSqKhaQOVLVfSbUgeWwo3cUzR0F8pUh7oiIvvK9lHDHpzBHUQIp5Pngu1zncFUiOCHs4fRXDXQAPoDL/AK30bfDr9Km5Eu6MkxUrru4HZfnbY/gHRVkziFPJ88xx9lEb5FZ4yICgJik5cEIXpUC5AmuH2ILmnHns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302884; c=relaxed/simple;
	bh=vyIYXeTvpK7D1QV50HT+GFALOmTzN0QImSyZ/l8Csqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OIzNzdrOK2WCD5zRk+5R8gJsIqkzMfTUO2WZj2Z7QmCsP/ApBNViI8R9vu38Z5txHLcaTjcC2XaHXcJNyWvA/mFE52fwZl52cc8vYaJZxfoyo7+fquG6X5hmmd3+jWKpv3pLazQl6ph3tCe18o9zxg9qsrq71wfCjVCh+xghfRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTRZOsug; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTRZOsug"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3a7cfe8f761so1455076a91.1
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302882; x=1792907682; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWsmmNgQyuC4nITyeMHO2zX1yCotQ/f74LykMNCcqF4=;
        b=CTRZOsugi28nzIzyTPsykJY30/+nb4QDXYheLFJQL1jIEboLsXFBt8NF2pLKZ+Xzau
         XdE+gUNsX9paUlnQgtoL6imTBs/j6WAJlT05sA55/i/0hVRBYfpAWz+Sdjhqu6kvjPD9
         +K631XiN3FlDlIFmn1HrtCrXeAX4W7oPvJoZKeBm7Kr366tcnI18kPm386E143sNYG6r
         NElFQ+a0lo/WMnDB77eryPiWU+oqzNz8wE3OcnsgpU9fUV9UuoAGA1j25xz/5gTYPse8
         +q5GBHUjTR9K9ZHvuKDfq22oc2ervGl6Dc+tYasF8TGy9TJt/jyGQERzfgb5VvHcMgWo
         LRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302882; x=1792907682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWsmmNgQyuC4nITyeMHO2zX1yCotQ/f74LykMNCcqF4=;
        b=sS25vsvwElfxT5y3mcpM/3cZfPpOZ/Wh1v/CVP68mbenqHIT3SADB4XpFZViOfTUc0
         HZlVA4bF1Y0BkPuZRDGrRI4z7EWot6/jjaN7FPoBqXfticcwaaE1/AnQgo6Ik8xeIPsq
         S3j3tdsGSEaraGVAB2VBOpho3oWn1XZsBF/ul/daMwUVWsLjUze+FwDcRz+7zLU7G5Kw
         roAjBGylpt3WGgeaFkRxNGnaWzkGTBJfqYKLWmz3IZ+nB4xtRXxqmZX5e/oNehioDZg5
         iUnVpYS3EqQJRad8A/dGcIKHNvtUUzS+71eHZktIXFUCq+BwRaMPhvOUy3ZrysvPfjkq
         X1XA==
X-Gm-Message-State: AFq9FYKTtL/a1uZBHmrhPSaJwRUT6Lk+SWM0OAiwFhu6rTNICUoWNedp
	jHUJuksBq8z6C4m1l14gqW1u9v803xVjlDtlDF24T6UZXjAwZX/sJxyo
X-Gm-Gg: AYBFou2+h2JiJ8e47P/L0eIWo7xNvqHnWaGzs85cMypvAfkCa0R6wGRGl3KlXh5maGi
	EUsA1bHjcpPilZVfiErLhN6PLYyRutPX23unQWx1uUjh/hafsFgf684YYT6c7nKmhUkddRq8nZF
	Z9JSaDLVyyNDxn0lG1p8R90QD3P4cE0yWQsRjQkwqlKxu7/TIP9M76kinZHlCC8rqfKYr2L4MU0
	CWDdmmsufb40dXEuam97PmTiKxCp5tFGW58rSMhN4hvOaOrIYxCJniRpVsYMd6Qes8CNeUKHJhL
	Q/eP599rc8qiNrx9o3WPIkQNouwXGjSWqIAYBqAF+eY0PdE5AMbwC6LIP36mAxUvv503InsGOjf
	BfH4AwR6GqHVXITxmmnUxz/W2AC3vBXSuW3lrpLqzg/hmIRec50N8v7sJDs8vli6WOgxbhWhgOT
	VMUC7OVkxck2Wr3Rr57odiGDwYLzxgNc+cD/rBigO9GHkN8tWMGIV80OhKw4uugXKqTGo1DEGDu
	5zQwy9PUBZMCyp9jxL2/Yc9h8jTaeXgIAPqOwlIjGUfnhIfPvRrIDndcBMWb3xLz6SzSsuhfbI9
	OLsl56HMa1ZEv1f7R92jkCgxnB0fhoHEEAqGwhWfN13eww==
X-Received: by 2002:a17:90b:4a45:b0:3ac:b6eb:e0cf with SMTP id 98e67ed59e1d1-3acef5dcc94mr2797709a91.40.1792302882329;
        Sat, 17 Oct 2026 22:54:42 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:54:41 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:55 +1000
Subject: [PATCH v3 01/21] ASoC: dt-bindings: cs42l84: Document
 sound-name-prefix property
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-1-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=vyIYXeTvpK7D1QV50HT+GFALOmTzN0QImSyZ/l8Csqw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rn9v1rM2RbwXkbirPLsz4fsNjM/kRQz5nGODOYKc
 ej5qWHaMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmGpbf4b/fiY1H4ybv6Rw7+vrXbuf+8/0fd9/cvhsW23Edk9s36MfTAx/RXP0Cq1
 6awsZZE4+mdUmqcF7qnS9vuaD7RLe2eslDgmwAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many. Enable this with the common
sound-name-prefix property.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l84.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..ca137aa57461 100644
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
@@ -32,6 +35,8 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix: true
+
 required:
   - compatible
   - reg

-- 
2.56.0

