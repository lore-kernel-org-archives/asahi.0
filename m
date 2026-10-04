Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58527175A6B
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093910; cv=none; b=BhggG46NI7eEC3PM7ifRQBKAHo+fxu4RGCWDy/NGMhkCq5KH4xIKBiycaK0kXw37+kwAEH2CLvlMm+mkFx6Ma9R4Mx//PVAxlO86CfmRJil0iAzGpY/31/FL+iPa7otunHtaueXlw0Ep8NmWYgjyQZ4SoodgetFSiso0AHbO8+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093910; c=relaxed/simple;
	bh=Cx0fL2VvnwLsqHLvmS8INkeZRK4JUpqpc1FDp9KDOfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sf7iz12U9aag7IR8bYTdU0jHcnK2zbH9GJwpu+iwx/FQ8yzn/4jKlRSele9z5QivIQkrXckD4NWYL9qUiJTE9V7JxPQwp5oky1R9qzogOzpNP+/Yp3vKiK0r3/bsy5hXJMgBCpIkQ7LuPW7hksz+D0sBAqhJem9xUs5K+6ySLrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Evp0byWh; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Evp0byWh"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc79a5bdf9fso151620a12.1
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093908; x=1791698708; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqmOLIl36qQETjuB7PbP+3Wg/tYuEHw7Jvc1sfwFByk=;
        b=Evp0byWhRPrNugRXbICoTbsg901c82Qa0fXqzUAjxGNEy2Zr0foMGRgwS3HAAVTm4l
         Y+SkRPNt8yjqEqZbZbwGJ8hPUBvmhFetL+KbNB3KJpVG3uEfViwoMcnm2/l7laSHqzSQ
         H7iQua7GJFm64DJY5QpX/9gvA9PleuXT/zHpSkliemtmdvU61tIOqViS3Ri6MZJAeWxn
         nAmWBh8Q9hhcWvnUR2mXLy4tJnAxHlAhrd+EElsBEdlPPsHXR7Y6dY+SBdwCnAjewCYs
         JTN3F6IkA8xPtH8q1Dcu88F8u9mHd2ziM794HXuLEH7Ei2tODU8cGuHmbE7Peu7eDkqK
         HX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093908; x=1791698708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqmOLIl36qQETjuB7PbP+3Wg/tYuEHw7Jvc1sfwFByk=;
        b=lNi+yhQYn5bAmWwI3DPxM6eVJXvsDBfjaEyOyfLwHkablLmPnqjs+hamw22wTFXttN
         UbEltd4SUOkmKH8tjhT5w88ISjd+P72yRRRZnVgSY+okQ217bEyX1dtVk54fVkJxYK68
         3Rt0GxosDBDDVBP5SqHKAwSB87zlV2uIew0rv8Bi4279PUjZSkJ0Drri8WEEykypc00P
         bkEYkBSOKMst9TtnFlNx+T8sPZwa0TLhOBSeakotURw5P6Dq8B7kZ6xpYrGZ1dfjRyS2
         3Eq8IEOCr+3/P6ahFR4mp15PSYTfoUX4zkweTMYUidNoHWAwg8kWXwrp4URcTJSAHaAI
         c3Kg==
X-Gm-Message-State: AFq9FYI6NV2oXF6O/4t/Wj+8zzuoLDLoysoAMkZo3jMMKJvbiMIVxOC2
	qm3v6rfSO65iQYU+cqc3GqnmgJDBSSUlXVwHnQS3c+BtJys/8Q8cvrLh
X-Gm-Gg: AYBFou35ocjxB8Q6MJ+wdUsvNnv+1vL9d+jG3dxgxzQYibCOej1FtIsG6MQmf37mNvS
	m/36qbne6Q9SpFTUjEwK+MNP+0M6HagqHn5uTkCiSbtVlRxCPmr0EK/XvXOTdTqzkJfwEE9pBYh
	rjAgvIqrX03B4qwmGkpI5xQVzi7iCqLeR4pomE/OhLiQMZCeqsgXZsRN7IEOAepCYmaX/sc/4ZP
	6ukto6FwJXfyV0aNb7mI9kOamIbP/8eVsYh3c00bvUieHvNw08YUdWqhxP3KABZcdX0D2NuRXcx
	J4IR3ZDmqRVd6zHUbryvx/olhhUoBmtLxivusQZorAL3iQsmf3S2Mj3Gr74LVlgn4skUX9EqVBT
	T1xoLDjSe79W+IlNMps7juH4QUCSXbbE74+9VwHOmFC/DO90gvNuuUA3ibxOEzLDNlfutCBWSGX
	kEfynYZCFszvaNIF4SFD4sevIVmCUo1UcLKX9pg+sHmNzY05df2Yr156JPkgOaTN8hZQTEPiLea
	rLY0G9xlGYIeACm//IYHb4kM4Wc73Q8eSvx/yYvV0f4rZw0+TTw75EOh69AxljUAYF7KY0km0VE
	I96tBH6kdYY17djF8M4brpMf9NQef3zpVgZF0wMcg3KL210=
X-Received: by 2002:a17:90a:1117:b0:3a6:e9bf:f244 with SMTP id 98e67ed59e1d1-3a6e9bff6c1mr2758728a91.1.1791093908591;
        Sat, 03 Oct 2026 23:05:08 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:05:08 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:31 +1000
Subject: [PATCH v2 04/21] ASoC: dt-bindings: cs42l42: Document
 sound-name-prefix property
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-4-7b47ed6335a8@gmail.com>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
In-Reply-To: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=872;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Cx0fL2VvnwLsqHLvmS8INkeZRK4JUpqpc1FDp9KDOfU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+TMa63lNI19lscfXLmmJedDuMK8VtmvCllnZKIn9
 T9vunipYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNUb7zL8U0p1EZI4bPTtEkvLYlWLwllT1wbqXbuteH7xl8+7ontLkxn+B5/2/bb
 vj4KDQUOSipjXKZlle7gEz9leeFF4cCXrY4eXTAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many. Enable this with the common
sound-name-prefix property.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index bc759eaadeca..035463be1456 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -29,6 +29,9 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix:
+    $ref: component-common.yaml#/properties/sound-name-prefix
+
   VP-supply:
     description:
       VP power supply.

-- 
2.55.0

