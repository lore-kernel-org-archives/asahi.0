Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484627C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35D1C433CB;
	Thu, 13 Jul 2023 00:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207380;
	bh=gr4V194GM9AwbQLZw3o0fLR+mQvArlDQoQoKogOSANs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dhA+Sa53eG3z9t9R7aP6+n4zI9DTfFv/trh+Az2G3MDbZt/3d+B3TDv1tiAHZOH6C
	 nSnnyb6LDAAlV8YmTxCPypdRqIzrwh5uL4/u17hM7KofNN7N7K6Qf6Ke4PWqBQoRyT
	 F2OP0SrV0UUMGPn+A2KLjFG0crnz4MwEethKmZtxQSADLSqw8tIOaMdXp00uHyFhgF
	 7oYRddL+JJAGmj6h+A7dFXdjPw5/7SWAtfjkTcyoKlyjqhaSPNAEfJqtr8Bf4ZjMIB
	 DKmb3KiU6/aU15SF9H+AsHOHQTfYCEEdvPUQj32MHJPJy0mLBzrdu5ndC1VgQFU87m
	 uSDqcz93fKfvQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:57 +0100
Subject: [PATCH 44/48] ASoC: wm8985: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-44-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gr4V194GM9AwbQLZw3o0fLR+mQvArlDQoQoKogOSANs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HNyjBeY0MLXJ17MeRNMLBj6D9Qtz10Wi3SW
 K9pGhm0N+uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BzQAKCRAk1otyXVSH
 0Cn+B/9BdyNtMZoPnoGfWYJeMbbTwlJ53OkQeiwqJvob3AiMyDZ0f4vciGLJWbY0U1iih7ucq9d
 LwuIXCgVnLU/OAp/15a714l8a5KW9KgUF/BpDd/4C0VM0sPzMSM7fX4yYwfaPmaEklpX4xobjUb
 kj6yHvOs1bwzdajvz5PvtyAJfNbdQAzu9b5+6J8TiE6Z79cNND42Evbu/waPn+oXneNAac7lqp1
 5r2T9UzHAvZBmUvlwaWCZcrK9Fzqho7PM97pVrBNhXP+3wPyLIckxZLWEG+eOy1VFYFt3p136mE
 JgyGljx0Ty6fH7iNOoijpWifVcfx6mgtxciiu8y69eM9e/eY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8985 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8985.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8985.c b/sound/soc/codecs/wm8985.c
index c0816bcfa294..8606e0752a60 100644
--- a/sound/soc/codecs/wm8985.c
+++ b/sound/soc/codecs/wm8985.c
@@ -1125,7 +1125,7 @@ static const struct regmap_config wm8985_regmap = {
 	.max_register = WM8985_MAX_REGISTER,
 	.writeable_reg = wm8985_writeable,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8985_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8985_reg_defaults),
 };

-- 
2.39.2

