Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADD0256A
	for <asahi@lists.linux.dev>; Sat, 10 Jun 2023 13:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF37C4339B;
	Sat, 10 Jun 2023 13:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405414;
	bh=uovW9x7QeI5Vw8FamZ4fNGKWL57LoO3QGHMwuBR6qEY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qCI0lVBfpxlOWc/W723liZ3bA12EYep69q3eRfcT1U1w05FbsT/8HvNqpwwt2fUKo
	 4AAEtthPMeWuXcnSlp1HAlvYwaq3cpKqTEo8UzW6mrGmWlLZ7/TpVfnTxAt3l5OO9Q
	 U+KGexRLechivw7ueo9+hPEi90U94qbgm4+vg+uj+0I+yyIb9Z5uXReicPqiq+lwr4
	 FK8xX3ZvuxBhLznIh+bf5GvmH0jOsJ5N2li7KZArIRx6JHGuTGjeEnLfQ3vikerYKC
	 26+vWfLkGyZXZcrgTRlkzcz+vKBxe8LdJuYfli9K80QunD6z1oQLNDvQcQYmlrNclt
	 W++lPDSgLMGEw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:29 +0100
Subject: [PATCH 09/10] ASoC: cs43130: Use maple tree register cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-9-b806c4cbd1d4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=989; i=broonie@kernel.org;
 h=from:subject:message-id; bh=uovW9x7QeI5Vw8FamZ4fNGKWL57LoO3QGHMwuBR6qEY=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhpSWRr5olVNFYp1BJr7Xm8Of/Od9r8mW7uP+PPzcjTQ3xcd7
 pIQ6GY1ZGBi5GGTFFFnWPstYlR4usXX+o/mvYAaxMoFMYeDiFICJxM1g/6cp3ZMkM5Hp7xS/0P8z1q
 RfPqYza5IZy3Ph6u/JvbKutUeastz/vTy28Y99lcjKgolbH9/uOu/xWLv03DWeX+5SW26HTdjtGNRl
 3hUzgWPiRWffBj17japypciXu87XnLM0qPghzPtB2+v8aVV+x+a7a+wdrRh0Z86/v7Dj+OUA933hXm
 Iq8fyVgjw/J3a3XFoTncZ/lOEzt/oEnRobS2+O06saZ/1665YipHDrKMfXB3/b/wjy+HncE4lXf+OW
 tj+myOdcmpxhsI7ykci8n/VFV++1HtnucD47Ne+f0LcpmwUdM/t79DzeCETonDbTTN0X8mze32v8/N
 GuJ/7UsSnkxKkyc3G+D3HzDjsFAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The cs43130 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs43130.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index db39abb2a31b..b81257f0ab34 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -2357,7 +2357,7 @@ static const struct regmap_config cs43130_regmap = {
 	.readable_reg		= cs43130_readable_register,
 	.precious_reg		= cs43130_precious_register,
 	.volatile_reg		= cs43130_volatile_register,
-	.cache_type		= REGCACHE_RBTREE,
+	.cache_type		= REGCACHE_MAPLE,
 	/* needed for regcache_sync */
 	.use_single_read	= true,
 	.use_single_write	= true,

-- 
2.30.2

