Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C25C567D
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577891; cv=none; b=r+hGSpXqTKTuD39fUpGxI1UaBd1nGWYSSIQZGv48G/nfwjX+KlZFz87Ew/KUw2EfPaFj+0L/vUoors5Yf4nJ6pH0yH3tzk+pCEBp+laC6E5/WYoYV+rl0nhEc7nxwfp1nbPHgB+3PcGK1Oh1hMQqzuCKEuM30XcE31md8uFgeWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577891; c=relaxed/simple;
	bh=GEjShVsU6DYYV8fd1pZBUBYtNvYtHElztF/5Q8Jkp2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RZM3boY490cUVo+JAAZE03ldHnV29knO/yV1N/k/KFtIWvZMQvGtE6OoUTZTzN1LJ7LR818a/QBjV3jBH6G6roBI8kWzDFf1dK/iWOqXUK71oagEJMV+rBDiGvMfPBOOuaUs3pfuvOgc/zDGHjJaZZvXPdtR9W20AFQPbn/XfN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxCvhxCE; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxCvhxCE"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22100006bc8so12068145ad.0
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577890; x=1740182690; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzvCcM8dqvEuWNOieqFdaI3hJmC0KYxoNPBN84yDZV8=;
        b=CxCvhxCEtZc3t3tMJD21cdCzOj7HpIawVXjBIn+NyRsv6IOuQSWS7xkJ8GsOylha3c
         KJMFhLee6jk8hsG/z8FEIZE0Hhm1tIe+Wz3MXUtuRIwmzy6KKROw6eRoyvfrzyMRIWk5
         3runGuIx4Yvs2AIIAmIWXA27tfGBtVOm2DHKh5A5OkLhaVTfSPulc1U/5UU9aOhiFruw
         7VByNscKJWc1Ll3wgKVz9cGExhjXO4zLAHMgDzW44h99/pMXlI97joJ+kIYHoq6d++1m
         jLDoNmBoq+T4fw52aQJecwBVkHZS7O1QDmVbSoGZcjMhKhWCKzIDhoF1zu/+n8oSvl9/
         iWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577890; x=1740182690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzvCcM8dqvEuWNOieqFdaI3hJmC0KYxoNPBN84yDZV8=;
        b=CIySu8r8tRgO71hLMPT4dIRpzfKaMQgs5dgqNdW5vpDPzx6pw6v7mlKnKQ2k13q9SE
         Xo0l08zI+6b955FDUwwqwHHTwqC0e3lfRgZ5p5Q3LUdxXw/Tqzw1GbLniUkaLrqN95/+
         Vw9LZa8W5mqI/pNtbp765e3ya4oEYHR+PG/COWQO3yeePxAUrWFVzHuR/gxB0QHneTD6
         V+l/041sLbnn2WxGdbDnQ+kvchFOctIPMiGegvIVIUsURkssEvEBOolSME5vMVyAKhfV
         AowaR4wC/yMW9Fik/PhyCLvjlj90md87Vvqxw4PLABQdExY+JI8uTzApHsQ/FPnvUrCR
         AUww==
X-Forwarded-Encrypted: i=1; AJvYcCVmiCqelY6INcrDFjI9ktt9VC4ZkA+yP9OYKFZE92Cs6Ak3xJ7BbJ/9iH/wyUYE+P4vYAXTcA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyV9H344iFa9VmdzabUoDFjknGBUzdjKDaM46RkyGMTG1KQb00b
	T44MZvMBw3lGKSe2hsIlgLLLeYNArPuOsBvzRZRZ6ukawDZlqpA8
X-Gm-Gg: ASbGnctSq0ZviXJ1L0SgjAug0u8fMXY+UT81rk6RSUmq/FLWd49b7xzehXxyprytcPn
	RbaGgIXvmYCLd+QGIlRpOrYJ5PQ6RlkHvmogC4tHQjXVZ2OVkCPPqL0mTOL/eM0K/YTFc5IJQuz
	M7fpUxDUR5Zb0LuD7K1LxBn5wUPHG121TCB0xdNhF7RWB7+XOHSNey4BmiJbbI81aa857zB59Kx
	uwhnB+xvZ5lOlhPpTzrKt/cWIx+1+2SuWtWP2owf9dPVAomvmzT5++jqXGdFvCJpkjPh/KqicNQ
	6HWn/U/y4zdmxcz4VGsvZ9xQm2vkAH7ybIh8B+MfsKyShqJYtcVrx+XxpuJCWMpttzZjA7U19wV
	twjZso1TA3w==
X-Google-Smtp-Source: AGHT+IHO3Y92kWYCbxnw51YFmW4Ac9MQWalph3Phy48CYG6q0zWxXYVjG3+VpTBbvTYtaNs+Fi0OFw==
X-Received: by 2002:a17:902:e886:b0:21f:9c48:254b with SMTP id d9443c01a7336-22104063669mr21120125ad.24.1739577889867;
        Fri, 14 Feb 2025 16:04:49 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:04:49 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:47 +1000
Subject: [PATCH 14/27] ASoC: tas2764: Enable main IRQs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-apple-codec-changes-v1-14-723569b21b19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=823;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Yxab0QgYOU8S1cSF0st1NOwChnBkX/tdCsvBiQAenu0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb26T0BZ6dqI0pElib/Fx+diFRetU4zz+L5rLmtdnv
 +ZUP49PRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABO5c5fhD+eCYHX92F+2yhsr
 Ndv2Z94UF74aepB9rWGghVFzjK1BE8P/5LRA7v3bN/W3HAr315lRt0Rau2O2osxd+WVSBS/PqsS
 zAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 439e5bbd372cd467966ac9cac1c92e3e300fed54..75e49c85861b1eb6b312e8a455dadbbc7f54c836 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -660,7 +660,7 @@ static int tas2764_codec_probe(struct snd_soc_component *component)
 	regmap_reinit_cache(tas2764->regmap, &tas2764_i2c_regmap);
 
 	if (tas2764->irq) {
-		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0xff);
+		ret = snd_soc_component_write(tas2764->component, TAS2764_INT_MASK0, 0x00);
 		if (ret < 0)
 			return ret;
 

-- 
2.48.1

