Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB33366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:14:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B54C433C9;
	Thu, 13 Jul 2023 00:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207290;
	bh=aZ0Km6k2MpASmBDuwRnn2hw2kleJjjMTWXIxObqEJjM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I4QE4iMIFdt8PE/laEhh7wYh5S/vI8hE9kFf2t3/rv04qtmVLcAnCLCIgjc8XYwuJ
	 wkNNdjjh+t4GvgQ95ZDO+4jE8RIK7K0qTveNHBjgGaeQgMBH+ZEFbuExRLY9BN1CZC
	 0pvYkbnG5mb6FC41isXyfnbMT5tARqrT8idAjKv4hD+5KeMHHQfek24WBotOXJyrt4
	 Hx22gyCoqrr921cd6isvfErHD4tRlVSJj7VpLr/xziSBKOZCYvzxPgVbNajNFthjIk
	 UquiwonEVFxkYED0y9j0IscpRnLqqXRXRBagdTaFsqflb/4sV6DxDYi5N8VAq1iINj
	 8xp4eR8ojyV3w==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:26 +0100
Subject: [PATCH 13/48] ASoC: wm5100: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-13-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aZ0Km6k2MpASmBDuwRnn2hw2kleJjjMTWXIxObqEJjM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G24gLtpP3LQVGyJ30f9sTtZ7y/kKFdWhIFd
 /ZOMFiTYn2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BtgAKCRAk1otyXVSH
 0CaNB/9ZeUKsGlTznRt6qqfU9fv9H8QuR62+Usl4KC13JgVfeFE11I6slNflWmppCeqg0Y/g0Z1
 +QptrXkyF7Nu+QiGK1z2QAxES33Uuhlb5ZxEvRmTPiWStGQHu0vfukiEVyFtQlY3LXcNu8+y8Wz
 ysPF9PwI1bQ5tTmJH+nxp6S8yMAMYqdbHskq4Hnl661SZI0B+Pkd9O2BEVNlIjmPKVD/8Bb032Q
 L4mm/TfKuL0j3BPIUodNMod7C8oC33xbMEYYrPUCdulSEo2NKfEMeg7GUc4LofdA9tTdwzO4OF1
 cyrPhobraNQ9X/45iApvz/XiSkpZjB0jtyt+4azZwYar+nVL
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm5100 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm5100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm5100.c b/sound/soc/codecs/wm5100.c
index a86eacb2a9bb..ff63723928a1 100644
--- a/sound/soc/codecs/wm5100.c
+++ b/sound/soc/codecs/wm5100.c
@@ -2400,7 +2400,7 @@ static const struct regmap_config wm5100_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(wm5100_reg_defaults),
 	.volatile_reg = wm5100_volatile_register,
 	.readable_reg = wm5100_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static const unsigned int wm5100_mic_ctrl_reg[] = {

-- 
2.39.2

