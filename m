Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C217C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E1FC43397;
	Thu, 13 Jul 2023 00:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207316;
	bh=p9SLiWNYubnGrtWlIFYl6cE2PiPcU8xCW7b12JzI6uM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k4z2Lxjf/3ypfENrAAa7cOVOqeE+LSWlLO/e683k7MVhMvnBOlUoNKVjaiTJ1s4MU
	 qmKcNzoW5b/rSvx4VwhIHeQAZFFyLVsrfrOCDQUrRtYl8/1I1UfAUl0T7nCpeBPzUe
	 4j0+RBWhQyrb+4Zs3nzyD2wZTJfZPqq5KiZB6qFIhPtQIOoaXuNW/ajGZoZEJPQw/a
	 PqsK5li6twVFjVZbro1galG3quDU3f9y3SJkUf7lPTxQJWh3kk23XkLpQPn1Z7r+S1
	 pdxRgA2Zm948J3jyNElkfQu2ebQNGxzqtAobb7T+XR3hjDk3KuXDsaNHBWrriRi1OY
	 oOJjoRu61/mPQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:35 +0100
Subject: [PATCH 22/48] ASoC: wm8737: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-22-a62651831735@kernel.org>
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
 h=from:subject:message-id; bh=p9SLiWNYubnGrtWlIFYl6cE2PiPcU8xCW7b12JzI6uM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G8vGXaHi2LNujgmogYUKImWYUkQ6VPBE0FH
 JXcNRsj8zKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BvAAKCRAk1otyXVSH
 0EdPB/wKipM6cpFPWDPT/zUco7EGxN0THYKQQfJEu0cDl2h4BeSOuOBAdShsdesfGcajI1hInDL
 Z0LRp9NHSAPd4e4ZmFUAyelkVXiwWVwS/9apxLsAV90gPD2flR6ATQU7Phh/voFMuoADEI3n+kQ
 XZBXnvU31+Gl9cqYBom7l0lXWk6vr65Si5n5yR0uc51pTkcd2V2oIEVGr1LSfdDqNMjoLWYxMTR
 MKQo6rORQrhG3ut5zgU5FdT+ZOoCcH9/xB1UJdQOd5dG8Y/CgbWOTNkotgvpbRVDvCuokmc7pqD
 vgvdbGcHjQYKB+y8//zt2yoP/FDhNAl2BJLs12ykg+vwOut0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8737 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8737.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8737.c b/sound/soc/codecs/wm8737.c
index 9f4e372e90ea..0d231c289ef3 100644
--- a/sound/soc/codecs/wm8737.c
+++ b/sound/soc/codecs/wm8737.c
@@ -599,7 +599,7 @@ static const struct regmap_config wm8737_regmap = {
 
 	.reg_defaults = wm8737_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8737_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8737_volatile,
 };

-- 
2.39.2

