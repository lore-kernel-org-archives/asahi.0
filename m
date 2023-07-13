Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127C9366
	for <asahi@lists.linux.dev>; Thu, 13 Jul 2023 00:14:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7789CC433C8;
	Thu, 13 Jul 2023 00:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689207278;
	bh=QadRCauUHc3luCjo1nsfoeYTP1Ic9HjyB1JlffjTMmI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qakehfucf6g65K6T9I6399OdBbxKnyrjcNC+rrPCudTB37/k45hbLQlLKwczwhENX
	 k/abj/DU8Qm5t3nadnKbNw22Ao+bdII69gIpoGyRn/drgQog9dCYgyybxLVcBRBreK
	 25eVQ9was9fWzBxGq2ig3tPZOAmNwKV6E8ny/QrbYGOYwU5qxtBWkAmREuC1osVVbo
	 ZOlmB9oxmYdrckfKTRXmTg1WM3HkPdaD4dTmxf/1bCDCWoNgyOqR4+oHXlvINYPft8
	 lec+RQJcL6hVdIzNKbz8dNqaUOiqrpy/8usuWqip8DY1AmL/kFEmKjrIiPXTIRN9Os
	 u98SR/fSBAngg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 13 Jul 2023 01:13:22 +0100
Subject: [PATCH 09/48] ASoC: cs42l56: Update to use maple tree register
 cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230713-asoc-cirrus-maple-v1-9-a62651831735@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QadRCauUHc3luCjo1nsfoeYTP1Ic9HjyB1JlffjTMmI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkr0GzW8o4fQ0QlgmF3NDt8zfFx2A0EEOPSj96M
 y6FNaPf2kKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK9BswAKCRAk1otyXVSH
 0HbKB/4urZQGWznkNFSST1RUI3j/WUdl9oUkYrbBN54Meapd9UJJDyQpRpDb9wYn09JkBcOlWpn
 uWCqPjctzJp6f9BFZAPHoBHfUA5B9YWpHeF0C0HKJZ1y4czwH6xQfjnt+7/jcg9DOXQ1OteAs6X
 1EBE4JuQ9W9TyTGZ871wJ+8D3RsYLTGI8w54q9TPd0KVFViODJ9ZLZmP/yfd+oIEVflXfPqtNzN
 J+l4XlnA4ANBVs4gYtGOtBNme62tyHGLlUW6r/CWjOdBs9wHhpA5p8P2I4kafWCyG1gIzdlDVLT
 Nb5uHCv83AyCyyvq54dJjVWNF72rm94szneS6xKVWBmpr5gP
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The maple tree register cache is based on a much more modern data structure
than the rbtree cache and makes optimisation choices which are probably
more appropriate for modern systems than those made by the rbtree cache. In
v6.5 it has also acquired the ability to generate multi-register writes in
sync operations, bringing performance up to parity with the rbtree cache
there.

Update the cs42l56 driver to use the more modern data structure.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs42l56.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 4c646e8d72aa..1714857594fb 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1125,7 +1125,7 @@ static const struct regmap_config cs42l56_regmap = {
 	.num_reg_defaults = ARRAY_SIZE(cs42l56_reg_defaults),
 	.readable_reg = cs42l56_readable_register,
 	.volatile_reg = cs42l56_volatile_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 };
 
 static int cs42l56_handle_of_data(struct i2c_client *i2c_client,

-- 
2.39.2

