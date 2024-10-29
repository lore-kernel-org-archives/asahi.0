Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7A57DA9C
	for <asahi@lists.linux.dev>; Tue, 29 Oct 2024 01:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730165481; cv=none; b=of74SBLXmqxNK2/nBxFk76jIYFHc2Tb+n24UNA2eC5HMcZPgYB70XBelMODQ8c4tGr1+gJbie7ZZ2JuIGnPXGVFgwlbeiv/d8M/ArGFBdr5DfccUj7CqkfZfbcuo0wpSauQ2XpEtunDk4cM3r04paPT2SUQ7q9xOiMvKlmeD4q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730165481; c=relaxed/simple;
	bh=6fAcAqpXTciIBerQvj9NeAzXhK41rLKSjlVQqYmzxWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UBYF8xTDixHq20mnmxdUQZK9ckvVj2QMQ4+tnufsLDOIve2tAoiw0X4Dv4B620Moz91xxMv+SuehrBqlI4mTIrV3BdTcW0zhRNv2XaSQkhRCYA20fDRSel+aQp/lp0kp9iGhrdT/NDXygiWv3hSrr10frTG96DCCagpxFunxRBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtMc7ZvB; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtMc7ZvB"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7eb0bc007edso2278638a12.3
        for <asahi@lists.linux.dev>; Mon, 28 Oct 2024 18:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730165479; x=1730770279; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mTMUiHHYVMRUoicKPTQrikup5KdhwmqMJsFGyJ97y1M=;
        b=BtMc7ZvB9GOhwiWUZIF+1jP9+iFbtrggAphxElak265fc2Lr7GvULitVaBUP6Kj4Ue
         Zi4bwMPqpXIKl78bMpqi3bi540Add/BL0BuE5KIvIfMRjy3EDtmzN9pFr6uegilH3D4h
         1vGvLtrMDD01P5NA5gR72N4Ez7EBpSpqXumn/me3nl69lLb49XRiBwO6NEQ4ggjA1ryG
         ETWb8A3ZAGWULzcgMhO+BiPPOKaTKZbuZKcg5jWxADC2ao7Rmy6VVI35zCxOpgiE6IgI
         JUQUHEOrrYCVvKHB0IiVYyhNYU5dphyfd4QSc2J9hzx8xSmBTw9eY54lwL6eNwt7MqMq
         qKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730165479; x=1730770279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTMUiHHYVMRUoicKPTQrikup5KdhwmqMJsFGyJ97y1M=;
        b=IH+yQm/w72gJx0O/AKArmlfejKB3tVIJ7souORktVUrkSFormK7CA8Bl6KAcRufZVJ
         hGv1f2NIo+rsYNdCp7ulI9CabitaQPyP3EHION/TzBCPkrvdNwN/Ha3IuNAXRiz+rfXA
         /0EahviIkBA5VYK3WO8x4gqfeN40evy9Ce7ZGjXbmXn4iQsl3PclMZtNXZ9gIoIR4o4P
         2H4PpeW8OKAnq9nTtAelpXBheg+DfMaPmCj6I/0AStM6Rq156K2ECUHBDZ2czZA7fkxQ
         SRpV3upbv4s+wa2qHtZKmu+xDistEQOsb3cYhFmg+5PGzUju21ah8SFHeVKqk8Xsp+py
         o05A==
X-Forwarded-Encrypted: i=1; AJvYcCWK0yvpzIxkbWbXEs36Mhia0YPO/OPAvQ388VUWZ8Lb6AUSka6zMgis9/4xZjqsc/TtxooJ8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGY4HK5JTRZpILrq8iy/AV+LWUUjjkrz1pnSCmJPGmzvNQxINZ
	EZAiEYSwrLJRb0i9ECsc7/FYEo9bE8n0y56fXQlGwpnRYLgvFtW8
X-Google-Smtp-Source: AGHT+IHpTVvjwrQ3EcoGKK0bmJ6jA8y24xXtEro+uTiZy8kx8QQbwEUeJniOAu9P1ssNSK/aTxA2WA==
X-Received: by 2002:a05:6a20:e30b:b0:1d9:d5e:82a6 with SMTP id adf61e73a8af0-1d9a85169f1mr14366765637.45.1730165478664;
        Mon, 28 Oct 2024 18:31:18 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7205791e564sm6686529b3a.17.2024.10.28.18.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:31:18 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 RESEND 0/2] watchdog: apple: Increase reset delay to 150ms
Date: Tue, 29 Oct 2024 09:29:16 +0800
Message-ID: <20241029013055.45538-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase the reset delay to 150ms as the Apple A8X SoC can take up to
125ms to actually reset.

Since the code is being modified anyways, also fix a bug where watchdog
writes were not actually getting flushed after requesting reset, depsite
what the code comments said.

Changes since v1:
- Fix an existing bug where watchdog writes are not flushed

v1: https://lore.kernel.org/asahi/20240930060653.4024-1-towinchenmi@gmail.com

Nick Chan
---

Nick Chan (2):
  watchdog: apple: Actually flush writes after requesting watchdog
    restart
  watchdog: apple: Increase reset delay to 150ms

 drivers/watchdog/apple_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
-- 
2.47.0

