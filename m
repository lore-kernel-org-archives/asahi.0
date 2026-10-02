Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E682419FDA
	for <asahi@lists.linux.dev>; Fri,  2 Oct 2026 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934593; cv=none; b=lviBdNOe9GW/3aT2pBz8TJhJRK52FaVQ1O7A++8+t2n/+i73Sr8IWaF9w2hmd2tyYk+PHgkVKGMiVeS7phhS9ohVDoszefRqXSz9Fz+AgHcIf23ETXGgAH+I63H4hZJ2ixbsktl4T719c0m5+6nsC44Q+6HdDYL/RLe+Pn+vHYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934593; c=relaxed/simple;
	bh=0UD9OIqCmDhTrj0b9dG//QSQztmY8kSUpwuV73z/Ymw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mbfqlVJpQD8b0oGB4fC3eqiVL0FZqT1pO4+NI+mh5Ipu/02X3qUV0G5dXUsyqFHFSsL9Dhd7sy+aD9JYea6f9fvgqspPISS/jLblCGzGQthG7QX+TRHJBrTFuELYjQzQ+iUMxHQnSzMSOWohQNPimUuez3YI+oCZfzPf7UTJbFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XIyPyxmE; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XIyPyxmE"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a022e9cbebso11477645e9.0
        for <asahi@lists.linux.dev>; Fri, 02 Oct 2026 02:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790934585; x=1791539385; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=17hXUf/wpq+x73auKkD+LetKx3d+qKZ9hCfZeZlNHuU=;
        b=XIyPyxmEFBgk0e0AA3GUbOBMc0AgtwGW0NZx3zJAenhWbQvCMMtCxULHbkZW2QnI5o
         o9LmTlyMPN/vDJQP8eS4SQQIR84sjAdkxoGAvU+NdEOFgVc9eue42F4Uc+S4xJS7FC/5
         0xQdpDpCx7kZhEEb5clQqD9Bx1G82dSEP56yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790934585; x=1791539385;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=17hXUf/wpq+x73auKkD+LetKx3d+qKZ9hCfZeZlNHuU=;
        b=lO+sHdti7MF8cmfZsrHCaoausfTWyJP1nhczx3asprcnrj5ypwnUfE3hZZPrtMo3VN
         C4Nnbd5Qk/Ensdp9hKJEeB5rp5tCv47L55IhHZqFR9fTfU8fcyEiaYpxFANtF5SWGviv
         Bv+vl2gFnJX520gkCDsEVHNS9V8+8qs8RsCHgEkic7Ok3/4zF+sa9CNUHqlqhkxUt/SR
         sJXFKnKDNOSsVt+owJshI271K50/nmqIgCt8Q+RmdaMmUfZh05rKK7QzYt9A0zWHcqYS
         7uXux2o5mjq0mDSKCG+qTGHo/kw3MHzb3RVJ2dKJf4inO7s5J4xk8WIO4J1Ma/AQra3r
         i8ew==
X-Forwarded-Encrypted: i=1; AKwUvByqQlC946nSL62FwWMQWsVwCVs6uHbju5Uk5FHLEBZLvyJBFNJeE0bz4aUsfqEn4LHv9fFUBQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nZ5P0NQ/9yIDRPB0mU2nkqhe5gXu9IjAUgjH0STrdVHupM8UEx
	pnsxvmJxaC04r5OPh/3iFuo1XM1GRYmTdR8UPbCacMCkXPPidvPAwIu4I8ngIK+safI=
X-Gm-Gg: AYBFou156WWox62BwbLWVaTuJ9g1sPPj8D5HkKdHbxaqe+PDOPMpiYcsjC0doGh7DB1
	zjLTy/zomBbHoVJfZpMqa7Q1kio6LyOSVz5XT0Mo0VAk6wubTjPtMR/4NeksAvb1YWwfLbB736H
	Izgiq2r5uHKX8LR3VH5pj9pQvAtXzkhbdto+6XLIl3ng/aCAY7mQ5yYx/CA10+bMSOrIV3kAHsB
	fCe50V1KtP+UXZkWz+jJvRyv54Zh55mjwvZe4Vw80+n3NMEsIokasccCOcl6o7WqYf71xwkPfj9
	PurgXhF0FDwFUVK2Aqs5iFyphZBNC9ZM2uNzLffp3smIcz3zWG5FNMV+mLhz7jLYcpzA719NwLF
	ZMSksF4nSLoxq3FuvBVCA1KoMUk9Gs8j8Bgk85hqXNE4cyfV+u97lqBSx7S+RZs8UigNnynTgFP
	KLezp7RbpQp/0fkPPaMBZIcizDNaME/E1M2XBsB//KeVeAMYR8s0M6XvqfxRSLq6grSDjDNBkY3
	MM=
X-Received: by 2002:a05:600c:3144:b0:4a0:1c0e:b2a8 with SMTP id 5b1f17b1804b1-4a0275780d3mr35684945e9.28.1790934584855;
        Fri, 02 Oct 2026 02:49:44 -0700 (PDT)
Received: from localhost ([93.90.163.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280c8bb0sm73051165e9.11.2026.10.02.02.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:49:44 -0700 (PDT)
From: =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>
Subject: [PATCH 0/5] ASoC: pcm179x: Add support for pcm1795 and pcm1796
Date: Fri, 02 Oct 2026 11:49:29 +0200
Message-Id: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwMj3fL8omxdcwPTNCODJDMDIwsTJaDSgqLUtMwKsDHRsRB+cWlSVmp
 yCUivUm0tALTQLfVoAAAA
X-Change-ID: 20261002-work-705f20b60284
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: patches@opensource.cirrus.com, linux-sound@vger.kernel.org, 
 asahi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Roman_Smr=C5=BE?= <roman@amarulasolutions.com>, 
 linux-amarula@amarulasolutions.com, 
 Michael Trimarchi <michael@amarulasolutions.com>
X-Mailer: b4 0.15.2

This adds support for the PCM1795 and the PCM1796 to the pcm179x driver.

The PCM1795 is register compatible with the PCM1792A, but it encodes two
of the register 18 FMT[2:0] values differently, so the format encoding is
described with a per-codec table instead of the width switches. Only the
PCM1795 has real 32-bit formats; on the PCM1792A and the PCM1796 a 32-bit
container keeps the 24-bit code, as it always has. Left-justified, which
the driver accepted but never programmed, is added on the way.

This series is based on a work done in 2016 by my collegue:
https://lore.kernel.org/all/20160311232856.GC27257@panicking/

Signed-off-by: Roman Smrž <roman@amarulasolutions.com>
---
Michael Trimarchi (2):
      ASoC: dt-bindings: Add ti,pcm1795 and ti,pcm1796
      ASoC: pcm179x: Add support for pcm1975

Roman Smrž (3):
      ASoC: pcm179x: Refactor regmap value lookup
      ASoC: pcm179x: Add left-justified formats for pcm1792a
      ASoC: pcm179x: Add pcm1796 as compatible with pcm1792a

 .../devicetree/bindings/sound/trivial-codec.yaml   |   2 +
 sound/soc/codecs/pcm179x-i2c.c                     |   2 +
 sound/soc/codecs/pcm179x-spi.c                     |   2 +
 sound/soc/codecs/pcm179x.c                         | 116 +++++++++++++++------
 sound/soc/codecs/pcm179x.h                         |  12 ++-
 5 files changed, 101 insertions(+), 33 deletions(-)
---
base-commit: ce1e0223d8ad4211275c82a17ed6d43ab81e13d9
change-id: 20261002-work-705f20b60284

Best regards,
--  
Roman Smrž <roman@amarulasolutions.com>

