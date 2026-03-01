Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804AD31AF31
	for <asahi@lists.linux.dev>; Sun,  1 Mar 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772352401; cv=none; b=VLOTvaJ9R2A+0S8EuyeYBBrURslRKCv0ErnPAJT9475az0iFpIjFqI5wLIErkGgQyZ8/8fOKrNRzIHVRfG1L+rR0hs4dU2VRlDjB5NcQmtNwamaPFh8mHcoGB1NB0M7TUp0trBKpRMt7eAmp8zb0SE6za4+d/mCPcR1JPOUGT9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772352401; c=relaxed/simple;
	bh=VyTWRPS81+vOo86P7NyB7zBl67kC7Sarhern+hi6yV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5o3bMaGLpwAdd2+YAFmkQr/iNhtJMt4pumS7li/Tm8fptOvnG833vd2DUbxRnGgHQ1aZhDEtLKCDml6KjjNwBMx3JI83ZWNwML/GxrcvczeIIVcfOzg7bnwZYCUkUdwPsr5kI6aFMPpAVB0OhnKQz8g9oMuxGasqKPDciuf3hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5mydJg/; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5mydJg/"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3598a09fcb3so53635a91.0
        for <asahi@lists.linux.dev>; Sun, 01 Mar 2026 00:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352400; x=1772957200; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COktpS70G1jBT7Oq0awQeJHx1NZJeipbMMF36OzY5Z0=;
        b=G5mydJg/M5hEacYUwDj+pslnMZ1XJUGnqH4SrTuv6a2KyktJvT+8Dz5K4ZH+DzkDPc
         OnbXUIqvmugGKZIBjM/Wny0NG/O3MfS5eyMADvAHjp0s/6s+IMWJuje9gEne++ViQfdn
         FZJeRsFVLYgjjdw3IshIPKwTfHeUxqJN73xDFmQQcS+10HgzjaJ0z2Up0Sfx9BZJhHZO
         IiB804pAXr8sUK3t1UgwEVFSSxMAzKec+8RsAmEUrxNknUd/aQZXB0Yyf11f55XA8w3v
         p758Obn9MHh+nEsZY5eX75gvPrh2RRqF3u1JxJhnP3CMISnAlZL5AHK0vv0rNFMce1eu
         xaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352400; x=1772957200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=COktpS70G1jBT7Oq0awQeJHx1NZJeipbMMF36OzY5Z0=;
        b=dBzoihlonMe5P7wdNzmOa5I1hF9kUrTSJeyW54ueLlhLoQxZ82ffdxn4zRuUBPz5Ph
         amG7CaUQWybLyq/dc30Ao9zH5bRWhYmKQI+YrQFHBxsj4X0nIYqxpdtuSb/3kSP/s5zm
         GTB8HvTni3PYiNkbhwje2Z0LUrlsU5eb/EPBkBRxmZ3nK6LGgtvZYB7nLSfRWfiQbDL4
         isoKi6VjB+hD+lP31DVIySzEW/9rqhRp0eM14aH2kTl2Ump1p2c+EkqXKISWvIjx5CrM
         PUTJj7XGq133LvRjkgPYGDYbzqmjsckQhOE/sirmoVhOORnOW7ltcA/JN+JdiXtpUlaG
         tJXA==
X-Forwarded-Encrypted: i=1; AJvYcCUQonebU0H/5lafkxWaPuf4pZEtc6x8x+yRIZOT7vvA0QVDkdj3OIP6ASuIcb29dwcpxqoFrg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRG3uolgTF8xFlaQ+CWru0DHLFstbfRac8wGAwNYeXbtjkIRIL
	4tscd1OY+rL/d6i//bHzW+djzD7TV7Q7kW8wx+R4W6QRP5Rp/yqmK4Bv
