Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D9B37F73E
	for <asahi@lists.linux.dev>; Tue,  7 Jul 2026 05:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401034; cv=none; b=RhPTG0r5fkHMag/U8WCTw96qbz6I4k628XOLY64I/8QjH1NCOyevGYtwnl3sZBakQ37NKKfryoKFjq0CZPY/gamJZItRF0xJ3XTT73qPaOuWMuH7coHThdcUcrRYayjKezQoS9t9qguFjaLVoI+kxcrL1qePM8hbcBgtLAADn1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401034; c=relaxed/simple;
	bh=BisDHo1gHDak+rGDfU9Nkz2k1MaaDjZewmjMgDBoI4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LUknK4zhcjxS6R+bODFZHZbxWQWlEI4STgLuWTe/gb9YfvEuLpwRUv0yfCaU2XISZssI/bV5ocU0JW1fA+E8Qisvhch82mrdYDi2Ji2fgoXk2NyniqatedUU28V6FZa7Iw5LvT4AwXBR8EDs+muz+WM2haT12LhZW2LKTetMiEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kuy++kyj; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kuy++kyj"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8454160043aso3696129b3a.3
        for <asahi@lists.linux.dev>; Mon, 06 Jul 2026 22:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783401032; x=1784005832; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjmFUecGWdo9lqtWqlxObyMes4CRt5uDc3GUmA57Qmg=;
        b=Kuy++kyjtkTTRPb4mJ6lGXKglyzx2UNpOSuDZuZ4lhDAcJyWXHdFGwBPFIVjR5FgnA
         +MN3ECPUoWiwXRVT6hvV+TjmirqFJBEfX5EozLvy4d8wWNCYNyPl3+hbytY0op7+NaMT
         epUGLvDX+UsGzNzD/mpIjJdjlW+mY0cGq5N8yHHdAPj+t00wUAwVBXYrmaoESFxPncO8
         kVZY3I+v8v2qbUbNnWon2Ww/mK6FbnNDdF04gxtKox/zkRz9OyalBIepRoXKSESisbV0
         DJMGAdx20ZcCo2kvvnFY+ueo9m59iWCa99SC9w8JTpD7JGNGtuHuHACjWfbQdeU4iEQf
         OGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783401032; x=1784005832;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjmFUecGWdo9lqtWqlxObyMes4CRt5uDc3GUmA57Qmg=;
        b=jyGxE4wGMJib72aWdUsU47eqDcf6BZA4c3fvLZsp9o4kuURPLkJaVN/YjGhd8yBmY2
         wjM7gwSPuT4cYmaqpP09vS1Clilpl7JkJZEBDmKDZmDP8Bb44ozg5ZACDwbVkp067+Lg
         4fuTlqk632qv5T8FO/+EByK39M3+986o9qxklVyNzBMT+KKRvSqAqSu6OWf6v1rGgsO+
         YqySZnjG2PxCVNPtMnDbpv0G7BwVW+wz2bME9Q7PUpFjaHsYXoHWFoNW1GNyemJOSS32
         qnnucbNDYnT71sB3yF3Oqsh91EgQ5KAIrFBb35jKrKpqPOCC7+FBA8JQQqqisjMPph32
         bKLQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbflF4DeNQj5N0uFtgraAnr5XNhP3k857Nc/MnOMoqr+7OtwxjsD0mtAliPxaRO6sLLGexbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzYtRebklFzPGY4RebdPNpimyfVthF/qEvR2jpmuB1PJ7RrlmaQ
	z7zqG8Ibw7lMlEyvtZoCoypYyzrgOTABRSWPtHH8cZHpZOqTglyJK7ed
X-Gm-Gg: AfdE7ckrJHGqcKbVTXyRcUJ9YXbtg29MJkUvT2N1PMqOeExbnmd7z+mqhzliCjIljHP
	Qnip15K6XSg4N8VVqZ6KOEjrDgYHSIZv+9MPeqhG5cFtaUTB0e8Vgefk9LZZy4z/J2syj4gyX2a
	UNQFWt4LoJQuxX9NLaFU29Zp91gBUMzQbem4PiP35bplip3eWJOOe3GufcPlBwhCmoMv3h88QJy
	HqHiksAUOEnWK6nosROjVZFIj/fHvxTIxNia008hcGgUacQ4jH6Hiv5xoUts+6Xpy1DiAIp3n4M
	1bgKt01YJnWoo8GkBRnxIxN/bsD7sAyqAO9TPnjUj8LJtgFfUsYcxpfb4kXem8KTkEBjCTBSQxY
	Q1qbx8vtk+dhisdxzvo/j6Z65xDkHUF1O89CFHiqYT3LhfOU2vR8sSPFyrqfJuEJ1gXYpcXBnEM
	4x3POOxD6dWbt7Bp6zae8vdOU1cfCp7nKId0Tf4Elwi0PhusrMUaA2mHMYJA==
X-Received: by 2002:a05:6a00:32ce:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-84826d69104mr3417418b3a.26.1783401032300;
        Mon, 06 Jul 2026 22:10:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4dbdesm4728495b3a.31.2026.07.06.22.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 22:10:31 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	u.kleine-koenig@baylibre.com,
	kuninori.morimoto.gx@renesas.com,
	christian.ehrhardt@codasip.com,
	Linus Walleij <linusw@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Chris Morgan <macromorgan@hotmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Rosen Penev <rosenp@gmail.com>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Teguh Sobirin <teguh@sobir.in>,
	Val Packett <val@packett.cool>,
	Luca Weiss <luca.weiss@fairphone.com>,
	wangdicheng <wangdicheng@kylinos.cn>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 00/24] ASoC: codecs: Use guard() for mutex & spin lock - part 1 
