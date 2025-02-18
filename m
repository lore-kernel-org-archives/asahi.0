Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1742022B8CA
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867788; cv=none; b=f3slMB94q3+L6V+zeBMnJEBiHQ9o3lWjYb50lppA2FKppfsWfJ2Ikoe0wZBfzvO8S2epjHhTsVzuCEAYqNaydJ9UZZZ6g1Il26czP+7hH/7oV8XYWvpTRkO17XxWd/btf5qKX78s6GymZIATL4Kqzd6qygyLF7xJX9p5UgJOF3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867788; c=relaxed/simple;
	bh=oJ6cbXoYl9+xunmruMkgIaSkFKo0J5EOCYIf9ToUJeU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qpEXD4EdHAriHikl6wLOH9BRBKRnYnELhxS0R8N7fDYlnRfIsxCE37zDBOYAGhLcqQxSzUr7XBI9vCAjHwCD4/SL0pKlOLiOgoZS6iE+38HiyMSDoo58okt9E5SJI4YoCNofCFyAoO3oxX62RDdmRX3LM9DvFpPnlC24CXVSJLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6aNUFsr; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6aNUFsr"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-220ecbdb4c2so101592175ad.3
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867786; x=1740472586; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=84WsiJ5ph/+RUwszy0qEmqgYeEni4YLdWQm6ihbjNcs=;
        b=b6aNUFsrz7TccpYxUAzDeJLfHZIrSsz7FEdRjedxHfRH4BKsey+KPOZYqCzT+r9FjR
         L3QcenE746bVxFgOmfI2UtHbZiSO6p+oiiSEvcDh99goQE+HWPB1CMEozCccuS5jcLdW
         V61pvEugXq78Z2TsIrxAjWXcaIDnITfSDL86cLqSUpG0mANAK8BQYvquYO+NbwWtrGbi
         RzGt9UC45Dh+oNnAWIIkn/I+wIXp3oNVkdIlHLdlqBCz6B4NzN6qrc+//c+KDdNrXfI0
         aky77Gs0apSSe1oGBmr/LRDzBEwgBZ6NuwRWP2X6eOQdd+LF0It0QNPiEB9WzXPNQNk0
         XIzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867786; x=1740472586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84WsiJ5ph/+RUwszy0qEmqgYeEni4YLdWQm6ihbjNcs=;
        b=LS7wdf+Xc7AyOHCXESWLQ9R0dddQ1qjOC6CFueh7WN6q7GNarOh5KGUEdgSuw0uR7n
         5u0y0EjHS8uUMYuB1B92un6C0d9/HBoIRpwS1Pzf9D5Hj8/qU2s0eRE1XzAvpL0Qn5gw
         4e1pds8/92JwKQ940xZGsRO/BOtLANJeHZXHd3/JFX8kqIi/jxiOcKllcb2k6kwEfrPC
         Ak33AAlnwcPXrzbhy8yTd0ieeq/erL/Z+Eq1OOuNYtwuT5XSXuyW9dyxBnrceedjcdqq
         TQYpvyEC046tOOqYXeQozyGETbdk59K3QaFZUHiNT6nKEx0AFnidFhWP0nek6sHlAHDA
         Umug==
X-Forwarded-Encrypted: i=1; AJvYcCWn6CMWzKxSJdQWOW1apuQeo0DFgBZ9mwJadmLr4P+7eWI22/FaIis8hyie1T1/KGvskODfOQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxO9bKvUfmUh36FZr4k0C/wMwwsoftBBx4rLQdjjaO6kqN9bCZk
	x6FGSzHDn5PDt2cVfFg/sFxErxBMuIHtg4Ilb8yEUtablZPzHz7D
X-Gm-Gg: ASbGncuUzDvU1OwfZsDL7quM/OEiZAgf/fidhOAPTbZw8tRu4+rcWxvIzBJNVhGBXXg
	6YbjxkU9LYnIgfE0rn/G3wzzUMTljuHCT9j2G8Xs3QPXSrwKk74iKtJW/cq9WeRRh78CUnm7/VK
	wwlzAuzp5zDlmh2eodW5jpKEFcz20484yhs2gnNbCasOwINu2FLeW+sSk94XEUn9hIu3oAnGcfN
	CajqkQYa1K6OBTkp0WOwqz2LBufocwjDtTIXfp3nI2S+e4FKP8vie5eVtWNzRcNqX1MYvAYopq/
	3ho5TEe5mQ1cWh6p5M5NdXA0ZAHce+zVIMJlW94vGzWtGwKoqsqiICMy/IgbEWquEAOzE95MyEB
	Vcc9mP9fUUg==
X-Google-Smtp-Source: AGHT+IGLXFZbwDTW5xQcdsp+acfAsOzwEHRxRGOygcsKN3a2K5ubX6cgUllQPxBgV8283AinHTIRAA==
X-Received: by 2002:a05:6a20:158a:b0:1ee:cb08:d0a3 with SMTP id adf61e73a8af0-1eecb08d345mr1969132637.21.1739867786295;
        Tue, 18 Feb 2025 00:36:26 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:36:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:38 +1000
Subject: [PATCH v2 04/29] ASoC: dt-bindings: tas2770: add compatible for
 TAS5770L
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-4-932760fd7e07@gmail.com>
References: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
In-Reply-To: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=778;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=oJ6cbXoYl9+xunmruMkgIaSkFKo0J5EOCYIf9ToUJeU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3OKTeATfLCqot53+MVCEJ/Mzj6aZjNEN59abEuavZ
 h3gXmvbUcrCIMbFICumyLKhSchjthHbzX6Ryr0wc1iZQIYwcHEKwEQ4Kxj+Svss8bjf7Sy05Vjt
 lu597kd2ZX0UE/q/dvWME5vYXcM3+TMyHEwV63Lm+hW0Z3bjDftNYkuUyvN+6R8oy5Itq1t2L6G
 NGwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

A variant of TAS2770 known as TAS5770L is found in Apple Silicon Macs.

Reviewed-by: Neal Gompa <neal@gompa.dev>
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

