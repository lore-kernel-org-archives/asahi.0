Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7356364
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF60C433C7;
	Thu, 13 Jul 2023 00:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207388;
	bh=ebII69k6DQ4r2X0HdiYVZcbSXjtVMF24HW2OLsV2rA8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jz8b296j1Jn2pJf6+uq5aMRTUMYnHw7p+nNR3ZbE+SizNvGimfUE3BAd63UAuZuqk
	 mT8n0+R0dVTo5AwfJGrZ2hxh2u/m7/EVs+lwmtZP4VyIlclpcPkLQCSx7P6RIBGqD+
	 FfsaPqiVcArp/C9R2Xqg57l4OX/XXjq9760GTyWu5OqvROD1ZkIz/9ENesf7Ah2Fse
	 02T2pfE+2nJBjGQSEF8mSnAH9At1tkQfLCncUAfTni/wKzSerX8Un/QvrmWfrbB2AE
	 YXuJO67IX7Oy5IpCeKbrMIXIfuxrwVZtTJjd8zr5olw94ZMUEeEgZEeDQP3w1b3e1x
	 A+0EOEZhaGtjw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:14:00 +0100
Subject: [PATCH 47/48] ASoC: wm9712: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-47-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ebII69k6DQ4r2X0HdiYVZcbSXjtVMF24HW2OLsV2rA8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HQT49IsB9FPGQ6zrtACJtgSSzF+YLTQlp/X
 eEY99qC+aOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9B0AAKCRAk1otyXVSH
 0DLFB/4pm9+L4qT8lCVX5/JWpnYArK4uE9Vi/qrH2zoX00ZC4a+uOutTMoYxuqWYI1Gtvdrk5rQ
 ZxWjiLgMaHMRbvFxjexvaUn1ZjdkqN63ryiH4oVoGMGfMzhcoWVPogY69Xvp5nAuV+S/iXgn+bX
 DSE81LW4+H7rysmXiw/bIV9zj38lRAn35vdnniYEQUquZfc/2zAydlvzk3gstX6+jggjj15gBNG
 fC5P5H94oyxcWejqiBfOfcK7aNaeUfCKrNbc1biEBqNkhZ14ZGXRoutPBaaJN6d/bqerhDu+veR
 VNbsQqRPJWn4pNVZ7Lk+Liotb6EhG/oKkmJQe5LCCCUKQYSl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm9712 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm9712.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index df9b7980706b..e63921de0c37 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -86,7 +86,7 @@ static const struct regmap_config wm9712_regmap_config = {
 	.reg_stride = 2,
 	.val_bits = 16,
 	.max_register = 0x7e,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm9712_volatile_reg,
 

-- 
2.39.2

