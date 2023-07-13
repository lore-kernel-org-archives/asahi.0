Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F24366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C52C433CC;
	Thu, 13 Jul 2023 00:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207319;
	bh=5Blbg/xfRWYBk3+mutGYbQkQ4Yps69Vbul50Xy+zScE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VqfJWG9YV0SM8wtxeeaLca/qrqMNFnhrAiKVTanijb3z6ga07yi90ceWgtA5sjS8w
	 GLulhXGEHR0HNAw6XHWKnUWqkYqa/+ySfQ4j1588f2iq8/c3qJI/tyedfXkETWajoV
	 VasUOY7TcXleJi0rL/lMvqCzl0vu9iFqTDx2JnU6AcQCChLhGy9Uw12A8VT1r/8NI4
	 p5h0i/gW9lyk38/mKSZQRsn1sIwtAB+CI9lETuEOkC1CBV3ESkAl0TbOB+FX17Fin1
	 l+OL+GOdyy9kQbYw+Jh/J2e2jZP0r2qxyY8I79cLD6GXyXzVXi0N6MvTZXy+VWiMoS
	 kqPAIFxxpMzJQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:36 +0100
Subject: [PATCH 23/48] ASoC: wm8741: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-23-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1107; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5Blbg/xfRWYBk3+mutGYbQkQ4Yps69Vbul50Xy+zScE=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhpT1jns3rXg2r00t2UErUPT6coPi9MwfNmdOzp4bEuIbq
 sxlw36qk9GYhYGRi0FWTJFl7bOMVenhElvnP5r/CmYQKxPIFAYuTgGYyNQV7P+r7c6olS6boP/5
 LWOYpQcrXyTvt1U96yTsHKTWvYg0MDj3Iykw6vXqp0YJXBMki54fnHjIWjV8w+EvV335ak7nPDo
 RyBDed/lUia61dipP8jsO2auafrdYlvqfdzS/GKLx9O1yie/WfXGMjH/P5DUuEGfPaug7/Kr89s
 G/EldXRq49kPylxipKpMG5/5G7wbJYm6kr8hLVRIInvJrgO+knN3OBw8qN2vPtj+yvPfW/LvH9k
 w1l7aFNLcemLX78Pn9ZUMXt+FQxl6oYvXv+z5Ue1K4pLmn/y7DEwyJEtmgD482PMkr11lOWhUva
 sPpVKN/UeckfLOa3bVeFT6LnP/l5mp+lE8tazHPShDIbAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8741 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8741.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8741.c b/sound/soc/codecs/wm8741.c
index 787156b980a1..19e8fc4062c7 100644
--- a/sound/soc/codecs/wm8741.c
+++ b/sound/soc/codecs/wm8741.c
@@ -543,7 +543,7 @@ static const struct regmap_config wm8741_regmap = {
 
 	.reg_defaults = wm8741_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8741_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int wm8741_set_pdata(struct device *dev, struct wm8741_priv *wm8741)

-- 
2.39.2

