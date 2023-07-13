Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4F4366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E851CC433CB;
	Thu, 13 Jul 2023 00:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207371;
	bh=uNz4oz4LcCtiuPJSjL4Y6B6FicMszzoTpc5mth9mp3Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bi3eHvaiS5DyZdv30rqxC47OKjEeCMreMKXgfB/aaSeU7uIbaAV/C5xXoqKXZX2GP
	 IxB1i8FXj1va98FzgecTnHzsWahgFhd+MHTndIfsGgtA17mvCVRbvSlpcIfndEMZyx
	 fdgQn7Y4B1yQxYfG+0D1n9TkY2VkKA6zCM9oStpB0OUw9CHza9vatDu8UYgUz8NjXa
	 DDgAUAgKth/IbCaTGmXfa/UJHigaCOTOeAmRVkcknRMmwLid/VMBURBTjOzjOPtoSI
	 fpcb6L/WvGEWk4YccmicCv5dmEc2GBc7ygIak1McZppQcKjPVIEWr72nEt8+Vxs75g
	 AD80my4ZpuT2Q==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:54 +0100
Subject: [PATCH 41/48] ASoC: wm8971: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-41-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1083; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uNz4oz4LcCtiuPJSjL4Y6B6FicMszzoTpc5mth9mp3Y=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HLI0yNT0SzPydClllTU5DxlM5qSK4sX3JnM
 7akj0dulcKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BywAKCRAk1otyXVSH
 0LqKB/9BMc91HsnbY6H7gztI4lbBbgYrenE8SVKDXmmRUpF61ZEwv9xCU0qmNIqnzEOFvy6U3MX
 LYP/qg5hQpkhxjwYx5+Sv6Y0IXdKVGHNqanmgvT+zSR1aWvAz8yWnk2AqnDVkigD6V0suhZ8H8L
 rRo67D7r0aaY6R5Uu2pRyiqyuyuxsWDbgw6a9BxnKyCxM5ecCFjTQfWtuB0byusmJAv6m0vjtMO
 5OAGDAD4QZiUpuCimPd/UX51wZ5cvMYn4uAGdl0dXA6ICEWN0ZGeG5DWOrVELv8t4JJtH+Rzqoh
 Y67YFy+gA8R080QkcHQ37ZmVcUXqrcJtn106opOwiKieg60T
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8971 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8971.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8971.c b/sound/soc/codecs/wm8971.c
index b22d8f0b59be..e88f323d28b2 100644
--- a/sound/soc/codecs/wm8971.c
+++ b/sound/soc/codecs/wm8971.c
@@ -668,7 +668,7 @@ static const struct regmap_config wm8971_regmap = {
 
 	.reg_defaults = wm8971_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8971_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int wm8971_i2c_probe(struct i2c_client *i2c)

-- 
2.39.2

