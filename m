Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E74223702
	for <asahi@lists.linux.dev>; Sun, 21 Dec 2025 09:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766309828; cv=none; b=B9gRKx4BxWumbqG0mc0DOhBcT9AGcM4hys//j5iscSLHbPmYzn+ysZ6Vsnzj62l3N35PHxiojnMEnrupTqWCVWd+9pvg7AQHtjEq5vho6AP7uMlHKD9k6pfJd6mTCsc63fDC3FFUiQiyqsOa6QS6U9YXwQEFgKTnVzf/OTpXk7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766309828; c=relaxed/simple;
	bh=dYxrT04YcQdwO6b5nzPFQQREgLbm70Vca80uGYbXBbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cgbDlzT1PT8vKD2OTCyixv/tV7wZMzEuYaipxa5OrhFqxeMzoTVuTdDytNdGU1vCF8+3/VMY7hD22+L5KlH7Tc+U+BSX3CftQk4AspN1j+ruJJvzDiinZDfy2W98Hqb9qgOtvPMVbXIheWo6FpPtR3MVBBrlL19Hdmf+KabquNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFKNiWFE; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFKNiWFE"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29efd139227so41130475ad.1
        for <asahi@lists.linux.dev>; Sun, 21 Dec 2025 01:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766309825; x=1766914625; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=loH8pZ21h3HnsJhHTf084VIuLNxonqEp7O6yoOmUAfQ=;
        b=BFKNiWFEynJ7f9v1+UpjqdmVYPFmqJqRUtQEwiprVAczh8h0nW7OclrQ57OHXKD2nT
         jAld6dY0doyZzdPl/JUUgi6jgMTTUkd18mrooYwWCx0lUkahOV2C3kvvCmlAcSLeiYY1
         TbQUgY1wO11KjoCWPdPZdIqPclehJMhIhkJdypVpD5c4OynBl+BJUqTUklUyDPPPeEpG
         fXEx2Vkx8ukydLNkTv9CUcZXZzxGxUqmQPlXJMXByevHw/JTNjel1MnNPEbP4GR/olhZ
         2OaqfKjMi9+YfXlaceXq0Xx8jkEV2JExW5F4c+Ttd3609Dqywi61uvNY8vItxHE8o11X
         sKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766309825; x=1766914625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=loH8pZ21h3HnsJhHTf084VIuLNxonqEp7O6yoOmUAfQ=;
        b=gIA0GqqBj+fd6Z8Tmfg52qebj46ZFVdBFFdNJQCAFYt2jQtSqO3Qbb1endZZ6Oc3Ub
         GS35QiylDqH+wJHt9v993LuWD4GXxigECZEbZpMQ0vC1LXrYOd5vUInniO9P3SDh4kPx
         Z+Mi6WziXPYh827Cyme0au/NOO0XHf4Y7YQ6xfQGaw0oGVfnhIkMg8avTXwqRYN6rRg9
         S3yS3RJUqMi7GC/kM8RVHCgYf9ZbnUMGxq6lrnBkhvKlw53edLzXh8losbApZaEM1urn
         8AYrcTuuH3cYty9enXe3HEr1d/gZS8dY+mC2tQ5o4C3FH9QcPW7n+oTTxHerBPGMWUzK
         tp9g==
X-Forwarded-Encrypted: i=1; AJvYcCWkSSgvY/wX8urU4G8po+5FoQh7wH+hXxwahp/ot9QK5siexRtvA53yaaItYp10YG8a/z16rw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7rkWJ/DMoxc6NJCf0hMkaWWk4ROuAZCdlQvjiJHUPdTJDrzJ5
	7r61Xl4zehlNaAr91fIRzA1tFq3++/tWqIYR+JvnNNrmsGJ1Y80hK9uM
X-Gm-Gg: AY/fxX7pt4J45wrxfO8MYOBUGEPk9vTrCiB+4snuf91Y1QeAPCFedaWvHq6sQI/TqK0
	GjL7f82uTGIjvXm312uuBMBRXdmbUW1jXD5DdJ4GWhBJZPFf/OUI0IOzH/McaYE/wGHsxKxt6Z8
	ZWagQ//2atieIkU2L4bxUq/Yy1Wfn9mAvIj/w/ag9CfKlpNrIZecdH3T7BrQCI1GG+ciI59JVZm
	iwu/4vehMyONCfSPVbCZBVfI4Q+tnGQ9myslUq3WE317X+W0WyjPi9ChDmeBh0JGvUuGAErxrKn
	0edfIXNt6vVn59EIJLhe8/RQ2dscw/MD31nEWoTqK61Mnm0y+RIKKVH4hurce9r/mTbpuWge/Zz
	cty0zIwiENFRlh3zX+sO0cpn22e1yYynOfe0zLxttU7cENtIXft7pJJuM69tKwcFm7LTxizgAgW
	38f9s22/L3ZgXUfNAibmwuMmweIytt+DYRc7MvmCIzhPhVqv5tpTmHBvMN0VUzbXSeszsKvAfv2
	szj8wHycCUgDJKv0l31co7Jent5/Ew/YQ1MMRbVTYhx4OBwDG04hehuBH0gl8OZ41czvEncEVCN
	z9UvXatrxl86+HSyKiRNgEpFoZZxoIGzmMCQ/ErqnasZwIMEWkA=
