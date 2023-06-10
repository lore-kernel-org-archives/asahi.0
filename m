Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4036256A
	for <asahi@lists.linux.dev>; Sat, 10 Jun 2023 13:56:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530DDC433D2;
	Sat, 10 Jun 2023 13:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686405394;
	bh=UG2rKCfC964beAu9TOf+OSf0dqOcmIpUi4KlU4n7tzY=;
	h=From:Subject:Date:To:Cc:From;
	b=dBc0gG0T+QkRi+Wgiji4l2/NCAcXLc3pphFLE8TrCDL6Oe4SZldnmjxggqL2mLS0f
	 L2VnFCrle+ZpyHqqzh3tZiHPyFqgpiLqC52A6y8yYPVWm9fG2XS+KtOX4YHd8fQIat
	 tZf2v19b5iD4I5mtK3pEMiZmO/zMaWgQUHIJbxY5srLVk1xcizK0gROIzYc2wwzF36
	 2Ca1PsQr13vTZInVU7Hzrjb0RxPppdhKWznAh2QyCjzvkdexf9EV2vFBxoTNpD+TaH
	 ZS+lWAU7h7n920h8BpbHXxXPtpeEpT7ja70N8hpMwmnS4fcPvfmOTUdLM/scj2WGf/
	 gRjHtaS0wpcJQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 00/10] ASoC: Use maple tree for Cirrus Logic devices
Date: Sat, 10 Jun 2023 14:56:20 +0100
Message-Id: <20230609-asoc-cirrus-maple-v1-0-b806c4cbd1d4@kernel.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAASBhGQC/x2NQQrCQAwAv1JyNrBbUapfEQ/ZNLVB3S0JVaH07
 916nIFhFnAxFYdrs4DJR11LrhAPDfBI+SGofWVoQ3sM53BB8sLIajY7vml6CQZKFIcTxy51ULt
 ELpiMMo97+S323PVkMujvv7rd13UD1AvgPHoAAAA=
To: James Schulman <james.schulman@cirrus.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, 
 asahi@lists.linux.dev, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-bfdf5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UG2rKCfC964beAu9TOf+OSf0dqOcmIpUi4KlU4n7tzY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkhIEHj+4TLG2yyEP0M+n95zP3xIPy51GYkdlR7IMN
 hy+3EvuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZISBBwAKCRAk1otyXVSH0CQRB/
 44S+F1oNn8EmEUbQidbURM8bsPqkGj/vOykt4uQlq0+Ey1P8IMqwF8YTQQD9Hq/nzqOWmVFskHkeZl
 6rqWXZ+NWNh4/xCfasCf/2PKl9zoIsoGV1tnULxLJ4m5HeIIlLyTZTIuLv4ya2YNuIbJw4hAEdIFNn
 XHgljEBIzAOwoe6lzPaXbtM5Em7AlCfwCL/nxsX1doj1iLrVfG492H3lvotrebyFCEpwozBThs9UcK
 viH3mVbfcJ1p7YfrKbvu3ipiNIZZo/c/NYzWpEsPviTmSQuGgeYYph3clLt6d4PBXZkLY0GPBy2Cpv
 R4fIBsvBsEP8qUopOvGM1h63/FS5z8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

A lot of the Cirrus Logic devices only support single register
read/write operations so they get no benefit from using the rbtree cache
over the more modern maple tree cache, convert them to use maple tree.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Mark Brown (10):
      ASoC: cs35l32: Use maple tree register cache
      ASoC: cs35l33: Use maple tree register cache
      ASoC: cs35l34: Use maple tree register cache
      ASoC: cs35l35: Use maple tree register cache
      ASoC: cs4234: Use maple tree register cache
      ASoC: cs42l42: Use maple tree register cache
      ASoC: cs42l73: Use maple tree register cache
      ASoC: cs42l83: Use maple tree register cache
      ASoC: cs43130: Use maple tree register cache
      ASoC: cs35l30: Use maple tree register cache

 sound/soc/codecs/cs35l32.c     | 2 +-
 sound/soc/codecs/cs35l33.c     | 2 +-
 sound/soc/codecs/cs35l34.c     | 2 +-
 sound/soc/codecs/cs35l35.c     | 2 +-
 sound/soc/codecs/cs4234.c      | 2 +-
 sound/soc/codecs/cs42l42.c     | 2 +-
 sound/soc/codecs/cs42l73.c     | 2 +-
 sound/soc/codecs/cs42l83-i2c.c | 2 +-
 sound/soc/codecs/cs43130.c     | 2 +-
 sound/soc/codecs/cs53l30.c     | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)
---
base-commit: 9561de3a55bed6bdd44a12820ba81ec416e705a7
change-id: 20230609-asoc-cirrus-maple-0aba1f5c18b8

Best regards,
-- 
Mark Brown <broonie@kernel.org>

