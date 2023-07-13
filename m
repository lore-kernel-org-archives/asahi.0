Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532667C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:16:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE45C433CC;
	Thu, 13 Jul 2023 00:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207391;
	bh=eySvdiHt0nvShNYD0dPWcUpDt+Gp3/9d9uPK51mRSJ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d1Xt2Jn3aX6zpDurP2+FCcxFmaBNLqSmLS4Zgw+jUIF2roRiz2bZeegv3rSn653hN
	 JSRaGEQ8YgzZIAFpDVsum37d1Tiah+O2s+U9ZXtt5X9oyg226FEByFLT+7nnrJRlkb
	 kraJg6EZVEsmdnRvz1pJvvgpU0X8ByRTlwgJDrPvI5tKjXGUj20y9pJdh0JorMPAHF
	 rE+voyycljIKTXKEPzEZsmmiBKKhZ6Em8/rysNtbHLlm6XB8mI2CixNl3laMYmTu3u
	 wi0N81+ZR6X09Q07sAzpDNLwtOorkggInFvawhY51LIIoKhpIzc8aphVSMQPm4cj2+
	 uKkskateeZV9Q==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:14:01 +0100
Subject: [PATCH 48/48] ASoC: wm9713: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-48-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092; i=broonie@kernel.org;
 h=from:subject:message-id; bh=eySvdiHt0nvShNYD0dPWcUpDt+Gp3/9d9uPK51mRSJ4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HRShdMLpPh/QY4YGuJRmn8dfk8SMFLeNE6h
 ce5j0Ttz4qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9B0QAKCRAk1otyXVSH
 0O3JB/4qj2IcnrCuzWlGbEJKY9hEOk6cmL/fFRpYrEdvoG1cpd/vy5X8J80DZWwsAD84oW2mY1K
 VWU8C/8m5jJaA2U1wufZr5z880cBaQXCGRWTWW5L1ch0FtIyp8L5hm1zrwTytIJCSgRCa4onpYg
 Hpdvqx569cZta53hYBV80ICtdXGTNH+ewKWEwU1oTLk6v9x6DoKAUpYdy4xrrNSSX61yF2+mWOK
 P8tLhYceWRaOJsT/o75YCmeth3tWB2btGoD3IK3Sc51B4HaVayBPGQ4lETsdpi0TYoLSEklCpPO
 d4tp/+41gfiHzWGn6O4o3DIMWSEpKhHO0PXs7hzfxYW06qV2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm9713 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm9713.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index 5d2e54e06e30..64b69316e4c7 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -727,7 +727,7 @@ static const struct regmap_config wm9713_regmap_config = {
 	.reg_stride = 2,
 	.val_bits = 16,
 	.max_register = 0x7e,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.reg_defaults = wm9713_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm9713_reg_defaults),

-- 
2.39.2

