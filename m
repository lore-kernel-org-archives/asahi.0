Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B92017AD8C
	for <asahi@lists.linux.dev>; Thu, 18 Apr 2024 19:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713466830; cv=none; b=sGfxtcWzKgu8x0NiHnUULPLFGZN84I5b58oLyDyQeuxLKEaUEI3HVBdemGm0RwXGYAz0KtlBBDkdzt5HLdp97F0Z5ns4HVRVdH9xpqA/2L7ZjYk3qWuXB0VwLmNvRr9o/UalTo8PGiYQdeVj6Q9OenXz2dz2fYzywqu05nwIg+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713466830; c=relaxed/simple;
	bh=FBJF8TwEarYMbU18f17+c423zfMKKM3xK1+QDqFe5Po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=krSZpAxBLYgQBzYJSzlB0UR3Z/xBAzUFAIl+tKMWaicVa520ydUfHJGly99OnYH+0EiZHSj3iRQqipHQs5l3a3MquRZ3XfcKvZs27tgsdHY4LMfoSIiIC+JOkF+3dyY3wEPQ1CQRrPQQeiCF+pe7XzjQdEijZyPc94SVPy7qG3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkuZpxmg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkuZpxmg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC038C3277B;
	Thu, 18 Apr 2024 19:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713466829;
	bh=FBJF8TwEarYMbU18f17+c423zfMKKM3xK1+QDqFe5Po=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZkuZpxmg9B05LAIJ3MxoYfk4QaeC6rGemy+jBgLfd+tOqTEvkHxYQfLI3Us4ZGLBj
	 7srfLwlMYdtZpoU8+vRvoWiGAavXA4T6r1Sy3wU2nhDXR3v2EWQwn8V/RLrihcRwHh
	 Kjowpon51hSEanXY6g6E1M9+f20gaguKbIlUvK1IWYYHRCCHyaJL8rvLYktgiAdcGu
	 xfovTLEI+rcnCZqSI9UOdZiBV4883XxJ+Ps/QdW4noNn81JJhWTav8NiRdgkk6qQyX
	 7JzQj8T6N4308/3grvV4REvnhtBut/M6+M2gslLQZrfFe/++WJv0rRom1r4s8vKJCH
	 YbdD7LYums4zw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4D96C04FFE;
	Thu, 18 Apr 2024 19:00:29 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Thu, 18 Apr 2024 21:00:25 +0200
Subject: [PATCH v2 1/5] apple_m1_defconfig: Turn on CONFIG_SYS_64BIT_LBA
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240418-apple_config-v2-1-7e5c6b9a9db3@jannau.net>
References: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net>
In-Reply-To: <20240418-apple_config-v2-0-7e5c6b9a9db3@jannau.net>
To: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de, 
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>, 
 Hector Martin <marcan@marcan.st>, Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=911; i=j@jannau.net;
 h=from:subject:message-id;
 bh=iW3npaSaVV3BNoLkHi1Fz7M4xWDJIwJ9UUkZXz6uLiw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhjTF3NNXd722eRf0L+uN9dHzE+wWdz+KZXmQutVUfNnEO
 7aGS4/Zd5SwMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZhI2FNGhguXF709x/5k8b/Q
 C+lrmLetrv/l5P60t+n24oo59jnv9rcx/JhhO7uyYq7ElGPc7sZ9KRW6r529Xh35OoUto/wvx4Z
 YdgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/default with auth_id=62
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Hector Martin <marcan@marcan.st>

This makes USB HDDs >2TiB work. The only reason this hasn't bitten us
for the internal NVMe yet is the 4K sector size, because the largest SSD
Apple sells is 8TB and we can handle up to 16TiB with that sector size.
Close call.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 configs/apple_m1_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/apple_m1_defconfig b/configs/apple_m1_defconfig
index e00d72e8be..31d966f0ab 100644
--- a/configs/apple_m1_defconfig
+++ b/configs/apple_m1_defconfig
@@ -10,6 +10,7 @@ CONFIG_SYS_PBSIZE=276
 CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_BOARD_LATE_INIT=y
 # CONFIG_NET is not set
+CONFIG_SYS_64BIT_LBA=y
 CONFIG_APPLE_SPI_KEYB=y
 # CONFIG_MMC is not set
 CONFIG_NVME_APPLE=y

-- 
2.44.0


