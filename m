Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B7D7C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82928C433CB;
	Thu, 13 Jul 2023 00:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207327;
	bh=hlTWm9uzvVhLJWDvXOfLrEEeUpDCqI158rWMlFjjDDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UHx4ltPzUot3P5aWbLEHvziNheFIF/tvtNs+QcJQkxcL8Jba1BpkkU888DLXD/83R
	 eGdqnFPeyFCu7c7suKtmf18ycalRNCWkanMU2ci+tAg7YmCApbDyxT0NF4Vcb9DIMz
	 EQgFSv9OEy8K0p2U6y2H2iJ/FPlKsRuGU9jVV1EmjeyzsBxEgbj98o27+DXzNIseHU
	 +uc4DCpnyi3hdzTNKBG6k4tc2sXDCS/ycDpt/vTTH2AFYpBcL2443YrCXMd3qiWvlm
	 c/jq0tbEmvcKMhTBkBmOIX/sG+pS3vlc981BANi8AZjs6E6YIYkctLZew5FgdArN/L
	 h6NCgw81MoQQg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:39 +0100
Subject: [PATCH 26/48] ASoC: wm8770: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-26-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069; i=broonie@kernel.org;
 h=from:subject:message-id; bh=hlTWm9uzvVhLJWDvXOfLrEEeUpDCqI158rWMlFjjDDU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G/hTZZ9wwUZvjJvA9gnyujC//k5cKF/mI5z
 v4rDzAQsdCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BvwAKCRAk1otyXVSH
 0PY3B/0T1rLPp6rDWLDeCc1gUt9KPH8JaUhiYBzSCEjjbLnlo480yiBEO/VgvNbeIuhFU0k1E7b
 DW3dyljrQFVSNoWJL2zLbl7z1OMOan5Ovu9f5c+m1f3+PwFzMZknUCLB0zSm659emGA5YAEZLxs
 aTOj/ZH9SX/q47xbMl0gSDsRN+kXVGsoverbWlxslsvgBGr4k89k5ZjSWp/dgeItzyxXll8P56+
 Mp3xOHq4UuFrCo1zJ98fzpZORpShP31yw8gbmpK1MeMPHOMoGpebqLIyTYDV79DYfTR9P4Q9EXm
 3WCKbx4ZqIL35SoCM6+aX591Uv01tP92urPX5BjokMaPa3H2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8770 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8770.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8770.c b/sound/soc/codecs/wm8770.c
index e03fee8869c3..2469f4f3bea3 100644
--- a/sound/soc/codecs/wm8770.c
+++ b/sound/soc/codecs/wm8770.c
@@ -632,7 +632,7 @@ static const struct regmap_config wm8770_regmap = {
 
 	.reg_defaults = wm8770_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8770_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8770_volatile_reg,
 };

-- 
2.39.2

