Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03FC83229
	for <asahi@lists.linux.dev>; Thu, 25 Aug 2022 14:02:53 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1661436170; bh=ELGy1lUsHhPdvqtxh1bn64AYOFQqdlpEPx8nzBVvc/Q=;
	h=From:To:Cc:Subject:Date;
	b=hv7CXhgLy6WgpqX3UhKZwyPXlNgVtxyprcluDZBE80PKmGq3Rfv2ewtadZaKh86mY
	 oVcHp3SuYeBvnqN0AD/KIjSLmw5qVbjsEiAy3vLYXCxscRoHVZM9td56eRj1b3l8BY
	 TblbGZnNpko+m1A0bNOmMflMqB+d9jWpmkQKynDg=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: navada@ti.com,
	shenghao-ding@ti.com,
	asyrus@ti.com,
	raphael-xu@ti.com,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Stephen Kitt <steve@sk2.org>,
	Dan Murphy <dmurphy@ti.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: [PATCH 0/5] TAS2764 fixes/extensions
Date: Thu, 25 Aug 2022 16:02:36 +0200
Message-Id: <20220825140241.53963-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

First three patches are fixes analogical to those recently done to
the TAS2770 driver.
Link: https://lore.kernel.org/asahi/20220808141246.5749-1-povik+lin@cutebit.org/T/#t

The latter two add IRQ handler to log faults and expose a new control.

Martin Povišer (5):
  ASoC: tas2764: Allow mono streams
  ASoC: tas2764: Drop conflicting set_bias_level power setting
  ASoC: tas2764: Fix mute/unmute
  ASoC: tas2764: Add IRQ handling
  ASoC: tas2764: Export highpass filter setting

 sound/soc/codecs/tas2764.c | 181 ++++++++++++++++++++++++++-----------
 sound/soc/codecs/tas2764.h |  23 +++++
 2 files changed, 152 insertions(+), 52 deletions(-)

-- 
2.33.0

