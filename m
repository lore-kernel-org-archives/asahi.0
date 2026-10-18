Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6C336CDF2
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302911; cv=none; b=O+sx3zN+8LS6LbtguqbpJpD37Vc5fC+97No1HnnOoOVNI5RTrBVduEbOmy/wy5LwtqXcOlzoKl+54gb2ckphAzKr7ZI6snMkEF/RuRjLq50Z9YsF2dBuej2aMkTpmC6ZqjZBlQ3AVXGG1QHuqyb04MegUJk8L94Dae6/k6WF8Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302911; c=relaxed/simple;
	bh=NlIYI0wEswgCF4Xpl2k56dNXmbybay1CaLrUqHKTrmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bhu46IPR6oNReI2tAvjP2bgfjZvYCPRESYYnQUmw2iHkO4Xs+Tm5VJAZVPu2mTSc4e9O3+TwhGlPgx22GjwnU+Vl0f7JF6sTmrJeqUlIc5gJ8fo1IBBNfGTNAhtIogOcRIOftIilgO01n4FYtSboG+Wbqg4E/IlVUaQ76yTfEoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7ULxpxR; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7ULxpxR"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e987b4a710so9629635ad.1
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302910; x=1792907710; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TkL5krI5HcwcF2aMm7pBYk9h5C6V+6rm4QZatT5Wuo4=;
        b=F7ULxpxRqbdDEjjpg00Q1h4AskUscQpjPC6MeuWwwL00yn67ekRKctyDf32ouUKa6j
         C/yyOs78yOMcwm7lMlsTHDK9npd+qqaGwXvQqZhUjwXbVzvTeg55X83lZ62EI+FOGQLf
         F7nRQfvmrrpDjfnxTwepfyNKKSULd7RYwhMY2HkF1geScaKQ6lg1YgrHk77P8tLQb+I7
         eH0/Hji6MRzsvadGKxzOhDL4JSHzyoVAwy+CYXsl4FZ/MLxEL/q06CVo1yYuml4no/eb
         /8kjhGAaKM6UmwMkVwJAe9EXy0kJG08BxEUhruFvCT3rfL4Rmk7PI44kXD8FpYmJdo85
         VdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302910; x=1792907710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TkL5krI5HcwcF2aMm7pBYk9h5C6V+6rm4QZatT5Wuo4=;
        b=UEKKWTFoKNHFs1KtRxbqJ+L+2vI7gkAyM6K7bWC6paFQZBzNOLJ84Cmq3rrHCD0VRP
         pcPUMVXemNR9V24opyVsMzswvLYX5IE0MJEUVxI1jLsMiRL/xW719gSjLI5pCL40E4Kw
         MREV36nl5zWfldGNnxUKn4iFeX49uwqqm37gchJ6Mez1GWcBvjXU1ONAtkJN/2tdfd/o
         uotz7oOUlLIOAGmjz4TvTBxoXhwX9lq181bEuqo4zkwFBS5O15K1H+HX1KHrmKX+hTN3
         05DgEtGLOe+rDbscos1144CZYkmPur7i3MwiuFhbxtsz3chK0PPAvb7yX+ZmKkZgSjPJ
         eOWA==
X-Gm-Message-State: AFq9FYL6HuF2SKhh/woXL4TpxGDWCM8hESIEUZov+nvry0FUc9AvAmCy
	bRg9jHHWotddcDr2dI0Zs6JL7ivhOMOkgEKyZnk5jYJ1I6baZ8UubKoc
X-Gm-Gg: AYBFou3naBctg/OOjfAf8kavcCMmR3wya4OV20DldSV1Ty1pUnP4pb3xG302Xb91YD0
	0VfOLMS4IKsSC/4/ZGJQ0fGlZjrpuPbMzTtAbFyKnw3E2i3405kNBb+CwiQDxm01oygfplSLaxm
	PZbnM8aYPFRxRaCiwMIglyisJRGr6hf8K2hifbk30l/Dcpac1hca+GkJzC5LRWG0pnVuwPech2q
	qQhDG/9ckb79P71/bgiTyP4SDL27TkDUkJ8aovPTHQjBPgoqYYC77bwrJ9ze1V0fZekf6UnabFY
	ZVjqgqwpYpN5Fb1gn6SmrILYa9AbWJAn7+PdA3oYaJWt7aS5oiNHjh924/Gop08w1IcuvvePvFF
	Pou/awvicg0SbeLXPnzdWW7q7SqNhBwVNioiC/vX2bEgvgrRQBjjdWJw+eVahaoju3tE3tv2lx2
	HZOutdybGllrSFnqkVvkdjzygI5lohuKKKcH2uJPSjrCm5okGd3US2yyQxZTFw13OLXb0zHsDmZ
	JEaEpLbOdzgbcwBPLrzRfSfWfIM7u/Nu+SFujZ1en7g8d6fYvGY8DnwO9DdbTe4EuC1l/gN8FTF
	M5rU7cUzee+/SxDSR/jpGevcOj96iaFgaJEueAjh+89eFmU=
X-Received: by 2002:a17:90b:580c:b0:3a8:337d:228a with SMTP id 98e67ed59e1d1-3acee2768cfmr2702377a91.6.1792302909929;
        Sat, 17 Oct 2026 22:55:09 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:55:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:58 +1000
Subject: [PATCH v3 04/21] ASoC: ops: Introduce 'snd_soc_ctl_activate'
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-4-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2214;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=eogWKeAPSgLXuvFuxBpm0mCMpQlIZe0f6Gyo195bzv4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nlMut3rN7jGTw++yar56Nujo3kPXr314b2V6G32L
 sVitc3hjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRzMTMyHGOoaN6st3+KE4v2kjMP89/dODOtQUhfq3/H9G9JAnm/7jEyfGvpbTO
 UNf+wb7uxRIrgSp3Pjs/Nzff/XjRR/I1lsJ4LEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

This function mirrors wraps the sound/core 'snd_ctl_activate_id'
for ASoC. Machine drivers may call it to lock down kcontrols
during fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 32 +++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 553bb7e2be98..7509824a6b2e 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -578,6 +578,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+	const char *name, int active);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 142f407e3939..295056bcc081 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -471,6 +471,38 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 
+/**
+ * snd_soc_ctl_activate - Activate/deactivate a control matching a name
+ *
+ * @card: where to look for the control
+ * @name: name
+ * @active: zero to deactivate, nonzero to activate
+ *
+ * Return: 0 if unchanged, 1 if changed, or a negative error code on failure.
+ */
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+			 const char *name, int active)
+{
+	struct snd_kcontrol *kctl;
+	int ret = -EINVAL;
+
+	if (!name)
+		return ret;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+
+	if (kctl) {
+		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
+		if (ret < 0)
+			return ret;
+	} else {
+		dev_dbg(card->dev, "Tried to de/activate unknown control '%s'\n", name);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(snd_soc_ctl_activate);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.56.0

