Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2307366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 219CBC433CD;
	Thu, 13 Jul 2023 00:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207336;
	bh=nah/tEYBJXlWzhJvP0QxHmrDmQDFpilqGypC1OgFlmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YpXdWb0cjdS7pmobIBHkx8BVW5lbZzDfitzH0e1fW8JZwMbcUt4daZbmI4FlDuusw
	 OePd10AX2YRlW47EM/7nyMScQ7x0EqxdW0L10iXojgWB3VQ4vCYV5VZa6G9BT4sDyU
	 H+91x/i5t+bqaHpRed2T0O/7YMZCmd1TJZRg/tIGD0IQ5x/ddB/YcLXkoD0s5B2O4e
	 bAeUTUBMgXlSMmyZQYVRiSXbHtAosOXuXK8bcvIGCt2wUHvGliT+LiQgC/DANLaFZY
	 glns0mnkg0j6DzEc9B6yepZOi8LmVrm3V4vF58ypA110MPWqCfPNWXTBFCir/aSFEG
	 ZQylWPt0vqtQA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:42 +0100
Subject: [PATCH 29/48] ASoC: wm8900: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-29-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nah/tEYBJXlWzhJvP0QxHmrDmQDFpilqGypC1OgFlmA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HCwUQxN1vzKeW8KrW8YisioZXXTRxv0guqz
 4UXn05+CoGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BwgAKCRAk1otyXVSH
 0FqiB/sFGi36z+nwaIJtnwWsv4s6nQc8WaCGl3Wt64JG6YFEjkKmUFzdirOQ+vaSNl+3rhCeHbl
 L0uqYT5wX/qFpKvj3UKjM4PLKlilBNLMPfarhxZthFYbuB4S6abdub9yAE2gqkqrhfWfOsc5Tgi
 WMZXYcBYHiIxiOHt5eljXMEGkGAlCxo6jM7heJ2Z8UP6P/arZW4ASfgBuWoXNGfvIM1pgeOxTaF
 6zcwJ/btj2M7NxodTmkNXa5lOmJmX0AMjI2Je5bHnzABufRlNa/eJBNKIgFpmtZWCb1YG7na4ik
 5X58n2krs9IRl9RziRYMXE8t0f//9lMyMIMnn+02zWyEGHKZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8900 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8900.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8900.c b/sound/soc/codecs/wm8900.c
index 320ccd92f318..84d06c190411 100644
--- a/sound/soc/codecs/wm8900.c
+++ b/sound/soc/codecs/wm8900.c
@@ -1223,7 +1223,7 @@ static const struct regmap_config wm8900_regmap = {
 
 	.reg_defaults = wm8900_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8900_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8900_volatile_register,
 };

-- 
2.39.2

