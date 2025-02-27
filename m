Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7532822F388
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658266; cv=none; b=qc8NkH9yWW4WinpACiQHKuXUKA4YhGwPpDs/NUmkXzejJcv1JwDXRa2IwfspqUp9AgCcvzfG2Es5nypoLW23f0xMDTA3w6gpkAGPbut3CN5zCBwhuhm338t6at/3hKGZs/aGJl356UJnSwVaYlo8GmZ0sRheFGFbFJMg6rqRObk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658266; c=relaxed/simple;
	bh=/RBl/n6L6PnMSvwkD9NDOgKfGZgMZ6zIjb5wTfrd6qk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H4oaK+OfEllYQwgTyhcfST3Wa1ZjmsPfFz548SStVuU2alb2Hu6u9C1520McHZNhsMKKosyZqk/KaN+GOcpS29K/KZmuTtC8jHPIKNIzsQFPO03XlXyqVA0rkxEcjvihhkQApGLdDWtWo6ZLuNrp61sgqFmZ57G/K/rmhQYPW0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZPp3xI2b; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZPp3xI2b"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220e83d65e5so13893785ad.1
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658264; x=1741263064; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0owHslE6nWanzH0GNiSDvqoqhw6dc3ByeCKi8kxRyA=;
        b=ZPp3xI2bNIXF2AycrU6v0tbfGTweNgR+S7j/VYVzO4X6eu16/36uet9RqHjNKAzgbE
         Hwzgk70pgcm1FmTp9GwcgrYE8rEINLBBf4n9W7DpUVofmLsOKNXkrSIAZXMIv8xM8taK
         a0rBwUaCCxAt1f47PXYJOZTYfMc5lW/gIq+heigIfS+9/7X+YB6GkXb/P6Z1hZG+Uje5
         EQsDaJUJ8X/tdsrfVdw/KbOo80JCILIpS/W5mbDKLU4pBcWSUINFJRr72nQoPgp09/N6
         PK6w9+Xce6TC7p2FdSuFM65aohPMchE3tYjdDIW9pXDtUTTzZdnU8qHKNrVebmj81+Bt
         ptUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658264; x=1741263064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0owHslE6nWanzH0GNiSDvqoqhw6dc3ByeCKi8kxRyA=;
        b=r2Bgx6KQgJJg86DSp/+YyUIvO65MXe11+D4ruCB2KuOu+1K95qWJe05FFksVYYEw6C
         b3RHPcP5MHvuPidRXFLNcQLVkYA4brzPPVym8ILyiK6CJHvngZN4D+tsrZLrQchDOrZl
         YiZB50ERxcxgeUGvjLNgZKOnXZGjJlzw5Wgfiei9Ty7CzGkO3F4ye9bHjjun9SGqQAv6
         GBPL4PdQCYj6aDd9bi5pCqQknTSWhel9Yzit7ne3xnwW0YDdw5PVGtuKPlEe323Mp06t
         PUGjDhLKW0zI3BC9FBvj8iTKMVK8kC/ba534WtG59bVHlkuZYNL3XZc6/lZ94efeJugR
         hwLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrqZFpYWN0210MluuX9hntH3Hz2QiK9wM8Ynv8NI2CD9dxKlcIEoPVUzqqbv8Z+s+7F4ZPDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFmcEaoffHFvlxUqRr+YEr06xETBiWlq7m9nxoQTveZatpC/hE
	kEU23ruASNHuY+hSpCkVxIjjLkI491+Dxgzw8Rgbzd3KfsP3kdo328yf/+IL
X-Gm-Gg: ASbGncuEe6e/Jl3cwzwJhZjicz6O5NvH9GyN4FOI5LlXEN7ErDifEjdB3dWWkw6sDgL
	z4cdG4JRTBDH7NRJ4muQVbIYjrjtyeR/HDW2kQc+smJh5jT/rqFZQHa+HOXcoqPOWtdx/UuliGC
	3sNgTltobIU2+IbNSzk+QeFR23qEYEkbey+HSQbIVbn0RIf5ZEwG7zhd2TMgEQjzvBw9gQMoOMt
	6jZCilO7GMFpr0x5LsbCfI0g+zvFAg2xIOalJ6y7pkO5+5wJfwVdw+biCXUPCzzieu5+tELXDTP
	fen+DvBsRiRAvFNL+sjZ2I01+hMuvelEznEtFNy+1aJftKN6DBfkLRheEkHm18kcl2Q1rOiqr6H
	u2Th3AAu+ouKoVlvSHEmS
X-Google-Smtp-Source: AGHT+IG1QYwei29YHGRdLB2VD8ypHlNGKmJouxhIvqFkj+dv5HEWcDyDzQ8liiu1IfHNMqF+VKMzNg==
X-Received: by 2002:a05:6a00:928a:b0:730:9204:f0c6 with SMTP id d2e1a72fcca58-7348be2cbbamr11394198b3a.16.1740658264560;
        Thu, 27 Feb 2025 04:11:04 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:11:04 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:44 +1000
Subject: [PATCH v3 17/20] ASoC: dt-bindings: tas2770: add flags for SDOUT
 pulldown and zero-fill
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-apple-codec-changes-v3-17-cbb130030acf@gmail.com>
References: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
In-Reply-To: <20250227-apple-codec-changes-v3-0-cbb130030acf@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=/RBl/n6L6PnMSvwkD9NDOgKfGZgMZ6zIjb5wTfrd6qk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk9/DfJ+/pBN62LpLO0lSpqSr+M1O9MMgk3Upgrss
 Z57I/ZeRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABMRjGdkOLj/tPffHnNVnkvH
 LzFOc9rz/8GTZWudZ1ueNq46G3oz9gjDH373B91r7Sb9aQ9frJ9QX7j5gpzphnJVq8drVrxU+3p
 RnQsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2770 can pull down and zero-fill SDOUT when not actively transmitting
TDM slot data. Zero-fill is useful when there are no other amps on the
bus. Pulldown is useful when the chip is attached to a shared bus.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/ti,tas2770.yaml       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2770.yaml b/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
index 8eab98a0f7a25a9c87d2c56fd0635ff8ecee17d0..3eba9bb34a581526f68b6bf2e8437e1f1e03d26f 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
@@ -57,6 +57,18 @@ properties:
       - 0 # Rising edge
       - 1 # Falling edge
 
+  ti,sdout-pull-down:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      If present, SDOUT will be pulled low when not
+      transmitting.
+
+  ti,sdout-zero-fill:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      If present, SDOUT will be zero-filled when not
+      transmitting.
+
   '#sound-dai-cells':
     # The codec has a single DAI, the #sound-dai-cells=<1>; case is left in for backward
     # compatibility but is deprecated.

-- 
2.48.1

