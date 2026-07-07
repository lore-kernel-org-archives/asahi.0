Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B809381E81
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401163; cv=none; b=lJxR1QtlciNSwFeG8ksebwmRPTRU2DmVma2+z6WkHD1KeufZ/L6sks+PmGJaBntcbFQBfqB/lwl/LQF+KsdMDhxIzKgiLjXDUUuX693U5CPTKD3tf1l3bH3accxE0Ty+fwJj/Q6dT007SYDzhu8sVlRnE4WifOjlNzAM0M1QSg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401163; c=relaxed/simple;
	bh=/r6IWp2lq/IqX/xitXazGqvOEQK7A7aRycIG7RzU7kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5zhOnZoY5q3u2efRte6B5JkPuBNM9sQ/KsvYtjS6F/cXohHyOozz086R60PHtgAy3YOTavUJ0Nmc/5pIdWZoZ3VOS+h89w0SAdTKMDezboTqAQ28dAJkmQMLemkC0EG7KpO5NN1VBpYnh347iHydWe7KVvu1NkejooqZqC70eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C/RZDarV; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C/RZDarV"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84783bce476so2716010b3a.0
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401161; x=1784005961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mtl1X3tKc/n7QmmaBl4vTl93wYDxMzIpl5/tn8Gmn8k=;
        b=C/RZDarVF2z6ZckSbIJUaerJqH9jQTuwM9ZpKBOQ5jAjJCHFlT0kqY6IJOYbBHy/hY
         Ts+3uXEMqUMJvMA7JclYC3opAb4TGBDtQBY/LLRq+RQ5VQ3G+uTJ5chjtBEPQhsA+8ri
         e6q3w8c/9vn965LWaCI3J/lf5lvgXOzSzrJ1r/2gNs3IhCANGf0XTNsGUYbtQNItb8ze
         6CCCosTeoZ1hzxaMFPMqsKNTnm632/pfMpNlFX6bo4fJ64Q47ZUbXNZToNECn3zUhTYR
         p9jOzP7pDLTkIe9pergj7u+ujydfarVNfCA9SbndytYwCSy1T9uARoVc2EQSC8kxL5wS
         52Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401161; x=1784005961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mtl1X3tKc/n7QmmaBl4vTl93wYDxMzIpl5/tn8Gmn8k=;
        b=JuC0IlKt7EkYZ1M2j4e9sQb6zfDdQLMIfmkF04NhsdBIxXGsvckc1pbdu/d0UDITnL
         BdQ7ixckDO9YaFGIL/10fQjRC2Or+oRVyRtU4Zz5Fg8e2uu1j/kNuHbYaO4D+lOHUpgB
         rMawzdB0g8R6cJ9EpocbAPkFIddhfU9OvFUgXEOHbstGd/2s+8pHZlbaqPaxXc4cypo5
         LvPCLtCDSfSVQizNsbbIdCwtEqCRTPoS9Sa5oUOGluh68tlocdGwPXGnadPj2bObsdOA
         skdtCEHmC+8kbGfyNSLJiE3Eaz7X1Fkjb3MR6jZU0yGjA+fZLrARhQ+r4Gh9ArAXsqPH
         oYXw==
X-Forwarded-Encrypted: i=1; AHgh+Rqt+GPRAErWvb8vPqeGZ02jYxsxSr4Xqd0EIDqbLSvzI++QOrrbTtzzKI7T5RqL1E2yr3SLLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyuWdJyFMWIgVY9EbPFQiRswz6iP016hfV/+rXgGtLDgmrKiZs1
	wxiOcAgW+O+H7BcDkwufN1nckdZltrozBnONO3Ka36O1PnT1e5/Hf237
X-Gm-Gg: AfdE7cmNg7U7bdpozwbVhJukGRj7Luxi1bEeb15oJJN8XY8NXltjRkibC6peUBDl78k
	G2BFjQrMIMyiQRf7YLSR1kF/JPypEwSP7Z7iIwPW4mWg4Z8S1/Ix5qM2aaI8tjIkrkzMlxH/nfy
	R7IcU8zZ1uk/VZ4bjAdy3wD8ivx6BVyjTUctp5q33NnZyxopbWAdrN01KT5csTmoXFQmPFQV0K/
	EuaCvUYQADNIo/UUxSN1iuB8I8EX5Y+InLPhRgWem559DIzGcAuaMKh2FcqJ4RlElb3Zj5K35ft
	QkmJRa9w1hqb384aR8rmZzNKAdcbxW42zFSnUV8O9iEm0Iyhhd+WmV03D0AnhSIS9/qL/0vLP1O
	5tzbRDltLMhaW/lZT/wcPdUyLhjtImjbWcRA55g72X+e9J4LSAPbrgqKygebf1yB9tqRKBX43vX
	doSN0cDtS8tWb7+HRK7bYHqBZ5zjnKJDhfr4eFmBerBjZhwPE=
X-Received: by 2002:a05:6a00:8d8e:b0:845:c662:2be with SMTP id d2e1a72fcca58-84826ed02f3mr3771280b3a.42.1783401161134;
        Mon, 06 Jul 2026 22:12:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:12:40 -0700 (PDT)
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
Subject: [PATCH v3 12/24] ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
Date: Tue,  7 Jul 2026 12:09:54 +0700
Message-ID: <20260707051006.20058-13-phucduc.bui@gmail.com>
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
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs-amp-lib.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/cs-amp-lib.c b/sound/soc/codecs/cs-amp-lib.c
index 371e99205b58..41a9a5b005c6 100644
--- a/sound/soc/codecs/cs-amp-lib.c
+++ b/sound/soc/codecs/cs-amp-lib.c
@@ -7,6 +7,7 @@
 
 #include <asm/byteorder.h>
 #include <kunit/static_stub.h>
+#include <linux/cleanup.h>
 #include <linux/debugfs.h>
 #include <linux/dev_printk.h>
 #include <linux/efi.h>
@@ -83,10 +84,12 @@ static int cs_amp_write_cal_coeff(struct cs_dsp *dsp,
 	KUNIT_STATIC_STUB_REDIRECT(cs_amp_write_cal_coeff, dsp, controls, ctl_name, val);
 
 	if (IS_REACHABLE(CONFIG_FW_CS_DSP)) {
-		mutex_lock(&dsp->pwr_lock);
-		cs_ctl = cs_dsp_get_ctl(dsp, ctl_name, controls->mem_region, controls->alg_id);
-		ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
-		mutex_unlock(&dsp->pwr_lock);
+		scoped_guard(mutex, &dsp->pwr_lock) {
+			cs_ctl = cs_dsp_get_ctl(dsp, ctl_name,
+						controls->mem_region,
+						controls->alg_id);
+			ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, &beval, sizeof(beval));
+		}
 
 		if (ret < 0) {
 			dev_err(dsp->dev, "Failed to write to '%s': %d\n", ctl_name, ret);
-- 
2.43.0

