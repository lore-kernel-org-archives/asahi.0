Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51B8400DFC
	for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 10:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792146858; cv=none; b=SB9PKfqhK3vYYRhCL3NGA0NXF6ghfAf5FlnJOT+bDxwd/7lvVd69EL1PJNyNofvm5yq7ciPie4QXtUPsa7tSlWcgCYOoNvRIh44YYahxsKKMT4743Uwvb1a2Qe+XgK5Qp1FqHruqaIecnGQCKk2bx/LjQRITB1Y63vUo++oUXho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792146858; c=relaxed/simple;
	bh=BnTr82S8w9wakAEeUEBfR1LlMbPBAs/IS0VPp87s/50=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rnUmtGso4ubATAUHHiPR9hTwpd9QKLJzznug6+aoEQA6qM0TLI2uh3nGPEfwan94hutkGpw+2ja8C0Y2Q6VlID5pUk7z8Ev1fi/QZxyX085BOfFrPxMOkUxBaauI4lMjJJLwZl+s7zpHJHMIcmmNWQSxo4MgWnWUrK+52hAgeZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iRBGxJuR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iRBGxJuR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a02718da81so50065595e9.1
        for <asahi@lists.linux.dev>; Fri, 16 Oct 2026 03:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792146854; x=1792751654; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kIHJ0txQc8+sqtyNixhwGX7E5WSVvBAZuK9qukcWHcA=;
        b=iRBGxJuRoZyNk3FNqxznehrR9Ea9ni5dISILiNZWuyDwGO1S4kHlbIvS0lp/NYDs9O
         Pu37SYZ0hufTXAB4CZiG9wW+l23QQTmG8neWxUGRwT4r5gW66ebxDCHLEnkAFPxKOtEJ
         UwNDvff+S+cijSzL8FrX1pFAOqzQxvoHh1674=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792146854; x=1792751654;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kIHJ0txQc8+sqtyNixhwGX7E5WSVvBAZuK9qukcWHcA=;
        b=HOU0oC9WaGd9ni3U16QNQaXVnIM7I4y3uCCJiHN1Nfmc6A81W7vwUvxzkNVzFNnARL
         uvkXS+fImTCWdYYhu7mqjvk2kEoOqJVfLeDxjvFU/RpKp7nm7tQ2bkLsXDMOzL/0daXZ
         8PSieH3NYxXr7T+BockeII0OGO6dq/A/O5DQTGYMiBwd0hlRbPvI7tNdv811plwBkBf2
         n/uFtgo8a2PnxQRXLMH0TNwVTFXNEd6at32VqQ6ojCkkOvi+oTQ2ZH8IOaOpgfMiKE9L
         eMAfnOXC9KeNd2dZhxG6Qstw9wGQVwRS5LxWBt2pz9/X0Rip8nf2U1PxlK6aPpwX/VVV
         esuQ==
X-Gm-Message-State: AFq9FYJl7QvlEnkUNt4VJ8k956xewg7ee5dCaF98OkyD8lgtBi5CC8In
	8+L12Dfom6OS7RFERWTZ8xYGunnFa7eUBBzUFvSVUTZYngRR6AlC8ZisCkPTXUTEows=
X-Gm-Gg: AYBFou01zdrTBYx0QbtwP5389KA6rqqLtKuYzweFG1cXqxQouMw5xudaWun8Qn0woRc
	67pvjJoD6L9D6+Q4RBFh1+YHE1au+S37dOZYFWATRqX23RqzkoRmnFJMbgnyMRTthOKP7LCUZMH
	TKmCPqG/W/2/H6/B/HRWihCxJY00aJL9yysgANglqDt7bV7YjBQKBTGqZBGfieBHetRP/AFGbou
	W0vK0hXax287xhoGYr0xPWQKD2dD4lhW8kGnDrgcoVLHZYQC8uWjAl35Og6uqGXHYJUwJ32r3of
	OZS6zb7VoRdzDhL0IU5YXN2lxIffxNBPs/q7gs5SgtK5zS8U418ZpO5M4sDtx122pxL8WW4OWcY
	UrEPdPAfya6c3AMVKzVR1i+d0kvrsriV+miJF34vWCz/kXixGGzGssoiXcfew6sTm0JheVvu1P+
	uGsvLm7Ed1UIAXPDyrMMDXCwA5gqofoJkkCTN5Ht8Nfa9/jP0Dvp/FJvvV03sPfQ7nPUGxwAnkm
	cDNUvE4iw7KmpPRT9hVxQac/1z6/RSO419YD6TG5PQ/v1pOS6tnSYPpaOG8zlak7A==
