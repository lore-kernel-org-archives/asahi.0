Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB3A366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499F0C433CC;
	Thu, 13 Jul 2023 00:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207330;
	bh=c3tkK1xfT+JxgIXVfAzXWyvgXZjJXs9r4NWOTBzuNSQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z2SNBncIlYx/gcHXllMMPYo+rtVhGmdpkAfSEAuihcL9+3l4s+yYRIn+oRgmFVfCu
	 540x4h5fVamzBZPLOROW0xT0eEgWxuAyCCtPx+/bzYkTQ+xrIaFshxTnr0xPr952wj
	 xM7J1pzg842e09QT7k+EYj3fR1dHfej0PWrXtGCIq2z06lflLAUIH+tTjWXRk+US2L
	 2XDh5oJZ+bLS5gIXUOsjjRQkSmbLj/V5ZmSvw+DeWow3gG9OY42d2jp8+2f5LiJb1p
	 bPq4OGkcC8btOnuHXnErmRLbber3NlUtRXgRSaVm3GHx9HgAKGgrRFTb1iC0iCT7jh
	 +fWohmchKIY0A==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:40 +0100
Subject: [PATCH 27/48] ASoC: wm8776: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-27-a62651831735@kernel.org>
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
 h=from:subject:message-id; bh=c3tkK1xfT+JxgIXVfAzXWyvgXZjJXs9r4NWOTBzuNSQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HAtCsCipw1BeA6iMT+ZzemVcZnx2cafvtkv
 oI/x9opIcWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BwAAKCRAk1otyXVSH
 0NuWB/9Sr+eHImBhO1j21cQ91Hf1HbyJdJKXS84yRrjmzNHABIT8Rk1xX/dj64Wud/ETg577h2d
 to8aZvkM4YemduAIobURJ7AsROtmofGualZvupfIEGd/yuieblcB9JkJiHmjPOCSJFPJX5tUBbe
 2CtgfvGVC5IeNU9ZlJ7zgSbD69G1Xaacqvf/sVbVjQWks2S32N+g7ID6t7VVBEcOg8eAlb5G7OU
 +yDxIKfMIbvDeCqq+ro9U9yM+/u5C93VY7RpK0CfqVfKjjm90p9OCJXAHzVvIwxaTVH7MxzpZKV
 YZXqUa0j/kH8DCbAnUWN04FO+v3JBZHhG/llYLcOEjXodHKP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8776 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8776.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8776.c b/sound/soc/codecs/wm8776.c
index 212224a68006..0673bbd32bab 100644
--- a/sound/soc/codecs/wm8776.c
+++ b/sound/soc/codecs/wm8776.c
@@ -451,7 +451,7 @@ static const struct regmap_config wm8776_regmap = {
 
 	.reg_defaults = wm8776_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8776_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8776_volatile,
 };

-- 
2.39.2

