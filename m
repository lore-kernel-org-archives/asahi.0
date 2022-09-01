Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520CA28ED
	for <asahi@lists.linux.dev>; Thu,  1 Sep 2022 11:34:33 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1662032064; bh=9K/ubU5/lJjGhiEptyCyT26bzZBKS5AKwNVg/nBi83E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QSOcuJpz14lYalHW0hwAbrV86WhHflonxSZNXVfz/7SWgKa7GOJPPC0tbM5v6qdPP
	 N2GOxWzXjIesNZIdh4BEnDZRrllg8T8DIyr5G6TIhE+IuvvaPo4nSjxJUiT0ZqQNZ8
	 BG1lKixb8MlkqZgL/JqpzD64vyoELj8omM92efVc=
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Subject: [PATCH 2/2] MAINTAINERS: Fix file pattern for ARM/APPLE MACHINE SOUND DRIVERS
Date: Thu,  1 Sep 2022 13:34:15 +0200
Message-Id: <20220901113415.27449-2-povik+lin@cutebit.org>
In-Reply-To: <20220901113415.27449-1-povik+lin@cutebit.org>
References: <20220901113415.27449-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is what was meant of course.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f91a6b62f2f..895e8ace80dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1905,7 +1905,7 @@ L:	asahi@lists.linux.dev
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/apple,*
-F:	drivers/sound/apple/*
+F:	sound/soc/apple/*
 
 ARM/ARTPEC MACHINE SUPPORT
 M:	Jesper Nilsson <jesper.nilsson@axis.com>
-- 
2.33.0

