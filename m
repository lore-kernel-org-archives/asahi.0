Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FF22D9484
	for <asahi@lists.linux.dev>; Fri, 29 Aug 2025 08:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756457315; cv=none; b=WyJCC+ydpz4WbcxVDV1jFpaN8N0J6IQ9ev5EbIkOByucBTCuxMvGA7Deyw/xHdUIYwPwsGB2xEWnzEKWPGk3FSdMLqz2XYYNxm6yV7m2CVCfyEl7GFLJgZW/08xQFKZ2c2KuNHskPeltcl+7FrzYseZW5GRNKu6PFLXGK/HJCD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756457315; c=relaxed/simple;
	bh=eza6FXzy++LDogP3zcMgk9YsALnXaMYkVZLvx8dfpus=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PzQ2j20k4uE42nrm9MoDdMHOAedm0gAuZ4V2rJfiV69qt0GCiIZWHmRTS1ybiXBdbJUd6I0aNPEfd0Jp7B4dR64PsVxPVNOFNgiBLLznjlo0zKqJIecui5KyQmhbIQXLaKXX2oAATVUi4Fa0Foh39DwiMOa4d2z8cM9TJcgElaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnDUcLfK; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnDUcLfK"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b4d118e13a1so261733a12.3
        for <asahi@lists.linux.dev>; Fri, 29 Aug 2025 01:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756457313; x=1757062113; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=getXY6n5cmVJNwnrUl8uG3DyV7kHjWYHn6/PT6xrbnQ=;
        b=HnDUcLfK06z4T1ImQIsOCokEg4VPGh87+UjqPkSJkvx+nrFaHe8pd36sOAV8elY9Oy
         Icgvn5tFbiZ0LbG6KVZzjyHZNXl8EjRq70LY2/TKM09Sh3w9eKTjYRsqQTkJfvqpEcj8
         1cGCTNDwiKhwRr5d/z0DV4pSsHwRsaVc6ONJEGmymXuDT6pYmbfqGfsh3m4NR4kqMRbL
         TE+pjI7Vskz7rT3Uj+DrPRAL3vG7iNRcWvtP4USXgfdVVcSr7+g40ZIsiHzyL0OqOBcr
         R6I9UbhEK+170PiNyBhHwzLYMlUIw84Wk7BmUtjelkw5Dkor7/wfooLNBmv9AFGWa1UP
         eSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756457313; x=1757062113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=getXY6n5cmVJNwnrUl8uG3DyV7kHjWYHn6/PT6xrbnQ=;
        b=DTlNBnKl2Xkm27SYEOt9MZIMfUOjNZOCOV23rWCnccAIXrggePESA3Pd1D5MKSvyA3
         tjuCaW4bP0oa9CP8hDgRvqkYQPq0S7NIwfO7BWDpVMh/l7LYy9ZunJuffxPAhWNQIMPA
         b9FV7FDiV1IsFfBtw4IOM2jhatSVM+f+xraAtJsEx9KnN/c6HkeUvVyc5TXMmeyI57GR
         2ms2tSdsvWUOBPut0FZAF47hdVPMb5s+G+USh2UqxO3e5AU9d3/35XhkMZufGJX3+Icp
         UW90DkvMCnycmDo/M8+rAmXqxtR2j/DG6m9qIW56taYsqkMPnomi0U6sEJclKDxbi5Ff
         t80g==
X-Gm-Message-State: AOJu0YzLY5SF+LNNWoVmszlQ4CxLrbD861CC4QhdmvV58OiLKR7M3bcF
	Q5wSEh7cFBJaYrj28f+TWa6oWnXR+VmaxcLJ77gAwmDd5G067I436nR1
