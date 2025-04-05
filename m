Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1525BDDCD
	for <asahi@lists.linux.dev>; Sat,  5 Apr 2025 00:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743812007; cv=none; b=vF/bsj4dFUOXI0YLPZFBH5xUYOC6zxTxx3lImaX5y+79IZeAohJDxNQ6ZtF9NWt65HxMNMMD+e9wAHnarbnNNYi+lJI4nHmvfwdAH1SwMmtNBGlGkutYCZQQ60cNNt/XGddSP4P0DLg81uGDNedbccF0R1eXNz6grPRl3/up+FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743812007; c=relaxed/simple;
	bh=f6jfQ/88AiYOjJM4FQA4xhqhbwINz9bzASTHENbgqmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WprrJnhwyIGl/dN9eaoIY4xOEZyuVC5Bi6fIsGSoqQDpXdK2kP1zmyZdclwKnw/BCIWz+uNBkB6Hi8+c0y/bH124S9t64mUdKEUH9AY1jDUNTcLG3v/jScQX5vVpDyCfkNjPDwag4yFaAdRRLtojlheb/fOslGJFdAq4IQHzZlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HSOTPav5; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HSOTPav5"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ad5236e6fd6so2336149a12.0
        for <asahi@lists.linux.dev>; Fri, 04 Apr 2025 17:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743812005; x=1744416805; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3NodibefyrwcdYV12iHxzgF1tA6aiaYOYVIR+A6BXYk=;
        b=HSOTPav5PGA/bc5CV1szXbBRpFfkRe6G7TE6XnSd0d+Uqo0j6Zhh0kNzNagTXnjuiH
         CMyhrpHeq+6oVDy2kuVy2K4aIx6niDPJ9+e1ESFt/pqszfoRj9qFgH6KW5LPvZkPl2+1
         cGwuXFU0kRdsQaEep4SkHNeyI14HwPcu2ZXRGCQAJ5fZwZch1eQBt76jj96sbu2v+yMv
         PN3SSUWIumWipdNSDqupf4n0qFUBH/+B5iL1XuMLCNYoOnGXMdjO57xTQbsymwoq9lK2
         e8ezUqk+nWds3AQgw6D7sN13Yb8rSyvkjNffMhs3OAJrGFKYRj2UNAVykPzKJikPhndz
         DfMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743812005; x=1744416805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3NodibefyrwcdYV12iHxzgF1tA6aiaYOYVIR+A6BXYk=;
        b=wpYuzy3Hw+U3Zk7uhlBy73bYdloJPWyHpmBE2C8X4CsL6KHD77Zu3+q8xSdx144igo
         vMISrz15sv++espbQPiNH2UaLEEaTLjebarR+U+8Nu9jZ7ExkL9qdSgQNqbpKFgBMiI8
         7AIheBDb7rxM1b7UiBDjPoR8XaAFQoXt+QcX7djYb7N7RT0csP3UgzAT3LnuuDc1g+TD
         4jlDHHBzeUqgA1bX+q5mfXGqV3n5+SGrf/LOBrwQqSGC+oQB4uO19KB+g34Behr4JHWT
         yyFpbKcMMBrXy+2jauXCOQ2w0TZEnjsuphOryfFYIF56OXv2S6PzGZjkLLJd8EH0xkOO
         SQtA==
X-Forwarded-Encrypted: i=1; AJvYcCX2TE4tN45yqatHLxpZu82GTfiL+oUH0wlgZuXI8cLbPGiP+NTkHXkVPaHQ/gzEpj64ei3RZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDEnOtO6ADUYXzLLuOnrMo9rYku3VUslrENiCvdMLw4hEZJ7gb
	R7pn/5t2QJ287P9AHbpNjSgtCYyXvEzbT2HFCAvVSTl7Lh7CVaWv
