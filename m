Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4797F3CF69F
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880193; cv=none; b=cKbB3ne/Cmd20rEhJh9ngr85VH4j6+NTvdbgfKwq0wr7xDsP5m4OSyLwGJAHK5LeTCe0XgafTVYRTfl+mNtRS7/JV0QBMuv6KG9njrWgTedeiXzNSKfqJyDuwMVRdGj72bbhZWSSUqMlKhNALw8DeyTtH0opxZ1Qs/tLY6y4IT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880193; c=relaxed/simple;
	bh=nXncydCs7zpGdBoUqUrhDp6s0gVfraf7oN9G3oqVXyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WgwiSQomH38B4gSEI6uy9NB9kIeV49eToHJBloXJw8nRApTf586reF3SxkefGoswgalBVrGy7Ekflv3y8Are7gEgrAVl44tmMSg+n/ImbmrRaY9StB+NAf7XdMP7dFYhOXQQUTSgeB7dFFDseUHS6SRB6uWbSk/7Xs8FjfE8iCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=At0Q7srj; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="At0Q7srj"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6185so12088045ad.0
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880191; x=1790484991; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhyKqtsY06vLNdvd6vYAC+C0aLujryTRqdrSJjEz6bY=;
        b=At0Q7srjbNQlbYXbiT6y8HJwClREx/aWslUhatDZyORt04QTMQVdq46yp5RYiVgXBQ
         dj2rvxj1I8xccOWyTE+SDn3Agoi1GVSYBwwOkeVpw0/eFJ0DUBDZ1vnhqOB2fYeHTh+X
         Ts8FWorPLNgirQRoA5xb+EBppNBJ5Y8Ncvo4UovsKM2S8+MbaoUhmr8XzaRvKZkQjxVh
         KXnKNOeXFgo84m3qY1lEYO5jVdIUi5Q5PTD/k3KEXvSSM4yIMDz3/ZD++ynhpQcAonlC
         6LhowpFemXDOHVHTuj7ow7sgIHwWGkn/b18Zb3VB89WIZ8lK0p5v39F/sfQdGlz09A+c
         J9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880191; x=1790484991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhyKqtsY06vLNdvd6vYAC+C0aLujryTRqdrSJjEz6bY=;
        b=aT7Z4xuRGuUClTkmxRUcSuuvUnq2BCz1XfXCzW9/O9ScN+PBV5oUGyET6NOC/i/z6r
         z0n+rt8tWqVbZjd+nB2sfehGx/O2d0zKYSRu41V2f3i6eaF9bgl6x6iOeWKnut9LH1+J
         WwqFDEwOmc91XXAP0GsSiO3F6YFgFiDavriH8CEm3i78xybLcHIrklSv1NUlLTkkZkiZ
         nxriEtUI8LirLSSr4L6u1OGpYblcJCNuvJbSBDAucL/SE77Biw08LY02zdJXOx2G0p3c
         laFFePn/xJzPMpSLoB/gk9m3rv9A4WOpqqKZoG055cayD68uw7MKWr6wQwpQeCeaq9Ax
         v/0Q==
X-Gm-Message-State: AFuF++n+mJWaOOwZjxZUErjJoQ32Sm+csKzg5rcT4X7sba9KBRE74pUD
	8l/oSV9jkaDIUX1pL8wENqG2Owy7K7mePzIMwAEmS8tSoJDy6IT24J0S
