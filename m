Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D843C7C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87CE6C433CC;
	Thu, 13 Jul 2023 00:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207362;
	bh=32QAqy4sciYh2rhvwNr5TWmnz/aq8Z9ODy8wTcsO83M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LdShSqb1Mkw6+hLMvsT07NixvAgM26RA05pXnyu0kzyvndDHXI0C4ztTR1YWXaK6m
	 LjpQ0k65nXummCqZ5yjci4LLgM4+E4igXyJmGCrjJdWji8WQS6EJgDnUCH3rygh2a2
	 4ZgwxxRBWUgvny+m1cNQlxK5tZ8H6MDCcsBlWkArA1MvDU5h2+C/3Aoph68qwAlQj6
	 aogxmCtYe7rLPXDvtuQtcgEkDCuO5lx203GK/IHPye2rfHSMnusrdz8oLHWkWkmare
	 7zy+MUEhH1cMAdRJ4hvsi0asLYpNXXboRJw7sMUNA4R/p5h6McdsEMXjwNk8lW4Jdd
	 LwE5U8bevhxew==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:51 +0100
Subject: [PATCH 38/48] ASoC: wm8996: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-38-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=32QAqy4sciYh2rhvwNr5TWmnz/aq8Z9ODy8wTcsO83M=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HJnlDXdmcrRthPIB7ojLkfAyEKfSbA7gWfZ
 wHjXp6qUECJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9ByQAKCRAk1otyXVSH
 0GaECACBsTpO1dcTW0NMo9FHQWegSMjSP0Z/2q73wwUhCXItMwa1G0kyVrBt0F3C/gCp2iAc2tM
 KamnPjElH7rw0n9MWEbyelK3AG/Se9z5Ucr/YW9FsnMm1CAZAvSKFBFdCJZFpWhzEUmcgAozKfp
 OH4Av7OLM3LlMidQlEOYklMroLfdMKfxRacw32PbxRsNtSo5EF/Tcw/B0cfgjuWZdzE7Lx/ODHW
 +o8Hnh6DaVWo5PQn++wt7bLjCBtF56j5j/RL8txCcjw867rpX907ADX+c5c/NLfBuXABUQf0VWj
 FxWnWN67gPLkRy/VMbpM9XX6ojRNnyuBkN/d9F0qfMMLoCBT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8996 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8996.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8996.c b/sound/soc/codecs/wm8996.c
index 5d0eb0ae0475..df6195778c57 100644
--- a/sound/soc/codecs/wm8996.c
+++ b/sound/soc/codecs/wm8996.c
@@ -2610,7 +2610,7 @@ static const struct regmap_config wm8996_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(wm8996_reg),
 	.volatile_reg = wm8996_volatile_register,
 	.readable_reg = wm8996_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int wm8996_probe(struct snd_soc_component *component)

-- 
2.39.2

