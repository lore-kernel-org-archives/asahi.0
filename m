Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C2A629
	for <asahi@lists.linux.dev>; Thu, 11 May 2023 15:06:26 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1683817578; bh=Y2qYN0nC7/bpDhI5lh52Gv/GBqFV2U6L49sbpArIaKo=;
	h=From:To:Cc:Subject:Date;
	b=P1x6Sq/QWXxyw/DQe9YPNPoSdkxp3gNAje5YsQTKJK9YuvGSmHpH0+pTQjyPwBcV7
	 3iRYrof6f6FX/iaZDzYnPn4/p+ZxTf9AoP/8z8g+7eZoOvsAwMAfjY7v7wOWioZdjO
	 hTNAFj7t82mKLHdogP3SWd2BwouMsyK/RxIUBzEk=
To: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] ASoC SSM3515 codec driver
Date: Thu, 11 May 2023 17:05:44 +0200
Message-Id: <20230511150546.8499-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Analog Devices SSM3515 is a simple speaker amp that Apple is
using in their 2021 iMacs, possibly elsewhere. This is a v2
of an ASoC driver for those, to be used with upcoming ASoC
support (in upstream kernels anyway) of those platforms.

Martin

Changes since v1:
https://lore.kernel.org/asahi/0fcc4617-e706-8743-e65d-1ff99f38ddac@linaro.org/T/#t
 - drop 'adi,ana-gain' from the binding
 - move device reset to bus probe
 - fix schema copyright, other schema tweaks

Martin Povišer (2):
  ASoC: dt-bindings: Add adi,ssm3515 amp schema
  ASoC: ssm3515: Add new amp driver

 .../bindings/sound/adi,ssm3515.yaml           |  49 ++
 MAINTAINERS                                   |   2 +
 sound/soc/codecs/Kconfig                      |   6 +
 sound/soc/codecs/Makefile                     |   2 +
 sound/soc/codecs/ssm3515.c                    | 448 ++++++++++++++++++
 5 files changed, 507 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/adi,ssm3515.yaml
 create mode 100644 sound/soc/codecs/ssm3515.c

-- 
2.38.3

