Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691663;
	b=Q/bifOSLE5sxGJzp7B+roty75BjUUIkmp5zeokBI/Gt/CkwogPctKaezh2bQfwSsItDy
	 B5dW6tHOIjEeBH2Q12S8eBfCNULcBuSHhnnQUOU67CUyT5Ve5pmnAfg7C59j6r+FfaAM3
	 MWlhbMm61UHTtNvIRAhvW3KlULq8+ZZqf0iHXHy5c6/LbcthrOlOhWHVnTT3GRPhXdd4N
	 alO9eqWbBi3VERXhVtIOwrcaSXcB97tLRrFtJTlro+zwA6f4boy6tSflijq1eY7eEZz9s
	 E9+X/DdaxStG4D9YNKSxmZiKemXq6sLBMDlpirK/3TkH57McicRtNpVV3XPOFhp29Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=AjJneFd6zR9t+WlMczvHbSnCI0cOt38Lz44GPu9SAaQ=;
	b=a65TrjDJGtODOa5Kt8gvoBSv2HNdHrkEdPdJBt00UQo9/AVUp2N3iza39BOjUzJrj8Wa
	 x+yt4YH91e83TfhtxD66vqVr5a8GuUgauJdbCKQDnnMhU83Z8prM1GDq6FLOilxX7gv9+
	 SADaa6BqWSKe1lzU33wmPX3qcYqFpp/yfTNLpr51LmNxnl/nsqRtbhPHJaPrCIRmAESu5
	 3RXbXZNk/pfUpvb0OVs+SDdyt8mla1nETKzTr2ElA4ULKjZTGxXLiSXkGH5IJtijxnoSG
	 l7AmzDP1o2/yeD5/CSEACVHbsS13EUMg13LhUbBS1eVIrMgaIo4whyQ8MVM29UG+9xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsLY0XIZ;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1764606A32C
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1764606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YsLY0XIZ
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so3026560a91.2
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691662; x=1794296462; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AjJneFd6zR9t+WlMczvHbSnCI0cOt38Lz44GPu9SAaQ=;
        b=YsLY0XIZYRk7UUfvfFr4hIMiUCf7uttkvbERvBYtKXVhob1/Ysblb6wUMYWeeapp5g
         SJ3eoJO3+NIwLpQz43R87/kmomcb+lojGscMuwIs55+r6xf6nUq/OxgwfLuG+8nyKVGZ
         DLL5QAiQt0/EFyjnYzZzLIK2+ZxKg+wE46Vu8E/II7Hv0EBZ9Ku9F4EQYPswuIzNAvhb
         sOxXfpr8fRfz9UAlciG2+8JBhRRPRqe68o3mNww19EPtlKIe9EW6f5rZC6JKl6nMYkJi
         kuQrixGRVhFO2pDQMhCuJFEZM6q1vWncuxEd4xL/kzzJKHQmgRQhxIq0p8bFjzWNPYEX
         nNAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691662; x=1794296462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AjJneFd6zR9t+WlMczvHbSnCI0cOt38Lz44GPu9SAaQ=;
        b=xCgQakLJYctyg50+xIERg2xQAunekIa47RIBUT985qw//gVtxBemj1XzzaNk5Aa8ne
         doXfow2c9Na/8skfcuuXr/7WQoHSaanLiw80WsUUBQWLyYsH4PwJsDCGg0QZhOIqwaSg
         Ho2YzT8E7s9jSBTSnWqaWC8AQ1zXCr4U8/PpinvElbkFa5+y6T6MQth+ZG0twIglIHar
         x9F6rxAT6wdcRCpwBC20FvMlB1guN4x2WBLss4Haz8DICM65Xudhv0TzycVh/um7Bo0k
         dELrC83VLc39LpNWQKy644NgaqMbmu/GwBdbzLk1LWAEC2fTEJDPnXKhLPGWEuW8r72I
         5PNQ==
X-Gm-Message-State: APuU4Z904bpDdhiqwWAufJS0WMOMPHoiRnND2A5wJdUAHoEGxCNXqlqJ
	+R7oFJTDHnj8iA0Oa63oMiFYJqV5bxh9VNTIdOYYWiL45zMdcg0IT5kb
