Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691654;
	b=ooX9zYE2N0zghxi9K0XwlOu5pTRHdddnTzV0Ig1d8vPFmbhSnGp5MBxSQzpR4aQug2RN
	 O4N1IQ0q78NFu2MBdm0i7WtYBHk5h+eUlWcDU090/RUEcHe+itkwFKTPj+X1jVgxhUTPu
	 ZEi/unjf1MTTmPp3uVKRfTF1ZKYbGGkFnxajSVCigxGyPjh+L1UAob24SvEJ0w/oNgvBS
	 HzFSL7gK87gWOcY1V1auko4/yVW9ZdEDXRhYBbkOZIpQUy201QZGPS1jXbHNG23f/rwlf
	 4yFd6vsHU2mTNA3rgwLDXS+6osdvZizzB39SURp3lVXyan6zqLNRmPYzBY2nGwiqxig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691654;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
	b=TFzcD44tMDrn2zYULQ8Ydh9yLGn0RGjxlUroKXmg14XUmg4+alF+LcMsdL1H8+9kWcwP
	 gmhnTD4Ud6rRUtcC7kxESpjLC1TawQUV2fh6TIhAKCm4WDVjCmkp0Xiut3UJVPzqFsgzW
	 JDiZ9DVeTJuew5ryIpIbcCm8nC6yuRP+3Yisb9/jfg2VP/IaMzA9Tu2eTNDRsUmifZwiW
	 kzDKDJ8K++GMJmcEghx9vU3PCFG0r2fr1kukeoikzYdk2vqRQ5Grp16HqZe8yqFTeU4LW
	 AX2fU/tIXtUZNMjkQOZgqV/ikBaiG0AOyFFG2NBAL6tF60Y2qoyPEPzkalIyJ3MjGWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fgaTXfhV;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6448C606A32E
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6448C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fgaTXfhV
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e60f9af6e6so36506945ad.3
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691654; x=1794296454; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
        b=fgaTXfhVZQcYbueJ7bQ/xL9LwLr/S7d3xzW2SzPiaQanh85BfkSFRyz3DAhCQ1Bl+a
         7P3bAr6c5Z6I6phPdzSurQqRUfnLbq1bcAfVvQWXfehgLFB1PQ8aUnF6v3wGobBgbFA4
         WAMYdlj7Jm31yGPFeVlfoJOPn/sQ+jPRiCBuaWPI7psasw8fllSiNRD0YPtBpohPqiax
         P8w9rBQJymUaEKChF45/47NNY86TC7woZB6aw7deNx4iKxXdBjNXDdn96P5yVLl8w+pz
         SuH2qB1JYZru7g8CauYy3ebz/+27J/1rx1TZqA8eXOx50n0hbc9wQt0p++E54IPkPn01
         GqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691654; x=1794296454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OisQAWFcfOsetcPoB+5k+VxAvdJWHk9io3oDzNMx+0U=;
        b=KVbfl4wmd1yqj3fzf2al6w+CCr/B5FKdVylS8GMw3SoAhuNz5pJhI+Uu9CtaIi+ZZy
         Xre/X1Hgx0PmrMDkiIQ0zVMbU9Yvd67/TMhXBf+msQKoQcio5ph46lQosvdBFQF5UTMY
         B8Y4D/k5rVRJGKl5Xqp7UsO6zJeB6/7FcJfb45TR3NqeL7gAZYWEI8s+Fm2VOAHeV/k9
         U/KUqxZjzu/+ONysVLbRozNoKf0lM+zu2FBV9G+TyckRaTBuF3GWdvgWyMp6bO9lft6l
         pZLV5UqZ3evSDaYO0fcsDWero7u6pG/KdOyV0uT/dzIsKyZPlKC5bcfQK4hCdgb1rslC
         XzJw==
X-Gm-Message-State: APuU4Z9Tn+HI4DYk+fkZtHiyHzPxjVBQzIpGEiJjUso2ypHpybJQQgAE
	rgXY01XQ8EpVU7SZ6QO8eSKFrNAsTlrhidPSuH63dmoPMeeqQ2yLxcrQ
X-Gm-Gg: AYBFou2gZiV9n+B+e8lo62yZ0J7haEp42YuKueGiolHvR8JYg8zkZosUa+56Te2JFE6
	vS3j5Vd2af/FKasIqm/CMWUozKc3Xz41m22EBlp56d0Z+cHYudVij46aRsljUeiY7QJr1ffsnmx
	RcGN6y5gzsame3Un+8CnVjYxeHoGhuUYkUWK5TlsYJ27bJHPsNb6xbaNz3R8sxO7nCtCKat+D7E
	Yn1yI/6XwAI5fAWPZp1iKXTdg9vUph7VBvztCrJFjReZDRpYdHcCohR0aQWGCpikPUNbe/e9jK0
	AHuqb6kSmM/5uR38UyFiJSHI6jTbBmBA7iEj/kbycIrMuiWIbGTSQnUedDCg2uu3UwrW+5vjmjz
	EUq57rsb5kbb+jewB05CMGQ1xz9P9uy2PD5kFzCEtZj5oaXraL0u4qeJnY8pCi/KN+GYAOqeP/x
	k1y85NCJ/iqHfu+HqIy29lPvMjEtvoN9jEz8i9lgXr9yk8Gqn43mHb7QA/RnRuXnMI8b9LV/f8D
	elVsgK1zcKGYbdgRp4dqj2cWSgpF5FaGslsrdSX5ozSi9D3vvDsQIoaOnB5tSUkB87h6tKXDHzE
	mpFOh6QgTEnpfnD1xHcU7zJCIF5IRrLDC3SDi6aMfwcQIpw8Pzxv64yHrpAgiMfA2h+OrLb71i9
	qNz/7Gcjp2ffJ3XvhGHsASeOpUYczvRy2mRXWMnnV9JsBt7TFD439sDA6T5OWXpG7E+tY4zfUC+
	v2wZgWeQCvqgvJdbW8CJ4kQF1D
X-Received: by 2002:a17:90a:ec88:b0:3ac:7556:8eec with SMTP id 98e67ed59e1d1-3ae89817e67mr10390517a91.39.1793691653576;
        Mon, 02 Nov 2026 23:40:53 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:53 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:53 +1000
Subject: [PATCH v4 05/22] ASoC: ops: Introduce 'snd_soc_ctl_activate'
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-5-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2221;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5hdczG9NEn27ni3LRkyWf48VrrSCYHeqmgsUnxw+t7c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/m/vxd8mT2w9wzJq9zHr7fds5GpJlvk/hZ7rBVm
 d+O7vvj3TGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqp05GhrWvelleP2jLfaEW47KL67PTlYtSmlO89EQ8JZyOOl2/pcfI0MSmciz
 Bue742WSjd8f01zrYWO2W/i56zGoSMydD2E0OPgA=
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
 sound/soc/soc-ops.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index f6b98324f346..fbef941157ee 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -565,6 +565,8 @@ int snd_soc_put_volsw_sx(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol);
 int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
+int snd_soc_ctl_activate(struct snd_soc_card *card,
+	const char *name, int active);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 497ea82c1778..1d60e290e40e 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -473,6 +473,38 @@ int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
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

