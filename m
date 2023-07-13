Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BE6366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A053C433CD;
	Thu, 13 Jul 2023 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207324;
	bh=K+uHgFpOwUEUeSWZyVu7FZjBmFPpYsmD1WRCwpLgioU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JK8l8xD1Su/+cepOW5n8t+segnkh/RSqkV+7A9kmAdMO2mYUK6QpjnruWZRtx689q
	 kScBkvb2+Nsz/Vx8RUwl5CxZWlFH9ULqykmr59EViOe2xPvNmG2R30YFRHt42wafeB
	 EWuyivp6rUwsP9Z2wdrDFgBFamSUUy53F3rjjArHCUrHDUzxeE9B+X6QjadOuTulEa
	 CUlMOczOjL0Kt7kgjzL+3dRT3ad+HjXdlQMTXoQIn7vk+QT+aYFLR/Epo/v9hbyZfc
	 1Xm9w9hFDjB8WsrQRq4VGVNaG16aSg3zOyBsRJT2mdSyYkPz6CIJVh+cUAnO3QJuox
	 ruTTNxNoyPHhQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:38 +0100
Subject: [PATCH 25/48] ASoC: wm8753: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-25-a62651831735@kernel.org>
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
 h=from:subject:message-id; bh=K+uHgFpOwUEUeSWZyVu7FZjBmFPpYsmD1WRCwpLgioU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G/nNhAICAzKig/CE7nseQNQw603NThB9swz
 9/06yP5cgWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BvwAKCRAk1otyXVSH
 0I3LB/9NyMDeRz2oozNI185rVAiG01nXWsOfZ1mL0BsehUqhJtqiueCjSBF1nauHDwznOB93UyI
 e0ue5ighYatcq3GuB6z6ivU0HUEcEFHpuAGbw8cLH2vbf/ce1jj4bllm/CcZ3FprG8HFU2Usyik
 Z+1IuzayDrCDuQbcXCTOvk6mN96Aw9F0a7oFFzLe9QMTxui4D0oyTwTTs2frECEKdlR/7zIh7rS
 WJ6m99MC7LV/OgI/Nn28sOTeAQR1I0c4G0WYD5PhL0eZZbFbaKmFAvWNpUaYv9tE7OSSiiEYA90
 A81Iqnosu2N7hVUfoa1bJeh3+BdJA5If1mnjNNeydCRt+/iJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8753 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8753.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8753.c b/sound/soc/codecs/wm8753.c
index 5e8a8eb41b2b..b5d8290c37d9 100644
--- a/sound/soc/codecs/wm8753.c
+++ b/sound/soc/codecs/wm8753.c
@@ -1507,7 +1507,7 @@ static const struct regmap_config wm8753_regmap = {
 	.max_register = WM8753_ADCTL2,
 	.volatile_reg = wm8753_volatile,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8753_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8753_reg_defaults),
 };

-- 
2.39.2

