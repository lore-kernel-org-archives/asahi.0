Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2C722D4E6
	for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 08:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739867920; cv=none; b=sd3J9zZdOssI4vHA+gcLV3v2k6TAhk90iePCdYZvrx3uRLydCTx5nfqhsmjDU8lyShrfaGL5A0jtJLkbWLMvUK3d/QaSi6CwnjKALrvxg5LcImzKhruOH27KSWuo5UAH1Ngl6zCx4oUPzHIR4d2CaL1G5UBbsXj8dYiE1MxD4e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739867920; c=relaxed/simple;
	bh=kJTFUNaJvHb40kFLT4FXflK4GFWczcgIpzfS/OJgv8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hztCOvReWVdX8zacwHlO6v5e/lDvtZgyPiSp2kQTre195qPQKJUb3QR5SE0Y8WwFXCPXDktao2a8xkFVN3f8jILN51Cl27In69IaZrznwRFQ7ICYn7Gh47BbTzSqySrIYZyYm1eoBTo0AOXRlx0WapcmQsQjZWU7L3kceNhqQc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bnuPHlD4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bnuPHlD4"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220e6028214so85496195ad.0
        for <asahi@lists.linux.dev>; Tue, 18 Feb 2025 00:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739867918; x=1740472718; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/0xnSZoULp+tJndSbsnTe4b8bjzfxIgtXuAx9KCZHhY=;
        b=bnuPHlD4XnB+oeiU6ASdmHAodcDsWY/yQM7/CQ7F5qtSgS1jC3O8EE12+R3WpAp3UH
         8m4LL/ka7y30wmqTirhcgTL89+inp0xlqHExWTgi5wbDJ9N5ljKk9kgqUIEiAZz9LAdm
         /A8Xjr4EmMXn6JBgba7mlD8PlWWFNrfbPkX4pmz869jrxBbKyxO+t95WcVYMz5Cjovz2
         KVwzV1zaeevsZ/IRSSKkC29sWFNWEZokj/SJCeq2N33ip16VPFdZbk++v8tgGKhRRV2f
         BibBi+VBwlVDXl2iUXmxcA1dnLYdJHkvmlUD4bdYoZo500jVPw6emn4u+xF3t6X2rwHG
         13fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739867918; x=1740472718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/0xnSZoULp+tJndSbsnTe4b8bjzfxIgtXuAx9KCZHhY=;
        b=f7hhlODzrhDEj8HIrA6MKkNKtedKYfA3jJUePQ8ScLV1GyoyhGgkzhIwzE1aSuaoXc
         nwp1ZJ/jXe6F8TxDwZOwyLM+xK9/C70U+kfj+PHtI5UPqYT698U96gc2JNWhSQ/Kn2ME
         jMJ2IzKE38ChLBscvt7UdaJbhZzEbXvIjhxTxpgFxFW8QxpA2taffgSlKY+M5WU5O5nf
         hLbXSWsjZuvg27Pg9XeRbOLHPHivId6Uyuokc8D59e9WWsp64y9js6c4PBz7JcRKdRZ0
         7axOl8LuVr0p3h+BbXnXwZVpTUJKV5nxIvjW2vQ7pu7A0/EhRnFdBbPA1WHYmUGrUAAk
         3fkA==
X-Forwarded-Encrypted: i=1; AJvYcCUYVep3CEtROXndIryLZ8P8kXY1N6ZxAPus3DoJOqx3mgAUQ+4OJmFF4D5ZZ30ON60oWDbEaw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt34YdNdL6QD5sn18XWAi6TdGOvodrXjowiNClpYmYBTeFxeSc
	+gQN6yv/JW9io7DzXEvzOS8efcxAR0+wPj9DKcpugmoSvIByvb0e
X-Gm-Gg: ASbGncsFVAeGhZHWPAR0JrJ6ogZ6OMrdqygHVRI2Pg3IgZSluR5qPNbknCvBD+ZAO1P
	vUuE8xFyABIGkcQyjXR1qhxeMY8199fwAQDT/evfavh0iYW8GnikbNBpD0stIgXeWYqCzhhpQjq
	ps9SymK/m/kIQzvu8cmXqDjIU/7fAzQZIUtucnnsiW3014n3BHCoMPteRFeF4+57TMHBuZT+g0h
	4gtxwLGP8v8xXhko/3EkBeYDNHHkKmqkl8M9p7lTZLQpnnZ75iUadWviUymOJAtfQxjLAKeuv8m
	h/s10DxoAIk+nFeiaDnw/n5tcNwrcdQtEoFU/tZWFG0Wle7OLavzJq5iCvXuG36ycVfLgnJ4cfv
	ZtJj3bkeKSA==
X-Google-Smtp-Source: AGHT+IFDrRp31PJvU6mzhR2mwgz+DW/BV7o0dC65MC+BF3NgEj/m25LCivVIpTeTBYyEDntfFRI9SQ==
X-Received: by 2002:a05:6a00:198c:b0:730:4598:ddb5 with SMTP id d2e1a72fcca58-7326177622emr22154290b3a.2.1739867917918;
        Tue, 18 Feb 2025 00:38:37 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ae1ee4febb2sm787325a12.51.2025.02.18.00.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:38:37 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 18 Feb 2025 18:35:55 +1000
Subject: [PATCH v2 21/29] ASoC: tas2764: Add reg defaults for
 TAS2764_INT_CLK_CFG
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-apple-codec-changes-v2-21-932760fd7e07@gmail.com>
References: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
In-Reply-To: <20250218-apple-codec-changes-v2-0-932760fd7e07@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=757;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Mbk5j67i1cV333wWEgS3bKTpMGxWCx//aUmM6Ej9rq8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOlb3JJMf8fq7cwz1nK6eUmu6VR7o5J77lqlVbWOdYWX5
 j/WN+ruKGVhEONikBVTZNnQJOQx24jtZr9I5V6YOaxMIEMYuDgFYCKBtxj+SuuHbJB9sEzlnErE
 1s+yf1ZyaWwQ2+4v9ORAyLGKtMRdNxgZfu3W89T30+pyeHA91F3+pMOs36kr2JuNZPOYT0aLqnB
 xAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 5d89d47c1667c1067f88169575b7b76e9a25bda4..d316a369c43002e6a8a8160b85384b8824667bb1 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -855,6 +855,7 @@ static const struct reg_default tas2764_reg_defaults[] = {
 	{ TAS2764_TDM_CFG2, 0x0a },
 	{ TAS2764_TDM_CFG3, 0x10 },
 	{ TAS2764_TDM_CFG5, 0x42 },
+	{ TAS2764_INT_CLK_CFG, 0x19 },
 };
 
 static const struct regmap_range_cfg tas2764_regmap_ranges[] = {

-- 
2.48.1

