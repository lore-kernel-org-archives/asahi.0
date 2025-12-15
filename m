Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3688329E56
	for <asahi@lists.linux.dev>; Mon, 15 Dec 2025 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791523; cv=none; b=owTITTJ9QJnKgtEHRHLKdsZbp+jjAelCzrNkt+elZ1NcyPYUeyGpPdxwTyZSIrfJ1i869FZitDXxetzEdToKAl/MsGkDoqkfMIGRE+d+OP46eoBrHrs9MaeJ8Vdj+Jy2NZ+0Ay+7JFKrpPaqgHFXdZnJ6S6fyU+rmFoF7BYoYvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791523; c=relaxed/simple;
	bh=ZLczhFCSy+m+gUzqsZBz2A7r/g5l3YzTxanZgL7vunU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r7Ug70H+WEJPj9eXCpIjGgp8RntVT64E99yktNme1UtbQnB91o+8xzks6I7QFXOkrSqalUqqjc28yOLIaXx67/CO4FRSpCVdu6EkW2uhCoDWePN3F5LONVG2UUwysyI9F5LY1PkKh+MU/EVzwObRQLFI2tBJsgiVQR16iiZAesw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERnDt3Yh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERnDt3Yh"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0d5c365ceso13891925ad.3
        for <asahi@lists.linux.dev>; Mon, 15 Dec 2025 01:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791521; x=1766396321; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyG1HrY6OxFyDwa94CYzQgXUA/ZnED6KNtKcs5HUkkc=;
        b=ERnDt3YhjZEUmZwKtlVxvy0uty2D5cKCkfjD4Kpc4+oESCfi8gt5y+G1uYVLURowFV
         IM7gXjV96piO3ks6yJEUinEQ12+AhSA/HSZnKUrmzwt4lz4dOiEM6JM97qhDpUGVsZQf
         XAsawjmSn9O+LZ7PTXhJBpU4VhAogwavYWAfLC7hDjiAC+ObOsHKAgG2OknZJtxTCK47
         j+uIne3LMyLMW4+1w49WcrlPhmlyYOhjXVUwLu7ZAyDSmpKocy8kYkMLXleIGB0Z8XJV
         +MIvn5rHorF9wmEPvNCdt7xnzFyY6gA2IkfxF7zhE1Bb1sxP0iED0tRRe4xLdBBNGH81
         paKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791521; x=1766396321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JyG1HrY6OxFyDwa94CYzQgXUA/ZnED6KNtKcs5HUkkc=;
        b=gyxvtRTwScJvtJyn9nh8NV7nxXY+0l4YIEBF2DUkkZgBl5MygHtsAvntztXfFYs4sb
         PvXyM3kOJgajBxGHi4Mbu2ouB+eUHSuXVZrm0keuVzbWR/2QImsYkzILKF7rNe3HPlkY
         PDOgRKT8S/Th9YwBUfCRUnw7NBsdKQOE3V2RoeRC0EAtPPbGyG0tQRioS1mdPCfuJuhG
         KzvkqDeme/FoLHx1xZSEin5yPW1YsEzifM0UNijAqM18yngOksI0ToWGqp5L2t+4aouw
         8cxhcR6tS4kjZbJAnOVhkXHNh1BJ5sOaVlsH/otXkr+3Kdq4rqSqBhQzkyUMSwg+LioO
         /JZA==
X-Gm-Message-State: AOJu0Yx0P9ynPHuWgac1CdTTO2pZiq1qsNm3dSNXrTEMYluYiFTO7NDZ
	T1P8luJpwL7m11BSJxnGILEJeDYkVFLjUdaPozphvTCj1YuAMaUDRmqr
X-Gm-Gg: AY/fxX5ZPso0Pn6v+MCjlKtbKpKKZrpFMdrQUytVTLTr8HtHHTlEz6Ph8eZSahjOLIs
	3AS6Fr3HhMi4fqErPZsaNwQ9/hv4KuWfZKjK/c0n+hJ3ykicmGjK9K8LRRzilIaqVKx38ASfeUf
	JC1lMfH1dISWre4OdbT7ZQMWhvZ5NQT5K6KrAP5EIvYeYbuFwr3KuVbAAGfksWW6DOBsAQgS6bH
	Q6XHwXS7JfoKar6Juc6vKSVPPHgqlAhA7wxGc6HX3b7Wcj6G9gsKpWOmRpwgc2QToaZPuujN4TM
	qUmlF+V1L/24FFmG8hI5BSyYiNzZAbmIYBCcOpRy/c1RyMKdJRZstkQqP5he4k9dcyDMVglivQN
	+55CsAzxfDY+/cIwoZII/6y/lwMXJ9uA23gEpHEH5uB5vCLInRHvZU8kjyoXS6YS7R6ncq3wSsP
	SLglL21/JlxEAYpP//XZAMW9A+AvyiSZJZVWBCZl7ibM2vUI4kjsnLogSWXCbf0bybST2+5FoOm
	RDdW5iWzH9SbcA/yVkjXGnriucqM2iMM2iesfdNTcDRqS7InrMTttRt0yk60FOL3CDWCvWnjVsc
	DDjGYMFM/xl8BdjN44VLuDI6qGLWSxJgHp5+IUURJlvy4nb0Z9I=
X-Google-Smtp-Source: AGHT+IGrLdLzfp2H9tiVac+SQsAe4bk4AskKgVbq1niNwYTYkBxJLkhYZNfHpCAC+5TQzOHObd9ruQ==
X-Received: by 2002:a17:903:3bac:b0:295:560a:e499 with SMTP id d9443c01a7336-29f23b1296cmr99473905ad.5.1765791521288;
        Mon, 15 Dec 2025 01:38:41 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:41 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:47 +1000
Subject: [PATCH v6 3/7] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-3-0518cb5f28ae@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZLczhFCSy+m+gUzqsZBz2A7r/g5l3YzTxanZgL7vunU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215lvbGxWfZmTpGq3Lqym4EiH8s2A7af357WZxnZyZ
 uYn2O/rmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 oY6xjhEDF6cATPWbr4wMO1zKc7g2zW7v4HwR7C559/WHjwy7/16ymvClxfJzdduSfEaGPtaOhFL
 JJzUP5q6folLGbD4z69LuKwW/Ls+1WpDgv6qMDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 9099a7a22f1f..fa7b822d55bd 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.52.0

