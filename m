Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FECC366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B872BC433CB;
	Thu, 13 Jul 2023 00:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207354;
	bh=KC/GQ3Br25p5MuSafBm8be5t0MMwKzflznzovGCCEvc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=trSklcywIG2sXspdNb8jm7snMjkJyLgi9TRs5DDclpco4MEKWNCc+8s6cgUkT33TX
	 3MIGCvkW9a+7CcEpw6A2Tz0LW63I9lnt99duMS+HKmvJojpY4xkoc+RrgjnFrfERhZ
	 HhfAceCL1s+FeCbbbzvTrUXhi2PieDp58Lm1papZ/HgM7UTGW7PxqXcmpy0ov+HDGF
	 1Q519oPom2eX53HJQFQWkMCN+YsWhNXC3TJS4apocUYzhT4VkyWMboylfph+SJhK2r
	 tjrRaMmDQK8B83CAFEjrOkJYTMI8N+/UbluzgJqgyUyztTUg6ItsdHPo5b7Pl0/fOM
	 w79LqAmjyf0AA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:48 +0100
Subject: [PATCH 35/48] ASoC: wm8991: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-35-a62651831735@kernel.org>
References: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
In-Reply-To: <20230713-asoc-cirrus-maple-v1-0-a62651831735@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org, 
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KC/GQ3Br25p5MuSafBm8be5t0MMwKzflznzovGCCEvc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HGv6xnlB/xEKvgotvzqob3vI+aZMEbX2p2P
 rE39f2TsYiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BxgAKCRAk1otyXVSH
 0LMtB/46Rq581Ajng49HB4Rx0jtBPq7lZJpa7v2V9qHYGgAHCkDYXQlx9EZLtBg9VUDMpzWS7Vf
 YBqLytfFJa1WiMTMWbFQrCWeTfxb9mqMpTz4Q5oIpJKyPndiSNoFL+lKlvVdUgS8TgFGNMEry5j
 hxPGptlHikfYhievU4pY+iKdzTBDLLTh3nSCM4MKxVSE+by7Jiv21UlDnmFUDoYLb8zToofiOXi
 xc2RRChHPEKS6k7wtxyPSHtMEvAXZkqhWSd0SSBl5G8uVYR8bMXn6vfSLtVu+033shIG2d8jbtO
 RCa2fHod6netmgA/Aow5iygdxu4EUa71JYZqSs3WTIoMBIBU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8991 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8991.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8991.c b/sound/soc/codecs/wm8991.c
index 8cb2ae829699..590318aafaea 100644
--- a/sound/soc/codecs/wm8991.c
+++ b/sound/soc/codecs/wm8991.c
@@ -1253,7 +1253,7 @@ static const struct regmap_config wm8991_regmap = {
 	.volatile_reg = wm8991_volatile,
 	.reg_defaults = wm8991_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8991_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int wm8991_i2c_probe(struct i2c_client *i2c)

-- 
2.39.2

