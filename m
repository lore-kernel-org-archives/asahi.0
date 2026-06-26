Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991403D666A
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454587; cv=none; b=AtuadP09zVsbp4SvjiVFR10t3ngFlzF/UTzCXKvXwllTZNAbVoktzX770+sVD0/5fi3WBIRgY77R/zZd8qP8SydO8qjHQPworyuTgeOK07ESzZeQ/8HgjUifawtP1NN1XNXIPpWlRItIjesikAfyx8WPQ9r+PALzmE3UhOr7eLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454587; c=relaxed/simple;
	bh=w3jvLBlvAQpe6p5TRiEK5F7wPOafekRIEHEin4rETy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kdfKAad3g3r30uJAFXOPWkwUzHX/FXf/jA4vtfj26omhTjPFOdMd4vrB+T95iy/sJSix8yitUQy5TkoM4UtgPFXnMT6WI56ZoQ/9gojy3RnhWxkfr3LQxKhv72dBCWN0BdciSeZ7eL1z87cQI3ONKkIe6U+63FGGWwMaVSPhwbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=heJ2XCZh; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="heJ2XCZh"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-37cae998401so277560a91.0
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454586; x=1783059386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bAwcKFKT59MgIybmzJBQCtn8rBNm1HXg0BYQomquJmc=;
        b=heJ2XCZhzo84ZFwXMc9otL5wjZWglskFEOmaOBPZ0GKxexuNIE6pfa30UOAcxI47U5
         nz1Fgxupkah/UONf983M8l+Fswq9hVinB+hfN7bBncBKXmhlDGagEw2bybHm7h0Djzri
         bqLwC6cXecEwZPBBDb7gii6aVNboUppOTBCxlMOp1st7U+SJyL760N5ECrd+Iz3uE6IU
         wC2etE2oQ6l9LIsEP8OR/WgnF5tN1cBoSEPvBYnXjEbkZGnLHTaZJWLJys6O5nhDyMHQ
         G/kj4IZuWQhWbQ+5sjSS89xvyeC8Tg3Dt6id/b01Ja1voTKtmgPu3qRxSXITikAvS6+V
         hSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454586; x=1783059386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bAwcKFKT59MgIybmzJBQCtn8rBNm1HXg0BYQomquJmc=;
        b=Kz0B+IupxzlZu9BCCcU3PlahdegSC9ja5Ip2RU/8j2tXx6XCLk0k2RgG5rYIvqWiTq
         C/A4jbt9UwVhyX7igRXc6osx60s9EKs5ppmHIygunA1iTG/KZ7xbQJa5G/AbVEI1T1HW
         m8M7vsYP4UPcB0yvCvFVHQWN9WnTGXcvezFqAY18T6NcFB8dv8BgsPmLyVR5uUuWAtCP
         Hg82lD+Nht2ghf99iuiSILP1ZNyLvrb5uNoB1kHd/D1SrhQ1LLvTIC5qI2nWPkH1HMGB
         U5DG7Q3f907hHna+LHhPN7sloXS9Cib1TL/DdRN8q0y0QTyLLvt4qdjUxAEKhBiH6LTs
         d1Cg==
X-Forwarded-Encrypted: i=1; AHgh+Rr5Pvcm8Gf2JCoMEeTJ2IN3KmLcqUqOOJeTTKPocsdzltze3qxIbC7xalf1Xo7i/9K+EpS7aQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyt1ZlF9Q9ovArIRiDNEtn4ajY8qmW3ClbbCBJ/hF8LFBaVi6M3
	duaJZf1e9s4dzKMMMXjP3fgzorQgHg2ES7pAem1lIISqR7ClSVFJT5xs
