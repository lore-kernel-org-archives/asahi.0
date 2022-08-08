Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BA03C17
	for <asahi@lists.linux.dev>; Mon,  8 Aug 2022 14:21:19 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1659968028; bh=tKWeu11aeXQ63OTvc9oUPZOVNW4tJ0tCoIcgd5/QzcY=;
	h=From:To:Cc:Subject:Date;
	b=GGUn9Xxh2AOR8fCPJgCDChOVNwKnSOyuiqs3uIgw/vAXBqML5KNhp08xKmHIplmbG
	 u+1g3fkMUTJoNwJlKhId87MCk28tPqAaCnv7TxQerQ8+pOUV+hrvEqO2Gx/b0HYI8E
	 9plHX3cuKzWMlrjbVBdJaOYFSg4UL2HW3uKGKUzM=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Stephen Kitt <steve@sk2.org>,
	Frank Shi <shifu0704@thundersoft.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: [PATCH 0/4] TAS2770 fixes
Date: Mon,  8 Aug 2022 16:12:42 +0200
Message-Id: <20220808141246.5749-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The first two fixes should be straightforward.

The latter two clean up what looks to me like a mess in the setting of
power levels. However we settle it, we should then do the same changes
to TAS2764, which has the same template (and maybe there are other
drivers).

Martin Povišer (4):
  ASoC: tas2770: Set correct FSYNC polarity
  ASoC: tas2770: Allow mono streams
  ASoC: tas2770: Drop conflicting set_bias_level power setting
  ASoC: tas2770: Fix handling of mute/unmute

 sound/soc/codecs/tas2770.c | 98 +++++++++++++++++---------------------
 sound/soc/codecs/tas2770.h |  5 ++
 2 files changed, 48 insertions(+), 55 deletions(-)

-- 
2.33.0

