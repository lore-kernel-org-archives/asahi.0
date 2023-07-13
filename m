Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17B9D181
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB39C433C9;
	Thu, 13 Jul 2023 00:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207255;
	bh=kJFT9cEbKj5HvTZIT1qU5x1lwzXqqMv4rOf7af1iuCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lEvUaMrMJGJC86aMbp8sOKRjJPNRfO9bYUE9kEaLSv7ANHr8mcILnS2twuH3vM6TN
	 PNQfn+2rcApkcKOsuuupVhsIp02Q2C7jrdNJHzfDF5DmKAKH//A/wkNJJmlHqOgIbq
	 V2UJyON7dR0oGUWQxuKrgezY9VfnKxBfLaCRmEWG0Umh5Vn2xxqQWZNbn45dbvkUm4
	 yZNcASjPFEuX+Xu+YK9X8dRnx6rHGM3KBkTS5q90G5TLisqnb0u0NSEy8o4IEQmZAq
	 5wZGt2AQkti9rxyLH+KyFxSRsYiQln2ZuxGyvNFDaptDTxykCACsDYlEsGGOGVM30h
	 4L+jUWJ2ZOizg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:14 +0100
Subject: [PATCH 01/48] ASoC: cs35l36: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-1-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kJFT9cEbKj5HvTZIT1qU5x1lwzXqqMv4rOf7af1iuCQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GsCUUYHj47ptczrEIZdar6i8xxcjvJFnY0d
 LClLoNI7YyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BrAAKCRAk1otyXVSH
 0HGNB/0XApHxFtoTudv8vcnWUrVnQYvH+WeOWVIIkLM0rWuOZ7C6jG/2MR5scjoNOB+JsOl3DAN
 HEgbm7v7mnweiDZcVh+ge2uloCRNOxktIoIYRdqB/Eo/feEuWwpftY6WckrlEU+PXEZSWks3/s2
 iCQnF5qnfiwyrlwpB5Zpw/Ds9s/HoquQIEm35lGsTOp68XA+6xjogo7q8ido/6McLQ44vC1qR+T
 YBoN5NCbCUKCYIboNoe5LzgzX993VPQ2FqYQpde5Mt5RGXg0Ftrxlv0eLyYKhSXAv4MWg7DcEY6
 ndIQ1Na8JeX4ZSkPnaKw9NanxMuP6Or0Re7YUUR3yFDR3R07
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the cs35l36 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l36.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index 04ba7f25012e..20084c7d3acb 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -1312,7 +1312,7 @@ static struct regmap_config cs35l36_regmap = {
 	.precious_reg = cs35l36_precious_reg,
 	.volatile_reg = cs35l36_volatile_reg,
 	.readable_reg = cs35l36_readable_reg,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static irqreturn_t cs35l36_irq(int irq, void *data)

-- 
2.39.2

