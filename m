Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C68220680
	for <asahi@lists.linux.dev>; Fri,  6 Dec 2024 17:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733506086; cv=none; b=eK6TIJ80uIAsytaPEjmKHXYnE44G+Bl54eqKgG5q1IkDdYHBLw6y4UEjgOWsrSE8E1oRRxRNlGqtoZkh5r0UFjfE6MGyBWxAJQtC/VDIW0ufY3wi7i19+2TT+0L0HBV/mGuq0EEY4Pdq0MhqE3HDeUnZgQOQZEowZoEUG+iKi+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733506086; c=relaxed/simple;
	bh=HlaaRQW87AgnjRT+Y5IQ8DR+U13+RaTnBT1HpwvABQc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=Ga5iURgIx2VaBxYhnvE4GN2nhB0M+iLhU5m9lUns7xQJHyLnLckOzxK6dVacBrSW2SUBss2ikRgrUXMXj0BX1ITKp0uzs0rUFbHutsy6Jx5wODFBhhQADtmfH7AW8M9jwMMhJQZVFAFoCDS4TuNlakjb1Ymfy02oLZvdNDuVxjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsrUvnRK; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsrUvnRK"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-725958d5ee0so2354862b3a.1
        for <asahi@lists.linux.dev>; Fri, 06 Dec 2024 09:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733506085; x=1734110885; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4y2ki+6zul3gbLgcnSK/uoLUEGgMXT8pqStVpvvXP2k=;
        b=LsrUvnRKg4VQnITiKqut2YFgErwRb3BIcTWNC46BJiSU5Aa0G0vrKQeMlI3v+6+FbL
         OkGVBM7w13Nnx12jfYyefMTQlj1AJ3RL6PHyzP+v/yNm8ihlZ23Z9QLjSJxTYyNcFCry
         goPK/l7IJxXJFiA37uSgGsM5gRRzcCYH7ufpoeWeCWxta4YQvRSfDREY7goYl4scGFM0
         MKZAO0YO7OZOpyWs6+5971Dek16jXGatBlhN/ydIHiqbIhgVWC5RPwCknEzOyAJx1QjW
         0TgyPRlrXLNqjNukB31D93fW4wZT2m106zE0JeWfmg6ShkbsWIxmKQheVU84J1TD8a7f
         8pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733506085; x=1734110885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4y2ki+6zul3gbLgcnSK/uoLUEGgMXT8pqStVpvvXP2k=;
        b=sjqiohMebLV1j6gpUWqWb9Au+wCimKrrcHljY/FwS68/czpsK9Q/HvBDGcHDAzAwzD
         Jnm2Nn6MjOVHMBhHRR/MhVz0ahD6nkyK4wpnytxZwJzknBbhIfYYgIYvO++Q4O2wtcA5
         azzWy7B5RB1Ky9UXcG7pOExWduZZ5hckGVlTp9rbJLud+/JD5saPfChs702Tqp1qzdWH
         Iu+UrlUJbIh71/PA91l4y3EINiol6VLY4tev6h/nx4EyvGueaQ4w3AfSSj0FcPNGEK0+
         8khaw/Sk20pqU/HbYX7+wzM0aF37g3Rj8ekaBYp8AVQeNqRSGV7xrsrtfXFSNAdc+5Jn
         uutg==
X-Forwarded-Encrypted: i=1; AJvYcCX4UC51fQhqbX2P7bmqhWYBHoU/TCfhX/nniSqRYAxmHN42adT+ISrIFQDJA/Xdghyimg+E3w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbswopHp6uAvQrI5m1O2tFRpUnIHBuwioRn1SLsxHg4cCVG3Qy
	CyOJBMHS+NKa8MQCPuTRN8puvNpejJ+N2f/I7HqxUYBL7eXqGBKl
X-Gm-Gg: ASbGncuf/A7Ia4to4Ch/UN6OLvForxEewOr02fFIyTsU37N6RnqWsl6BqvDPFss3HpK
	+n7+JaLHKzEv9X1E8yfw3afEpQhAsOXd0ax1TRaxkxqe1eI43HpOEUcRtgChEpEAkS5ue0B6FJ7
	RVkK/nVDB4qavf6fxFZlZrb2cs5vRy9ZwF4QNawuM4Q2yN0ENU1umbZczTtbeuSvntFeN4fwM1c
	v5f2tE7QZ66X1VBmaAghx/gSpBtX53mS5Cmg7Yn07qBEo1PuaJbb2Y+oRi5rxUe+WtA
X-Google-Smtp-Source: AGHT+IHXdwewDIPQOXtv1iEJ1h+wD3M9qyi9bwIoqyxS6+rfSqoJNur+gfxUq0L2I9fps7PZzh+XJQ==
X-Received: by 2002:a05:6a00:806:b0:725:90f9:daf9 with SMTP id d2e1a72fcca58-725b812aaabmr5813954b3a.15.1733506084740;
        Fri, 06 Dec 2024 09:28:04 -0800 (PST)
Received: from localhost.localdomain ([49.130.54.203])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-725a2cc6950sm3204512b3a.173.2024.12.06.09.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:28:04 -0800 (PST)
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
Subject: [PATCH 0/3] Apple DWI backlight driver
Date: Sat,  7 Dec 2024 01:24:32 +0800
Message-ID: <20241206172735.4310-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
and iPod touches 1-2 backlight controllers are attached via this interface.
Though, to software using this interface, there is effectively only one
controller to worry about since the registers changes the brightness
setting on all controllers at the same time. This series adds a backlight
driver for backlight controllers connected this way.

Nick Chan
---
Nick Chan (3):
  dt-bindings: leds: backlight: apple,dwi-bl: Add bindings for Apple DWI
    backlight
  backlight: dwi_bl: Add Apple DWI backlight driver
  MAINTAINERS: Add entries for Apple DWI backlight controller

 .../bindings/leds/backlight/apple,dwi-bl.yaml |  55 ++++++++
 MAINTAINERS                                   |   2 +
 drivers/video/backlight/Kconfig               |  12 ++
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/dwi_bl.c              | 123 ++++++++++++++++++
 5 files changed, 193 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
 create mode 100644 drivers/video/backlight/dwi_bl.c


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.47.1

