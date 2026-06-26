Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1542D8385
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454572; cv=none; b=PfFa33ZEetuaBTbnPqOQqKOIa7f61S+TA6BLNK8xAnvBPgcjjK/44RE43UUT2qVFueiEBplooSz8K6rIJjxN1L6a4KtMIrL39UiZ/cCyJGz7nEw7/VKRXGVuRFom2wl8zsA5HJbfMm5jTh2XBf73dAAa4g8gxK0ZKagx/tw2dBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454572; c=relaxed/simple;
	bh=T2eO/iN+fiv9eyBvJ231A8TDz5E91d0v4s1m9L9u8+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OGwWCxUrt/Y9TQBZ9LznliXxaNSx+4CRJReau0PT9N8yt+w6FIBkCxWK3U0TyxjPW2ml6PRfjjPRR9g4oLwDyLf8D+kXANkqm7zbnpDGXCaT3APxQt0shZPx8OPdSDsJa0HGs7z0jByhVH0npSIKE5QE6QNbj8yKsWDCZx7skOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FBsHIjxo; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FBsHIjxo"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36b9d265355so293474a91.2
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454571; x=1783059371; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iSnRj0RszHC9jOxwXFHVU4Untaa2IiDeNEezb4oQ4FQ=;
        b=FBsHIjxo8PPC6sSs5Pa1coE+qMMVDHQpIo5ykpJh34+C6kdbhgcL3qlouGrpwhbKuc
         DyxH7TD11SIE/tM3U7DM8haPDCjI1lbJ79mUWKtI/T7KCnM3/YQDKKZGvbSyF1TBdr7b
         ZgErhOcHGZqG/HfsNnD9WXoHMgOEixbLiia6FsvLZBAt5FAlQd5hOYNp/JNB8XGpKEx/
         4uwyFI/5RhFSQuGy/ZdyVlhJQtXw3CONKWe+RD8OqKX+yhWshgbLfOY6zm60Kj0/48/p
         tC5HP8yrqhbEdaSf4jolieVyEA2rFyh/UfDLUMJKB7AYfA4j+oE5ZNQ+FK7oWdct1+TR
         BPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454571; x=1783059371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iSnRj0RszHC9jOxwXFHVU4Untaa2IiDeNEezb4oQ4FQ=;
        b=Y8ovzAvBjUSNTsBwgijO9yWq4o04dN9JIulm0hm0nnmYZfKSInd00mErnDgrIl+mpq
         9KTqWgJ1uNF27itQBNwvViV8yb7zxxTacMt9YnOQsbVS8neIePiALxNXQS7rvUg+Vd2G
         qF0RCrf4P/4KitEHuBlkd86FxfGe3OwJxrC0Jcjp617lCOn332WR5yUtXJNv8Bm6spJt
         3i1bCYJvyOKhqtc39L8fwJ42VGxgrmvure9hR3Oflpla6bDQ2ZKkzqYQkbHhPOZySyTE
         +HY+fk7vDzLtlNIAH7Lzd7Mc4dZUnWag0wLcur6qJYZiM/qwqWe/wKTfRmxMEghtD+4t
         KWEA==
X-Forwarded-Encrypted: i=1; AHgh+RrumMNQM4IO0dQJoWt8GX3S7eIe7vKItt5PGmGx7YIdlcVvNzNPErc49SonnoiO9Th4GBAE8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw73nkKIQntPlXJ9RwXtT23JBQ6UDc8YA9vBZMeZgViyeEK/acY
	ln6uIkOsf/R2MW2qiRVtj/zXSLBVcpewRKOl/sd34Ow0ZXiAFb1vs3xY
X-Gm-Gg: AfdE7clhjFbC/onjOd1ahVqZhWihR8L7sMKOGGQvJGF+OoSLLATOm6WzC5AfOeUMk6I
	MZaQlLc2+LqsAEWzx5r2lv6TR0kCXg41iWHa9BbwYg/9t8pH/OlcTS+Jbn9sBDIxgmSRyph8R2t
	5VCO1LzqIkclcf9+SL+bzsAoeSTQVmM3FGXSPYIBLLUSgoXJnITqTj6BvquOy/emQDYT2Z4jhU3
	RbXFRfDvDeMkzJHNguo55n7PBIdXGVRKH95oj9mRCItQkmcecdOCaESZxbMPm5i9xKIKkvVuB+8
	aFbl2Fk+A5Vkcz0PQzfGFUUwcgRDN3/x07odlD1zrTijngAqELDte8WqM3xsx0W1xqQ5bfcZf+Z
	2/wzy9ofYaYjhMVuiw0eN83wNAkpNZkOfeae/FzZQdC9Xw3+QkmRiWDKOC5lcgmTeTzZh+QE91u
	G9ds//w6wRiGiuZ0EbDsQzE+/oWHFF0m5Ru+Va80/hdGl7W4FyyTO4d2UDNA==
X-Received: by 2002:a17:90b:2804:b0:36b:944b:fd81 with SMTP id 98e67ed59e1d1-37dfa1a522bmr5525074a91.4.1782454570910;
        Thu, 25 Jun 2026 23:16:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:16:10 -0700 (PDT)
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
Subject: [PATCH 20/24] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Fri, 26 Jun 2026 13:13:25 +0700
Message-ID: <20260626061329.23264-21-phucduc.bui@gmail.com>
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
 sound/soc/codecs/cs47l85.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9ee60616c04c 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -2504,9 +2505,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2537,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l85->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L85_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l85->core.adsp[i], component);
-- 
2.43.0

