Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA99B367
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52790C433CA;
	Thu, 13 Jul 2023 00:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207272;
	bh=IBNC+v7RMLGIksUTsABHCIbFxxoeRBCa//WWLfSosN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EMmd1eixNwv6KWkoHx9z4i+iDmH5deWJ2rQKc1+s9qPGohWPtnUdJeWOUJuZH5Wwq
	 HM5UZCDyfvaKS8yFOVVEhJoF3sSsh/7d0NprxSiqYFOz+5VzJ9Hqk8zc579+PrKGW4
	 2vBw9Fejta6PDW4sR6T7qBqTz7MYmXpneUGZI6sn0gzkgJfC1g7h+4ibrGJ8MVCFZX
	 h4fUXEXl/RVLCiyZg/wZzXpuezvWb26XlXFsoJjQuLr7fbNZ8YLikgrvyWCtmttPAB
	 153cZBfVp8an+PpP/pexs8MmPtVxpaPxDz/S8hWJc8GEPKzCbL6tPiRi+XZ8bcMABr
	 wrhfS6oggMBPg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:20 +0100
Subject: [PATCH 07/48] ASoC: cs4270: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-7-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143; i=broonie@kernel.org;
 h=from:subject:message-id; bh=IBNC+v7RMLGIksUTsABHCIbFxxoeRBCa//WWLfSosN4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0Gxf/SXAbSQasBLaKdb1fjAWqgMiSrK6A8bZ
 x8Azllv38aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BsQAKCRAk1otyXVSH
 0Gc2B/98jB6JhpdLevDwwfKetvGbC4fSEKfcKcqqxABC7XhCBW5SGrvcs4BmzBPBp1pqKYm/NYg
 YztJW5wf14yCnD3rySWapsSM+siCoKXSYKoND7dWP6Dmi8OHJ1rWG6ENfd/vEVbm2URV952+CXu
 YhSEe67hkXooenfhZ/X9F3ciRxF8zcfXpApQeNiOBLYalfkpYWwk/K1FwGBSasi4fwxb7QwT8nu
 qI+vSm3a0xluonVHQ8pz+QJsUhJHv24ehFI7HStGql54U/pIheYVTekYWn25f/xZhMbbjDCvuAb
 FmTgMVlX8Aj2xB4dt5eUJviwWKSW7B85yMepEqhy/k1QrKNY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the cs4270 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs4270.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index ab32f15e3b44..3df567214952 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -636,7 +636,7 @@ static const struct regmap_config cs4270_regmap = {
 	.max_register =		CS4270_LASTREG,
 	.reg_defaults =		cs4270_reg_defaults,
 	.num_reg_defaults =	ARRAY_SIZE(cs4270_reg_defaults),
-	.cache_type =		REGCACHE_RBTREE,
+	.cache_type =		REGCACHE_MAPLE,
 	.write_flag_mask =	CS4270_I2C_INCR,
 
 	.readable_reg =		cs4270_reg_is_readable,

-- 
2.39.2

