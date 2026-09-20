Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F893D0934
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880293; cv=none; b=qGdOLplJy1SXjtPeU06mWPtL2wzSqTAJVuQqSbYtlrOvZsbyZpMx4yz1lQbThtABuBL9KWO30Q/iD5A9eB/jjK0olRxKj99dgv5D+VFZ7Wp4EkULtRUDRmFp3INciUufvyCOrmBG6zvU40dGiYaJ0zBe5Wd8+4Fg7Q4UpusrcHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880293; c=relaxed/simple;
	bh=smG/fh+zvKf45VDf3t0AAqeGFxv2Guj0oJz9KpBdYKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cWCDntQQWCyaCgzoGJX2ckGSNQDKhbQEpGvyi98toMeSdLaXbGJQBd+0mXYs2GZrqAJ5v/ToayQmWiw5JYAArXeOPuF+M5r7gSkt3CEM6VpEXBTm3H3VbM4V4ktAm0G0P9+IZg7a0SMImJSfcbXLFjfLY9VDw64+u2ESFwX3DVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAYRicB3; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAYRicB3"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df38376150so1168255ad.0
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880292; x=1790485092; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0g4srKdHMimAxZHAyfKwZ3cY0lFOq9OA24YFEe5Fn4=;
        b=KAYRicB3nKKzCk/swintVUY1OrcmSSkg8krn8OD/v/4N0IDoUjoo0kN+/cQC1a7I3q
         3pVgt2yUJQXD+EkJ2z6v5/d1D5tAyKD2iIXl/1WMUB67IllAICirSUhr+ZrpLMcJY9KX
         /3r7zorTQ2d/Qet+FNoDJGwX3gkxTAXKg4Zaeyvl3zJMqePLSJaJNEWqtpx/9SnfoWAy
         cOHpihOXdcysxxFxkjqVMqcNyHpYxQ7VdTttWhx79il45WWQeU84AKBy2zvGjuQJ5HCd
         O5J438a1wkiNbLn6i/lnEA8Z8xw018X3En275CFqRjqhWw0siZu1xj6N7Q5z34acONtI
         lyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880292; x=1790485092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0g4srKdHMimAxZHAyfKwZ3cY0lFOq9OA24YFEe5Fn4=;
        b=FteNwZILfK6W9S94rCyd1E3uyjdFq4T8PPA7UX9ajVyzmLWRWE0gNfLVrtQimJkMMO
         6n3+daS8vpZ/z98GnLv3jG+bBBXJLnLgop2licczXyCUQu4ebnm90c/fOsMaWnRVRdHL
         pDiayasKkbBuoBbhKJ3iIsOKawo6hQaQhUXO4M0cdBdDMJ7P1uIfgNjeJu9kAl95Jm4u
         mdeNq/X5i9CSG/E+SWtkt9mi14KgyUv86S6IUpepEGJvgymJskoUXeY4b/YBitNTzr4k
         yKMnwaSjWYT5DCm1alNRd/RsOBw08BsnN92d6HEQTk9LQI788qD5IYV2x8nJHV3lJnwl
         o40A==
X-Gm-Message-State: AFuF++mOqOTiX1NcRFuji7J2pGyKRzJSgjRDt7hE1jbHVrmNHJbjt/iJ
	3wql4KQKYDQvRQwhyfZxQtADBUNDCF5AaDd8lInSckkobjwI30uoHmgp
X-Gm-Gg: AYBFou16WtZhyJDOrPZTbmjavPhsbfT4/RqBYlyFJdPDs9/1+CXxMxRqxI8a2o79tHd
	vCGi2SjzQmG5WK1y5jnePfzZB3DpkZ1lI7T0yFb1A3O8f/jZsYWnyriXpWQQO+4PCEtHhslF9HY
	DPw/P/b4SUGOobfGOHGblmOVpd7GaXl3iQc1R8G3mLLD0oPaf892nJTTuaPD5awV+mX2qKmXwDI
	HVtC6Ppt160Zr05XgI9YjxS0r/C6QYUsL6D/BJj+2zST7AJPC7MAaERO563jgt/7JbuFLYte4fi
	dBZn6+tbzvZoU67pxgBxFvmy7vIALiujeqBBvquuGUpy/CNp0I682FJYbYjDqHeVWoPQtx54eDE
	1tbNMB0+DaSzcQFXcFLay2RNvy1zgzUb99uBX3dBwyGg+arP4t9DBR8+BSPwkKoCiDEepuR9jdk
	gxalteHI+RXuXQvfETFmht9ukymKSeOXIu62GFsJk9WnFlFpSFrYGNGzcoSTtQD6MQrG78Gbin6
	FzrJ3FTeAA+zNm6pAocSx8/TYmugqFIu2iw+PnURsJT/pGASru3cioEd+ACe8nfBzrgoqQUuIrd
	mmkYFk2o3djK1aANGcLLg11kJYz9FSwsLIPLQ6+8chtYbCOB5dELGNoojA==
X-Received: by 2002:a17:903:38c7:b0:2dd:c100:2517 with SMTP id d9443c01a7336-2ddc10025aemr41443735ad.32.1789880292039;
        Sat, 19 Sep 2026 21:58:12 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:58:11 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:59 +1000
Subject: [PATCH 20/28] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-20-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2387;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=smG/fh+zvKf45VDf3t0AAqeGFxv2Guj0oJz9KpBdYKk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr05VuyhvMW7Ds9h3dXNYauaI1fvENjrYLNloXfE7/+
 /9FwcL2joksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFT/msPIsGD6SeetzNUyV32e1hbMDmx9b/3btb5snUCd1rEgJq2buYwMVwW3aDW
 dXZGUEtGZUOsgVbG4d47hzTtOzj7lP3bJzRLjAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 33 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 33 +++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..41ec1398f981 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,36 @@ &pcie0_dart_1 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+&i2c1 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j456-macaudio", "apple,macaudio";
+		model = "iMac J456";
+
+		dai-link@1 {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index ebddde75455c..aa2a08cb22cb 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,36 @@ ethernet0: ethernet@0,0 {
 &pcie0_dart_2 {
 	status = "okay";
 };
+
+&i2c1 {
+	status = "okay";
+
+	jack_codec: codec@48 {
+		compatible = "cirrus,cs42l83";
+		reg = <0x48>;
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j457-macaudio", "apple,macaudio";
+		model = "iMac J457";
+
+		dai-link@1 {
+			link-name = "Headphone Jack";
+
+			codec {
+				sound-dai = <&jack_codec>;
+			};
+
+			cpu {
+				sound-dai = <&mca 2>;
+			};
+		};
+	};
+};

-- 
2.55.0

