Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A2A3E2740
	for <asahi@lists.linux.dev>; Mon, 31 Aug 2026 11:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176001; cv=none; b=NYtOk4OFNl4o2AbU3S+PjhHOneOZ5rZW0/R2fZy/cu2IsJ6WlMipzDdd95RkwzWP6wQmm92cu59l+OYizxssoXuZJH8cKoN57G8UPuoIjqaniLvuxsRK0N7baTefsYPR1mmHM4F3HOU26d2fycXqzXN0raqdUINtPVI5LE/vAKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176001; c=relaxed/simple;
	bh=ZRo1GcG9w93sfzG7bw0j1Jl6KpqxxS3Chp+d8qV6No8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XvR8p5y7jn14z8U0C58D6wx8pVlv/k3TyKRaPpe+Otu9A5wH2OtoufGKXpGKNqSACeQDJd7+ouSE9yB+KXfX+osvCFuzKuS5oSBZ0GEK9d3kPJJAHNuVumpBK0ST7GpdmK3himl2gLS1SML1A8/4ZAtgsOUtdo245MuVhM3VRuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+RsRtUU; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+RsRtUU"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2759363a91.0
        for <asahi@lists.linux.dev>; Mon, 31 Aug 2026 04:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788175999; x=1788780799; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dS9uXLr3qezTsn5dVmuEZ66xzV07pi9cC42Sze/GMZE=;
        b=A+RsRtUUFdWbQTCSVDrgsBg5F2XZrUJPGR/21uekI6zANl1sSuRcdh8wgj/sk3+IXJ
         AKFgOOJ5RYvdWCPHXxoSBXjBsGTYFCYgq58KA3ix+Blic/tn3GWcVOloBzm77S+5kHP4
         +5uo6lK5tZZjTEur/egHupBwZP0uADGOJA5QwAmjn1u8zEL+ZWdaQEKxj3i9jXX88MAs
         kbXeHc5UM3uriZYDl+NrtPkYpeh9lWhgLDhc4uTfiH+QbaeWdVMF91lFYl9NwXvc4gZ4
         D5ZpZPwOF5q7lF1lD2S1TJVpdwjHf3SNLsq8GfO0VuD9LlQSmV12Ufaxr9TriIUI30QG
         zWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788175999; x=1788780799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dS9uXLr3qezTsn5dVmuEZ66xzV07pi9cC42Sze/GMZE=;
        b=NE+S5t82m5mThaTi82afudlmfHLIOgKW8F8Q4kyVL96F2YNCi+jcmiPelDgMkghk3u
         z3QFcxYBUMI/12Awd+tmziaN2aw2qi9y+SwLfYCi4Fo5YMXxd3iXkfoUD8us7MeqELq9
         vyF9ZYqYw/3jzhVph9MWBzuWONPakXkuiGsKArzNRt56Gbc8/tM5m3lIiNKIdIV2cA24
         VB0g2bwOGFXccb06avbN8vbEYxvIuoCkqTOEsYC0GB3PqVtoMbd2kF9lWZzRgT7KhS/L
         M3Mmy8Td+PXWPY9S2dEcNCPOARp5KOrCeFMw5bpJLwalXHiANDLwAzKv1nW+pWo7Ncw6
         tedQ==
X-Forwarded-Encrypted: i=1; AKwUvByoDzGLuKp2BVW4WYXBK4HHNL6XkSwVQa/pn5awftGCzpZAHgPhEMeksGCXBvS7uXJ+IMr2eA==@lists.linux.dev
X-Gm-Message-State: AFuF++kzDx6Hu8C1hPnuJZX/7DFndRwgxlXLUXtk9kBFM9EiBLOZusK+
	uqzAJaUNvFwbZPCjcuQs5Jf2REzwHCI1M2I3xjKodLytfJ+q4PQ2mrzo
X-Gm-Gg: AYBFou0ITx3kf+TBGPDmwx6gAXMZtg8oHYTi4fwY+RrJPe7mm5qwU6dOGzwatl1p6wT
	OaMvzoYvNdHBLA0SlJbjU42o/GMmm5KCuDrntP6SCR+PAcsIKTTlan5OQgVHbr+r9gkF8j5RVKk
	fcRc/hFCPLPz2bQNpDeSDT8bqttOjpInEo9ludE7ly5MegG0gIdlKZ8LqppSVwHwAgcFA0aqZE/
	I4unrMvHB0EPBzO44hXddMVxdZeADenNDSvSH8rKjD53D5svNsYfFnMmkQDSq+IbF9PYbhEHDCm
	XwlLlPHN5z4tOm+CfKRFIrSSUZgFCnRxjYs/swAfklGIig0lXnINBani7pupEkcHfF6GjRWHu96
	9Q6B3pGEeYBUCv7/yr2DDWJGK4HiHtlENJ/zMQH0Lmymg+ljfhlmAVZZw55sWWVVr3d8wjdDSQZ
	4HHLWU6CQ7Yco2RuTflXMmTmPzKEOMQTRAoP+oCeENLT8D3Q6oiOzZ6orXj/In10CGeN1A3buAG
	qViPidecUGoX0SSBMX9dwie/9zCIOq9lk4G/59RBhtZYofXPsg3r2dPR5VDweQ/35OaTEHb7dti
	p5kvIYlhesHF/gh7vVIZUMmFPIZe6oITAqvaVyHqwiq5KPE=
X-Received: by 2002:a17:90b:564e:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-396d0ee7010mr36676598a91.6.1788175998887;
        Mon, 31 Aug 2026 04:33:18 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm34111826eec.9.2026.08.31.04.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:33:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 31 Aug 2026 21:32:39 +1000
Subject: [PATCH 1/3] arm64: Kconfig: Select HAVE_SHARED_GPIOS for Apple
 Silicon
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-apple-shared-gpio-v1-1-e855b12e18ce@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=785;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZRo1GcG9w93sfzG7bw0j1Jl6KpqxxS3Chp+d8qV6No8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlT04oMJE42LXo8Wb8t2cF478qDHBbL2O8eXvXK6sppi
 xrf9ea7OiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFOdVc/IsO+wxZql0dWHOg3v3+Zhf1SSpPpFdL3D47ja+qai5Xnyzxn+Fzp47bW
 +9UfwAfv7oB+f6lvnPa1f715rdE43Q2VuygRdFgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple Silicon Macs use a shared GPIO line for all speaker codec
shutdown pins.

Select HAVE_SHARED_GPIOS for ARCH_APPLE so that we can use the
shared GPIO proxy infrastructure for this.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index d2acfac73003..76a6a0e6ae4f 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -37,6 +37,7 @@ config ARCH_APPLE
 	bool "Apple Silicon SoC family"
 	select APPLE_AIC
 	select APPLE_PMGR_PWRSTATE if PM
+	select HAVE_SHARED_GPIOS
 	help
 	  This enables support for Apple's in-house ARM SoC family, such
 	  as the Apple M1.

-- 
2.55.0

