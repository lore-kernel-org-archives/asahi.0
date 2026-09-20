Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8633D0903
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880220; cv=none; b=YIJOvsOUIEeRMCUIFSbmGSOY6hS0f9gfqS0uT53QmCCEixEc9ZdMFYEUTzkwsyeixEQ1cdSnHJWJW7a0d/HsQd3xpo9qDscMVYV5VexcYHYX6T29thoyMQk2fQMvmA1IcR8uanQwZzM54TRzM8StuIPn0c2K+cE6Jef2SZ+yWo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880220; c=relaxed/simple;
	bh=dKaT5/AJvuu/ovhkji/q4clDn7hNGscBb7o5Poe/oV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g6f2YYBdZfeYIeLfbVUqItwM/c6xu8s+YGn2xw1CzgoX0gBKdjHGfuR1Kue1Wsi2fAq9hB7zDcyo2tIMjaicbHFqeVLC8qwyKgnIF9UL27/snOpZRbw8FCuj8plaeCQj7Y3seikgtdMMw5c9xDWbQcJBNoJSOKq+wYjvfR48Gk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFyEi3ao; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFyEi3ao"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ee1f38so19495825ad.2
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880219; x=1790485019; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YuKu80M7pHMVvwxhK5F4M5xUsUReDWNtyKOTcL7spBk=;
        b=UFyEi3aoDI2ICZyn1D14YqpUDcq/kmqbQYmP5y7g3pB/awhJIWAgJ7hyW4AARgnQnt
         f5i55n2vP6a0X5wa0/wSloP05JJQpEevOksPHeQp66FlMxEyLY1iUZK/WfA/1cuvYVDz
         WPzGAUPlM1b5weLLc17usCBGHWfMrVure3nugbWOeS/nMXH8pe7deEJoDqMxLeYfVgQJ
         aBX9Qv7g2NQYDlRuZuZnMtCgPEz57cWSY6Yok5fz/bqS6pJO5pw/Oa37pRRVjHuaQE4m
         qfGKmd1XTKn0zz11W6dBKopi/pFLkC8Z4lQBePKhV6wZcm5/4fDSfr0VoDmXPkWMBmqw
         kRWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880219; x=1790485019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YuKu80M7pHMVvwxhK5F4M5xUsUReDWNtyKOTcL7spBk=;
        b=whVq5o9s5ADtNA471bTx12qMM5mA1d3eWy8q5KPzMM+qb57m5ecc36cHN0Is6CxMus
         TwO3e0NNpG/VTnxWMCdNy5GN6ZdeTQyL6RB5XPWHnN2F7JXxbxTgTecPUWIhMCR0IVAz
         hCpgmk3oVKpCSyDxHrXiSGMK/8wrz41JYqF7ATjS+nlnPZmEglCKkFY1WXx8m+mvIKSA
         lRRjfZ7Hs+Iu517OmaFrK1tlgsSkh0u7das3uRc4UleI1cCvAdLuqwllTmQJPeeXtInN
         w1sH48xhdRhQXb8nCILUW8TiWYGCwvkCv1hhROP/1gKq6ZqRZjSxeVRtHEDZah/eRc9T
         EsGw==
X-Gm-Message-State: AFuF++kWKo6vfJmSiVxs6LTtcBbnQFwn+kyZLFSaaI7VsaGeGJHKb3B/
	C1fgzTfAURy1jY6XHTipxguimA1HlX7PEJKPaeP9jYL8ajo7WkOLabqa
