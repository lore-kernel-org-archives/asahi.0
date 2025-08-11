Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BD12E2F1A
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920621; cv=none; b=sTx4KywqRSzqy32xGDDi0cUrytGoBCAyU2UQhTOiT1Vu0MjhzChZNgVgoUZJVlf56X2o32Uy7E44XJqMWTInrMKn3AOMTb5LsZRJgnIWDUfwHTjmLgb5ElftcrjWyx4Bxh1R7YWqP4izKz2u/JMgj6VUPfk71meNww7PN76JFts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920621; c=relaxed/simple;
	bh=GdMW0EI3NHNWYzWITffq+4XFB8Q0kMqjZtAqZZLmfYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=re4C9jBafDCbGMdJnjdnLug27izPaDlQltg+CvFJWPrEo0V1fxAMtqf0/n+k+0+/k+EQS123WyOEFh8s9R4vc3Hpov6NigH8N5ekmdmF/0A0QwkKWU0GJPnhKbEmkHQ7JKVcizSq4VTrVD49UXE7VxhnjVcM2GmGdBut7aOdeMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaCkdc7e; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaCkdc7e"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23ffa7b3b30so40359475ad.1
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920619; x=1755525419; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mvqlPWZhSdmmiWIigJMbDMqEPBNiuGmslU3U6YrJSzM=;
        b=PaCkdc7ebKHjoJY7XzhVWzfvC425O406xfp5UFo2qzCTfqzsQjvWBHmemHLdXh7oC9
         mrABS0J1F9yrxavBtr4l3TcFkPayTgiojQOZxSGhsq5XlMqf22W2dYHattiL5jTCROoZ
         PH37psk8qe9JvCD0DRDh4j74WUo6/57NhiL80ccBIUwQEvY9L7PwXDQ7ygheYZD/OPyY
         gyz/2itWxcsoKIrjTBX3NRrJqvMm1YAKu0dVlKvaoxTlOOz9JyDtFKKJ603fm32gK4Na
         odSiPHeDuB6XkVK9lW+kOt7VtBF6S1xO3YBMF3jChnou2YXFHj+fFiJgtlR9uMkrJh8L
         DwiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920619; x=1755525419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvqlPWZhSdmmiWIigJMbDMqEPBNiuGmslU3U6YrJSzM=;
        b=VrARdMqqkfNbgUV4/6jQt+ggu/1V5SmqoP9psdX9WGRizgInVEeI2476oipdRu0I71
         INvQrxy2jMvhdUQfVxws/EEPkvnoMEm0ai07fmJqw+2mr6H0bk7kxaKcN+nxlPLM1zt+
         sy6lctdUKO5pl83doQSWilpuKq2PpIPVZpZPuLZoVZ//NA4lTTA44IQIN7XFd56kc5uK
         It8x1deEsDTPYXMf2Qw8pq8mImAML8f4/JH74wEtGwg3UlB7o4A4cPPc2NAC/vCqVonS
         sulOJGNPGj13AL9aDZ0eqTBdQc/Lp4YOPptPXAGrPDBVpi/AF2zCu3G2k0yQpe92PUc3
         0ofA==
X-Forwarded-Encrypted: i=1; AJvYcCU8WgMutQQI5z8HJS3M8ptWa5FVr2w2T3ToW1PlrN6VJZ+lti+GfDVUMNHQ5hd95pquqhiTgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaUIlFwWfuJCSbYLWd6O0zY8pnfsbNFIZglcMkPzmsOTq+f9b1
	MyR9uxImiGbswIm+OYkDDpgqEwkpylcDUvvF+uQ561t3A/SOtfM2kEBp
