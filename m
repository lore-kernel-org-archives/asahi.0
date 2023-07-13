Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8C77C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 087CCC433CC;
	Thu, 13 Jul 2023 00:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207374;
	bh=xtGOnDRcTXT8WVLfFDqPlV+MGAGMWphSd3kDQNybOQ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AlYOc7IziRhvD4r7rvKt62HpfVzb8lht5hxhozx9xFPf+CLc/xYs7LvstXxjxVxgE
	 cyhenyqhrKt/9oP+ZYfx5D+QJAAqZiHr+RbGl8sqtSLJAFWRBnfpvj76vh1NrGqHRO
	 0nnqZognlMnmm05D3hwxQ0v/IHtsf5o8+bkjnUpxtWxJBzRc7XUsU9/jGD3O89o0ti
	 +eV+psDe/NmiPP72JYLahiX2FFF5Wr+c5+gjKeTSWEX2EabwUF14jWyWN2Cy3RlXE/
	 V2w5lm9IE4O9Bq/0tTOZFD1r7gVdB3cBWNVhpM3SqA6tQy6twqZMKBRgq6ro8gMTqC
	 nhNG2Bg+LuhhA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:55 +0100
Subject: [PATCH 42/48] ASoC: wm8978: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-42-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xtGOnDRcTXT8WVLfFDqPlV+MGAGMWphSd3kDQNybOQ8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HMz/ygkyJNys6xhWQ09l+GhBkjtC+IURWor
 4l4Quim9oOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BzAAKCRAk1otyXVSH
 0JahB/9K/b1CqDk1bv/wGg7ndgddwmueeW8z5Qip7okcomLl5nGNjRgbnQQ9FaiRJsJAWtoQBus
 //7Ugfbo2mbN5SbtagDJBJu8vnaO1vC4Z4yHFJ316O/TaQWCKZLfb30meHHxMirhth3FGjSCcEp
 uoh/Yji2Sqxw/8OnM0RyZ/lKkvQPC3olXoabkc/euoPwYMwJXNvBhvVB/gumr1Ep8/HapepPt/i
 EihiAmU0RYX8ukYQdnSoYUUbRVB7vcnbkJmLc5vhqAeC9EF9ihCEXZR9J23qzSZAE8mIi6Gux69
 wMKkVL80mrLVEhfjJ+FHV7WVxVHySC2RAp7zLhr6gWiicbmz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8978 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8978.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 5c829301cf4c..718bfef302cc 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -1014,7 +1014,7 @@ static const struct regmap_config wm8978_regmap_config = {
 	.max_register = WM8978_MAX_REGISTER,
 	.volatile_reg = wm8978_volatile,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8978_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8978_reg_defaults),
 };

-- 
2.39.2

