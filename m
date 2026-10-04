Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E2B3F1075
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093895; cv=none; b=i1zHM9tE/MdBfSJ71QTZjPBFHttYDTzH0h1Kms9IOlBMIJWySqqvDiKAvI3VxIpM0hLefmELUPWQF3XV+QJ1vzkUstLMPsptj33XMDrLoro00ovcruBVL/P4WsYQLA+psNwbYWIeNd52Idh+xEFm+4qJhL3qrNrfHhpEv3jWpuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093895; c=relaxed/simple;
	bh=sNwquOknKR60E7qr2ALmDm6xoE+cnxL/XwbQaJrtHA0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dgljwMPhNHRQq8Bek/kDfLmO/MLHLY/c85F1CFiOlmCRN8zcXIjZmggHD4aLZgNKpTPQUKuZb2FulOXbj4juQ/WG6wLmOJj0zgittMVJgQO6bSOfsZ5tTvDSln0oHmW7UfJ3N01IxohtuzSgKaARtgHjWxIMuis6wxYISpg6r1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QmwTlStw; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QmwTlStw"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so458672a91.0
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093893; x=1791698693; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAbS6Ry1BsMnnYJR5/R26PS2NZwQTbS36NknU/TPiuk=;
        b=QmwTlStwE9r8IKs/6oALO1ScL4G8L3EzExlh689+OESgD1gGL5fZ7wv9/tiiPO31Wj
         Xpf9wo9c6/lERCJ2tHeOupdQ7bqqFYtyv1GNvf6vJvoHXoRFMGpzCO3DkkWN+w1zL+AW
         FO9PW6QVbKehYvQrRcGkQE1FwwAQwqWck5jYytS9tpKtEI59aEHnzDDhTmngH2q7INBp
         jEmLHHXV5B4ZfTWHBE51LlRWIfYp3M16a8k7eS72l5i0XFNyPStdWyEnuT3M9xOizSYs
         +RNz2AcRsLXZOHyFP0VlVrTaFncSv8hH2rhK7uv9InZGfeHdi2ZELKYHRPiyHgfaWCtG
         oiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093893; x=1791698693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAbS6Ry1BsMnnYJR5/R26PS2NZwQTbS36NknU/TPiuk=;
        b=H+JBVKLHgTBtL/O2avzzoYB+YKHxitG9YF+MPwr0P+6kKQkO2+R9MHayTcjhMeQvPn
         owZ9D2EOsYsBsuUM+UKwkEyT9xhIBUt7hKcoAb4dJs1hA7mPCqvMiTRcDYk9QERK9qwl
         YaUoct+VSIa9cZVBYgJDC0qcp6U28Iav7vh4QdeNvZncwmWL5pY7+iiv5R7lal5Whdjb
         Xq15UdxWNfs4p85vF1WNsVOAoNWEUQWgxXw7lTgbO408QwJy1vAGMk+URI7yw+LAxMQn
         y9TsAARgWst6d4+3Ff75JfXcey/l3BW0airIkM3udvaHxLWgaZX+zgzOtRCpMjtIETJX
         YsIQ==
X-Gm-Message-State: AFq9FYIax5t15wHIcC+7x01VSiUylYS/dFsZPocHXCBYdD+sq6HRY+a5
	8b1cUyRwLstYXs6P/YBOGgjUTmZ/xPRdytdF/GmiMSvW12ryhYPi2mar
X-Gm-Gg: AYBFou02U1g7MrUbjXkGe+xWx50adk/1tac9kolWOL90suii+8NLDLVE5TCi3QX5re9
	eEZDIez4f1dQq0tI0sH+Te8JDPuKUC/0egv76lY1KdEBEKa5dC0keqMiT9UxEXXAnpWYnNYc2B8
	Z7h+xbYHIqAe2Gn5znw+6g9F4qfJUuYI3lEb34Wprmqwa4c73Sn3EyrqmmiDa6iKBef+u3PAKPb
	XRww00rQ8642cpRMhqy0eA6V4YrsEDzyCaRDtJu22Txs37pMQCBw5DgKOOFUmvqC50QN5nuFG98
	iDUvSwST0fIeHFubSAsD3UUc8fuMDxePalUxodNYiHZSnYHvs81TltByT/gImB0RC9ejovsFz3B
	JoTu2v6TX1cO01AzdWjs1sAIfCTxqPMNusOz4BagWN6Ea1KBj1ASL68urAfoLJmjCNxmg0Jc3NX
	zSSFfd0/4NoFS0U3b724D0hdfM8VWA633FxeCdeA7rWec6tHKQwhxvjXdJPkvfr8dEpPLUrWqfq
	wuXL/G34I62eBhhNNDbYccwl9OG+bffQMxO9pZXmoKSroTHZkoueISaz+xkqqWjf88lvyI6r7Co
	VWtlMqHfqGUNzK+aSnjRrIQzXrlr21CDK41C0PnAZmQOLJM=
X-Received: by 2002:a17:90b:1fce:b0:3a7:f45:5cb4 with SMTP id 98e67ed59e1d1-3a70f4567cfmr3377395a91.26.1791093893061;
        Sat, 03 Oct 2026 23:04:53 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:04:52 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:29 +1000
Subject: [PATCH v2 02/21] ASoC: dt-bindings: cs42l42: Do not require chip
 power supplies
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-2-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=853;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sNwquOknKR60E7qr2ALmDm6xoE+cnxL/XwbQaJrtHA0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Qcf6e/dmXwp77y4Lcv86eFfgvnVs47fDFu24L67
 mtu71cu6JjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1XjFGhhmGhdzFc/juOUVIeuyPiu5Z17TyhPiD4v0ezvfWXI1df5rhf815z4L
 A1HMdWqW/dt0u23Wm2JnNsO/ln7tnspkVu3je8wAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some integrators do not expose the power rails connected to the codec
in a way that can be expressed in the Devicetree. Do not require them
to be specified on such platforms.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..6c100cb36699 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -187,11 +187,6 @@ properties:
 required:
   - compatible
   - reg
-  - VP-supply
-  - VCP-supply
-  - VD_FILT-supply
-  - VL-supply
-  - VA-supply
 
 additionalProperties: false
 

-- 
2.55.0

