Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B9117AD92
	for <asahi@lists.linux.dev>; Thu, 18 Apr 2024 19:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713466830; cv=none; b=SPavA5wXcAh93oPjQtpGK3XomSsy+79HbEblkfHiBZ2AaOAWgARMPur0D4g7d8mNKB6WthIRSyW5ecWRNiNrpRqLKGFcOIuGEXiD2cWb1ALN/x7DK3Pu6GoCKSD8kd5O9OIjWTqFK1r6LOMKwjZIi5QpO9bDhW1C50r7XiLlmeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713466830; c=relaxed/simple;
	bh=I/gWLJ/54Jrj+2I7OCqF3ATdRHZ5ajf3sCx+so4scNg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nX69HInNi3UUkcdSWJKJc+KgA0Ooo/N7hAA1ST0UQcoIGpoOEwr+joj0F5P75m/SIqYg3Ui6aX8CHfbpw3a0HvBJ/nwR/ExpRWgCkuqM9aGzeKldx5vITQQNc/J4ZWtFKN2zfSWRDfxSmL6PsHFXqhpmFZFwbgwKPvBfUO6cYoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rsgb02T9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rsgb02T9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 017F7C32783;
	Thu, 18 Apr 2024 19:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713466830;
	bh=I/gWLJ/54Jrj+2I7OCqF3ATdRHZ5ajf3sCx+so4scNg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rsgb02T9TaB0FdCaCuEuY3UIUuLREHGB2yOJ23pCiIc9FXGcEoiNFvYXQjnCle8yS
	 6gmQL8bvMXIml5FS5mk7FH1VDnMADDo068AtNP2skZvr7nYiksLdLLv6o6PBUMQ8vn
	 iZm3eyPY8veKKMQy3qBT8bCVt+9GVW1fJKOzxNMIylZfadd59c2GfismyzgbHPMBUj
	 Ji5LX5wZTZvsf/N+UWESdMfF+QA6mMxQ9Q6MXvkoe6HTJadS6UyM56M8pVFelmQneU
	 ahNHEV/04g4jb0AEDtmrNiX4sCAe2xfDLJxX4pjdPfooDoL7OhqMFn5ytgMk27PtkV
	 pvAEDEJGrV0UA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1C6C04FF8;
	Thu, 18 Apr 2024 19:00:29 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Thu, 18 Apr 2024 21:00:29 +0200
Subject: [PATCH v2 5/5] arm: apple: Do not list bootflows on boot
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-apple_config-v2-5-7e5c6b9a9db3@jannau.net>
References: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net>
In-Reply-To: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net>
To: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de, 
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=652; i=j@jannau.net;
 h=from:subject:message-id;
 bh=aKmGZalIZA4d3jN5L9yo43E4OSWpBFF1+lCA1zAzZAU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhjTF3NNdt+0OSJ1iF1Cav3DTObVAQVcOQ7V5RSo55pWtH
 2YVn3HtKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMBGeKYwMXTf227KazXKKWiRr
 k+ZnkFEc9u73dRMF1Xs7/Ey3rTsiyvA/eZYF75yw8xxmRg7uGVEN8yRniFR+U//0Y7dX//2C/i8
 cAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Janne Grunau <j@jannau.net>

The bootflow list is only seen briefly and is probably more confusing
than helpful.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 configs/apple_m1_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/apple_m1_defconfig b/configs/apple_m1_defconfig
index c30aec7c55..4eac1a9e2d 100644
--- a/configs/apple_m1_defconfig
+++ b/configs/apple_m1_defconfig
@@ -8,6 +8,7 @@ CONFIG_SYS_CBSIZE=256
 CONFIG_SYS_PBSIZE=276
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_DISPLAY_BOARDINFO_LATE=y
+CONFIG_BOOTCOMMAND="bootflow scan -b"
 CONFIG_BOARD_LATE_INIT=y
 CONFIG_CMD_SELECT_FONT=y
 # CONFIG_NET is not set

-- 
2.44.0