X-Gm-Gg: ASbGncvfas1Z+D0gM+hztreZhJYASpaI0bVwlh5w5pdwBMz6QtY5gJlHlenBFIkEZtY
	BYAMRYRFvejqVWd7R7p2JbCpXnRijfpyRWxfpcz1gfS92+T4w2J6fmjQnUrY+CuM4W21LTfjn3T
	Oi2yQk72RSOGUiuffEUUToRBjOYlV3NfrMA0O4L68GV+2HJ/IK3L8SNlUktWRIaYeg/npT8j7Bv
	+yY9NXODtKF3z+aT3zi7wdpVf8gejnpeqpvTzFltHiBasoxI1Bck0o6NaQ3PF8Aluc/Gp+xhtGj
	1W5ZnSlUesYe+RRb1We7n1wH3VOBSo+HBOXlhsj6ENQIKgM49HbCjHhXLBMc+AaV7jHW7s2dyE0
	U7EXpyR5Wz038tc80mxUY8ctuirA=
X-Google-Smtp-Source: AGHT+IGhBfJCAXApPTnMOx1BPvVN1cE26lZrndFkg1B8ZF/ybAWF0/Xb4YRLny1z0qgLJdczsbr8Gg==
X-Received: by 2002:a17:903:1248:b0:240:92cc:8fcf with SMTP id d9443c01a7336-2462ef53d83mr382357425ad.49.1756457313105;
        Fri, 29 Aug 2025 01:48:33 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249066e042asm18162565ad.146.2025.08.29.01.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:48:32 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 29 Aug 2025 16:47:01 +0800
Subject: [PATCH v3 2/3] arm64: dts: apple: t8012: Add SPMI node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-t8015-spmi-v3-2-58b15ee2c825@gmail.com>
References: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
In-Reply-To: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eza6FXzy++LDogP3zcMgk9YsALnXaMYkVZLvx8dfpus=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBosWlUs0lzltNT/qLaVfaVX4h2HZkQ1Ro4GdE8q
 ftk/g4gb8KJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaLFpVAAKCRABygi3psUI
 JMStEACNFIJqKRV8SftSpcWaUUIKtllDistXE5BdZNVP0LwmXOfPJsANF+Bv3e7GoZHyw4qsUpP
 BisVDc3DwBxm/j27T+jODKwyTRGatj0p6eSb9gnhu5TB/Zzo+HKzrykuAeoXPGvM93eJo6kbd1y
 a3N6bbGHwJEE+IBgBEPyzhkkpfCh79U2O4F35oE+6DP8uiDVZx4jKqGh10lpRw/jU+qPm4guh1I
 TsTeC0xqHnUrwj5BeRpPDVc446vPSpcs5TpG6adyOJL9geeqj7e0aXzgB4ANMp3uB8ng7POUfX1
 JKd26yBgfI41vP+297ZHU/j+3YkczirTylI6ZIalctUJyT4eBWN9xUaIwNOcGQL7Qul0ahX207C
 CtDKTPLlRGwjUC8QlUceiAqe/DrV5CwjCOXDS0loUqQBK5LQXrXTR373gGq7iW/x5X2iab3Iaj0
 k7+bIQNpIcK1iUJaL8NLnYCkM1Fdp7jDx1jVLv9U+4QGYxrIAC3BWaR055KPlWK+8bk9Z7nIKKo
 D8bjio/WeXujyhxuoRhOtcEYH6drV1C2/YfVkpzHZOorUze3wquLDORn25JKDeljXMxt5RWYF2n
 jIRst+/f1v0Y5vXXvBXctdm6IOB82jilGlg4ugsQWFiQwqrcmgNXQOYloQPdMGipSHC2GaQQ3eZ
 VS8PtnsIwjpYhzQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add SPMI node for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index a259e5735d938cfa5b29cee6c754c7a3c0aaae08..164940757d446fd314154f83d49fe8b308757199 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/pinctrl/apple.h>
 
 / {
@@ -220,6 +221,13 @@ pinctrl_aop: pinctrl@2100f0000 {
 				     <AIC_IRQ 137 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@211180700 {
+			compatible = "apple,t8012-spmi", "apple,t8103-spmi";
+			reg = <0x2 0x11180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2111f0000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x111f0000 0x0 0x1000>;

-- 
2.51.0

