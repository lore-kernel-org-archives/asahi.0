Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6611718CC0B
	for <asahi@lists.linux.dev>; Tue,  1 Oct 2024 17:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727802040; cv=none; b=DjVChRP9BwPNDApwgiFMZ+A2YhzKaV/gGCBaKKFFEphkVpn5c5zdoV5Ua+mpEfnj1etDra+VU5h9qd+gGAebbz1Pl3irH/QuSyuS3diGWaENio2i2m/qFm9SjxKx+Pcrj0hyGZ4j3jl/a8AqN5xn0NfYrusoWEe7W01zw/bgkbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727802040; c=relaxed/simple;
	bh=A0gLps0VqNrD42zdu6s9fwhZ0eP7bRGJm33qpT654ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gZOs6u7yZ+ItNMt0jsj0QIq3GKOZElB56Vh4w9zF3voG+pWOI89l1a3Zn+R04QT21VPVOlbaizfViJ3+zmBEglBvkjlGTMQ+rZAemtQ6Q21VLj+UwunAWR8OKJqtaS5sPkmPq5D6zYV9gmikgJClP85xFr7NRbb8Q+vAOe9vFdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVdRD4VN; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVdRD4VN"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-710fe5c3b44so3413866a34.0
        for <asahi@lists.linux.dev>; Tue, 01 Oct 2024 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727802038; x=1728406838; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/QFFRq6FbM7/+BnU4Q7XaV/HWPgLY/MsBemdyytLyHk=;
        b=dVdRD4VN9g3HYG5+f9vg5UDGMRPHAkBm7s4BLl9vghP3pLa73U33/5eFQwqytdjD9/
         II4l3ljNIrokJQVlEUPGNZFl5R99xaHxOtwCbHVRtVWT3oeVe5npkRigF70HzSkwZlGB
         k1CWj6qofWgyGKhggWZoBGD1O+iXaitjW0fndwvsb2XRmqFFJ8Pg5jr1hUnLaem646kP
         ib0qm1k3KiNsFwQK8q3SpEA/BG8pBQvThHTqjigePdOHfMAtgN6eu+sNmktpVHnzEwK0
         sScWUa5BAp2dq8tPGwGzrtX50R3RyU6/1H0CWB5IRKl7ZNFXGey2QnrEPFLx0zMIjdHZ
         6dKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727802038; x=1728406838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QFFRq6FbM7/+BnU4Q7XaV/HWPgLY/MsBemdyytLyHk=;
        b=QYe7MKfK1lXpjFc5mKS6BW7/mMuWRgSrlg3zZqiR1WlYxSX6U/EfkbeZzSOBzO2Jrp
         wRhCF6ppUFJT39yctbrU0863rmjeWV3kBAugiLx9+UWZwR5Zi0kQ28nEntDXJ4nCnPhC
         29AwHMwtGKv4s2crtCWoHqJIJ3vm8+gwlASrX8dVoRpto60IquSv+MG9aKQqSxIV4rR0
         DDvKs2/e9CuVRIFSiAz9k7jWAi+WWvhP8T4ohVXo3iFSjmsevKqmmqntk3gqN2eXotnI
         XJ5Grctf9a5LoQ55fPT2ES29UymPOi4Sc4jAiqdKMjUSKV7vfiGBH7+4Op1BGFhNi4OB
         pqjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA1swpxETVULMXGxwkc9OYisBoGfb+bgODi74KT42uUVqrGIp1MK/Ks1Rf1UL1Dd94HFo4Sw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywe5lAhXGtO4eFvRngAniv5sMCSfvUNbz4EkuVkvYw7LUP33vbf
	VUzShqEYVz+pM5OSq+5mNFlAyxyK50cbHl75sR9bRboT/CD9KFrf
X-Google-Smtp-Source: AGHT+IHFMj8zmgWl46T4cvkR9/THnVuc/vRc0F0i12hVhXq+fbmktXRXE5UFCsX+OXeQgnrURGw0NA==
X-Received: by 2002:a05:6830:2682:b0:713:7e2d:225a with SMTP id 46e09a7af769-7153cde99b3mr295707a34.22.1727802038169;
        Tue, 01 Oct 2024 10:00:38 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71b2651623asm8234054b3a.120.2024.10.01.10.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 10:00:37 -0700 (PDT)
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
Subject: [PATCH v2 0/2] watchdog: apple: Increase reset delay to 150ms
Date: Wed,  2 Oct 2024 00:59:50 +0800
Message-ID: <20241001170018.20139-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
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

v1: https://lore.kernel.org/asahi/20240930060653.4024-1-towinchenmi@gmail.com/

Nick Chan
---

Nick Chan (2):
  watchdog: apple: Actually flush writes after requesting watchdog
    restart
  watchdog: apple: Increase reset delay to 150ms

 drivers/watchdog/apple_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: 77df9e4bb2224d8ffbddec04c333a9d7965dad6c
-- 
2.46.0