X-Gm-Gg: ASbGncsgendZj48Xl6jqtJTb8uV/ImJr/6TmiP0Ib71hZQkjX+gIgu3n8afHDUmOJFp
	GvxTv+sWmdEH8Scr1qNjEaUcDV9R840y5Fob5NwtRnlshL0S0bDd0/PNnsjHI5JumXZBC3VYwKq
	n8Pf1UH3+DoQFr1UamyjM+3PORAWH2xXySawoaYOmhIq8cZs2m2JKNS0CWqCDk64tAvgbvkCF8w
	jLXvNlf9j/UAE/eDDKVIPnGhAiYUZAuS9+A2rmXFERKqkDcV+PZPgrn/t4gTHSC9EySZkCAMTlN
	DjrkbMl8HZ+uo9G5769L/mK/Camu9i5FBrxUhAfo4xrKl+PqqgUCl95E2/34iJOiHkQvgDCTn6Y
	VxTRkDF/8JN2KaTU5daX2XhBBSyk/4OPPUuItykBk224Pqz8=
X-Google-Smtp-Source: AGHT+IEsZJ5knQTrKEOjLGhLHALuJ8dOClagIoc9Tqof/fNLEY7nfP5yw4HDIQc+QGY8+JZrhHKDsg==
X-Received: by 2002:a17:903:2310:b0:234:d431:ec6e with SMTP id d9443c01a7336-242c1ffcf60mr188601795ad.3.1754920619514;
        Mon, 11 Aug 2025 06:56:59 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:59 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:53 +0800
Subject: [PATCH v8 21/21] arm64: dts: apple: t8015: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-21-c560ebd9ca46@gmail.com>
References: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
In-Reply-To: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=GdMW0EI3NHNWYzWITffq+4XFB8Q0kMqjZtAqZZLmfYU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZDmmr/1Q/2JTNVlaKiZKNOFPyBC3d7E7Vt6
 4mnI2+zy56JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QwAKCRABygi3psUI
 JExGD/9OkeFtQH+ZC/vyytS7PXJmuvmPxNfmDu6U0St+yQce7QtoCz0Hjo1q0rGhX8jmGit9Ex7
 k/pTldefDseg+/A2BusnYnfNnFSpFaT/6aNUDHDnw+D8ytRf4k3bJyk5SLD6Gzii7R/YSIJQbvM
 j0BUzrfkvSeCgteMUVB9q2sNXDYXYzcy26IXVvyOY6q23GAY+icge4aBGxqUTDjommhs5gvfGLS
 XseKSzF3wZXjqz6MMb1JWsQr6RzHmjVdR1uBW1uHTcfzzri5B+xUKDoPNpx9hmsy6hqj1YcdYHQ
 yK9yJmFoJ8odHHfAzc+yU/Z7jCnbbEVIVuP0+MtY4DusP9+KQXE8oAL9sTxbmDXl36gjmv4KPY7
 uWnPaWvwzRfgqrrAjVWW0xY44DX+zxb25vKFOKpC58aW35SQiHYjm0JP3PxKIy1dZjSSgDg89FO
 JQTq102JSsRBkubQFd4Yw5IGJgHCA2yekAg4KvF8CkZ9Tqk7RcW3ITD7OvCe+EexBMwZYy2ZXzi
 ulxk6MthAl7ZyFWr/E36TdCz9OZWnscCs6REORxOt+b2/9VrGRdpvCv2RdIrpCS20X34UvXHS6E
 U8ePNjBW7+mq/IQibeih0n98a1rsymlgDjH4K1HAXS/W/7MpdPZoVNbG2Th1AoBC+5CLsWJqYYX
 kImyKMr0LMMykrw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..9bf5157f0e504b7394ef5354411d3d37e8d5760a 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -284,6 +284,18 @@ aic: interrupt-controller@232100000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			power-domains = <&ps_aic>;
+
+			affinities {
+				e-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_E>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
+				};
+
+				p-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_P>;
+					cpus = <&cpu_p0 &cpu_p1>;
+				};
+			};
 		};
 
 		pmgr: power-management@232000000 {
@@ -412,6 +424,18 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu-e {
+		compatible = "apple,mistral-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,monsoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
 
 #include "t8015-pmgr.dtsi"

-- 
2.50.1

