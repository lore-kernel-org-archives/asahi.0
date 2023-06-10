Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B4F256A
	for <asahi@lists.linux.dev>; Sat, 10 Jun 2023 13:56:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA528C433EF;
	Sat, 10 Jun 2023 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405416;
	bh=jbVm6nAjnuw8YGp4V7xX/Oa0mHUKBPd6W/uMcpSc5O8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OYdBPTEG/tG8K6PKWGJ8k9JW2oeiuIE1IW7X2RMmeqqpiRnKjTpPKN0ugIStGJRDj
	 huy9+wOfD3pLPSzwcce9zFF5X0UhgWK/2AU2Ty5lLyJ96lxT6qcbqPMT+JHf03ZhyL
	 PZxnHcabfW02rcyiAGT2hjLjOR78q/0cKE3I1Xsp0qhs+T6QXGFSy/mkIcW591oW67
	 nEPJMcc3wDCJwfDKyzmJX8NX8I+zzriovToVcm9zKRo5u/TJb5kiEPLXYExOhA8XJD
	 dZuNP0XKsNcnty4v44h0ezhdAJtOPnn1d+WzPnrFPn0+8HED6OVG9KJT8EYh3vi1I+
	 61KBjD2CSZEKA==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:30 +0100
Subject: [PATCH 10/10] ASoC: cs35l30: Use maple tree register cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-10-b806c4cbd1d4@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=947; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jbVm6nAjnuw8YGp4V7xX/Oa0mHUKBPd6W/uMcpSc5O8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIEPe+NDsQGbm9Kl+LnAdeZ+QLO7SOZWH4Wd8VQ/
 JaVmbMCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBDwAKCRAk1otyXVSH0A2PB/
 sF/I5gPRZYy3opFuD0FlW9f5auBDIsiDoIgeuT/+lMOAUQipzFVktUgfzV+6IazWz21DAuRkHqhDi/
 kDTPGUsryqbTf6ChXVZRV6ujUPZcKqaucrvtUvG6/As+KgK84l+Xzu86uG1RwcjeRjPywN2VYt1r8+
 r+bzSDtDOjZaSwwcgTFUbDON5vd5ZSsblftoElJp6I+mhsS4PqGx47Paf6E5wp/BWE4gNXP0uDTEqx
 phUreTg+6+jyW3VL0CqTjhLl/qGEabBmROQCYPmfjLWY4dMy4xtw4vGAwF/vyCLax1rTzLluzF3PxO
 BtCndBHq0Coz5lGyjSTW2edr3wAoRD
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The cs35l30 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs53l30.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 69db0013d243..dfbd5b2b2bd9 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -911,7 +911,7 @@ static struct regmap_config cs53l30_regmap = {
 	.volatile_reg = cs53l30_volatile_register,
 	.writeable_reg = cs53l30_writeable_register,
 	.readable_reg = cs53l30_readable_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 
 	.use_single_read = true,
 	.use_single_write = true,

-- 
2.30.2

