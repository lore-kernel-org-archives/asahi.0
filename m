Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C3126AC6
	for <asahi@lists.linux.dev>; Sun,  1 Sep 2024 03:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725162138; cv=none; b=kpTVkKUNNmjmv7rzMCVaUJ8r2U8aQtTDzrdRqyZ9klGLJWTXb9MQgiWyNUggXPwYrMVeahtmXmC4s5wQLxE9y3CVy+v3aKImyuUaOIF32C7AC6T9iPNSk9EmKwr0xL0nBeKPdoZ1WZXDSvK4nLM87LT+o8JUhGQEq0kk8/U5Rzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725162138; c=relaxed/simple;
	bh=yZ/CVVYjtuS64DONtMZBty84ukZc3qILy66xVEON1SI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MGeep0dN0NzNkkabG4DfqrzhGY6iGzXzC9fHZh6sV9LC7rBTNw5cW0YLPEhnek8FgeHRpcyr/MX1SujPYM3Z8xvQxfGWg+tF/NFTz7Q0H12dDpETlyUImgYHTdiShcbc1v+qnbVk36TGRl7tAjqP8KxU0mOVCKBbKTkb6UQWUBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/aa6Irr; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/aa6Irr"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-715e64ea7d1so2736916b3a.0
        for <asahi@lists.linux.dev>; Sat, 31 Aug 2024 20:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725162137; x=1725766937; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9gYVZX9F0tsvEizawck6Gs6K9CkXboSi1RjrBxnHjqQ=;
        b=L/aa6Irrry24tXIW+vyOOl9OqavLST8SOXbRD27d35P6Ze6Nvasj6qd2sXeyDs6Xl2
         CPLChvAgL6YxdJZZc/N0YqAk+QOjUyAmbCejr16DsCzkWBKXlNFKEcmFBlypTZrTKThQ
         KdPiCG+SSRU1fsejr9wB7Tj2lnniU0Fn4Lfhq69rE001oU4GVPQdn9/daH7iWNQjwm0G
         tu19l63Quu9o4lICXjKE3PxAsZ7T6aNq2ptgQVas8BUR7B5AjyW1Klpvbq/ZlMCMScFh
         12I6hlU/3ZMZ7Rp9LBXHmFAZR/k3Nl25oJ4c03CaL4jSMj/GTCwJQ3S/QqXSGhzUVcx5
         rF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725162137; x=1725766937;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gYVZX9F0tsvEizawck6Gs6K9CkXboSi1RjrBxnHjqQ=;
        b=CGkcUX/Jrw4zlLIKSRN5sd+MgaSl34VQKr7sWaUKkt1RonCvv4Zf5ngbD6k9w9iXc0
         wuBYdHCyvcWwJV4z5JmpZwJxnrXrFRjRREXKyDPOI5GQ4du9hxuqge9Lg6WKuc9kmxQc
         1teHqq1Vt6iE4OZkSCH0rsfr/MQKB5ils21THlE8+3iNXS7ixs8ALeCRbJUqW5g30t9Y
         elzuVRG0z2J3rjOTOCeQLFYB5z45PluIM43bEqdm+d29JXVnXgR/sh+UQl+t/CTQ81JR
         UftDXjiT/l/TLoVuPO/bXPQscNj1zjiCTJVjuxs3JdMb6O/YrO+09TFiV+IBazni/QpE
         Uoag==
X-Forwarded-Encrypted: i=1; AJvYcCUaoUKETdshBN3mmsG9RksAPuNJoMMbkTk9GjyMSPVjpJWgSMd05xlDojj4vGcuKJ4lh+pVdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwrQxCrSHXyLm/aPVm7j2nmvh1FSZMcf9k3fHJkr8XZbkiC97lE
	/PFrIWFOE7Bid90gOdq9RRUF8YE9feJJ/tgw1GNw+5j/pbaNlsX6
X-Google-Smtp-Source: AGHT+IFPTZn+Qx6Y7uy1KDmqweQR1DLiZyvrq+mdNBFj8DsOiSWLbxltzHOIzgIY1JSGFgGkZe/9gw==
X-Received: by 2002:a05:6a00:813:b0:714:389d:6e6e with SMTP id d2e1a72fcca58-7173b690c10mr5859132b3a.21.1725162136682;
        Sat, 31 Aug 2024 20:42:16 -0700 (PDT)
Received: from localhost.localdomain ([49.130.72.113])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-715e55771ccsm4826767b3a.43.2024.08.31.20.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 20:42:16 -0700 (PDT)
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
	devicetree@vger.kernel.org
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	konrad.dybcio@somainline.org,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 0/4] Add support for A7-A11 AIC
Date: Sun,  1 Sep 2024 11:40:03 +0800
Message-ID: <20240901034143.12731-1-towinchenmi@gmail.com>
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

Changes since v2:
- Removed mention of the IPI-always-ack code path in aic_handle_fiq(). The
patch to enable A7-A10 SoC to work is a bug fix to avoid accessing sysregs
on configurations that do not provide them, and the rest of the message
already explains what's going on.

Changes since v1:

- Corrected dt-binding issues pointed out by Rob, all of A7-M1 gets its own
SoC compat, as well as the "apple,aic" generic fallback.

- Order the AIC dt-bindings of the SoCs by release dates instead of alphabetical
order: 's5l8960x' (A7) -> 't7000' (A8) -> 's8000' (A9) -> 't8010' (A10)
-> 't8015' (A11) -> 't8103' (M1)

- The patch to disallow local fast IPI on A11 now comes before the patch
that enables to AIC driver to work on slow IPI systems. This ensures all
IPI-always-ack code path in aic_handle_fiq() is removed by the slow IPI
patch.

- Keep local fast IPI enabled on AIC2, mistake in V1
- Describe the feature levels in the description of AIC.
- Add new patch to remove unneccessary enablement of use_fast_ipi.
- Do not try to enable use_local_fast_ipi, because it is enabled by default.

In theory M1 can also get the apple,t8015-aic (A11) compatible. However, I
do not see a point in doing that.

Previous versions:
v1: https://lore.kernel.org/asahi/20240829092610.89731-1-towinchenmi@gmail.com
v2: https://lore.kernel.org/asahi/20240831055605.3542-1-towinchenmi@gmail.com

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