X-Gm-Gg: ASbGncvtqgUxWF7V2UNHdWU/aO3XcLfDVn///WU3lZ7cM/O2LLzNlTYqRABLpziGKDa
	i/lWwDyaB5dyXfmwRut70u/PWR8O75P9OYydCLAuk8s5AVyh8NAphbZTrNg6T3Mmjmdp1anipvP
	yltKmldwBUug+XSd0WBi+qY0P//FfHJtlAVZYWhWCKXoWRNGwrQI16SSJ2mlYLFRE9obb3wHbr/
	fJdwPBnsdsxFUDEfFLz2+jIzfnQmrDbaiUdGsXqb1gSvFFQwTmERqlk+1rkaIKnYTSG4LP15iG+
	IX85oXGGnG5X0oS765ZrRmekQzROKdlxgztY1JqSggXQ7MKqwsy2yYzUZftN6Y2jnrAw48FbCQ2
	mMFhNrwDqkst5c8KcVjb0dG7gNxtPb1bAOqV50lhU1HzE+AJZvg==
X-Google-Smtp-Source: AGHT+IHhYRLWPbHit70b6szW6jPN57D9CZB9OEYkJ2U08WfRInETE/q6qPTaQ+Gi9IAC8oOPoD0FLg==
X-Received: by 2002:a17:90b:5744:b0:2ee:ad18:b309 with SMTP id 98e67ed59e1d1-306a47c2e08mr6716477a91.3.1743812005436;
        Fri, 04 Apr 2025 17:13:25 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5d665sm4327855a91.30.2025.04.04.17.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:13:25 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 05 Apr 2025 10:12:40 +1000
Subject: [PATCH v4 03/10] ASoC: tas2770: Set the SDOUT polarity correctly
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250405-apple-codec-changes-v4-3-d007e46ce4a2@gmail.com>
References: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
In-Reply-To: <20250405-apple-codec-changes-v4-0-d007e46ce4a2@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Dan Murphy <dmurphy@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shi Fu <shifu0704@thundersoft.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Hector Martin <marcan@marcan.st>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-hwmon@vger.kernel.org, 
 Neal Gompa <neal@gompa.dev>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1794;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=IV6wUgfUMxyD6pt+5eKhp5GW9w/s3PRc7V37XTxa8ZU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOkfSluP+AQec+5hab1cU6a6OaDOOuGR9OOW70yGik/7f
 bMmpl3vKGVhEONikBVTZNnQJOQx24jtZr9I5V6YOaxMIEMYuDgFYCJPqxgZDlpkWvxoaP9oz+Fg
 Mc15xs4m0fofrgHWUof/e0ZMWzbdm5Fh5v1DCyp+Hdi8sEi75lHgpNkz+TRu2NTyPpr+I7rd9Ox
 OBgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

TX launch polarity needs to be the opposite of RX capture polarity, to
generate the right bit slot alignment.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/codecs/tas2770.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 55e4723044044338bd941763240d24ccfef6e8f3..806ad36397977c3fd350ba437b70f6bfcd814d29 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -351,7 +351,7 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct snd_soc_component *component = dai->component;
 	struct tas2770_priv *tas2770 =
 			snd_soc_component_get_drvdata(component);
-	u8 tdm_rx_start_slot = 0, invert_fpol = 0, fpol_preinv = 0, asi_cfg_1 = 0;
+	u8 tdm_rx_start_slot = 0, invert_fpol = 0, fpol_preinv = 0, asi_cfg_1 = 0, asi_cfg_4 = 0;
 	int ret;
 
 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
@@ -368,6 +368,7 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		fallthrough;
 	case SND_SOC_DAIFMT_NB_NF:
 		asi_cfg_1 |= TAS2770_TDM_CFG_REG1_RX_RSING;
+		asi_cfg_4 |= TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING;
 		break;
 	case SND_SOC_DAIFMT_IB_IF:
 		invert_fpol = 1;
@@ -386,6 +387,12 @@ static int tas2770_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	if (ret < 0)
 		return ret;
 
+	ret = snd_soc_component_update_bits(component, TAS2770_TDM_CFG_REG4,
+					    TAS2770_TDM_CFG_REG4_TX_EDGE_FALLING,
+					    asi_cfg_4);
+	if (ret < 0)
+		return ret;
+
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
 		tdm_rx_start_slot = 1;

-- 
2.49.0

