Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DEE366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4A0EC433C8;
	Thu, 13 Jul 2023 00:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207308;
	bh=S0FMra/NIwtgrsf52A0Jq6twDcNgq2AIqWYgXwNT5Sw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rD/goXWdT9Jim5bxZF1Tfr1xnCLuMibprK9tREVRRw514WcDyGbqJcz9di6MwJx7z
	 c0+lzDgnrjtgASvmVdJFoDfwVbSC9CDJWVa46Gl0AxTIpJxoo6EA0xdxGbSxoI/3ZE
	 cxTwmH0WZM0dAnlXvMz4vF/EgRPBwCpsGYx4MWP5uluT0kCVN4GjMoXak+aMGbyOFB
	 IWRnCtbJoUmkI0I1sFgPDBtXjz5r3v/L17K+wL9OJUe6z5sTZcARaKPR8eY6Ewo7jk
	 aEGki26Pm0B3cxqba0GJGjKzmXwEwiNdmltqI7lJkLYiyAfrGMn6q0NIJYgonWn1Bg
	 jeaawXHzbCxhw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:32 +0100
Subject: [PATCH 19/48] ASoC: wm8711: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-19-a62651831735@kernel.org>
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
 h=from:subject:message-id; bh=S0FMra/NIwtgrsf52A0Jq6twDcNgq2AIqWYgXwNT5Sw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G6u/Tcxc04uR9CQjEvI2X0H8LkB4yzDCJoZ
 vq4UtoNrBCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BugAKCRAk1otyXVSH
 0MZhB/4z/7bEJfQxifWv4Q1yhC2r+TvTqpuJV1pGam3rXDU+n//kVHVj3xoTHKXsi8pKCP+XDf5
 bNQaiXO8BEvV7rGOoG4NSMi78slEX/kTYaAUUHJtPR89LZUPQq7E2lzth696q16IJHa1rlLPO2c
 TrLF06aVRNvX+TTyc+uty6oVkxJNIS9EE0vkcfDb25pf9yuFPSNwYPxw+NH81L84A1bPeMAq6Jw
 IFWZoYTDV/7UbSMdai2zKujg2USFb1bMNIht2zXad5xkLAp/5qIrf1y+Qa0Xls6ZwWUXAwtrIxd
 wygODI4g4WTZ+d0vLIJO/ydOAm6vQxPzvL8+5OCUcOhuHJKp
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8711 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8711.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8711.c b/sound/soc/codecs/wm8711.c
index 903a0147d584..916f297164de 100644
--- a/sound/soc/codecs/wm8711.c
+++ b/sound/soc/codecs/wm8711.c
@@ -393,7 +393,7 @@ static const struct regmap_config wm8711_regmap = {
 
 	.reg_defaults = wm8711_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8711_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8711_volatile,
 };

-- 
2.39.2

