Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C16D7C
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476B1C433C7;
	Thu, 13 Jul 2023 00:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207368;
	bh=AMCX6Q0zMFgbz4pwuxj5urRasCu687R+XmoAl/UoZJU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YrSR0Q2HNTk86rIDHTQF8YDjN3n7fbhM07ykdWp92MAYvAhFP4MP4IZEPQtNoSCTB
	 9rVyOXGidwrseA+ZL8uxNRzBuhekJqFZ+jo7vMTYDPPEwo0169929DntnK87+fIKL9
	 +du4T8AC4uqgKHTJLvbN4kxtCcjZ1ymi92urxqQUkGZrlkCNShIq5tHIluCgPGOZ2N
	 R7SrcnMFaITFOcncmO24btxIt6kzNYm6iDyJXO9pyfXuFDFVvNpqwZm+sDrVh1CF0I
	 buIF+djq0LB907vuD481X8cg4ZT+LW9J2n6DVu5C+hJx2lpuYz1lJtHxB/4BQNZdSH
	 X8mWTAxmFY2hw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:53 +0100
Subject: [PATCH 40/48] ASoC: wm8955: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-40-a62651831735@kernel.org>
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
 h=from:subject:message-id; bh=AMCX6Q0zMFgbz4pwuxj5urRasCu687R+XmoAl/UoZJU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0HKVjTndiPZxl1WhqDZ3k+72qfSb0Vx2nLqL
 1zjzNEkNjyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BygAKCRAk1otyXVSH
 0JG/B/4xARkU62FfGGN9FziJaLaMgopAbTX4iLkiAHgdbZ9cJF7Ua74sAocDV9pJvlu60L2ohy4
 WnIthUKsEqNDijUvLQrJIttZlIGhGosOn0fbZQ9u/q8CdxRkzdvXE5MkNzyApSN2uk9vl0MUIy9
 9zUz/HMTDXbHbB7TWF9YHzjz91g9boiAZrMZb+/HCdkarx3YsizBMG223QxFvRQfTC2VRcDaHuO
 zNaa5ytTru6gvHUS7z4W+5805RS5cmPQWTcVfboMWB4+xb5qci5v32jGp1gKvlXmDZxGiTo10cT
 0kbdb9aHC+5grRMtQtPjc3NrMVBsaxQ8bmiLG34P/fQso+rn
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the wm8955 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8955.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8955.c b/sound/soc/codecs/wm8955.c
index 78044f580a67..4f4338326438 100644
--- a/sound/soc/codecs/wm8955.c
+++ b/sound/soc/codecs/wm8955.c
@@ -962,7 +962,7 @@ static const struct regmap_config wm8955_regmap = {
 	.volatile_reg = wm8955_volatile,
 	.writeable_reg = wm8955_writeable,
 
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.reg_defaults = wm8955_reg_defaults,
 	.num_reg_defaults = ARRAY_SIZE(wm8955_reg_defaults),
 };

-- 
2.39.2

