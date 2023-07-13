Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1697C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C51A6C433CA;
	Thu, 13 Jul 2023 00:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207322;
	bh=vPdJg7Afn0wwLfXOBMhM4nmwJbycCVKMF0pEW1NQ59U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SrV8LGP7mns8WGmttezb4g/MpD3W6Lv7QPAKdU3ZwaRqMGUKvYKlb81G3ECS9s6zK
	 xJOImK8wC8fR4ANy3GjPRiNnvaVBJ6F/pacIuOzpQHxBw/Mzv5VBhittMeMlooiONN
	 iOiWUtWFbZhks3KGD40rdTdC7/I5klPUqhU4fAag4zc9AylSP3tRqgCQcrGd/9HgrV
	 crhf7RgQuMxbWoyLzOGv8TW0jSnB4m3hdjsYCiCuCiOcKKlXLP8lwgmZfdUsOZmYva
	 RdmQruvjYTIO8S/nRqOIuMBk3QVbtWhNw5LrN8v0JZi5LLqlycmnSJFcecYkJmHhz4
	 TjsFYlx2wv1UA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:37 +0100
Subject: [PATCH 24/48] ASoC: wm8750: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-24-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vPdJg7Afn0wwLfXOBMhM4nmwJbycCVKMF0pEW1NQ59U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0G+QQyJXHifqhSyTTTLDek8jgzEwhXonp3+y
 4vqNf+Trw2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BvgAKCRAk1otyXVSH
 0FXnB/956q+NOneUZ/O25iIMPDPQ/u8Cfdj1HQtOt9DkEUe75m/Uiut7qQ9gpV6yxIZ60XvpTL0
 Y9xjf3ybRf+DQ+lnctdC9h++fGYd7vnkrzFLouTs5zA5kb1unwX+wAGVQGCvXn67EwqPDoQdE/S
 2Eh7xawVNM0xU1G6se6FHiKxc24QNzDELjVuW2dhTQ6eoq7PX8+HN88W+NN+kUuFn3VMFM4+pgb
 oMS8WmQNL4C5QQGIdVVvW9WCt5wv6e9EscRwQ0vOc6ty7w0im1azPUKHUXitt7ao/dMvZo5+IEO
 eAGjNxyREHRj95qPbrDodaXeYrE5N0DdedcR8Y8msquNXqpF
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8750 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8750.c b/sound/soc/codecs/wm8750.c
index 20dc9ff9fea9..2d2feaf95e49 100644
--- a/sound/soc/codecs/wm8750.c
+++ b/sound/soc/codecs/wm8750.c
@@ -735,7 +735,7 @@ static const struct regmap_config wm8750_regmap = {
 
 	.reg_defaults = wm8750_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8750_reg_defaults),
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 #if defined(CONFIG_SPI_MASTER)

-- 
2.39.2

