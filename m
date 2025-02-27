Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54E022CBF4
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658143; cv=none; b=kF8t2sTLr34F/0PEn3o5F0sK/3YabqXcEOASPoNNB0NVueDKEtHtcCe0o5Aj3YmOsi4UPGp4wD/tXT7pnYKwJDhoVJv8qPN48FU6vAyBTFYvvVCQaqxrQZup8lBSimZFu6ZbZX1syadKaxqOo9EpmHf9jJea80AFqQtkpJInlOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658143; c=relaxed/simple;
	bh=XHik9mYL+2R8oi63Ob2TqU9Gy251Jz/Rt2dJan9+2QU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bD26xZLJSx1HisOI73PFDFk6AtlKeuF94mmIwPdA3t8NP34MI7IqjVV+gU3lU+HKS2nRfi3XoOQZ/493p7YmaVb8g3DpW+9AtaNZHbRWc/tYjprl2fGkNF3EN/ISF/57e4L7BmJUWyXcQGSyZlroSS+wcs59LjDLRjIkXvX6bwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJUe5upz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJUe5upz"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2235908a30aso8561115ad.3
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658141; x=1741262941; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CM/hSNgGpTABnTd1mLn5ynew+5ys2Any/2l/ODxMfjU=;
        b=WJUe5upzYCt3snvTB7Hknaod98QV/RRD93zvyY/X7sd94q7wwU4jQCxEj7ReEFcy4u
         FHya2LdiX1LhQ3ImjfSyZOEwjkUE0IYfBH6aMQiCQJh5CpqJZwbSFMozrDNX9F0VzFlc
         4nkxQS5iz0kexE35E7FFOWbqj+hJqbLDdPqDvnJ7I8i8UB0PyYWImyR1btqlWPhYqWqq
         UbxufC8oNziUPyB1dMzU+ZWSIFvRT/O1i7h9nUFEtSfdGKNQjJfkRNn/9EZN3xPXAkf5
         b/C5z1kH5e1qtNoYeP1tkmBKYFRR1nNSWybj/Bm248+51Z/v6o3+0FzpjfAWq31sSjEz
         R9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658141; x=1741262941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CM/hSNgGpTABnTd1mLn5ynew+5ys2Any/2l/ODxMfjU=;
        b=vyD5xHhwGFS97ZQXXKGBNm2HduknoPitL3m/Sj9vjRzT0k4DZ0cFUQHajMoZNZ4Au3
         O0T6WsLFplrBVqLFp42Gs/a7GKPu/jTQCJB8h5GFO1UtvpNeKa410cQp8gdvptBeUTOg
         YKflIpNQWfvkyDRxQtxNpqirXtKkofVo0ZJVVoNcEClIqDJTQ8m1vIgunxNMJRyl9Ai5
         IV+lt8qYB7/4BfUoQwvUwzyu+3pmdapeluRPRLoVXE1MfYHzlRImkM6FX66uVM4NeTcC
         mRjStz5SxtuFysC4tRcRY2rDXB8ejf9BvLIAl0v0NJFyZCshW7+JIlhsegm+SjldCaA4
         7VTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6IPlztFHnOjoHzEEOzWNwc4b/+GpYoh1GnUi5j4lQI/xd11RpfC3zL380iL8ZSCmFJi41qQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHw8/IgGlPDn/m36FFBkEPcdQjXNLkI81tAzttMvJktN9CbrJB
	vnNnGEIY6faLy+2tHGCRQTL0Z4aFiT6HvqEplTnzrKswrEgdVk6zRvJum3cG
X-Gm-Gg: ASbGncv5nrh77h6S9LFZcg0RS0ikahcuexNvP5fGJlHnqZ9rEgSZl17/jaDDNFm28ZN
	jNEd5C3tOaWxJEDk58IHb7Cs4n/0z76Cvs4YBB122TVnAmVczZC/nPQVil2D3JmyQfGG3DcFduQ
	465JUs6ifiQUvYYEh5fgNOL16AsXDSwnMl3tw3qj+bOjLZpenmrd6yS6TtH3Np7v9oo11c0Hhxo
	G5zP54c9/n0nuU+fDgUNBWHilQNEn+K+WNLRtomz8+aRHJJ2tIkYj0hO2pg/NXixa44kLonFy18
	gfvAS0pustziI3CQqSS9BgCcOo2pG5vU7HaOsRG87om3F0vZhcNcvXR2Yy+Ioan7gCaRAI8lqe3
	kZGUEUMhb5QCOzNpZmAA7
X-Google-Smtp-Source: AGHT+IHkNwkeCz1bkgth7yqq5OPbVsiQcDfZ+qpp4u+IIzvYKUCHV3sJOsMaIADyE1zAtG/2sg/OZQ==
X-Received: by 2002:a05:6a20:4305:b0:1e1:e2d9:7f0a with SMTP id adf61e73a8af0-1f10ae8e5dcmr13009072637.34.1740658139505;
        Thu, 27 Feb 2025 04:08:59 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:08:59 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:28 +1000
Subject: [PATCH v3 01/20] ASoC: dt-bindings: tas27xx: add compatible for
 SN012776
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-apple-codec-changes-v3-1-cbb130030acf@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=999;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=XHik9mYL+2R8oi63Ob2TqU9Gy251Jz/Rt2dJan9+2QU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk++3N/P/ma/2cp+1imlUvwqe53lDsn8/LdXL3/Vv
 qIviUr3OkpZGMS4GGTFFFk2NAl5zDZiu9kvUrkXZg4rE8gQBi5OAZhIZj0jw5dHxaI/DtRX3pi0
 TmL6stf9dRx5rlKNZ1rMJ8qHn1wV4cvIcJF/d7vuvYaGVLUzd75/CZVtK3y6MFdKjNvy2clmkfQ
 gZgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The TI SN012776 is a variant of TAS2764 found in Apple Silicon Macs.
It continues Apple's long-standing policy of getting vendors to
spin out subtly incompatible and Apple-exclusive variants of their
publicly available parts.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/ti,tas27xx.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml b/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
index 5447482179c14ee78885e5bee02f4549428694a6..fcaae848e78a1137e4d44f98258207bba68772b9 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
@@ -24,6 +24,7 @@ properties:
     enum:
       - ti,tas2764
       - ti,tas2780
+      - ti,sn012776 # Apple variant of TAS2764
 
   reg:
     maxItems: 1

-- 
2.48.1

