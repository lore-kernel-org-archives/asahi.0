Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA72334F468
	for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 11:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756293801; cv=none; b=P2O9X8BS2YrrySBSdrLQPif8NAOg2pn/gzVYEzr4BgeD7acv4Qaw9q+0IdB0McoPaTypCnEAyykxHAjcnenMrY1p0j1hrjZ6RpZRHgii4J0XDAH+pnfkndmDIoNygBUi7QGDWRA2fxrYa2uCPp9B5GmtyMMfi0D1nFOyo5laP+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756293801; c=relaxed/simple;
	bh=VOrW2GfzJb6imZqi+U2s8G3s2QEeizLHqMoRRpb/nIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c2tdFCDkW6FdliTJDkJBPRkq28zvrwnj0DgoMsbzwTe9CdpnUSVqdNhaDnoii3gR9xcFV9T1bo5mEGuosrnXBGOjicQQwFtY8jDOM1iV9KxxhNyyeZ7wBoCsYDgPPNWw4P5cm3NYIvY+UDBi5qImJ+V5BmjSXMfVp0ix7Bc1XCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPxiFxMt; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPxiFxMt"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-32597b88e1bso2983591a91.1
        for <asahi@lists.linux.dev>; Wed, 27 Aug 2025 04:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756293799; x=1756898599; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VRHVnpg9jOOLhSqBOjWKSbJGnSs0q1UyU/4Pw3oBr3I=;
        b=BPxiFxMt7o1mazes8B6cXH59tM/74VD2wHtctL84gje16AmEkDUcL/BBg+ihPZfokC
         mUwFG/Hqj9ON9LytfYY3C5CpAsWhZRgtk9EgzHkXoCZdn2pl2mIRZkp+2Zg4xWMVfGV/
         MRuLLpjYezzKH3EYAHqSahlugEAU2SAjig7fMrdYrTpoDJyl32OusnvHxejAS4e7EiVw
         IYsvaq9v14Hcr7zsZHa0jhQqjTJiRXBtwTB9J7LQNyJT/MGY0yTuRPkNCHi/sU/Qoa6P
         6mvXxefrlUXTFz4RGo+0DPSWa2WR/DqnJJpdOam/jplpxCUL0KC34f+NsiqbNSfw4QSr
         s+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756293799; x=1756898599;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRHVnpg9jOOLhSqBOjWKSbJGnSs0q1UyU/4Pw3oBr3I=;
        b=xJFCaYLcepguSYBirELWmNkyNwUfLGP6ZYAa0OuVuPJL2I19NVAu46NI1T8bl9YrX4
         OtN/RYxn+srjCa+yyCslB9XdhlCu3oZFiABrTiopARk3FyeiPZkUrD+jfD+Ev+18axKa
         yfJD3arGZ1iwhqknW9xfUS74qQ+BsPHB6DnptB8OI7PV2v8c+BS3Oe3Q2yffGnZj8AH3
         8H8RzIwSmjRNuaMZcepeCYijoVazZzbIV2NrLUDSPF7RFtHbqdD077kBFo7vA5WrZ1KP
         e04izfuOs8a4ww4Z8vOn5kyNBBabAKo/n26Yef+jd6GPW0/inG2jq4OkARppUoC+/3Xz
         9jkw==
X-Gm-Message-State: AOJu0YzpxWOvGIGMgsGvHTfU51PuwUx4DEPMztMyaEK1KRKlQ/Sl4Gof
	OzbsinSBJFBeaFpVcONGm+NMDJANblmeOEAIhCzv8pAN1OF82TKq0wzS
X-Gm-Gg: ASbGncshfabXyK654ilz+FJQUvBqw/5XbVxGnQBbRRTjWI2jpiAhiDkBwPv2iVZZSFw
	XFReSRlSDEhA7SP6KmNoYjreTfqy/Bx7pcqHOCLLVnxJY1LtE+io95q0wEVHrrj5aXNJPRCSv9I
	4Z83tRjrFqUYZMDIAXg4RUeZr4CeA3zGUrCXdybK8XaUszwF3yLqRHX3eGMnCvQP2d5ugaCC+zl
	MHpW2eqcFSvG9O8C2PA8EUFs8P/yFjI+Lg7RjO6n4Dn9R8ChEdc1PKeMnL+zp57IFhTLk4pJB3w
	+QEFpdG0boiZyIo9o+d/LrF6rk8RreE2/ERCSRARWXvvJ8WdOAFeVWzbSbWUvKLB68STLUys+wq
	VQwYnzMw031I0K2iu7bw3c+aF90x+dQCwcrCawoVyns+3DROtOXxZ05B8yzDAU3HeMyo+0xB1vA
	+nfn5szjp9QBYff+bN6PcSTQ9BV5c=
X-Google-Smtp-Source: AGHT+IGazgBF7dBdHwX3f8CSjkteviIi1P6yshCO+mKyTVKYMXEQPnfM8dJAfOCjG9kzcJT1WvLKrA==
X-Received: by 2002:a17:90b:3e44:b0:31e:ebb6:6499 with SMTP id 98e67ed59e1d1-32515ec135dmr27101965a91.24.1756293798966;
        Wed, 27 Aug 2025 04:23:18 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd6232sm1819708a91.16.2025.08.27.04.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 04:23:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 27 Aug 2025 21:22:38 +1000
Subject: [PATCH v2 04/11] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250827-macsmc-subdevs-v2-4-ce5e99d54c28@gmail.com>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
In-Reply-To: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=VOrW2GfzJb6imZqi+U2s8G3s2QEeizLHqMoRRpb/nIs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBnrXjW92MB4c0NY3kzza2ESkqr5ug7N3ff//Q3gcdhkG
 GrodOBlRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABMJ2sXIcCBlW1rgMjN/5znf
 ExM2rF4ZczxhX0kf064y0Yd5wdN3RzIyTJ2y3PDT9O8aRz79lH238vDDxEsncws9+a+wr25iuuT
 8nwUA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC RTC function to the mfd device

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 870c8b2028a8fc0e905c8934c2636824cbe5d527..59be894460d33afa754927630881532b548b7ad8 100644
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

