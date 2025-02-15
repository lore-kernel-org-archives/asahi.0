Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FF11624CA
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577864; cv=none; b=dATi2hsWOUh45VauYHB6ngsDLdwbe9T1nLVeHKzBTN9v+hJvmZH+kjm7IVj2hk0bcat29MIPSJWN/ONG5B6Gbc9biIpsoG8ABh+J4jfy4ByuasfXKvtMzkljZ3lqZYkSPlb/6JfEYisgDkMUp3BKYOnt6h5Wx72D9YKHBf4vTmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577864; c=relaxed/simple;
	bh=BrsmtKrvFG4a0pRLC8ZE/X1V1inlAR3fYFVsN8V+8RM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kX05ZshfYexlr3/yXQnPBud3Sm9Bi9WvnJ3gp7QZtoGOkPVrBmOuT32YjR/LCKMBvR5GDCDCoOzacShsT6BnTWKkd/e+FBRMIZQKqvzE1mbvqO355ffoBXB1zd5YxVixw29CPm1JiQYaFP45S85rixKBLxF6tXJlO3ZDfikOZhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwZ0ZpNL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwZ0ZpNL"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220c8cf98bbso52171975ad.1
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577862; x=1740182662; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ixZjGdAO8Dk62zg9tQbDbxW3/Bv3xplkaBFLbZEw6So=;
        b=mwZ0ZpNLRSL5w0ddKuJIlFX7Xh4MqETNYQfxJCeExmHVzprltODrqCqojHuktOSDOs
         CItmf2oyiMTX4fnfojCUJDeGLperKERUryTuLG6qFVCwPfCz1HMe6xfjVpcawK1fWLhf
         sei7ojhmhMP4XZQRstOUeSV//k4KYgz8DC1y1qLNFLeLm2kcuvrtwgKMR0DkmhYYaplo
         osrY5t419YRy37HEygaRqM/Po38DagOm3da+PK+XTiBQRNCRKkylfSDE2UxWHjA8SezV
         cJNLJfsnMdHNmn2Ju3ZHfAPoePJf5K/i+8JUer9eqv0f48HyPWZDNtydau3nIK/YJoP8
         QeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577862; x=1740182662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixZjGdAO8Dk62zg9tQbDbxW3/Bv3xplkaBFLbZEw6So=;
        b=tszSNamtRkvExPp50z+ZbPxcgelYZV11v+7H33UfevSKEnzusQP+pbSK3MnF85VVi9
         DZm2nYQaM9ZykgsRdsfU2EM/W5GvYxZkN4dbRqyucMgjPKKk5vMhsdRXwCM37pfpY7Fq
         UB4fvZBLMhM4nwlcQkm0XGWB0+p/oY3JqT9hUJ8ODZHppM0ERZZa54EhzTLgSS2dx937
         aDmoCPt2n0p0XC6RjP83/OUyZjqnIUx5PUzWLL3g9cRQbO50rkzYGxvB1+KBgUMAHA9o
         Et7/iIkiKB7J0g+4iPw/twRvs3UyRhanXRjgSsypPFoLoqKqEbFbqBH2aaV0DLcwOBJ1
         gtIA==
X-Forwarded-Encrypted: i=1; AJvYcCU45+hkjav5n9m/N5QpRk8k79mTbxxntKPjwiRb9jcuoyJGi0grUPQAgnzQaFdZasJANLvbPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRAv1G2pzWCoe2xKRS9CMu1K0Vl6caWAr62Zp/dF2+QPcp/rPE
	w+gqNsrStB6W7qlVvIl+xiNDWrx5H6sG5WX+MDdmCZLOQC55W5ry
X-Gm-Gg: ASbGncvf4TbQeajJ24Y07HQURmPLAZru7Eb4bV9g1i6TTjnxg5LsLW81pi4nR6eRJuw
	AsNLUw7ZaSZHVLu9Ah5BjX1TcXkuqYVRKc95nblTkiXi7L/rjBNVYjZ0elki0mNRuIynqFJfYeu
	An7nSrsSFG2HA3B18N4T8BUk4TqrOX+I3aodITOx6vpJki8UDx7eoFQl0AIvz1fbao4KBcZXmBp
	9uROrc4P0hqrlmLfE1L1eBM3Ip/zjfWlqFrEaN97nXDJsEJynv1FAfvaQcN2V1HFGig/v/DnlPb
	2Hn2gk3sdG+M+kDtXJQ6SBUGJuUT1XkZtpD106S1M7CkTRp0zy4sR70TSgfwMglkca9FgEgSeev
	1F5wf68XNbQ==
X-Google-Smtp-Source: AGHT+IFp1yZKld9F0Cpx76Y3+E+3whJ29wQruICe7YSErFWEjmY7MpEWjhpNNumZxM14egj0CnHZwQ==
X-Received: by 2002:a17:903:18b:b0:220:f1db:d96b with SMTP id d9443c01a7336-221040b134dmr17009285ad.41.1739577862428;
        Fri, 14 Feb 2025 16:04:22 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:04:22 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:43 +1000
Subject: [PATCH 10/27] ASoC: tas2764: Raise regmap range maximum
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250215-apple-codec-changes-v1-10-723569b21b19@gmail.com>
References: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
In-Reply-To: <20250215-apple-codec-changes-v1-0-723569b21b19@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Qdi6b++lP5KdcPGK1hbEg+oAmtT+Af+O6mSzIrCVfDE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb24r4Res13B/l37UuWpxS+cuA25v79taiw2ubD4yR
 dhAePGUjlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACZyZR3D/7CaisebP+xSVVz0
 p/7X5inzD647WJKY9CBP5EnWcqkMDzdGhi8mH45PyXvbqv7h/KOFZ1ReWH98nfvozZ2Kh3vO7nk
 U85cZAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 4923291e7a62bd33f0f8a934599c527033feb971..e32ac441cf3cfc8fd8c6a1839c68e84ac9347150 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -726,7 +726,7 @@ static const struct reg_default tas2764_reg_defaults[] = {
 static const struct regmap_range_cfg tas2764_regmap_ranges[] = {
 	{
 		.range_min = 0,
-		.range_max = 1 * 128,
+		.range_max = 0xffff,
 		.selector_reg = TAS2764_PAGE,
 		.selector_mask = 0xff,
 		.selector_shift = 0,
@@ -758,7 +758,7 @@ static const struct regmap_config tas2764_i2c_regmap = {
 	.cache_type = REGCACHE_RBTREE,
 	.ranges = tas2764_regmap_ranges,
 	.num_ranges = ARRAY_SIZE(tas2764_regmap_ranges),
-	.max_register = 1 * 128,
+	.max_register = 0xffff,
 };
 
 static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)

-- 
2.48.1

