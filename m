Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBB91B1400
	for <asahi@lists.linux.dev>; Mon,  9 Sep 2024 08:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725871374; cv=none; b=f52oVL6H0KraR3xla65zo2y3Qn7d6oSyu5NBk4Ka2ZjPNMbmlpjq92AqIMpr7MzLmXo+VkZm1eKfACUeP2RH8aPS+mrurGnZdud73kExc9kMaXYXhZ1pT9cO9i+pv41rJieHO2NvPECpXypDBAyO4wWLKalFiiTL3baeqa7ttsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725871374; c=relaxed/simple;
	bh=xKd1F8AMa6iLEMCT5CxTZYVGKrUpbi5VyPWC8eqSoic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eYCNCIryL0pagnP0/RyiyQXOwGidjcB7o7MNGkz5NJQZswYjdPlOrsQ/XCGoxSCWSWt14ijt1kAxtT9jS4HttHtXW70wvB9mCU/XOg4qb5C3qiHVu+jwB1TQrLo498OxxrlGPHGxWAKKYGdh7UwmewxFaeGu5jpw3S9iIklYLb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kwHAx6rV; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kwHAx6rV"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-206b9455460so32806645ad.0
        for <asahi@lists.linux.dev>; Mon, 09 Sep 2024 01:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725871372; x=1726476172; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D0V7TB65jfCSDJctjTYijcIn0PZ8E4sHEf+LCXzJaNM=;
        b=kwHAx6rVmqhl/+71q6qAgC7xyf4apbqLijV6HaP1tgMlHAsWSmOmZTGw089qGnlrMT
         4FLOgbmEzdb4c7uFniwK3q3hPnsZ8yuySFL4d9zmT1DSo87HDa6Lhv89srrBhTmHqFGS
         1ysUfkZbrjGtnaVHsh7eQFvocJ/JZ8ODQjJJoCqkNWDosBm1not8IWO8td7MCDmqRhAO
         zag4UFFwhruQl6ma1LWkiLpxXgp+z7a21fvxcm2L6e4BTAY/HD1eMY73AogGhviZW0YS
         JThKON/OLI61C4GJ2PjpnqcbWo/G+fxpuvGFcFDdOlpqaNVBCzAx4O2bjAJfsKF4XeJy
         ffLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725871372; x=1726476172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D0V7TB65jfCSDJctjTYijcIn0PZ8E4sHEf+LCXzJaNM=;
        b=wdOMQNJTuPDK1BcoKB/btpBOPI3zrVlE8TkMCbz9X7Dn4jyPQU4MHOonetKR6Hrqdk
         yxgVq0tgC4I9LxNFVYe7fu8LmLY+lljn8VGu6Mc/wh7Bp7oNRdbUpQJlIKlFYOHLiqmQ
         cBy8+yxTXRiaNm6j7wRozrlvVIT81XsN7+K9sAcdt+f2GQjCWtPhRFyU+RtOsWa7dn5q
         FLdaLSay3AYsZsACW0bFiOJdJXfs+w3c/V1WTct2Xtl97SLVbzbowaKDkcdGGUl25/MS
         9SlFYs/vLfPxEwZ64k5i3IZrA90aMMaomRbIJ/duDg80EDS5bpeRWwx8nQv9USuXOuUV
         UeGg==
X-Gm-Message-State: AOJu0YwIIDu4X6AYEAnjfgO/78StDWlUnocgGzS5MPFZgugmLUM2zUtc
	VvCS1hE3bs+nSiIpMW6uordIvS6a4dW8Qo/WDXi9oEF8246qJfbV
X-Google-Smtp-Source: AGHT+IEmpzqq7HlCYQ/AwpVz0yP4We+SivUqNdMDBseS85lpNBrSETaIY8zGm3Y4FctQy56+TfqyvA==
X-Received: by 2002:a17:902:f54d:b0:206:b618:1d96 with SMTP id d9443c01a7336-206ee75720fmr151653315ad.0.1725871371805;
        Mon, 09 Sep 2024 01:42:51 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20710f1d663sm29678675ad.188.2024.09.09.01.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 01:42:51 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: asahi@lists.linux.dev,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v4 0/3] tty: serial: samsung: Serial fixes for Apple A7-A11 SoCs
Date: Mon,  9 Sep 2024 16:37:24 +0800
Message-ID: <20240909084222.3209-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series fixes issues with serial on A7-A11 SoCs. The changes do not
seem to affect existing M1 and up users so they can be applied
unconditionally.

Firstly, these SoCs require 32-bit writes on the serial port. This only
manifested in earlycon as reg-io-width in device tree is consulted for
normal serial writes.

Secondly, A7-A9 SoCs seems to use different bits for RXTO and RXTO
enable. Accessing these bits in addition to the original RXTO and RXTO
enable bits will allow serial rx to work correctly on those SoCs.

Changes in v4:
  - Removed fake Reviewed-by tag added by accident... need to stop
    making stupid mistakes that wastes everyone's time. The remaining
    Reviewed-by is real as far as I am aware.

Changes in v3:
  - v2 did not declare itself as v2 in subject line... resend as v3.

Changes in v2:
  - Mention A7-A11 in the comment about changing register accesses to
    MMIO32.

  - Use BIT() macro for new entries, and change the existing APPLE_S5L_*
    entries for consistency.

v1: https://lore.kernel.org/linux-samsung-soc/20240907111431.2970-1-towinchenmi@gmail.com
v2: https://lore.kernel.org/linux-samsung-soc/20240908075904.12133-1-towinchenmi@gmail.com
v3: https://lore.kernel.org/linux-samsung-soc/20240908090939.2745-1-towinchenmi@gmail.com

Nick Chan
---

Nick Chan (3):
  tty: serial: samsung: Use BIT() macro for APPLE_S5L_*
  tty: serial: samsung: Fix A7-A11 serial earlycon SError
  tty: serial: samsung: Fix serial rx on Apple A7-A9

 drivers/tty/serial/samsung_tty.c | 22 ++++++++++++++++------
 include/linux/serial_s3c.h       | 24 ++++++++++++++----------
 2 files changed, 30 insertions(+), 16 deletions(-)


base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
-- 
2.46.0

