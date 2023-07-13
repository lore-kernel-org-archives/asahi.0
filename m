Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2A0366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 957D5C433D9;
	Thu, 13 Jul 2023 00:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207313;
	bh=l3ebw0XWDneVahRnEFmLn8+x/+DwVlxfRDQ4EhGXcqs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wb3npYiANGSYcJVGTIZJ+Ju9HuWc7P+9jCnCZsuXIe3zO8F5L9KV8y3Yn223FdH8C
	 C5OuegigWVe7vC4PK3DrXDg0SqTVw17byd+PcRX8dsdo62L7Fl4VbveRQPek4cZCdK
	 a5VRAXZc5Kifr0NUShM2tWwTmDOXNphvDFdbIpxBBUBH4R/vVmwsw6XcgNYZR3ZMRc
	 3FXySC7i7m+CeHRPgdnON/fUnwf6fHUxjvSxOZ7j21eSnvPSbsAsnt9JcQBAxdbLIr
	 dMNMqLNyJUgM5w9Az3qiw7ON1Wmn4Dbw5/FoA6THDFPbwfoIbHav6C3if/xIX060Zk
	 6rT/UGD/QdFHw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:34 +0100
Subject: [PATCH 21/48] ASoC: wm8731: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-21-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088; i=broonie@kernel.org;
 h=from:subject:message-id; bh=l3ebw0XWDneVahRnEFmLn8+x/+DwVlxfRDQ4EhGXcqs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G8wR6rCNkIQC698mWPi0or8oloJzHqaNqZx
 0qyvIURlaCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BvAAKCRAk1otyXVSH
 0INMCACCmwT/H6oniKWlo9hF2VVP3/+aqEnFOdBFR9Nuw3JbH+Q4ziwgmJdv26bhkAb/QHTdpVl
 kmnSKUI0ZX6rMhU4yjmJvZAannN2CHeowurGR4wj0XAIkjeUKz9iZmX2pfBxTdrLVNcsu5K5ze1
 +xLRfjUWJg9x5d8F7LfYZnyChS+k8VvmYw59a+rUJiiaZLwhjuOiJ4LKzhndL+2J181/VuNl3LA
 yAmoh8q0JROy/kho4KFerVIe1UeTVQ/XWIMprVmXfJRhODr4iK3mOWPsys/uXbptPWHEncMLhEe
 hNEm7uVICAabCvU7x+fbzdZkXUrgcSCMVEsFZWRdGDViCJDc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8731 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8731.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index d5ab3ba126a6..efc160c75f40 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -642,7 +642,7 @@ const struct regmap_config wm8731_regmap = {
 	.max_register = WM8731_RESET,
 	.volatile_reg = wm8731_volatile,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8731_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8731_reg_defaults),
 };

-- 
2.39.2

