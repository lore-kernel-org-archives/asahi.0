Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BB814A609
	for <asahi@lists.linux.dev>; Sat,  7 Dec 2024 13:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733576694; cv=none; b=Gz/8BKqBNj7K9FME+D0ZzNYFzYJmQtnS+MeZp/jnqlDJMH8ztBKI6CH2PMzHLdvFy6v+9xn3nT1CsUlRd8g+MdCmmm/yE5r/ayrt4THHwRNPq2DTIOO7U2m9YRv3KXB26zmzpqKR9xdvs1ATBI6CdQnqrNfIa6v2HnwXPgMoRrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733576694; c=relaxed/simple;
	bh=xbMDhkWnVIJmZc2hbDYYC8Fz8jfR0f5DvBXM5oOGGqg=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=iFY/qIiaFyY7JNj5a932ZrRNPqt0jnhSpRjfc9G+xupozyqGNh6kvY6K45c6yIKq7Ysoz4qPbw45FnqBPx429obDap01nwIDI4itMookUT0t/tnjyF0AhwY0jB7/J6uIMXfkd96c2BSD0RlfFNfCxWxaGolhtWljZ6sFDZxID0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKqDrxvQ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKqDrxvQ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-215909152c5so34014625ad.3
        for <asahi@lists.linux.dev>; Sat, 07 Dec 2024 05:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733576692; x=1734181492; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=moWB21d17IXR2Ld3TZN2U112qJtHW3wGr/Qsd74h1mg=;
        b=IKqDrxvQ2h+85nw2t3I9JFcKhe0Mcz5DkA5iVByTXKwCcGGOKe81xK+8boQwV6nQY1
         /Ixq8xcxSoN2NFABShsNHBrVt0Wseu26DvyP+Tja9bwBvlUwFAoSmA2W/GNfMy8+ZVeG
         m+LRdAwmfMxWm2nJOt/SVQVwdq26mzBolRfwo7lxZ3waCUgls+wQrRCRZJKjI9o4wy1z
         8kNhVd3kxTK1savY4Nt8NLD/QOweRsBfUmPO+Candt4aVJZapahC3ZcmzF8p/XCufVjm
         wwpO5pcZcowJbYiO5krAVBcZbBhB1Etxvd8cQGfZUIOgyFbgwepzog4ujyfsxjaWDjE3
         wEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733576692; x=1734181492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=moWB21d17IXR2Ld3TZN2U112qJtHW3wGr/Qsd74h1mg=;
        b=so4FqtDZd0lUBWdgT1qv7wAtii3L+eVZepE3chFTtfRKLxNISoOcjmHnp2QsIblBqU
         iJjh+YpALRT4lOqBDlU+qYuU/oA8O/7wIAX1FIsBlvuKvTy9VJ7sO3iFx/cTidG+3Ja+
         E4it2BEDyggYnnFj65UwbD6RgzbWEQgna4hcEeubL1bkhAE2AF08wzPMQWrQeaxTRCnU
         P7FDn1ljvg/kDWmXSV0FH1CpsGZtZKkJ0FZKSZNlVBcRquW0BcRcSDPSkKOAlnf4O7eN
         HZbDbz1WvxmFB0pkd2W/cCRVq5KE0hkvlbS4OlLJ3pwlDtMFGoH/oVb4VZzWwA4M5ys9
         +buw==
X-Forwarded-Encrypted: i=1; AJvYcCV6WOInCvrh/9FGAUwZBD+mv3w3q887bSGnqSm9eqBAlfpR1TXGZaLufzFIf8NRrInx7Mxv3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YynX3pcRBgxkff7sMuK8NYeq04T/uCRM5/6JPLL+p0ITdkOZ56d
	Xkjg+BAhfXWSQkdaZ5+nHPKcPk1c1aU51LRZgnFRZ4FNDBARDk+V
X-Gm-Gg: ASbGncuTCZ8nza0wtO3jpmhX0kN2gwIpYqESwH/rxzegVKPwhadMql7Wqbx9trIzid3
	o1T1Df7SpaHFH86bTN2ZzBiLHZAgJihqLYLIqI/AEwHV9hYvxil0RqMd++IA6rLcpfRFECCKtPV
	OM7kGxt+xBa4CgEeE4zXkisMlCokzQ5gDcjdaK5IfHU0Aws9O1Z12t7iMy+xjtKz9HzIZP76R1G
	acLsQdV45VKZ9bzb6uUkGf31OlO7RLLmPu2Zdu6FkMHg9BwUZUxnvf98KGZyvdf1g==
X-Google-Smtp-Source: AGHT+IEXK6h1lriVkUgeA8NkzsgEpDjD4uXCqmEP1oor2nMQ4lKCeHQ2ggi4Xw9LEbdrlC3ZH0E/BA==
X-Received: by 2002:a17:903:124a:b0:215:5ea2:654b with SMTP id d9443c01a7336-21614d5435fmr111914685ad.1.1733576692163;
        Sat, 07 Dec 2024 05:04:52 -0800 (PST)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21628c59730sm12779715ad.105.2024.12.07.05.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 05:04:51 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Nick Chan <towinchenmi@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/3] Apple DWI backlight driver
Date: Sat,  7 Dec 2024 21:03:13 +0800
Message-ID: <20241207130433.30351-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches the backlight controller is connected via this interface.
This series adds a backlight driver for backlight controllers connected
this way.

Changes since v1:
- Fixed dt-bindings $id.
- Make power-domains an optional property in dt-bindings.
- Added missing error checking after devm_ioremap_resource() in
dwi_bl_probe().

v1: https://lore.kernel.org/asahi/20241206172735.4310-1-towinchenmi@gmail.com/T

Nick Chan
---
Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI
    backlight
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  54 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 124 ++++++++++++++++++
 5 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.47.1

