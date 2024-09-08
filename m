Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8FA27442
	for <asahi@lists.linux.dev>; Sun,  8 Sep 2024 09:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725786594; cv=none; b=o1avGTcAhsyWZ0VPqPNKs04ya+t6SGDG4WtV7PR5N6jFkpSd9jaD7+KZQDqQXUQhRWuOAEzX4Yvr2skkhwdZcgGQk4qVC1YtoYLbEwWGDjiQHdboUvl6qoiWBWa1HjSj4XrMfQWRrWonNTLIrEjE77scQG496N9v+VyIBoeAQQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725786594; c=relaxed/simple;
	bh=svCxVGsa/8PNo8WhxAO+A8Py+MLSAKYV/i4L8dFxmVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JoUX6ywmfiyAbB/EUR6eQ7sTePNP9yy2EzA97qvJ/I7jLrfZOIfgIsIQBEOKn2cexEoYhrx4+NLEnsrDWLlSq6AJJ7kd89gGdq0o1CvtxtNq9s+E8dwwDpfoVLjCjo/dIm221aUHtonEfxKB1/YX+0w8jVTnV3hNzL2ESi5y1Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dj0RXlpI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dj0RXlpI"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71798a15ce5so1982462b3a.0
        for <asahi@lists.linux.dev>; Sun, 08 Sep 2024 02:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725786592; x=1726391392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/gNzw4sLO5OwQYehDseOZcIx2jfb86y7Omm19QJL7xY=;
        b=dj0RXlpIbZDfay8OPq2CqqMK5WWwyaI8za9L7Qx0515Eic2f9Ck6rhPvcwj9fZTIWU
         Xylvo7Xj27JdsT0w6w0cIU0xGNcldxggdS4bGH+TQsaVe/cg8z+NHFwWBFGSaWs/JJW3
         mBsofjxfwJDlNGVwFuupuoNbmw0l83WJJl8A2NMkh2Yt3hxEuxoV2JYLqoSd7s7UieQ8
         5P4I+GzuNhz1mM220p6le/CbGuwd2z358uFchbtONXAW3BhvJPUFQT9ROFpl8JYSIDTq
         mDbNCXkmE28e9ARhbfYFQlEku8zbCqCFgRUZQZ3sVzLl+IDZ47cqgZ/UPm+KJYMjjk+I
         cxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725786592; x=1726391392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/gNzw4sLO5OwQYehDseOZcIx2jfb86y7Omm19QJL7xY=;
        b=Of8UtuH6o7/EtJXbD0JRw+Z1dgmAr+WYbFanISHpAEQwefYejiohl/ctZHZg8bbI3q
         BrYM/sgVtGrWPnmH7e7zjppLcEppmu+4KlKn0cxh2K6Y0Hhgg09bS+76G3GePCTclOji
         /4fVxV7iOlOtFHhS4Q3AH53tvvirRyDvziJoqyiIbF83aZVT7i51ThG0+p7Wiaub/2NC
         8udonfzPASpshbT/1HwAVO8PxRjwBokJyITRVYkmnZ2x4PsIcRDltoYEb/viTevm++mN
         EJsXg6+E5k9ng8tZgR9bRMKy4M0j4GmjoUlIgxTJDVC58ndzlEjc8tD7He2Ph3eYIFW/
         qULQ==
X-Gm-Message-State: AOJu0YwXk6uhweMgO1e2k3dX7ho8KCrB5Smk3X199Vg8kklAmA8UZe7J
	xtFQbmi0hDK4Cym3YCC78WnsAemtp9thvSzbpuRomwEm8RpDmor8
X-Google-Smtp-Source: AGHT+IHx8m5Rh7j/5EvSb8iyw4iqFyvGjBYIsaCoOfj5/TDhu7GqeDaaSEwRT+ZXgw+5d4BzV8yi4Q==
X-Received: by 2002:a05:6a21:31c7:b0:1cf:351c:ff8b with SMTP id adf61e73a8af0-1cf351d000dmr3644660637.21.1725786592145;
        Sun, 08 Sep 2024 02:09:52 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-718e5896e10sm1821439b3a.31.2024.09.08.02.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 02:09:51 -0700 (PDT)
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
Subject: [PATCH v3 0/3] tty: serial: samsung: Serial fixes for Apple A7-A11 SoCs
Date: Sun,  8 Sep 2024 17:05:09 +0800
Message-ID: <20240908090939.2745-1-towinchenmi@gmail.com>
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

Changes in v3:
  - v2 did not declare itself as v2 in subject line... resend as v3.

Changes in v2:
  - Mention A7-A11 in the comment about changing register accesses to
    MMIO32.

  - Use BIT() macro for new entries, and change the existing APPLE_S5L_*
    entries for consistency.

v1: https://lore.kernel.org/linux-samsung-soc/20240907111431.2970-1-towinchenmi@gmail.com
v2: https://lore.kernel.org/linux-samsung-soc/20240908075904.12133-1-towinchenmi@gmail.com

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

