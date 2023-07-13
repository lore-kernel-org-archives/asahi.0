Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A0D7C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD233C433CA;
	Thu, 13 Jul 2023 00:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207345;
	bh=1jbRpI5sJeLKn9nenSrVePSD3Y2qxSI3XhNFEvhmbEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kmCDVfu8+vcIW784GFBjU7M84QonyN2cfaz26qiAmJ8BIDbRMGrgS41SMUnQSbuvo
	 +t5tNYpZtlhTvoQoU2zDb3eKLxyosBaK9iEtX0gjC1sfRDaJi8nTmcSiNZQZdwR2gb
	 wZqlNQPkIzdSk3L26QrWGbEHSsjPiLso9fF6sRv42kqj5R5AtJYIX7Zx7+iKYug/zw
	 iQVGv83SL326QHp1fAOG9mJAIBPFLIv7sVyl2P0p7DVHoljc6pPDCRKYYEuFK1MRfr
	 tW17I1xjvAR2Oc5Kz43emmghei+36Ke+cuLotyhlwzcCHrOywuj5qqH1m3fAZOAXlS
	 KqQgS8yFgjHJQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:45 +0100
Subject: [PATCH 32/48] ASoC: wm8960: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-32-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1067; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1jbRpI5sJeLKn9nenSrVePSD3Y2qxSI3XhNFEvhmbEY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HEJzDyLJTfCx/5uOgCiVf/SIO0SukOLGDNC
 WA8phrGUeeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BxAAKCRAk1otyXVSH
 0DiwB/0S2O9ovOtbT36/mpVIiM3Dcb6XR+FtGR4CUEbGG2LamWGZ41/nHADG4BeZklTQ9T6ye1s
 WqJXUR+rcxg8ttEshjquU6b51iDCCSmhpbQmNGAS/CjOnVaNDOqJdZlhqN7rSbWXEY3H2oBp0e1
 gxWgbW6F4m2kigzzf1+XsR/PwV+HHTci1EvTN9ck9HeBRZk+/Zz+8vCUgWSBCD/EneLKzpuE5R+
 wjVBJ/pabYUKJ1I/C5jUwLz+k7d81rJ+5E8j/KuLCh0udxmjx1JHvSHhHyE5A5BEhSV9n2fFNY+
 ZiZe7+Wsm2vQI8m2x06TEr/tAgwcC9FzI/xwVa1NNMvfNCcd
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8960 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8960.c b/sound/soc/codecs/wm8960.c
index 366f5d769d6d..3a73d02cd698 100644
--- a/sound/soc/codecs/wm8960.c
+++ b/sound/soc/codecs/wm8960.c
@@ -1387,7 +1387,7 @@ static const struct regmap_config wm8960_regmap = {
 
 	.reg_defaults = wm8960_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8960_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8960_volatile,
 };

-- 
2.39.2

