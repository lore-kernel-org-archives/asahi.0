Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293DC27467D
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 03:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898287; cv=none; b=FSbqDFQpnDFSKoS7Aa7kHLRNwB0LWmqfMr5OJ4M7ggOLg4BdxRDIGxp8Bl3NWKmHr/usy5vip8NewpQvtcoESTOy5WN84JZ3Wz3Lefz9DNe5cic+X+GMPo9QzNxFxHuKMujtWRM811KMLP44vq8lNyEZEKEnXL0gGiSJaIy3hBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898287; c=relaxed/simple;
	bh=iSgQuvf9kmSTE4D2ckw53TzjQOR5RrwNb5r5c6wUTAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VMNz7ePCCerwohNJpu7iPbSLElKSOShX1o+X3W6Vu3rzNMzucFiUGLpXBreMrS6qBZl6Vj5m+xvpgqe4jHeQPUbY6y9cK5NQISga3FWz34cMIsdqrmdL6ZTVYWbjQn9CxMpvRSJBkzujijmNFf6rHm0JtWPurFOT0iDlC8Yz8Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jt+cijEo; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jt+cijEo"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7394945d37eso4787111b3a.3
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898285; x=1746503085; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=jt+cijEoOWCL43bUn0Q+Dh5J2uESYGZ0SzOHLV1eo1ON7KApy9+Zsy7FN7Ka3MkBCB
         5WNG1WqJQ/NRIrXOImcXaEI2WslLN918PlnYglHj1wf5o34a+soVAqkPRnZruDLPHWXi
         Ym5wPWTM+thib/zYOTM5r0kP7FHK+k5sy7sIVzpVEeLV8TTHMh4DlQomG1qhlthS1jKt
         52yH/gcMyszsoW655UkA+VWAGL76I7NfsjuegJbfcchob658j1YWwSuIbWAy615MuO4Y
         H1uYmXrQwBp0yGOm8/EDeUzAUVJom71TsfA+S3xoXPcvpDMsv2HfzRGU/uOtG4b9LrTQ
         dMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898285; x=1746503085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=UQRIbGjslS6RcSyvDXwL24Fy9nIhuGXWelkTPRbJyzeH4+jIojLzO2BHlYYDLa/HSo
         GJ5C9V/kcZbMeCDg0+KnOYrYzbiPVtwBzhMT62Q6GCecMFXQ34DP1EET0VIN3A9iiyul
         7SYZX+IdtqkfAQbM3tWTyPB5N/Y/vqDF0Gl/U74+XvAIXiStqXpTFfzxj7Kg/BSiMjKa
         cBh2Xrl2Y3GCDDLcpklZrDwITJRbphhC5A+8SfbjAuFggbaQqv1NWdOaTz0zE56U+HN7
         BOUsKpN2u6qR063QbmpMiCvluqUdvGbLnLiXEIwOKdu5qK57/WtnwPK4pXi2lsVc0EUD
         aqOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCwtWPn55xt1C51UqGYz612oTbZN0Vpx1nbsPyAtYVcoSmffuw1UcbwkKfWIcoAao+uqO7OA==@lists.linux.dev
X-Gm-Message-State: AOJu0YylIUEX3x3oEmjqyG3CMlOfyvN1GxrzHK1yliY7+jIKME34CsTG
	yDJ1llYCWPnIhujky2bH5AVi9MrTxeOKgXm2ggJQpYAvrK9paCo3
X-Gm-Gg: ASbGncv9G0fy8XG4T7L5vavGH0lggS/DZWgAbcUiOSl9ECZCUBZLPILt06j4NWXrIfo
	PLoQkt0w8/Gj86+oxz8XJtMyOl/M3eIgSn+3nhzxD4pKSsSe6qXvy8AMNsx2iIA/Y7u8OwqNDet
	2pTlQF6RaCLgjVFhc8eDdrwUYDLWYWLUFB6R7WnykCEwJBap39+Y4SHZsbskN/SLMzr0MacxwvN
	i5s6fu3R+8bZtTJuq0HTR1p6bGgJcR9a2j40QVZCyizBJdyRLi2Lrq+vbzFbetCY1y9eYcTdi1U
	aZbrd5Qte7AjwNGPVOtknHLt0gwYgoesI8QpcTAhV3IQlpBsyEqgNMYpbw==
X-Google-Smtp-Source: AGHT+IFEbVkPWYNQnY1Eec1Z/JJdXhHAO0h1WUxh3tHn6ObSEJqONbzchnPFoKFOa85JTrCDNEdlqg==
X-Received: by 2002:a17:90b:2dd2:b0:2fe:9581:fbea with SMTP id 98e67ed59e1d1-30a013bcc03mr14963519a91.29.1745898285220;
        Mon, 28 Apr 2025 20:44:45 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:44 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:44 +0800
Subject: [PATCH RESEND v6 20/21] arm64: dts: apple: t8012: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-20-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=iSgQuvf9kmSTE4D2ckw53TzjQOR5RrwNb5r5c6wUTAU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErmBO4nJnK5mFPF40lad4p+BSKJJgrH+MZn7
 sq2/grmPHyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5gAKCRABygi3psUI
 JOtkD/9p5R5bmRzF8RZxw0kgeMs0uNsPHoqfnYjW+vmoqBbxtxeoO6ad3tbGJ9wfuvHxK5mpxMO
 wIxI0CXw5vmijcdumpsQcOkB7JVaZqrID7+Zr2ye58YFLpFWKRi77q8ffHFHrZ8Gggm7Og8Xvol
 UNbMssQR1fLxePqjUnfSST7/n0t+HiJWcDRdW9XFizJH9wyZ/NrTeRki6N78F3yUwO0cH/z6F7g
 /TORZXoKldoHsSHanyvFdJGj+lsrBcabdzp4zokYekXiYccfG6pqPXMgdBhmfhwrog/v5reAbIx
 Kvb3p8CQbxgnD8rLuo7rq//4nOouJoC6oHHuRWNs8aZHw7fNea65Qhy6+yodo6haAjiZASQrhnp
 jISf+cvhVA98LZeijP2N8717K/qZj+ArhpITbGmD2GKh8m3bfrqvvIF2OvejSuqODpIGuSHKah4
 CsPh8tcbFe3oPcUo3P2gyvVUCpEvTzo+g8ZG6WOWFdNK9nTQkfWRMgUs9qIbDERPFJL6B4X8Fw8
 fxb4Hc2Ua4zgvnDMgO8kkTA/sIHAKOQh7D8g/GSapyx5+cynYVtm7CAPPs1JdiXnfcScaCm0W6N
 +VAlmG7IVsFIgUXnJy1avWP9WKc+tPHEWi8FuYEaAmqrzEfg4cojYwrn6aedQDgUxNR9/9KbXbY
 cZYlEABjiv6VR7A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index 42df2f51ad7be4c4533e76d18e49a9a747b6b7a8..d79ed754c68dd89fc8c52887e6dcbbce04fe126b 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -276,6 +276,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8012-pmgr.dtsi"

-- 
2.49.0

