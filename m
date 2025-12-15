Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DE632AADD
	for <asahi@lists.linux.dev>; Mon, 15 Dec 2025 09:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791516; cv=none; b=p04JCYTeKEeznEBliPZ37ojBp037id40rR/KvcfGEvHq8jv9hnvJqQJpzUM38L2K9IWmCmlc1pXYRmIzapQL1bFdfTSQ3LgABZJ9ZeZx+aHw/Dqh7sMJLsCc7QV3+NqDVgOai0e2+9I3HDZEasXY6hIATmQD3XXBOOC3MSxpu9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791516; c=relaxed/simple;
	bh=zrs/6kJawMZ2MFguV+AuLC+A2VRjOPQuG4CKOsgbB0c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AXykZr2iM/VPzcg/CI2yJhNbLHsZ2Llu9jcQhUJr8t0yazdyX+WJckxnDbtOJazIEmTO6BvyA4cjgMJAzy6/f4eaP1mTIFcA9i83BLGMMYotHB75QCVbfGGB+uBdgFfuqMPvHmiNJEzq1U+P1eRVGGR1RsbGM/F0SQRAsH19xEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7d6yTrs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7d6yTrs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0d06ffa2aso11930825ad.3
        for <asahi@lists.linux.dev>; Mon, 15 Dec 2025 01:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791514; x=1766396314; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rWL/R9H5BUG2NYa4jn/zKUUS6RMYKLuzBStU1FlVeTE=;
        b=F7d6yTrs1g+/++V5W6X6uU6Uz0f/3xW/qPbSv34nM45AAcqWWfa/GpvR90Yf725u2V
         TBTsFI+TiD2u7uClcjeRSs2TNnCiKxomLX4EiXZFvVO3YPxIPdcXyhoBPXJOVfE7itUl
         e7bRaSjQHmVhep7D9NITw6oM4eaHYet9aXUmBrAwlalOyc0DSX85zUwd9sAbv0p121AJ
         HvyMnLDrPjJ5ZqGy9D+6EoiXBmnZpwDSOCD5L/bJdPb/qXZS2xvRcDnmGdKW5LaRVvr6
         3DDLKnU+2Up1BjQUWus+5bpIPQG7GYwz/uUlEccjrHGYc0MxmMQY/H8y5acTESt8QfK5
         Gw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791514; x=1766396314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rWL/R9H5BUG2NYa4jn/zKUUS6RMYKLuzBStU1FlVeTE=;
        b=NjmSmw1H2ZgEexzX5/v9SJz9QSl8hEyFfAwryZQG2B2unr/pfvjuKU30Tqm58citl0
         8lyushispqjz5Mf5HkZo4nIb9lh1E16fWasqM6gug8/0brnKXxg4W92bozNP89ejipKi
         xChijFfef+hB+BskTIdtb9aSDPU425RRBO2dzuZfQeFfulKgVxNFteNLPOpj5sDGiLbP
         Oj1+Uy6a7ZjGLtEQvunr3/9cflnES/VJl9UwDEB/7oHRruJ2Tdwu0jRgnaKv1/L2AlnS
         Tsf5plNRc/xSgGSuqOwGGggqL/s1N0Cehm/tQhrgBgNq1q9vesIP5LffZWw8SXkR0+td
         MgbA==
X-Gm-Message-State: AOJu0YwKmbGz/QyXa/O12k28v58PfUE4xO4UD+UtUyO+shRV8kURJ744
	djzPPufYE6uz5+oVrlq2/oovJuZJBh/GRnOKBhiUQIeR6Dnyk6AHVWsJ
X-Gm-Gg: AY/fxX7GSEkCECPVxYrRD4ge9GpsipNdPmsxOnX9ddEkMAJf8b7ETOexHIHas0hpgG+
	MlVFLt2WklOws0XC7bxqME2BXyvc0GIs3IsvMOjaXmia23FKDJCVNt4yvnVOZsxSlvKC5mEO4Kc
	wdo5APh/cPFDI5Ls5d+0g42w9WGkJ49lN7Y21w39zBcmFMH+r6uKHMpjLFXhkDvsJnbShHBMJhL
	pxUpiBBkYoNZztQZBIdG2ZalIa+HjHeYzc+C+MK3WA+QVY7aFYzlJkWJc//sDAdmWwGLlG/qUrU
	GiCCQUWC7FoJvX3MSerAfY3kzH1uDe//d4cmg6soFLw77lIg4AEyjT+kmlyKuBDIDuB1SXTWxIE
	NBDq0/8p2QXqS93cjULInXAjOnMmHnkQnAcP9M0vh17pLgcNM1Lpc/1N035TFq/dYmal1WW5JiL
	BakVgUn/WFGVo/NaGaZ7Wgx/d+PXeHokrBP8cuQGYC8zgYQAX5PK5MVla8F+x3nHKhXa8uuLrwK
	pYI9YwBaYYwbhZ0MIfV8SwpuVG8KEwJeArcuwV8eyYmJYon9ErXG91T+xLoefilKF/PSWQaxNEs
	vFnkjT5UUKulIpfUCLoYIQInelu5k98oMzJzA8cjVglEKE20wp4=
X-Google-Smtp-Source: AGHT+IHCWcOyM5Z8EFFrTYBLBI/0yDbLna48TS9+7DgDOr+UeDJqde5BU1SxSQK1fSOkyBfxFjFufQ==
X-Received: by 2002:a17:902:c40f:b0:298:6a9b:238b with SMTP id d9443c01a7336-29f23d12fd6mr91903265ad.51.1765791514107;
        Mon, 15 Dec 2025 01:38:34 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:33 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:46 +1000
Subject: [PATCH v6 2/7] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-2-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
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
 bh=zrs/6kJawMZ2MFguV+AuLC+A2VRjOPQuG4CKOsgbB0c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215nvvLy0yve6ff3amrhrC/MEs/XVOlOearId3L73z
 ZXPa/xqOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKhjrGPEwMUpAFMtVcHIcO7jXJNT6ydzK7gs3uBz8fN7s5dxvHcn5/gV9zZPuPmj+Q0jw5UGyV0
 R228vqDuoltO+7rvPRi+Wc5+OZAcpMMaal/3s5AEA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC RTC function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e3893e255ce5..9099a7a22f1f 100644
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
2.52.0

