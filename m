Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1858E13CA93
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577912; cv=none; b=JVTnJc/eQ6BoEuZUfqW2NdET9/yOFIy7qkrVTQ6sqXWzdNhz4NhG8O5SQ0pQQQHK1Z0C2rlybcW1pVXF1Fuz8KH5QTODhAjpWCCROxxu2xJe2/pQNTgkgmI1wv6u1vgWD64KEogUBvyWJbNdXeiEHXxaroRzuctojv5GiABfDBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577912; c=relaxed/simple;
	bh=qrdHDdumFDDqJ0SZZmbMmJtJOOOmuZKYoWQGrKWzy8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qdW32wFqpYJminMkOFHl2BaKFixgEFYE1VZeP103aAHB5EfK+Q/wChCJmEvYyZVQmRJ6jU6ULxwdSkky6II6iQwK3UGC98vsoD0fyrht+GBG3DQPG4eXZTyTK12OP9lo5sOpc6Rml3fDRAh9iZVM151kjIdJcb2uQmu4xycCaMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOOjleBx; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOOjleBx"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f44e7eae4so50783695ad.2
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577910; x=1740182710; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zg/yh1Q3W91JaRTRaWlghJ3PTeHHtFr4YAjiGtG2cm0=;
        b=bOOjleBxE6/+PMR5+U+5iJbsGXorBUhxSpSHpewan5lD6u6rmmUtrvkkj2WBCI3eSr
         Rl2cLHm89kXnteul6w685Z/V/27nfkQuKYp8ftae3gRa/6qavcm4dGqfU7dOGrD//Yh2
         xDCy0UhLNsV7XRTxdMoQzpi7VVFjEEhEQRFVs7n1siGZiIHc8f0NWa5OkkOU26HAkNJe
         Jh3KOHcASCOmHa8jkoKUxKfj1kcyoS6hkfhCIM3lFukpdD77mk7fjD3p/SDQzvaKUaBD
         Dean5iDsLYsylRQ9Gz5NEJQ/7/W2R0SbGM2hAMr3UAjoOM02MaQlEDhkMeBsBR1KcHiG
         eaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577910; x=1740182710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zg/yh1Q3W91JaRTRaWlghJ3PTeHHtFr4YAjiGtG2cm0=;
        b=ewq3dOdXWSLnbMCqjKd78sytfhCpzfFkvOyyW0mo5WJYhBBorK/yWR2O96Z6ATQepE
         4cMugvMlY8iA8ORfhTMKRziw9eCwtB44MKpzN88qtohWTe6WKXjVAsaeU4alLcfAaZQu
         aGYkwPd2fL0HRy2Xl5H9fo1rNH5ghay2lDnPm8RBHech1c4qR6bRv3BzKzG3Rh743wRm
         XBNtKGcNsnHTiI0Z38p6HX4KCpEORUEdtoP2Xydnth8RGopDm2xRJCoMERibAbUZYlNO
         lKe3Xf/xrI+GSRdiX6likZhWPEX/Ik2fSEvCFvgBPZmf/IWiNSf2y2HbiB137CXZgR0X
         5iVw==
X-Forwarded-Encrypted: i=1; AJvYcCXyGkLRQDMssZvqgyVZbur6SbMMEik3gFiTVzbSYZ7tKdPMgvl5H3+rOmUbX0VDBunQfquQPw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3cS6Z7eIi8D2+bmJyV1uA0QUAXZiPHBxkTi+Efg8gSnuj7J1k
	RQYq7N/C3mAUYgv61AU5GTOwoPMjydiyp7KcZf5N/EjRM/BgD1sE
X-Gm-Gg: ASbGncvIFBn/XYVOU1YW+yf4afs/yQSAovUudajl3HANWOkG8pB+YZnzgzXAaNflEoS
	CS/2t2Lr6xQwRY0H4Wwsb7jepK5CXxzyzdiplAAp7P3O2PTWSUaFHF1L6BP7WCYQhpsXSdlXY8x
	xDh5aNAniqwFO6wo6Y0g6ojJWR8GxpiykIrPOLQeXGIlgT/XPR6mxSHAavFCPdvhewkWYcANAUG
	FBLxeFyfRD+MiZpnmfoGDKEgGuf5/8ug1Ly/k+vwqOtSbmJIJ5J4LFIk4TEwoTADWxb28uUbKCx
	4rGeloiS3z6gsoj6zP3uocyW+dfLddujUC8k8Hf8Gac70sgmEme9g2FtA1YEhRwV8ezEGC1D6wc
	htwejIDTv/Q==
X-Google-Smtp-Source: AGHT+IHrsigKT7LpWl1KQKXia7FZvx3q49hOJoUjF+arH5gfvsW87Gu5wSgR1gXBYRimubCS+5z4yA==
X-Received: by 2002:a17:903:28f:b0:21f:85af:4bbf with SMTP id d9443c01a7336-22103f0d484mr15162445ad.20.1739577910471;
        Fri, 14 Feb 2025 16:05:10 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:05:09 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:50 +1000
Subject: [PATCH 17/27] ASoC: tas2764: Add reg defaults for
 TAS2764_INT_CLK_CFG
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-apple-codec-changes-v1-17-723569b21b19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=715;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=z8NB5K9sZ3BbykPadxZ0GdwwAkJwiu32NmFXGmJTVY4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb27nchNijTT658Qhkvibd2pFhji7Y8Ck1RHf/xf/T
 s3S5fnYUcrCIMbFICumyLKhSchjthHbzX6Ryr0wc1iZQIYwcHEKwEQeSDAyNDoKHd//OXi91b17
 d3dc5e5SK9bhFVY2kNKLPe9m7lD2neF/QdSpwuuetwLv5HlNNZVqdYxsbb7c8viwmdKbZM0F3D+
 4AQ==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index d1eb8ee30415e335adf8e14d14aaa207c949ddcb..f8cf64c1777ad34fa7a42ca5316ffb980c63be29 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -799,6 +799,7 @@ static const struct reg_default tas2764_reg_defaults[] = {
 	{ TAS2764_TDM_CFG2, 0x0a },
 	{ TAS2764_TDM_CFG3, 0x10 },
 	{ TAS2764_TDM_CFG5, 0x42 },
+	{ TAS2764_INT_CLK_CFG, 0x19 },
 };
 
 static const struct regmap_range_cfg tas2764_regmap_ranges[] = {

-- 
2.48.1

