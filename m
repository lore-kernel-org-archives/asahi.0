Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622AC1B6CE1
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740717164; cv=none; b=QEOz4GFP7s4azsbgH3p8B3Y7seEO1h3WqonyL1qO8tE7B8aF+RGAoXxNZp+3eE5uGpDMrI6XZzCrKch5R3YigWafAQcT9tjRse3YOFwqt/AsSzmTYXIaXrBHR4Vca/9pV+N75MLy++3l6tVr8gwzt3oZhgbrwIuwC4Zk8LKROX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740717164; c=relaxed/simple;
	bh=oCtYD6WrFTqNAI1VrGeNu5viopS22BzTCxA/dheRKnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JafC5kg1aC2X86nzlW1JLJ0fvHctlYarGUcdW1UOStleAF1CvHe4mncgf5j0cSqbUYoLRzGg+seQ9CZDJrXv6iSd2GFc3k1btLzSlbg4EVxkF2uVIFZtDQKM9QxieYG/VuZFZN4EVUh69fXflw31kO74x90fBz2rP2P8eZbrfIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MV6FJ8eh; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MV6FJ8eh"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2f9b91dff71so2827181a91.2
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740717162; x=1741321962; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xF0/ITvO5WMYcIVP2X8KXWndD7+120RKVLBcHZ5P1k=;
        b=MV6FJ8ehpvC+nWlO0us6aKaLUSpzMLhSHZ+bYd53LvMzTluIMX2PuUg/LDhHbNgQhT
         P48iiDo5MXqc9adI1JGa8NMBV4SQJM/UCqsURhqFYEilEN++qllTfpOOM9byADqBXRt9
         vqCt0Rl3NXGZ16qYhANX8eGLkFrU7NHvlKqGRaWwnd21C/j/BaU+lszqmIXr1TYijv3A
         YBeuIK+SBV9l6VcA7jy9MGeagP3lKHb1zhymypWR4zHnkhNIUnNY5VrrGFMWuieEEpaQ
         wZCb8qILAXaT1P6Ye8flfx9N2JgjHM4bTPf3ruw3fh9Ib7jGBFwgbkckzVKWrb6ejoBI
         ehHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740717162; x=1741321962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xF0/ITvO5WMYcIVP2X8KXWndD7+120RKVLBcHZ5P1k=;
        b=tQ0r/8hEoaUKXZPJrDS6FuS1ty4cywdiHuEZLtyK3HazadM+7Lm9UC23/vF+sulOYe
         AUlstvT/q/Qx5TbD5Xe6ahg+GAk2oQ288WPXcfYPvYN6JDc3MBO0xbv94j91USsNE8VN
         TJIE1Sl5eDwssk4iOQ2F7WkTBiPNGsRUAR4rvtBU8mlU1h/beVhkDffQtMeKSpq0ShnF
         cG8MY/QomlwBQu5tiBrgfw/4YU4lgwbcIsBAyYU2xUpSjEzJW1vMYSkB0ipvNvRFIhim
         YqetZXzL92OEADKOmQnSe5bxk58OQKfegwWpjF/gSmZ1UE5gpmiPxFBpbVjWoTrPcqJp
         Sfjw==
X-Gm-Message-State: AOJu0YwPb9lihippAjkmaSF5H5DZh4NNOO7IaQ/Vx8XHC9rJagpND5aL
	4JSVnOWEnLhZXzZp5HjyNnOTES2/WwKyJenVqkkaI0rdKEXIH4Dw
X-Gm-Gg: ASbGnctyPHdD3NnzphF4K0YCVqPa43OIqkpbk0D5R55P+yV58OEVeAjvql5/OnTN/PW
	uR3B0PpifEg88yU8w1oCeH9ewotlDZ0pfKec0j0Gtd/IpB6T7MumfWj/db1By5+CT9+/ge4EwMK
	PTEtIiVtlppqSmjSS3C/x/SWErGtgIG3+Qqnd2aCA1wc0o1OrU4UkfIoTMDa0tRW12ctHnIn9A6
	l2siji0Iff17TCXOrBdhJb83CP62L9jF2p9O6YP817tz4PZNz7lwvxoEsyUSD/V5PO65jDwCWjl
	Zh8VzAThuETonsjmqDJNjz/9EJzf
X-Google-Smtp-Source: AGHT+IEmut3mjvd9t7e4uQ5c++69AVnSEKUizaMEaksq0QUSCwyJe+y8zLL9BrDMTMpqMp62yCDG+Q==
X-Received: by 2002:a05:6a21:48d:b0:1ee:69aa:b665 with SMTP id adf61e73a8af0-1f2f4dfc296mr3428809637.29.1740717161789;
        Thu, 27 Feb 2025 20:32:41 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dcafsm2738204b3a.132.2025.02.27.20.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:32:41 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:32:13 +0800
Subject: [PATCH RESEND v2 2/5] arm64: dts: apple: t7000: Add backlight
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-2-69e450bc4bfb@gmail.com>
References: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
In-Reply-To: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
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
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTxgX2wM5nSlNR8mZr4uHhX/RA6TbIYprmAXx
 +RyoS0oVaiJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E8YAAKCRABygi3psUI
 JFzzD/9wvCup7jCFw3YaxVVUGBWHeHFXw8aHYaVftpKBX9756i4oc4jGoRVu0aQArSTOVGUlN13
 2UrxX7m54s69ymovtRGKp3bWk4CwB5jQd/Q+IRV0Llp4nJ/zR4xZvWrjB7yfkoptDGREscYloRX
 6eU97W3OjuQLxg/DSV0Ezowe4fYqpHcN02kUtKqbFIdwCuIqKYahWEHnhUHBSPewjcUrJzErjdh
 rDqSNswanKlbnIeoyHAlYILzr84ACRCpRTdJti5ZgoiTzRlkGhVDzSygCAdDTRHRNf72aClegft
 GDd1CqZv8yB2Q03PfUZEZlluX1o6l6PbQRIPA5ezMETfhR+O5k0pbiHLjSjORlIklUTIofP9too
 MV4D11gZsZ/wq+9YszMPKcTvEp5Xx8u6ApzL96bMTPpyZv5ATZMH13fNoYaotc7ilCRmyc69Jlz
 z2U/7pZQVwEAyc4TBfhZ7irPDpbBKWUHvC26d8QasHeoTPV443/aCYcRsv98K7EezbrQva777fO
 59heovbpJTbgg8H8zmxR7VadzJQgMLoMS8Cdkwd97/du/OILDRTjuaXlLFSfmzWcBmuoGGtP01e
 lE5m3e6BwYC7C10IQU1aljtmjL5F0svjawTCtLtv3u6IQGIalgTnNVgzOxDpllav20EVWWUQdUi
 tXENaa+yKQcDkog==
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

