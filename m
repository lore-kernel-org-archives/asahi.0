Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33F11B0414
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740716773; cv=none; b=nYEAWT+AV4FYcqkUV0fqW9tCCP6iomqoeYA8tpFPfFZNmzwk7bbgb7OBjg0+EPykL4Z3Ia9S1J2RBoofbX3ZOS6tAjfPYHZJSWNYUHlo6JCaibfptDW1iv+BD/UhVgj4BgQRFU93w5zIFzs1DQCybo8zvwfMJLWlFivxaqECGrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740716773; c=relaxed/simple;
	bh=3G32KGPWtAlTMVeEh2nFd9QMJAqTbBI6LKbnc/7mszk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AwdMh9nFVZ11VXcf4HUP9Ue09jjZzxG7dD/OYMqOK/mB9daDqFFdA+sVIt+50pjX+6GNgtwuk/zZ2wBVg/6BUzEhPk9YETdMTtDXa157B3y8DFryY9uGweHE+fH9a1ZZD68Wb0gcp72Py0zIiksnROGU4i0LDMOOmHQHR1uK5jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0edwDrC; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0edwDrC"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22185cddbffso49249725ad.1
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740716771; x=1741321571; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=;
        b=l0edwDrCgbTtpYhZ6GbHbBxYURddE2EKYWEKaQ0plNjjyVS8R6mmIMxJABdJdMa58K
         +jxfHng1XFYQe3m+2pfb0TJ1/zb2pp2i1VzJXWvXhhHcmujqeeouxfWa5dOLYtcv8+6L
         O4+dpZd3CS2G0hzF0ygdd6m3Xcy8gFBkkOG9aUrZrsTwC2SsQbeKbbLatKWxPg1rBAVM
         KZo9hAuGsCy2Zied5AMrGYcJs4yER5Zdc6Hd/koID/cSn/oqT8hxoCKcyeDz1ukxq4Sk
         B8u3agZ6ju0i0/EL9yM2kFQOFQHdMy5NpLpEscCg0XnI1Pp9yY5BPKuscInbBRZscbJ+
         Xs6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740716771; x=1741321571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=;
        b=eqQMX+AdymhyM7CdAN8lcYOtAcBuizKhRBrYIvmVkbjY0ONLAHty1BiF9gCOF+ich8
         RYtTcvb/LF4EwNo1wQkog8a8Q1+jez6Gryk27iphOW87gDFIE9E8CSYiV4dzbGkGSOiu
         Kmedhr7ljTraNvgdiXSffsdgygIGEmaTsBhmlcMBd0TnqxXIMceb3XQbdU9KZmF8pl0G
         tln/n1p7KrRL+fT7Fo7/GwnV+956rOQYbWaD08v8Rb5uXV4F2nur+9+AXVtqFz+L6smg
         Sgk7y9hspFbTNdnbWlVan0La+0MtSmpT+pqJWE9wQQYyKZTZEINg9vkW76SPvYR/mmUR
         tKDw==
X-Gm-Message-State: AOJu0Yz844c+pFA0YhK0RT7LYtaut14Uud77pY2wmA0HzSgRDTQnqAib
	tmnl5Ctcb0ekj6WxyyMAcyxlx/aj86dUm72IcvBHjJLCWUW9+s8l
X-Gm-Gg: ASbGncvydM+jSv96PfGqLyxCleR+Nqrx/BAj4PttqLmv3r43hV6O4838k3V3xbJbnsR
	Vbnqwi/EmX/9///V1rh4QNTI0EGVYpKGQjNpUWyRmbdslBALqXUGzDgs3SQ9TDrbsNHdUepCbsH
	oeEpRvfqJz7FNVdj/blRHrJ2wxSATO9boNkkcYitiCOCr6D5c3+97dyd6BETAdUINzYTnNxEf7D
	TCMFNK6h0QKDyKdYc6XD1qa8pOBqYGi7nLwSQ7/kEG5bm59COllXTQS84OZ8VsoHMLOwbzqi+OM
	T4sJ86cL0wm5O1ZAm5VJ12R3fg==
X-Google-Smtp-Source: AGHT+IGtmQbdyfEwfeBhk6WSmYrLAOp0IoV4HAJOcN/bRjv63mAj9b0G7a2Jab/56/ebMWJ1KgLJIA==
X-Received: by 2002:a05:6a00:4c8e:b0:725:f1e9:5334 with SMTP id d2e1a72fcca58-7349d2f3d9emr11980732b3a.8.1740716771005;
        Thu, 27 Feb 2025 20:26:11 -0800 (PST)
Received: from [127.0.1.1] ([49.130.82.63])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dd19sm2738318b3a.131.2025.02.27.20.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:26:10 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:25:34 +0800
Subject: [PATCH v2 3/5] arm64: dts: apple: s800-0-3: Add backlight nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-3-4243fe8647a4@gmail.com>
References: <20250228-dwi-dt-v2-0-4243fe8647a4@gmail.com>
In-Reply-To: <20250228-dwi-dt-v2-0-4243fe8647a4@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=3G32KGPWtAlTMVeEh2nFd9QMJAqTbBI6LKbnc/7mszk=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTrQ6B830j95Oaa2PfNNLQHTfwWsbYuH9Ingq
 4BzjP+wPs2JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E60AAKCRABygi3psUI
 JAoiD/99DcQPTKCtLKCyntFf0CEhJfzKeDiiSPEmtdNYXNQnTApnskUoUjwDGyT34wShAW/Jfm6
 4OyKEdK+a2SpFyR7zMBI8Js8fTTDTuUvvLG+m+g4iYDohNXqW/iB725Bjqc0IHN0Pt8xk08fHu8
 lDP9PQKDq3NRj4cleRUkgCOr5ZTJ+c47xNGjNJ33weHToGdEVHH51bqVQClb+G5+o9q4ndiCm6q
 4DdtI6xZy/493Gka3iw78EJ+xS9r2JT+FvGG9b8N9auFwM1sPx64fLUMoSF5JbBlBdO1m2HYxJk
 +KIDaJCWL/ayODMRVBTGiVXgMoXM7uGgkh3gR3QsIOu+NiHufd9yAhxA9k3ABgSqBCg64cCTp76
 IDzLSMYDRQYMUfd1N9Fa7MyVXBRIwEfdyNs3EAFpkl8BJZjsVpmg41zL7ET0SDzh4B5G4uByrhZ
 L5EesJUN4Egr9qLQtqKTWuiK11rutpzzgHbOo4RTNY5ZoHkG4iNaIqEBjF3Mshklhv60k7YUrIb
 ILvINDBoWzm9BiO/Gdk7mCIu0i01lQK01J5JktmLFNBgho2ZRnNmbb6dvMEW9sPnPRCQjQ0Xwj2
 daSoOrUSOkzJwKIvleRg29x/gZhGZZRsPVirdFRDgMKcYM1ZQEc3XUPb23A2NHQq6p8UbgUja9p
 fGgeEniyD6GmLDw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add DWI backlight controller nodes for Apple A9 SoC, and enable it for:

- iPhone 6
- iPhone 6s
- iPhone SE
- iPad 5

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi        | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi b/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
index 4276bd890e81b16f19b04e1716a55f32f9a371d9..cb42c5f2c1b6caed4ae04ca0b6173e23bbda47f0 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
@@ -43,6 +43,10 @@ reserved-memory {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 2aec49f0da6467519aeb2561d00b14f46fe216fb..c0e9ae45627c8150bc0ddcdc1e6ab65d52fa7219 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -91,6 +91,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200080 {
+			compatible = "apple,s8000-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200080 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;

-- 
2.48.1

