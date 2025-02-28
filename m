Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EB21ADC6B
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740716768; cv=none; b=Ri+GiEkAAPkd0eHXtlCZ27OQ/l6zZVPiHmfbYpwT9UitTBLmm/oZ265Z0cKnrBujtvixDaWEdFxiIzBfYm+PRS5YzXfwCIAWuw7O3vmqFeg0hiHIfxH8t/OLJdoPUvEWE6frO/LPipV/b7iHdmuobtleBnenjfQR3cDJM7y49aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740716768; c=relaxed/simple;
	bh=oCtYD6WrFTqNAI1VrGeNu5viopS22BzTCxA/dheRKnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TzsAEb2eBAwz6lxcK4r/nbAcJRMfmH56gi4e9gbuhL1dCOwwp5rg607CABjI/1580X28QvhLLs/8IfT7jzEEQut8/DVYI93fayzuj60gAqeWjwU9k+EShsiLeu/XhJAGP99k/1RMKfSK/nSQ4pEbz2c4Uk6YHzB83m+xUXQApzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBIxAEjI; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBIxAEjI"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2232b12cd36so24209705ad.0
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740716766; x=1741321566; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xF0/ITvO5WMYcIVP2X8KXWndD7+120RKVLBcHZ5P1k=;
        b=WBIxAEjIQEPBxCvnN/wMLhlYFEmTlI3bDUsBISENunX5C/54y9kL9pUkmOS1diCKp1
         JHrelkEYXw6PMm8bKjbGZfzjUiiEs2Jp9LDpQFUAaXGP9DB3nHzcjo5g7YEOHxdN9lE0
         UYqkDDH3kkmx6J4KyHm5Z60paF4jj8VaujghsK2Tw1KCm7zfnsiJZPfIJbuGG8IXFek3
         zNiqRiwRSP1TuUsc6Jwlqh7OUMRR3+P3f6H2+/yNGGxqGXezeiDJfNZyFb+4xcoJcdLt
         1uRliMro+w8OKwn9QH8yph2xFoVbkGxyHEF6pHDACXG19KJI/n04pClO8xF1hWXD3d06
         0+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740716766; x=1741321566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xF0/ITvO5WMYcIVP2X8KXWndD7+120RKVLBcHZ5P1k=;
        b=YcOOm/MF3NSbSEGTFAn/Xyq+M7594DdEnIfS2sHn++uIk9Ej+0IqsrDtgazdcl3keD
         TgWmYInShOirAjW+s72awg2PnuM37BLDx7GpNFdK5h1/OX4sKbwXl46JaEItQivncq3z
         2ReY+2Cu9zq5asxIhUGfY0XDbyeKlEeJdqT6bRQPWQ3CDg8OCfz1v09l/zAHIirgc+gF
         MVM8G+Ay+KVXXMybZm4WGe/K4uTKV+fGY8K03yaiqzz/YBzMlqo6f15Vgh4R9JF4a0Rd
         t6OwH6m2/jTta6IBMI6KjzotD7uvb+0/zWccV/h+3MVwbn1TsH7gOWX12nLObUr6HHry
         zRBw==
X-Gm-Message-State: AOJu0YxqVQKhEiAxunLe9eH+HO0ntx7bTTt6qif3Fq2chMScPQbCM/Bv
	fqojKwtkCS3WF0xtmnCpIaRqHUwjYh5v7jgvHVu+j+fZtCCaAmIJ
X-Gm-Gg: ASbGnctJHhxkKkZIRFmDqiNvhJtSotJ9h1imhrMKBA++cQByQfJWybeyYT7nz/PYysh
	E1OsJJUFFYA46rPwzedTbRy/Xxruf/XCBxaGQ9lOFRD7phnFlEVTvrqNv16xCMUCOW1gXNHszqV
	UWJrfyXd9G+YUOryNulRZG7T0HorPc3OvqvoS3x+C+zPegfw/Yip0gYz/PQUEF7HRhnOefJNpJp
	VGJSHFf4HI2fpHYYd/qwarZ5HpWvzfZwaBwF0mEg/bwpgVSxEoGJdCq2PzNwWYfO/5iPUCWgENC
	q6yAAIm+pMelgv1JnWosnKJPeg==
