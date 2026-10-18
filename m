Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F68414A1F
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302999; cv=none; b=kcNdIPyTvhN9nTsD+kbT3qW1pxD4l54AwdqmiabK6yABDCCC5C9ktZ+5dA2SdiPPUD6AFLwuI2vaavJEhTd+M40zAbFjTIom9pWIbAKDPN1f+nmNKFniIJttTotkxVKcf2Rhyftdng9qF//9Ap0soL2TzRsAGQNpLkSKQaUs/9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302999; c=relaxed/simple;
	bh=zDYarNXpwu0fUg9Z/Q5DjYa8aciZr7oQNJE40M6audE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y+NBIVDDLyb6BrHAPQ0tg8sJVojhtDHP5jdJVYvzH1JB43eDzBmOYBYYUOZ4wAhyy2nUOMFY6JRgfsFRow2T5sLFUw9fYWF10ZL1E7NCgQAuU3xPpQfvsDDYLuv9bH+hUFaoQpQLQ4zoSjFAr0wfKelJ3G2qlaqkdgRy0QtBNyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JQsDVLR4; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JQsDVLR4"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1099036a91.3
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302998; x=1792907798; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pR7Mez/DUqjnbbfCLoSWMUQ3S2o+0i7McD9nYO6h91E=;
        b=JQsDVLR4im3cMDkv0zVKZ8KIDm+grjieegnhCVWqazSf+3XIjsqOkOQZcO2OPc23Bi
         W1fXYNiKrh1TIhxNjowYVmTDqE/2mfZzeb1fA6YN5oGWGgxOnEQTGyJJe0qB/X5PCT5E
         RjAjEc1uIpz8hOLB4Bv8RHaED0aWzYbqd9vF9wqLH3QDmoudUYnJ2SQe1J3RuOpAlXRR
         Xe99vECjh1l+CTzAvtSK3i0h8rr1dLJfrN6bSC/jxm2bNJ0Yl/wNPhu70ZexSXcr8Wf1
         VGzPaeR2DYKjoONJk2XZfYHQbphtp3OxQaObJoGQACgUHtQOCzi6oBLGVcQuPR+gi3Kh
         8taQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302998; x=1792907798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pR7Mez/DUqjnbbfCLoSWMUQ3S2o+0i7McD9nYO6h91E=;
        b=g+nTBjsMsiBmtNG2Yxv3p4dcTNmXYOEq4XZ3/fYLednSDBJ7b02TosjdWNMENe6IvC
         IKiqxI1AzOIMBb1WE4DM+BM29Jc0rTOOzMW0Ut+wONWL+InGBKkcCdAUVbBFKmZUy0BX
         HtNh6Z+5urtt/aOM8DKFWvLaBWzFdqL1h65KVqHOGLZ6p3UJH5W0+Pv+GtQu/IBGlsvs
         6Wcs7hHaPRGla7CUxh9TAFZzkdYHnmOsAYI/jwfGw5GvAQdDZaECse7QXJuzSo4dM49R
         foQZQGpTtSsG49iTJXsMbPMFsbW04D7HkvI/ds4mT++sd0dMz/oYoCAeOco0cpcWRAnt
         AXlw==
X-Gm-Message-State: AFq9FYJBsBlKo9l7E0lNy2N/tB1OXpE5mWhgL0d8pFK++ttDFF51Pads
	E2kz1/ptr5zFcoqImfBvWvJZHXs3QWp9VIJKHAvWgRawR+BTjml8j/DC
X-Gm-Gg: AYBFou04iha44vTEaSWBb1aV8halKRC8j6cmj3AkJhlSY8iQ4VN2IkeZIBuxVYaqkZN
	GPYV0NOoiEf+K2coFpqTuELulsV31HR/RbsIYfjmvGKjOMyWRVFDTTkxlsdVh5T5tNASe/WKOSP
	WGw+7BPNxDrwhtZdm5YItBLImfJr5RhmR+jHXz1d00w5Y+LmInizAoI31ky5s2aT2ZzFma4Q/A0
	p8WviI8zsG5Ajl7bLEYfoC+2IQePVwQuKm/7p5ehwurHMBKLrvmYTzJQNLb4weT5iZbbIS83aC9
	69BVE41oYAGVgSnUwYjeq2XyzP258cf/9bwfmkfivZC+cunKMFOwipgYib5e+TIEVqTuQtGYfP8
	Kfvd9hjy+XZ6sbX9w404mPba9rIZkR2At7l+mfyPbxZTKRX/BzDb9+kMfSjcmqhpZ85MSe3t3WZ
	kf2oRvvmJWMyKF8m8hTa9WlMBMKL8O9rO2SPVsGF7ZVIgp4lDAjIWekXq0k1YCtgyAldPCKhy+a
	AyfvDLWbNKU3wzOdDPRuan8OXfirr29J37gnRpMe82AxlikoFIMBAVWJWPI5ZC3ryl43PdMGWJF
	nUM0sE80HPKT0rlDO7h+O3wSVtIXLJb6vkS1z+kJ5XMGrkc=
X-Received: by 2002:a17:90b:2701:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3acef11c1b5mr3627242a91.60.1792302998052;
        Sat, 17 Oct 2026 22:56:38 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:07 +1000
Subject: [PATCH v3 13/21] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-13-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2850;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=zDYarNXpwu0fUg9Z/Q5DjYa8aciZr7oQNJE40M6audE=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nl7jjpbrPtfq/B2r8mC0i2v87d9qLkfoL1488r+7
 rk28cW8HRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKlu5Gf4p9x7XHTL5v7PhRMnxF01lBF4q3B0R8kZNlO+RrZ5irn5cxkZjlYts+l
 3+W1fKeeq+m6vnGKG0iGW7KC/y1+wzt+7UPUFEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 43 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 43 +++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..91da90b37089 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -88,3 +88,46 @@ &pcie0_dart_1 {
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
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
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
index ebddde75455c..3e8d7648b3ac 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -69,3 +69,46 @@ ethernet0: ethernet@0,0 {
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
+		VA-supply = <&jack_va_reg>;
+		VP-supply = <&jack_vp_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j457-macaudio", "apple,j456-macaudio";
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
2.56.0

