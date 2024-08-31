Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8793B149E14
	for <asahi@lists.linux.dev>; Sat, 31 Aug 2024 05:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725083827; cv=none; b=GKvPRN1XYObcLT3MsXeOFuXTN4MnTRTaSxIqnnAp10ir80GxSY99dwJRQJIxtNT+nlxAql1az6CJUM2KOMvun9fKP5yqebYGhLL/Y3TZ2mqLRYWfKLuO51BhdWlXoik5v5Vvl81iLi1Skj3PBw2jc0HikdGp7USYkPkqQRVnbjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725083827; c=relaxed/simple;
	bh=6jRipSmZB7tBHL26nPToxzqlMWECJ6w6dEGLoIX4iV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qYeyx6yudLRuKfQ4ZHrk0CUlPOqvH341QucbjOwxsEZyJgENwcia3tJeEY4tQdFkVECN1lTZFyyFRNYye6h/fsoL64GPqiAKw/zEvafm3+owJK5vfDc+ydUdBG7Akcr67VES7q6XCUDboUgljUQ5ks7EUUvtQmXLbc9bv0Th7tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZbfu+T8; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZbfu+T8"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2053616fa36so9711805ad.0
        for <asahi@lists.linux.dev>; Fri, 30 Aug 2024 22:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725083824; x=1725688624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ByuhC/KjucY4J7CupyjYySbESElTD8OlxoVh31r/Quw=;
        b=GZbfu+T8jsTUaa4rn2QKJhpc3pfQ23Ub/Qgf9Xi1dH/B2RBlkLW0gURGtc8M6np+Eg
         YaPuNeHxDpKKiP+Z/jIcd0hMsIYkfhg7feNas1vNbLB1k6navtie/V0i2oIpPidtIilL
         V/+/rX0wq41xCfwuSWnvTx2ldJwsXY05/omQ+idLjRkBHLS5Itptv3buS+gARZqUy+LL
         XYvywPFLxBouqDam4ezSZcKcH1lkhj5vGduxq2dBt7owjaFFNgQkFqpJ23ZcPxw4aK+7
         c7jEDrkbXvh4di3Fa2uLENwpBvGKApxLfp09soAD5x03iW5CJFy5agGNNezsfhe3U/bT
         k5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725083824; x=1725688624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByuhC/KjucY4J7CupyjYySbESElTD8OlxoVh31r/Quw=;
        b=OCcdITi5I44HxPyhb/pV0NAKw6MUhgQj2r24+Glt9Phyqfms3h/1/awcoEzbbV69va
         AqWjFzizF5Rbjw8xlPQYu7rmxE3iYjrhgCky5WBRgZ7pbSGja4ZisionNvR/ZG5mARWC
         iVuEWOmdCalVv1MLVyoJdMskSxJOY/FgCd9AbxvhQu6lJWZXN96ZbiZmWpVhMzIvG9/y
         OZBkJNonZwCgDitLq1nvyZ6l2tHWkZ1Fz6BDrG4OTNN//GATAqpJCIhDS4EKc9grU2FY
         KpjRG6y+uPFpu3HS/jcZhnnidN4NbLK4ZJlPlXoKC1xVRgd2RMBuXv2E2IXxvGqpZFl8
         OrNw==
X-Forwarded-Encrypted: i=1; AJvYcCUl/1T4fhgmIHjhUvxvo6NGY+1DAfm2Jr7WB9NGwwe3vrPVR5bzFzpeZ659Rdgq2RIoPu3Fcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfaX4FAwvOhDe7NclohL/m7KvtlJIqPB3i/1LDT08hQE8gOJaN
	o35NrP/5xa2soqlUDpwOclRKZW37JYnVOeGguQuKrfqOXoiOtqd/
X-Google-Smtp-Source: AGHT+IGh3vEuCKsQf/q7EZsGAaz8dCUKLiYZWUd0LMKY0xL83ycYMtjPR5YYsNp8yxn9ikg9CmVGwg==
X-Received: by 2002:a17:902:e742:b0:202:162c:1f29 with SMTP id d9443c01a7336-2050c46deb5mr78384205ad.47.1725083823654;
        Fri, 30 Aug 2024 22:57:03 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2053aa8cb4asm12027045ad.271.2024.08.30.22.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 22:57:03 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	konrad.dybcio@somainline.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 0/4] Add support for A7-A11 AIC
Date: Sat, 31 Aug 2024 13:48:15 +0800
Message-ID: <20240831055605.3542-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series introduce support for A7-A11 SoCs into the AIC driver by
if'ing out some features unavailable on them. For background information
about these SoCs, see v1.

Changes since v1:

- Corrected dt-binding issues pointed out by Rob, all of A7-M1 gets its own
SoC compat, as well as the "apple,aic" generic fallback.

- Order the AIC dt-bindings of the SoCs by release dates instead of 
alphabetical order: 's5l8960x' (A7) -> 't7000' (A8) -> 's8000' (A9) ->
't8010' (A10) -> 't8015' (A11) -> 't8103' (M1)

- The patch to disallow local fast IPI on A11 now comes before the patch 
that enables to AIC driver to work on slow IPI systems. This ensures all
fast IPI capable systems can use one of the IPI capable compatibles before
the IPI-always-ack code path in aic_handle_fiq() is removed by the slow IPI
patch.

- Keep local fast IPI enabled on AIC2, mistake in V1
- Describe the feature levels in the description of AIC.
- Added new patch to remove unneccessary enablement of use_fast_ipi.
- Do not try to enable use_local_fast_ipi, because it is enabled by default.

In theory M1 can also get the apple,t8015-aic (A11) compatible. However, I
do not see a point in doing that.

Previous version:
v1: https://lore.kernel.org/asahi/20240829092610.89731-1-towinchenmi@gmail.com

Nick Chan

Konrad Dybcio (1):
  irqchip/apple-aic: Only access system registers on SoCs which provide
    them

Nick Chan (3):
  dt-bindings: apple,aic: Document A7-A11 compatibles
  irqchip/apple-aic: Skip unnecessary setting of use_fast_ipi
  irqchip/apple-aic: Add a new "Global fast IPIs only" feature level

 .../interrupt-controller/apple,aic.yaml       | 14 ++++-
 drivers/irqchip/irq-apple-aic.c               | 53 +++++++++++++------
 2 files changed, 49 insertions(+), 18 deletions(-)


base-commit: 985bf40edf4343dcb04c33f58b40b4a85c1776d4
-- 
2.46.0

