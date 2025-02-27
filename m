Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6B022FE06
	for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740658197; cv=none; b=VXgXIinmE+DS7EvtVUKyquNrEhLM92V+Pc8+NRV7IlHA5LT9hNdmF5+JyQVND87KhfGgRQBLilE42QsvxO4yd693lE/7hcwCa3i9XmjM1UOisWjoZHuVezlq6Zw5FmxsWeP/i0IY1XUZpRlT0hljU6C6RdcDmMhiqfyauWG+asY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740658197; c=relaxed/simple;
	bh=HT+SDIfQlIRms8FxF8pg1Dd1jnfWIMjWKWXnYtBy3qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VjqY5A4lMRGO0q1gyvWTlIIKIGfu8kVlQskEMGZuigrmuY0EDWm7L1YtWds/vR9ZR/WEl/Tev08T3FASAhSCYMh5O08zQYa/cnE6U5a9Sv0xelEJrnMFtbMONAcBi0Zm37lLLRJfttCTpuXG2km6FIWLxTHUtdJkrgRXoCfgytA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uomsit8Y; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uomsit8Y"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22185cddbffso33991855ad.1
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 04:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740658194; x=1741262994; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0GY7dlVupIydN6arxqzciNDGAGAOkBdBUMtuBEAPCp4=;
        b=Uomsit8YOdeV4rfnSRyX2dk5VkOfVJaMQc3nvvJ/UmF7NkdmwV7kss2BCmZLZNKGT9
         EjcX3znjyr1ywoPoUPq61R5J0j+gH3Nf+oB40s0+b4beqmDTxofN0DJtpwKLkoR1HizF
         8ugA3LC3ILr5YeKbxhN3T2APTeETkSY8fLqVzR3qX66Cm2T0b0EsYBw3oVqNRZJFbzCN
         /DithJG7V/dhJ0dGPfI9UbQ09xHyszT1alM7BJ8Ff3q1WRVRbwjO42w7q+1FPIg7OKQw
         OHSyYI/XTW9tYnOQpSlK1zUkH0EmZtf0fhkozo52w6ZmqjJ99aPOeFxz7OD2NpTU05/Q
         OCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740658194; x=1741262994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GY7dlVupIydN6arxqzciNDGAGAOkBdBUMtuBEAPCp4=;
        b=OxXvuHy+PZ8P/O+kykH4lK2EjbJx5MFM2tw4f3wU1U0gHK/uJqcjsuXxYUdpsH5s0J
         KYJQFg3M4TMoU9dyGaZ1nq4Ps1rpG3hdTNDJ/M+fBAva7c8llv0p/Dbe576XLwd/3LzB
         u4Sn0uqVVIddY6AEuubGJKcImkR4VlYlHh0MecfVP3RPFWOqZJ1p+35BxPDL5nhc3hmL
         /026MNLxRxU/zWRj6TIfPX/k+Sq4ryalw3BWDNe3wndpFZDZjO338lIb6qf7gBsujb2W
         mgFnZr3dJQWJMAIw9R5ch1HzrilFLl4IXoMLnhMlTuR6p+bgI8VcI4ETAz/vpabJkM0K
         oCuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2DBzo5MIQuR4EA3MdHNM5bJoHKTnpSwbqQla7L6QBggbow1LeK/lE/GyMf+zKmAC41TH0/w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyeap4f+Uc9j/LgJZLxZBUWo7nhOluqeDrK1N5gIUG5l9EI7ylW
	jHgPtV1+ZVxOBPFJq66XgARcUAQanBRZbL4ko+8x47fhlxdvGIvZiSZEZ5I/
X-Gm-Gg: ASbGncu3Zh/zEIwoEQxII8OK6mjNcuFygNYu0Baq+n6Zglt62Vafvk7gBNTKHw968Ii
	iq4uiS6COMUj091c9aHWgN2VL3QKiIWqf1gSzraSugu5WJ0qwQyiJSede0FdcvdMDO9r1M8dTGl
	shf9NM5g8sQ4pWcck103nT45cXk4nZ76oJC34m/wr8utbNiwrpT7ex+v6TguJaa6eycA/TCJgmx
	RtUy9vuz5BUxrgJnnjfnM6PWGOsdtG22awxlVExJLzRZ/vT0cSYg1Cq8p+PslYYfdMPgWckGBdG
	4OY8kXPfCkA/PtAhDVsp7ii87RBS+1iXDpPeyMz0/MRx+jGyucyVIW6e6IDVTemJ590bWnB55yS
	sLA86Kb4AgKgbBxXN7hqB
X-Google-Smtp-Source: AGHT+IEFQRcfJpHWiQLgG25ggWIxdqRMPSAyoARJI+dYR0aKvDD/rhtwtZPwoj9aqVqXC7GAjuuXuw==
X-Received: by 2002:a05:6a21:7899:b0:1ee:d664:17a4 with SMTP id adf61e73a8af0-1f2e389ceddmr4438228637.10.1740658194534;
        Thu, 27 Feb 2025 04:09:54 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7de19cdasm1074217a12.24.2025.02.27.04.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 04:09:54 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 27 Feb 2025 22:07:35 +1000
Subject: [PATCH v3 08/20] ASoC: dt-bindings: tas27xx: document
 ti,sdout-force-zero-mask property
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-apple-codec-changes-v3-8-cbb130030acf@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HT+SDIfQlIRms8FxF8pg1Dd1jnfWIMjWKWXnYtBy3qs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkHQk9ZPbvoOmHlxuaJDZfX8Trd8DLc4Bz8IH46h9P5+
 vvrY5/qdZSyMIhxMciKKbJsaBLymG3EdrNfpHIvzBxWJpAhDFycAjCR+k6G/zUTQotfiQo+yQvm
 5Hi5Y1p4ILN396dUp9dLj5aWKDDfCWD4HzZhlsL1snrfNYtM+x++1dF5LymzNXnbw7QF6Wrrpjz
 axwQA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

TAS2764 can be programmed to zero-fill/ignore certain TDM slots on a
shared I2S bus. Since this is a per-chip setting that is a consequence
of how it is implemented on a specific board, express this as a Devicetree
property.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/ti,tas27xx.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml b/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
index fcaae848e78a1137e4d44f98258207bba68772b9..d65a278c92873b00bf357fb26b430386e7860e54 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas27xx.yaml
@@ -50,6 +50,10 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: TDM TX voltage sense time slot.
 
+  ti,sdout-force-zero-mask:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Mask of TDM slots to zero-fill on a shared I2S bus.
+
   '#sound-dai-cells':
     # The codec has a single DAI, the #sound-dai-cells=<1>; case is left in for backward
     # compatibility but is deprecated.

-- 
2.48.1

