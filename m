Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9281558B7
	for <asahi@lists.linux.dev>; Wed, 11 Sep 2024 05:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726031297; cv=none; b=pWoSl40Mt+5AOv5ODsHb3er3UuWfvqMmKwQG32uGAHicaD6IOgZOgnloWQXg9NUMvDryEshWgeXc3YDpRbU2MImuSO6srQ8Xmo6vYIgwiHRluYl6uyuioE46WKAeYy9iivaEHQq1J7OWXXI+stsGynAmEqPiz9tuvEdrmf/TqK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726031297; c=relaxed/simple;
	bh=AwzBXZIzFQKKCdF7T+KzC877Td4dtULqKAPc7SXlFYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IrQw5vnjgT/3Y25o5jnrFR3WT5rvT5n+HEHPAckeBTjqX/kTYTvaMRUOqPcDUCcfG0/woBXTIZa5W1Woif/k6wfUdgdDVabt/1XS6uQIQ3rCXoMbmPoLWvxEP4AiLhnj/1Xa6J2jg/caPVz8RrgeijVntnU5JAzc9Te+8gjxpp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rvzs+bOr; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rvzs+bOr"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7d50e7a3652so3635794a12.3
        for <asahi@lists.linux.dev>; Tue, 10 Sep 2024 22:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726031295; x=1726636095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FJNquf2p9Vd205iSBUl3QuEluAS8I7046ZFy2HBvaPU=;
        b=Rvzs+bOr2O2WJEeLtuVNQlsT6yFOUfS1E2f2Hh9wPavw0nCwDWZG0NGHufS46UyWlA
         I+o8c5CCywOnLxMhyEaXc7Aic0wNLaIebtC8PH0a3fIMJT2JwyFCiKNx5Y9FGHL1Rarg
         mQuJDmCHvHm2Rxc9uA8XMod7iMdH7bYW9DOF7DefcZPxY7kcC1qwcGuh+tt0qOI+YZ/u
         cu40TfCveZiIxIGIzmYl+GUIZd+/qgwb4JnFrZBvnTIHF/KMl/BfnKdQyvINpe0p/iKB
         yf5Nyk0CKHWCH5csTZ8rLz31fyxcTxpx/wKNLOc9ZCH9XONR4Q7vYhOy1AXhqs9fGcTZ
         yABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726031295; x=1726636095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJNquf2p9Vd205iSBUl3QuEluAS8I7046ZFy2HBvaPU=;
        b=gHC2Zj22VuFwaLDQAkjE/Ll3hbipP0T8aYYh3X9e1htiKFIO69/R4CPxzZghqCCGzg
         FyxKBQtjzRSGrgrpCp6j99CMIJqpH2NOV07tTS2abc4YtGTeqo2GdOXuY1q/L6MrcJkv
         KTE+Z+H+cwF8unSyth9YuY1X8SUO8TS3q6uRdaae/bW/VO2/5uvIN3GtJtFgCgB6+JU0
         uALzIaEHVwCSBQZL7ltg+1XEKhURl9r8FHYcRd/aWNbGM6AdWgwRW6aOKvT03SXuxF1b
         UcBqYzd2NKaN4uO7UUMKvVaQ0nzDpiWOAJmnZzdMFWVdEfvgZPAgAEY7VJt843RsERqG
         muAA==
X-Gm-Message-State: AOJu0YyabP4zh9yBUQMZ8hb+7r4oIZwXyQ9+iUXmB8G1HFx8Cp1ufPU8
	XJwzuV4t5mUpCUGRy7Efepim8mWEWFQMYIAYxFZFFdCyPIm5LrZe
X-Google-Smtp-Source: AGHT+IGHyQ/thpVPHpLlMROm5PaaH2JXUVeTNkTbxO/M3qZ9x2+zgfugUFwAwVylRL4VZAW3TYD2Yg==
X-Received: by 2002:a05:6a20:c6cd:b0:1cf:4d21:f4c1 with SMTP id adf61e73a8af0-1cf5e094debmr3981813637.19.1726031294830;
        Tue, 10 Sep 2024 22:08:14 -0700 (PDT)
Received: from nick-mbp.ust.hk (wf121-022.ust.hk. [175.159.121.22])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-719090d11e6sm2156984b3a.205.2024.09.10.22.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 22:08:14 -0700 (PDT)
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
Subject: [PATCH v5 0/3] tty: serial: samsung: Serial fixes for Apple A7-A11 SoCs
Date: Wed, 11 Sep 2024 13:02:10 +0800
Message-ID: <20240911050741.14477-1-towinchenmi@gmail.com>
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

Changes in v5:
  - Convert existing APPLE_S5L_* entries to use GENMASK() macro in
    addition to BIT(), as suggested by Andi.

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
v4: https://lore.kernel.org/linux-samsung-soc/20240909084222.3209-1-towinchenmi@gmail.com/

Nick Chan

---
Nick Chan (3):
  tty: serial: samsung: Use bit manipulation macros for APPLE_S5L_*
  tty: serial: samsung: Fix A7-A11 serial earlycon SError
  tty: serial: samsung: Fix serial rx on Apple A7-A9

 drivers/tty/serial/samsung_tty.c | 22 ++++++++++++++++------
 include/linux/serial_s3c.h       | 24 ++++++++++++++----------
 2 files changed, 30 insertions(+), 16 deletions(-)


base-commit: 6708132e80a2ced620bde9b9c36e426183544a23
-- 
2.46.0

