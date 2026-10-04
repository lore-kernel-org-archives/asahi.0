Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248C740756E
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791093977; cv=none; b=Q/DUPv0ccR1qr65kbQCmSjt2KBT6DjFECQ+nUecB8ZuOcc2pCXWkdrafwn0EZ+Ce2IOPbb+W4jrXP+ox1qaxrS8j2tku9uyLTWUFLeX3dGktCKhabnDnuz+48kw8y0sqMQx/ewUIP+jNrcfNy9vc8jO+922JaMTf5dPNJPO9hRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791093977; c=relaxed/simple;
	bh=xSEWuiivvLImBm73BetJSsdcZ+ZyPP0PeM5RNvPqaaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XLbUPMbvo0aVQoK4Dl94WDMIjrcBGGk2p8YSNwxcJlZ2FdY89VSp1qvhRr57oZrcE5NETv5w/Ca8OoCJ0TkHTNGM8IqPh116ofiyXGvZQUHSC9bgVAmRi7YMUCEquWo1+lAciXRAVm/vRElwLMqgRKMslhtqyyRiHc9XVklxeN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0/8Bd/3; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0/8Bd/3"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4c276e1c7so262260a91.0
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093975; x=1791698775; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EzOACeBa4mYeUDCoCQIwuHgYdi0Q1ADawlRRSYPiTaA=;
        b=Q0/8Bd/3h9gupL+EnLPmV8JI1pPdxeZTgng8Oh/yefFkm4x9qqgWUZ3Vt5gZYvs5hk
         3eTMpY0Od/pDAbBLRxSPsma+d9thJQX6rriPxIkdHUn7Phm0trU9EzlhJ83o/gpfwkvP
         p2bXmdc1QeuVgrX7OM91cHKz/mCv10MzaR8rxK1AFuzrIHTFa3/5VbLyVpyvRFIEk9D1
         R2ls/vDVWh792xxtqclKPkAi5ZHiYr6y4XqFSmzZtH3zg5nGQYTOPOrRRkSeA1c1P91B
         xwmtNnrD9o8TaiTt/1aea5XS8m6C18MUU4XGm4IDJYL5+CtCPXnuSkVFTUNSGg/DwvnL
         NuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093975; x=1791698775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EzOACeBa4mYeUDCoCQIwuHgYdi0Q1ADawlRRSYPiTaA=;
        b=ZHSll9LpSS7+Lv+NBYUeOnA5gwFLLxLCRQel84dgqXY8zfLYbsFPNqGcaGjv2g5YxR
         7tQDoPsFsoZFzvFqmeyTJivjCR9fCvjwSgTLv7jnZKIWpvMy83gjmqXDlZ6rV1f5hL3S
         Yb4MjMrxbFxqqrt7cbus+RCgCK/KdYrvPvcI48R9yheIIL4wSnf+OScFVac3ahcE/6Pt
         n98/5Y0XMFiuiWvN60fWd05DrSBL7SdAU9U+CmN+V0ZJl8OIgbhdBNnuhkU4AV0OMjv8
         My5nld1CtxDPvYp6W1Apswcn7XL6Dai4RJrVeUGwHFf5b1kzxnhwMus8ZKzMOjPyavxU
         6S9Q==
X-Gm-Message-State: AFq9FYI2y9pTaB2BnqaeKxTtxYL5Ori80IYLSscAW6E+v46iwpfzOfQ6
	svMHpQ+uGfWb5bkKTZvtswTaFSaA47gipkdi/jPUKogcUn3P8+/TTpEA
X-Gm-Gg: AYBFou2vkAM99zJX/X84TLbGVEL4f0ngKZZwGgRM9ouCK96JEGOXL6Gx5QpTrwWp1z/
	WF2svPGhUUd01qfdw/nG+/zdi5NLiiO5piTwcdNbo/ILLh5nmCDjeeY9CvhnKciUUYbPp0Ob7UD
	RzNPudfOH+Vb9AOCkm/yiHtOPoOJcqyz3Ijc/vD656BgyIBve9EAAXRPhERGmCtWkbpaetyOBjy
	kxlbQTKzYyrPa8vJv7iM62nAsqJU3NzCpX10h0gxF26QPTt31hFoovGei5KGy3YCJC7oNyhprpD
	eAM9kPXdfWoYTHuFO9/Q7IkV9q4nxWiAUQwSgA6rVVzwHgJTPJHSMhOuXTHMubGwpA9Yo0h3/zF
	Mb+7zY+PPrR03hVxzyEAAVnadc0u7ZpOfsxm9aW0utGHRU9G9prt2mn22Iac8wEEeOHDmL3K/m0
	+DWN/L0lSVhbcGRWakvPw073J8eMUTgocRyYem59uuzR23EXLHZwTFW7X8df0dGV1GliqsKoL8g
	rPz6thtx49al9dNoYDNBmlvJkeOrCOt5eeaOnsVqLorvwHTwPzlNfbKu31/BUlRVM8UsEJ4x1GJ
	ZLrwHuxFOzr9eIcM+KaB7FuxsL9sjo7RQnWvI9Q/Iw3OTU8=
X-Received: by 2002:a17:90b:17ca:b0:3a7:ef4:164b with SMTP id 98e67ed59e1d1-3a70ef41b96mr1617600a91.2.1791093975353;
        Sat, 03 Oct 2026 23:06:15 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:40 +1000
Subject: [PATCH v2 13/21] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-13-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=xSEWuiivvLImBm73BetJSsdcZ+ZyPP0PeM5RNvPqaaw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+Q5LFjL3RtSMiU/o6jw7r5DE+WVkp1unFFRPeVzz
 tbsxi7FjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFSLRjEy/P6odGs570MmjXX1dZrfd/o9K659JXrLfrv0x2mTor4trWb4p9l83uF
 9lXVt+ubJZZkaTmalMmuOTnc/9ipA8vL/3a+YuQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 38 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 38 +++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..1fc74ebf9ab2 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,41 @@ &pcie0_dart_1 {
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
+		compatible = "apple,j456-macaudio";
+		model = "iMac J456";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@1 {
+			reg = <1>;
+
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
index ebddde75455c..d8ea6bb53b3f 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,41 @@ ethernet0: ethernet@0,0 {
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
+		compatible = "apple,j457-macaudio";
+		model = "iMac J457";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@1 {
+			reg = <1>;
+
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

