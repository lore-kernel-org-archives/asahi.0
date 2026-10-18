Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DA0430CE6
	for <asahi@lists.linux.dev>; Sun, 18 Oct 2026 05:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302973; cv=none; b=i0mpqU0BmHzYc+Lq1uloUWibnJu0YahJtdmVFpNyHjbpL2rh38STlYb7nUXTAOk1Y6Y+is+BC4IDICG53zazFJoghUNxOHTfUrlaTeB8zIp3Ha61XwaQxICHvH9smRsGy9xb7RFsM9OB7mpGe+dy7PqNfJXtHOwyn0AanaheAD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302973; c=relaxed/simple;
	bh=7YjUxx5cRZKi+klFXhj4dazdV+HixE7bGSBpAbaz/eY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dtQDeDhZ9kaXUA/cYW7EPPw0bL9y4O9YV8pjbSa8jQIgKK6MWmaCWTliQFdaRT9twV7NoTjyHr+025IZ3jYMBVnTAUpMsYg/P7vHp/27XY4nMODQfLNQeyy2zrBag1exFmVXhbnWkBjXAFUravh7nRq/YngAYf0ypq47K5FuxJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wd5sjc8F; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wd5sjc8F"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a0aaa0fd13so1101820a91.2
        for <asahi@lists.linux.dev>; Sat, 17 Oct 2026 22:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302970; x=1792907770; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LrWabHNJwVCKT8rO401JvBzl+Yh/bItuPD7jZ9TyRbU=;
        b=Wd5sjc8FtadxT/Wz4/Wqzu0QaknxxZ80o4TYBEScDDV9vx0gQ23X75mWUYBNlUouPG
         FiRQhiIUiuVRWL4qzSAwFDt9tCX2LfjilkHo84ibhJr/Z6lNCOeuMVCUlta9JhMubY1v
         XB7eIUJDK+hroScbvOAifN8Y/HARGMM9IQmqOnJfn4bVfCCU57tPUb+z+AspXq4DtmU2
         Q4DycPRwiSpHwJB6kkzpJsNsHn0FTEDYnnJAvAVUUyevCbGeAsMgZa6cA9+YEg17LKmP
         vwyff1EYNrDuA20SOxDMyxYBbb5+CyRs/qSxtmwVeTQiM4F6fZkW8pUTAAv6i/LYJQUJ
         cIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302970; x=1792907770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LrWabHNJwVCKT8rO401JvBzl+Yh/bItuPD7jZ9TyRbU=;
        b=wtSU+0iTJj2mHYtyw+eezI5H2aCbyycajOdKS/BCsqI6iYyM4PXhEya/Oai0HH7KU6
         NHHJVq1TDIGuqOW/n9HUIXAwDPKQ955/yYLawXhuNBiu+R6PI2yRvctpEtI82s+Jeihw
         ZiKY8X6i0hYuk9ul17JMTn2KRHnmbRMfQk6P6fXYeOVVGxwIfaPNUssaNzarK9943S6Y
         NKoojBOCe0FmtBsFjykejlltMTXxeZaMJwxv626pIpW9pUS1swvI4FxRiHLfz+jIGcxY
         dGfvS1nrKaHI1pOthECk+uAKnue5gSXQR/nGAexFPayd48DGLVdH5LUpv5X6ay8wwy/d
         qVKA==
X-Gm-Message-State: AFq9FYKn4nMCCGsLgXQrWBEhp7P5CnSTCD5ab8U9qKzRDjUfmJpEyeUR
	XY/ZE5Qkotj8SsILs/VqS05T3PGEqYUBtswVcqCMKORK9t5j/W7scgXd
X-Gm-Gg: AYBFou1miZFhRtq17FLCsmuKudXaC/dOM+goXfWb3yLBP/WpJWhrTrzmT9/25AkAen4
	wh7TApN0lKCV9aCm2a2OzB4by7V0msviV6iWIlcS/6NtOwfMP0Q6ssxpv72B8nJLNNdIamoG0Rx
	DGB/0JrqqDUT2tzx8KoDCso+sVWPOKPBwB4I9D5CfZJyfwGHz/NGeRACyZGbQ1T4aHqNV1A5FIH
	4oFwvo+taggJ3o8qW5zfas1zKjEPm/GRYHCev+/qvgl5D/9tmOK5WvNX2dGnHBQlR5SY17ivJwm
	GHVLLxS8svjfdOi/jVrK1+mWX07fPF1+9tq5zlXhI2G2FbJDzDI9IBXeVnaccchwOFFCubraKJv
	hsau1xCIYnate/7JnGHAtO4KprbJSdsE4+JB4c6ppbGNeS6biBw80I0uoy09ffJrTZFvPjvTGCJ
	kurFT/DIBgmtHmC6rzUPG7kWyXvw76DNrKt7Mx+Qi/DBKJknScpVjAS1xTHLnj7geq9s5t4xrYX
	0tP/dSy397spwK3oWO6NPxisAAN0sdiYixMFRa4UJ6t0Oy0t85FNpvsWx4ATZ1c0IzAaCZ6DfsC
	8t1gh1yWPySfa5kBsXdJAoT1HmwQ06byYeIOcDBBDTCErxAuzmBj27L4
X-Received: by 2002:a17:90a:c10e:b0:3ac:a521:95c with SMTP id 98e67ed59e1d1-3acef10a76emr3948159a91.58.1792302970047;
        Sat, 17 Oct 2026 22:56:10 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:56:09 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:54:04 +1000
Subject: [PATCH v3 10/21] arm64: dts: apple: t8103-j274: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-10-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2046;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7YjUxx5cRZKi+klFXhj4dazdV+HixE7bGSBpAbaz/eY=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4nnv5xU5ifpW3Y8/1tgrVHjA1jpI9H2itEec0gq5j
 cLG1eIdE1kYxLgYLMUUWTY0CXnMNmK72S9SuRdmDisTyBBpkQYGIGBh4MtNzCs10jHSM9U21DM0
 0jHWMWLg4hSAqdafychw6fvlqiSXi6yOnRG7j4qU8a7tZ3v0/xjfpoCN0V+n9UyRZ2RYk7e4/Dy
 XRAJ37yHxqKNftsdpXTjstlGpi+NdoK04pwMnAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 72 +++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..150d778565f0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,76 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l";
+		reg = <0x31>;
+		interrupts-extended = <&pinctrl_ap 182 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+};
+
+&i2c2 {
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
+		compatible = "apple,j274-macaudio";
+		model = "Mac mini J274";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			link-name = "Speaker";
+
+			codec {
+				sound-dai = <&speaker>;
+			};
+
+			cpu {
+				sound-dai = <&mca 0>;
+			};
+		};
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
+
 #include "hwmon-mini.dtsi"

-- 
2.56.0

