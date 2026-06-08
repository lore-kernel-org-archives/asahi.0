Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E252374722
	for <asahi@lists.linux.dev>; Mon,  8 Jun 2026 05:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780896946; cv=none; b=g/zHGTMzjyI/j7WGWMSaWVCYNQW9xAWqlxtnLvh/Nx71Q21pS6gjpKBGFhXKQAyup1OzjDPcLyljL1FWzO10qWvtfz7yQWITG3VGQFA7m3Nl/fHvVVYvM+u+KiXDgJV0tHMBNclba94dqBQh7jc5cWMY7GAXC2/KOk4xZD4MENg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780896946; c=relaxed/simple;
	bh=xE/GJzSVGgoSmHZMtGEDy/FU6D6YtLajxsMcX0XxaPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bqYq31HisjBrCduEBljcBeZz/l8lrvdBNDgJ6isMwiyP4bu+fuy+H5DbZbjC2DL6STD8eVo8YV0iY+7HkCJRfIMmRP/z7TLqfYnT1ydreEvOZ8YUuNtj9tV5/aqyDIHJ4Oma503yzDp5FQKEGtKpWFjdhGWmwXSW8rm2vORnlFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbtO5gBw; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbtO5gBw"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-36ba285e98bso3773810a91.2
        for <asahi@lists.linux.dev>; Sun, 07 Jun 2026 22:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780896943; x=1781501743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wpy5I6qrcZoBL+aAYboFR4xjmZ4wLohsQTQs1EK7ZSs=;
        b=MbtO5gBwT4HLAugDiMSIck/RJ5dSf1rSlihisrw7iJOlL46Hf9s7gooIdvg+v6IT1f
         96eEh5A2nILbTrcSledaxsJKGaDONcal6Sj7y9sRc8bz4bjMsSWg40PbkcBltrDto+CM
         am0JcEBcWdHUodEcl3ZmW2fkB0vnpT9I3eRtknkW3tfh6RnYsnY6ix3gHvS4Te5vBHsQ
         /hMc082Ui1Fm2EX28k/H++Yj2dj4prsfKnVaDnd64sFiFo7CyMj0ppHIgbjbQ0Y7CoqM
         bpvs2IbKeQGUmiL3n1p0b6+Cvpu9BblbIanWXCixmXznLszMQy7xC0V2fjA+h7lt5aIM
         TYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780896943; x=1781501743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpy5I6qrcZoBL+aAYboFR4xjmZ4wLohsQTQs1EK7ZSs=;
        b=A5/ilCbqCLwk5pDWCcfXfYLmT79SD6KihhV3rhkAZNw9ZAL7J5lKT3RAd2meXDjQ51
         P+xzrKsx9SdPOYJi9pEjWLqrfbm8p4nYNUi/8edTvhaBnCdLg+LHCRR2BdApquLAnMK5
         775brydX0ecHU6NqDNcZibvOQB6T30VmdM9gv5oAPj/sMJXoHLdn5ScNJ1BZ6TweAcXj
         5ZB3cs6JaMdO1jaEqZZPDPPf+FwQiIlhoz3/V2dKYdb48gtcV49gDYH0z8ammGSDqUN/
         UK2VM9pyfEYDmktRr+Q+6bhcDSwEhPqaNrHfbGMQQsJ5Nsgy3FlH1k/KIBz2O7Hww32M
         QgGg==
X-Forwarded-Encrypted: i=1; AFNElJ8BwCbwvuouVbotkrsml5MC0pYa3DADeWXaRdTNi2+bKYYKl2VS1pzv7dMZ+XBAJ8FpQyZsCw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtJzTCgG3c0oJpgeexlVFcc2ntrf9czjM7itr3j9hWtgg0bJpC
	GM0Q0OL1cMM8e4bcpFKcIvCUNa/dWbJYIfCYb/AIdGITZMXJIFnmUT8v
X-Gm-Gg: Acq92OHchKIrAouGgZw8bRA6TRa3NJSdVFrQLLHC3hDufGXP7OEqPPFyOTeoIRFu9Cw
	tvFiH3udiCzHDYyJn1PHn/h9Y/HJySoGmZYDV/Q8ezcEGY+fRNHIq1mQKkS/n3ZoMcU6V+97QMQ
	obDrOcj3Oix5o+VbnLJj3JZacsCNMqnnwZ6G/gphGfTerfTp5m4Tx55kZkNLSMykAdHeyEbBLEp
	V2Z79/2+1nyzJlftjvD85lKkHoKF34T+agiz5xuWzhIdkfsFV9igqSY2ZH/WMjholr/ykFqBRUE
	JNsraVhJdW7a57snjJ+mqRovi6tRLI1eDP02gyZVarslwSTgB5PJmTEA7kxXDTIqDbgrWxG6BT1
	YhT3VmolLfw4xMQQLnwnUl6MVo/d/83RqPgnRcr5FFf+eQjXdAfRkMdtpRZ+QfijuebdKaw7Nkm
	UdATa6/SpS1ZJWMrHbcd8KKoWtRS2MEcuWNPuo3nHjtnQsWTFLQ5CpKcVZLcciSJq+TotdDTyZJ
	lSsrSl686AzOSt26giZzlKsWxUf98Vi+O7gewiXfc4z5w==
X-Received: by 2002:a05:6a21:4688:b0:3aa:c93b:625b with SMTP id adf61e73a8af0-3b4ccd77c1dmr16839353637.3.1780896943548;
        Sun, 07 Jun 2026 22:35:43 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a61b3sm14526743a12.17.2026.06.07.22.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:35:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-phy@lists.infradead.org
Cc: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	asahi@lists.linux.dev (open list:ARM/APPLE MACHINE SUPPORT),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/APPLE MACHINE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] phy: apple: atc: remove stale kernel-doc for removed struct members
Date: Sun,  7 Jun 2026 22:35:25 -0700
Message-ID: <20260608053525.12354-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The @sw and @mux members were removed from struct apple_atcphy but their kernel-doc entries remained, causing kernel-doc warnings.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
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
2.54.0

