Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD3F7C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0FDC433CC;
	Thu, 13 Jul 2023 00:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207281;
	bh=VRXQYXa8Qxz2t7oUH72fvpxl1d0//wcuyf2srJuE27g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hVi6p03dKsQpA09T4kHv6dZbl0kKAcdXfDHWpKNJFTipwO2POwMR+zzuYBcWx1XXT
	 8SZoPLPSRMcJSkgu2sUHSsGSLKIFSS0a2axWvSxkM74BWksf481mJvb5AjJKK5hX9H
	 nUybjOSGBetiZq1UwOiPIE+hRrsydYDhzL8opXTSqkFJtQ258YcwEcmkhb6FyOk59W
	 Vz/QvDsuLgzbu/PGY5T58SZnW4936UKNKN3i3inndpwdWgBcbLXQYvqBHPsMdIe5gx
	 hA35zjmWKBNTOHykTb3henRpmpwpReVTyJanR4DNHFZEYarQ11VWQdmEI8/tHSGCC9
	 0e01l3mQo+bCA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:23 +0100
Subject: [PATCH 10/48] ASoC: cs42xx8: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-10-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VRXQYXa8Qxz2t7oUH72fvpxl1d0//wcuyf2srJuE27g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GzrvS/7kToxnbplx9I/PQ1ywQgQx4cLlXXs
 izUigE+IMyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BswAKCRAk1otyXVSH
 0Kd4B/9YxGHHWM7HWwKTV5tyMN3FKCXimdpw0jPbxNwNgXSvu6ZKRPrgFx7GwMU17D63Qlj9ZEG
 Mm/BNZZ/pu+uUQ/86+97f/vEO5BetD2k0QiVFBJV5mmkt9M+qVARzo0ls0Haz9ixPtzvtJGFJSa
 Mbv4x3J9VYYFI01p7xQM7Cgw9BFRFQ1GeeTix7skG+xZFfIude3fuYoKuyjBH+YP9mkfV3kAl/C
 N8aqCP2GR9S0kxmPpQc4Rh9GtOjhggudesvus6isyi3JFQQ4ake++JG71vI6aTZIQX3c56NHXP2
 DG+PhjNqJDXo91idWyX8ve8lAaAcRtQda5WgJho1mIrr8vq9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the cs42xx8 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42xx8.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index 4558ec38a7ac..9c44b6283b8f 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -458,7 +458,7 @@ const struct regmap_config cs42xx8_regmap_config = {
 	.num_reg_defaults = ARRAY_SIZE(cs42xx8_reg),
 	.volatile_reg = cs42xx8_volatile_register,
 	.writeable_reg = cs42xx8_writeable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(cs42xx8_regmap_config);
 

-- 
2.39.2

