Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290E47C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B564C433C7;
	Thu, 13 Jul 2023 00:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207311;
	bh=TiTPhvZo9N7KpTy/6yr36XNtiQICsBYSYQYcZGYusaE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZLIZmFxn13T2Q4rbPZ4V1KtfDstakDp2ZZIjKMERVJh25OM8YTUiIiDBQmlBfKzoS
	 WnDelLrP7g7RDoJaz5e6QVhxlxoCbnorOwMNwZJiaHcieD2E1D2DAOm4gATKELrX0s
	 9Wf5JCsn9R9rinNmqEuIhYlLUi8bpkbmhjFuy8nuV/NSVpA7RhKGjvdDAK8oLW4P+T
	 /wxVbkxQQjEPD9Efl/RE+FvsXH9pljSAM0G4jDSYs6c7Y6cMS8bgHQ0G7z9k08T5Z3
	 Fb9Ky5XjvC0+O/Ntia3h6LWnjmiLlaPtrQJNB03WrhtC3NV0AIAjK26PV+5RgwohYA
	 mTw9Ox+5bn2mA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:33 +0100
Subject: [PATCH 20/48] ASoC: wm8728: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-20-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062; i=broonie@kernel.org;
 h=from:subject:message-id; bh=TiTPhvZo9N7KpTy/6yr36XNtiQICsBYSYQYcZGYusaE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G7u5BI+tJ5Ub4Xug7RQQVHSuL0cZDZUt+Jb
 9xHV/TsmjyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BuwAKCRAk1otyXVSH
 0CmlB/4unZk7Z9R7vZbdhKNIBMoupK2dVrDm2ak7Er8Gi2ATXUML2QtICoEAmhYOEFs/yBEGnWZ
 heu3LrAHz77UMTRpSGbDF+RVEZiBqdH2+o1a+O7lX4OWPNNt0iBhmVmp+pVS+qN7m53ruj1hrR4
 8q/aC9aS3InVgJhyUYpJVekzVF/fsnG/edA878GlucE6GHMP2hIajJTIA8f1p2ev8YNj9lgUWYc
 +L5Xxt0NVkymaZZwdC45YVzBgGACV9IrJQuITnvN0JkBxFlUUFxlQg4aU0ZG/q0gc1gkr5Y/VH2
 5/cJDKUWYBTGH42Lh5e3mZiu5xKgoLLvO+cACg5XlXL5Cn8T
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8728 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8728.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8728.c b/sound/soc/codecs/wm8728.c
index 5ea6d8fd10f6..0c943e7d4159 100644
--- a/sound/soc/codecs/wm8728.c
+++ b/sound/soc/codecs/wm8728.c
@@ -236,7 +236,7 @@ static const struct regmap_config wm8728_regmap = {
 
 	.reg_defaults = wm8728_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8728_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 #if defined(CONFIG_SPI_MASTER)

-- 
2.39.2

