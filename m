Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D34939FCCA
	for <asahi@lists.linux.dev>; Mon, 31 Aug 2026 11:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176008; cv=none; b=S2TE5qUtDChvHGcWCltxQx5UUjM+qTY553sqc1WC8HqG6fkDWAGBakEZK2AI+ywshU1TCQk6Vrvd+kP/442+BzhQuO6zI9+WHlxENkSmuFswmOmhcV+SyPLnmhV2B4SSr20hz3WQCVC0un40VOv7LEtTJYhs3J8rr21h79cbzE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176008; c=relaxed/simple;
	bh=h18x5qh3r/K2uj+PUBPj504Z+VgTxPWjoOZOzfgxBqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GaBVegYQUFbNoONty89rj14pmjxMGzPF93Py8QBSoeNSEIpPB7OhsGZb2Ji61zlQMq4TdW2hDGyhGOvSvkjkefpbGljk5rxD+QKeIXMDrvVNtBtQgjbU2X5eGCCtADWqZSFC6NoHNrFfgervHh12zClxvlEWsJRBlC7ku3ZSJqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4PC7JP/; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4PC7JP/"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6fe26ef1cso33787855ad.2
        for <asahi@lists.linux.dev>; Mon, 31 Aug 2026 04:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176006; x=1788780806; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XW1fv0kwi/nQ3dGRXBHzXPUX6o/kxBDhAxFNh3mGUUQ=;
        b=n4PC7JP/hznzD+5jA+RRqfakCfPvz+nRpFoY8cbe25R4YIsXcxi0Atd6FOlK9UOvDD
         I+mGEYZgfrioF+lyFtKqHP2nHHSUvsJJsgfsXdFZmm5w5icaohsPH9sXEfiL+E/eErXm
         8K2Q7Vtqx7xF3Yda9T0z8vIf5BE3iDUgm81r+OWp45vuSeXGQalJv+0wMp5d1SMB6rbv
         WEPy/r4ah1kZYWkzysFAleWry62+OJdLPsDsDl7YljNHvkNyOrjCvD73XvNvBMvT10N+
         0YXTNtaH9dP1K6s33Bow+LLJQ/fazBBxQflMk+/bPSBEIfqSLUAIQfqhGssOR3keCf7W
         4bhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176006; x=1788780806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XW1fv0kwi/nQ3dGRXBHzXPUX6o/kxBDhAxFNh3mGUUQ=;
        b=e6t1NaipN7GlmZqoJ2tMIAtQQeZ8SSKjH9ZTiIT7drteaEW3aS+LKPADQsSlYIu2NQ
         ZxhUCIccxoJVpm/Uj4VVn9T7jCyuN5CHdZ/WN3+8msBV6ROJC/j0i3Uhi3kDVNSe0MXt
         wjKm3Md3DBlmHR5hrfTvojOP6o6JSM8tEcbQRfpirG4f43qU+f+zf05Ym2B+pj4GLhK9
         lmjigxiJXDGdZAVfhcVNSJqbmqM8ZY0TB/ngfGs3gFGOLhUE7NXMP/r1JhFVoM3v6+z9
         868vvFitQA3Q47vKSOSuRWo9bVbIrvLMouy67PgVVkO7MXHAJess2VrxiscJyVMS0WjR
         rO7Q==
X-Forwarded-Encrypted: i=1; AKwUvBywvFmFrfRiGqeMPKh/gBoHgaAW/Dy5naTZsbOUBWUB26Dv/mPwBXCWemcr8zHBpADMqHcx4w==@lists.linux.dev
X-Gm-Message-State: AFuF++mmot3rNAw0aMxgMZBRs3WfO6bPXDTAoaJP6ouEA5z99Kf8c4xa
	sGnCFgrzirrVG3tMaRYfUgUs8ipZwretd01MQBr8mUUd40nnIMK3QEob
X-Gm-Gg: AYBFou2Zosn9GyQS/WcbhSOGJBgE86hG8sxNsZywrjTifjNXcc/1V70B8ipCfjtH+j7
	tVDcxn42wy0DupMbvnY54mMQAB83JAaPYhkh+cbe0EVgQn3FwuLncSZgj8gzhWZEU6JKEPTghFo
	bM/sjC3GuWmIf/QwDQ2WKBYN/AwJNVnePplSjz7CJQH5T/RbonhH1FYekGii6NjMnuyrVcisEsE
	pWx+To46kejGrx9O/gBSJwu+pkyouJFOUNMc6hY0bmk4fh5wLC7sDY6BOF10FM8FVdbPTJONTmt
	en7HKFWpC9EYA/tmIJ3t1ztjPTru4edjMNHektgRYrNakXiE85GJQsp+k8zkalCDiiAzPixknje
	e2dg8+a548VhFnHNMnSIoTnbvvJ3tGAayZhOT82G13TbIWPmbfhgib2XAPhdlbeMn8hW8kRGJVl
	FS3XtNn4L+wnutKN1JL/9hOpIcrlYd4uHM0uzsBRAmV0t8JnTtxY0VTXfhIqlF5NYDj8YCcewxE
	+JiPF/AMBhVd49L15cQ2zed/KuiSEZWSlpaf+t5M20Nek0YdJDeP5RqrIHU6Cf9iLUjCQEDbOiE
	o+988yzRSW5FE6KuCwXXgWryclCQUlkbbWn1rbpVIQ9ArJI=
X-Received: by 2002:a17:903:3884:b0:2d6:3c22:993a with SMTP id d9443c01a7336-2d74dbe96fdmr395526865ad.3.1788176005776;
        Mon, 31 Aug 2026 04:33:25 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:24 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 31 Aug 2026 21:32:40 +1000
Subject: [PATCH 2/3] ASoC: tas2764: Initialise SDZ GPIO low
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-apple-shared-gpio-v1-2-e855b12e18ce@gmail.com>
References: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
In-Reply-To: <20260831-apple-shared-gpio-v1-0-e855b12e18ce@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=h18x5qh3r/K2uj+PUBPj504Z+VgTxPWjoOZOzfgxBqQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlT04oyv55k+3NF4cXT29vvFYhfSD7A7TVvhaD5tDAH9
 U6pH3npHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKn++obhr6z92WVLP/QJBez40W5z6LJLu76SzCUd66dqfr5PlhS0LWL4n97hU7y
 eq69PXNms5+onSc8fF8QLUtttV3+6clXGQsOcCQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

On Apple Silicon machines integrating TAS2764, the SDZ pin of all
codecs is connected to a shared GPIO line. The kernel's shared
GPIO infrastructure relies on the first change of the GPIO state
being marked as its "default" state, and allows any consumer of the
shared line to assert that state without consensus from other
consumers.

If the pin is initialised high, the shared GPIO core does not
allow the line to be asserted without consensus. This breaks
resuming from suspend on Apple Silicon machines; the driver attempts
to restore the codec's register state and fails because other
codecs are still holding the line low.

Initialise the SDZ GPIO low so that the first state change on probe
asserts it high, allowing any codec to pull the line up when it
needs to.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2764.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index f9c65c9f6d0a..b3c08d106dd7 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -960,7 +960,7 @@ static int tas2764_parse_dt(struct device *dev, struct tas2764_priv *tas2764)
 		}
 	}
 
-	tas2764->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	tas2764->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
 	if (IS_ERR(tas2764->sdz_gpio)) {
 		if (PTR_ERR(tas2764->sdz_gpio) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;

-- 
2.55.0

