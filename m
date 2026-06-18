Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785DD3C0A1A
	for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 11:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781099; cv=none; b=HZQdLilblZLPMB3cf0tquGnCeCNhO0gLTZSXKyRH5KXHnqK2I+rUnByrbHK8T76/tPKunZ4kdn1PspshPFJ7m92fREsrPEog/9DMn8Atz3yc2SH4Xf2xNPCXOlieFiAuOa4celtg5lbMSKi18bgU/foWDckW6Q/4QitP27x1aIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781099; c=relaxed/simple;
	bh=bLW2D0WmrIkzzwlGmVFMlDfU1k3KJHtIGoz6p5efmEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V39RjaPHu5dK6Nn9OAJgptuVqnBou1wP5nVzWWyrcbhwmP4wiFr5o7iIUdPdgte/5uUXbhL+CtWnICkExjguNAmMDuXQxWhZqLfMzYUGTi2IXromK5KgYB44vHh6TrueFWQnwmcD1KOoogsHvqlkEFMCEWoiRs6TtNbX+3dwYhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q4ef5EJF; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q4ef5EJF"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c88e3e82d81so419513a12.2
        for <asahi@lists.linux.dev>; Thu, 18 Jun 2026 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781097; x=1782385897; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJMU7K56og6O0Mgof55SgHjMcgC38/i5g3OlSm/yHKg=;
        b=q4ef5EJFUniTjVdRn//9TyxVAWorjcc+2lqh6cu+K3C2PGu6UqJzD8q62LKiogQc1t
         jnhNcNC/rcTdCijeuAiJfE4v2PD0Rk9Q519Y/bd3SyUc8GOKozd3vCgn13yf32mM7000
         EdD7BUxD8odvHYrJALyvnx3zSz0vihFW5uAbbDkQJj3bb+zLKjdS5phcDTwH05VvUyWg
         7SU3IH2A+m0bqligXE/+U6+C51cFGNpO7lAnEyRkJZx3/2vKSwtSzm4KCB6HrB7jIa9a
         HRnm/al0PjGrnkbOFMwzVPGX+7VCowF2X83A3pOfQqCv/rDVSXGe4rNTFy4nqWLwgjKN
         fQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781097; x=1782385897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJMU7K56og6O0Mgof55SgHjMcgC38/i5g3OlSm/yHKg=;
        b=VN7rIBibBM6lAL8a2Voxo7D/9/C6jaXDDgwSlykGuzQeF5+qm/tuLxlI0Bi7bk1KPB
         kaaCIxeepJxc+w+bsVrERMbsldIXOS7SVTPk2+a3t4/mBz2tGX3njVqom9YQl5Tc2g4E
         stGU7OAnmS/MNeYJevatiO3txYQI98FzSlQYin+IoY+ifI7YLuP9i6edHBq4HjbGZB50
         act6bc+eTv7h3i04UFsqQQD/x3cXV9dIg9pkRcmYG6Dm22K3kqE6KCi61pdlqvYtdeFS
         nuTmcBFq8Yj6uOQrXq7vwM6qvZnwoh1uRw2OfmvBjWxjISD3/8iQhTON1hWLSFk/vrom
         tTjA==
X-Forwarded-Encrypted: i=1; AFNElJ8V/SIvUU8CCnh5Xz4U2s+OXBPooxLT6zN1C+cQ59EMDcFsy2hpGutK2CbvCpXpue8F58xyQQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzMbex+dei5XehuFFyw8OfDJPh3c2dLX97sjmgPisiFpT15mUH
	E+O9C0ycWGLs3dZ4fscSOslo6Ef0Hh76B7j1X5ZLxjfKSuPZHpvBXPOR
X-Gm-Gg: AfdE7cmyRUch2RmKrKddaK82wORv9AfY2BcxcVheSBtAxPZeKq8aTOT45SljH4f9Esc
	jFuV/ANUHIVmxey2+Kq+WVDlaCT8uG5UtO724LdoMxqlgqs6WbdSZCreNfAWJXO6AF8Mu8rNKML
	vmC2A7+TlxbmhUvnb8MzZGF2HJNT24kWQ9yxXMDvyxIX72UpYXKNWdJbXrGaW2XovOzGbs5yFSA
	OufO7licOE772yxZGIKg4ThKaUdmTCQjMNJdnFJmgC3DHXmqAmH1yfnPRhrmWaLlafRw5znZ/Yh
	vHyzK3MDqsRhGPthL0/HCvOrlBWMPjPDg5oQxqkURv0GfOCUwgrG2vRidPDhwBRfdOP4tj3KDpe
	Yoi90lw+TZTVueeMe1EeGgbcfSG7nwSn3RLN7G1s2x2oawmV5Lkn3+xoKYRiy5+1xLcxJl2DrmA
	AWNlaLvc0gh47WvcbbgAFqBApn+5aYlditTGka276n/EgtwlE=
X-Received: by 2002:a17:902:d546:b0:2c0:cb90:1e08 with SMTP id d9443c01a7336-2c6e2472467mr40617785ad.0.1781781096866;
        Thu, 18 Jun 2026 04:11:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 76/78] ASoC: codecs: wm971x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:25 +0700
Message-ID: <20260618110827.232983-20-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm9712.c | 4 +---
 sound/soc/codecs/wm9713.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index 83cd42fa0c28..68ebf9d23865 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -229,7 +229,7 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = 1 << shift;
 
-	mutex_lock(&wm9712->lock);
+	guard(mutex)(&wm9712->lock);
 	old = wm9712->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9712->hp_mixer[mixer] |= mask;
@@ -251,8 +251,6 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9712->lock);
-
 	return change;
 }
 
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index b3bbecf074ee..d338b9a915d7 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -238,7 +238,7 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = (1 << shift);
 
-	mutex_lock(&wm9713->lock);
+	guard(mutex)(&wm9713->lock);
 	old = wm9713->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9713->hp_mixer[mixer] |= mask;
@@ -260,8 +260,6 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9713->lock);
-
 	return change;
 }
 
-- 
2.43.0

