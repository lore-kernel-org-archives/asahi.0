Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0F2366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EDFC433CA;
	Thu, 13 Jul 2023 00:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207302;
	bh=mEQjmqKbNvHzHuxZdpcZL/1D4KD5AVyShbqeO+7gIAs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DOWw1nG9eSYOzbkPxvXwonNuO05bqHw1tO9wmSlcQBauUETFQqKJV1Io8xnruF645
	 nor4yiZazPZE6adDj67UQzoN9VmWNDC0iNMWTnDxhc9+axGzWWwVbi+D4UcKk9pHyV
	 BGyZf0DfX80lh0V9MNfI/rwq7ZNxd7IQNqGK8nYlL7lFzZhyPvIiBjQmRyvOKoAl7i
	 m7hXF6uaRajXD0iKISxzbJedpf0yajSG/IU5De6L8Tqrem9zcOjDRCC0zWE6/d5XO9
	 q1kUZfjBc41xEhgiTMlhkwXcxS7xhnwK518GJBXfKNUGelI8jD/bhLebsbYxMJGsdq
	 Bh7knKUu2S5kQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:30 +0100
Subject: [PATCH 17/48] ASoC: wm8523: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-17-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074; i=broonie@kernel.org;
 h=from:subject:message-id; bh=mEQjmqKbNvHzHuxZdpcZL/1D4KD5AVyShbqeO+7gIAs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G5ZWEXEXEbebbqO/TvCvhIYDxuaxlqlpI9u
 Nizu/xX9vqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BuQAKCRAk1otyXVSH
 0IfIB/93A1uAP04BdTRJ2i+RDVzmhC7jJbMN4OQz08gQabYnhNf9sSJ+OYOJ3RHlRFmlKk8eMoM
 ftqmNXI+MaJYPhfHcsWAGTC57HqPNTaLWHwsbwwdNtoHFSuLVx3e0OSe33cbYiTI5OMrIejIERo
 WfQQ+Qo1vAmNQRHBLDhqLYu+ZeSvp2M9eW2TdVyC6O37k62s3BES13k072CxGN6Js3QX0bVr/uq
 5i+r4iyE6nfbkGMOu6s/SG11b6YQjtI+I7BU1Q8HDMg+dLpC+v1PaTNR5x7NkQ4uNIuE1dkwh9R
 VS/YZjzxIfyX8sIBTYK9uYF0xWEcxa1QTF5BQBG9FZNhRhcY
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8523 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8523.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8523.c b/sound/soc/codecs/wm8523.c
index 55c72c5ac845..ea87cd3cc0d6 100644
--- a/sound/soc/codecs/wm8523.c
+++ b/sound/soc/codecs/wm8523.c
@@ -437,7 +437,7 @@ static const struct regmap_config wm8523_regmap = {
 
 	.reg_defaults = wm8523_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8523_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8523_volatile_register,
 };

-- 
2.39.2

