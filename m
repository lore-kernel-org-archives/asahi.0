Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDF2366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACDEDC433CC;
	Thu, 13 Jul 2023 00:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207348;
	bh=osu8rFzTBZ8m1UeqrZg9hYkaNAUgh2FTql3B/T8oRkI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VxIjed1j8ox5mDiHFU9PyTM8DJ+voVRnDpWXH8LKXGUIOw17pcpg3W4XuBw+y9Cbc
	 3F6T/ctHHBoM31Zmmh9Ezp1KXM8UZhsjdPDRgSk9q0inzeM+hfSaTf0YaymxQFn8Ku
	 zz8VFhDt0eF4nM2/rM95XH9Rg/4RkGe7sAvoGshE5Qxz0Gt8B7LEvNxQk/IjBMIZC9
	 5dzOO4ICztrD2emh0oTTgNJDyF1TzujBCiPoINtJRWCuvDNwtC0+EJGxNnfmubvRMa
	 pLFpSsG5ZJTzm79j4c+NUNq27Qco0/AEJ5zBUGO61NbcunOSHlzsAgzDarbyFdVfEm
	 WykFLV/9vCJpA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:46 +0100
Subject: [PATCH 33/48] ASoC: wm8961: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-33-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=broonie@kernel.org;
 h=from:subject:message-id; bh=osu8rFzTBZ8m1UeqrZg9hYkaNAUgh2FTql3B/T8oRkI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HFVJTniWn8WK58ZxzT4xj0xd9JEjTAFo0cd
 jOnS465z7CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BxQAKCRAk1otyXVSH
 0Ej8B/sH5ybSlKjsZpZM52BJAX6c1XrV3Wy4fsoIHRf8Nf4zfBT1QvatB0S2+yXs/s4QfI8AOA8
 l6wcsoX/Me/hZg++YmpoUfPDZ1Iafehpp5V01fLvdCAY3HjuMyM6SzFoci1jPXz1BZYCeyN1hrp
 Ko6hDKpwIqf5UjsljCRnPsz7HtVjgi+VskP9z6CG1CI6djHYjkXJJMhXrelb+lRpmkmNEWydhn6
 yEKi32j0wKlnYl4vH/jJirxNqkU7na/hpakYujM60bk0oHDplV2acdjpkR1K/AysBIG2jvi+P6B
 8XzSc+M7siorSsIHGggdCFn/GO+F/9Q+GnckvWWNGOadOiQg
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8961 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8961.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8961.c b/sound/soc/codecs/wm8961.c
index c076f78d04ce..8f8330efb341 100644
--- a/sound/soc/codecs/wm8961.c
+++ b/sound/soc/codecs/wm8961.c
@@ -904,7 +904,7 @@ static const struct regmap_config wm8961_regmap = {
 
 	.reg_defaults = wm8961_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8961_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.volatile_reg = wm8961_volatile,
 	.readable_reg = wm8961_readable,

-- 
2.39.2

