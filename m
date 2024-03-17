Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42FC1BF47
	for <asahi@lists.linux.dev>; Sun, 17 Mar 2024 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710687290; cv=none; b=XLEvLowyNDnFwdbNHzxim0c97XjxFV4GHZ+/A0FNY8jwNdOm8q3JeF1Dbt1NJGW6VBHVQlkYBvgoqlq0lxxHK9i7fN70NdnVKncvURpoCXVIoWGo2Uk1gIhMiHvmcGLgFyh+D6xLP8rDZMU9huPjgHKE4CYvWl539m3bdWSakB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710687290; c=relaxed/simple;
	bh=guYFFkwoi5nrMtCwr4mxXFtCimym0iwxXVwrtBJ9+IA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OYDnEk9avgLDRMTRZXnwAM4If31Bc8+a6wdW0wDZ2XWAACE1YHfT9iSGfpDBBj0wBKJ/1RzFZtBcKNbN9F+z6OmfIlwqjmdy6KnD2hYKt2+yJH4sqNySgw/KUCuh1m41vEw5E9k8fiG2SX7bWtvT4VQdjSkx8bAHpspRi5F8678=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sGPu62gA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sGPu62gA"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B836C43399;
	Sun, 17 Mar 2024 14:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710687289;
	bh=guYFFkwoi5nrMtCwr4mxXFtCimym0iwxXVwrtBJ9+IA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sGPu62gAkzpTMZ89dAqFTYMLDn43NfgdSUQZjObkHUCs4VSv4p+p1wiLB93p68RQ5
	 SJ42/SQ8phciHvyasr4xTW5psfhNrQGEJJI8/6eF0Y6HhYzoc0NDLPr07c2Nj3RM4p
	 RbaWix3yqWwXN10lV3sAIH+XF2F4KobLAX+hqXDD1ohcibF1YGShoTYlSOBLjCvU30
	 tFmbhfCw3jYuhvW8g4Ypm7O5c7KOW7aCbqsLFYpoWUbNU6+UMfsn4Wa2FUFT5BdgPz
	 YxLoh/axgknYmllERezVKUXSTlEEfWIUEHWaZOUykuOsJ/7z01Mjp5Q/Mj6kJvSRFr
	 K1TqfNOjbqzoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0F8C54E69;
	Sun, 17 Mar 2024 14:54:49 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Sun, 17 Mar 2024 15:54:49 +0100
Subject: [PATCH 3/4] configs: apple: Enable CMD_SELECT_FONT and FONT_16X32
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240317-apple_config-v1-3-1b862bc140a9@jannau.net>
References: <20240317-apple_config-v1-0-1b862bc140a9@jannau.net>
In-Reply-To: <20240317-apple_config-v1-0-1b862bc140a9@jannau.net>
To: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de, 
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000; i=j@jannau.net;
 h=from:subject:message-id; bh=efBW9m/mjVxxFme0pO4/bQ8IJkWzsIngZn6mrb/lwgQ=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhtTvLBa9V3Zy/5YRKpim0BLYFKu5dt/mlUa7W09O/PYy1
 uirjV13RykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIn072NkWPd/T50ry6QpsfP9
 2V/1+XGtZ2DkUK6blTe1XG3nIrm+IkaG2b3TFs+/wPRGSjPE2dz0ddCCOLMLnbLTqo7m6twLU1X
 mAAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: <j@jannau.net>

From: Janne Grunau <j@jannau.net>

Apple devices have high DPI displays so the larger fonts are preferable
for improved readability. This does not yet change the used font based
on the display's pixel density so the standard 8x16 font is still used
by default.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 configs/apple_m1_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/apple_m1_defconfig b/configs/apple_m1_defconfig
index 31d966f0ab..c30aec7c55 100644
--- a/configs/apple_m1_defconfig
+++ b/configs/apple_m1_defconfig
@@ -9,6 +9,7 @@ CONFIG_SYS_PBSIZE=276
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_BOARD_LATE_INIT=y
+CONFIG_CMD_SELECT_FONT=y
 # CONFIG_NET is not set
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_APPLE_SPI_KEYB=y
@@ -19,6 +20,7 @@ CONFIG_USB_XHCI_DWC3=y
 CONFIG_USB_XHCI_PCI=y
 CONFIG_USB_DWC3=y
 CONFIG_USB_KEYBOARD=y
+CONFIG_VIDEO_FONT_16X32=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_NO_FB_CLEAR=y
 CONFIG_VIDEO_SIMPLE=y

-- 
2.44.0

