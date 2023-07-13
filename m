Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04193366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:16:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8672C433D9;
	Thu, 13 Jul 2023 00:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207359;
	bh=gJSZbPwrJrao2cx93fqYL1L6cp2CuH4ruhKdl+1SL3Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CfR9mk4AmA0qccMYh0uuf3+xssDtD9ehXKmZB3wBcjyatNTzBlXVx/1U7o+RNDuBg
	 NpXy5V5xqWnI/7SHI6b8l983FBHDoTx3/j4CUqZH4FL0Woz4zFvvWhTE2DiIa6cYTv
	 N4SIh/zttepNAEb+8skfe28AR7VKKroe8yjmTo3yXwV213A2hY/PXPBqfes46PPQoy
	 Pvh5BS8Wd/uudDlbXJVsYHASFx+DBNlC/P7hjTAmllFaF9N0X7O+bXfjRaRVwdwKsR
	 CgwgQ/nf49CJa5MCT080nSfgQDcSuFsyDKNxDDw0Z3jyMYNsZO9/LaomX5/JeLDnbF
	 Got1z2mH46jpg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:50 +0100
Subject: [PATCH 37/48] ASoC: wm8995: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-37-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1093; i=broonie@kernel.org;
 h=from:subject:message-id; bh=gJSZbPwrJrao2cx93fqYL1L6cp2CuH4ruhKdl+1SL3Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HIF3Nslj5oL4RwImE9COdmH9ewFRvmG9Nbl
 0yQalS/D3uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9ByAAKCRAk1otyXVSH
 0APRB/4lkJ7B71pUa83AzY89Z/4qGfcOYDGrONX5sea074UxuMgmWyG7m5RW7o6Rb1wvgwlW3YX
 t5oOCYKRTFD2UrTYg/kwwwTnCVVLbwrPPZm/awfgJbLc/7M9FkNcuqrFsxWo1aiSJOgrE6AVL4b
 7PPuaf/fijSC5NWJZ1dVt4yJJo6A3UuFLZxZL2rt1QHq1hIZp3XDJ9QLYoJxAdh62EhhcjMan2y
 tWMoc4+nxpntKKRDJbp9cjStpV0hP3iuVa7eEBKR8NI2g921nGueB2mCfzFNdqoU2SsfUEYTmDy
 WHtRcS/xqhv1XMrcxoSx26UDUplH9/EW+/HjTmXv8pUm2nw7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8995 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8995.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8995.c b/sound/soc/codecs/wm8995.c
index 90588614edcc..4ffa1896faab 100644
--- a/sound/soc/codecs/wm8995.c
+++ b/sound/soc/codecs/wm8995.c
@@ -2193,7 +2193,7 @@ static const struct regmap_config wm8995_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(wm8995_reg_defaults),
 	.volatile_reg = wm8995_volatile,
 	.readable_reg = wm8995_readable,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 #if defined(CONFIG_SPI_MASTER)

-- 
2.39.2

