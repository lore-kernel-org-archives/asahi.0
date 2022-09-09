Received: from hutie.ust.cz (hutie.ust.cz [185.8.165.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC11468F
	for <asahi@lists.linux.dev>; Fri,  9 Sep 2022 13:54:44 +0000 (UTC)
From: =?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cutebit.org; s=mail;
	t=1662731676; bh=RhujQszCFjH/lcZWXH4eE9kY3fQOLqlqGu90avC90og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AspLowrtWazyTIyixPXUyQdLkaGQsRtW2xtpYRKur86i9Ozkf/acHmZEuS1LteOdR
	 oRx8KNq5KgtXq8lTR77+MrCCm9clkRStATArr8yYuiYj7KLP67bazBJxaJrFCjjnQm
	 5I0riq2n3tg+25E7XDYfbo4eVLu0lODgxKtyd/58=
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Lucas Tanure <tanureal@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Matt Flax <flatmax@flatmax.com>,
	- <patches@opensource.cirrus.com>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: [PATCH 01/10] ASoC: dt-bindings: cs42l42: Add 'cs42l83' compatible
Date: Fri,  9 Sep 2022 15:53:25 +0200
Message-Id: <20220909135334.98220-2-povik+lin@cutebit.org>
In-Reply-To: <20220909135334.98220-1-povik+lin@cutebit.org>
References: <20220909135334.98220-1-povik+lin@cutebit.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

CS42L83 is a publicly undocumented part found in Apple machines, similar
(almost identical) to CS42L42. Share the binding schema of CS42L42 for it.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index 31800f70e9d9..7356084a2ca2 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -19,6 +19,7 @@ properties:
   compatible:
     enum:
       - cirrus,cs42l42
+      - cirrus,cs42l83
 
   reg:
     description:
-- 
2.33.0

