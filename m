Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD0C7C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0E21C433C9;
	Thu, 13 Jul 2023 00:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207357;
	bh=caeaRZpv9KNt7MRxKdw/pn2QazYQmX68hlKVnirJ+Bs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uNeubY+JNmgBsT/C7pEnGzRA+PD9strQQ9MQ5lueBCCOOba4w4U9N9/15e9nYZuHV
	 N295mD1lrBSwW4JHvNkJEYjAKZ3Y9Pe0NSXKDM5ilK9m8rYO0eezmqFGrb94uw7AiW
	 c9IL+O+g/0pomlLUtLnsf08KOUmMdB9k95DTQxm+tIN1Z0ex5lpb3+mgfiU6kTK02D
	 qdPnb99C2Kro+HRosGSpH1i4Xb+eAMxrxmzEwoA2pGYwJS7/jefaCwEJSdPGoeW+WZ
	 pmrlqkbMDdKUttyUKT/8hSg1tImov2awJNK2O1wEZCNwgWYvMIvjF4DqRPXouKdRqZ
	 qfnisKTjohy2w==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:49 +0100
Subject: [PATCH 36/48] ASoC: wm8993: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-36-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1100; i=broonie@kernel.org;
 h=from:subject:message-id; bh=caeaRZpv9KNt7MRxKdw/pn2QazYQmX68hlKVnirJ+Bs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HHSa3044IPN5cebNYtDHQ4dPDxjw9QNyTgo
 iOWmlaJOpuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BxwAKCRAk1otyXVSH
 0MsRB/90/p/moaayPsqi7zAQbNv/3+HIhpt93DZxrDYnIdtWf8aj2S8cB3o/7QPMzNZv2uty4an
 JZzIpXy07sJmOZC5FWdBWcU8nNGlVadPYM6+8I55AAhyhospsA0Ka0oVTvRfnAwyaq9W4sv1hek
 oLtdfNuISJG7FeQg6/I0XUIzCpGSaimPQcl/PIO6c6jqYeiWLY4IVGzuUqMuWmVO9JLtSlVH81S
 nL7TB4P7To+Gi3rpEtVrnNw2KGNcj/ObF1cvK6AIhBJwY1ZNKzkkA5sm38CKWnDGMm9Z6H5D15H
 wrhPcFjGLnPmDwc8fwdnMhuPFSNios6RWFLZJ8rcRRNfhex9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8993 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8993.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8993.c b/sound/soc/codecs/wm8993.c
index feb997c698e2..5b788f35e5e4 100644
--- a/sound/soc/codecs/wm8993.c
+++ b/sound/soc/codecs/wm8993.c
@@ -1608,7 +1608,7 @@ static const struct regmap_config wm8993_regmap = {
 	.volatile_reg = wm8993_volatile,
 	.readable_reg = wm8993_readable,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8993_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8993_reg_defaults),
 };

-- 
2.39.2

