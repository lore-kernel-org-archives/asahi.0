Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BC97C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78CBBC433C8;
	Thu, 13 Jul 2023 00:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207385;
	bh=TPPu/Z6W2UYe47f64BjjYuoAfWqnzRv/XtPbIpYnPcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EptHSpE/fsImxglU0a3uunwPdronO4Nz2+l9gu5uLcsa6CR6/jV/j+IcUDIUwKjB4
	 dE6Um7a2v4us8h+PP7WooNIVUXeUmvDyzTm4rxuWsukjz8zDHusskJEFLO9C8pQNBY
	 KAxhH7ieKdRYmWRCV+alQ/Y/JZjtUwBReLk4odwrXEEB/Dwznletb+Ft1yNuTsx676
	 ouuYPerstON7I0QtUVKZbfD1Kc8Ep6uxyYMpxVg5vn+aIkKpbfoPMhz7Cr1zmWxqvO
	 xFGtPSwDzTtcmp9ZbwvMGY/F55lzh/RJtF6sO6Gs4xbrL40d1XOV7EpfS5mHC9FaaR
	 uDfc3kM9qivcA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:59 +0100
Subject: [PATCH 46/48] ASoC: wm9705: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-46-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TPPu/Z6W2UYe47f64BjjYuoAfWqnzRv/XtPbIpYnPcg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HPyV+NRtOSquMoV8jbXAH+gf/G1WccnnYhk
 1sUN7KCWRqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BzwAKCRAk1otyXVSH
 0H/zB/40IQZu9mPvw6TeHZzPBg0kDIuctaTQjlpWCcGiH3qhFVjWi+tU5Av2Pg6r+enfUB6/cGE
 CErl2ZRpNU5Af7T2GpOE6z3qG8hgSUzzE9WD3OvC9DkIV+kwFnqnoUHOlhvCnraZOjHbC5Ye/3b
 oyzN2ghjRNUh1JZlPGRbBn0YfuLtd47VH/NxlnVMHxgGlmsjgrcCrP2SSJhO3HW4Jz6ez33cMrB
 EDcUdQ4gXJaILTGFDovraH/uTvDlimxS/VFr6h3jOJnnoKsSCPoU3a1dLXCfCTCqrVEdf3tQ6Ra
 1VBs0dsdYStcgjUncLIG9KFBJ+E1UC0oOFc2tgfZpYqhZNS9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm9705 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm9705.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm9705.c b/sound/soc/codecs/wm9705.c
index d04902ef1d5f..5c6aebe29cf1 100644
--- a/sound/soc/codecs/wm9705.c
+++ b/sound/soc/codecs/wm9705.c
@@ -64,7 +64,7 @@ static const struct regmap_config wm9705_regmap_config = {
 	.reg_stride = 2,
 	.val_bits = 16,
 	.max_register = 0x7e,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = regmap_ac97_default_volatile,
 

-- 
2.39.2

