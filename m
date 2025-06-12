Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2C2239E6B
	for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749735874; cv=none; b=o9la1RlY+5KpS/if/Yx0+cUmg835nzKW/j7PRZlVHF7hpoBA/iUNfi4w8r5ODIUKkwCpIIr2x+qD37bH3Fq1wF8Pr1QOscrp7Drl/uLTu62ZSxzkoUC33Anfx5cbvNzrAV1W6XK4ycOyc6TtaPdv73NxDnkGC0TuoA8EBIh11mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749735874; c=relaxed/simple;
	bh=fmLKNgtKcJwjP5FDnh9DbIUvWbuQxYQ2VpHaBRIju80=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u/D0GRNiIkIOcBse5uR12SdL/abupNbfsWxkxQcoSPUUXK3lwxsQxDNPhpBajLCUkN2pwQpRtl9gQC5aNb2lq//ym540RUp/PAENhljjm/MR+mUGWF0W7IEqxLbgOMhZgHiFcZ3QCGtFZna/FEWoPqUa9H2+KJRVECtmmVbqrJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JKqz6DD6; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JKqz6DD6"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4e575db1aso50014f8f.2
        for <asahi@lists.linux.dev>; Thu, 12 Jun 2025 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749735871; x=1750340671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TAPAekU/LrZe1nJf7fcuyTNybcW9G7I09lCZHvf9oYc=;
        b=JKqz6DD6gNUJIV9Iohbezssan6Bc1TcTje/xkV7LQsZTj3K9oavIi5i6u8mXvABHvu
         H2F0TyVjf5S0WJ+VhkhAX/TsQhYvECz98KwAcoGdCNw3pxlmLRZYfQzBohCwi1oSY3w5
         lIEfQhYlPXdfRxqBHiDRsJ2HG3ZIqyJR9p2GNcXI/i+Vej5yK8N6XvTN6ZVMf2PUAG/H
         77ET9nYSXNjUD+cJRKPq+fY5X7RacBV4Nfb+xBDhUnwdzUKPA91eHoOCxbApCP3XhePX
         K5mWcbEYwTQQv20aGKNDBMNNIxU89gAIDDYq5rQsiRr8HT7nNukV+st3zAdiWeGcVemb
         hW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735871; x=1750340671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TAPAekU/LrZe1nJf7fcuyTNybcW9G7I09lCZHvf9oYc=;
        b=q9+sKhd6FAwQnyAZojs5TMEoYicbJrJy3CvfLaDx/nFffit46fIpyJvSjWa0UZoGgH
         w4nuYYCau8vaLqo8AF2i4f3wTbM13dBb9TGFqg5pX6noUd5l1FfIizrovWwnWUAfIQ7r
         q+45CJQaPWmQB0ccNdJHBk//cqf1V9bOoO/tgdUmEEg3CsRLoL64ovZPwAsYZCVuXM39
         pkXpTiGLXyHM4/9qKQ0KrWrgyI0I9+JgWUh5SdbS+k7uPX5bySqiqPrtktx+qfe2Zios
         wj0BKXI+kfQk0L4inyC9OxAvc58tpOSM+8R64DTgST1lmHjnEh3UZ6zpQG6TncHK9pOH
         ETVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/p4KdRMZ2iXwprnn3DQbWKmsfMny31zh7wkWJklnzesRPKIKBC2RekfN32aHRVXhfPC+eTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxEsfg89fNTQ1oLmBiu1TR8r0bremnhdPylfNMBRqS174iMQZd
	NSQC+rS2nSjbsJw5HkL0V/BPoQWFe7SGzV3VDwIuBtKRqehrXO/mAw0BwuDZcmXTsoo=
X-Gm-Gg: ASbGnct8+St1jOqa3KvBOsfmASp0PfpXtbH6i/3vCr+llIYDITHGN+gqriirxS/EIUo
	GSpLezl5OJSUaualhUpK7zaNf6KM9hnnNy5mPa2YQFWeUuHEUqG5dog8whJA4b1BZDyUYVyW0IR
	UPhbzwk+V23pNhbKLdgLh5xUwf9kfMJZYf5L1fPW1ibEm4tFrpAdcZQFCEiRdc339t6sGU+y+YP
	ythpktY4jcDTO/Cz1EtDwIHRmDV1pMG0WSDgdICXMIYf0GKyXtc/uaoYT0F+1Z0borvnPsdOleb
	67XU055hjhC2zRlL2O0b91jb2WA+yaOQCT50j0A1OpDYFshHNCyjbY4as+n4CScr7dYwYBaBMRf
	lOEFkDQeX
X-Google-Smtp-Source: AGHT+IE+fhgoMi57FWpyHSYtxYdJ8jLOUeAusqX+ark2CzDRRR4iGxpFzDQ3xzR11gn00SA1jvJm8A==
X-Received: by 2002:a05:6000:26c1:b0:3a4:f8a9:ba02 with SMTP id ffacd0b85a97d-3a5586b8858mr2485885f8f.1.1749735871092;
        Thu, 12 Jun 2025 06:44:31 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976f13sm2053661f8f.4.2025.06.12.06.44.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:44:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] arm64: defconfig: Switch SOUND to module
