Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691733;
	b=HumFRnY2ZlBvJ/Z4w3ltk813Tay25V2ooGae9x2mjjZQFbeYcKeUkY1noDoCSnHA8jlX
	 +s+dg50SVMSDlhTmWvCtU5m30CE35Fzj7LOEUz3SJZ1xRSfpTfnHQ5Qsujrtu1Gyb0ji8
	 wN33CdDh8b3bl2+n6lCbN7efsc/FdXCnxAq/GEpTDwhQat4S6BvBKNwClJXI4F0sWTYtM
	 +WJEt0DXPg3ewgisR3aG444vIosnjNcaJzjiPpyh9qjcsVKBujXB0PJBpd5g2SIpeOzhE
	 OQ0MaHN83ZgSukZbn8Oy69uiKsZ9ffe97wClk48snTcqiHgmM/sw0jc9y6X6gSWPBrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=KkE9N64LXexnMyyV2ra0smP22ohtWzLC8tidSaqcsb0=;
	b=m7yksS58YPZecRXji8lXNqnIU9Xhn5RmoSN/ynUAJJLod2PMLjqSl4B+Bo4A5cRJMOjO
	 r400f0C0KkGGSyxaJQG6afHsNhxT6T74S3kLF7NITIspD+aS0VGuC7MoWoGICm+/R2SH8
	 i1odt51rRywtENanLrinR86BAX1buweHxkP6lR1I1JaekJEf1B8WY4Njzu7eg6Rr7rYY6
	 npS5FW5gPMux9m3bOpvCFmFKdUOPuMVQzCJjbYL+06/DsQFrQptHvmaN5iXbUwHrgjXzt
	 Vijge69s6e7RppCt0Jc5Ld+KFfMpJ2s18/LP9OlKuQNz14E722zwg3MK06DKes9I4Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k2nddK8C;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28BE606A338
	for <asahi@lists.linux.dev>; Tue,  3 Nov 2026 07:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F28BE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k2nddK8C
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd69954c755so2806908a12.3
        for <asahi@lists.linux.dev>; Mon, 02 Nov 2026 23:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691732; x=1794296532; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkE9N64LXexnMyyV2ra0smP22ohtWzLC8tidSaqcsb0=;
        b=k2nddK8CliiqasnOXKCTzpV7o2+tRAWWKTWulP2hxgTVgzgpxJWBsYxK2qXgmv9FwN
         BvFC+k++yJc2dFd2hg50IQ99kz3sxbWmEKRkhyoyy31cmNMaLIPxpoazJWqKR7dz7amW
         MhV0oafF+FzlTMBWBNmP9ymZX3tTkuMIN17VKfIoy+Gf7GMPHny7f6M1r39qRd8H/0V8
         S18cvpRq5byEUgrOFBcKnhr5f4Ij9+QVY57DfIUA4uCezoSyM/S9tuLqNX3RLvUGVZ4S
         BoRtGjqmWqworFdfFRWit34I2/O8g/JTX/lPcJxfNFQuFoEu99fO+7ATPOKbjHSKvq9m
         NFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691732; x=1794296532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkE9N64LXexnMyyV2ra0smP22ohtWzLC8tidSaqcsb0=;
        b=zyZyM6HeJviLuMA0WaYqD1m+d6FPXsHSWNj9myFBERfcYRFE6sH4QUDyXcQFM7e18W
         FSbaH8dcRdBq9efi3P8B7LgDT7CWwfiUeNkmYrFlYNFvUptRvYyehH+EqjfnNg6HjsHz
         gGMnq4x3hJIUeAcIjRn44D5GAxKBqXjfhsc2LznpZhypcdxN6AthNqygSNJAqhv487Lx
         4SRCIifExHeH9yYb4czpf3+YN4XLH0zLuR3gjskSsNL0s1zpFdBJzOd8/Ih0ejnqqVhF
         9OdKD9r/BxrxLBUGc7OuoCtkTn1FnFt8F7BW4ED41jwf2wHbA63bYLAwI0tvFdGB1rCQ
         MveQ==
