Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B72E7C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C39FFC433CC;
	Thu, 13 Jul 2023 00:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207305;
	bh=YyEnQIX2JWZLzjew7wfYcn0E6NOzr1V02Gn3KHhT3fw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MrN1se748SuGocddHkC58K5Jx+cdnv9USqHpV/6v/UxxkrbIqtJgoj3pEyuXspNr3
	 aB61HoWAraIxlwe5VpqZIn3eUkSvqT/DNeZY3DSN9OnmsAG8g9qGbD2cJkfh9soce2
	 O10Uz+dhlGu1iZbPX3wzJwebBzS5XonLO1Yb+pDd6HSyAb+f/QahF74Gk/V7oKiJ4B
	 QxNu+Ijry+mSDqapdGIoMMjm4xfcak6FZbNPXyQvNuDmx+MrSmrxueNGKfp17LyjSr
	 okCbGle0lTsARFYvjgLK1ydgycbS7S/YjYry9SIDMLOmexqAY9BTR2wb3q4m+KV7Po
	 ySZpnlAkjvRyA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:31 +0100
Subject: [PATCH 18/48] ASoC: wm8580: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-18-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=broonie@kernel.org;
 h=from:subject:message-id; bh=YyEnQIX2JWZLzjew7wfYcn0E6NOzr1V02Gn3KHhT3fw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G5OtVudBY8FAVSDPctPkPgoFU4kyJ6gNmXO
 qPhHvcI74KJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BuQAKCRAk1otyXVSH
 0CAhB/sHcdUm8GWaq2evgAhsi/FSjfUZoYWag6s+Tfh22CjyGu7nYuuH6KQwW60RI28lERm1h+O
 WYNVqgDNlc9xMqdiN6D2o6uZIODetDuDBrdXKC55GesLTxTiK+rwSLnROQgfKOHb1d+fziSlZGw
 YBkMW/ebFlUbaHUkMrGKrDEUy0OWW5E975g6+Tbt6o/SeYd3yZFgveS69aS4JfW8CVoGZunoTD6
 KA5b3NPqiBt0SvZdoL+8NmXPGABWqzPtKyyAgWQvV/vrI78WkNLmeoRpUYNjGUoUGb8naylDAjx
 105csON5nNu2gLhyX6rtBbC6eAfNNVHal6vxeINOjsO219pf
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8580 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8580.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 34ae7fe05398..6d22f7d40ec2 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -975,7 +975,7 @@ static const struct regmap_config wm8580_regmap = {
 
 	.reg_defaults = wm8580_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8580_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8580_volatile,
 };

-- 
2.39.2

