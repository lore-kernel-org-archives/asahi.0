Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DA4367
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96796C433C9;
	Thu, 13 Jul 2023 00:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207267;
	bh=NUAvKg7hEMEGB3PEXKsUJF06rptBcDzXIY6bIE6/I5E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c5YvbZgmsx9luu/e29oTPzilVoyq4i56WCtWCBD4a786izd/zFxs2BsKa5wiBIRGX
	 332Lb1GYu5+LliCtmVy5kbmcxYZtKJ1YDvTfdeWU/9fieiv202q6pmYdk0cp/urEeQ
	 DjD8wI/ipi+5z2Srs2QenS5INH5cebNMU1uxqFqG4jhTophUPZp00HPC4VI2IYENYX
	 58pNc34ZlRJkzqamOM7DaSbGXGXd3ucmBovsJtfzhUkmaVEBgFFEzxKKd6EorGGWuQ
	 LoARsORH0hzmXIfKghDdWftC7Vhm7nRlbvGoap7yEulWuramo76JjMEFiNaW9/1Xzi
	 3JdRkfTiJHMGw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:18 +0100
Subject: [PATCH 05/48] ASoC: cs42l51: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-5-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1091; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NUAvKg7hEMEGB3PEXKsUJF06rptBcDzXIY6bIE6/I5E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GwFCVAM9ljNOsh7jyqUK9NyVqcpJcR7Z64Y
 9dZCx6K1p6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BsAAKCRAk1otyXVSH
 0KXyB/4y17GRx/hTY6IA495wUOTMkyyrgzZDT4pd/9phUHrXu1h9tIP1wemwVNMGWJVlgqd8trx
 +R9cVgcIZr+9Wuz/Nw1l/k5s6FlJLgxfQRYlH7ikFPUaaYjFFWM6j4tHl72cVX6hvILmZqWc9pY
 MHYtsOX+XzWrosBt8oYe3h/lfFSFi7YNC1gScQPl/DGc5YngncxszVjWaSKWAG05uDVThL/1YHv
 zilnKxLaEWOKRfaBLruVmjK2pM93EjSLRYd2DE6DvmNdgAO/nnrpsyNy2nnBPdIAmwFk7G/kKaA
 bH1bgkEZSvMZdjQCuVIkwr7qpY7NJJnwrUVNwZIuEnVChprr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the cs42l51 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42l51.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
index a67cd3ee84e0..36066fac394f 100644
--- a/sound/soc/codecs/cs42l51.c
+++ b/sound/soc/codecs/cs42l51.c
@@ -703,7 +703,7 @@ const struct regmap_config cs42l51_regmap = {
 	.volatile_reg = cs42l51_volatile_reg,
 	.writeable_reg = cs42l51_writeable_reg,
 	.max_register = CS42L51_CHARGE_FREQ,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 EXPORT_SYMBOL_GPL(cs42l51_regmap);
 

-- 
2.39.2