X-Gm-Message-State: APuU4Z+JbuXPyE6eBb9CSP75chhHG8bmmals15O/uXR9MfFZ4pDeD4Kc
	6+Q1mwORJ+lbBwbMWipEPGn1lJjZGyL0KlnJosrnkTengj99LmVR/WOF
X-Gm-Gg: AYBFou037i6HX/IrvhFY/c5KSuUuZ716AMVNwFEHKkJj08tHnePtcVGzge/TUjuXCUQ
	G4Hct3LjSwDDhBUYef7OG7Avpayr8/3n0YDNuZl50zCMtrVWDPAPICAmvnR3BXMnk+MwG6VqxiP
	jgB8Pj/C4Jd6pwj9y/PCizcesjdtRYnI051jmVugFyof7qVk/3t1OeTQ7PYTN0S+Lav7Grg36xV
	uQOo6/yNmBsubY2waAOppgHrfQCs1Uwnlg/MjHdkKrdltwMVuWR6mDCHS+ch1C8o7CfsB5sCJK6
	avGhTYma3LMei9BeYmxZhBi3UrQdM6cb77KpZvnbRl9m+OcJmeC3VhWIUSVY82L0Efw52bCRUmC
	iGgdlrWTfQLl2GCJpS3sRk9iUhzwPXQS6YJkGBdW9g//klxDARutLK+uUUGFCZLl/PvbJ6c1Aax
	YwYBgfhZALkiwSfGb/rkBvR+XKnkLGAW+AXrOV13UQ7n4xJL6mNu7JvpSoAxuouUDsHoB0yhUH8
	JW3P6AJzsxd8rP1ZUOU/2GSrMZfbAxxJi1wXSAcqXT5fdXg14E3IT7Wd+N7fhfkVdaWXa5WHlLF
	9m2WEZm8UXXkjZrfmAmGY6SpW5rlPu7HG+p17V0MoazoHXRqN7qWCGQ+46hUzKErvbvkFxM9s1k
	qIynuLNPOdxF9qOWzA9zvQCzMpeuCyY14GD+stfYOopDFpiJuNRBPgid8+TjBCSglzDZBAos8oj
	MYe4A=
X-Received: by 2002:a17:90b:1b12:b0:3ac:9e76:aa9e with SMTP id 98e67ed59e1d1-3ae89573fa9mr11002675a91.3.1793691732367;
        Mon, 02 Nov 2026 23:42:12 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:42:12 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:40:02 +1000
Subject: [PATCH v4 14/22] arm64: dts: apple: t8103-j45x: Add headset jack
 nodes
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
Message-Id: <20261103-macaudio-v4-14-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2854;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8ZqQFFxpGVv9nHh0/Eh1D7Zh6Tx5J809tDsq8MzoHlk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8/v6RDIyc+wZIkNMv1lJbLIvP8Wp+6UWbs3Skxju
 v1bY/6TjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTnbGBkaD3uUcLovI7pw/ocB5+Y8Dl5fqI3/La6ZrzdUO7mu6jEkpHhV4vq+ci
 2lKzlmjV9Twq9Llz7V+ytcmpKlalw66IF9x9yAgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The M1 iMacs integrate Apple-specific variants of the TI TAS2770
and Cirrus CS42L42. Since it is not yet safe to expose the speakers
on these machines, add the headset jack nodes and advertise them
to the machine driver via the sound node.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 43 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t8103-j457.dts | 43 ++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 090c97bb781b..74e9d11b3362 100644
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
+		VA-supply = <&jack_va_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+		VP-supply = <&jack_vp_reg>;
+
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+
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
+	};
+};
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index ebddde75455c..c0692ddfddd8 100644
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
+		VA-supply = <&jack_va_reg>;
+		VCP-supply = <&jack_vcp_reg>;
+		VD_FILT-supply = <&jack_vd_reg>;
+		VL-supply = <&jack_vl_reg>;
+		VP-supply = <&jack_vp_reg>;
+
+		interrupts-extended = <&pinctrl_ap 183 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pinctrl_nub 11 GPIO_ACTIVE_HIGH>;
+
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "Jack";
+		cirrus,ts-inv = <1>;
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
+	};
+};

-- 
2.56.0