X-Gm-Gg: ATEYQzylK7XkmflYOO5Vk7z+hOIkYcrIQvbz2p0oe3E8dyGjeBn4P4T8VmyRESw4CzE
	0wcgox9fmE2DK1Bs2iQbSERxUrC6ibnCPPMf1sqEjJAU757uGDPKYJsUCXaTjHEGNkSj9hM8TWS
	F6KFzSuYRcabP0Z6TxSiXCa3ltiX/o8yyNjW9VK3iB6HiqDpCU/OueNgJeEx0D7nTiq+daTmPdR
	e1atfqXiEhTLI75hYl4aYNY63a+gW5fh+KoXdfkBQUm1y4ZG0+8FfNDuXjwtZrljaDHTmrn+Z0X
	XpuxbtEzeyqT1KpWQ3Wl4/Q80vDowlwjJRwyfci3Y5XKqhV5Gxr7ND9dBzSQgvGSozCIGDY9mCG
	3jmbGVXOdHSLBl2dC423rqwktIvvOalWsSJfQRIKOgwkNvl5Qyf4cQFuaHmuZCgrsTmdlJNHH6p
	/+3jNRiIX954N9uSJPDvY9uhn9RYwRmEgOMsGkdh+088EYzL9KSIjxpothyR0GJCiYvcIX5i2h3
	Yfnq7vkS76l9bNPQqgS/QmgHD0R6I1BWzFSJeUYddZVsoW+u7dfodd4geC3EBexniscQa978R/X
X-Received: by 2002:a17:90a:fd97:b0:349:3fe8:e7de with SMTP id 98e67ed59e1d1-35965cd1066mr4480685a91.28.1772352399832;
        Sun, 01 Mar 2026 00:06:39 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:39 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:23 +1000
Subject: [PATCH v3 4/7] ASoC: soc-dai: define possible idle TDM slot modes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-4-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
In-Reply-To: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2335;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=VyTWRPS81+vOo86P7NyB7zBl67kC7Sarhern+hi6yV0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6fXyj+ot16S9/zirdpppzcc2LDlnapn6bXO1G+Hz
 6y9z3LmXMdEFgYxLgZLMUWWDU1CHrON2G72i1TuhZnDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10jHWMGLg4BWCqJ+gx/GJO9N22/us5k96pFR4/V7C08c4w3xVVcFidZcP8zCcfjNIZGQ6lTXT
 u+PN3rYrwtOxN968V75nySMXRV/eSfPhus8QJ+iwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some audio devices, such as certain Texas Instruments codecs,
include configurable bus keepers. We currently don't have
a standardised way to configure such hardware, and instead
rely on the hardware initialising setting itself up into a
sane state. There are situations where this is insufficient,
however, and some platforms require more concrete guarantees
as to the state of the bus, and being able to explicitly
configure bus keepers enables this.

For example, some Apple Silicon machines have an odd bus topology where
the SDOUT pins of all codecs are split across two data lines, which
are summed via an OR gate in front of the receiving port on the
SoC's I2S peripheral. Each line must transmit 0 while a codec
on the other line is actively transmitting data, or the SoC
will receive garbage data. To do this, one codec on each line
must be configured to transmit zeroes during the other line's
active TDM slots.

Thus, we define seven possible bus-keeping modes that a device can
be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
(actively transmit a 0), PULLDOWN, HIZ (floating), PULLUP, and
DRIVE_HIGH.

These will be consumed by CODEC/CPU drivers via a common DAI
op, enabling the explicit configuration of bus keepers where
required.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 224396927aef..44dd06add52e 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -52,6 +52,21 @@ struct snd_compr_stream;
 #define SND_SOC_POSSIBLE_DAIFMT_AC97		(1 << SND_SOC_DAI_FORMAT_AC97)
 #define SND_SOC_POSSIBLE_DAIFMT_PDM		(1 << SND_SOC_DAI_FORMAT_PDM)
 
+/*
+ * DAI TDM slot idle modes
+ *
+ * Describes a CODEC/CPU's behaviour when not actively receiving or
+ * transmitting on a given TDM slot. NONE is undefined behaviour.
+ * Add new modes to the end.
+ */
+#define SND_SOC_DAI_TDM_IDLE_NONE	0
+#define SND_SOC_DAI_TDM_IDLE_OFF	1
+#define SND_SOC_DAI_TDM_IDLE_ZERO	2
+#define SND_SOC_DAI_TDM_IDLE_PULLDOWN	3
+#define SND_SOC_DAI_TDM_IDLE_HIZ	4
+#define SND_SOC_DAI_TDM_IDLE_PULLUP	5
+#define SND_SOC_DAI_TDM_IDLE_DRIVE_HIGH	6
+
 /*
  * DAI Clock gating.
  *

-- 
2.53.0

