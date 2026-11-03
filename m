Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691759;
	b=uHNAuhu6ATfbKuQcbHyxqz0mDZYcdu9xBZljP+zQmfGNnDUE7Qcl7SXTIq7v6HTqYP0c
	 HrOhTXfNL8O6YLXAIHf3Um5S20zSlF0MJJ1KJrN8ge94kJdQaGf7M0lSIe5jPWcB4kRfD
	 jw/2kskcwHkCTOKZsSVNHk8Ac9hUosUALoSTb8QL0nDTrgi10hu6ukOf8Wh84BjwDLv9Z
	 S61S8vakPunX7iAuLfo7TttAgOVT9bQISQU9gBD+bAZS+lFGaBCjmYs81VKFLuolUI7un
	 p9bW5v03mKgYFr99LQoCnpxZZSwAV0I9JiYUBW3XLElwI6V8aSaby3M1T+f/IDHk4Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
	b=Mb0ShO99rQjOdQP+XnLr8Ms9OI0dGxlpaTY5tT8OQ3MWVDT3CBA2KWoR9ncuId9Bz7aT
	 zkinUSPrGUWI2gWSNu7Ns3hDLlAowyv9TP/egq1YbWvrPnN6eoVQvSFoU9XiL7Jwb56Ty
	 VbNvOuJfLzpxwwS46PxSlLEMK/oCuqkpH7qoTDgjlmvS0UYpUk5fVQxjMVbFE+z3ZJUhE
	 78TLT3g2qrgjrDOT+yGPqIxk3JZ0qnIJw6bLVuEVhzsa9PeyoyeMZhuyldx74ZGY8krII
	 5kSSQWreNLw5bXOi73l/gDmXEzlGw6LQfP+VccT52m3RB6rSYLQqw/mVG6tZ3z1tTdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HU3spPLu;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0139A606A332
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0139A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HU3spPLu
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso1984943a91.0
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691758; x=1794296558; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
        b=HU3spPLu7WqEXZGTgTqljUghtd8ooIkTrc8Y3v173OtPPoeBvdjoQ7K7qbbkrAU3rB
         qDk9A3g6p4Qm/xx6f1vNeAH8HECntNfyaY43rhfouWeGbH/SyT9LHqKNoz/4dVJrxn+R
         o1oIhK31fm1aLA5PYDHxbnycqrfARj6dzH4bL2meVArqWCWyP6n1ULm2jxOK3Vs8NjFE
         xpLDGXmTFDPU2X/CkVd6WRB6ce2EWAw/AUQ5lSo4z0O1gtjnLO2K2uqe1K6niArFd9D2
         nyhAsFzlbmYr03mDZq3kRndrCalpyisxqEmK9j6028IywDDinrvyWnzmc/JsvK89TdVA
         apHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691758; x=1794296558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uB7Zr8fjFw4qUXECHUjQ+xk9xZP2bxklv1w4UlXmhmk=;
        b=gZAw/Xats0O6pi+d/Vpm4G03hjc/zw9s5GZ6+YFlKK35MOgr1e+kl6oBag02sanMKg
         P3CYDnDcddexfaXwOPRUIVCZTh0PXnBz0hUHMimGXvTB+VvbLv/syoyeub7Z2//qFNzx
         0l/tK8xE+4tJQJOYzsgnUew8D6b5XQDa/4Vi2c8vs0Ax/YwuJ7JHIAeo/g10pI+myCbI
         beDo2p1HH4e+A68J865GzoUop5n51tJ/77oYEKXZSdylnrhA+ZtnaO+I0OuYSXc3TQV9
         7PxYz9g2TByHT6oGOyaJz1Nlf8UNkpuDGc2Ra23XaE+py5sowNp6jhkXK0ML+j/bGf9E
         7Xvg==
X-Gm-Message-State: APuU4Z+1Y81eiCci5BpNgL9h9WT7y+gBbVTAb1bri+Fs8xRl6c1cIpnN
	4QfSzoDmfn+sL5FpyRDa5lA5g38hmBFdFpE15LiPD64vQaWxCBl3Bbtr
X-Gm-Gg: AYBFou16l7PdQ6deoqUd0zvHVICK803jqBc6FApJSEzhGTFyfZRgWd3O/DRxTZ6Rc19
	v9AMlEqCmDGsg/mkZJVCYXqj/cxRgdBxmsbjnzvrUAWI/1h/wJeI8sDey1Xg5RtB+EN39mEm3V/
	F06GrNNzITnXN8MLEv186LAVAOFjOYCFubdl599memWmbjkDQUjT0L/o3EXN7IaTa83XuFNEE9Q
	4wW4C42AjZnyLWiVSkDmnLFeU5H5wL0oNB6iNNhRzkKIxU81jwAHTrprMgVT8tDfligM6R+9Cbo
	NpdXMm2TksrHbc/EirE190cenUiGXNu7LDujnMWbwUlCzIbL6fuJ3pS65Xt2GonFxwXs1Xr3uwg
	xHL10brMs6lLshKY8Apaq14QAkYIbLtGcCXR/1OA4FfDyyeq8/fy9E2oyCfaVtp1nwmF6ZpDpL/
	7wuvlsgjORvrH35ZV9dBZaK3OtysWcZVQawGFLS2kK4aAFHx4pecaJ81DbUkbnSn3AjSaO2ZBq6
	Q2KCZ4uM4T9sGx1B785ZeefoipHsOWxTYBP5y/Ncahx7SqPsLCjZNFbgGSk/8kVCyflk5XQ1P2/
	idA88VPnT4m7lHTE2MnDZTqIdmw/JBRgPNr4rnUK67wW+xwwUys/MYRtNqv/PfH3+JUGL9q+ZRN
	RKlC+NQ3/dTMQ12AQwO/yyVeFN7Tpr4FoEjTFIYDOixZRSLcovwExXqt7JRRiqb45GzZr1XN58Y
	0PgH8=
X-Received: by 2002:a17:90b:4483:b0:3ac:9259:1234 with SMTP id 98e67ed59e1d1-3ae8979ba8emr10104416a91.39.1793691758138;
        Mon, 02 Nov 2026 23:42:38 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:37 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:05 +1000
Subject: [PATCH v4 17/22] arm64: dts: apple: t8112-j473: Add
 speaker/headset jack nodes
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-macaudio-v4-17-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=KxdvsBHCHsOgUdKIYNQ3yP4bIh+4Vy0Oz8XtoAQOVeo=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+89Xx62O3jC1V+SyUKnljuUFkfUzbs2NS1jV+n2zh
 uF0wYv7OyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFO97DIjw47K7990qu8sXTpV40lwXnSeuuYVy6OzqzYf1q1SUq3je8Pwz9zvc/D
 7CTr8d4OP+Apqzq+on+4kU1LvfPuwfrGark0hHwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M2 Mac mini integrates Apple-specific variants of the TI TAS2764
and Cirrus CS42L42. Add these nodes and advertise them to the machine
driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 58 ++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 105a9d118980..6d79164cea89 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -85,4 +85,62 @@ &typec1 {
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
+		headphone-dai-link {
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
+
+		speaker-dai-link {
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
+	};
+};
+
 #include "hwmon-mini.dtsi"

-- 
2.56.0

