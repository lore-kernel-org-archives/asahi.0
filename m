Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AA130F7E4
	for <asahi@lists.linux.dev>; Wed, 12 Nov 2025 11:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946294; cv=none; b=WKssILEQS0Zw7kLM2Cp0bjHj6f3bG7QiuMV3QutTx1jvzUQtJBAXka57BuO4poo2+YrxGWehO8WOnhpI0K72nt7Vi+lz7u2cvVIoSZzHG//4I3ZrrRU+o/0zXNC+bHeOK6Xbxo3Yb7ksjiZ08jacpxNGvL8Xv4IB6vwU+yRbMyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946294; c=relaxed/simple;
	bh=6q93RqE2TlCEUP2NwG3riu6HujLsBQ7xoREhizw4YE8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HBoqGxtRJjDAd1ehC0Dn7VyS5kgkZ0zfIb36WLUp4lCvsCoej9JPCmrud57IQUPhDns3g7YwtVxWwrP4E2zkHW8qxqBWRaq17CyZL0x4J+7M0nqgmf3eyVyMkNGfEiR81X5MNDPgMyyBLFG5FBycOcJQU4GfozP46Pry7EpfKXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QrvH9Jaf; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QrvH9Jaf"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bbac8ed0614so559405a12.3
        for <asahi@lists.linux.dev>; Wed, 12 Nov 2025 03:18:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946292; x=1763551092; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNI7LGWITa4EqINx3hRdJjLYG6Q/rRCvp1T1pOKy7wA=;
        b=QrvH9Jafi1M/q958pQr4LZJpRvmEhHrffNlmQeh2+Dfb5tnt9vCKPeQhaXcIZM6IV4
         fUgjyJeUgIuZxalEwc8sO+icusSjf54qRWsOGQp78x+EOCVd+Go0QEpOSnrDFpsuLQKR
         2Obon2DiyMVEBfY7zDLuIknAteQBJ+PqKaz0msG+qfRbp0xIHhk7cvDSzHYLlRFwehFA
         TUJuT8eHYcrKkzWVbl4iwkBds0yse01T/wCV2EyjuqMOiiM27puV9dR1lQVQiQT5bBwW
         t+sEfTldcfsl4mdOaVXaMut0J2XJ1/mIHRSiFOtuP4Ok6Ahr4CTYsU7yaWBKUmGuGzFd
         96Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946292; x=1763551092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oNI7LGWITa4EqINx3hRdJjLYG6Q/rRCvp1T1pOKy7wA=;
        b=JIBsDFgfcxKXbsNqEYkRRqG8ilRhGJD9MmrggPNhO7AuqEtdzZyi8tNI6+uVmuUu+3
         3fAPpgdDnZqIHvoFyqMD3zXM2EmNILXnBtw2Y1xD1yugpOPS1nA2+eOvX9rSi4K9htpn
         mRO7Mhoa+ooFuNJTChqwKuBIwHrJCtZBBviWkFAtAMLDfnK7TQoiG3jsdAiwncJj7JU4
         urtpOJ9MkuJs/CFB9L4qoQ4yfX4Bw2Bj3Ybj4iu49jfs9kU+kw6gxSCu4VCBzr35Hb9G
         EuGczJQubBe8e/e4ZYjHragBL+GPosjIpa6+6Bi8kck39AJHh4CVuGcwxqIEbIegtL4B
         1ABw==
X-Gm-Message-State: AOJu0Yzen3FzebOhBLIl7hKg5ujJ4rsleFOHYOzZ6wt34dKWtHda/EYE
	oopfUf/OX+wErdfj65tWgTYRwg7TxVzfqmy4AD48DnBJSnW53NE9PrHZ
X-Gm-Gg: ASbGncuSr08Vz1HIbxmtWZ0WBwH+zIzvqe8LW7ukvNC2zxwpFGXJ0zs2vu7xW349EIM
	fKgwFSLaeWL8a05BbXHz5wWwXc0qToK8PZKLQ3fgyUBq/p7kpqq7vOQb90dO/agy92mZUMaS7Ir
	kRSWEUCKSo2sFZ6H5nreCBPxfs6UkOp4lcj3UF4KR3ZygmFVVSOt8Uk4QSdfchELZGlHFEa8+qM
	il3qnetsYiKj26HCIFLDz8DATWiJUB33MoRhZb27YgPCKyAdMbm5oirqSW5KxZAppqHPGXTI4te
	gUD06SffVo60oOO2KV5W/RMmzmZMeh2hOup8avPbVghCqTqM02yPo4LjBDFm58yxhcu67j5GsBe
	Jxlf7YWbk94TUiThRoTXAfCLCrxYf7QsrMD3X7dX6ri5It05i+aOEXLcmdG1bnKA35Y+Lv53GDc
	Ml++8bElxReuqUNU9Dg5wcXuJypgffl0Z1yfDpG/R5Og+wTxIKieGBQTNIj21lPkrOOVnFquwkt
	6LC8OgAmSxoRGDj9Ax+NSwdki7+/T9TDAoJcWYxkTyRPqfrhO8KM0w=
X-Google-Smtp-Source: AGHT+IELfcxDjkTjHjE9o1zeO9QJOYdqpFiv0rmTaYc64N3Xo1j3VaCkx7ujy498PmB8+3B+SyLiqw==
X-Received: by 2002:a17:902:e948:b0:298:2e7a:3c47 with SMTP id d9443c01a7336-2984ee01fb9mr30708195ad.42.1762946292125;
        Wed, 12 Nov 2025 03:18:12 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:18:11 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:51 +1000
Subject: [PATCH v5 05/11] mfd: macsmc: Add new __SMC_KEY macro
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-5-728e4b91fe81@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6q93RqE2TlCEUP2NwG3riu6HujLsBQ7xoREhizw4YE8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUejzpjy/vkkvernsg0f1VocNBsYcmoPfGGcYNvqp
 94524SxYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNXqRgz//d6GbizPvxkYE//8vkPl+4R5pvWLTsfJFmx87tjWwd0lx8jQpZzsKay
 ZNaeq6ohQs4Oau4P32Xf26tccFrxZZXi3cwY7AA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

When using the _SMC_KEY macro in switch/case statements, GCC 15.2.1 errors
out with 'case label does not reduce to an integer constant'. Introduce
a new __SMC_KEY macro that can be used instead.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/linux/mfd/macsmc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/macsmc.h b/include/linux/mfd/macsmc.h
index 6b13f01a8592..f6f80c33b5cf 100644
--- a/include/linux/mfd/macsmc.h
+++ b/include/linux/mfd/macsmc.h
@@ -41,6 +41,7 @@ typedef u32 smc_key;
  */
 #define SMC_KEY(s) (smc_key)(_SMC_KEY(#s))
 #define _SMC_KEY(s) (((s)[0] << 24) | ((s)[1] << 16) | ((s)[2] << 8) | (s)[3])
+#define __SMC_KEY(a, b, c, d) (((u32)(a) << 24) | ((u32)(b) << 16) | ((u32)(c) << 8) | ((u32)(d)))
 
 #define APPLE_SMC_READABLE BIT(7)
 #define APPLE_SMC_WRITABLE BIT(6)

-- 
2.51.2

