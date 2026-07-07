Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A115382295
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401259; cv=none; b=KWCL+DNwtBB7hMYvrGJS6xfQqBCKqLQOqJkT3OZ01hMy9HFtdRz9XaFEWhRDxnEWqr/hH0NOMTfq8tp/rSBzZ1XdJiPqs8Wddl2Y5jHIb0IugAGoUTLWwLm049vIXjbyNmjNp7kIOdQSgLXNxlC12FnrHRr4wKzNMWFKD7Cl0ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401259; c=relaxed/simple;
	bh=g5J6VJsuQEDSKj38JRXT3/2Sio6DcgOG5vApByn829c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YW4DZxSHOzQ4JdG+2YoH7L06MhWFbYZW2LDTT02X8shUYdJXste3TzSx2347Oix5WhQAzjRdLi0CJ5bnp8G31fJ0MxpHUivz5ZjrfAsVIBrIOL3ZWOfWoZjWvrzWnnT7Me1jQEvakLmjMvK/OmarhxBkO/RFNhw+RX+f/CEwo6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjrWZu6M; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjrWZu6M"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-845c92bc464so2675171b3a.2
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401258; x=1784006058; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bqq5atvkGJrMFIYTW6TJTTxqCIFFL1aCQFiDrRVj0K0=;
        b=SjrWZu6M+IG6uT8tZ6vf/iUahLs4y4jTWPzX7/6yl9Po5i36OUaxqokwu+vcu/+Js8
         dEpH1Z116fU5dIYQ28ruGvNOlh2pmGli5s7M9ecJbpJrbmxxq7c09/wuBDuOyrqv8qaw
         AF0hDRu/OymhLPeDc5YH3aJF92GcWJG8lbYAfUzDMtJdwrDnDmQYtd+zinG0cgF50MEc
         /oVuGAM62L23DNN0mKvltJv6aPAR/irE93I97BqZNMdSdZ0AOvb/q56uYKjM2Cm8PCxk
         C50noc1ESLHt3X8gYH8hoDpnd0WFldl+TiJMLWrKal+0E/uvlsZ30Mqjh6ZNo+zgbTre
         gskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401258; x=1784006058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bqq5atvkGJrMFIYTW6TJTTxqCIFFL1aCQFiDrRVj0K0=;
        b=kHNMGBNf+6iTjC28wO5QVtf/Q/uRfb5UdSJ1IcUIByVmy/dziV3mnFg/6BprockmSf
         0QZLOk9u1Tsr5doOqqgcDzgyCh/QrNhGEMV9AkRlWc3wrTsP7YEpv5dAOgIJCDS1DwV2
         jCwyikfIEMNAbQqgrfAXBUlBlcBTzePe8ZWa1je0c98RW8TGcxrVPAiYYLuUL+YLQvi6
         ejN7xGHh87t+VvB9h7k0yPFiTie0m5XrFjLXS6VtdinEuWbvm5RG3ZRsdFhwc4/PnNJV
         hAwJzKhHvkhOSI07/Y/7VjeUE8asAb+Z88lZy0/qzd8fzu8frxdETtlG93cn8RAeVOlK
         BZ6A==
X-Forwarded-Encrypted: i=1; AHgh+RqaozfLzd378pTtuNsJ8GpU+Jag8FF4qCP1zjFORBc+SHXFpH+VcEuMt6/HrvGjC7NqFtXnBw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwFwL37GMLbEzX376hf2M5qAv5SX526LdxMUSA0aOzyRHMmjful
	6t5dDXO4wWzT5mZd8ZUwjZocAmqbg4ErIUmzbQT5X+OOLsx0AyJJE1P1
X-Gm-Gg: AfdE7cnjWwZblgboHCDlDoAdGeOjynX4UZJImkvg88IYmg/awztDL6A2LXlmrJOGMCj
	3m4flabdMmfKxx/iEL/uq5IOWxyZ1zzOQMuX9Cr00vlzh15JKOQR8E7jG1EHTDSm5hRYIKV4fYE
	X2/vcZUqB6RREF1Oa0W3DQU+Z0pwwjF4GisPT0N8uKL5SA68YaUiAfzCSJZcXXQRzoSWedObbE4
	s2xWw041A6yUor+ymd/jIELRgHuIydnyzpj7Rj7OabgaVCIBVbZXD7KZiTLlg6xU2dUNYlZeFIe
	WTfsa7Ue2BeEDUVJEO1BdZTCqH9adT5HkuxmhsdZv62CUHdCfY1m2EW4q3D3n2dM/kRwRt4G4uj
	3WuDSoLIeRP1JnnSPCFWFzrGiO39utPHq4dph2q5SxvzBgr7QmeY0hJTmv6PdEFk52JtA1Dzo5K
	x+/g+343e4QYHkzH1xh9yLGFyuCwEUxtVlNZUOqIw58mzL/hs=
X-Received: by 2002:a05:6a00:91cb:b0:848:2c5e:305e with SMTP id d2e1a72fcca58-8482c5e30d6mr1620431b3a.6.1783401257954;
        Mon, 06 Jul 2026 22:14:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:14:17 -0700 (PDT)
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
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 22/24] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:10:04 +0700
Message-ID: <20260707051006.20058-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707051006.20058-1-phucduc.bui@gmail.com>
References: <20260707051006.20058-1-phucduc.bui@gmail.com>
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

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l92.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 868237bd6d91..07bc303d9797 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/device.h>
@@ -1892,9 +1893,8 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1922,9 +1922,8 @@ static void cs47l92_component_remove(struct snd_soc_component *component)
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l92->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l92->core.adsp[0], component);
 }
-- 
2.43.0