X-Gm-Gg: AYBFou19F3Uz+/ZCB+5YGIi651uUsSL53ntSnLn+p13dMtbiCGGkpft4/oZMcLkfBUs
	0S/pJSITzJ6F+CK/aQeohiHg4z7qZ/0eQFogdu4oQfZ3Vk6wENIV9rybRypW4sNdoohWp3a/U8M
	m+2NoWv5kPE8pk/ceyx8l7kNJqbAhhGfy/edtJYyCerAyBjFhNWm9KAYToibomAgD9RxPr9dkLS
	F9m7mXHbJ09nIfWn7QA7fiNioPBScet/joeSxFpAWivXeJccKAWcLwlzuyHtJBrNkI0yV2zJD/i
	wJsBDOYNae+sPJ99DcWdiF2MwB3X58hv0ORwVTRwM2E5dGPK5gZ08GmfY2vmH/lUWjKNiukGB66
	7pWTwcxWb8UOclan1Ziirv48Oz+zHMPlGeUitlya/pKX+6MZ/YMGJ6NDnwurpSC1nGPiZz7VusC
	DYu6WQvPfvHcvCcCKCqU0ra4FKuIMwItKHImmAMy+ZkxrBlZ7EzrQqEQM4FrHO1st7UYGUL4DNB
	T2kmOBzZoH3F6XTZuSIkn/5o6fMYHb1smJDXtuXxUO1TWzhRBMJMyKTbtRGitNRzUUzJ1XceNVX
	xogmQesTkMPFeYym8VqMtQSoD7rJaw4c+F3H+PEN3kj09OA8su2e+sBX2YGBmorYDpx57S9XSjz
	63nDCHO5ykjhOeO1KtVL7QIjm5pS/T/edGLfRbH3HfK3dLaT2skF3DI14wpz8cJ8YbgqbBZS5cb
	5w2nY=
X-Received: by 2002:a17:90b:48d0:b0:3ac:80de:44e8 with SMTP id 98e67ed59e1d1-3ae8983c697mr9569540a91.43.1793691662194;
        Mon, 02 Nov 2026 23:41:02 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:41:01 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:54 +1000
Subject: [PATCH v4 06/22] ASoC: ops: Introduce 'soc_set_enum_kctl'
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
Message-Id: <20261103-macaudio-v4-6-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3032;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZOqi03cyyWOVQz9j7HJ4ZmFw5Ix5rcoCeApwbxKDnBA=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+VbzVZeGCSGtuf7T8lO1l2PZw9+d9pc6Off7xS+
 a//rXq4v2MiC4MYF4OlmCLLhiYhj9lGbDf7RSr3wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVv1YzMuwxlZYSjtp//6Xdd/vzhn+UEiaI2Nl8Foy+FXurk6WcZxvD/9CgyNx
 P55mtvLP3dn/MKNAJ7Dd4zuef8XD7uayGQ/n3eAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

The new function is to be used to set enumerated controls to desired
values. It is something a machine driver may call in fixup_controls.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc.h |  2 ++
 sound/soc/soc-ops.c | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index fbef941157ee..c77119f92dd3 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -567,6 +567,8 @@ int snd_soc_limit_volume(struct snd_soc_card *card,
 	const char *name, int max);
 int snd_soc_ctl_activate(struct snd_soc_card *card,
 	const char *name, int active);
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+	const char *name, const char *value);
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo);
 int snd_soc_bytes_get(struct snd_kcontrol *kcontrol,
diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 1d60e290e40e..1cd7f1caefe4 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -505,6 +505,73 @@ int snd_soc_ctl_activate(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(snd_soc_ctl_activate);
 
+static int soc_set_enum_kctl(struct snd_kcontrol *kctl, const char *value)
+{
+	int sel, i, ret;
+
+	struct snd_ctl_elem_value *evalue __free(kfree) = kzalloc_obj(*evalue);
+	if (!evalue)
+		return -ENOMEM;
+
+	struct snd_ctl_elem_info *info __free(kfree) = kzalloc_obj(*info);
+	if (!info)
+		return -ENOMEM;
+
+	info->id = evalue->id = kctl->id;
+
+	ret = kctl->info(kctl, info);
+	if (ret < 0)
+		return ret;
+
+	if (!kctl->put)
+		return -EINVAL;
+
+	if (info->type != SNDRV_CTL_ELEM_TYPE_ENUMERATED)
+		return -EINVAL;
+
+	for (sel = 0; sel < info->value.enumerated.items; sel++) {
+		info->value.enumerated.item = sel;
+		ret = kctl->info(kctl, info);
+		if (ret < 0)
+			return ret;
+
+		if (!strcmp(value, info->value.enumerated.name))
+			break;
+	}
+
+	if (sel == info->value.enumerated.items)
+		return -ENOENT;
+
+	for (i = 0; i < info->count; i++)
+		evalue->value.enumerated.item[i] = sel;
+
+	return kctl->put(kctl, evalue);
+}
+
+/**
+ * snd_soc_set_enum_kctl - Set enumerated control matching a name
+ *
+ * @card: where to look for the controls
+ * @name: name
+ * @value: string value to set the controls to
+ *
+ * Return 0 on success, else error.
+ */
+int snd_soc_set_enum_kctl(struct snd_soc_card *card,
+			  const char *name, const char *value)
+{
+	struct snd_kcontrol *kctl;
+
+	kctl = snd_soc_card_get_kcontrol(card, name);
+	if (!kctl) {
+		dev_dbg(card->dev, "Tried to set unknown control '%s' to '%s'\n", name, value);
+		return -EINVAL;
+	}
+
+	return soc_set_enum_kctl(kctl, value);
+}
+EXPORT_SYMBOL_GPL(snd_soc_set_enum_kctl);
+
 int snd_soc_bytes_info(struct snd_kcontrol *kcontrol,
 		       struct snd_ctl_elem_info *uinfo)
 {

-- 
2.56.0

