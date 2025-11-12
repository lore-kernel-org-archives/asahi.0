Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB7631282B
	for <asahi@lists.linux.dev>; Wed, 12 Nov 2025 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946325; cv=none; b=F6vM4OAU42IbHAPbbM9SjElOOYAT3iTvRBBWybsAIiPB55cg8KF0E5Ri+e8HPHf5Ldoxux1enWgcwdu9Pky5dDQl+kwHvlNIQ/tk4PMkyCY/5QTe3Zi+ivOweegmuB5ayT7gP/vDJmct8SptMWFUC0UEuK4h6VIXOfTP28H0a5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946325; c=relaxed/simple;
	bh=Gjco+o33Ze1VtTmwY3+n9x0V+5Bjmx76JK+PO6sbBb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NkpWaiAfW6dHATvR+CSs8r2k+xjoYOa0l7GJ76O2EdMGM0eDmy0qFebdVL8+5/Ut9SrC0ZCT5B263B64Es/1pUsGCXK9b5N3mKye8DkM+qwpNjKz48uIxzsebuBvdYFZ96TPwKV2N5PVAiUNVrdhrziQ+0n8GtsRjkVyk/LtW8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AENDRUR9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AENDRUR9"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-298039e00c2so8692705ad.3
        for <asahi@lists.linux.dev>; Wed, 12 Nov 2025 03:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946322; x=1763551122; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMg0B2M6mlNno5KCjV7xdRrPsgdx1eaJiYPjLRnt1dA=;
        b=AENDRUR95RGmWJtCL07rbPNW2ypDthTY6VSV5cxijfY7f10WfBkrRxnG8hIzmXdocF
         0pA7LCPuZcqPlcs6OxFDDWcBZiXYWtSsTgMS2ernug9fVVsce70Y/0ExCdjx0xiSbUl1
         bNh9bgPeNEY5b7BBSuAAczgVpvfXRbKR/VHmNZWtDxzQYn8AK0mKLXCXIL8NcVU//eHl
         89GDa8+xFuE/eECF8SBZw+9UyrbmL+/PUVYU33d5rGVM8JT+yoopfqObT4IDD3mZ82oA
         16Uc7icVIBPELZXsBqmnvyyk8BPjdWtXMeJx87vN/QmZ6VPE3hfEXTNJ5tyZHD9rnhWz
         acXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946322; x=1763551122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RMg0B2M6mlNno5KCjV7xdRrPsgdx1eaJiYPjLRnt1dA=;
        b=YVEKewuV29jBZJNj1UksorUW3cHg2LouBl7iCdNHoTSoFhUL3sKzwl4kbVC4UCzo6x
         Xwi8GXVA+rXkNQ3qx+r1hW46SPqfIAWPcNN4ifZprQrBhrgkRg96YGVSN2Zl7kzpmM9/
         49t66yG99/rbMfuc90NbdeW2AwbVtEjy5RlStHytw4PG97b3RNeWBrs578/XHk6gcHWG
         U2dggEghRy7bOeqtS/3xg0Yrf4DqXcUiRIeIkiQXoFVpRtXGcmiVBIzsP7u/JU+C/q5u
         93cQIn1lz5NZ1omjtNGCB9nI+QQiwS0AcZ5Q+k9rI1R19x+nEjxadtgvf8lpfjieg/9y
         59bg==
X-Gm-Message-State: AOJu0YzGj16MsbxKCX3iDUtWILf9YmWOVmjgqBlPAvvw3EO/lZApnhh6
	KspmrHOAwoeYH2fJHV1rv4Y/uG1WuDl6LEgl+3bFiPOsZhYe37JGvQSp
X-Gm-Gg: ASbGnctf5RE3oDIaQnmqW/b7To+FRksdWE3WSN9YzAiW+eunCs0ZtImnxkPmrz9y4jZ
	iN5kckwAitWhxSkh0y3m6xhBFEjIgRLcblj5Ki93ZjF84Vrfa0/k6mtswEMuH4zcdxGxfQCs5zc
	bk7BkGB6VdczFs1HV6btrBonOQSFJwlYMFUHRy+/aC8KIVVpMNAHV0yzSxIqlZeZw0XJZW+oKRL
	aFrdGcjgOeXqFU6a+mUVq1FU81YZDgclCTLJ6jB9jiiVIHHtRl79Lzm+3w1O1RnTxWFFUaCnm/L
	DDb6oPTBY3KCM0TWwa+H5ImvfHbc4DGmGrwGsBLaXr12oRj2ikwG2hoZhYj2WEPmqfGI93TZ0ET
	BwI1dAr1IckVc4ORQLchhl3yZMaQD5SfqvWbdqwjIb51nU/Ktx/GL/bRFe0VpMNpg8lwmgirAnI
	tK0n/vsYweC1ezjewID1nwza5n7WXadcnQk/rx2g+OABUf9AT8R6R9YeOoaiOWzcWt8Ywuk8wpr
	zVBX3xoWv6iG81fbfcbIFb1HsZkGX8tWeJAwBoECkhc5gFfWmTqT/w=
X-Google-Smtp-Source: AGHT+IHJszkUFQqYlR5AFfzTGIEAaKvG8RL+kwBBJVNc77ojPYvNHMx8YbFZwpTAtKabQYIgMU5Dvg==
X-Received: by 2002:a17:902:fc47:b0:295:24c3:8b49 with SMTP id d9443c01a7336-2984ee0ada1mr33966605ad.46.1762946322113;
        Wed, 12 Nov 2025 03:18:42 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:41 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:55 +1000
Subject: [PATCH v5 09/11] mfd: macsmc: Wire up Apple SMC input subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-9-728e4b91fe81@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=737;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Gjco+o33Ze1VtTmwY3+n9x0V+5Bjmx76JK+PO6sbBb8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUe9MqcoXO87L1RrfX5F5enpO+XeLfuuXJ0+02Ubs
 7Dj91SGjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFTPdGH472O74la/3mPRvl8BylqCRWoyR8UunDqpHsCo80ls1Q6em4wMm22qelk
 nzL8Uw5BRsPxd9cobzkyfXVcpMehOeLLkl9dURgA=
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
2.51.2

