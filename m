Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDE2256A
	for <asahi@lists.linux.dev>; Sat, 10 Jun 2023 13:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C9A1C4339E;
	Sat, 10 Jun 2023 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405401;
	bh=XE/HOtiY712F8cPy+rPIEF9BvNarjb3niAAMcV4MBUU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QPG17hbdRLbclGVCVBVc9KUsAk/pexQrc0JDk3KX8r37F82SzlhYuBayF4ojjeHrq
	 Zb7t203o5e6q64TSf9T5wIlo9uoAi2WWPseaNtj7RndSHvI6hs6QGzhZA8j0/y6ope
	 aqRb4Umrq+iyyfjtWTiL2WCTepTokTZqMYClsA6+RfdgzUzecvjTIJieH1pIyCRsv8
	 uikI/S5K8LjNcjLnl9+xzbOlO/4/uG2rORxFIxyFoQntkWLv+p4mR6jSt3O1VEMd1s
	 y7OL8CLrR6pxHc0LGvtA98VFBSZKgJlxA+SOGaVbXPVAmZudSQhAxBDWjpd9WAFTnM
	 q3SSoBcDj4gUQ==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:23 +0100
Subject: [PATCH 03/10] ASoC: cs35l34: Use maple tree register cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-3-b806c4cbd1d4@kernel.org>
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
 h=from:subject:message-id; bh=XE/HOtiY712F8cPy+rPIEF9BvNarjb3niAAMcV4MBUU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIEJdj9WP2SMiJw31ZvpKTbmCahHoUb6Sjq4xB8z
 4v9gIa+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBCQAKCRAk1otyXVSH0MB0B/
 9r0QOGGVpqnjVseXsZCBcufIlrhOmS3K9tdVnXG4aUOrxyP+bzB66X/aU4t02ZSw3v+ampOonBLKX6
 ha8Kjj+te4usQu6jjRwTkipkdLYsCjQK2Dr9v01wD31F0GHl3W8jVnyj4/lspqFSxlpf6q7VPKaG2L
 5HPaSgyhLuoo8e6xkJC6N06Di0HF6y7vuXtgLj6zux6Tk/aroauStSQvwj5QBRh7aflwxDZXGAj/4O
 GkqY0NgvTsNK9BMmBiA+sXfr/iH+/7U8PWNEsFrjmAqJFSG9R/BQD2pigDwg2wGtBfKE7GfTr/98lU
 WGUIAKoZhFMoXMcD5+xP85oXP3zFpI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The cs35l34 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l34.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index b3f98023e6a7..471d9e421fc1 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -799,7 +799,7 @@ static struct regmap_config cs35l34_regmap = {
 	.volatile_reg = cs35l34_volatile_register,
 	.readable_reg = cs35l34_readable_register,
 	.precious_reg = cs35l34_precious_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.use_single_read = true,
 	.use_single_write = true,

-- 
2.30.2

