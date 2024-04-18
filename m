Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD1117AD93
	for <asahi@lists.linux.dev>; Thu, 18 Apr 2024 19:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713466830; cv=none; b=T7hSO656DjuLojoX/5V505rNQlGQfoFk6acUTpY0zxejuTbuAlCxNwMYZfXdQwOUh/owSHgqSPJQpK34QaR9RMICnSP5LqtTiPLpFDgXyMckDaO/rc8wH/GcXsdOc89juNtzRV70pw6MofOYg6rQ/CaFKRj9Nqr6anZSv4hfCZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713466830; c=relaxed/simple;
	bh=du5Et+n6Vf2y/C0pkFuNPvpCr9o/O28otVps93AuTLk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RLYUYYozAOoSNg5Rkjl5+DEukS9lGoscJtq/RgE4xecPADNrXrDiwdokDgZW51FXhvBLLG77zY26Lj/TlZ20GS+Ra3fcDOCXWSWUN70BXFGpbamRGK3LZeq+Kb62d9fD6084PcoGrfQ0gvWp/PG0zigyILsoj3g+eM9HXTPXY80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S0H7MkkD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S0H7MkkD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDBCCC32782;
	Thu, 18 Apr 2024 19:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713466830;
	bh=du5Et+n6Vf2y/C0pkFuNPvpCr9o/O28otVps93AuTLk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=S0H7MkkDUXyGMk4nrTXfm136L1vSBeQnh92nnrGIsGUFAjsD07jQSHvVVAvQQFMFZ
	 Dzkw8HkBJKgItZl5Aj7bOC1MCBuvUbSDZ/EYufyCuMVxAhWq3i4E/5qsvv6bm2oElC
	 qwp9/NjhtG5HL4c6TFkkDvttkFOt24PwhAg7Ds5dTgRZZtJZO5z1DrK09W4KzIJpOD
	 G21XFG4DO0PpBx69cmBvdOtJGkCbMwf44sozmxlMMeWYIMfoj0RgyNWXGECWnPXLLe
	 yZ+fFNyg/aRE7yTc0oche1KOYFHr+/Qt6wibkxKG3y5OQWdrntPYxZh2HPwgKzyzdp
	 RcchUVLogUzLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E85C04FFE;
	Thu, 18 Apr 2024 19:00:29 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Thu, 18 Apr 2024 21:00:28 +0200
Subject: [PATCH v2 4/5] arm: apple: Switch to standard boot
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-apple_config-v2-4-7e5c6b9a9db3@jannau.net>
References: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net>
In-Reply-To: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net>
To: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de, 
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1472; i=j@jannau.net;
 h=from:subject:message-id;
 bh=bpZhuGl0+MTgE6TV+2Z005nzV5o0C5mfHTMqAQmaZOs=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhjTF3NObHu5eFxfXontTcIfmA73dhqJvlnRzFQZVP/Oxv
 ML+PDGvo5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwEReb2FkODrDcsXX/euUTdps
 J3PZOD+NmzWtd6WCTODZCdrHq6bM2c7I0Ph+6pft02O7G7xDZ7Kn/dpXsVTotZ205Nd63QOfHX8
 u5QUA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Janne Grunau <j@jannau.net>

Use standard boot instead of the distro boot scripts. Use
BOOTSTD_FULL instead of BOOTSTD_DEFAULTS for easier interactive use.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm/Kconfig        |  2 +-
 include/configs/apple.h | 20 ++------------------
 2 files changed, 3 insertions(+), 19 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 01d6556c42..9b83b2e6f8 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1034,7 +1034,7 @@ config ARCH_APPLE
 	select USB
 	imply CMD_DM
 	imply CMD_GPT
-	imply DISTRO_DEFAULTS
+	imply BOOTSTD_FULL
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


