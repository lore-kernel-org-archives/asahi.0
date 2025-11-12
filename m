Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF123101DC
	for <asahi@lists.linux.dev>; Wed, 12 Nov 2025 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946309; cv=none; b=qwTjRxxeIn9Op0ihbcSNoelSrI/BVUR5JxTVybQyomoqGfSdJ+3AKKQV0U2YSDn4l2sZxo376rCgU/PPJSsjXMv13iyAcfw5/6OgKH8CZXMGX8Mr7agucnPFO2ed7RpC2MHVp82aWxVoZ0NVRGPI9t9NvahE8k0C3Zi1yBXmlhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946309; c=relaxed/simple;
	bh=KDo5qf6VinF0dcocAqVHp8Ouk8wH3LA0jZpPa6Inudg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bGNvZIYdaDXGKlgRyev9KEI2TC3uTyESoLFTpyIcuo/Yy5v1VBqYvwJO+Ham8JnLyfyOCCiD/bxK82KnGKh4pZRvB2B7l2zIssGIIWeCAs96sVQGso9BpgHCmDaL61YwF7VpjQQnzIcmqobuZTM3GVIo7fSxMZHRXmrLjaJcF2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i3XZigqz; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i3XZigqz"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297e982506fso8450595ad.2
        for <asahi@lists.linux.dev>; Wed, 12 Nov 2025 03:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946307; x=1763551107; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lo9J4PpQIlH3VY5/mtPONGxIrnhCSXs3KQrxmVaTEns=;
        b=i3XZigqzhSehrex263ovMXkhHHY8o5MecpGxbNvp4E8WdDuL0GBtj6nsOGydt/+vM4
         UsqHf9RM+EoxeebF6gB+wlGNwfhVi2rnwNenFZ30QAbjTUK8Wxd388EAlOuhWQ8rcstg
         a//MwPwof/04pHItCx4hXgpDW32H6AYAZbI6QmM5WQnqWdamMrzK6vbKrR6h+egcWHVF
         8t/jcXAAgGGAWOj+xE80hqUPGXxy80rrUL1WI8tdfZ5tU7E5g//u1+AKhzNFmwkSbItK
         wC+L5UBJnNAHmmWg8KVa+WC/Rb1LhZ8AG6sLsQJMKHtxKtk3JbEh+AelCdhG1m15xf7W
         qQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946307; x=1763551107;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lo9J4PpQIlH3VY5/mtPONGxIrnhCSXs3KQrxmVaTEns=;
        b=KNcQbduJxCqbaNYd4+yDrg+z4su55GaWwu0mUtWqR25u3yHsChRmIiq3Nvla/NIeAG
         TaK97fjZFodNUUU+a0IiEzSeIGuoj3/TUqkWf5QRXPSuSCk9ccPBnAHHPiezhANg1YV4
         rqbydr/1+1rwBXo2WMOxlZgQYQClKmK6KB5KK6BEHSJHde69TKodvbl6QqBXRBhiSmAX
         9hRq7EDF5G7HO26sOF5oltrLxxQ9GTF+ZWKyxj3bZJ3Fqw26S4239Vfe8FkAhchAuzxi
         ixpPsyENl1087C+sI+NrRuyjLQfGdsMDIDE8/7aCAx+fKtB7s+C2KGIbGiNqGA1plk38
         cv9g==
X-Gm-Message-State: AOJu0YxsJ4WDiwPNE9QydrcOUC0iXtpcEEYSjku/sQpYsyvLNFlhKDT0
	uYf+a9lrNIkvbO1OEicaUBb4x7QD9cq8VvK+S4THIDgWVKlTXiIZNTS3
X-Gm-Gg: ASbGncvo7YCOmIZ1NrKd2szio4x0zupSl7G9Xh2mHL9oB9epCm12nI3B3CLgmBdlDrQ
	1gbapjPzgB1Mgyu73CjKbm7q/YtkjndjN7pgcSAH3/jnLDMx0nvb4O7gVmOrKl6rmZcoor1Y5QY
	YuwrZebNPCDMM8BV1gxu524CgtAZyi39JB+A8tVekNszgJOcpf/t6XLffJZDCTCIsIjzxrr21YO
	HOzFMo9S7InQZDOMkXUKGr9OU7CXaQ4Xywy3D5nVZ3/DvjovsLkCNqNU6rdu4f+Z58slLTR+df9
	43aglEBUXbqA+sRolCyj7TISHQRp+H2S3DEEn2b+Q/eoLr6ahWzQfRRU48xrv2+NZA320pgrZJ9
	y0LFZ8uMLWqS+UbK3QDiQzJNSztiv7nCBiFKI/X9VtFh/6D4GtDnzDsMwoboE+XWS5bE++2sir/
	BLuuYiR5chq02PbEsOuqJqau4ZK2x8xSdJY90CBTQ8/ELgcg6EYkK2DwtVgA0lOoHo3CTXlql0c
	5KyA2FCX/Yb96ZbyyLMzMVx6w4AKQg9wZzcncPdEXKdnsk89fvv5okkxrAAjUNT6Q==
X-Google-Smtp-Source: AGHT+IEImt2oq5AVyAyincVqTizrLP2oINP9hgu+RQmDQEbV/h6h5zM29LTMvGX0qa1Tj+zk9/lS9g==
X-Received: by 2002:a17:902:d60b:b0:294:fb21:ae07 with SMTP id d9443c01a7336-2984ed92d45mr33420405ad.21.1762946307045;
        Wed, 12 Nov 2025 03:18:27 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:53 +1000
Subject: [PATCH v5 07/11] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-7-728e4b91fe81@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KDo5qf6VinF0dcocAqVHp8Ouk8wH3LA0jZpPa6Inudg=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUdZA4+/VDxp9c31mWLPB8Z1xzU9H8o5bWfLi7zwL
 fz9vPJZHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNQx1jFi4OIUgKkumMDwv+iDSLuozZuJUz69v8Z79VyVRceJ3QsUthr+n/mbd2rAklWMDLfnfll
 6aovjr827RbynnHifxf4lfqXZyn/z+aa9YGbaXM0MAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 500395bb48da..51dd667d3b5f 100644
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
2.51.2

