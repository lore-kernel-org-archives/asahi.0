Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1173D25A2
	for <asahi@lists.linux.dev>; Fri, 26 Jun 2026 06:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454431; cv=none; b=V+aidk7DFumM2704yTm3G7ucoDkDnoo9iAhaxqeKueu8d+8VXUxOyZai2ERNj0j0+ieNrrEwgLKNvoA6m4pAMN9Ih9HHkSMg5if9AvTKr9BjDeeYcrC3FoCMopP7DAV9CSXNRim67zGRQgKlGfiw5NwFcTSPG9IVDtoFSEsB2fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454431; c=relaxed/simple;
	bh=R6SYI3hSlHmFpqmI6l4ZS+xTVB2si9oTQsINCx6aWdI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QYl/IeCbAkI393BMiFSfCtN2kB8I/LNKrm4i3IiEURjPqGDtaZXU7ydjawqKVN0aFCc0nnMggK7DW28XnHA4UG2MyeX8xVldt08NZJ6YkOWoZ1i01rfGL6DpCSAjLgAMWs8bB9WBmiPpeXln3THM/wn/kmAGpaETn3plPLdqV4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUsibfYU; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUsibfYU"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-37dedd62b90so375391a91.1
        for <asahi@lists.linux.dev>; Thu, 25 Jun 2026 23:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782454428; x=1783059228; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V/0td7aWGEXYKguHC2/uXp2GMai6pr3CtkzjBaJbjro=;
        b=mUsibfYUKpL2fwpijJB9Kig40UTZiWIhfK5srqKYV0FNKYd248LOggdbWwutu+INS6
         xEWKUCYhyB9jXBwSq6KA1100B5I1Ik8WApHqq17QiAR6yz6/7XzguGK2Jua7fjTGRQGu
         XfGmaHv89KZI/6cuxju0KgV94W8ePTVGxCN4oST9nCkUAlXLIl5tb0fCX6iXwPM2/RsA
         s3brCkZhP5dwpna11iR9BW3WTenWZK3J31X0oibMQ3G1MgaXHvw75HqLXMxfgk9m7LIf
         oI10qYLONOYphdmf/1yv92+C9kVaq9yVgr8MJLDaP/Od9Jw7DT9g7p/1P3h2hR1OzdQn
         mkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782454428; x=1783059228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/0td7aWGEXYKguHC2/uXp2GMai6pr3CtkzjBaJbjro=;
        b=OfBQHbtD7ka7PcN0ez3lmxrer5a9zA23M1HzAX+vZ0iiDrrKxJJ0Lo9QSOt0+//iqM
         mNuYiug9ah+OglUgIg+6RkJEMz12Fl2KSyABzkTMRpSqQB7bZ7f6p+xer1eKoxg21Pxw
         gi+k74Wr6qHrzfheHlSQ/Ap+oKcpvhVQhNOYAQd51ctMB5YWLHeTzwZLoHGvKNgppcGF
         4yegnyAEGEyDJOCbVYV2gbeNWCLfhCUTFyrYs1VpiVeSLXmkGE5Xbpy9QSCmKNfFiBGP
         +QCCeJt8QQzN8Y8mvCbXSNVT1iDyAzDNBfCP9Mc5+VHsH6j7/6e7qpMiWjauLGKpFB16
         +zuQ==
X-Forwarded-Encrypted: i=1; AHgh+RpgLCIunuHeTzQ/mxYXOsNj067nRPpTgCSkHcAzbg1ffrhKKv4D6l/btGSPVhoX3c/xZaGjhw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy70G4WE4SG+IQ2DkZEYVm7xsssXlN3ns85MAmc49Zm6qNM4S+W
	9nZ+ZiWLQakB6M/sLud6cBvqwg09l2Ih4n+HCQZzSCO5Ka0aWXC3GZva
X-Gm-Gg: AfdE7cnoetpeV61wz2UErjdUw6eJG5QSO65ZcOO1+HPgDA0TNdr6r24wgsJExY+59kr
	0i/4yIoJXjZ2K6FkuENnfLQYA/bEyEfblYakacTv206Lvi8MHxv6PPPeMCYMlUI9tAsdcvXKIBT
	A6Dic+viA5QYVRksB0ScmldBJmaugulbDThkf3wat/0rIACe4naGMG6AU4zcbxE/0ir7w4NMjwT
	pNjynJ3NK9R/FDhJIi9mUhtNQqtUQiVXT8VMrIAkL22vDkoCCKhJ+W5MBtCns7x1yAuLAga0Ukv
	EmDItGsEh1ch9bfKZrp4OpUYyHg1YncsQ7KsjHJSOjlSLmniQROfnNAAs7vDK5vIG6fPb4wtZi1
	pV+BaHUKdzomwiLXyT8nRIBmjRD11NYaKuLCbPdqVHmglW028XDCyUJx5MFGIRNOsqTntMC2qFK
	MyLd8YYFUpefLh948LE3p2b+O4xf3kqGurkv2q6YjjBhgY6ps=
X-Received: by 2002:a17:90b:5387:b0:36b:769c:c037 with SMTP id 98e67ed59e1d1-37df90a85cemr3835851a91.5.1782454428422;
        Thu, 25 Jun 2026 23:13:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37e12da6ec4sm302051a91.2.2026.06.25.23.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:13:48 -0700 (PDT)
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
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 00/24] ASoC: codecs: Use guard() for mutex & spin locks
Date: Fri, 26 Jun 2026 13:13:05 +0700
Message-ID: <20260626061329.23264-1-phucduc.bui@gmail.com>
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

 sound/soc/codecs/ab8500-codec.c           |  12 ++-
 sound/soc/codecs/ak4613.c                 |  83 +++++++++--------
 sound/soc/codecs/arizona-jack.c           |  39 ++++----
 sound/soc/codecs/arizona.c                |  26 +++---
 sound/soc/codecs/aw87390.c                |  10 +--
 sound/soc/codecs/aw88081.c                |  18 ++--
 sound/soc/codecs/aw88166.c                |  24 +++--
 sound/soc/codecs/aw88261.c                |  21 ++---
 sound/soc/codecs/aw88395/aw88395.c        |  24 +++--
 sound/soc/codecs/aw88395/aw88395_device.c |  40 +++------
 sound/soc/codecs/aw88399.c                |  15 ++--
 sound/soc/codecs/cros_ec_codec.c          |  18 ++--
 sound/soc/codecs/cs-amp-lib.c             |  11 ++-
 sound/soc/codecs/cs35l56-shared.c         |  19 ++--
 sound/soc/codecs/cs42l42.c                |  54 +++++------
 sound/soc/codecs/cs42l43-jack.c           | 104 +++++++++-------------
 sound/soc/codecs/cs42l43.c                |  16 ++--
 sound/soc/codecs/cs42l84.c                |  10 +--
 sound/soc/codecs/cs43130.c                |  72 +++++++--------
 sound/soc/codecs/cs47l15.c                |  11 ++-
 sound/soc/codecs/cs47l35.c                |  11 ++-
 sound/soc/codecs/cs47l85.c                |  11 ++-
 sound/soc/codecs/cs47l90.c                |  11 ++-
 sound/soc/codecs/cs47l92.c                |  11 ++-
 sound/soc/codecs/cs48l32.c                |  29 +++---
 sound/soc/codecs/cx2072x.c                |   5 +-
 26 files changed, 305 insertions(+), 400 deletions(-)

-- 
2.43.0

