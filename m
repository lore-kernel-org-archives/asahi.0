Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C7D35E94E
	for <asahi@lists.linux.dev>; Fri,  3 Jul 2026 05:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783058238; cv=none; b=Q55S00rLarlThk75YFUJTCHqgILftUMeo9Q02cXW+6mhHfHOqraVSTu6SyJd9LO7pBFvRh4Z22nUyZOGBapJK8wSxOyJTt5l1arIHVTF/c0IHgpmiX/CaOCOjvD1r106iYjod9UR129t6qdg9BRgjbNDAhlBjoxAOF79SDWrssY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783058238; c=relaxed/simple;
	bh=eNcuc/oP52FaBehdpKbBur8a/vrnSG6dcxnBXNqCMeU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wd1KQxT0AOe5nXzjzK4qo1RV059L+m5cZ+uNvmjuUFl0bD8KEOI7mCR2Hc7HZ+COLOfvx4ktf+I2+/Zl+2ehesOQDkFzbY6KsippqE0vNkdt5RsVPRPoh8yFFlkoUtXNmNh1UwBS6Rs0wNGubOL/guYYJUr23M/ahsX2tjob6Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qed2wLyd; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qed2wLyd"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8454160043aso194376b3a.3
        for <asahi@lists.linux.dev>; Thu, 02 Jul 2026 22:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783058237; x=1783663037; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+03ew57CH31VLupzCTVcOnSAUZ32zDQS046SVJqDWA=;
        b=qed2wLydfvYPgtjwuBO/FgNj9U5CHwXiBq9FY2LgWs3i0vAq7aQOXZfiw/SOVfFSQk
         CBBIRme92V5isY73Teg1qPuhXKxQ1nY7tyulBVN9J1j4niqdBXwehMrehhntuVSG8G6o
         paQPR6ngIIj2uNNzIcFukqg9IFgLoYZU8+QombAghk2m+rDKUVSb8UsoA67ELPHStj4r
         7EgCK5wrl7ew0eNyrUV5io6hgozISutJcPDAYXxRpGvqKLcU2VWJZcHAzXKIxH2hjPC0
         muEykblRFQjU3jcMrBnNB6DUvnrhuu8P5ygtRpYh4lsUPX2Mn0PZ9vlc68NPbpmqn+bc
         hkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783058237; x=1783663037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+03ew57CH31VLupzCTVcOnSAUZ32zDQS046SVJqDWA=;
        b=gQMQh62TgriMW+9dy2goIn9DRGxigFRoby/3fr/qtjqNT93eHnOlntOtpe2XkCYQqL
         NbLinX7D/M9Alg1fgy7F+zqE3e31XCGWoGFEkY6RjIqN7KWZOKMWTKef9cUSjX68Zltl
         GtNlEe0zVSQWkK3MHWUHY+qOpFnOlZtmKhEe5FN5SNkRAG5jNHXyg60wP4gccVDoDDxW
         /jicI9hjbiTs9wVfmpLOYh37YEZhgTC9g+seEevOddiHHXsbJh9YtcrRogiPOzcDQYFm
         a4if47E+gcDLfpWBR+Cl5BaG20Dse/G7irrDLonPGjJWI0aj1wDl/GS3UHi+e16Amd9F
         9hDw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+JFeAq16BmAeiQAHNqUYyQu5T6C5jNIqmSMhmbJr4DUCCOBebwk73wbiu9iD8RM1jZAjrhQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl864Zl3yNScJQoZSJTdxS4ReF7K5LyRCiDhvq2Y2C91wanOf6
	ZdFVECHM/TEAf2cnDlK9J6ZHeGzH/8G9DwMExHdtfA7+gQbTBzONCO3h
X-Gm-Gg: AfdE7cl1C97SJ9aWO2P6F4c0N460IEs8uzAW0StqSUeMDHHdAa2owsSxoPqx4UD7jDS
	S9nPOI0lRmdvli04CmZkajy7ESDDUYnjrm5Mll2fkRUqye/xNn1lcnQeVjh1aEyKGBgtmXeibkW
	/4hF3UiPGyk5G90KBrSXjpPK7BYgztjGNHU/YjO9Sn4cwxTGIV3a06PO0j85SjylgFspaZXZBEj
	T4nHVN0USzhbWWfoiLfvRaRhKIB7jvROWneqJhhn1f6aQmgljkPSGm3WF2LVGdUuCCZ42ixItw9
	krHlKy2vDaSjgwuvc/eL7WmMmqHadGRbYSWwJw/+YKirLmUPNHKkpPvpo0BP13SVgOM9+lbjJtV
	cohTUVV36yqNTO6tMGwEt/fdWGucTD5/dd01tYCIIGg9IWllMahsObDiQSX9z88JUH1/lphMsdf
	6biQw6/FXfnY93+GGZm+qVdk9lRneZsYLpZCt6UGaPvuFS5jY=
X-Received: by 2002:a05:6a00:bd0e:b0:847:7f6a:c56d with SMTP id d2e1a72fcca58-847c096d1e1mr9587884b3a.30.1783058236898;
        Thu, 02 Jul 2026 22:57:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94b3e6sm2340028b3a.33.2026.07.02.22.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:57:16 -0700 (PDT)
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
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 19/24] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Fri,  3 Jul 2026 12:53:50 +0700
Message-ID: <20260703055355.244898-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703055355.244898-1-phucduc.bui@gmail.com>
References: <20260703055355.244898-1-phucduc.bui@gmail.com>
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

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l35.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index a8fe5a99a8bb..e77ac7bc8466 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
@@ -1566,9 +1567,8 @@ static int cs47l35_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1600,9 +1600,8 @@ static void cs47l35_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l35->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L35_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l35->core.adsp[i], component);
-- 
2.43.0