X-Gm-Gg: AYBFou3wUlYt4E1pv0VVUHg6VeGPf9lEcUYwyDrpE1/N5gWHOFzUaN3d4vDB5id0+EV
	4XWJ1RfNLXUXt7ShjOWbk80PkZaSB7nNN5gMb89l8AA9fYtIy6xfxDzCxwwpoTGRsMIgDCTdgU2
	FXvm2jVUoYpvar9S8DgXR9vq46IO77iCorlxnUkHkEVqdJ+z4rAyGjjCjU3a3Fdw0uiHX+YIORh
	jYtopbDr4XpSRP2Jt56c7ai1DhZKWtXeIOOrRXl2q0Dy88GO/zwj5fsBrgufnxU2sx0ODEmisqT
	aP0vkFK8k6dHhafm3FzLRYHg4BxsCeoIHiSqF2fNP1T2aFcRHmR5Q6i8nhKribOxzO06GyrFMa9
	Qk6lT23IGkX1uTHxEBQHT7ThwUu3SOWv9PyPy+IzvV93+V5/AgajW6hbUrVbJHMxwVJUHS1KKbU
	c1mLY1q+iyFwVg5NQhqz778Qzq9hhyWsK1cTd4GKxJFb9t1OrBEm/zXpZQle95HFxYH3T0/JFtI
	N8EeAeXtBZbhh89MPk/mzVKQanPWnsU3dl+nt2YN44BNm182RERR8P+bM4oua2tVnA0ZpRyPMsD
	cn6FduqKbGHqp3RU1wR+34BP3VpWqqObEH+E5pr7bixTZZI=
X-Received: by 2002:a17:903:1446:b0:2da:eb8f:b4e4 with SMTP id d9443c01a7336-2ddb1add397mr117214805ad.7.1789880191567;
        Sat, 19 Sep 2026 21:56:31 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:48 +1000
Subject: [PATCH 09/28] ASoC: ops: Move guts out of snd_soc_limit_volume
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260920-macaudio-v1-9-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1949;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ofWNdRfEPmyBqzJBf/dI8RMLcLf8D6L0C2OlsVRutbo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXaG63U53++zvmJ51PEZI2s0OpTh2NTF/oY6Ww2/
 bGnqHRrx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqfhTH8z/nL9d9t399GmTaj31sO7E/klD6itHY9U2Sj2g7BxFc/MxkZ5q2a3aJ
 r5a1bdVfwxPWl+0T3vOXK2SNh4WS2vHdeF5scHwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

In advance of other changes, move the modification of the control itself
into function of its own.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/soc-ops.c | 28 +++++++++++++------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
index 142f407e3939..e572b05840b4 100644
--- a/sound/soc/soc-ops.c
+++ b/sound/soc/soc-ops.c
@@ -434,6 +434,16 @@ static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 	return ret;
 }
 
+static int soc_limit_volume(struct snd_kcontrol *kctl, int max)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)kctl->private_value;
+
+	if (max <= 0 || max > mc->max - mc->min)
+		return -EINVAL;
+	mc->platform_max = max;
+	return snd_soc_clip_to_platform_max(kctl);
+}
+
 /**
  * snd_soc_limit_volume - Set new limit to an existing volume control.
  *
@@ -446,28 +456,20 @@ static int snd_soc_clip_to_platform_max(struct snd_kcontrol *kctl)
 int snd_soc_limit_volume(struct snd_soc_card *card, const char *name, int max)
 {
 	struct snd_kcontrol *kctl;
-	int ret = -EINVAL;
 
-	/* Sanity check for name and max */
-	if (unlikely(!name || max <= 0))
+	/* Sanity check for name */
+	if (unlikely(!name))
 		return -EINVAL;
 
 	kctl = snd_soc_card_get_kcontrol(card, name);
-	if (kctl) {
-		struct soc_mixer_control *mc =
-			(struct soc_mixer_control *)kctl->private_value;
-
-		if (max <= mc->max - mc->min) {
-			mc->platform_max = max;
-			ret = snd_soc_clip_to_platform_max(kctl);
-		}
-	} else {
+	if (!kctl) {
 		/* Some cards blindly add limits for multiple variants. */
 		dev_dbg(card->dev, "Volume limit for unknown control '%s'\n",
 			name);
+		return -EINVAL;
 	}
 
-	return ret;
+	return soc_limit_volume(kctl, max);
 }
 EXPORT_SYMBOL_GPL(snd_soc_limit_volume);
 

-- 
2.55.0

