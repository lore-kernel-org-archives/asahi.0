Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F4A38C2A7
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093888; cv=none; b=AHeBx1+yuZ1Q0nRbcCe0UVj0wOiy4+D4wHxaeIqTBYDVcF8owgabU/BF47ovD9mOS1RJqDEN/e/xBMvziYyW1R2fotR28jkxAQjM2nNbcrlWI5VOtSMknr3PHgMEoWAZMzFk9WUghTrHYU3f61NClV1zvpDK9NFt/ugEidCFntM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093888; c=relaxed/simple;
	bh=E10vmK5PG6mgO0KcqsmmlCIx40eVwal5DR26FFOqKk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PuhRY7KuYJwIqlCF1acusrdm2pi681XC+GemYfQTbDI4BjoscWeV+l1KB1sB1HMAllsJsMLEyRNw328SjDlLmu9Oi2bKe/wDyUZ6NckD2FniFSO5vK9GHQg09aR/Wu1sLNhJZrqlXqhclFRoRAUqA5kDRSGBqKxrPmYB8oLpcNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ayKh7DQ3; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayKh7DQ3"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso460625a91.2
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093886; x=1791698686; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqB7Ic+9vDUC7rhTpgu3s95TJXJzhsEnL0ALlbbGXbw=;
        b=ayKh7DQ30NEyc0or1AZim5FjNTTxD8EBKBaQW5PxxvDcb4iTmxHNjWla2AOoPZRt9S
         ADMlC/HJczgKi9nF8LPv3+TefPBwYTbsUH1eMgBZpPE2WwP4J9jaV2hJADZbfvGZ+SCK
         FqmDBCdhUDVFRz1QaFhrPBaw/J5te7mZKI/Ute/AbHPPZNPHC1pqzpOuqqhaMMvqlmxt
         4CD3jXk/zoeWhKyoj6RT17LsnAcsAd6AVaQ6CVOXgRuCaFrMPjlb2uoZ2uQD/4KKlVC5
         kzv4DPlafbCqnLqAMiaHwC9Ua7lrGmYrOyd9k1kF5TnopdfwLHJobFtoxo7G40ZDn0gY
         texA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093886; x=1791698686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yqB7Ic+9vDUC7rhTpgu3s95TJXJzhsEnL0ALlbbGXbw=;
        b=EGlJMR3H9QvSFv7AMnyO2XnczWorvhn22dBags9BJwD3NrijGBK/plA/38YR99CMXv
         /fg1hepHcsuj9tgvQWxq88UqIufQRs0dgpvb7ulnIljjYqJG6gcRo3mOkgSnFwyieqCg
         Yyu+7ch2djOqKNAAX1xyG1F9Xg/0dY4MS20iHEVrXjQeHoeuJZz/iPEQ3KZHU8NfdU40
         RvsGmL0qQ+SXu6Fvt5guc1nn/AuFT/2fGuRk22rLFlkXG/nR6pJQ4noKULswI+oi3k0/
         g1QrSQbKnDXE59gbYPxtKw+22YNI8npvCCtrJIyPFjz0YLZVufTJBltfSlOIoiff5dRv
         /IPA==
X-Gm-Message-State: AFq9FYLICU5uRaFy7AdqqPiYfHesPENj/RhuuwSKZ4Yzrr6/vD8aymQV
	rOCsjmQ6SH3Ek6T+DMp2JDDRwfIPW3AB/l2jbAETPwRUaBf+ShFmTjRg
X-Gm-Gg: AYBFou31671H9uVTlXNzlbbmtowg0LCIz+ATFT/XMSuDtG/xzGGCAAdK1rrRT+1EJ5/
	14p4szISfpp6c0aLv8n9EFPdKf5V4LseLET+ErHrwOaR8q28A7cmrAiYijAg+OniaLqg6OVXP6o
	MqzBc5Fwj7eMNuATntODXm3uidRdZ+fu4hpCEBQqAAgWdiELuQsdEPYmrPEsOWOAutNM6KlZ/Dm
	6pxgYBNR5DiyBDkGGHCzPUeUzqwmDABUAeKTgqxlTp0To94G1/mFfM8MaKKPhqZkGYiAjJOOEQQ
	+vP4Y5Z/iZaWZVXxec+sClQUxLJ29dfBzdRypAJu2lUYCjWyWK+HU7rsHdDwvuSJgeaPCuKEc2k
	U8l/wqPTlc1iuPxHXgv1qwIagqgre7+kF2YgJUmdVTdEiu1rfHOChNQflHnRxCjReKD/wmYrNlR
	niUncQkQBuT5Bz+K2fWGygvsO6nNkR7uMSP30XMQ72qnsqwbHyYCyCx89d90taq9B1DK6XopSnU
	1YHruuhGvJe6QGsYp84HLvz5nIavxIq3grWbyzlI7lkG/weCZ5nRnzEiE6p5ta71CZN/ZeGPaeF
	dLmiRA+XC8+Ro0FKcIi/YmgqznyrG5XaEy0Kc6xNJImusHY=
X-Received: by 2002:a17:90b:498e:b0:3a7:9ad9:68e1 with SMTP id 98e67ed59e1d1-3a79ad96bd7mr2514011a91.13.1791093886117;
        Sat, 03 Oct 2026 23:04:46 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:28 +1000
Subject: [PATCH v2 01/21] ASoC: dt-bindings: cs42l84: Document
 sound-name-prefix property
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-1-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=852;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=E10vmK5PG6mgO0KcqsmmlCIx40eVwal5DR26FFOqKk0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+REFZSpCqk53p5UcbNR45vnz18yDNnn95vKJH3b8
 6FvqWZ8x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKo39TL8D5gvGJ4vrVDcqH1N+NnXtIakiRrfQq/kFam4x/B4nZFhY/jvaNzDcCL
 TPdXm/5kfd+NnsHyZa7zjxaz193ly69zsXeSZAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many. Enable this with the common
sound-name-prefix property.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l84.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..2637aa5f4326 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -32,6 +32,9 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix:
+    $ref: component-common.yaml#/properties/sound-name-prefix
+
 required:
   - compatible
   - reg

-- 
2.55.0

