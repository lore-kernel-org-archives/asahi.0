Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D5830BF6F
	for <asahi@lists.linux.dev>; Wed, 12 Nov 2025 11:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946288; cv=none; b=RV4nfyyOSPp69kBBCTM7mmcKckhxaoHUIsLqZOaNfHwDRrf4oTYTj9wo0ptxJ5/ylQyp3IXhGD436OmJxWtoreQ/KViM20DohG+vI56b6k8gKJz6D0FfJRDTl7xu1elAGtekhKoAzojkcRR4uL7jkOzlmAGJEWpZLIR7zdP0hBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946288; c=relaxed/simple;
	bh=0X8ztOxPIoLqy18jxO5aLU25sae5cz22Tql+G03LG0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C2hIl/3hz93exil/AQWe0HjDWv3hfTJKlh0HKatT/DxnvRLfzBYKAm0CMM1H8yzdSNhoSzrABnGaKKuRNhK4qazJk1quUk2+GCAx+bAr0XRZ33hLWW70LtMvtCOXLz1AFWfPqjtDAaDIx0G+EluQiyH9viXNqwY0bLRSg+bqsDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ba1O9l0Q; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ba1O9l0Q"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b553412a19bso453502a12.1
        for <asahi@lists.linux.dev>; Wed, 12 Nov 2025 03:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946285; x=1763551085; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfBBll7plQVG4jmIJcdQk3DSYpimQWr9oy8pKjz02Aw=;
        b=Ba1O9l0QBTifz3IdEdL+byXAJhfQdK6hpfs08X3HWZIKNHyAOWm1cp0e4el1a7PTr0
         jsyE2tWkYWSCIIzKmF+HvqaTWgzaQaM+mnkK48J3NUPTQdi/emE/ReUpXzOmRezdmt9g
         RCyY3v45XbzJKN+bKzo7HTaJRN4b3rlvEiG47+YxDKTcZCc/3GV6C3xrrK7k+sVUcfhB
         ziXl6QYg+YSB8OfD4d/kJjJdUWnIZj7h21iZyLazLRjzDdO4HVYxJExgx2L23nXAA3Cm
         Yosn6nQWfgTq2CTGy5M7WiTorWnGvaUnx1oGDlq/0nOX9XpHkhxdtVuBC4N5pPM6pxQ8
         fbhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946285; x=1763551085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TfBBll7plQVG4jmIJcdQk3DSYpimQWr9oy8pKjz02Aw=;
        b=KVgcddgrA+X2up/ig7kkdb1T3orhjHUCxJt3GdeniYQjMuzGfDob4n9f+HUYppAt+r
         yuEfxVTNBiqWtCxLcCGpbhQy7C6vmrUeM2tqtcx9yWXr3Gi5rTAp7AcxMfYNVXC0U9V8
         dUu9pmxJz+DagnOKXeG6z1H5bmOaNSzr3Vmsk9ZCn2UZgusUQBVlT8nChaa9gm+sqFHL
         CGrq6A+Dg45WzJIr+oglByjI5KDzJUOJakycjkkag5/padPkXd8cI7N20HTwHNU21rKn
         qGRg69z1DyZd11dEkcFh4npPAfE0zQslHFTRAksnhRnSFdGH5dH9+v1ER0p8+5mY6uJS
         D0LA==
X-Gm-Message-State: AOJu0YzDSiByEhKBzrzjDHHljTQIcnKCIsDmnVEgrxmqitxjE0QTKtbA
	BEWfU7BTpCWd0wAZ6yRYu9SdISscuNec6UqUDMpXLzafYEm6oya0R3wG
X-Gm-Gg: ASbGncvJPsFmx+kxvqaasIsS8Db3uIRmymNN87p/inCZJhkUD+6V6A1qQkfiiwK8Z3z
	zH0qsktgdrV/dGrGDtAEZY7NeFCd6LQlPtzM7hEheaxwJ/dhisj8+plUEEbklvcAUwisz1j2u84
	H8D+ejHVT+UliMpq8tV0Vs+3yL9XfP4cAR1RckoksMlg1QwThL/+MMqX+dcWlFtx/cA/a8Yk3CX
	TVIBCS+I1X3NcnFsB8TjCBHDqLij0BjC+yoanZTwDHLqBQ5MIxxPc23oCYqov8zXN68lnEjU92Z
	HFBuUkD7mlO/kVr3KasiV3onbG04nr3FBLRZZbttDuaWHQ+JoXaTe5q3aa3RudILSKl5IsasCTw
	4b1Up/HAnjrPu36Kkld2wqOmz1bjo/oSf2Jn3qw7WMdKPBH3ppGftDTycmdjYkyTKLgOakLebNx
	/ljCq3w03Ja232CWFAPMpOdBS0Hn4qAdVJG80DxSLsYNX1K7lN4az3DDngvdAAYEXCHUqCKL6hU
	A0Cub5xXWXtGAYDNX/cexEfsuHIWpUsRc9lB+KZTiFBTFu5/hRMi/o=
X-Google-Smtp-Source: AGHT+IHA0P4UnsPFIhj4utJwEq6rWs7Nkg1EY8pIQ9eKSlMotkC1tp8iAeDrvqrEcOWVVi+EwKFK9w==
X-Received: by 2002:a17:903:2f88:b0:274:5030:2906 with SMTP id d9443c01a7336-2984edcd3a1mr35066775ad.46.1762946284740;
        Wed, 12 Nov 2025 03:18:04 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:04 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:50 +1000
Subject: [PATCH v5 04/11] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-4-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
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
 bh=0X8ztOxPIoLqy18jxO5aLU25sae5cz22Tql+G03LG0c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUeYXSp6HTiumdkXFc1P4lS9PK9pZfHi1fzZ2ef4u
 HINXwV1TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MAptrWmuF/hdDOyUmTfkptiMp9whlc1h/rFWiQ075Z8Ps7E5W4r7/9GRkmt8XcOv9
 ZLjFA4cGDV3ZBzGeuTKy/kmDxwz4r+r3ILmcmAA==
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
2.51.2