X-Gm-Gg: AfdE7cm+RIg3/quDO8zry2o37elogTSxJuKrFWTpF/IjYCCYKmy8XToOijr5WhUxYsk
	uqP7dwKq8modZXhkW2N4TGkX70V4Cts0w4FivW99b8NHMGHuLKCzBNhnT0DZrFhgKTFGAcQh+p9
	UGPwpoBdbEkJfW03uFEFRJemuGwmehmZT0CfWH2xSzTMtM5oZ+RcgNqFbFhS5UMLszNLH6xm+t2
	na6QRKNkAsKZmwIC7uA3zJAR8qmt8hVjlcTI3dx9gUufMzXSXCjr8e0noNafY5ltgYwhl5E5iR6
	msCpH/edM736RyEFyfTo+dt/alWH+BZu1LRbZdkJW3TmDLVzhRBc+8YLqO+WnYqThc524pRMXh/
	cg7J0g/6uLW5YDsX8V8YKC41tZ3HY6SomdeECRYa+7GVhRg3hUKHXSauWhxpm/fSyYDWoVrgw8l
	NLNteUJDsE3a0Bx8wKmrYpOrqmxykzDLX3e5AZ4PEOsrGuZH0=
X-Received: by 2002:a17:90b:2703:b0:36d:b818:f848 with SMTP id 98e67ed59e1d1-37dfa1a521amr4929176a91.5.1782454585959;
        Thu, 25 Jun 2026 23:16:25 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:25 -0700 (PDT)
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
Subject: [PATCH 23/24] ASoC: codecs: cs48l32: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:28 +0700
Message-ID: <20260626061329.23264-24-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs48l32.c | 29 +++++++++++++----------------
 1 file changed, 13 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 086ed0f57a85..275528aa48f6 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -8,6 +8,7 @@
 #include <dt-bindings/sound/cs48l32.h>
 #include <linux/array_size.h>
 #include <linux/build_bug.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/container_of.h>
 #include <linux/delay.h>
@@ -236,15 +237,13 @@ static int cs48l32_rate_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 	int ret;
 
 	/* Prevent any mixer mux changes while we do this */
-	mutex_lock(&cs48l32_codec->rate_lock);
+	guard(mutex)(&cs48l32_codec->rate_lock);
 
 	/* The write must be guarded by a number of SYSCLK cycles */
 	cs48l32_spin_sysclk(cs48l32_codec);
 	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 	cs48l32_spin_sysclk(cs48l32_codec);
 
-	mutex_unlock(&cs48l32_codec->rate_lock);
-
 	return ret;
 }
 
@@ -2242,7 +2241,6 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 	struct cs48l32_dai_priv *dai_priv = &cs48l32_codec->dai[dai->id - 1];
 	unsigned int base = dai->driver->base;
 	unsigned int current_asp_rate, target_asp_rate;
-	bool change_rate_domain = false;
 	int ret;
 
 	if (clk_id == dai_priv->clk)
@@ -2284,19 +2282,18 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 
 		if ((current_asp_rate & CS48L32_ASP_RATE_MASK) !=
 		    (target_asp_rate & CS48L32_ASP_RATE_MASK)) {
-			change_rate_domain = true;
-
-			mutex_lock(&cs48l32_codec->rate_lock);
 			/* Guard the rate change with SYSCLK cycles */
-			cs48l32_spin_sysclk(cs48l32_codec);
-		}
-
-		snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
-					      CS48L32_ASP_RATE_MASK, target_asp_rate);
-
-		if (change_rate_domain) {
-			cs48l32_spin_sysclk(cs48l32_codec);
-			mutex_unlock(&cs48l32_codec->rate_lock);
+			scoped_guard(mutex, &cs48l32_codec->rate_lock) {
+				cs48l32_spin_sysclk(cs48l32_codec);
+				snd_soc_component_update_bits(component,
+							      base + CS48L32_ASP_CONTROL1,
+							      CS48L32_ASP_RATE_MASK,
+							      target_asp_rate);
+				cs48l32_spin_sysclk(cs48l32_codec);
+			}
+		} else {
+			snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
+						      CS48L32_ASP_RATE_MASK, target_asp_rate);
 		}
 	}
 
-- 
2.43.0

