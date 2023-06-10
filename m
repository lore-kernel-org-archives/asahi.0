Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA3B256A
	for <asahi@lists.linux.dev>; Sat, 10 Jun 2023 13:56:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298BBC4339B;
	Sat, 10 Jun 2023 13:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405410;
	bh=LSuAZN2UmXFoESHPF//ikbcEsQdLM0vjlljLSX2NsLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SxC5XgNE9LvTLu1oWCXbxmr1bI6BIIBjWzQDzuQIpDud7sA0JBkQ45WLUIB/7y9MN
	 yIIvafiVxOscII3PGQ2/SbQQ8nHpM2AYMpH9Z8Z6UILGqb27NSTBPs1uJStkS/Qmjo
	 JVBh+/el1cRPj2XR2fYGlFPujhCkv1rxDtBZEQdLCwYo99g6SzlnSiujQa5OH0acE8
	 f33yTWM0mFoFmQmwS0huIkvWS0oz7Abgeo05W8lizhCGZVCueLgJFOSbH1GWp2OZfF
	 yEfZjZToNyfuEScwX1WjWtTXK0dzD2DJ2xwp1nPeGXHs6fZCrudsX0gl/i8/xs9S90
	 ZvA01nJoINMHg==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:27 +0100
Subject: [PATCH 07/10] ASoC: cs42l73: Use maple tree register cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-7-b806c4cbd1d4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=964; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LSuAZN2UmXFoESHPF//ikbcEsQdLM0vjlljLSX2NsLM=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIEMJpaVv8G7s5lqYvfkl+FBTppjBmMPrprJsO+G
 ZosCFX+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBDAAKCRAk1otyXVSH0OQpB/
 4+bPC+T+V9lkBzNK6qKxeaWyVibu6RjN3RUXLCzXSmbe5quZ9Tq6IQ4ZaZ9EOXajveXlK3lpvu5x0f
 278n5jf/cumkg6D11qOg4F+4PpQLNbr1p2Gh1xS5kbjm7BtAhawSGYbZ6+sBLFotbRQ5gCJjZO1eYY
 04lPO4Nspug51bcvnCTbNlpzgRTihTGBt1+T2YIOnbkCVyI4lplQR5AP1Go6lLvpSNYUkCGJKCfbbE
 mx7tEY+GRimMLvLjf6MDCFVVdMyLc9M7YHz/lGIzTObsE5trHgfXXJ7FTPKovElmW4F5Kz4n4Dn2kb
 PJ3vYDXm6McOW4z/+cOJDAKGWMPeUZ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The cs42l73 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42l73.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index 0a146319755a..d08ccd4627d9 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -1267,7 +1267,7 @@ static const struct regmap_config cs42l73_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(cs42l73_reg_defaults),
 	.volatile_reg = cs42l73_volatile_register,
 	.readable_reg = cs42l73_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.use_single_read = true,
 	.use_single_write = true,

-- 
2.30.2

