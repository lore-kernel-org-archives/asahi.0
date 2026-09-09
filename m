Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6FD489FAD
	for <asahi@lists.linux.dev>; Wed,  9 Sep 2026 22:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991697; cv=none; b=o8qtZplrXLLKLutzVsUGwPCEMbhSYmy2GN9pY6/48A2p17xykVaXD4DEvSGLXSXB0FfLWEFKXt7j8ZrxmoN2dY4qA8G80vAsOfyYyLXFealFCxYi+xxRiX3N5ArEAOr3e9FPTpg+oRKAycb3bzMWONBy9PiHAoCzEP45pCcIUBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991697; c=relaxed/simple;
	bh=oX1NfBQzeNTxwy+1fSOgKyKEYwKoCAwxIi6O628mhnE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=riDBfZxe/gtcxChtJ1PqhUGEh5Nw92XdIy/jkWF0GUbH0oDgatMEaAqsVIe3Yf44qU4Gb/jdKWTqFUsjxruuhAWMymOWZc3Nhp2Fkx0N7sSgMIW/VZYYQPJtdLKFZ6TJ24RcYv4oltmXqlb9LGPd6Qj/vUd5vAuc+CKdlmxHhGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIbvYWCj; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIbvYWCj"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d91ff7d9acso56065255ad.3
        for <asahi@lists.linux.dev>; Wed, 09 Sep 2026 15:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788991695; x=1789596495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C7UZ+CZSXqHjsWNSA8dThjGs+0DrX3xzvJgXi6EfD+U=;
        b=iIbvYWCjMOD/hkkCALsowUVW2eTjPTu0PSQw5wp8znpFJExUfLNM7iHnbTD4mFL3HG
         8b+GIHlfsg84PN6WraoDR+hdAakj7mgdL+2Xk2gk1UNNkaNEC0zFhhWOM1a9JwRKYpwN
         tLbPC5y9I3vaaYGnBLpN3uvrupwMr/ByhppZMBq47bux1soDi1vNiqDx3lSeZoyfAB/8
         YUum4sDVX+ew7K2icf4Ai1NVySsY+vA5zR0PHWlDsrDFvkC8fQ0v44V2yu60PQHQZUth
         yk6mKyQBxqscBhF8orJVvQWMq93NqtQIhGJF45V/a31VoLfGSUFLaeDMZnSLhMqqjxhl
         2Kaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991695; x=1789596495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C7UZ+CZSXqHjsWNSA8dThjGs+0DrX3xzvJgXi6EfD+U=;
        b=GAYeX2T5mZJ4zvjB12wrLQddYHAKvszpa/MXW4xWjZpTnNVzudFCJM3DuRTYDMEDP9
         q4YXAdjjX6O0XYoZZFpebQP8I0jG40kwyUIc+V+jLSdXFAbvYwOrY8EDLNwtWp+ZerLQ
         7xtY1rtA+yIaTcCXcF/EFHcdfRtRNs/PW3w+N0AL/otbSl6IAt+eB1YIQlhEZY5GpdYF
         FK6ZdwOBEQlGCA55tWWbP7/hNaHgZvDnGIoZ2U33BhJbJ/KtaAOvIFryo8qMlq2FkESH
         zzhEPFMofxG6CbB6D7zMLBDjfGYMQzrHdVHqjeyNThuFdsl8/eZo+XVM0Ug2JE4fuMDD
         RFxw==
X-Forwarded-Encrypted: i=1; AKwUvBwD7Ovn96JVa6F2BebCU6RW9LfoC/m3tIsijBkA2vMj7vzW0ctE33gEEe1XDD1DL0ZTEqlxEQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lfPFujf/QvOgxhEgEAC82PdXWiVC7QKsMLD66wrwJhzOyjMGsR
	nAAfnBCpRVCrvJAcxVNytVLjLUiC9vK6iCSipYFapiWlDlydp2oA/5xU
X-Gm-Gg: AYBFou0w9JMj+eKghqXcok/DlVHQvr5v2H47qbvBONVvj86hvFw6jnz8SNzF4890fhJ
	nYZjj094T+ReaYIKPH8VmBPdxCospDQ4zgHkFSv/Q4W1ILuW4FoK1ni8peO+VNvoyiMWhvEwdNy
	q941RoJZlbPFmZobCGCYO/wpd3+Gn7lVppJZhT8N9htPzNSElnp3Iw9W68yNUg+E/puX9FM6h6O
	sCicB2gn/bL5P4k4hAW2jFHn6ovSBOBQ50WYA6Vg22X7YzEgkn0mJt0EIUdHEdWVMozeWxEd1Sc
	Lsi+JX3LzkpcABtjmUeMJQftmnkEfMowP04Cxkk3i+FL9FZTnie/ipQk2qWOS6S08Pibw/qd68D
	fTIjwqDfK25b3RgKawn6YIvJqS+EhjuXhNo0kQRZ2x2ZwdJeV/AkPaRpGFv/eIMTqO4d4veEQK4
	MCNkI2uNj9WepUmeViZskoL6uQgLMbdf6YN+z2mWQ5kTDIglt9W/WdWQBNAPFaSkqIdDhMA7Xyu
	pxbvd17BT3EIndomxNbYQ4gR4Fjfl+9RmQPtG/nwTeakjfxvaHzPNAY424DitRM98yI6mja5hGP
	rl/lepzRJh1MRnVX+tqrJdA2BWKU9CGEtFawuWhUed8uTwcA
X-Received: by 2002:a17:902:da8d:b0:2d5:3f5f:e645 with SMTP id d9443c01a7336-2db125ca419mr522760655ad.12.1788991694359;
        Wed, 09 Sep 2026 15:08:14 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db2c60f687sm65423565ad.58.2026.09.09.15.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:08:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	asahi@lists.linux.dev (open list:ARM/APPLE MACHINE SUPPORT),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/APPLE MACHINE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] phy: apple: atc: remove stale kernel-doc for removed struct members
Date: Wed,  9 Sep 2026 15:08:10 -0700
Message-ID: <20260909220810.52310-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The @sw and @mux members were never present in struct apple_atcphy,
causing kernel-doc warnings.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 v2: remove removed in description
 drivers/phy/apple/atc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
index 4156fabad742..f09305dd76d1 100644
--- a/drivers/phy/apple/atc.c
+++ b/drivers/phy/apple/atc.c
@@ -585,8 +585,6 @@ struct atcphy_mode_configuration {
  * @phys.dp: DisplayPort PHY instance
  * @phy_provider: PHY provider instance
  * @rcdev: Reset controller device
- * @sw: Type-C switch instance
- * @mux: Type-C mux instance
  * @lock: Mutex for synchronizing register access across PHY, Type-C switch/mux and reset controller
  */
 struct apple_atcphy {
-- 
2.55.0

