Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5073403ED
	for <asahi@lists.linux.dev>; Mon, 31 Aug 2026 11:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176013; cv=none; b=oiXAxSpJoS6C2ja2h3xMLtFvnSPCw8mhOeYV9Vj8BA+HkPKi43Ckzrh5z85SRQcJypfkSNhp6kMznP+pJKJ0a3q2GJdpCuFkcrZg+lhYYbwqGIONzW5W84LtD1ea69IVy1Gj4gP0ZIwd2b7sisr50iLKEWqkEoAqImlK/96tYN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176013; c=relaxed/simple;
	bh=iTXhJnYnvUyhcSvEeSQQcBq1TiwCB1jc+QCIXDOLjsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WJNLF19Ttu6x+kKPlQcPASzyGBp2Iu+R8ceCnTinbPnRTrYm9Es94ocNsvIFtwqHNr1QHqAR+GOI7S58VPYXCm5rDbmPvHn0xM2CuWL4/0wlxv78/A3Yx9ceFiocdl61t6A1W4dTspfVodra62I+9Gt90D/Ls+xaPuAyaDUCyPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTpOlbgt; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTpOlbgt"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2729940a91.2
        for <asahi@lists.linux.dev>; Mon, 31 Aug 2026 04:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176012; x=1788780812; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0V+6zXu1ZixQJ8ktO5+SKn8z2jHgggq58T5gsH9x6kw=;
        b=cTpOlbgtnSjMhayDEDKDLMc+BSANKEuVzkYBc+EJ3ttjvq0F9cXAT8/DP5BHc+ws8V
         8oM+mgwRUklYQIAFHllJep2y7qOMKrLPu08vP2Zl88MKu+Yh3eW8fR/mvZTVgrjGkrOW
         /NojbYDrhTqpDtwytXQAECqE/Y6F3QbuGA279iPLb2w1chNo6jZcfL9yYOfGWvYkhpOz
         XqstV92H/94EWe6+ESF4+oF1t0gW+6hH3/uqCL6jhqaYfScJHNZFpJfY//2x8rHBf/ns
         1YRxfLzpeVsoMQWzah9HQmS0ef5Fop93NVFJ+0WshXw7ny5YpaopD4v0VRxbzVZjle/P
         ZDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176012; x=1788780812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0V+6zXu1ZixQJ8ktO5+SKn8z2jHgggq58T5gsH9x6kw=;
        b=jv0pe4ItipPdq5DYc/3FsBBkSV6P/DigIwjJIXVIMGi8KKgJ04gByVdyXKVG+hh/0g
         oFGt1fcf2wxT9E//wO7FdRBQP/apv+7jXX8PU1inel1eXGbv/9BLpXCntMeBlFRw+NlQ
         zQBXBumRIvYJCB/AUwyfdTVQZ4/LUZDgwIlUduzHPMpQPU7soxUMe3M5lIIbTXFWUojC
         hDB+YoWbPbVfPrbpROcZXkffoOWi9r1bRb7IJ2kkNrA202NH2eu9gKNDuI902Zowkx5F
         tPWPUSwlgtSmFkfndRCw0U2AziexClAAIR0+VfC3B7NWhNx1lpvqYIRz4hiXvQJFun7q
         ajQA==
X-Forwarded-Encrypted: i=1; AKwUvBx4U/moNfwSanLZOD9NBtrU0/a5YFd0k7ZeezMmQ83E11XtxIHyEq2qjHes8tJ0coU8/pnAgQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kv+u22M8kkarALTfmcx268/8Kk/2nYz7riTv2FOVHYAh1m0TxJ
	IJMdFDdL3ZPBtV02AR/L4BjVZ12tofsN7/V+RLS0MI9Tt+wZxqcS/Tyg
X-Gm-Gg: AYBFou38ExKWwA6Xp7QqDCNWIAdWvy3aepa2qtgpVFY6jx0V+Z9ZXH5gVZtEtFuPTWQ
	h+bFAeBilGCM0qK8iiTq23S46/mf57owNcjnCkCVyEdXqezmM+/qTC8HyRcL5oZl2hDhGBNubNq
	4PhOIo0woK16Gms41akYMArL1cy4b9e7/mdOmPoXhewkcOCGlGrh4WxfN/Kkx7rbJsVtlXa0xoR
	/ikrQhtbKlBsLZy21QQKq8AbfNFelbdkP3sTzkQ07f6IvIxx4zTcV/eavW1/okS64e7YMz6c3NN
	yPuoYPdNKwbFJT0nXjr7c7pCbc/HTbtK/XgcMOeL7mRSR08Jg6aGy3tHeJ7bNaTTRQK/sNBrpAM
	/HZaAGNQT1EPi4Bke9JaA+gW6ZZakPh0A5rWVsvSlQlEIDxIfOfAxkzo1K7wXhUE1oMiWoNyAX1
	GEgM+wAdqeX81fRetMjUsoDMtqTYUWolH1DzUTifzio23V1FHkSn9YRm9wiT1sj5dOPBkk1CgHn
	rstClg1bXz+NM7HOxXYW7RolhDr8R/y46H8C/lY3wCPrT2FgtyS1G9O8rQcKTugWOXa9vLtg7CP
	0YBBOOfoC4RF26nLaxAjsAt8UZRy7q9ndGNV
X-Received: by 2002:a17:90a:d646:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-39907231958mr322558a91.0.1788176011913;
        Mon, 31 Aug 2026 04:33:31 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 31 Aug 2026 21:32:41 +1000
Subject: [PATCH 3/3] ASoC: tas2770: Initialise SDZ GPIO low
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-apple-shared-gpio-v1-3-e855b12e18ce@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=iTXhJnYnvUyhcSvEeSQQcBq1TiwCB1jc+QCIXDOLjsM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlT04p0ojMTfJ47b7SRnZUfffPPzFsJ2mILz5YKajz7v
 DCFiZO9YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNX7BBj+2Tuf7OX2/MlUtqT1y8kYbgfvZ2sehv49cGLzGy4/i/pnZYwME77mzdr
 ycp8ic9rElYYiz4IcBZ6ZaqXve/UiTX3N7LlBnAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

On Apple Silicon machines integrating TAS2770, the SDZ pin of all
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
asserts it high, allowing any codec to pull the line up when
it needs to.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index e79754edac5c..ecc37d4ac00b 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -886,7 +886,7 @@ static int tas2770_parse_dt(struct device *dev, struct tas2770_priv *tas2770)
 	if (rc)
 		tas2770->pdm_slot = -1;
 
-	tas2770->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	tas2770->sdz_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
 	if (IS_ERR(tas2770->sdz_gpio)) {
 		if (PTR_ERR(tas2770->sdz_gpio) == -EPROBE_DEFER)
 			return -EPROBE_DEFER;

-- 
2.55.0