X-Received: by 2002:a05:600c:46cc:b0:4a0:8b1:f5c with SMTP id 5b1f17b1804b1-4a18e4b583fmr437610075e9.22.1792146854144;
        Fri, 16 Oct 2026 03:34:14 -0700 (PDT)
Received: from localhost (dynamic-2a00-1028-8382-0206-0000-0000-0000-0bc0.ipv6.o2.cz. [2a00:1028:8382:206::bc0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471b06sm4783272f8f.5.2026.10.16.03.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 03:34:13 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Subject: [PATCH v2 0/5] ASoC: pcm179x: Add support for pcm1795 and pcm1796
Date: Fri, 16 Oct 2026 12:33:53 +0200
Message-Id: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/12OTQ6CMBBGr0Jmbc20FTCuvIdhUepUqkBNB1BDu
 LsFdy5f8r6fGZiiJ4ZTNkOkybMPfQK1y8A2pr+R8NfEoFAVElGJV4gPUWLuFNYFquMBkvqM5Px
 7q7lUP+axvpMd1uxqNJ6HED/bziRX769ykgKFQ8p1bUutpTubzsSxNRzacUiveG9DB9WyLF/kR
 2KEtQAAAA==
X-Change-ID: 20261002-work-705f20b60284
To: Peter Rosin <peda@lysator.liu.se>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
X-Mailer: b4 0.16.0

This adds support for the PCM1795 and the PCM1796 to the pcm179x driver.

The PCM1795 is register compatible with the PCM1792A, but it encodes two
of the register 18 FMT[2:0] values differently, so the format encoding is
described with a per-codec table instead of the width switches. Only the
PCM1795 has real 32-bit formats; on the PCM1792A and the PCM1796 a 32-bit
container keeps the 24-bit code, as it always has. Left-justified, which
the driver accepted but never programmed, is added on the way.

This series is based on a work done in 2016 by my collegue:
https://lore.kernel.org/all/20160311232856.GC27257@panicking/

---
Changes in v2:
- Added missing entry to spi_ids.
- Added SND_SOC_POSSIBLE_DAIFMT_LEFT_J as supported format.
- Updated description of devicetree bindings commit.
- Link to v1: https://patch.msgid.link/20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com

To: Peter Rosin <peda@lysator.liu.se>
To: Martin Povišer <povik+lin@cutebit.org>
To: Lars-Peter Clausen <lars@metafoo.de>
To: Nuno Sá <nuno.sa@analog.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Sen Wang <sen@ti.com>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Cc: patches@opensource.cirrus.com
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Michael Trimarchi (2):
      ASoC: dt-bindings: Add ti,pcm1795 and ti,pcm1796
      ASoC: pcm179x: Add support for pcm1975

Roman Smrž (3):
      ASoC: pcm179x: Refactor regmap value lookup
      ASoC: pcm179x: Add left-justified formats for pcm1792a
      ASoC: pcm179x: Add compatible string for pcm1796 and spi_ids entry

 .../devicetree/bindings/sound/trivial-codec.yaml   |   2 +
 sound/soc/codecs/pcm179x-i2c.c                     |   2 +
 sound/soc/codecs/pcm179x-spi.c                     |   4 +
 sound/soc/codecs/pcm179x.c                         | 117 +++++++++++++++------
 sound/soc/codecs/pcm179x.h                         |  12 ++-
 5 files changed, 104 insertions(+), 33 deletions(-)
---
base-commit: 2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e
change-id: 20261002-work-705f20b60284

Best regards,
--  
Roman Smrž <roman@amarulasolutions.com>

