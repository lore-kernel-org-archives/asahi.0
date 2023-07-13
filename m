Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B25367
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDC2CC433CC;
	Thu, 13 Jul 2023 00:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207261;
	bh=h5y0kuwsUVvqGIw/hAX6PQPYX9+JjGYByNSBszDAM3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=p7ickjd0d9HMc9ES0P8y1ym0lhmF+GFD328thTTv6eudonZRkFOi2m1RvdWCL5KxU
	 tUQpLKlPxON/aQxsoSe9rRnY8R2KElLygVcw4PWPcWu0fKeK2Fa6WtavKwZnFCMXX9
	 wgFFNcasGOZh8ChzDbNr7TtgOdf3hcdw0cuko4lRX6CIEfEm1PsaTI99WhPdiUnZY0
	 gRrqYiWi91UeVryWccdcPyQ5/BnfmwGEo6/rJ68aGUasK87nagJ12PT55T84wNMrUa
	 pIRBhKuJrMEdzyL4pvnkS6NeVstzVtiP4AHTY4896DFJv3PcwsV2IG53KK7hUxLj4m
	 ubkuiT526mDTQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:16 +0100
Subject: [PATCH 03/48] ASoC: cs35l45: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-3-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511; i=broonie@kernel.org;
 h=from:subject:message-id; bh=h5y0kuwsUVvqGIw/hAX6PQPYX9+JjGYByNSBszDAM3I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GurDXgVILaHk+Nnlqr253JR9BaNjI5RlG16
 NjoXn6iXXWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BrgAKCRAk1otyXVSH
 0KMTB/991i/QBGU3DgbMY1Tv+M3TvmLGTG8LdYkf2H8CV7e89yfvU03HGCDQFxFVAo5dnHRKupN
 al5BldeSVnB8q4Alkz1rXEZKHyPQijvuqNlgMQBO8DK6YJexlu32Hp5t7mPYcnXNsPSjVIihMhE
 IQpQhqj8OwEGDqp5quUa+vs4LmS1LxAKgIkFp1usg+UoXtHfksbU1uY/d+vEvR27isuVr5GSHaw
 hJR+9NIYt4wCjFVGA207nWoFA8rfxjkzH3zdZVgGVVblhsLRW4sM3/cqPzDVP3lX3ibTYb/pg/8
 tXsf9G29tHQb1v4ljdOM7TT5wmpZcO6vuY3rDdvVySfCpcli
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the cs35l45 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l45-tables.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index 066f83c0c7ac..621af1785979 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -255,7 +255,7 @@ const struct regmap_config cs35l45_i2c_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(cs35l45_defaults),
 	.volatile_reg = cs35l45_volatile_reg,
 	.readable_reg = cs35l45_readable_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_NS_GPL(cs35l45_i2c_regmap, SND_SOC_CS35L45);
 
@@ -271,7 +271,7 @@ const struct regmap_config cs35l45_spi_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(cs35l45_defaults),
 	.volatile_reg = cs35l45_volatile_reg,
 	.readable_reg = cs35l45_readable_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_NS_GPL(cs35l45_spi_regmap, SND_SOC_CS35L45);
 

-- 
2.39.2

