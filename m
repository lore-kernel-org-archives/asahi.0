Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61806366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B62EC433C8;
	Thu, 13 Jul 2023 00:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207342;
	bh=KtuApyPLDWlsikDsmqUopTiXx1qbWI9HY40NRsytM+c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VdzM/JhXeT/mB1DHhbW7okqDgS8QkO2+IooD9cUkfUcKflIN315Vv5ZcYEx/2Wrie
	 EIQm+hkvCR/NsbnjRraiYLC/ZwuFsJQWnM0/ri4OD4C1ABYLNBMWBX9aS3ldDH6Qgp
	 wtgrJ+i9goCgrsZHBXXLvpJpIc+y3BUUFJKUKiC4Oaz7uTlqrsHS6qIKx9T7SpuLqv
	 HKxac3pTAFVnE/zq4VRbJsrg1TqCTMwFl34L5PZk0rmQNDmYI61FLsHiabQVZuZnjU
	 GWZgRxkqdcvkZLdB2OZwXjdSanqvZIbzN4R8KCk0n/KGfTc7XZaXdy1J4VQmDwKus7
	 A966Om7iXxqUw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:44 +0100
Subject: [PATCH 31/48] ASoC: wm8904: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-31-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KtuApyPLDWlsikDsmqUopTiXx1qbWI9HY40NRsytM+c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HDxHJ+1BJgeFQohGSx/DAhAdjb9gHeERPtr
 If7iD5X9FuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BwwAKCRAk1otyXVSH
 0K64B/4uhCReUlYY7dziXuF2h86HgT+E6xCfVaCdjI9J5DVxnRCYjKPAR1l2qK51ld0tpUv92Bq
 OXfcMO3KD9EhO9oLY2KlOZWLUBRA5fJEOY6qZwthnir/DcJfCq6J4gLA7RoDStZEKMFDgOjCdcx
 dXP8FPsnsRetdSuLEeyKryu7sogl67Dz1wHx38UUR1gQNJsGrvmwr3T8M2xi9rnt/0IfFEBW8iK
 GiLeCqdOAkjhWewrwJX6EpIpphFWHPLA+rHy8j+f4SfLmGr/NDlzpUQYW2h1doXHw6QjZVuaUS1
 ovPy2n71q5s9dByEn/TytqPTKdAcsAcTiZ/PfdOqHdbGT8Ag
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8904 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8904.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 068e610b1b4c..ac4e1654a967 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -2148,7 +2148,7 @@ static const struct regmap_config wm8904_regmap = {
 	.volatile_reg = wm8904_volatile_register,
 	.readable_reg = wm8904_readable_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8904_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8904_reg_defaults),
 };

-- 
2.39.2

