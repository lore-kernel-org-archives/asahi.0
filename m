Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C506822AE59
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867782; cv=none; b=W/6jxi3+diJeV42D56oITZ03QiCabmdZQRxuDk//tXNEEli0J9FbZUDCwEWNuAbj4xk4u5Nan+UG6zlj/ZRsawIGfVkCiy31kGTquWIUDlsTC2ukOKPMh5BSzZ0LGUReMEqB+eSEtp0GAWwnSMcbXQJwRGqhbgx78krcxlPnVls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867782; c=relaxed/simple;
	bh=Qd5+REmZzMNSSCpYc+Dv909nqke9xxDIoWKydv7vufk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=axsW0U/dAvFSf0bSuZ+Rzttz0XpnAWdRR9w6RtAw7r6XGHXMrlE085qj5L8sOrbh66B508gLDfmAXjzC2d1RrZdwhVsAj3fCKEW7fh8igHj5ruGqlU/znFYkGsAJLELR2qWU8PC97x9IsYJ4YdwuRM2lOLVBMeOs8MHtx9C338k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyOuwy5/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyOuwy5/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220d398bea9so71333915ad.3
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867780; x=1740472580; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=liQ2eSlf/sYgGWDLjfHM7DvSlE0ifb5tq7MQhvxFJYw=;
        b=XyOuwy5/USH9c2AGftxpV6y28fHN3ngnDmmTlNQt2Ou1iKTaLIp2aC+wywh0ALQpX2
         jcvdY06nhJv751rnrO1mYO0mhyi2xHDxGcWcjs1sH4I/VgoCUG4+ivgHSb7YwxaL9sQl
         v+2TmwQStMkisqBi5v8nbcwUzv8UCpBNtvo0F3g/yvD7bc/eQLkWBggazl59w7Ntcd/f
         Bwrv63f3AxYPjrDSpxBfDLUCvmCbbWw7hSQ+7uvuGiXG993ZAZoCPxvs+1f8COut4KxO
         xA7QZ7jPN0ujhg3x0gtPA7ojwJGdAZ1VRQMMrhOYmtfj0bxuySqwvi4RCaxxZpZAQxdm
         sV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867780; x=1740472580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=liQ2eSlf/sYgGWDLjfHM7DvSlE0ifb5tq7MQhvxFJYw=;
        b=utc+y+7OKwFYMdVxpYSj70D4xeNuZmYHRT6iN9cDbmWk5KfqzLP4SsP6FZxY0QeccY
         hyf7Lr8aIvqyGZc0UPeOA6YvH5mw2LMAH4N7tPvHdukT0i0Q1NjPBiq6QTHz9BzFKJvm
         vV43echsVJVmp92d1Blbwvglo0O8tbIvWj/xB3SRszCCYBxgo+m0jpIm5rjzogCEo/r0
         HZS9A4YZgw9b6/i8xg3BWb7qydlZlM4gtDi8qzF9bZqOrB7Ik7d316kz0OIx8bqVObkj
         NL0ut0nGDN21zYan7SswYWHJ/0N7N7ETJmMHmZ6qt4HVbLtXZ+j3xzuecphPzjigAwTP
         6vJw==
X-Forwarded-Encrypted: i=1; AJvYcCUcbGz8HD7ZkYVg0m5CuyefuoVDokctqInf4LUE6YoZpIj+6D2mKkFopqwZEgqwwN8LFmEwRA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4Y+lB4h3Zx8oMV0yOZXGVYltO6RWN7tzp2QUxNpihqiDvOW8l
	s6Y/32gIkv6Ov13/EY7wTorqywVseqdTvz08fH8vwX44uC7mNa8/
X-Gm-Gg: ASbGncuTjmMVf1kcOiqXOGv9FUleb0gIkKc5PDD5ujDM1XxU4dQbcqejNl7qEsJiz7p
	xoRQ6qqd/wPrIE+LV1n4VXqFbeYJry7HAXdeXM8On6G09+d16CpyAZFaeeK2QEpv5u22FMWqisz
	7ZVonpS0CBF7IigvRYEzbxlyNbWPCmDapvnKJueMpTXOdqttTrTCpa6LfQuaj9KNZIcd19mpjM1
	OOdBRJJW0J5u+VtLrEtT7v9CAKbRy7OBunWnNE3pHXz5neM6ScINUuRQ4QG6iU+dpNu8//Ii+Ji
	DAjtLWCz/emZsMFPRFt0BvOGhHMIT3JpL5NOzR8vYoqAK7S7rqwcXgJnvCcooyIxlwF8WxYWDxA
	yxyE/6eNpLg==
X-Google-Smtp-Source: AGHT+IHWnUgRHRwrl5gE5LT/GoKS4HRMWbZ0qZHjBnMf0PPkuoDaV+YrF7kSYDZ2wpRZS0JquDIXog==
X-Received: by 2002:a05:6a20:43a0:b0:1ee:69db:b0c5 with SMTP id adf61e73a8af0-1ee8cbd7f21mr24238616637.31.1739867778477;
        Tue, 18 Feb 2025 00:36:18 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:36:18 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:37 +1000
Subject: [PATCH v2 03/29] ASoC: dt-bindings: tas27xx: add compatible for
 SN012776
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-3-932760fd7e07@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=952;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Qd5+REmZzMNSSCpYc+Dv909nqke9xxDIoWKydv7vufk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3OLTlmQZXTnQ5vDw7N32gzNZs15FC77svfFonXKxW
 uX2VHmFjlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACYSz8LwP0lmZXu137Fz4afn
 bbdsnHTVIHPRZrVvTmuO5dk0fN6oaMLI8PVF7ML5964WTPx9dddr8aZNFnw74++tavXMurhr2vL
 iYGYA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The TI SN012776 is a variant of TAS2764 found in Apple Silicon Macs.
It continues Apple's long-standing policy of getting vendors to
spin out subtly incompatible and Apple-exclusive variants of their
publicly available parts.

Reviewed-by: Neal Gompa <neal@gompa.dev>
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

