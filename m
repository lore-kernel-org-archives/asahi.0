Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C0322D791
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658149; cv=none; b=POW6PzoA4stK3zffNT9GqYm2waGrNhQFuFObnvUpnYyNLmejKYaX1m4YhMGPv+EqAKW3+EuLJat3Otn8BsONSvXU8QWTCiKOwwZTcynweeuCPRTiYl4uo0fbfYwJLgv7AS83zoWgkSfY5Zox0TeIzuoR3f726zsbtteKuAqopdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658149; c=relaxed/simple;
	bh=6I6kevtGt5Xf+IFLuo9iZloEKxJU0BXvwM8XaAJw7vM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bRI9A3TTRCUofiLmVPYIFx9UysErxqYyzckfqXnQvfhv+O4xOxwTjocpIftm/hRnsZkkRtDc2La51Z9nGlGxZheJwud7N0zEbGPHEphWY9+/NdCTdeqb41ml2XitW8E1KlwiZ0muyFEOd0ytPkZq+/JaoQxyB+dpnUhAyV5pWFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g67ih/UM; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g67ih/UM"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22334203781so26104305ad.0
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658147; x=1741262947; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJObarpxJa//O5mByq2DhOQ2HixpCHNevhGqWbFtG6s=;
        b=g67ih/UMxHjpgAmgK1ot7aIwvYKGIJrW+xxoPnlo9bH0UZ49kO3VWBCC8oT6tPYtUm
         H1cAYWinefSnCmETmpKQDvZdMGuvI4YIJ7YRnOmoZNIHWw+WkRjWl/uQgl6NhRKcwTBJ
         fhYHVn5kUVX6AXIPvPvCYPieF9uCHDCdTEt9iJCM6jzJmlcGARReFz73voQLHH0J9y2W
         bwEmL/vyXbofgvCHUnN6nHP3JXTbvz/wbxCJ3jZ1IRvbi75SYSSrZXccu9CSMpp4iIzy
         uExKUKvZ9LfRErD1aPC96CXkBaOD+nsQuBZbX99Z3QS3aVGYNWoa3S9I/uqJw2bS0m6n
         5IdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658147; x=1741262947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DJObarpxJa//O5mByq2DhOQ2HixpCHNevhGqWbFtG6s=;
        b=Z43i0FP/SfoW+zjYhqIbKLU7Tx9IiqP+vEBubUWFQhSWi84tWxPGOK3gFV2omFtNYm
         tAaz0l+vrhSqfn9vqHIVyY1U7d/4hDYrn9D0FW8fy2VUMtjrIcbsGuOhBFb0c1Uagv9H
         lOw/SYw3AOnEew8NJ0jg6CjIAGcdOvBI7ZxT6HBICQUlo/LZJXnk7ldEfZ6Re0wx7sFg
         SIeYd9Rl6x4H0Ou/XFq+KK/B4KOgLj2nZA/BjC4rf0IYYkTyXQUNRiaqN0NCHejBDFLL
         Zn1FrOIg9HkWzuIELwXdZ1cFNMgJiXNJi3Qr3C/2pbErnRVo7v2SM8WgxqUssSr2sdNs
         G5aQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8dgZ2IehQHWi0VRg/cOoDZhfueGiFN1I2RUARXYCsHSY2L0sKMFpq41E2oQtrjNbs/yjxRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcvO3NeLP7aRlk7/NOc7JbYu5xFO8pxW+2fs6ZpZPERAzkePnb
	vtFXeFGsRbgv6fCbGanvZk3jUzEm32eYCcEDupWJDoPu1RvoldXkHfHA8ZC3
X-Gm-Gg: ASbGncu2C+J1GWhFF0OFGpnae1Gp0A86BaTGuL5iE74gbp+a3y1t8/G/QoAyGFvcqOj
	fSp/2dcR2OzLr1kV8GCAMGsWppagKyywhnVo6h2lAEx4rif9bjYzDnpkrEf9gOXYm3gP7bMeYpr
	8geZgnDzmrNh5g+P2KCptibKhGRUc9HpKvodbVkov8qG+e2MW7tG6DpiOssXYYE/zi6otTWZ9/6
	dKA+vPt35ZuyaCpseeWv2Wwg24X6qrH89zF3xlxqw5ID+F3smao3mJcM8V4mhl+XUaWw98vm5TG
	WRkYWjwigrZX53G/seLeVT5oTtxdeEBE0ra9jHV/g37P5DiAV8dAAxCoUAjZLWW435gsKjoFW6N
	LboK73VV6QAub/LYvTflU
X-Google-Smtp-Source: AGHT+IF5/22JZWa7rQmFG5HLtLWGAWukMonyo6ZnXXa9jydidl+I5GkF7eR1H3SEQLaPfx5JePYS1g==
X-Received: by 2002:a05:6a21:3a83:b0:1ee:ab52:b8cc with SMTP id adf61e73a8af0-1f2e399e4acmr4948662637.21.1740658147355;
        Thu, 27 Feb 2025 04:09:07 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:09:07 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:29 +1000
Subject: [PATCH v3 02/20] ASoC: dt-bindings: tas2770: add compatible for
 TAS5770L
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-apple-codec-changes-v3-2-cbb130030acf@gmail.com>
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
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6I6kevtGt5Xf+IFLuo9iZloEKxJU0BXvwM8XaAJw7vM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk/WfVbVsDlc+/Of8a3ExRNn9e9/5CR0KSRPXHhu8
 wf/dVv2dpSyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjAR00aG/+5rGuST7D8FS8n9
 W3hH3cCZU/7ATIanD8Q/Z1z7NG9+1WVGhgMmT0TdyhbVnJnAz132XNBj9dWFBil+ysINe4pajt/
 U4QcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

A variant of TAS2770 known as TAS5770L is found in Apple Silicon Macs.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/ti,tas2770.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2770.yaml b/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
index 5e7aea43acedc0f7d8c22e36debfe805c7ebe74f..8eab98a0f7a25a9c87d2c56fd0635ff8ecee17d0 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2770.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - ti,tas2770
+      - ti,tas5770l # Apple variant
 
   reg:
     maxItems: 1

-- 
2.48.1

