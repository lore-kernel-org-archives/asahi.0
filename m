Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C5A1BDE2
	for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710687289; cv=none; b=O0M45Rkv7Cgvyi10tLXgSeqGyU7+sSsVJKFVYhiPLYmYoyJ+SUcIyAz6bFIp2dJTnciawRcelW/wXiEBbqCIX1eWeJ6qik0Dwv5WxVSMC60cuTGhEtcO6KPYnbxSiCHfZriZiOgMSrTPaXae991DfDjKZgBdmlAwAaP2mv3jpZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710687289; c=relaxed/simple;
	bh=W/VbIpCvZRDplOLXLtFGQiPxIAPwMPHxXMcJ4WlLWFA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gM9jrVxaxF28END+njZ4Asly3wP52QDXq1qS+5ZjQaSOH851XaBwR3Vm5rbBMQDTv36MbmP50l57Xs5ogSpkbD9kQboOC4Lq0Qe3Afex+ghSN//uPQwaBZ85q0/+Nn1jdJ8AHAEwmSVY17jMsE/d+unvIcs3AIaf4CJXoyS9KqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L09pWTuO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L09pWTuO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9182BC433F1;
	Sun, 17 Mar 2024 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710687289;
	bh=W/VbIpCvZRDplOLXLtFGQiPxIAPwMPHxXMcJ4WlLWFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L09pWTuOPVkz8TuQAxOw9yD+e2hRCEWDMEg/pjeYNBGtdpr9ilBG4SruMRUJeGZYT
	 pWft/DL7M6k0CQd9BL0VpJ9YkTav+HQL5JDaUNEarrRKxEesvGhP/XVmtumwx7oKO8
	 zw3uP8NtmMmD3+FPqINSmd8nB9l4AkSyWDpal5NEjCbAxmslSNRMLmC5zy1CBnTwET
	 Wgzs3lEhrkFRF6zuWF76/BqiVRi91OAxmnVsmmk1e1YfmNWSB5vXzE9789DsOLKsKp
	 zH7oWAkWxAOGZOX8JR74D6911DcBP5i3sKPHeyLdclVL7R7fBN2jEprPGQUZ7epyl0
	 c13xDDIH+VPeg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C18C54E72;
	Sun, 17 Mar 2024 14:54:49 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Sun, 17 Mar 2024 15:54:50 +0100
Subject: [PATCH 4/4] arm: apple: Switch to standard boot
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240317-apple_config-v1-4-1b862bc140a9@jannau.net>
References: <20240317-apple_config-v1-0-1b862bc140a9@jannau.net>
In-Reply-To: <20240317-apple_config-v1-0-1b862bc140a9@jannau.net>
To: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de, 
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1402; i=j@jannau.net;
 h=from:subject:message-id; bh=crjeE1IUF+rCa9w41oK3inDEucGXM4uquwiVSADZxhc=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhtTvLBZ8rklbnTjUW/wP/JPO5/6z+ma4TOHMM09ffwjY+
 1Ws5v/njlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABN5LsjwT/PXdOdjFjrccdYl
 T64oHb/76I7xg8jeJt4TVq2bllz+ycXI0MiuumGxecDBWxwSVufSmC/n3w6q0VJfJ37S5mmDQKo
 6EwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: <j@jannau.net>

From: Janne Grunau <j@jannau.net>

Use standard boot instead of the distro boot scripts.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm/Kconfig        |  2 +-
 include/configs/apple.h | 20 ++------------------
 2 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 01d6556c42..ad89abde41 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1034,7 +1034,7 @@ config ARCH_APPLE
 	select USB
 	imply CMD_DM
 	imply CMD_GPT
-	imply DISTRO_DEFAULTS
+	imply BOOTSTD_DEFAULTS
 	imply OF_HAS_PRIOR_STAGE
 
 config ARCH_OWL
diff --git a/include/configs/apple.h b/include/configs/apple.h
index a70440b3ad..1e08b11448 100644
--- a/include/configs/apple.h
+++ b/include/configs/apple.h
@@ -9,26 +9,10 @@
 	"stdout=vidconsole,serial\0" \
 	"stderr=vidconsole,serial\0"
 
-#if IS_ENABLED(CONFIG_CMD_NVME)
-	#define BOOT_TARGET_NVME(func) func(NVME, nvme, 0)
-#else
-	#define BOOT_TARGET_NVME(func)
-#endif
-
-#if IS_ENABLED(CONFIG_CMD_USB)
-	#define BOOT_TARGET_USB(func) func(USB, usb, 0)
-#else
-	#define BOOT_TARGET_USB(func)
-#endif
-
-#define BOOT_TARGET_DEVICES(func) \
-	BOOT_TARGET_NVME(func) \
-	BOOT_TARGET_USB(func)
-
-#include <config_distro_bootcmd.h>
+#define BOOT_TARGETS	"nvme usb"
 
 #define CFG_EXTRA_ENV_SETTINGS \
 	ENV_DEVICE_SETTINGS \
-	BOOTENV
+	"boot_targets=" BOOT_TARGETS "\0"
 
 #endif

-- 
2.44.0

