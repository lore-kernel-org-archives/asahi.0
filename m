Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B34366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186FDC433CA;
	Thu, 13 Jul 2023 00:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207377;
	bh=AAwZLZ3wCUicI0cwpGlzwbb6Ss2N5VmgoHj9kKZsWMg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e+/+EgpmdCsmOm+I7w01x9NSMCFcw46wIi0JFQrwOvt2lLOzV1s8w9y2iehyTKfiZ
	 rctITfDZtlInrxBVUL5Jhn+hNSzQ+qv6MuO6Ad9f9uEfWMUGIfvzw+y9eNgaEhzMNk
	 KgKWnK7C8WtWuu/4WtfegmuOLY74ix+un1RxYW2rlQMYoJu6vcGPKLUaskQFW2R57i
	 q4eIBzQK11xC1ASqJUAoKXmReFTW+WZhy4pUTHaV6JWvg99CoG2xyGUMlMLqfZXkk3
	 MRiB7BGK07tKJv8T93r5rfJMsQ4/Fe4zLyaGCaYTy/qTdNA4IbtCe8KKA2NcmFsJIz
	 WyRGXhnCrYnQw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:56 +0100
Subject: [PATCH 43/48] ASoC: wm8983: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-43-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1094; i=broonie@kernel.org;
 h=from:subject:message-id; bh=AAwZLZ3wCUicI0cwpGlzwbb6Ss2N5VmgoHj9kKZsWMg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HM0xllK/SOQQG+LadzL1ML9t5duL0ZGokXy
 BcVXvR9dmyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BzAAKCRAk1otyXVSH
 0JBOCACB85ybYYCw9ZUVDYq+4i8bSmmQEz40N2jsMxkBkMBmrU7rIeB42n8bHPLSRm5MewbOwIr
 Z4LguEF5O6AKrhFgkPl2L48X67a/VQ7JwM+oRmu3JbDKS0Lm/oadwBchvK1VoPDAynhLUKwomCu
 TOI/YYA83IBJSsns2ITppvOiEBuhvWYDRpbKfGFmu6+0EPkJ5XI44e8w3RD9C+Pl9BRXWTPl2gJ
 B+z2LpoiXs5FKZTJxNYJk1ccEms/7ZTdTvzDZRDpx6RAND/FjHLjuxtK7NAlt+4VnmJY0K+s4Fk
 UcsWn/CRdsSD2kEkniLYu5v5i6nmo7YR4ueJmGU2oTmgZ8QT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8983 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8983.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8983.c b/sound/soc/codecs/wm8983.c
index 2bd26e2478d9..b26d6a68e8d2 100644
--- a/sound/soc/codecs/wm8983.c
+++ b/sound/soc/codecs/wm8983.c
@@ -995,7 +995,7 @@ static const struct regmap_config wm8983_regmap = {
 
 	.reg_defaults = wm8983_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8983_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.max_register = WM8983_MAX_REGISTER,
 
 	.writeable_reg = wm8983_writeable,

-- 
2.39.2

