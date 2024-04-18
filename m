Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCCC17AD92
	for <asahi@lists.linux.dev>; Thu, 18 Apr 2024 19:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713466830; cv=none; b=T8AXu6QJ736blljB1n8MNoOugU71FiOiVcaSOBArF8rL5h5oSZOf8owZo8SQuXBPfJxNUFJbrrq0R5KijA7hhBCGx0pD+XjGFgWSOQ4+585RWYID4w33huwER/mO4iyXQWVGQ2e+7WmhvToLfO9xscOGm+d8QnluiBIGIcIFAe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713466830; c=relaxed/simple;
	bh=Gj0k0JywpqBVVyJNgyoLrUStEU15HpkIEpLz94Eallw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WY6MTs6mEXlgHPZRShjxGQtDaEuDXV4FmqX+B66W3A+npXK/IjxVftGpybgDzucW/v+0u+9r61hT7A0cZu8CpK8P6IUfrDDufN5PZc/PYlI65dyfAsQWJ97lSDRR7MZGlS63AH3NF+U61FB2LN6kEt8R8GqYpOoOoSOaALStN0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=stNIljnv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="stNIljnv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2207C32781;
	Thu, 18 Apr 2024 19:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713466829;
	bh=Gj0k0JywpqBVVyJNgyoLrUStEU15HpkIEpLz94Eallw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=stNIljnvFgwnho9WPkvzvrZE6NwiB7XJw9b8SMN6q/7Z2T0bg5HsxVCfUOVeYk+cZ
	 WZzju8YaukOKlHnSqSB7tq7obGIiITRG5DOIzzLbHh6UhLCkYrjvA2o2ysJ/YmOI2N
	 H4CSD+fGlhxuCAiAg7L5mRmwdFwmqixVRdW96nu0XCsb7wbucWDwQkxwLjmZ1n1+tO
	 hEXt2eVW92EqYsPY/muxthz9kwr2TTWOnzeWbtWPo8dPXpBWgrcM9toAld7h79Jfuv
	 w13EsjuE3tgOEKPl0vMq/sQbhQO9iY3Usj55XS6c+eObzwqJDyI8y/NrO3D6ZHA+3n
	 fgEsoHpUOQnoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10E3C4345F;
	Thu, 18 Apr 2024 19:00:29 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Thu, 18 Apr 2024 21:00:27 +0200
Subject: [PATCH v2 3/5] configs: apple: Enable CMD_SELECT_FONT and
 FONT_16X32
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-apple_config-v2-3-7e5c6b9a9db3@jannau.net>
References: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net>
In-Reply-To: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net>
To: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de, 
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=j@jannau.net;
 h=from:subject:message-id;
 bh=awJWiiYi0FEsQZBJtjQjML0mQJ6lEXedBk0qLMAtjDs=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhjTF3NMrFm359vPJ7aVBhwSEe54zS5uduCxY9PPnnPuuc
 2YpFrkpd5SyMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZjI9G6G/7EyW5TPzDad39Z4
 /UrIDs/uqBmRGoJHjl74es6wTkAy+BrDf7fr0z4EHhL/9nPDTgth6TmCv6cXMyg6sjLk7d4QkpV
 +iA0A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Janne Grunau <j@jannau.net>

Apple devices have high DPI displays so the larger fonts are preferable
for improved readability. This does not yet change the used font based
on the display's pixel density so the standard 8x16 font is still used
by default.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
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