Date: Thu, 12 Jun 2025 15:44:22 +0200
Message-ID: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2107; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=fmLKNgtKcJwjP5FDnh9DbIUvWbuQxYQ2VpHaBRIju80=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoStm1fWX3mgWeCfVDeyKr/swV92niRZ1QIQm2L
 x0clvJz/4OJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaErZtQAKCRDBN2bmhouD
 16UJD/4gbBqdnKUQ84IoVn0fZjjNqBAcba0ix34ZycfQc2PNtNzj0qZHfGCJGVpQOxzcgkoXOEq
 jhWhHkYFtIo6Lsg0VwNqL/L3ekD4JJHQGo960GpnogiLCrnrbpxbshD0lwLcbDRQXIQjLWt0tQj
 fKUm5PbsBezIb+pefiu1vvOmYAVgD32POwCeudbqt8eq6Zm2Vx2tJ6uWY+oSu5O+7pzdMNNFePK
 7dGjAVGZ5KCVNJozzdJhZlY1YGvqXQM5oC8q1P43A6oo4Ie9b5V0JsNahMzjraH5cludNg96ZLC
 v/4snCT7kkqVoiOHeiPRPOSHOQ89QRyEz70ytN9gU7ZtO9wEKVq6t1uF6EIhjG+BIvELqdO/Uah
 HFLOq6ud/MkyU+F3euRxLvrUvNotkQHr2yQyQY6BGRsJKxQi0jodb8ePJA8KOajiIE4KEUry0dy
 Fyyasl030WAwpGABh4Hf+bd7QZYRerUBaFPYpplwas95E50QgGjNnDDMm7QbPoXiIWFmGA+Yw3K
 xIA4t5W9xTZFf84FQgC8P4MaDrkN8qDh1d6qXTtDDkYqklXdv9bwKe2seNkDmzbY0vziJiDXXDS
 hqBYYohbVXBdyN1IWxk1IP1NQvbo9nwur4ejDfTY9tbEJVoyaTO6gsebVFDwtW/m+FAC5Wu1SJD wDzMrRZ67JlN7Ew==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Sound drivers are not essential to boot boards or mount rootfs,
therefore in effort to reduce the size of kernel image (and boot images)
switch the ASoC drivers to modules to decrease the size:

  vmlinux: 152864 kB -> 154528 kB
  Image: 39391 kB -> 39067 kB

No difference in resulting include/generated/autoconf.h, except making
modules: SND_SOC_SAMSUNG, SND_SOC_SDCA_OPTIONAL, SND_SOC_APPLE_MCA,
SND_TIMER, SND_COMPRESS_OFFLOAD, SND_PCM, SND_SOC_SOF_OF and
SND_DMAENGINE_PCM.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

If patches are fine, I will take them via Samsung SoC.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev
Cc: linux-samsung-soc@vger.kernel.org
---
 arch/arm64/configs/defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1..14fcd0a85f5b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -979,12 +979,12 @@ CONFIG_BACKLIGHT_LP855X=m
 CONFIG_LOGO=y
 # CONFIG_LOGO_LINUX_MONO is not set
 # CONFIG_LOGO_LINUX_VGA16 is not set
-CONFIG_SOUND=y
-CONFIG_SND=y
+CONFIG_SOUND=m
+CONFIG_SND=m
 CONFIG_SND_ALOOP=m
 CONFIG_SND_HDA_TEGRA=m
 CONFIG_SND_HDA_CODEC_HDMI=m
-CONFIG_SND_SOC=y
+CONFIG_SND_SOC=m
 CONFIG_SND_BCM2835_SOC_I2S=m
 CONFIG_SND_SOC_FSL_ASRC=m
 CONFIG_SND_SOC_FSL_MICFIL=m
@@ -1021,12 +1021,12 @@ CONFIG_SND_SOC_ROCKCHIP_SAI=m
 CONFIG_SND_SOC_ROCKCHIP_SPDIF=m
 CONFIG_SND_SOC_ROCKCHIP_RT5645=m
 CONFIG_SND_SOC_RK3399_GRU_SOUND=m
-CONFIG_SND_SOC_SAMSUNG=y
 CONFIG_SND_SOC_RCAR=m
 CONFIG_SND_SOC_MSIOF=m
 CONFIG_SND_SOC_RZ=m
+CONFIG_SND_SOC_SAMSUNG=m
 CONFIG_SND_SOC_SOF_TOPLEVEL=y
-CONFIG_SND_SOC_SOF_OF=y
+CONFIG_SND_SOC_SOF_OF=m
 CONFIG_SND_SOC_SOF_MTK_TOPLEVEL=y
 CONFIG_SND_SOC_SOF_MT8186=m
 CONFIG_SND_SOC_SOF_MT8195=m
-- 
2.45.2

