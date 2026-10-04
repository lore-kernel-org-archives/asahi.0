Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984654078D9
	for <asahi@lists.linux.dev>; Sun,  4 Oct 2026 06:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791094000; cv=none; b=OiNioggtnlzqQnaJXwOok5D+KJ+lCrBns+NRhTCWQpfA1QctJwq466EEhoQSnPJQarSj4IBBn0Igh4tIb3qaMe9Q9Bk9X88bHpu5v9PuEnLMdTbxKn+0/FV5fBmN+um5eY+lIu4hav5LrQKPsX6UfNxvDw4LRPpf4d7UchYj7VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791094000; c=relaxed/simple;
	bh=10CNjE6ELuFX66IXNrkb7f+2daPg1AbLL4enNg5zaBc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LY2bFUdAuYQ9isE/Wj2waaWCGtQLFKII6bSc/6bMCb+irrZHHjBRZC9ML/5u/7qTjbH5C/HDusewl8k9qHpTKLkLTtQ2yjwKnUuQtZEXl5GrM/uTpGAEKyL1syCfNk5a+L30QleiS01L8+2FCgT1yTY8YmR6AVx8YajXvPxS+Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgluVLOv; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgluVLOv"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc02279so441068a91.1
        for <asahi@lists.linux.dev>; Sat, 03 Oct 2026 23:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791093998; x=1791698798; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzE/M5oT5vPZI1AJYKVf4l348+q+qKtnsytokZ7nT6A=;
        b=DgluVLOvd9A4BSUO5bhTFv+NWdYNZbLiLJOlBCX9yQeimxh1SWEmIqHf1DpqQ02Mel
         tuJ/P1ON2/8+MCmzv7UlruVJq4mNfwnN27hVzyzs0BrYViMEUIqh2ZW0zY8HT6i8YOX3
         3q4GZKa2lQbUC/tbEx1CvhIw1MIXZleLmUzy+58pUKqr0RjVy3G9G81kljMgvnIIC2J/
         iscBQq4/MTqTNOiHKh7I5Fgc3OkYAXUgo6AtNzIBvRv01CH8xPZhpvUREwkYaRvoi0Iv
         JbzgijaSxXdyQbmXNgu9VguDdRz2iAlq27KzYKeJCcyzMwompZMxlrmW5F0OSUfZmNrZ
         IU9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791093998; x=1791698798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzE/M5oT5vPZI1AJYKVf4l348+q+qKtnsytokZ7nT6A=;
        b=uRdu7Am4+z+uWfXh2S+UNMb0dp+HQykEQiLM7ZUYIa6nvnaU52EMF52ifPTzwYhkaZ
         KsO+KiEwjap3hcGKjWCkMf5vQmTKLOIWnjuQsZ62PnLWQA3YleVWFqZiHq50q58N30Pf
         Hv2WvFllM0Z3tmdfovouB7f0eO5lsyuDhGm0i76RYsHyowuCRnUOLpF3kuKv1dnfhSR3
         gzhGhAsB3FXFUBviRSRFnOAN0C5tQTZxd73GMbD2bsRc3uMsFfqctqgplHnYYdAXKR7J
         JATmteKyOnnKTbLR9sBUy/iVAikuI9dV6RdnR3DVSaH+65oAm8nKvHLTCZ37TDia25Rd
         kCWw==
X-Gm-Message-State: AFq9FYKFN6XtUxJRbOZYqinvtBLd2iDGTYIeQNhSXMfHC5PvM8fGBNqE
	37vBjCl7Osui0oLlfnA1y2bha2CBzx9p2zW1s1UhCZEP6vahAHs7lyC/
X-Gm-Gg: AYBFou0nxxzr/osAm3zl5j15CTcabqK6Hxfvqcx9GxKp88f9ovKptJMEvug/jzMITIe
	Q54Qq3yMIuSy9vvZqGzAAgtaKQBdDTfcQHUUKg7TNFc0v3M/LOANx9CMFops2kk632pbk4WmRMe
	zsjoaD+R7j/J2pgzjZEsNqt2lvbVtf8c0+ErXvkyxoK0dCduHK3U/jpdLGAHEW9sOczwgt6ivhm
	EsFdnre1DkXqqxh37LQRUu8K7r9/U3vaEt33b7kQYbFg4JBy6n6nY+OAUD1GC4I0OO7ArHmxEuP
	utvg3n4hCYjpp4ATdwMHrHmstaNHkaxsBCz2zA4GxJkh4G4eTCXf38ODk+uUpEhqz2FDcyyLQwg
	uqy6Dd9X8gkimNxLLtrib57p+8REvt3E6G3IW/CKKDAv6J0GOf3CZb1IUllrEYFdbahG7jdA1Z2
	SlXOZVXf8amVi6o4VuaqlV66zU8ZpVU9V5nhn/rJWgUXI5lhsv/xpmL9JmPK8sNO9nQqsiartgt
	RkiObx1EV1UpM5WbdcbDtGNcau4m3IcV/UDlPTIT3dv/xAv8I3bGk3Y4mHcZmAYWVreXEj2Ba1Q
	Jlp77Rq8zhSqOg7i3b0p2zTNOK06zACvrMUbC4UI4ERJunc=
X-Received: by 2002:a17:90b:4b83:b0:3a5:1c7:c2f with SMTP id 98e67ed59e1d1-3a6ce986288mr6844237a91.59.1791093997815;
        Sat, 03 Oct 2026 23:06:37 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d4a869esm5844094a91.2.2026.10.03.23.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 23:06:37 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 04 Oct 2026 16:03:43 +1000
Subject: [PATCH v2 16/21] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-macaudio-v2-16-7b47ed6335a8@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=10CNjE6ELuFX66IXNrkb7f+2daPg1AbLL4enNg5zaBc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkH3+SpT/mn9Yw/NPxbgufaM0+qi9NObXvIvuFI4oOQW
 a4ZNSyTOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFNdL8fIsO7XQYO6x03LbdPLE0oNPZ9W2QWKF4vWiTFNfTf5Jv8OYUaGLS7Obd+
 uv1v7zKW2L1qITXhHtfRz6+jmpDrmOtk7O1dyAQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 62 +++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..36f06c6e385d 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,66 @@ &typec1 {
 	label = "USB-C Back-right";
 };
 
+/* Audio codecs */
+&i2c1 {
+	status = "okay";
+
+	speaker: codec@38 {
+		compatible = "ti,sn012776";
+		reg = <0x38>;
+		interrupts-extended = <&pinctrl_ap 11 IRQ_TYPE_LEVEL_LOW>;
+		shutdown-gpios = <&pinctrl_ap 88 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		ti,imon-slot-no = <0>;
+		ti,vmon-slot-no = <2>;
+	};
+
+	jack_codec: codec@4b {
+		compatible = "cirrus,cs42l84";
+		reg = <0x4b>;
+		interrupts-extended = <&pinctrl_ap 149 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 12 GPIO_ACTIVE_HIGH>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+	};
+};
+
+/ {
+	sound: sound {
+		compatible = "apple,j473-macaudio";
+		model = "Mac mini J473";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			reg = <0>;
+
+			link-name = "Speakers";
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
2.55.0

