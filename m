Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1C53D1702
	for <asahi@lists.linux.dev>; Sun, 20 Sep 2026 04:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880267; cv=none; b=UF3dl3gRubR+AtzEbzTZkj6d6QZHHzm87cWpW/42hiXkjzM+7/ANESmKQoUwXQsqSHdygmS717LIYYBKS+gdwq1oNw/oMno7Pz3to4e8HBiDhg0mZmDQElSpCUilBQxwRhJOK34p0n/NxXBwrsRja9t857TwtsfZZWD6zKduDPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880267; c=relaxed/simple;
	bh=8zNWdtKPfrMTot/trMqvbPPvlUGNanqtL8uZSqGwRp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XyIEwYBsNi1BPlaoYqOoxmRU9iIRUAkq6023FzVn+sO2yvrxu6Tz1BVDWoCY272AY1K4STg88lmFz/VB+tPZewqcfHOfh5gMvjqF8ymlOnIft0Zk9TVOH37gX4b7UXb2hM5u3A2oXOBL4NQOnVJvACHxJeanZu7n7FdaJgdcDys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCc6mqZM; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCc6mqZM"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f066d8so6965155ad.1
        for <asahi@lists.linux.dev>; Sat, 19 Sep 2026 21:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880266; x=1790485066; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nUzG28jusU/5HuPttslpkNc6ZhPjJK6W+gnFlb09Y7A=;
        b=rCc6mqZMB3z+qifC1f6i8cMY5tugFO933VFcxxc45yHtqkBRZRBaJQ1PF1lZsDfH29
         8qW1WwYNu5IgSwMhFPPERzwBFGoYS5FHYyCWBcGyJ2s3F7Zy73Pps+beXBnPfhHO6lXE
         8mOrcR5MH0AfyiB1tqRlMgWPD/m1qZwWqSB/IWYumiyg6jQV5zCRxxeDEhFhPDMKhjO7
         zonuAfudUWQMIY3h7HTDf8vbueHPWSBO4xbPi1xjsD6d4xN7x29AKEcCO4d2C8iq1Wlp
         R84kpq9LL5W23ORw6cSXlco2wbo/4GuIveVfQXwyiE/WO54Iih351lbB6GtIcb8tC/QL
         80sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880266; x=1790485066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nUzG28jusU/5HuPttslpkNc6ZhPjJK6W+gnFlb09Y7A=;
        b=HiGZgHRA9RQDQaSP7dOjb/C4Zkkx8z9TWhOWYqu+qCPEMqtuzKlSW0RAI58X205OoE
         Rak9x8TYE+rO8hrEHr7oZfiB41E1kiLS/OLbz4AzfFB+CGD2QAYGo9KYP5uDhyBzzwxP
         R3lKQQAOcQz/9KFi2znwENluVwi0fVrn2f3D8z5n+qQ1ohq1mzmNAmHFcKrR4rMAakoN
         BOQqHyw0y4Csu+XLh7EAr9XYYogfJkZliTiqVhY7ToeKx0FPkS7q4yvCUjfDF8V1l3bT
         i9JXLMBNMEos+w59FWjO6WhwVyZ8dcWajYxLFjbIwRt0uOAoq4XNDlaxw2+6tCbS4Yo2
         RT0A==
X-Gm-Message-State: AFuF++kCLm1GD9dhvN38Ry26diA5jIprYHM0fAAxcf5yci8JjT8igGdE
	GUVLL7OrxonDGRksN8JA+5sUgkAMNIHiJAiJNPKvngscHv1+AvO/if+x
X-Gm-Gg: AYBFou3UVHVnDXWWkWrCfA0QtNcxhmcyGaFPQ0+1sA2MnD3TNZSY8dik5aTgKu7LvrR
	TUb5wFo059V8QlIV9aASR54fG3Z3MQJoEaO/HGY6SD/A8/9La3yrVtt/0WwmdyI2nuoji3e8JNV
	PEYNwS5jgmw3DLbsOZp8ruoKlIlA4QJ8iGDUP2Rl1/tFEIxy6+S6HhNMN8EQHTcjowLPkKwroEG
	L1Yku2kH1x0aolUnsDsEIAySqhxSCBL47IRqMytn10iOO7W44F/teZjgsqMKD40o4A0SHxDgD2O
	bK2yBp3unXyVBVi6L5DvCgcjSLQUgifSUzEZgWW0XAu2qJBlHL0xB1E3axVqDUnuKF8f4LvwTcT
	ZBbjBq4fadxxgRHlR8UReNVoNvfgiZw3JVNtwmOZlruK3b+qw7J+Sy4W9G9MFtiFdIrjMYAGaH8
	eL98unAABfuaHIZfLLUFGWkDLZZ8b3JZAjrJO0i+BaFuLi4zlBv+qyOzoLZMVwYKSjhn5yEGbOw
	N2MjT2LSF283f5xB4e2ueGfVkHmUplGegLwaKpO2CSc0fXM0ljPmQapyRQmHRkmG4cwUq3C/qf/
	Yt1GCtgFYfl2wEnMx+i/JqTVx3TN8bKfyXe9roc94A9esko3
X-Received: by 2002:a17:902:968d:b0:2dd:c100:2522 with SMTP id d9443c01a7336-2ddc10025c8mr27195935ad.43.1789880265641;
        Sat, 19 Sep 2026 21:57:45 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:57:44 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:56 +1000
Subject: [PATCH 17/28] arm64: dts: apple: t8103-j274: Add speaker/headset
 jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-17-741cc20a74e5@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8zNWdtKPfrMTot/trMqvbPPvlUGNanqtL8uZSqGwRp0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0xXdco7N+HGOUWzOheZGiRfnWExFhb/cm2C20dHE7
 VzbsU+rOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFNtvpqRYf6XsGtTFtTf6XP59EMmqiisXvPxPqbFIjOKGw6XVD75d52R4bZnwxJ
 Fn0PT4412Hr2i9FaFwzzHdc0UvkJne44aZ/lbnAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 Mac mini integrates Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 60 +++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1212852251e0..4b30f08eaac0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -75,4 +75,64 @@ &i2c2 {
 	status = "okay";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@31 {
+		compatible = "ti,tas5770l", "ti,tas2770";
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
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j274-macaudio", "apple,macaudio";
+		model = "Mac mini J274";
+
+		dai-link@0 {
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
2.55.0

