Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F28B20C010
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 15:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066714; cv=none; b=gSxHf6T9RxyTi8A9+dW6CgnsYn+X1Tb5KaxHR/i5bMP07XuFwHt+qi5+wXxiMhADG4Z0bTNrCxJyD/NfPnvc11z5w6Uowy1jBc4/yaEDzG7+qPjf9EjLIr40y8IBcOo7KzNQW9kF9fVlfjWEkVFGbTv5Udo2d7h7Ewgw/MUvzlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066714; c=relaxed/simple;
	bh=3G32KGPWtAlTMVeEh2nFd9QMJAqTbBI6LKbnc/7mszk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXdaPBuADETo2r+fth1jddUAcZjd+1+igVP91Iq3wEpUNzykru6w70Y0DIMrIfzn503Z8jm/axUy06/YrAQvtpVvyyzI0NCyaX7gscGwIJ0CI0RgkI7z4x9PYO/ZA0AWEUULZ3gcnhm0mEctG1EXECUClBhgir/q1U1okHpswqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIvcgUVf; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIvcgUVf"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22113560c57so21787665ad.2
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 07:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066712; x=1740671512; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=;
        b=BIvcgUVfF0BF4AUdy8sGDNAk6sIoBBhUyBbyoaUqVXCRPyhacXhyOaHAa2yMrpJrwi
         uY9HMpBxpf6IOS4m0RQPWoXRotFSmQ5p+UOkWLKo5AWDfLO/LvRRRFlCt1rmnbMMHs4t
         igLP1wyteNreE+M3pp/odHBp7Fp9L6HkRGuCTzbkAGgROwhvCRcHfCTCdK90Zm3UBQJT
         Ge5xGHJ784hacrGPM/O7tDRKhloSweZyqwf4MKD8TgCNamF8zEI1HVqhL9o4NVJrKgti
         Fu7UqWfc4z77Cgxmwn5YDUWuCUn6oK7/Kwtthv0/WzKBBHYaYYIi+47y6AWnFdSIkZ6b
         mrUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066712; x=1740671512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=;
        b=Uz4Dync1/e6DrIgYbeib8KQoi/kCIXKjkO6aWhNWi5egWcYKeQvnu96tXEq4q7cGu4
         HHPNtbNewTYE1k8ieKZVXS0i8NIMbh/qO2/TeV4hPfAOYXXneTQZVJ5C3S5yeF1KEWvj
         C/oGRUr91Fk50dMUkme8cM7BY+s9KKIcwdChy2Wbuo3rfvoSuUWT5Gy1rI4kD3nwlrcQ
         sZSqqEotKmxa7LioyzmV1RFor4VvJi64OAa6V3aEbsF6260e6No/DD3KQpsgeUQ/yPQz
         lYk3L+1Mk6N37M3ogzLZhIB7OaDf0HdB+KR8YSpwcvkkQZyswiWXIJRsM4OFl0y1TIm5
         51jw==
X-Gm-Message-State: AOJu0YxsPqEYi1tkHb/3P2Fmo2RtiEo/CM0wEdpIQxcNE7ABvKRD8nCh
	UZp9+gr7oGbZzs4jRpEmqdrU193v//v5RSBYpGcgLr9Eu0yxEXhh
X-Gm-Gg: ASbGncta9edE8FHkc4REA4o6Ee0mXSsMzgxGUxnj+ze/ZrhEn5QDyzMqCtKiGlCWG26
	fjsbYhcwT4zfyumTRQ+B9mr92WJr7lNy56Fp0tqFWI/jrvSY0G+kqtdoJn2hKzagjtQAL2kq1bP
	oEOTjTq4wQlH7X9zrs9Zzbu1z3P70mbK1HG8nvIPRUdfRC1ZU+dRMG+wx5bZTtzh7xe/klEOfeS
	sSsn6P8fiYCz0JNPFGtYZFqV6Ylepz/0wbyMz+UrSXT9spwt5FAVesMb4efYbf8te8mB+3+/s1S
	7RqPebHVcRYOdnRbNQ==
X-Google-Smtp-Source: AGHT+IE8dFjT2Oon5YwErpoMrJGlxB95W6CjlQaMdMYIGfz791B9Eo46Mhq7uycbNpThPO6azcAR2Q==
X-Received: by 2002:a17:902:dac5:b0:21f:507b:9ada with SMTP id d9443c01a7336-2210405cc66mr363009275ad.31.1740066711834;
        Thu, 20 Feb 2025 07:51:51 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d5349019sm123694345ad.36.2025.02.20.07.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:51:51 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 23:51:05 +0800
Subject: [PATCH 3/5] arm64: dts: apple: s800-0-3: Add backlight nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dwi-dt-v1-3-d742431c7373@gmail.com>
References: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
In-Reply-To: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
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
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnt0+MWpFjd2LtOQnV2+6ipFIwn+Yq7wK3q4mHQ
 R1LMKFNUimJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7dPjAAKCRABygi3psUI
 JOwlD/4+8SZyMCcMdoRA2KEvrrknMp5BdQaSl2xwUDTU+HVS+8Hns8oLhlQOjUvl4gyBvOSdfWB
 qVTyQNueZqUv/HzqwrGwIPBX3ZoZnLrfThWw+10dvcpOMo/IY6WUKJ6hHBk3s/I9PUw3ocwtk1a
 HPNNY15H3Ehbyo6MkofcTpZoF91EBuKlAamaf3xWvjbF1R78FlEoKtUk2PCrCQg9l2dcqRK7tkM
 9o+jPSajtTBnz8qTVkLRcVL4yokZiUo7+gE7ND8VISWjTm2J6BtJt4zmXpYmuks2LvF00HK7suB
 J+V4UVLQ2ahH45c6PJIRNyigGZ2FOZYlHXr7zyUBaSCGzxjTM/d/bHmfR9qj5UucOtH/6JnwkiQ
 9vxh1CSlhmZo8Rq8wuBamag1y79d2pQzEYVTouVVHFKNIg9hBccqariCHNw4l1PD070KqUpTe7V
 UWh6WU2MxLD7/iykt0jAMDVp3lXqwt9MymDzaIQaGDadO3E8HRfuhtBgSd0H5OU6yPHz8w9bxG/
 dWERsWXLVlkag1wMW4rC+gawidOeMd5j7HKbj9x4XeRZQWNjozaWF46IrS2Ui2yx3bhS2hTMrBb
 tO5jlnzHlBsiyZjCMUxX/3roFuN21IpFHLQasbkySU1mPoWv0BdtcWpflPl0i4zt9HqJRJI343j
 A6kuPPm7s12/DRQ==
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

