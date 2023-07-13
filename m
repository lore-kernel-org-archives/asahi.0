Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258B27C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C817FC433C8;
	Thu, 13 Jul 2023 00:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207293;
	bh=3PywKAFWkwriAnChF4krGz94x7ZTY8vloSY8lWfMtIw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bfBZyVkPjw2mINifzXkW8ZbdIpPEXSYNq5GkxwzJh0Om9rfWmiTaVPcYMfCKbe/m/
	 RfFCXEPEIDdRSpbRdoqorojLiBXGFZe+rn+3GjT4G4eSQG4hC95IlS/3bhtK+qOJ1j
	 shqVT/Jlh6mjErexCNZcesJkWlwYA6JSEbLVCX/WzrV2P2P2Sp9ZOMI/6F0nvhlp+o
	 gOLSHAHkpfpZ96ARiOGYnJgH9TuE8rN8pnEdnmm/UhWQ3tYR4wvWvlzg5Qav7dPcPK
	 8xy/w0FfVQPmfTWLGn1TM+0tB+cJbehIhCUd5tv2usmpYeQk5tkokRq/n61z5IcFgi
	 +qoDtE6jPxexg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:27 +0100
Subject: [PATCH 14/48] ASoC: wm9081: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-14-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1123; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3PywKAFWkwriAnChF4krGz94x7ZTY8vloSY8lWfMtIw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G2HrezrlWer0LCujg9qoAygR/GodqieebYY
 ZTu2kG7GxuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BtgAKCRAk1otyXVSH
 0BFeB/0SUuVt71NVh6ny9tCg+wHFoQoANsYSCn6u3sQoq5J7nGMPUok3/67DkfNranbZc8/XHK2
 /Z6PGTOCLpRULxMNxjkbAm92n9oAOsn7zL9Zt5C9ivCOHskowMxnJregwJsd3TALZYB6SBZZyYE
 21wmVvy4PKQNGNFqWjruZGUx1T9etYK9Cz1KPQAkQDctuzgW3UuJveYEAJ8WkodY2nBHFxA0oXR
 3sCjW4vGpZSROLjGkbpK8Pe0p+BpA1UIdmkP8wPPeYViSgS6LQJ+YI27sZbrrqusY6ZEKuPd75w
 k38nGIqwhhnbjtbj8sxPx+U64i76ZViGZ7LkULJk6nXgVXWi
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm9081 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm9081.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm9081.c b/sound/soc/codecs/wm9081.c
index 34a07db7342a..e7ec799573d3 100644
--- a/sound/soc/codecs/wm9081.c
+++ b/sound/soc/codecs/wm9081.c
@@ -1295,7 +1295,7 @@ static const struct regmap_config wm9081_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(wm9081_reg),
 	.volatile_reg = wm9081_volatile_register,
 	.readable_reg = wm9081_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int wm9081_i2c_probe(struct i2c_client *i2c)

-- 
2.39.2

