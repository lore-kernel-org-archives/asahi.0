Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA42366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B32A8C433D9;
	Thu, 13 Jul 2023 00:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207382;
	bh=OBMjeVDhDXKWHzZfgbwshvDo8AsqyDiTCFal21Yjztc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=r5FzIOk/kWG8596XgnBj9K+QzVgfaD2fswIJDzb7LcuVIx2a1B4+4o7loyMf4qItp
	 j1RR6wMqAvygCwgrxlcs9oXXvnxxJdiHDnZwWz6l744pX3IFXJB7GcnhRMr2F0PbJ2
	 rAhGZsTbFCDDJRYruJk3qwphEN/nDLI06UL5wjO0ORQ9eyw75YJ7VKUgoTLeOIiVTZ
	 qhDTmmx+ThLGcUCJvgwOkg8PfcZNrdArI9M7vr58UTFSsc2Es+kgJGMtsIaIm1jKaH
	 ApHdTjySLttQx7+OEvSShECNUTtAxZopS2FUhnJfiBc8OAObWk+RfPTMRZSQ2ZORTt
	 tI03lbG16MFBg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:58 +0100
Subject: [PATCH 45/48] ASoC: wm8988: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-45-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OBMjeVDhDXKWHzZfgbwshvDo8AsqyDiTCFal21Yjztc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HOvww25edrHXfa+LcppsTzggje7K45sb1zV
 J/ITqHpgqCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BzgAKCRAk1otyXVSH
 0DhZB/49okZYlTziW/QDavueJEALX4dYlWUgnTf1m+Nuq0FracHNpFAdOVlI/wX1cR0TapSUnxd
 npuMMXVba7WIA9e14l4vvyTVU7BrkfUvaRiH4Ku+Cu2aELSESS1KQkXvinS84zIG2JrRn4Y2yzv
 Zyve5MZbYxbvuN+ZXpUPt3LZ0P5n4GVSXZfl/2wLFevTbrb+Xko/tRCPZBlOZJNW42ZAvReSlfQ
 Qe4PxYrE/g4rpE04dlGc8gvI80Qah3TE7+Q+mYsNaPh3pigUlWubrK8exsRxis4MzpJfIyv68yi
 m/ey4HLIL7Y5S/t9OOG+ckJhzzLapvA5pSqN2Pe64/ERb2n1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8988 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8988.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8988.c b/sound/soc/codecs/wm8988.c
index b440719cca7d..76f214f12ce0 100644
--- a/sound/soc/codecs/wm8988.c
+++ b/sound/soc/codecs/wm8988.c
@@ -832,7 +832,7 @@ static const struct regmap_config wm8988_regmap = {
 	.max_register = WM8988_LPPB,
 	.writeable_reg = wm8988_writeable,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8988_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8988_reg_defaults),
 };

-- 
2.39.2