Date: Tue,  7 Jul 2026 12:09:42 +0700
Message-ID: <20260707051006.20058-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series converts mutex and spinlock handling in ASoC codec drivers
to use the guard() and scoped_guard() helpers.

This series is split out from a larger 78-patch series to improve
reviewability and allow for incremental review:
https://lore.kernel.org/all/20260617103235.449609-1-phucduc.bui@gmail.com/

The changes are purely refactoring and have no functional impact.

Compile-tested only.

Link v1:
https://lore.kernel.org/all/20260626061329.23264-1-phucduc.bui@gmail.com/
Link v2:
https://lore.kernel.org/all/20260703055355.244898-1-phucduc.bui@gmail.com/

Changes in v2:
 - Added Reviewed-by tags from Charles and Richard.
 - Incorporated Charles's review comments:
 +  cs48l32: Removed the unnecessary else block so update_bits() 
    is not called when no changes are needed. 
 +  cs42l43: Switched to a helper function to avoid code duplication, 
    while keeping the guard() conversion since it eliminates 12 goto 
    labels.
 +  arizona-jack: Reworked the code to use an if/else structure, 
    avoiding code duplication after removing the goto label.

Changes in v3:
 - Added Reviewed-by tags from Charles and Cezary.
 - Incorporated review comments from Richard, Charles, and Cezary:
 + Remove unnecessary blank lines in arizona-jack and cs35l56.
 + Remove temporary variables and return directly in cs42l43 and cs35l56.
 
Best regards,
Phuc

bui duc phuc (24):
  ASoC: codecs: ab8500: Use guard() for mutex locks
  ASoC: codecs: ak4613: Use guard() for mutex locks
  ASoC: codecs: arizona-jack: Use guard() cleanup helpers
  ASoC: codecs: arizona: Use guard() for mutex locks
  ASoC: codecs: aw87390: Use guard() for mutex locks
  ASoC: codecs: aw88081: Use guard() for mutex locks
  ASoC: codecs: aw88166: Use guard() for mutex locks
  ASoC: codecs: aw88261: Use guard() for mutex locks
  ASoC: codecs: aw88395: Use guard() for mutex locks
  ASoC: codecs: aw88399: Use guard() for mutex locks
  ASoC: codecs: cros_ec_codec: Use guard() for mutex locks
  ASoC: codecs: cs-amp-lib: Use guard() for mutex locks
  ASoC: codecs: cs35l56: Use guard() and PM runtime scope helpers
  ASoC: codecs: cs42l42: Use guard() cleanup helpers
  ASoC: codecs: cs42l43: Use guard() and PM runtime scope helpers
  ASoC: codecs: cs42l84: Use guard() for mutex locks
  ASoC: codecs: cs43130: Use guard() for mutex locks
  ASoC: codecs: cs47l15: Use guard() for mutex locks
  ASoC: codecs: cs47l35: Use guard() for mutex locks
  ASoC: codecs: cs47l85: Use guard() for mutex locks
  ASoC: codecs: cs47l90: Use guard() for mutex locks
  ASoC: codecs: cs47l92: Use guard() for mutex locks
  ASoC: codecs: cs48l32: Use guard() for mutex locks
  ASoC: codecs: cs2072x: Use guard() for mutex locks

 sound/soc/codecs/ab8500-codec.c           |  12 +-
 sound/soc/codecs/ak4613.c                 |  83 +++++++------
 sound/soc/codecs/arizona-jack.c           | 117 +++++++++---------
 sound/soc/codecs/arizona.c                |  26 ++--
 sound/soc/codecs/aw87390.c                |  10 +-
 sound/soc/codecs/aw88081.c                |  18 +--
 sound/soc/codecs/aw88166.c                |  24 ++--
 sound/soc/codecs/aw88261.c                |  21 ++--
 sound/soc/codecs/aw88395/aw88395.c        |  24 ++--
 sound/soc/codecs/aw88395/aw88395_device.c |  40 +++----
 sound/soc/codecs/aw88399.c                |  15 +--
 sound/soc/codecs/cros_ec_codec.c          |  18 ++-
 sound/soc/codecs/cs-amp-lib.c             |  11 +-
 sound/soc/codecs/cs35l56-shared.c         |  22 ++--
 sound/soc/codecs/cs42l42.c                |  54 ++++-----
 sound/soc/codecs/cs42l43-jack.c           | 138 ++++++++++------------
 sound/soc/codecs/cs42l43.c                |  16 +--
 sound/soc/codecs/cs42l84.c                |  10 +-
 sound/soc/codecs/cs43130.c                |  72 +++++------
 sound/soc/codecs/cs47l15.c                |  11 +-
 sound/soc/codecs/cs47l35.c                |  11 +-
 sound/soc/codecs/cs47l85.c                |  11 +-
 sound/soc/codecs/cs47l90.c                |  11 +-
 sound/soc/codecs/cs47l92.c                |  11 +-
 sound/soc/codecs/cs48l32.c                |  26 ++--
 sound/soc/codecs/cx2072x.c                |   5 +-
 26 files changed, 353 insertions(+), 464 deletions(-)

-- 
2.43.0