X-Google-Smtp-Source: AGHT+IHTEvxzKwKOsqk6jxiFy1KEjLTBz6tFUpjwHXJ/UFHqcxf2UMgauXjpc/2YVHZ7EdAOXNaDmg==
X-Received: by 2002:a17:902:e803:b0:2a0:d5b0:dd82 with SMTP id d9443c01a7336-2a2f2a420e1mr78890355ad.61.1766309825148;
        Sun, 21 Dec 2025 01:37:05 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d363sm67629495ad.62.2025.12.21.01.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 01:37:04 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 21 Dec 2025 19:36:01 +1000
Subject: [PATCH v2 5/7] ASoC: soc-dai: add common operation to set TDM idle
 mode
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-tdm-idle-slots-v2-5-ed4d96413aec@gmail.com>
References: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
In-Reply-To: <20251221-tdm-idle-slots-v2-0-ed4d96413aec@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3972;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=dYxrT04YcQdwO6b5nzPFQQREgLbm70Vca80uGYbXBbc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnu+yf3en2e913tbLCZc/CEUy8ENxvx9r1wfNd5xNuJt
 63AcXVPx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWMdYwYuDgFYKp/qDIyrFjrs0FXc0XYTlemLQmTiiatvJr6yCB+1jZBG8Xaq4+iTRn+h/7JuKk
 otcZRSbTkvkCAvWCqxiPJa7Jheit+PD3MIjybCwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some audio devices, like certain Texas Instruments codecs, integrate
configurable bus keepers that dictate the codec's behaviour during
idle TDM slots. Now that we have definitions for various idle modes,
add a snd_soc_dai_set_tdm_idle() operation to control this in a
standardised way.

This is useful on Apple Silicon laptops, where a single I2S bus is
comprised of two physical lines which are ORed just before the
receiving port. When a codec on one line is transmitting, we must
guarantee that the other line is low. We can achieve this by
configuring one codec on each line to use its bus keeper to fill
its line with zeroes during the active slots of the other line.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h |  7 +++++
 sound/soc/soc-dai.c     | 40 +++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 44dd06add52e..6a42812bba8c 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -196,6 +196,10 @@ int snd_soc_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt);
 int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width);
 
+int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
+			     unsigned int tx_mask, unsigned int rx_mask,
+			     int tx_mode, int rx_mode);
+
 int snd_soc_dai_set_channel_map(struct snd_soc_dai *dai,
 	unsigned int tx_num, const unsigned int *tx_slot,
 	unsigned int rx_num, const unsigned int *rx_slot);
@@ -312,6 +316,9 @@ struct snd_soc_dai_ops {
 	int (*set_tdm_slot)(struct snd_soc_dai *dai,
 		unsigned int tx_mask, unsigned int rx_mask,
 		int slots, int slot_width);
+	int (*set_tdm_idle)(struct snd_soc_dai *dai,
+			    unsigned int tx_mask, unsigned int rx_mask,
+			    int tx_mode, int rx_mode);
 	int (*set_channel_map)(struct snd_soc_dai *dai,
 		unsigned int tx_num, const unsigned int *tx_slot,
 		unsigned int rx_num, const unsigned int *rx_slot);
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index a1e05307067d..2f370fda1266 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -282,6 +282,46 @@ int snd_soc_dai_set_tdm_slot(struct snd_soc_dai *dai,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_slot);
 
+/**
+ * snd_soc_dai_set_tdm_idle() - Configure a DAI's TDM idle mode
+ * @dai: The DAI to configure
+ * @tx_mask: bitmask representing idle TX slots.
+ * @rx_mask: bitmask representing idle RX slots.
+ * @tx_mode: idle mode to set for TX slots.
+ * @rx_mode: idle mode to set for RX slots.
+ *
+ * This function configures the DAI to handle idle TDM slots in the
+ * specified manner. @tx_mode and @rx_mode can be one of
+ * SND_SOC_DAI_TDM_IDLE_NONE, SND_SOC_DAI_TDM_IDLE_ZERO,
+ * SND_SOC_DAI_TDM_IDLE_PULLDOWN, or SND_SOC_DAI_TDM_IDLE_HIZ.
+ * SND_SOC_TDM_IDLE_NONE represents the DAI's default/unset idle slot
+ * handling state and could be any of the other modes depending on the
+ * hardware behind the DAI. It is therefore undefined behaviour when set
+ * explicitly.
+ *
+ * Mode and mask can be set independently for both the TX and RX direction.
+ * Some hardware may ignore both TX and RX masks depending on its
+ * capabilities.
+ */
+int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
+			     unsigned int tx_mask, unsigned int rx_mask,
+			     int tx_mode, int rx_mode)
+{
+	int ret = -EOPNOTSUPP;
+
+	/* You can't write to the RX line */
+	if (rx_mode == SND_SOC_DAI_TDM_IDLE_ZERO)
+		return soc_dai_ret(dai, -EINVAL);
+
+	if (dai->driver->ops &&
+	    dai->driver->ops->set_tdm_idle)
+		ret = dai->driver->ops->set_tdm_idle(dai, tx_mask, rx_mask,
+						     tx_mode, rx_mode);
+
+	return soc_dai_ret(dai, ret);
+}
+EXPORT_SYMBOL_GPL(snd_soc_dai_set_tdm_idle);
+
 /**
  * snd_soc_dai_set_channel_map - configure DAI audio channel map
  * @dai: DAI

-- 
2.52.0

