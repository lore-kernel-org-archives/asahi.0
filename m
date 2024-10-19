Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BDC10E6
	for <asahi@lists.linux.dev>; Sat, 19 Oct 2024 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729349352; cv=none; b=p76s66gEYPN6fkvnfq7WnnWyfJ+Y7UpoN9YjaAyrUQd00PbVoFVsS6uUe+agSrN6VWnEQIlq5H2bqaJ3VBj+KFEzKb32Onoc3AbGxDVgw3iBEtkiV8tG1/INCRDWjDySg2/U0GKRBKoefSTVKS0+/DYlr2wSjLlCgZkzV1ptoZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729349352; c=relaxed/simple;
	bh=6EiicdGSTOVUJrs1WDjtV0CfHwrY07h6vyPTLyZblpk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WLHg9l6cJK3uvmEJRqxes8nrLUDcZ4aRnDqKX+VahUhZlBsxo7hKawUkV5OHjMjsUxLzbUADKaQVu26sHaC5lWWWFv9h4jen1FluQK2LY6j0oQoKhRlnMyf4wgqwltfkKf/sgx4/ziQkhtW9HHXilb4Rq8mYvOZNnzqJXXW0L+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vh1ZyqoY; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vh1ZyqoY"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2e3d523a24dso2305233a91.0
        for <asahi@lists.linux.dev>; Sat, 19 Oct 2024 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729349350; x=1729954150; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wRAsQzWsfAiV87KFN9bQd1+c9EDfP1rQjP9KURtePIQ=;
        b=Vh1ZyqoYCn9seTe2XISzPV93zc+Rt3dCqu8Y7noG9vsCkcHlrTmE5q8tDr0fpAGt3a
         H11E+7bOHbtdvIVubZ8pBYIcInL6ozgqJi7PnwORC3Q5xb+tgj9AicaBJGmXymikgMY6
         KSN6i8/70u2tr4v6dsjJPlx+dtmwUus+xrJMhEbeWDC5F2W7aasxSOlwL8oWqpFuX2Eq
         /uf+IcGlmX1FYN1JcZDKDQVHBFv7sTyShbpZVBTPdLK35TF/K/exL7vImaW9Lfm2IEJA
         PKHeicRjcbJAmPHlP3euFbVRTAcRfRIq3B2NG/IGKWcrP2Uoguyz0laDZXbwvEZWkxSL
         Bd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729349350; x=1729954150;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRAsQzWsfAiV87KFN9bQd1+c9EDfP1rQjP9KURtePIQ=;
        b=tAh3ihcrS3K9iASPeB6mdN+DgjKxtSg+fGo/APDfI/YpBjc6W3sXdp0vTzq01nFRAU
         uAIzzFsK2btsZJlaTfcDAJArRw/YmwbgqM/e9eY6A/kBwo5zwtrgwN+kdypdOoaNeOJp
         uIzE5r8zU+T9ryTL0vqWHO40j3cdcbyxLZvgtf+UCHBQA5B7v51u6NKZ6VUmej8crYqE
         tdog9zuYwqQmrmQPSWrC7owXkzYqENfNrP4NkMeCTWn6hhtiu65OE3t0yE029oDiqluJ
         JHKLjk8FcP1cA5YnOpL7JdmBjh3BHFJTYtev+EVMbutz6RxeC6sTL4sXCgiOYUFgdVmL
         TKOg==
X-Gm-Message-State: AOJu0YyRF7H1sdR+HkvZI1as1PVBZ/j8odC/ENd2mbk7ps+Omj6I4EZZ
	1U/NxhC1vgSqszqO9icWFlzuB1VUzzMtu/xgipAi9p56cAcu0t5N
X-Google-Smtp-Source: AGHT+IF/CW7kqVzu7hqUryPlTN2q8R7zDuFbVqC8bGTXEhRj5xeUdaMdZBx6GucLxSsVvyMCzUkE/A==
X-Received: by 2002:a17:90a:a617:b0:2c9:5a85:f8dd with SMTP id 98e67ed59e1d1-2e56163fae6mr7006798a91.18.1729349349808;
        Sat, 19 Oct 2024 07:49:09 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e58390d63bsm1325747a91.0.2024.10.19.07.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 07:49:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Subject: [PATCH v2 0/3] ASoC: add CS42L84 codec driver