X-Gm-Gg: AYBFou36ATnwC/+IQYLY8Om0xn/WNCS/PQ0DEMHD25tNJ7NuUkjrzfQaKGwRhvrI7rS
	iFI2agduARbiFxLs4eVnZLCXk4W/WS0bqqF/W/Ws0kJZjI2YWzrtMsmIzTjZHaw7Eu/qDzwKX2R
	yKvwNEhOu5r60DlTP4d5xovAxzH/G+dBv681sIPp6bXhQi6ivYY8jlWUdaaANMd1tE/c1Ht3HUl
	FJQLYWXJBhrsKb4vE6IWflVz3RNjVr2YyCKMBLVKBDBhmkWs+qS8LoKZR2b+mZBm3eqDO7Z3Oh+
	H05y1zvOFuLaaho7UDX5Z7ahV36c4Lr4Yedmmfi9MEHjgznQ9Acj+P/14ngZwbEhZ0DdUiDbRZY
	kLHkcDR6c66C/wDZE3h9VxU/u8KA0/kklod5sV929AETt0+Tbu8DCl4/loVw6avhTXPp2mTsgHQ
	QrUYwwaXxhgzv2h9Yi15RmugWUMYvFZhyCkwr+cyCvydmNZh4pM9sjBMze5H31GF33SYiMCeWCS
	1eFDsRBIkOP0N0pVG9AumwtuCN07glxrX1hadCaDkCy5y2C4tELHJm4E3j84WLilShE0hsgYfck
	+BDe+rFIzW1VJjdkpm2yWmzXkDmxmVoc3bwrgb37O7bx778=
X-Received: by 2002:a17:903:32d2:b0:2dd:7ab0:7313 with SMTP id d9443c01a7336-2ddb1c17059mr113999215ad.18.1789880218740;
        Sat, 19 Sep 2026 21:56:58 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:58 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:51 +1000
Subject: [PATCH 12/28] ASoC: ops: Introduce 'soc_set_enum_kctl'
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-12-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3075;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ALw7GM6BAIc0MHLkA2EcsPFMi9t4wRSGpPulB3kFXSk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xWYKk3fyLwPOWP4bnLrx6JZ3MlXbuismZzzpHTX6
 3LxGCfTjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTf7GBk2PQ34GexV8erhzy3oqqqFix1cXzjEnblC8NqE4dtJQfP9TH891WtZX0
 Tk7ag3Txt7df9e//ssZq+ujZri9HMeyxeITUFvAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

The new function is to be used to set enumerated controls to desired
values -- either a single control or many controls in bulk by pattern.
It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 +
 sound/soc/soc-ops.c | 70 +++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 973ffaf6f060..f356b553227d 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -580,6 +580,8 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 	const char *name, int active);
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *strval);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index d35e24df891b..dc27d1c409ab 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -550,6 +550,76 @@ int snd_soc_deactivate_kctl(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_deactivate_kctl);
 
+static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *strval)
+{
+	struct snd_ctl_elem_value value;
+	struct snd_ctl_elem_info info;
+	int sel, i, ret;
+
+	ret = kctl->info(kctl, &info);
+	if (ret < 0)
+		return ret;
+
+	if (info.type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return -EINVAL;
+
+	for (sel = 0; sel < info.value.enumerated.items; sel++) {
+		info.value.enumerated.item = sel;
+		ret = kctl->info(kctl, &info);
+		if (ret < 0)
+			return ret;
+
+		if (!strcmp(strval, info.value.enumerated.name))
+			break;
+	}
+
+	if (sel == info.value.enumerated.items)
+		return -EINVAL;
+
+	for (i = 0; i < info.count; i++)
+		value.value.enumerated.item[i] = sel;
+
+	return kctl->put(kctl, &value);
+}
+
+/**
+ * snd_soc_set_enum_kctl - Set enumerated controls matching a pattern
+ *
+ * @card: where to look for the controls
+ * @name: name pattern
+ * @value: string value to set the controls to
+ *
+ * Return number of matching and set controls on success, else error.
+ * No controls need to match.
+ */
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *value)
+{
+	struct snd_kcontrol *kctl;
+	int hits = 0;
+	int ret;
+
+	/* Sanity check for name */
+	if (unlikely(!name))
+		return -EINVAL;
+
+	list_for_each_entry(kctl, &card->snd_card->controls, list) {
+		if (!soc_control_matches(kctl, name))
+			continue;
+
+		ret = soc_set_enum_kctl(kctl, value);
+		if (ret < 0)
+			return ret;
+		hits++;
+	}
+
+	if (!hits)
+		return -EINVAL;
+
+	return hits;
+}
+EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.55.0

