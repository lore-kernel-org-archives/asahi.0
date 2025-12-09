Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597CB2D594B
	for <asahi@lists.linux.dev>; Tue,  9 Dec 2025 09:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765272723; cv=none; b=jxccmtVS8tmowmmGRSfFVsrDtnuWmHdq2osgu6yPEbBHk6TFzSJsf7h4NNdiUOD15Z1a4Oj2puCo+JSxxVu31wHh1HhtTrVuiOENpmmKhZDer2H3zE6eVTVNzO1jL9WcXmhbGn29IlEccBkhSuJRIIGCDUJaNnaihL67dLOUau0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765272723; c=relaxed/simple;
	bh=9BrUquyvgfOE5tXuWI9JhhGZxPBE1kg0z2Vo1M4aQHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uMcxdbItq5JF3p+Dy0/iMgwRRltDcmEbvjEmTr3Zvdk54htIuUqNVUb6x2AlXRuvd3IPOlPgC8R0TYPhUxZeFGtq0jD+wSFv337g6b5SCQ3vQlmpBWzfmBqXFoWPNmzH40xF2UYw2fMCk2YZ7MtU62aoOivSjo3bBDTqGZM2J9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eujVIAhR; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eujVIAhR"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-343684a06b2so5688335a91.1
        for <asahi@lists.linux.dev>; Tue, 09 Dec 2025 01:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765272722; x=1765877522; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/homEcZK52uy44aasdrENOooGOE5sAlOYEfUkV5W7I=;
        b=eujVIAhRNxE+mXpJWEqzgqUIEtzfcJ7O4LvCBNVlfX04YmJ7aSi+RnKWqDaXfgF2TW
         D49MYNhdVyNsgb6C4mVWY1rgsPtUO355rJOttAoHOGiu0zpw6V/OGkwSpYeWF+oLn+LW
         qU45TLJSw3PDHMjMThM+k1S3kDeDZUzj53CPR+DmyYPtjEGloQpdgzLlngkIk1lpT2sJ
         ZPdbQZ058r4LQasgcsw1ZO5Ec/R1rRYrA7R/I/kSBFKnDvGrm2xgZvsCNEwyMi+blZfj
         gvrjIg5Ezsj/PhMaPf70hcoGh3TZq8FLq6BH+X1CdaE9+kgWm1JXqjy6UPkkXGa17HoL
         aIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765272722; x=1765877522;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X/homEcZK52uy44aasdrENOooGOE5sAlOYEfUkV5W7I=;
        b=Xnbof/Fkm8u/wheH1RNwL0ze8RmW7d40iw7O5NhJYEFJHi9XykKDSbY20+B96FGYIj
         iNlIRTIARfKVB/T4i2w8DiJgQfO9PFX/bXAWX6Ipc6dE3sFfv1lMMitezBcYYH+Pzijz
         e2VwucMYFaWSoopu9gCPhFrrXXsCDbJlpynPNp/HZqoTdb/LOreqBvZmUXIJe/BfsmRe
         ET7j7Dcl6EelCm1thNpv8e+G0JH0pFvk/kZ6Uwab7emLitkzxwzTQfMd5Fh0FqBeqRcE
         xJiKt+qBiM0QBMfjiQG3hT3/nhsn5iATpIvvJXw41sT+scjSLVdkx5qR3ysM7nYXtfej
         Ju6w==
X-Forwarded-Encrypted: i=1; AJvYcCV0FZ+ouJNEiIjaChNUq5ofeoq8YwEgFkuRPmm88qePlbWCrGdqfBj/fmmMAnxjvDep+w/U9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzLn7qgsJ7cY8hlos4KlOSeLDPKC7y4J/OE2o1o7UQC55/HDRmV
	I1Lt7IzrFtz3gtOhwNbBXR0XjsrOOo0NOIIMM17Oes3kquG+i0ZetzMe
X-Gm-Gg: ASbGncuJCUu5rT2il726yxRpP40cvpCdiUWzV4GHgLLqThNgACBfKBQCQ2a7nbVQku7
	pgqoMcMJp8sOspYrQucJLL4jCA9dkeUY/jFYMlVlVLK6dhKlTfS/Q6S/c3L+JOSOisNXNCQ52B/
	XnzVmfWOUBSmno/UbpNU0wrMItmURo8FvqQIX6XJ2dGAoHlpHwKba6K36jPUwXQMgktrVYoIo/K
	qu0BnSkc+QojVrzNkCFRWWxFFo2q5OPuLfknkMW3F4INrFqdYlUNYvQev19r4S4FktZ5iD5jFhy
	8A1MddmhA+Za+S0qN6iPjxAC+ACpXS0xqYCC4QLR5rKyZzYc81wjTVxX4liD5CQhmKFiXIsRRPn
	cXnt7e9THlG3Nd/xCi9IDCaCQNc2mS6wouV3XWSx2vrGoyD763yjjH49uytM5aYNE6YMEeo64iS
	if9AEAYiR+pXWfTPkRIbaZHYSeVeA+ELHSvPTyiddFnaOczqJP2B1qQv8PVKWYt+qofTRR5MuJz
	FwjQDmtT22JxYZ7ko5/6muYsdlTljuDZMmkhzsN3YcU4FMvlZXsfb+X44LdSDwINd5Bn+d/kwXu
	TL2QsiyiAktpu/NQfjktcGztgjQBVajZecHww3DaGBRoGwkRJ/U=
X-Google-Smtp-Source: AGHT+IEwaeD0b9uHojQWY3Zj92Hr/X5acaNl0q97VcOUGKTdKrWTewUu7dv7EFYi+rSt77tp7bmfqQ==
X-Received: by 2002:a17:90b:3e4c:b0:349:3fe6:ab97 with SMTP id 98e67ed59e1d1-349a25c00dfmr7898399a91.22.1765272721737;
        Tue, 09 Dec 2025 01:32:01 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49658704sm1800408a91.6.2025.12.09.01.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 01:32:01 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 09 Dec 2025 19:31:17 +1000
Subject: [PATCH 4/7] ASoC: soc-dai: define TDM idle behaviour modes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-tdm-idle-slots-v1-4-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1797;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9BrUquyvgfOE5tXuWI9JhhGZxPBE1kg0z2Vo1M4aQHc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJnmb7Llv+1kaVUxfcu0Lyr9iOuUFcssFQvk35ZxHPLV9
 3RbufdWx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 DXWMdYwYuDgFYKon2zD8L7p27p9KpcGMFdc2Tp/u92VGWJiRQcaf/Nf1cy5fVDnAEMHw32uK5pn
 yTx4z157KdWEontG08r7oaZNUBtm2Xccmfp7+gwcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some audio devices, such as certain Texas Instruments codecs,
include configurable bus keepers.

Imagine for example two codecs sharing a bus. When one codec is
transmitting, the other must ensure that it is holding its side
to 0, or data from the transmitting codec will be corrupted. We
can trust the "idle" codec to simply do this itself, however
this is undefined behaviour. Some devices may leave the line
floating, others still may pull the line high. We need a way to
control this behaviour.

Thus, we define five possible bus-keeping modes that a device can
be in: NONE (UB/as initialised), OFF (explicitly disabled), ZERO
(actively transmit a 0), PULLDOWN, and HIZ (floating).

These will be consumed by CODEC/CPU drivers via a common DAI
op, enabling the explicit configuration of bus keepers where
required.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/sound/soc-dai.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 224396927aef..a5784ef8e3f7 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -52,6 +52,19 @@ struct snd_compr_stream;
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
+
 /*
  * DAI Clock gating.
  *

-- 
2.52.0

