Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023DB3D47CE
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454562; cv=none; b=urDRtgXksEQ5qyKv8CDybb1ctyy70TeyeC2fckhbNYNRxW/X+jckngtFT8XziN+/JninE/4KhH2Rxwe2P9OfH6xWqY48iJeSnLqO5e02CMoVRa0nEuGaFH1oKFshp15LVtVlSpqNVDmiyZNRmHKqxopTfk7AkFSwgaa8nB5jIs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454562; c=relaxed/simple;
	bh=30u1yCFnqEUYv19yUdILx4u/FILeLQHTLXJbU/H9wec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hx/vVNLj6Mvgo1jDFqpJ3sBnzggoJy7Lmro5uorYZ15t7KEgJQ+jSph54JdUyj6viJb3JJ/9XC/tQH7QsfufvQBLUIIgwyfdOJ0k6WFigR0o+sLreQYON9Wrtsnj3PnOJcGQet8CYIBKRwJ/dfpx3PHM3tIy8YN/MH/8ePoMd6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8aCSAVe; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8aCSAVe"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37de961d1bfso596993a91.0
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454560; x=1783059360; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rD+jveY6wp1Qp2f/2vAi8iv6onv3PbIlpebXHAxGHGw=;
        b=T8aCSAVeFaTNTVe1rgcKWGfUpKi8elwW2roQKvuImAPdJO8kWzhu+GWykTJbMLuT4P
         xzW/E1x61xYlUaMjkJiluxPpzGDk/cZxCLEOAoHzBiRAWfZFMdbUlhsWk4KNwml/A/VF
         uVSPnDEkzXc0uhACSRE2onyAPrVxX9yYR65jDy6kSVq3CTUlHKv4DDjhV0Kd0v/PUPLY
         sJVEOJpY0V0MCd51dcbFLGDdPWf9GTmre3f18X8zFp0/TpxVTV+3tiSh/tQ2qPP8P3X3
         ViQjbWTqobofaC6xi/5IR4IUNw45IZ5hqV5DMwEBFIn+xzR63FaaumL8bU8GOGx4XtKv
         08bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454560; x=1783059360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rD+jveY6wp1Qp2f/2vAi8iv6onv3PbIlpebXHAxGHGw=;
        b=nQPZ1lwhrSmEsMi6QsIhghu0M1AktOJXHCkSNG2zdNmpLWAnBPhEljn7K6+SIRZdnY
         +VVMnodPE66bL3TPcIzwWna8sEHNP0A7XKdOsIa8yIClwtkiIOFkedILgx+T95ixN3cE
         U1wyZsxRbbV95JgPhe3H2xDnK6Tg3dnr4v/JWZy0yH2Lof1P8uFo5eCdsZEsQfXSPme3
         29tQilx8As1tye5khBdRKd4zaa1e1i0fs3AKTk5WDf8jQxWL/jfu/x+RSAHwizONeVvX
         9QFEPuEXC9rcELx6uVHk7LlLQBZUbRxqQ70D1NrEp5IyrITdREydRzL8aY2uoDF8cSCh
         NUQw==
X-Forwarded-Encrypted: i=1; AHgh+RpSg1v/kWEDfsczBWmHNTGbpCJOdNJFhKCx/iGABPuYtlT/nMtV7d+CVbb5Of7Bdjt7IIjYnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwiHM4+M5lBl9dnziZC+Embv7nSTVuOUElCjZKsXGjE250Q9tCK
	Ul5zSW+Q50VPasgFSK19LKw00eNzq6T2+aMUsf4giMMiZtryWZSlkymF
X-Gm-Gg: AfdE7clHjy6I7GBlEzcZRpaC/AAAyhbeI+vu4tNj04+RK/IiYLfExFoylxayaudCmqP
	7PrbbhyVUpL0x7/QY1TO96knYVXJP48DEPRbXlT1FleY3TRW2Xw5Xm/LU0fWwcRr6EKcwYbfdjk
	nMukBexvFaPDawQ53fhqoiX9X2Jf925Xl6Ar+BgnHzKEadxgHRzrddvNA5TdMTtlspU4ujnpNMW
	SUdypuTDH++vxYPxtpGdMKo+l8XgrYkfS46P9XuqRyz+8xFDXO+RaqhDYDA1eFJF2fc6T3hTgkL
	/CaIQVpXvAwA/A9dgImUwCaClz7+NI1dkPU1iaD0JChwmBmImSCm3ckoRgUyyww7ntMnt+kaVcS
	Plqz0a6IEUnxcLM2A8feDKloKky/yYTC1I8IqZLrwRn0xeT+WktJ8jYJhugcCVobOGbp9hOhH5T
	6NW5dVRO2U7SXqoBSceIixPVb3JXPWLkftSlU8az8fp7qKgnM=
X-Received: by 2002:a17:90b:3c05:b0:36d:df4f:ab2 with SMTP id 98e67ed59e1d1-37dfa250f2dmr5532632a91.13.1782454560385;
        Thu, 25 Jun 2026 23:16:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:00 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 18/24] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:23 +0700
Message-ID: <20260626061329.23264-19-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260626061329.23264-1-phucduc.bui@gmail.com>
References: <20260626061329.23264-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l15.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..2f30dd834709 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1285,9 +1286,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1317,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0

