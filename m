Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177752DC333
	for <asahi@lists.linux.dev>; Tue,  7 Oct 2025 11:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835873; cv=none; b=lFT4i5RT108Rdt9+dheXxDIVzp20ZZz+A3T1yt4rwMiNJ6zxnZsfJGLmMHqPnSh2qbx2rjN9d/EB+Jox5lj/YwFlFPWwfGIgD+FFMWJA4+7TAjanEKUOaK48bNPYTU7CjV1MP5EGjuUtBS/IrvR+IxZcTk+9xIxBXogLBeLuKfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835873; c=relaxed/simple;
	bh=DIjn1i6LYuHnBLhKvNWo/fynkhJW/iU4X0uf260tH6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eEYCiuyS0kO827+2MddIewvTq6IaZInDI7xGKunnIch8mSi+VO/boXLNlSsoQRC4yPIPLw/atrorUVw2AdqgrocOfCCj8e8KwjPjaS7xeaUsEyK1MII556S0NpmGpMOzZ+wXifQDlQd6pWHRV2eBoF1247SDQQKwXifs6fhMaEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6MXzaoW; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6MXzaoW"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so4699705b3a.2
        for <asahi@lists.linux.dev>; Tue, 07 Oct 2025 04:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835869; x=1760440669; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=;
        b=g6MXzaoWy25O3noVSQGx/hoFu1Nkko4hA7WWayG2Ilhm8CaYDReEiEFVTNH4luNWO8
         0Ora23JsSmaIky4LXJTFbShh+K3koPP7x2YIa2FAdSSewEW8U1LJTy3pEt+OIgvrHnxf
         oDSxC9TIpsZ6XniNawQV4ZvYH6WOz1lsaCMRXGWAbycvVHZebkUQ3gz+1F487JfemQjY
         pRhsOhjUxiGi+Bel5NQLLKAAfFNar/1q05C7R0CH8eJEtfDsj6N5LpyQQjf6mFaSM8WN
         GZdm5ivym807b5pcZ1ygkN/slM3INFogtXFo8+/VLfqEYAD6LXZRguQ2On18WvDrM5Ca
         Ahag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835869; x=1760440669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=;
        b=CRCTtxQTwp3H+la5BF2jm6ReUFyDz7/FiEgfAbjp0olY58mN0o0Yo1YBWlwcMVRaId
         bDoVZBHBNlgqAa57gMkQ+eB2frCFtpLInFYcRwXclVjwT2g/SPQeOzZ1rHD7AN+KIQ5k
         4tzEOQZFMBfGyi5OgZ74IEAPJPb60QluB3DaFizMYjytkusFyMnDK093QsZfXWSXaYMX
         pjenFU9K0vBUl9gdQ+jCmoaUbJVs7JtGzPL+VD7NgkY6iBDDrDfIk+Z8jToTpCLiW7VV
         wQtVLa4bputtaqypgAMlRAQym0Hvv0ndUBRMBLbrCXNsnf4TLUWPOU91EoPTMm6ooZZ4
         CF1A==
X-Gm-Message-State: AOJu0YzGmIulL4umr+EtUnD60hgOB96QoSiNYK2EhLdvVOFYb8HpEEI/
	cwY+YNntrMJ/I53v46byxIAavZyR7iQP9uaEf3vu7MK11v0Vdw4cgugb
X-Gm-Gg: ASbGncvGzhxAAAEIKFAOIlIUhRFyeYLVywCJvgjrIpiS+3zAzsp8I/HUlUtA61pItTj
	yZ3w9/DIFoe1Ie+JVovQh2C3mFG0NGGdocn8izKv9BBEeFHrQjtJw/wepq7uCtoCvJ35zId5nic
	Q2fO8GbqLnMMWiSmJP0DPlt35rVJM8EL0aU1D79XutO9dbUG6XAhi5XzgmIS2RgVa47KZwZpGbR
	3A3pzza+c/qKq2MpxkpYP7++J4ZI0zo9rx3Et6x0AEl6rJu1NZhJsOK8KSI6iaW9HWdBpSa20ky
	SrMQwuuy/cXkl0MWG37oJNgTlxOJBroAgUll7hAQvgQtw3oa1dWKYH+3Kr/KsvUQK1/bAGwTi9T
	KXfLsz5yPQowaKr2vGxBDpBdDvdUsrRO8OhwXzPq5C5+8nGeZ40EC/6G45P51f4YwJn7abaBIYR
	Aj7TmW8g1Bu8IZUmmr5rlu/puN8yzMMyZV8U7xAvtezQ==
X-Google-Smtp-Source: AGHT+IE9i3oBNg1pFLD6d8BUkWX8cKqHfuFNCfFyKAraBK4jd7pEhvOYjoDhX88W2UnS1BhGRC1x1w==
X-Received: by 2002:a17:903:384d:b0:246:cfc4:9a30 with SMTP id d9443c01a7336-28e9a61a7c2mr170446145ad.35.1759835869301;
        Tue, 07 Oct 2025 04:17:49 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:48 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:45 +1000
Subject: [PATCH v3 04/13] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-4-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DIjn1i6LYuHnBLhKvNWo/fynkhJW/iU4X0uf260tH6w=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3dXJ9ryLp7td3nvHxlMaf7RhekWtXnO+6u1a+c5
 mTokmDRUcrCIMbFICumyLKhSchjthHbzX6Ryr0wc1iZQIYwcHEKwERSZjD8z1PXCHr/tatuyhNH
 TSNzgQlHajhkjBo4Ti3YVCZ8YAHHfEaGlXw70kPW1837I/xvyoyIUz7S/9bkft76bqvHpKeZU39
 /5gEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC RTC function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e6cdae221f1d..500395bb48da 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -47,6 +47,7 @@
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,

-- 
2.51.0

