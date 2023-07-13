Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08BC366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:16:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DEECC433CD;
	Thu, 13 Jul 2023 00:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207365;
	bh=x/iI9jVc1mJEZFmDovLOKMPOEISZT85v4e1NVWqXcOc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l/kYuBnE6e1/V1z9EGULZPjxa1vzR4oNNdEGErse8pJQsnu4y/j9SO2kXWWn0jvyn
	 4ghccWLPucr2ZS99gqE8Y2PpmG1ZX7uF9if38BrpOSgi04rCIFrixeUwIxHV/lxRdl
	 IJNDeVotv/2f/YbUlZY3Lq7ASo55qDMbopXP5nFdQ1g89xDHTv+LaXn2PSyLTNsoYe
	 qMYGFvfdpmtehOdfL7Y5h2YADa6NuMRk+fNRwRImI3uegeIPlHXKgTdLZt+/d9YK0P
	 HcK7mJ8D7Wh54ULuujSvlxyYFZNLPiTfRl9WeFotqPUGAk094XEOhW85TO5DU6oyR0
	 AroO5ea4uEOow==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:52 +0100
Subject: [PATCH 39/48] ASoC: wm8940: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-39-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=x/iI9jVc1mJEZFmDovLOKMPOEISZT85v4e1NVWqXcOc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HJIErYEqYb+boy5S2NqYZ6Z9O5RpEzUodj6
 WsFEBM/JNeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9ByQAKCRAk1otyXVSH
 0Ab3B/9kXP8UwOA3OQtnooyjccdJMfOqZ0RWUIKBmbGw8MuFfF7YbiMAe8oO7xyDkrmGOdMhiE5
 Hy77Zr9psCtWEjudCcoYQbcdPWGLSwDM1e2aOJ+x6nU8rJCtmfRy6yU8SLHA9UlujlRJThflGkT
 okOrfXEg0dgnXrLhV1ucuMmzH7zcDtN3YFpfehjl6goT4mQPWKApXyYHnc1UttMcuHzmiN0EPsY
 Ly7KL4ZMBoaZKdEj6KVhb/elB/y+sfGBVJL15bSuPiLfmSVku+JGkrFD955VAbxl5ivsA2hW1MG
 pa8FHLcsGnCRrlayYannuHcxFx+KXtPxOW/A2jnL0v7hvOOQ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the w8940 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8940.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8940.c b/sound/soc/codecs/wm8940.c
index 53c27986d216..b9432f8b64e5 100644
--- a/sound/soc/codecs/wm8940.c
+++ b/sound/soc/codecs/wm8940.c
@@ -815,7 +815,7 @@ static const struct regmap_config wm8940_regmap = {
 	.max_register = WM8940_MONOMIX,
 	.reg_defaults = wm8940_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8940_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.readable_reg = wm8940_readable_register,
 	.volatile_reg = wm8940_volatile_register,

-- 
2.39.2

