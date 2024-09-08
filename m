Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89375FEED
	for <asahi@lists.linux.dev>; Sun,  8 Sep 2024 07:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725782375; cv=none; b=ozKL36F1sDRDdaxv829qKTVhuRWCjji1p2iw4fFiSrxC076P+qi33dECULw2WfXcU+xVQc8nwvQEL5gzFQqy+41P2kgbUaALxqq46tFKdqemogh/HI1nwDm+zEZxbr/aIWX+pbezIUQOwewrL+DKxo9ekJO9w34XpGI89Fkuzu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725782375; c=relaxed/simple;
	bh=jbSFvKRmOU53nKVT6skmCp2X/sydWQgG7fEHQCHd40w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fXaXsPwdjZmUy6vLKqzll5T/ac2emVLIbyteS5IehMZY/GtCgXq5jpdVW54q7GAUq2rQQ26wYLXsYelL2VRWKa1zvqvDy2teZJAENGBhsoOM1TvLMkL+R6CPfGmKJQo1bfcNxRBoZ1tMY0iYhPUarXAcDb0Zt9fZwf/YueU+uR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUtQCHC6; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUtQCHC6"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5e1ba0adcb0so868607eaf.0
        for <asahi@lists.linux.dev>; Sun, 08 Sep 2024 00:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725782373; x=1726387173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1vxC7/1i8CwujpweZ1wTUP4heu2CRN+sI53b8o2l2Nw=;
        b=eUtQCHC6eDqGDbXl3/vqiDrfqWypgQREz8rJhPAv7uJlK2Eg5MKCpzKWTZXc0hrvBF
         aK2Pl0LjWCw4dxICGIZX2y486U0o+D39gJcNoc8KUrlY3BnXAD9ti5RTpkK/KOVwVZHS
         dqit1f+xVMInUOLtew62DHReixJ/kCk734SPR/pI6qsT9W95bprS7GjNhWUBvy0qOQ4J
         fB2VG6XBIROMl2KJkhnsuG3SqJ+m1QBwUk/u3Dr+lg3a6MKacacnpgt1kaceQHfJCgZ5
         ETA/MPwy+zWU2UV+0yZiPi89L4Fs2Ob7RAKbc9uLRk0v68tCFGdBhDPbrFQWzZoCYK7g
         +WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725782373; x=1726387173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vxC7/1i8CwujpweZ1wTUP4heu2CRN+sI53b8o2l2Nw=;
        b=KFc43CmQK0S3jPohOqiJYfgaO3G3Pqn7CzDFiCo/f++2Zotg0Oa2Ntf7sK/SEDgzJg
         jzwP5pe02/cyxYESnL7nzr6ZpJsh+DBlIy2SqtxmV62fTVTUmtN8RPqMqjqQHsc0u4Gf
         eUSAMHoAfdB+qTj4GVgmpTbCjukxBM6G3JP3SfrCRVp5+Sc72Ayldi60RyeqFMS0EDgN
         UVD217EAlMfEVM7J6uoOlpBSiy3lB/DLUAGdzPvMgl9ZgqpyWMk7Xb+qTV3cSo6zxQOm
         /oupOujYSM7ro6ZoE/vGfNNL5TJk0SMikXNzCJjEnbKK+ONxktTz3/1SC4zAWY/sDrzU
         xpUw==
X-Gm-Message-State: AOJu0YzPHxqxSghoVitbfQBBLxOZGRFXLoDnY7XO9YiBDCYZdsOf3MnS
	O2Gtzzq/AE3oAsx439PSOekfwmcJ936n9TCqwaxB8gBX1wQM+StI
X-Google-Smtp-Source: AGHT+IG2oi15GFOnc4iepyTdQsMnqiBXkibBTS5arEx2FbGWXrLqY9KDnKuLXcROgxDP2ZZUq7RAjw==
X-Received: by 2002:a05:6820:2213:b0:5da:a2fd:5af9 with SMTP id 006d021491bc7-5e1a9da272cmr7835288eaf.8.1725782372868;
        Sun, 08 Sep 2024 00:59:32 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7d8255dc1c6sm2012690a12.68.2024.09.08.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 00:59:32 -0700 (PDT)
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
Subject: [PATCH 0/3] tty: serial: samsung: Serial fixes for Apple A7-A11 SoCs
Date: Sun,  8 Sep 2024 15:50:47 +0800
Message-ID: <20240908075904.12133-1-towinchenmi@gmail.com>
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

Changes in v2:
  - Mention A7-A11 in the comment about changing register accesses to
    MMIO32.

  - Use BIT() macro for new entries, and change the existing APPLE_S5L_*
    entries for consistency.

v1: https://lore.kernel.org/linux-samsung-soc/20240907111431.2970-1-towinchenmi@gmail.com

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

