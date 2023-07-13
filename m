Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D20C366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:14:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1E7C433CC;
	Thu, 13 Jul 2023 00:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207296;
	bh=OSzP3slIHM0RPGBQp8TAKuB/zqLcOXA79h+ZosVLquA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VdnqO3ceG39H+mEqZlKuq5SSBDrO2Qjkd4pf88fD6EShZ2x1PUYZvnsNiV8V3R6fx
	 g7wuyFYpCMwNx6AmpOxnWcUgAqJT/HGiMtg4BXCI3kdyDaHlYFEOtPU7vjVF2vb5jb
	 1tAT79Oyw45sSM67WLXDChWi/5YB6thKlwaXWnQOutjxrfiPcD9QfkSf6jM+IFc3mu
	 FuIPhV5P7+NQWBpqWEC6sxc0cp2mnVo+GqZr3iVurkq29EDuYnYHPpNM2AL+QMYp7X
	 iczW1X1xKRJpfTaSbuE4DLK/VfYilHwhtjjuTlGyDkFXagXr32WxFkWFsr6e36tAnE
	 4VEYeKfffnQFA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:28 +0100
Subject: [PATCH 15/48] ASoC: wm9090: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-15-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OSzP3slIHM0RPGBQp8TAKuB/zqLcOXA79h+ZosVLquA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G38ro062rGSJj55rmfFETC4IVaFk+2t9gsE
 beNjK9XGOmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BtwAKCRAk1otyXVSH
 0JnvB/41ubRHjT7KVTMpQZ2Wg2MWxqhCfpoqCTvgYZ8rBMReyta0n2d4+bnmQWiryfYtWIRbmah
 /HgXyoqH+Du7XcBxqGpzP9K4NLjf9OMUoe+RMeYCPP4Dd5o99zLS8uWuzu47rPVeU6mZEccZN4n
 7IVrmxeZe8hsNm+t7OwccL6bACkhVWP8D9YbAqhdbQBgoNsdWKUeDGNi2WFeoMsI1gYFuChH2m9
 WMbA5bRfozgElGFub732sCS2orxEKy4nI5Vc/4SuJtfSxNRGnbEmOMhxFdSrcV7y9MwvfBIPbbH
 bIMjgEOVVf2W4LV4jNSUkTTr8UbS3KCvqfyS8FI+L/EK2+Eq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm9090 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm9090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm9090.c b/sound/soc/codecs/wm9090.c
index 432729c753dd..50c1cbccfdb9 100644
--- a/sound/soc/codecs/wm9090.c
+++ b/sound/soc/codecs/wm9090.c
@@ -553,7 +553,7 @@ static const struct regmap_config wm9090_regmap = {
 	.volatile_reg = wm9090_volatile,
 	.readable_reg = wm9090_readable,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm9090_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm9090_reg_defaults),
 };

-- 
2.39.2

