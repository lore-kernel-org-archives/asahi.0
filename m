Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FB7B672
	for <asahi@lists.linux.dev>; Sat, 15 Feb 2025 00:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739577926; cv=none; b=Vxqxmg0KigL7hrYNFWbj6NHF05puy6gRKuLaRf3SoAwJjZVa4Kkm8EL1BluRApmoR7Hn2a8x5cCbG2CDZcCVbGmrklPV2ZmGOFRxaZfJgQcVU4lOm3Bpmia0xzRkeOZVl8bg4l26XxxpEop/pBY5DsCamKlnuYHk/KSmCbShlDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739577926; c=relaxed/simple;
	bh=PgPFLwwP8g98bJUED+moaf3Y8c9mYSFzQVbyN/AZze4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EMpvBLnhlooNK3WXWIkQznsexoKdY6XW5o1NgXU3GEbB2N+IBK+savGXs7krt18zZGkKbxdPwphJ95Vqe7E2vAmVe7iTTMRF+G0UfBA2byKuIdWUJ4/lePcUAMTRMLMR0Ihv+mn1cOkzqa25rkTYsjMTcZwPviy9wc1leP6Ji00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BE4DT/4A; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BE4DT/4A"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-220bff984a0so46107045ad.3
        for <asahi@lists.linux.dev>; Fri, 14 Feb 2025 16:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739577924; x=1740182724; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPAvKhgJ+unXUmEQvWMbvYBDHLwzjFI865XBH7Bpkw0=;
        b=BE4DT/4AYqOsFJ8+sPpH+XdZfSYviH0I3oKU0pIQGDskMBpMNHLKoWSOXMDuGpkFPH
         iq5ilm4cmUhA7+auReKg1VTGIOFVdPg+W+R0b93P+ZuS2FhPRHFVWh703W7DDrqlekKG
         7y875C1CdmNv7OGj7sui+/e9wGGH5/DaJmIMp24IT+ercZiAvODYj+fBzQLrgdnNaWow
         fDPnSUNnAeUl/hCZZZxEgDphs0JjVXbGHoop2S0/R9JDdZr+Lvs/D2iVHZi/gWdX1xr6
         M7RLUW4dJV90FM6C1C+cPIp8jdBrii0G1WkBu3cb6Yqw9fkDXkzO5h0ofZYYk3k0XbHC
         BmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739577924; x=1740182724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GPAvKhgJ+unXUmEQvWMbvYBDHLwzjFI865XBH7Bpkw0=;
        b=CjC1Uy9NgVb1dtoxjS4S28SBjlwa7+DUp5ucnpx/YdQWocYiMBTu5bWJljPFWEFRHk
         goHB2FRe7/cHV66pM6d87V4IYt8VzG2RzSL5hk8uo/P+TM0+0mNiD0XSe0yK0xLCfXC8
         54NAAErbuT7HB7nna/hDhOdBe1HN5pap6Mr+sJilYu0q2O2qev/e1mVNEaVuPUJWR4+f
         SKeVoaAHVd8XxjHf7KSTWjFpNtfuq+HAtZde5mWuV3bphP8Dh1PbmWefDPDJ1f0cuWAx
         NJzwnABGyv6KS9DaJNkvVL3ROWXhA1IC3G3sEs+VMHxEZYLkUfOvLYyDNJ3nkJnHf8FO
         WbWw==
X-Forwarded-Encrypted: i=1; AJvYcCVgu8iwUIVvEFEFAQXYPbqEG5WkPZW/Lm0jEJ5gPE8SiaAiYEiWeeYZTfITHjyFzvvbKOf+BQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2RUipJsubeXPeGHS42wSl+IY1C2DSSJ3qws1gSjMcOXvEIVzi
	wedxtKCKfsQHFG6LXerMsN8e3ovhuhrvbAHBhwLMQwX28QmMCOfY
X-Gm-Gg: ASbGncuHjRzSxuQj8PU9KeHUpO/gn+gBVsRtrqaDwKwyD13jwiwsuK2cDw2bMxKip41
	m8Luxyn4Zi3pa2n2VT8vF89TS//DjiqQYYSSRGSCaTUELWa00FLljDJR6nqMg6PoalbG3ipmXt3
	9jQsjwIzd+b7moff7i0nGI/qOTZjLavIcP6QlDT68jbukQiH+AeNN+BUJ8u5F2VjG+9sQD6maT+
	YCufv58LjQbve2yzrNLRGCWYwcr0+Vq1nZ8TP9RPMnII3ItnQZM0U40LaV//4R+QGHmXgdyKz3q
	SgIpbUWET3L4YBl/tg7CTgVRCw8qGfq5oCFj+v1KS1EvQBQ8ala27Kmp5sKaJlUrmh+A9b6vpzq
	VRkwibXBuqg==
X-Google-Smtp-Source: AGHT+IE2U5MfC5cyLipBN6ucmrk0jb7ckRvkKlZt2Xu8sC+b1Rf5rhMYgR2LfKt6UQ8SB3C9VHTyMw==
X-Received: by 2002:a17:903:230f:b0:220:efc8:60b1 with SMTP id d9443c01a7336-221040a9a41mr17749045ad.39.1739577924131;
        Fri, 14 Feb 2025 16:05:24 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220f26ea127sm15071155ad.96.2025.02.14.16.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 16:05:23 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 15 Feb 2025 10:02:52 +1000
Subject: [PATCH 19/27] ASoC: tas2764: Fix power control mask
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250215-apple-codec-changes-v1-19-723569b21b19@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=760;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=D+chifTYrDMRWra/nhQ1ySkrrKfrOuvxSuOgUrZtH+M=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnrb26/M7t88aVFTBWv8u7+E7/A6S+z6XzCUuvUTR8tt
 65lYr+m3FHKwiDGxSArpsiyoUnIY7YR281+kcq9MHNYmUCGMHBxCsBECg0Y/lntnvflUwy72oGD
 57dILDv8SWG2pMq6o8vZmOJXsv5Z8SuF4a/ExblF+tKJV2TiP31lq6i/NeVbps257ik73786vc1
 37TwmAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.h b/sound/soc/codecs/tas2764.h
index dbe3f7fa90187919b017eb2d59a67cfffc222735..786d81eb5b1e71bad094ef94e4b56e8f7c910285 100644
--- a/sound/soc/codecs/tas2764.h
+++ b/sound/soc/codecs/tas2764.h
@@ -25,7 +25,7 @@
 
 /* Power Control */
 #define TAS2764_PWR_CTRL		TAS2764_REG(0X0, 0x02)
-#define TAS2764_PWR_CTRL_MASK		GENMASK(1, 0)
+#define TAS2764_PWR_CTRL_MASK		GENMASK(2, 0)
 #define TAS2764_PWR_CTRL_ACTIVE		0x0
 #define TAS2764_PWR_CTRL_MUTE		BIT(0)
 #define TAS2764_PWR_CTRL_SHUTDOWN	BIT(1)

-- 
2.48.1

