Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0711A23B9
	for <asahi@lists.linux.dev>; Sat, 25 Oct 2025 00:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351927; cv=none; b=NIA+IvvNA1pKXQ1YaqsFS0xqlCM4AwVgXKGvin2T3bXjTYOT20MfPGbFKv2RQAnB8FoRdQbij44rfle0nozuBPiyhdQcbI2c67qObb0IpoekJnjw+bNPrsjYhs8f0Jjmsy95UaqUlBenTWxz4NbASgrY9g+R5o9SZpcwA1oXrCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351927; c=relaxed/simple;
	bh=DIjn1i6LYuHnBLhKvNWo/fynkhJW/iU4X0uf260tH6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OFXWtZEhbU5xa5YzspT9+SqsmvFI5M6nduxbYmSJqAgccUIyqvBzBXSdTEm4hpJp5QNB5WMa3nolwCf3WxEDXhAYxsJ4RK7BLPZfHVL6KitLfV1x8ovXoZdPQE6Ffp6YSWQSLTnJUi0DhKGgJtubHHSPz4kqH6ZZEXrTx2srkUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMTQUkHN; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMTQUkHN"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-27c369f8986so23077095ad.3
        for <asahi@lists.linux.dev>; Fri, 24 Oct 2025 17:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351925; x=1761956725; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=;
        b=gMTQUkHNvMuwoAhPrxELSmdJSldIOCiuGyiK3GhXb2YfusHO6pupTyITXbZvlMmpvq
         +YlY9cnadhOip410P+/UkYdM9cGJSTurAk84BM5BTWjDezQE+kEspfM7eCtYhqDdQpl1
         OSgudInJ6pNSekWjUltLQxUDCqt5Ahx91kjPhvLDFmiDPmSrHvs3FCS58UD6kpgBbLJz
         J5bfvbA8hfiLrJwwzbT6aAWHu6gG0968lGDGLfwhLdTx2ScPlTuWpIPKBNJ881nzz+Z9
         0T6lBqDXX4WVWAa4IIjbpwrfEoXM3qcs6b7qAhxHRog+BKeKQoJtlBtHHr1ECh7QtzSN
         2K6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351925; x=1761956725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=;
        b=UrNRHm9Pl2GVufonWuE7a+FE6KhXpSwsi2Ka2ZVHjhfY6K7KjAoqLa1pfI5wo05JfY
         xDTAwzJTSh+XJTsMyvq/0BcMQC0bEqvBDdE/oQ9RLB65shNmoKMEjxNWfzCk8y49RUSn
         3SNd3tMcoEXVns17XrCTx+GiCzdLLMBN9YtFct4KK2DbmGKpQdLcTcEvkjXZnMacaRCC
         Rl3YXBDHTqOdgM0Z3Pz+2JrpTDQ5iXi/Dk7WjL3joX1X8MkUzhBPrXCsj4In1emJ7WNW
         CB9DpAqSKpcC1wb5roLrMx0tyJHPFMXrQk+4XJ/wkPTvdj6lVNA0Ibx/s4Ecc21YBX0R
         9LXw==
X-Gm-Message-State: AOJu0YyH3Q/cfQtlTctlX6s4W7bIP5wIFGlNdCeJ2R57VSEVSX6U4Ljf
	z2tBgWlQmPTPaJ5pF093P+S7XXaZ5ZUl0MyuGsPx1fYM+4TRUD7LVTic
X-Gm-Gg: ASbGncux+7cl+uDAeJp3pBKUOqlx0JYw5yYBhW+CgqqukSgTorgs4yHuImIpoQrmn1k
	kzlh7Qg9E7xjz5LzApmLZyt6t2WL2MXG7eXIsiBYLnscu0C8KAijz0DUsq0z7PIHQ1zmQbzdPmD
	peIpzuHArWNQeD1Y+omXRyWOetgVAfu3UBZGbCoVPfmhjf0AagDA0W0SPiUS+I/7z5ETsnhkLyg
	jd59gIw+Ktc5Ny4Se3i4XZUH2MOhN2OpToTCV6JkfJE6QMP7Kxz4FdRKfN1aOFccvwFZ852g10K
	TNmVrrov9bILDDrvFMWYXE8KGdKLfQShVUWr5oIgtEaHDmYKyrCR15rFnLU56uw/JEq2BVjDczS
	BoiL1AymwRwm1kUgwYDJGD5En/O268PTYpXxl9ft/BXhrx3tdjXwvJC5JxJE6sVVqeNFEm4ABPM
	Uy+Ata+2oP1d6KjKzOXtxYVF/z+lap2uDymg/ykJ0cgoLPT8B1hJs3NbNZKoxN5VslcShWaEb3N
	gGmcxYxHb1XHpahepZ48fm1ArUCcqveq+Vefzm9XYhIyHtc0YDVaL1Hl7zPCU51
X-Google-Smtp-Source: AGHT+IEcAIrM5gDLd6A2M9OWpDkFvdgMAQWlJmHHcjPPAuvS+4wY77QHgPJLW5SNNNq/wEEOrEct6w==
X-Received: by 2002:a17:902:dad2:b0:286:d3c5:4d15 with SMTP id d9443c01a7336-2948ba3c6a1mr49230345ad.36.1761351924748;
        Fri, 24 Oct 2025 17:25:24 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:24 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:35 +1000
Subject: [PATCH v4 04/11] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-4-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
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
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM66XLGLz/n50Chebub0Ao9Nf53uT3wfl11dXS33N
 9x2ymOzjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFSfMmdkeDBb4PWe+6s0vbok5oTvmR4jwlY+maPo+DIp1m2PikI7LzD8d963dV/
 l7GSLoMiFjx35q83EPmxqWT39yQmNyVyhhrPc2QA=
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

