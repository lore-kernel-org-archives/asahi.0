Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6052DEA67
	for <asahi@lists.linux.dev>; Tue,  7 Oct 2025 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835910; cv=none; b=U2Juqn4trcZlacczbXwASCyH96w6pUDIxtAHx3aBm3IpvWY3Rzags3HW38KdOS1ZvSPsyyr1PH/rzecZd/yMpufnkmNaqnVeydLbUJsCQZJzXsy6zzgwEvQ0QRXtQRp+z8VOPeleOBR8rYjyD4agC29bGvdNoi7Jb0oqjUUWIz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835910; c=relaxed/simple;
	bh=9CvGSj3k52YgdYK4J0MHeIq2HkIZQxGeUJahNJ19td0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=itRDAAvCDkqRpGq3fzAtG07TnRfs9+GCnU3WTSrLy+CSF5m2og+Ia3a9bLU3pY7wo1pJAosFAjIbDP8GuFOcNF+7QV9YpfS/zYvisWkUGbp6MbzY1QzxpRIM8uuNnjuEi29JfkkXgcfolf6iEC5bNiwxhG7fiwz0LFqxSHRg2jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ccxrz1hU; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ccxrz1hU"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b523fb676efso5172509a12.3
        for <asahi@lists.linux.dev>; Tue, 07 Oct 2025 04:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835907; x=1760440707; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=Ccxrz1hUOvy4/o5qVnXU1jFgU+dCs4LIaYA7TSo5Kt1LYfXCQiAPK04QxB43nZlAAk
         gnifl/hM0vwiN50d/symZQJV8wdX4o2SdUAc4quY8EIqB1vWmpdgby4pCYZHuLihp1zf
         W2r95/fLc+6YA/hjjkytUD6pp2u9Fs5K5+oF1q8zY7um2TqUOfqyO3h4JJ4FASNan7be
         /1Gji9trG3hGfgJqrVALv+KFtbOQhPt6Foa0G0Iu5VOJfVLcx4l9PkjyqHi+VfL/wF27
         0BF/+c79cg6ZN4ndQLfZb/iFH4DiJveYGZNVYW+9rOT0BEROIamKD+k54i5N+IZbJYEB
         kgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835907; x=1760440707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CiHvIx4iCcyVz9XM+n+OAI2ebsG3UALzSjgEuG0sIw=;
        b=e6A+VrIijcOcU9cYtUyloPRQNlkFY/WCH8L8J1TzrKqZefqeJu+S4lWNDlkl8hBLWQ
         9qaALEnuLydWD6BoixQ0OIfT8bCUP/mED2FoLtj8zDBN0/sCoEwssxP6eLbmBsLAJEJ4
         tBFaBYrBBSykfzqg57pKZAPJ7ClCTsir7fk0A2xA2t1bqHx2gVzGG93ZbTILPMNnSMS9
         SEMo1Nf3F6K+Rqd8cI0VXQ/rTWrEsrDja52SlMGL3iSJooNW1l6O8mrfeYWkWwk8jii7
         WW3EbFJXUV47uDmokCJZSOpo2fuHTC3TzOhe8hMvEvkYPUT6XBQ6TEP1cQLRovtcTRV9
         KiNA==
X-Gm-Message-State: AOJu0YwxkF19nqgmCxnM1nisejU/JJWr/8dIsUOTXatqTeWE/e1zyK/3
	kyx/F62PeLi6gghcFU3lpvslE9XYqECWMpkS19r0UEqqQz+tkaGVxbcCob63OI10
X-Gm-Gg: ASbGncvlq0pHQZjh16U8q0QvybbOHcWuh4MDORTARvt9LqbjSXna38oXqTdL+fSFfi2
	zRFWJ6XkHIjgDmGvfFyiGOXO+HM+tp/0eQsuzrhfq0+W/AH2wIv7zpSIEKHFogrnCd2a52QFNi7
	Q+6PgmJy2t9AKk4plmLwshdUC1GcRW5Iz2O6XNAgAIL7K25hHPxtKDcqsrKPvspNI9mtRfPNsAn
	xLztB9l+8nAZkbimx1gMyiz6bhOr3TThBSfcuNx9XF2LUw6HrSlbvy1Csq4gHfOuVYZeE42F0Jb
	swOpDgMu9RHLmdcUU3FRnfduWR3saP/425IDXBzuttXi3qY3G7CyNdj+XDi1zXaZfBgq8aEojUx
	GFUmCKHyWQr8fWvgyjawOGQSLj1k/p9x0tjRJI+LfRWX10oUuWqQswYjvwzSiXQgYd0KwRgtMSz
	ooYAzWnPwvafpQ1YjN6VMjafoRJA9nEjmu1aPY06YXBw==
X-Google-Smtp-Source: AGHT+IHQowcxR6757+GlLYRBHRpFuOKwNlnMD9n4eoDO0fw6pZm/bFX4pWpzRYdC3fx/Hl4yuHMEZw==
X-Received: by 2002:a17:903:2411:b0:269:6e73:b90a with SMTP id d9443c01a7336-28e9a5f9e35mr217258715ad.15.1759835907147;
        Tue, 07 Oct 2025 04:18:27 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:18:26 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:50 +1000
Subject: [PATCH v3 09/13] mfd: macsmc: Wire up Apple SMC input subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-9-d7d3bfd7ae02@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9CvGSj3k52YgdYK4J0MHeIq2HkIZQxGeUJahNJ19td0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3bdvpC9h7ukB/rRA8obS89f9hMtfzQ5LZlU/1yf
 m/m3NIwuaOUhUGMi0FWTJFlQ5OQx2wjtpv9IpV7YeawMoEMYeDiFICJlK5j+F/ecz513768gKhX
 oQt1SgQCP8Zw/Du3t4Dro0n/rujl184y/JU0nKG83EgjvuMO9/Z7PNYWE/aGVTK4N/ksY9ifXeX
 EygsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC input function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 51dd667d3b5f..3b69eb6d032a 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -45,6 +45,7 @@
 #define SMC_TIMEOUT_MS		500
 
 static const struct mfd_cell apple_smc_devs[] = {
+	MFD_CELL_NAME("macsmc-input"),
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),

-- 
2.51.0

