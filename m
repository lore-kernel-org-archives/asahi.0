Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763922D9EE7
	for <asahi@lists.linux.dev>; Tue,  7 Oct 2025 11:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835880; cv=none; b=plo/YlFco5Ms2qMnAo/JrhVIx6tLyKZUymA20TVuDr5aYJYrLXFKTpO0HkzXImCvok7LGz5WLiD+/n75ONhGi178dqFHwrWJU18zHf3djB2g1azQwJU9CK8y1WJDxzXmPs6yG+opyj2uxKitkN9f8D9PqJ0J2ZnnZiwhwWpx8Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835880; c=relaxed/simple;
	bh=DV+93RqA20zYsiZVil2ilvoMWgypauFCp2tp4wJbtLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iMPGDOz6Hy5p1PB2gGCPL0riTwSaYA6IqeRy+biBBN6XDjuQjsPqfXvT0lHm2RdrPJMxn51B1+MWvTJgqUIGig2wpcEhec0qsD/HRjML46befMh2C7+dRo3H/yx/OZO6nwExRaB+phOYhqi4kIuaIslzYteuu+1Dr0vU6Rgo9Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RF4b+SqM; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RF4b+SqM"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b554bb615dcso4530215a12.1
        for <asahi@lists.linux.dev>; Tue, 07 Oct 2025 04:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835877; x=1760440677; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=;
        b=RF4b+SqMsra89Dn6+SdYVJIcFBiJEmCYp7gpFEo06p0gysLX9gO+iuUu1xDcV7dMVb
         7C2oGHwC51IhPIrD7N8AP+jyIl3+8qZ2wj+LAlWEvJScwqDJaY+SGXtxo49p8tVVXzfV
         n2wz4bGc6tgtO7bqgQXsrMuh0Fzn/xEiJRNzO4Ec+23Tz492SaN9Oqa+Lx6j/UMb/zgZ
         zF+nJIDiGggDbVeJhpEBHG3wXA0EUcG1cF15TCEkbJ4zrc5Qpn4Rp05BWJw7iXCXu+bt
         K07ZTYb71d648I2AHsJsg0M7vcb7jZSNYzPXZAPzES8pUf5d92MoL3qgccktkHz3ALr0
         AUrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835877; x=1760440677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg5EzbqpAhrvR1YouHoLR93Qim7L8FFl5LtkM7LFT7g=;
        b=eYlZrNdeTsj6HT+qVCzkYIP+kEx7w4vDkBDOceF0yxB68QWudDatK6A/ZXSG47Hxzo
         0TRJ+FcX3KqLJCiV17tE0u4+byK1Oql1/BO033BSy8+YGCoQzsRMUyfyFI3A60sY0cip
         1PRuDkcCqE2irzHpdpQqP8oiSkkfajraf2h8oUsKfosQO8ucp25/t2FZGQR0fhEdAhlY
         FeDWMCiSXVFBYiTS1VVhGdNq79VIOy/UNZGluue2O4GgjVJwoNrRFQN4VGBt9MXG9KNq
         RIXWSBzffYRnRgIp9uHPsqR1WPPsYFfuiSFOJ/GZoLoRKDauGQdgUbRM2yV3FWb4/ETV
         qeDA==
X-Gm-Message-State: AOJu0YxbT2L7NgCBRnhHxVypviLGd10BJtuFBoPUrt5J3ocirDmMISMT
	Bd78AcssaUMvqZWNc24ChoobMr8lujq73azwnQ6MwQe0HFpLyouAPvg8mwZL2EP6
X-Gm-Gg: ASbGncuR0HT/BAAyYeph9MggMdPLt6aOWovptIh5tTNXycU7lcjqw7nVgOQnThCRAZ1
	kuh8BX8tR5FFhIYEqdgUBonEoq0tZt9RTEUBHE9CQKk1J7vl1RMJsPLAXcCARhzcvQg6aEWYDrh
	PsESnBCoV0iMHjI+AebOVnP3wuBm8pERMC54PRdJg+rhYYV7Bquz2VRTfQDdEEoXFeMLOlaF4VS
	t5nLjhu1BtpqTZHiQsKReIoGrMdSy/TRxj9De2m+0TCjKO94NN0ytVIWPRB9P8UJgUEBSYcmmDz
	kn2x1Wa5kK75pwfXTQpyDP7sKugl8wZiQVjGjxUUtYOOvyFUHtUwOjRAgcrXwFSJhdkTCVIAP68
	OpIaOTfpEvLLVFbzZrrNKMknE96xhzr5kZ9SGnfzk5tO+7OHH42JuPhQdZmn0HfjsE4cRImm0Db
	oypqML2BpjCzn/2L8sd2NlOZlQdb95YcwWeNB0bsR0aA==
X-Google-Smtp-Source: AGHT+IFRXYX/j0MXYIPWCiTWR10pwTbuC3G1F7eZBn2sHdq/jwsyEH4FFhVQSAeDU8eQ2ogOkSv1Jw==
X-Received: by 2002:a17:903:1103:b0:262:661d:eb1d with SMTP id d9443c01a7336-28e9a5cdcf2mr198695115ad.1.1759835876672;
        Tue, 07 Oct 2025 04:17:56 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:56 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:46 +1000
Subject: [PATCH v3 05/13] mfd: macsmc: add new __SMC_KEY macro
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-5-d7d3bfd7ae02@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DV+93RqA20zYsiZVil2ilvoMWgypauFCp2tp4wJbtLo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm3tcZkTMG3aVOZXVXxrFpwS+56WuPRU0ayerHnnf
 S/v287m11HKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBEwl0ZGf6qs+5+wnVo5xOL
 A7YzpstdY3508FK26vvLGpci7afbLF/P8D982frPV3QKvQ49zZfh5tEvMbh03DUz4Z/8M4mWRZv
 2XOEFAA==
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
2.51.0

