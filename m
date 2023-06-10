Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C2A256A
	for <asahi@lists.linux.dev>; Sat, 10 Jun 2023 13:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E489DC433D2;
	Sat, 10 Jun 2023 13:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405407;
	bh=Hi+kWTK1PxUd+2cL7u+XNfww01HBNbov8hI2bW0Wnks=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ownAfYmKbWfyMHMVguJoNbBmEYfJLa6lV2dtjuZ2OtyTS8qxZV9/ZUE6T8jP/qiR2
	 xJWgIBHaglBw3h5gs6VQzyNOgzEUvX0E9B6rjGwWg9E9W2mxHyJFaVa3P2skhX0N3s
	 fqF4miMuto8TS5Ziv7aTtb9YXBBW2wd6CRltDllQK5v6NvSWv7U4ox+NMllUPhFvVe
	 ELFWXNuNbYii3Dwz603UCPXwll4X3Mnmo3qVlma3rXYkSgurbarLdeoUOWbL/LLQjq
	 kJs8sWWR4GkZns7PS1C8Xr0k8ZZ5ChUalNFYLyHqGLINAPFN1YUNCxpIKb8R2uzUED
	 xjTFg0x97JR2w==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:26 +0100
Subject: [PATCH 06/10] ASoC: cs42l42: Use maple tree register cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-6-b806c4cbd1d4@kernel.org>
References: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
In-Reply-To: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
To: James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=945; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Hi+kWTK1PxUd+2cL7u+XNfww01HBNbov8hI2bW0Wnks=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhpSWRp6YeBaTxDuSK571zW1tmM6Zfly8LuycyOKUzZalMfdj
 qrQ7GY1ZGBi5GGTFFFnWPstYlR4usXX+o/mvYAaxMoFMYeDiFICJ9Hqz/7PliGuMFFF4EFgTxxA8L/
 2aSW/fuqKrG7ufX/eoDC2rleVYprZ7UUTx1Vj+VcqTonnqp9mtrePiOcnjf3Tf/4Uck7faNfz/+lVb
 JYX3L+9K7w+ud7pC6sP/LQp++tJoC5fcwt4Tkdp202fyWttJnXHeY7r+f4rSW+fgsG0GLoZzc14J8r
 082S3s6fz110zex+uLFK/NW/rKtrewqrfYrtbuh7By45Nb6n7cFpVvPvxKWLvIXtmhnCs0gpU9/r1M
 /oLbu9QbFFR0RF6xT97xOYbzknd/hGHh3e5q1y/N8lv92t+bWOg9dV8746moxjO7pcv55gmtPWX3SD
 tv+eeHz4/xZm07Ezq9xPJk4eLfAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The cs42l42 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42l42.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index e3edaa1a2761..1c8cc4021232 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -393,7 +393,7 @@ const struct regmap_config cs42l42_regmap = {
 	.max_register = CS42L42_MAX_REGISTER,
 	.reg_defaults = cs42l42_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(cs42l42_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.use_single_read = true,
 	.use_single_write = true,

-- 
2.30.2

