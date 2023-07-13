Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC51B7C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACD0C433CB;
	Thu, 13 Jul 2023 00:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207258;
	bh=8ohZ1X7AV8KGhMNDSGBLEz4dloW867isYn4qGwQfdSk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BAhqMCRC+2nV1d57JTmK/eFyRNrWQLAGrqQgbTdBBT0cJSl/MJc0k9tnSs0n3ZXqu
	 JRk5+SSG5WVUw77TcWtyTZCqaWj1ztuy3/7geSxyAbgUCTmDXm7UmwjlQhAw7sAVSy
	 o2j5CcvEg55JjD1ZSfODo6L1LvUhEimrzwfGH+nh6EJT7x54oLU6cbADDKzXsWTLPh
	 ZlKiWWYDkciX5DopuODGR5XbFYMrPpNUO9DkyEUL3ukx4IKQfRVc0dADE9FU/0tN98
	 lSR0l+tslD+fuBlXkmXJBrHsps6hFuCN2tYM+P7fOlJISzl8ViGTycOC7dROa17B2G
	 3Ylav2thsokrg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:15 +0100
Subject: [PATCH 02/48] ASoC: cs35l41: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-2-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1420; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8ohZ1X7AV8KGhMNDSGBLEz4dloW867isYn4qGwQfdSk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GtQxPQOqxDv5bMKTlSywvq2EII34e9WwSlx
 bpQGTRx4AqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BrQAKCRAk1otyXVSH
 0Bh8B/4okseypC9+hjTC+xP1T2L3LwelZdW8WY1S/RaqYrury/RWxdNOZ7vGaYnfzqCuyyV7ouS
 llCGYcFR52Xb+u5vD9ebeqaYe7ZSas5HWBSpQPzBBv0ZLr3HnF43QeDYQxCwCySXrRgVP4WW0k9
 QqvPIgJ4uokQglyHOOVLUPnjOfQZoMoLgZ4U6rkAofeHqm4OAOGXjWe/fA4WeLznvA0G+yrS+2l
 W/bYOfNLlZUB1ulhR1h8EdlKYzyMTY9s2hKWgvyXscPko4WQm7n7WBAaAqe9vLEu/JEf3Nt43vC
 yx5Iv5H7Z5iJOAc2DCOm2HY/B/MBl9waTuefzC98UEqRrtqM
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the cs35l41 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l41-lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-lib.c b/sound/soc/codecs/cs35l41-lib.c
index 1e4205295a0d..ac7cc492bcb0 100644
--- a/sound/soc/codecs/cs35l41-lib.c
+++ b/sound/soc/codecs/cs35l41-lib.c
@@ -743,7 +743,7 @@ struct regmap_config cs35l41_regmap_i2c = {
 	.volatile_reg = cs35l41_volatile_reg,
 	.readable_reg = cs35l41_readable_reg,
 	.precious_reg = cs35l41_precious_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(cs35l41_regmap_i2c);
 
@@ -760,7 +760,7 @@ struct regmap_config cs35l41_regmap_spi = {
 	.volatile_reg = cs35l41_volatile_reg,
 	.readable_reg = cs35l41_readable_reg,
 	.precious_reg = cs35l41_precious_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(cs35l41_regmap_spi);
 

-- 
2.39.2

