Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFAE1F959
	for <asahi@lists.linux.dev>; Wed, 12 Jul 2023 12:25:44 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1689164175; bh=+zOGmx788boa/WYXZXSHp10404gZAezs3tbSbvOFB78=;
	h=From:To:Cc:Subject:Date;
	b=BF176sWh4JM2x4jua53SLTlTaPARQF0ojuXmYrv9uAmkjpOYD5SEQjqgqBUdRa7k+
	 UfVMB8eg56f96s9vLZ8J8Ook3eMiAZ1GbuCV5ENtGFG/ySGPUb5EfePufHvt05BauU
	 MTIXM46AYN89Tg6O68FePXWW6Zgmc9R7Q8eRZsYo=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH] MAINTAINERS: Redo addition of ssm3515 to APPLE SOUND
Date: Wed, 12 Jul 2023 14:15:56 +0200
Message-Id: <20230712121556.93500-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MAINTAINERS entries added in commit 4ac690bbae02 ("ASoC: ssm3515:
Add new amp driver") were later erased in a merge commit. Re-add those.

Cc: Mark Brown <broonie@kernel.org>
Fixes: af53b00fa3ac ("Merge tag 'v6.4-rc2' into asoc-6.5 to get fixes for CI")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3be1bdfe8ecc..be7e662c653b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1865,9 +1865,11 @@ M:	Martin Povišer <povik+lin@cutebit.org>
 L:	asahi@lists.linux.dev
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
 F:	Documentation/devicetree/bindings/sound/apple,*
 F:	sound/soc/apple/*
 F:	sound/soc/codecs/cs42l83-i2c.c
+F:	sound/soc/codecs/ssm3515.c
 
 ARM/APPLE MACHINE SUPPORT
 M:	Hector Martin <marcan@marcan.st>
-- 
2.38.3

