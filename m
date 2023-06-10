Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A54256A
	for <asahi@lists.linux.dev>; Sat, 10 Jun 2023 13:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B0D5C433EF;
	Sat, 10 Jun 2023 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405403;
	bh=vxEDe8vjA8z9d57igjoloqO/L6WkCJvO5JdUOQEYABA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GdXJd+TNviiSJPPiFdgTRquF2ouG+VIXLj7UO6kytuBkv5JMa+p4aBJr8alATO9p1
	 h4YU7fghhPexiER7NYFwuVThiP3rXETC569cZfolCz7jTi1z1gRG9Zi7wxFOGr43zH
	 MDBcsfkHgByCZSgaBYf2lsGh7YdEdhtOzA65fIlLuhnAYcr7R/EmQkvDO6fk9lBUK2
	 Hn02tLrzCZgvWhQ6L4CstsYz0WFEPPmTRTXeKPBljf+d28B/a9HetFQcuUa9JtMlzK
	 JnBYUWdxeZnWdqlCmQziRjDR7pvMcs8ws40Q541Ek6HaSL5hGjK1KNlcj1Et5AlvMo
	 pp1qmtNMTkgXw==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 10 Jun 2023 14:56:24 +0100
Subject: [PATCH 04/10] ASoC: cs35l35: Use maple tree register cache
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230609-asoc-cirrus-maple-v1-4-b806c4cbd1d4@kernel.org>
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
 h=from:subject:message-id; bh=vxEDe8vjA8z9d57igjoloqO/L6WkCJvO5JdUOQEYABA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIEK+vfo/XsH5hugthRpqLJrnD2o7Fk3Jx0zTw60
 KnEr3E+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBCgAKCRAk1otyXVSH0NTBB/
 9iawD+VC3SoCsctAuzus8RqWXNm7LMUPsq39Zvc30xrCj6uuQVuJ7x2T/q8V+EhByTpM+W/0rk0bR2
 YCyldWk//RIh0qUh+P9xsvCtdIaSRfxytKe8vHm+4M3P6P8838Fs0UYpoxBRmZxrUJGmhq/XRPlnZ8
 ArD+HFfx1v5JdJXCRv+/8DvPIY0DnAtWxSo4ZPDnfr6MZAsupxuAtYg7tkD4+hNYWSMjaDHGr8+/uc
 ii8FkvoyVkrgZFWzSr/OwYV8spiBYSmN+3zknPkwIZbRNh+pr+2iRJoE3XDieYdogZ2xtUI19BF3aW
 77D+Hqq36BTPGBmL9TUznsMxXTOj9S
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The cs35l35 can only support single register read and write operations
so does not benefit from block writes. This means it gets no benefit from
using the rbtree register cache over the maple tree register cache so
convert it to use maple trees instead, it is more modern.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l35.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 947a440a3a47..d37a49b372ff 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -1099,7 +1099,7 @@ static struct regmap_config cs35l35_regmap = {
 	.volatile_reg = cs35l35_volatile_register,
 	.readable_reg = cs35l35_readable_register,
 	.precious_reg = cs35l35_precious_register,
-	.cache_type = REGCACHE_RBTREE,
+	.cache_type = REGCACHE_MAPLE,
 	.use_single_read = true,
 	.use_single_write = true,
 };

-- 
2.30.2

