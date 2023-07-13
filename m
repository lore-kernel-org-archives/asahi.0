Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FA17C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89250C433CD;
	Thu, 13 Jul 2023 00:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207299;
	bh=sWuLqgc4Z6UtooweXyQMttnQTNbpwzdVPcwP9mGLJMM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HYerCLKTLdd8paDOUIwhfKJtE0re6pPg5yA4IQXplPTS/g04D9OVjaZqtlxbM7QkB
	 eHbqybTOQ60nSJ7BvxxMCQj2ARAzGxVB4kpK2Fvi6zjjyfAgVmJfUIpwuwXPj3YyWy
	 N+OZKxWMF+HEVT62SrukPeDbCa2Exnzm8NCPLquVM+t2YpLwmTwC04CkJbP3kR8Ygi
	 EQ7NjNmGaohB0kBGSTEjNXnD6qQWw04nUxXlL3R7WPCw2o8Ujx/M8cj+RTTcW1DupW
	 o/y/TmnXLEYk8CMtomqZgbNoesHPJWnaCNWHN3lFlHEap2b1HwxdZn4dxcqzHKdodg
	 gSBDVE3biQkjA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:29 +0100
Subject: [PATCH 16/48] ASoC: wm8510: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-16-a62651831735@kernel.org>
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
 h=from:subject:message-id; bh=sWuLqgc4Z6UtooweXyQMttnQTNbpwzdVPcwP9mGLJMM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G4hI+4fT27Oa6SThWntwhVWkz7vTUaL4CBE
 /Jqkw74FtWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BuAAKCRAk1otyXVSH
 0K5EB/4iPjMvcNtavWMZfd5yqKP+j13GCD7YzdlWoVQMvMvGsQYmSgHpuswc+eSbUBfp3nWXu8w
 H+jqDTzxFvLixeHJclW7hEz0BuQ+p4/QBFL2RHqhxoF8zzMl38obXImZDUqVAe3zT6dYep/62jx
 VsNvQTu9BYOx6yvUwlw8CfE+fxOyzTFQRTpzmiyXqw61FRt9AN6oaQ2DKcwjvpaKFWreQd4BVab
 4nW/34VmlLF2hnu4No8UDI/nHVQOYQNivEvWcmgNtsqgFXpMGPBJuDH2EZ1qxPI4w5O8Q7sJHcb
 qcrJuw45qMcjVCFbjxiHfl2auKTA/HIX72fBcHmWVG5unDC2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8510 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8510.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8510.c b/sound/soc/codecs/wm8510.c
index c0ed76d5b65f..6636a70f3895 100644
--- a/sound/soc/codecs/wm8510.c
+++ b/sound/soc/codecs/wm8510.c
@@ -607,7 +607,7 @@ static const struct regmap_config wm8510_regmap = {
 
 	.reg_defaults = wm8510_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8510_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8510_volatile,
 };

-- 
2.39.2