X-Google-Smtp-Source: AGHT+IGcN/7ZdnUnViL3/CiY09K67zXvs2OcKFnG2mtSFgj254Meo+xHdGmJBGbEey5mF0hsG5ucHg==
X-Received: by 2002:a05:6a00:a8d:b0:732:6248:8f5f with SMTP id d2e1a72fcca58-734ac36272fmr3094637b3a.5.1740716766478;
        Thu, 27 Feb 2025 20:26:06 -0800 (PST)
Received: from [127.0.1.1] ([49.130.82.63])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dd19sm2738318b3a.131.2025.02.27.20.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:26:06 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:25:33 +0800
Subject: [PATCH v2 2/5] arm64: dts: apple: t7000: Add backlight nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-2-4243fe8647a4@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=oCtYD6WrFTqNAI1VrGeNu5viopS22BzTCxA/dheRKnA=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTrQccRqi/70AGCvdLF+ZLysUS8fqDbEUVGi0
 47EJSfrLx6JAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E60AAKCRABygi3psUI
 JEVOD/9WIFodfJZl/qM5omn6+3fHjahLg0o8Rm4NIX+Fn6unL8EopVkKG1bxI4jXzxsdL8veKi2
 d4wCK7UiKE9Bc0+fp05IZthkRoxaftKtSUIgmHETLZrRuz0NLwjvKd+Vd5aXkjcspVC34dsNNwH
 oNaXD1u483R2VzY2hniobTUo3NO83/H5iQBWQYzgltpzJzsJ0zjoWpeUDrL8OHNM+Li6CLoKfj7
 JDEDAwRHuQonGDbQJ1/3AuFCryQxnaHjHd2YPGqdnuwZCnpgM0qT695t28ieq2KMemmNWpUEwJg
 3MSOIDQ3NTxlCNPdgKPGLfwNrbCqGnMA35WMjaU2pv0p+A9+wArPkTykjXcyH6Fbvaj3B9JZP7z
 Cv6HtjJ3cSYspFitiMJeQL53FmX8BB8JyOw2upuOOQVb1NE9LLWdqSqtoOA/1dDRNpydzvqb57h
 HuVnbkLyGrxuC7QYryfbOlEWTNMlf2jx2a0J9fVwb7Z/YMybfuRyiFZV+Zw6dLTA5mJLPM4E1LR
 5GtCcC9w9fhzNVTY5jGFWSU+qCa4rRqglMBCS6exBQYGOiSiqc7kNRN2UQx2RlGADSW9IJGGWp3
 qWkr7WdyGri74LaBfuwXm1S+ukhcr6GZUrKwe4lmhZOrlVqe8+Fub1WWYPZka2Jo4+rxGpgtelB
 iE/pMuaMymqNWdQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add DWI backlight controller nodes for Apple A8 SoC, and enable it for:

- iPhone 6
- iPhone 6 Plus
- iPad mini 4
- iPod touch 6

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t7000.dtsi          | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
index 8984c9ec6cc8e3c86281a3da719edb56c5bb7f5a..7b58aa648b53dadafb3a01d9ae1e01afa6cd5869 100644
--- a/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000-handheld.dtsi
@@ -22,6 +22,10 @@ framebuffer0: framebuffer@0 {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 32cac8c30e62d657079dbf32aece8af0fd9cef38..85a34dc7bc01088167d33d7b7e1cdb78161c46d8 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -155,6 +155,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200010 {
+			compatible = "apple,t7000-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200010 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@20e300000 {
 			compatible = "apple,t7000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0e300000 0x0 0x100000>;

-- 
2.48.1

