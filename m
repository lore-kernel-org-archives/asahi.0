Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878D22B8C5
	for <asahi@lists.linux.dev>; Mon, 15 Sep 2025 01:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757901183; cv=none; b=uTLRV6sc9gV6/05m6o73nWEWQbZxBwi3O4x0Is7P/Wvvr2tYPMbhBODo4QqUJMqNSdiEgIghmp3bTBRqQy5smBzM9R/taZdNmw67+UNfMlaZHmrmKFbweSjQBKH7wVh6YvqSJWPo0lUcmMs0pgwthvKTjtNG7oTRJOiz3CrpCYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757901183; c=relaxed/simple;
	bh=JIsMKYVvFErbnKFHO1CrIUXDSj+IhP03g/zRcyQzRCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FpSexFLlLYSRfGtc7tgKwOswveyv4/FjxcAk8KS1sMLq4Pf6gWUG2XapR5r099hf+7QnkCUo/bOVugkwb7ZZOPO08sHeRtiuAf9kD7k6MUPlMnQk5F6aOeygUjS9yIlsfy+WeMI8Gur2BTPg91m0oqOBfeWLb01A8tjXxq+x4vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MojsIUyc; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MojsIUyc"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso2455298a12.0
        for <asahi@lists.linux.dev>; Sun, 14 Sep 2025 18:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757901181; x=1758505981; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2A139N7u8LP+PVMXYdMyToSHsPMkupLAjBa9WZQYT4o=;
        b=MojsIUycJlNCI0hQYOyLUYZ6GqBobqt7uUuDd2WSNlqinnBtOuSkVIEfYPcjJW/g+A
         tY3W7sWRYkYBAVO8eAZqBc9MxjnqGn1L9Ye3qJu4l1ky8cJUM1+NOMrabtDMVYE+SQx2
         COvjpJdYY/g8B9TMkdItNlnqanW+SAfBotgBgmGPT9yQhyZROJlkldgX/Y4KY/vqeAhQ
         D5w5RVK87+25jQLpZ96eJcH9HP3GaYyqZ/lFdDgacNt+kenRdcL0l6g+U5SuoLC9B83n
         9SzXY/zv/vO6LLV8AW4rrAHKLIavRuxj5Ayj1/QWALkYxnYKTax9Rey01BB0g6YCLCVJ
         vqSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757901181; x=1758505981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2A139N7u8LP+PVMXYdMyToSHsPMkupLAjBa9WZQYT4o=;
        b=WMMb61om+buOeMvHQmYWHGf3kM7/YX+XGEIZ10YBsAYR0t7dHe0j5n2gc9ypi+xJxF
         1KGHfB1nGSct7bep7c60LWNHHGclXBNT49KYIOtlLbwZW7P68W2ff52aF2dgGGhUoYlf
         T1jiphrE20lbY/Qj6Cldjq5kODz0VKKguo4B4K8S+NK0kC3HlUePbZMUTu45DHNQQXtw
         D4Wh5DeCjSmkt9+CFseXYX+2OYn+p2mjloVyaaIuhEDh+xloShAXb3PvouLHe/Bjfo6Q
         3oHD2blmadOdX/44YSsKKi397vf0kWVCQBjP6+jPJht5bWdNVaALcsUAesMSJuMFOpn3
         FTuw==
X-Gm-Message-State: AOJu0Yyp/oYZuicv7fEJM7hou6eJAH/KI4WewWy2p/3Mzw4MTqnBsGKc
	CccrBLh0HnxtuHX6r1uqfJzGX0UY+DTtETCacnKHDb9/I02vB9SJ3N+H
