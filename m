Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DDB35E1D5
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093903; cv=none; b=g/9ltdsZDn2aiR5ntC+lFQjzQ3EIti144aHXmiBFzdBKlrQDx/mHc+2NzzxmBc7xBKokjuixZjdT2rfiVhbkY59JF9ihPWIncRTa6o0WxI+KLm89+QvsBQwQB9sJvGrKw9pE3OUjGy0djoJf5IK/e+3RnfymuS8on/bB7NTmMj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093903; c=relaxed/simple;
	bh=Tg9Fb0S/kn3WqXmtsngaJ/pCDuNRSXzw1e4JgFn2CV8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AJ9pi6UBXna5l+fgMFpVvfhoR/3/83yA9no8H9lJLOpIpTx/tOPwaY4hMeuwnLYcUENu+wTn6Y+xZSld3yKNCaPSEvwekA0MI9LM15EIaS1rRsQP2kp2OuFU2uwsXJIBBHEdYV51IM4I1nCPMNY5UkMHd7oJ9sukU/H5P5w33zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJYbcXab; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJYbcXab"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a7d7287703so120694a91.2
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093900; x=1791698700; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSCXO5ebFzrbDFffOZrTB5SiL0l0DGtqGmy2MCgq5Cg=;
        b=IJYbcXabjchiCAQM3uXjEOtVzXjKKwLzGVOIDinAKoZnNmnbpdikp5xDQhodOD7spy
         MQm1ciiEZn6DXt3qKoHl2lQ4X74pipEhwaeQdk3f+57Uf2m6MWZpT3a2CuM+1qhu0OcT
         +tXgL05jSwPIrrNMrNFpRvbIwpS1NV6xiJe2FlOZHFmqvOMy4aGM8XhTvHBWV2Zk+zUa
         d/wmlJpze6a3FpAgqCYQRsppmU9MT8f9VazJbeYQPj5QsSqeUcq8QssS9RnZTdrbflL9
         xZ8SPcEy7F7DBcygGFUj3QM4idrQGfiwWVKxx8WEe6jiaX7K72DrUBmKPTzTGxULv6he
         3WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093900; x=1791698700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xSCXO5ebFzrbDFffOZrTB5SiL0l0DGtqGmy2MCgq5Cg=;
        b=T61gPGyOVnPTUMUqdMfn0Z1BhjTo/G11r7Xp9HENnLuksCDYqnS5oKBKjHBJzWia3Q
         dJ33r5I7Dh15xlDvsr5BJSKciUffYImmWRH1TNq3eLM7CKWD/5nf7hgZ6OOSkW2NN1yw
         tx3u09xBWzPa3JGt72nmT87EUbz5lI+QQe/Ew1WuUweB26P8sR4T8GJIngHaWJo1g/UT
         p4gnIJm/2OKBUsJuUJQqPBqKc+wP/BMnpnG/DABT/rHPXCW2n2OdkDJS14fmQYoyNMHo
         Wan7PH0BnVHm8+QJUKNrFHUASwwLYQhl0sGtn2Ig26gFodAV/6B4bElsg8MuRE+Xm+xo
         FBVw==
X-Gm-Message-State: AFq9FYJSK6ZCHQCmW948jd7KvgrM5+vg2h8B0qggdXdEZ6ynsL9dK+s+
	CmQ2+eaIz+SBVhrxKxceVnEt/TAZsw9z02Xbp6jgAkSxqpyL4kFEJMB3JLrTJMNd
X-Gm-Gg: AYBFou2cxleKRiIOGJwpyDduvLde2hUkugdDjDT2lT+28wRXTkjVeb3qjPGlCvtVfZT
	JoCoyI7s0rLTM+ansyUmTv4DejqElMsO8+8L1erpRdR3YWevJ/byNhctgtcoDR3T6T9qRRqoSOr
	Rxs+VlRW+fx3NW4eYrELvOXZDmUzEzDOwxKGDCIcVuaeT2axI7bJr78j9r8baC1AxYOpRde8vp2
	mtK8Nw3HKu1DniOv74Xo7SeORRf9I6+9Vax8w2Y+/6IllbSxzCISLYXoNhenj27SfKXDR3C/xis
	1S9mBsFgL4V6+4T9teaUttoJLFV11DudOX/trkzX5VpiviR3DbToHjRC/kK2teMSt9ld1wB4pbi
	ai5w2N0Qyj8nviZdKp663wdyRbQy4heWdkzBeqI7O+XkfmqpFY/1Mah8Jj2KHEBAGn19MoX+MrB
	j9GCljxwD3vRBmyyDBuop+49yKjLWcTKTgfNV6C4alQMG2N414CaSiFLfpJ0P7AniVZD0OTaAkT
	5y4VvRiYwHKlWavLHYmyQ/UbzyY+xrlkTbup6xzVexKp9FQdvlY7zRSPaBoBK2DDrESw+b+CKBm
	MwMuqOwzx3qzJbuhF9VNeOq74OV2+TKuTRxZUMyAygHePLqi
X-Received: by 2002:a17:90a:c2cc:b0:3a4:e89a:21bf with SMTP id 98e67ed59e1d1-3a7873db396mr2835623a91.39.1791093900190;
        Sat, 03 Oct 2026 23:05:00 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:59 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:30 +1000
Subject: [PATCH v2 03/21] ASoC: dt-bindings: cs42l42: Document
 #sound-dai-cells property
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-3-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=829;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Tg9Fb0S/kn3WqXmtsngaJ/pCDuNRSXzw1e4JgFn2CV8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+RM2Kmkv1uvQWTh/GVrPtZXmXm2312b5qR2vFcma
 s/nKbo9HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKme4MHwh5/zmoP++ubfe22u/Q+uY2q/VPFuA/vh/VM9301VOuK8YRojw9Fnp1N
 arHpenZUxm2ntFt9WGnNK5VwTo6rAozy3h72anAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

We may need to define #sound-dai-cells on some machines where this
codec is part of a simple DAI. Document this property to keep the style
checker happy.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index 6c100cb36699..bc759eaadeca 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -26,6 +26,9 @@ properties:
       The I2C address of the CS42L42.
     maxItems: 1
 
+  '#sound-dai-cells':
+    const: 0
+
   VP-supply:
     description:
       VP power supply.

-- 
2.55.0

