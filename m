Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37BE7C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C132C433C7;
	Thu, 13 Jul 2023 00:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207339;
	bh=0SngACP7G86bgdtRUTJfpix055BqdmD2JOX0dxB5Tgc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u9NphqT/c9iJjVtJqvS/wPKX4/ycQu/NOxJNf/pW2uGtGBUPoAV7t30ZwCKq+6Q52
	 uDViy7DG8tPi3VVyIOCmkB/t58WFUlFbeCR2P71bwTdxP7tIVuhAIofM0i34PCJ8PZ
	 OTtMvTyOJVS9a1gIhTGO1a5TtTbZDFEBY1MgpCr2DZDDSIncFketvWv5rfb5jZqhXE
	 TImbnMYmDkVD8L8zIwUG16hjvByvdYPM1S8oJarzSXvmM3mRurpPZG65Y77zYZsE4i
	 BjKWI1lvM+xOnK9ujK0Mp/sBWd5x4hy88a1bML6RhMf0tJHG9uNgoi/6O9iqe/Rsnx
	 rjMJEu1LlBTAA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:43 +0100
Subject: [PATCH 30/48] ASoC: wm8903: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-30-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0SngACP7G86bgdtRUTJfpix055BqdmD2JOX0dxB5Tgc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HDpV3QSYXA7giN1SO29fAxH6D5tXu7MQzzV
 QvGFELEidGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BwwAKCRAk1otyXVSH
 0GH4B/98YCbgiKkNunwijVDO9MlSEFllfzqTf+FSonckqwGOW31THFG1TnO04ZFpw547rRsq9jw
 Uz879o2FX7w0TuBLqSgMRwhOjOdtBuL98RDKV1hdz4Wq1JamdxljXzTHECSTtvuNHtf3ILZVcbs
 zP6g6eu0YSds8g4OWKpryR2yWN5s0C/DC06ZHAkPBZW5rctDR5UXbtXaTyhzI8zUcEk8AeCbHxL
 xvRiekBIn/ymwx7vF1schB1V7aupYSZ2kW41El0TIvFFXkJl78bjwEkYf7NDWKd7YlliLM3F8aD
 BJjnd7hgCLoyjOtQJ0IBzuMpqXkZKWUpCognFvtJ71kakpt9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8903 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8903.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 901b65ef8de5..84ae1102ac88 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -1902,7 +1902,7 @@ static const struct regmap_config wm8903_regmap = {
 	.volatile_reg = wm8903_volatile_register,
 	.readable_reg = wm8903_readable_register,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8903_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8903_reg_defaults),
 };

-- 
2.39.2