X-Gm-Gg: ASbGncuMcjDldHjp4w2sNjNAgsR5Upctlv1xU/BQo11R6nmBu6bJaD1d3fjNw9r9bRi
	NehBN9jeoWdwuU5dPudjac12CJCQOU5xdJQ6YxrM1D7GYLwoZrSW69UXpGcyhcN8Xf8o62XwDx2
	mVqNg7ylBJX9Anylds7piWdpbd+FjiYz1YoAUWbxoeZPQzPMlY8PoqzroXAM1Vc3gD1tbFp/nnd
	DkCmSTfo9sFVJrHObcLgK11rw/MYQPc7C+UKILm2bIV0g8cEcKJtVRQw8axp+Y+4IE7z05cRtS/
	j6KE22mMyej9II5eDF2/GzdYPLOtzazI5ejfXvT0o5LOl6PODOF5c535yaAa81vhtHcF2l8GfDU
	HB6Gy28luGEImzR2dl/O04r8n
X-Google-Smtp-Source: AGHT+IEiIX4HMezHoTHcpOx6Y7u2rWpvSIWej8foIoPdV55AIR8hCDNmJ2lq50k/5jhrKKdyqbQP7g==
X-Received: by 2002:a17:903:3c4b:b0:25b:c709:568c with SMTP id d9443c01a7336-25d24cac4f9mr113648065ad.25.1757901180910;
        Sun, 14 Sep 2025 18:53:00 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-262df893ec5sm41565255ad.46.2025.09.14.18.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 18:53:00 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 15 Sep 2025 09:52:26 +0800
Subject: [PATCH v4 3/3] arm64: dts: apple: t8015: Add SPMI node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-t8015-spmi-v4-3-758620b5f2ae@gmail.com>
References: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
In-Reply-To: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=JIsMKYVvFErbnKFHO1CrIUXDSj+IhP03g/zRcyQzRCQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBox3FxPxpSPr9TPi3OX9425fiwK0FE73rPO/i5/
 DOT1UnRyX6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaMdxcQAKCRABygi3psUI
 JLb9D/9ZAEHklb2IiKDO8EAKTpsHj6N3G9FkJ943XH+Xa5OlnHu82KUqRtL05LGK2mPmJkSmpzY
 4TOTy++CXi6R2VL2nhM+XNPf0Cr4seFYc1JupRSW0jrVOKZH2QIJKgZ1jQuUh3E427XtRSrP+kA
 m8nwdmr6foVBiO3VYAScQxk4aHvaBHPLN4enotjeAIp0NrxBbCneARqAcQmahYopaQUSRgjKkjS
 0E+GbN416T6sw/DNFiwhUBix92nuUeXdz75Mb4xjN7TcuKo/U44oe1dbWJzC+MADrZOGNKvZ1nH
 F/KCHi8eka794nMEIdJiNdR1bJ8CYgL4KIF6Gyut47kUHhHcVBD7cIeWeHOfMa8lAbQ1YW38I/n
 I2Elwxit5ziXKe4N9OraDKFwX2yzAsVb5Hj58DEubfnu1gZgfFsyAECECZIEnuDQhWsACgbQlLR
 ORSsE4Rmq7sH4Cfu1twXJrQzqZbdv2RbCP8/hii7vbC5rH2sYGfaTS78chFENQw9E0go1gsjFfp
 4q2BPEw1oCW6XkUe3ea3BRrOGZC1zMJg3kniWPuN8QkcoZ62TfXj5Bi1KA8xvk6KWA76MIM/x+t
 csl7DCjPToSCDMPgRkWQPN9ZU9Pc+gTfV+Q2LD+DtgApqhkrHHTRVNId9gyeMBZovag9sW5X2q/
 J1LiTXb5RxjI0Pg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add SPMI node for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..4266667b23c1c851540a4a68411c50234f228071 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/spmi/spmi.h>
 
 / {
 	interrupt-parent = <&aic>;
@@ -344,6 +345,13 @@ pinctrl_aop: pinctrl@2340f0000 {
 				     <AIC_IRQ 141 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@235180700 {
+			compatible = "apple,t8015-spmi", "apple,t8103-spmi";
+			reg = <0x2 0x35180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2351f0000 {
 			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x351f0000 0x0 0x4000>;

-- 
2.51.0

