Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE0256A
	for <asahi@lists.linux.dev>; Sat, 10 Jun 2023 13:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F8DC4339E;
	Sat, 10 Jun 2023 13:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405405;
	bh=aO6l7W2k8vRVp8UXQjs9XEtX/vGIVtPaT2lmFllEag0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jGy8t2KK6l/pxkmWIgxgMJqTE5CVzXNYZIk/kLDw2qXfS+qDQjwWJhT2jl2AY3WFf
	 t12kKJcp1D9pEyzVrTTeQf9YtC94VgrJexndfnhqeUlkTHNHtcLawv3yg0HO4+ZdUV
	 J3WsPHybTt3VLXDZ7PEWaQtUQp9Rh5HwQ0LLwB4TrbgYft1kEKg/rugITuzxDtjBqd
	 mqRXWJvJnKVmgbfzOV2jkfB+hqBji3byiXfjJUlt8aFeeeZ8J/y8VWH9oBYe2u1+UV
	 5E53GSWKy+4gCvJgT9rk0/gqDVj/YjcC9MWW77nI24zvrElBT/Ia4JmCAOHVgXOAAA
	 NtLYjZ5tGETHg==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:25 +0100
Subject: [PATCH 05/10] ASoC: cs4234: Use maple tree register cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-5-b806c4cbd1d4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=949; i=broonie@kernel.org;
 h=from:subject:message-id; bh=aO6l7W2k8vRVp8UXQjs9XEtX/vGIVtPaT2lmFllEag0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIELwTk3nTZC+g8HKkLZPUQYUQFymN+RjhtnLbwN
 pNi+5Q6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBCwAKCRAk1otyXVSH0Jt7B/
 4kIsBkFWcGaOkB5VUBzvnBDoU7ZW2ON1seKWImWVEOIMXoru/wMZ4VAKBK4qzz+AWDsd54qfz1N6V2
 349MTORrK+anNqjcT0hQkDSKAF/h5MEMIPRbCEnlH8xAhn+bPLni32zezlZ7jZviUZWjy6PPEYzLhe
 MfEahYrNuKLVxtxx9vs5vLMAxwfDJoc5YRNudjEiLGbmATi+JBVmS2Kp2pgrp5vatAgZ5vhrMwArZd
 K+9p1VlAdzRfdh8dSQidEnqEMJKDxuLGMwnrqryMSICsvuwns0VeOgBp5KEGQoVQ18kAW+efvsVP4A
 9xPGNmrm4SUHDecKSdJzs9E7mSGvFr
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The cs4234 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs4234.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs4234.c b/sound/soc/codecs/cs4234.c
index dee1a6662c2e..e1d64e0f28fe 100644
--- a/sound/soc/codecs/cs4234.c
+++ b/sound/soc/codecs/cs4234.c
@@ -675,7 +675,7 @@ static const struct regmap_config cs4234_regmap = {
 	.writeable_reg = cs4234_writeable_register,
 	.reg_defaults = cs4234_default_reg,
 	.num_reg_defaults = ARRAY_SIZE(cs4234_default_reg),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };

-- 
2.30.2

