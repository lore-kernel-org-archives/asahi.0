Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF1E7C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C765C433CB;
	Thu, 13 Jul 2023 00:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207269;
	bh=xcYzg6z0Vv0wEuoBCXIuRt3deUbwZ2sskYeGNAS0OMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VfgM0d7dbvn4GRVjdxKuRRdIbtDcXEkt8eeU4vEcD1Vr+VC4Zm5//1AVhVz/BZO2Y
	 OkQ5Oz+98EGl60eFTlt5X4U3R5y+XqJlNFfQgWXqA6ZuHjuFyAoJmWo39+NHjBbW8c
	 30hZEVDafUOx/M+Y8eYGgGQt6+pr5VH6iX5uBxmAFLPGJs0z20yR8hSAOimmuBeJH/
	 sQziweFsTs/wjzFXnYDkds+3rdv0Eqsw01S+XXelYzBxDY7dGIVEpkKtLgmFjoiI2I
	 pJpge5xnPj9JuSuA0SVyj6EPLNZioGPm7pHJ5ul4XlRiMwOdRzMbm+s1cdfSsSoGGq
	 1u+OxaB0/VlUA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:19 +0100
Subject: [PATCH 06/48] ASoC: cs4265: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-6-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1137; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xcYzg6z0Vv0wEuoBCXIuRt3deUbwZ2sskYeGNAS0OMk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GwcXN+fZ/ppjnwNpDPxNTnzVCh5pttcAyyz
 tMUaaN2r4mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BsAAKCRAk1otyXVSH
 0Bt2B/49dPzdvrwOLnkaMf0s+oaB2unZV5Tf2h+yNnT9QRh5S7L3woahvagDZs5IuEt4aIPd3Py
 w/vy8u56xtX6hLL9CJTbGP8s1Z4qG8MjT4iPbBWyUyZGxDcdgM/dUkthxIJqpQ918tKcLe+kHNe
 8O9E3qI7T9BXpjEvwXMGSXN7uHF/mAjDq/4BZzwb21ONze9h1uvuqWIXgvVHR9MH6wckSBCMpZ/
 3qei7r7HR1Z4tU2u1zqcOYjssIJtuqrkYgz+1jxYuEthmJVyGm9eMWJBYXTAXHxvOCtmsSfNee5
 bKSDipykOWKR+zNaRfgHsKsm4Ej7RsmEjZQoPVIs2eRjaJ4O
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the cs4265 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs4265.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs4265.c b/sound/soc/codecs/cs4265.c
index 0cfc5ab36a13..1ed1e60d8e53 100644
--- a/sound/soc/codecs/cs4265.c
+++ b/sound/soc/codecs/cs4265.c
@@ -564,7 +564,7 @@ static const struct regmap_config cs4265_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(cs4265_reg_defaults),
 	.readable_reg = cs4265_readable_register,
 	.volatile_reg = cs4265_volatile_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int cs4265_i2c_probe(struct i2c_client *i2c_client)

-- 
2.39.2

