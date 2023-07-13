Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E887C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31EEEC433CD;
	Thu, 13 Jul 2023 00:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207276;
	bh=A8vHwRzCwHS4yC+9YfVZKPZfPQI3zfXKZ0/ASIO56lk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HCnF9hnavi0nRv1RbqnYjTLjhQ4AKaOJfVQIohAqTbVlHB9y8llHYDpGjok2qRecl
	 S/prAaDvWrSXeSdRULcq/VMKSNjc43usJjd3oi1wMApwXTOt68ua1V9ManfQsZYo2X
	 jwBK8jOLd/v5J00gN5g1Ui9w9ioNlQ36/0tfBPlRovY+9YR/ZZdGNtfcq5Idm5lR6J
	 TjW2XestGwyshxxwUYy3OYjsg9O818YbgwsA8tzugU0LUDkPNhmr8euy3wW6sfWGUA
	 zgyi5NWPsDbnQln8zEdbJOkhFYxAUf4Uoa2Mm6xnunE6WyTEh7qpbAv/eoIduI345D
	 zl6BMe7kA8i9Q==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:21 +0100
Subject: [PATCH 08/48] ASoC: cs42l52: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-8-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=broonie@kernel.org;
 h=from:subject:message-id; bh=A8vHwRzCwHS4yC+9YfVZKPZfPQI3zfXKZ0/ASIO56lk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GyAwoCfSSmmyObCfHTHiDlLDTPSJZzWD1It
 Zw+vUGOPq2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BsgAKCRAk1otyXVSH
 0KmwB/9KkQnGkf667EzoazSlLV2MAsO8AeK1uhLin7BqQc1YsclqakLyT5FuqxwZO4ntghSDfRV
 E3cDO0EqHSBGHaGOCFy5Q+IYH8sIn4LgHQekMm5Ne+UY9SVqaKlOTNP4+cIH81z4XkaMKmwJSds
 79hGEGR6DSfKh+hH8eGNfF77723n8RCFgn8Zafg+ZPTbvKQE9w7uxMtmrNUd/d7BO6rKJCrCY2C
 IoCB+80HNM8YyiM5WypbLxC/n8Epi6ERB5yGfrwDzCL7DkuccPd6gw8aobUrscJ00Dq2O4f3asa
 WTp/RNAj/Eapp5QfBYMNC666+A9S6ylvgkUOqda90Dwu3DQo
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the cs42l52 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42l52.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l52.c b/sound/soc/codecs/cs42l52.c
index 1f1ded0ff0ac..4fc8a6ae8d92 100644
--- a/sound/soc/codecs/cs42l52.c
+++ b/sound/soc/codecs/cs42l52.c
@@ -1084,7 +1084,7 @@ static const struct regmap_config cs42l52_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(cs42l52_reg_defaults),
 	.readable_reg = cs42l52_readable_register,
 	.volatile_reg = cs42l52_volatile_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int cs42l52_i2c_probe(struct i2c_client *i2c_client)

-- 
2.39.2

