Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9E5348C5E
	for <asahi@lists.linux.dev>; Wed,  8 Jul 2026 12:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515033; cv=none; b=rMGS1kju7be7DXVcJ/C15uOvNtkB3D7bI7gUD+opIazRRZF9gWqA0RCZ0GglxkjBlCJl174EuiPVVjS5zIA3BkSwFocNRYA3aiFEQwzGxM24MTNLoNWsqSO35KpCe3Thn4OaBKuhn/AYGYGJUc8NjFvQ8xmZCaCtoFWqUzBR2cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515033; c=relaxed/simple;
	bh=w11QooIMUNCBToWMi2codyMg1YXbxG7zD9BvFPZfqrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HY950T/mGP9hKppMZY8+DL4AqRyFnKmVyxuPTr/ftDS7onyIQIDJIEiBbhAjzoq0oV0Iz/P3Dl+J6Ikyx6ksdmpyw+lAkTrqG12b8KGaAQ698G/k7oJqwsGOBZdcOTWSlPPNfccu3M0xP8uXJrM2Cp5j/GKTHJo9uAQZokjb6eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBBtIQTV; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBBtIQTV"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-382ef647e20so717419a91.1
        for <asahi@lists.linux.dev>; Wed, 08 Jul 2026 05:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783515030; x=1784119830; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=g+8LUBht7Ch9JyJgm4hJtusVhllo3ouZ+moFwd0Yi+U=;
        b=XBBtIQTVG5FOh1WHnllJmRP6mZ53xRsE2Ys9sanyJK4O8f1DyaxjR5fW1HOeCU2WUp
         8EwFaMaTVQmGQ4t/UkOdRM9iEVfj3+oez3EBPVX/REhyKrnfz7aH79ugbYwrndfT09TG
         w9YBWdPPKcbko3SMy/7s4Kuh97e5NOYtLxhZ2aa9reb2qyurmLtF6Az7pRvHM2ZUYH9H
         rIBbcdzXdt/jamD7pA8tr8PNHrt6mJ21aXMno9zPjy/eP2aHzw6HW8F7PEXwq/5PgIX0
         qprIHdf3Hy5/tdDmmRyebvI1/omYLl26Abwif0NcwzpxkKO9RJhBNdZeT6lSD3atm+xu
         3PKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515030; x=1784119830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+8LUBht7Ch9JyJgm4hJtusVhllo3ouZ+moFwd0Yi+U=;
        b=BL12SZJfvPVy3DuTmRnxdPS4tN1P+k/f6HQT5VHgqVh1ZoG6+Xrf+aqh+x1+AH7JuV
         ckn943Ahu9VTVGcWxYSLBa0evFd92HUpB/dheZf/QgyUiuePvHxJoRu5FscEvQf5fEWn
         J/kJDLYLOkCYRE1IqXjhsMXOcMhqzrPNVYZ6YNdwT8v6ZQoKC17vLWZgEA+6lpcKx0gw
         w2Nd9Uepf4aIOcHvMyoEhiWmeIYNryuYXAKtv5EtnULLlGZCMPn4707TOk34uFspYrSa
         y/m8MiYuLuSspnbo8YuelhF6NEP76EKuAPubOr8tMzIus0l24nElbp9KaYWjKtYYhr+I
         vZLg==
X-Forwarded-Encrypted: i=1; AHgh+RphUmHypXBQDNrdU/g2pqY0yxOGudtSqE2v1A3J6KN8ShI/+h2mt1vDT7LlVKSeZ+NUFkeU2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIQijP0mAMuFlpsxEmwxnm3GXK31rwtH8+lt46FH5m9jAtgj6X
	atrY1U1Mn72NL4PAKAnR5QfFRBmvV1tIphYP1cFBjWx4qso9QI0r9EVN
X-Gm-Gg: AfdE7ckJ5KSL6vuz/iDIUaEXcMKQFo4I03sw6saE6eHugaCfZ9HPM3YqsgK/GzfqUlH
	QlWNC8sVBuubvy/3BLbn5b4Ftb05WLhuUqTz40pbOLNvsDV7v7/LsgvXs//PYEFYCsl6YZXSvO8
	Jkn/7j8t7TaBDFCq2LZ3KM5U1jLD3wd0nnCSPAJeg5zAsVeLx2dcn5D3Ecywd55MxsTfadIbskn
	dfkE4sPCNgz0wfhduUhDDs52Z8ZVTZKs6fLLmzyAvUSNLNIxodxVEouLHozEPLn4IDd3RRgp9ia
	FKC5K9khud6shib5zzSjTCUZHSBZky0BqbASrPPYfkBxUs2+uWsvO2R6gPcO9rGJAbci3auJqlx
	PQMPQR6i7i8bzoZPj1PYO4IiKnQt7HX4I2Wj6T69zPG+rfiRGo6V5LVf6cL9yMlSPqzWGCvkMNs
	26fgzS63vtkP8w3v1V8p1QBtxi2I4c9xVedagsQDlDh5VzukY=
X-Received: by 2002:a17:90b:2f06:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-38941101dfemr2493491a91.7.1783515030068;
        Wed, 08 Jul 2026 05:50:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a2f2fsm2784349a91.13.2026.07.08.05.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:50:29 -0700 (PDT)
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
Subject: [PATCH v4 00/24] ASoC: codecs: Use guard() for mutex & spin lock - part 1 
Date: Wed,  8 Jul 2026 19:49:37 +0700
Message-ID: <20260708125002.202515-1-phucduc.bui@gmail.com>
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
Link v3: 
https://lore.kernel.org/all/20260707051006.20058-1-phucduc.bui@gmail.com/

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
 
Changes in v4:
 - Added Reviewed-by tags from Charles and Richard.
 - Correct the patch subject from cs2072x to cx2072x.

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
  ASoC: codecs: cx2072x: Use guard() for mutex locks

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

