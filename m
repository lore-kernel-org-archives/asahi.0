Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B712C366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:14:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AAFC433D9;
	Thu, 13 Jul 2023 00:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207284;
	bh=LF732ejLVHu/dBbKR19LX+OhhCn45u5YVe52e1U6Y8o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nWH15L2Vwy3athL4B9FOigRCGLjLZjUwCDCWqfrKwOmOUKbEnKZCobWdN5uLeB8gu
	 vzohQx7skZQcD1PZ0YmvXr7NkIO6ibL9lGkUUr1pS1aEKR9HQ07qGUXU9tRxmR1yst
	 htxzoDUyJ4Zxly4R4YBW3beZB0yRoMVTB/utmIbP6q1PSAfsyEKEx07aG9PhEOvx2A
	 80kBhnfJ4i6qbVzeqe5HC/3/AhvmpIVUonrXtJjTta2C6qcxd3J4nj9kKvqe6JPi9n
	 1eg6+1Krzbqy4eQKO3u7yVn0dIDaQW3Bi9lQqptNn+SuQJB9jd+bs5iDg5S9BIwIOg
	 0IXuHW4Y2PH5w==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:24 +0100
Subject: [PATCH 11/48] ASoC: cs4349: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-11-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1139; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LF732ejLVHu/dBbKR19LX+OhhCn45u5YVe52e1U6Y8o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G0WUaLlpt/t4HbR5aDE5bidvBZ5MBKaKcMo
 6VDJUqhbIKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BtAAKCRAk1otyXVSH
 0F3oB/42goyDxs+262yaBy+M3jXXhWB5tRoaq8XUQ1pA/aWHZxp4fcES3EB73ifsBu5aRxHNXma
 WuTrZuajCCMAAGVt4OLq6FN9ZwHqz+dLiYNsi96X9pPpt/ktjNW2Nje03grixMdYsD11Racl+HX
 wAvgch6W6bMwak0ZwP0W6w6AYUu5IckcSIavqEw27uRVQAvFYiMWpUhilgfd356wLxyAvY1F+zu
 5Dt7D272+bFhg8lgayLLjCmrrd2f1e5EZNcYRiknUcSMsCn9qqySiAcN/pl8GSQlTwlrSxvorpc
 ueWn/nUffdX4chLMHmEj+XDkyYs6cg7EVKdF7V5lrD/Jmy4g
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the cs4349 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs4349.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
index 8365dd0ebe2a..ef08e51901b5 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -271,7 +271,7 @@ static const struct regmap_config cs4349_regmap = {
 	.num_reg_defaults	= ARRAY_SIZE(cs4349_reg_defaults),
 	.readable_reg		= cs4349_readable_register,
 	.writeable_reg		= cs4349_writeable_register,
-	.cache_type		= REGCACHE_RBTREE,
+	.cache_type		= REGCACHE_MAPLE,
 };
 
 static int cs4349_i2c_probe(struct i2c_client *client)

-- 
2.39.2