Date: Sun, 20 Oct 2024 00:47:30 +1000
Message-Id: <20241020-cs42l84-v2-0-37ba2b6721d9@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAILGE2cC/2XMywrCMBCF4VcpszaSTIKNrnwP6aJkpu1AL5JIU
 Ere3dity/9w+HZIHIUT3JodImdJsq018NRAmPp1ZCVUG1CjM9pcVEgOZ+/UYL11ntAE76G+n5E
 HeR/So6s9SXpt8XPA2fzWfyMbpZWnlq/kbEtI93HpZT6HbYGulPIF/2LGzJ4AAAA=
X-Change-ID: 20241016-cs42l84-f38348d21c88
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2417;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=6EiicdGSTOVUJrs1WDjtV0CfHwrY07h6vyPTLyZblpk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDOnCx26dKtl54sDfs78bD3t/vvw0SiBWLH/lUpcU33dzZ
 s4x6Jk9r6OUhUGMi0FWTJFlQ5OQx2wjtpv9IpV7YeawMoEMYeDiFICJbPvCyPA87FODY+tezw8/
 lxy7MvtjYcFHG95b/Mt77r1aJt8Zk9nOyDDF5nPZ7mu2LHH/ukNOuHvnNB4zmFSwU3uD82nhpcy
 hWiwA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Hi all,

This is version 2 of the Cirrus Logic CS42L84 ASoC codec driver.

This patch set adds a driver for the Cirrus Logic CS42L84 codec. This chip
is (so far) found only on Apple Silicon Macs. In keeping with proud Apple
tradition, the CS42L84 is essentially just a CS42L42 with a different
regmap and no publicly available datasheet. It may also be missing its
parent's S/PDIF capabilities as none of Apple's devices support S/PDIF out,
however this cannot be positively confirmed.

This driver has lived in the downstream Asahi tree for quite a while now,
and gained some refinements along the way. I have squashed most of these
into the initial driver commit as they were small changes like tweaking
msleep()s or filling out TLVs, but left seperate a larger change to
tip/ring sense IRQ handling as it differs significantly from what is found
in the CS42L42 driver.

---
Changes in v2:
- Fixed failing DT binding checks. Sorry! (Patch 1)

- Added Martin's name to the DT binding maintainer list (Patch 1)

- Documented #sound-dai-cells property in DT binding (Patch 1)

- Dropped superfluous DT binding descriptions (Patch 1)

- Fixed DT binding description whitespace  (Patch 1)

- Fixed licence comment format in cs42l42.h (Patch 2)

- Fixed erroneous whitespace in cs42l84.h (Patch 2)

- Switched driver to use maple tree for regcache (Patch 2)

- Lowered max_register property to address of highest observed register (Patch 2)

- Fixed switch/case statement style (Patches 2, 3)

- Picked up Neal's Reviewed-by

- Link to v1: https://lore.kernel.org/r/20241016-cs42l84-v1-0-8d7e9d437d2d@gmail.com

---
James Calligeros (1):
      ASoC: cs42l84: leverage ring sense IRQs to correctly detect headsets

Martin Povišer (2):
      dt-bindings: sound: Add CS42L84 codec
      ASoC: cs42l84: Add new codec driver

 .../bindings/sound/cirrus,cs42l84.yaml   |   56 ++
 MAINTAINERS                              |    2 +
 sound/soc/codecs/Kconfig                 |    7 +
 sound/soc/codecs/Makefile                |    2 +
 sound/soc/codecs/cs42l84.c               | 1112 +++++++++++++++++++++++++
 sound/soc/codecs/cs42l84.h               |  210 +++++
 6 files changed, 1389 insertions(+)
---
base-commit: 469819cc17368702a6f68cec2148f518d3f3679b
change-id: 20241016-cs42l84-f38348d21c88

Best regards,
-- 
James Calligeros <jcalligeros99@gmail.com>

