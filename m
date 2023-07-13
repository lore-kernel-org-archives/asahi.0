Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922517C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42C8AC433CA;
	Thu, 13 Jul 2023 00:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207333;
	bh=ouZk4wc+f1PIp4ij66/IcUE3AAmg7eKbHKCNGiU5Pf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tqKj5fDTQBC8Ah4pEQBT/mQQ2KiWaWYkzp2sGBAWcxfGPUgLXIxJt7iK0xgGpj2I6
	 i3zxAzqH9JXJtZO9PpMxTpgxqyNw5bhaAzr0Dy5F8RIeWRLHkKrevgGCXRNfW6QcS0
	 gPzFc7Z/lXLe+GOftQceEeJVV/JPHqLbZY3bK25nslGD11+Xv1kNg7NU3Tu5LxnQTp
	 KNWTJVjCbGLA+AJW/d0QbHnThijStlol+SltE2DsC8f82S5696P9jx7/ZGN1VA3Slo
	 Q0AdZUbhvIpjIDGVNtGmNixg2rUJpnf6I2tZHsHwDLkjW79urJCIs6vFCac2Sxg3lC
	 T5D7oVaJ7GeDw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:41 +0100
Subject: [PATCH 28/48] ASoC: wm8804: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-28-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ouZk4wc+f1PIp4ij66/IcUE3AAmg7eKbHKCNGiU5Pf8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HBjo/wcEmoFBcXY1w6KGWDknQfgXgkwG280
 HMfK8DrVDSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BwQAKCRAk1otyXVSH
 0MazB/9JXh/xnUzb4zBWrVG91FWymTWN5gYMKLCKMfvqibV6rRSDJD0StgawIlWSgtLBpKbfKNq
 imx6b1ahZN94vi4i7O9QJn3J3K/2q40+lGUO3SICpa0Bplu8d46Qra5P1VtzxsMliepEyRGCLqZ
 uQtaTKGb8YqkU1YUh6J0rkcKnwpbbSWeNmJvXwJjrw5qvvhNhkDbW0hN5BetihW+MebW2/R7veh
 wgHY03k2d2pAXr9voLS9EJF/kaf3yvJYb2o7eteSnGfo6TiY87O3nih05rCiCLithViwr1n/dfq
 e0aCyHUOT0xr5t7tMbIPuAH9wcF1IecpfBJ5zphVPoDcICIU
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8804 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8804.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8804.c b/sound/soc/codecs/wm8804.c
index 0b234bae480e..bbb4b6e3b41c 100644
--- a/sound/soc/codecs/wm8804.c
+++ b/sound/soc/codecs/wm8804.c
@@ -555,7 +555,7 @@ const struct regmap_config wm8804_regmap_config = {
 	.max_register = WM8804_MAX_REGISTER,
 	.volatile_reg = wm8804_volatile,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8804_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8804_reg_defaults),
 };

-- 
2.39.2

