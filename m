Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EAF302CA5
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325734; cv=none; b=mKum1W/HImUo0rJpYuq3QjFFx0Ua5k5bnf9ZCQ1cC0rsY/PS5rYzCuUEl4fbbxaZnD1gxhNe9TX/j1CbMTSBroSRuQ5QSIviF2Lu2nW6WFPmgQJZgQRgvrzhmPt9RTVI8+kZniUXxhOZXSRzX+iLY4+P+zdQjeUS3pVhtXISr0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325734; c=relaxed/simple;
	bh=K4a8tKqeVL9BaqFzY33bqex26zqvwpxkE6HkJdl3Qlk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7rY/63wkHKeFtAuXUCCWmc+/J24+4PcXqweImXIrM+Nm60OydybumWXGuBdwZaUARGkkuDPhdiSJy5mqCZrrX6mXW/Z8E735Lu69SN059fvu+hO4Fl3fTYx1iv0GHjHTIHMCdqAPkCI1zIDEdlqSSzVkNAgeHa332Wx297dpdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSUq0Gj3; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSUq0Gj3"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso3554090b3a.1
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325732; x=1757930532; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7llkAP8rKH/Oo92VHhR1v/h5PxCOy9CRKJV3/2nzc+0=;
        b=eSUq0Gj3jzwqALOX2xlr/LL8B9JTVjCkZVBuhVkg8fYDv3bdhdRY/LB7xxAirJ0pJa
         C4fXgGOQQ60Xmq2XswGGvSgH8ufDB2oRxkZu/D+YeKCgMF2OzZlluicQ+s7++ImjoqdG
         3biNTTBF9YV1DOSwhithPRqL/+P4TmX26bFgYD98yVhCwr48fj4RZp4mfIvv+czVmPwQ
         Fu9lKjf3X74xUVrAvBcR4inn1lRtikOqG9TnlQ+SpSjst+xP2tpIzw+/e27aoPnKLIXj
         bkcSJKooq9D2rAMnle4N5w6jEgra915pnNJss7fTR3B5DsBN05CCDVJOXL88/ekpkbSx
         xMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325732; x=1757930532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7llkAP8rKH/Oo92VHhR1v/h5PxCOy9CRKJV3/2nzc+0=;
        b=jlQY8cTZnhl2OhrAVjQBLen40X50Ri6wjBH0omJgag3b1Xa+Rr3YrIVOQ4zFguLUFY
         rUUPdfJFE7t6T1E7LM0joJ6ICupHcIKc5nBMe13V6LMoVLzXIZnnFT4emweAR/wwLQ+w
         ZG7VpBQuZeb6fHk0eexsNhz++BuRciCy5Jij/QaQPNfchM2AXJ6dTIxTstFlUoGRox84
         /H+3V+Qyz8SBhdTVN8XN+nCP0efJuBoPp4GaVIc1ye/vKZeFFwBi8S8h/ir/MLQ4rKZt
         7c+3SKzVjugKl6CoGUkWiBjxEMDfrlIdAfIuFrWvjF/GH1UM2b2g5wkxRMyYMS16ZNCU
         giEw==
X-Forwarded-Encrypted: i=1; AJvYcCWMU16NqeNDz12RJNNDd9vhWLz9mKCfb0lj7TUnv7V8IeIXkrFEbZTxe6RkHbZxRu0gpxRsCA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw+4schz9gftvG/hZVB07bu0rB+1JiUlNC8/PB9bgl0gQmXViX
	BdZsbJuvIanILD/+nQL8ZlgsPYmicYmCNf7EL3WMOwAgm4pWJGNASsvt
X-Gm-Gg: ASbGncvf+h4spedbUQYjFPJ7t+EAvgw5rwZ/Hnsu35cooJK/eSBH2VLqGbt4PNqIt6Q
	hpktCAm6lXDiP0eKtcMEpNNFrPTK+3nxebNzQZytbbzAeO/PrCAVWjlDyzoQ0/VUCMx6Dk9b/9E
	DJaRKBwME76dL3I10MQ7Bn7CVRtuhgoccr4dlYRPoyqUQW3BwqTOxSXOjbdSmHOwonAysKXE+nz
	ulwHFIih/bXyfJzugHz2burWgYOAyGp4yWLm3d9wxvbBCy2b4ljzP73+Xhzg2D3arbtfQzf5Otm
	YoFvNLtVi0oEQFgaykADylruVxrfZfxDCUTMKXQA504vnVfiZJOBPxdmDE+H+nYGw3yeGVlBWeR
	xD1jftnpvMRyVmVUskG6OwyhLyMw=
X-Google-Smtp-Source: AGHT+IEaOR8JabCaDSqwAtyIemGzOsc6AZgodUmn0wckrYMNjPfuK9mL35dB35gjVYmM5JcfKOQZtg==
X-Received: by 2002:a17:902:ebd2:b0:248:fbc1:daf6 with SMTP id d9443c01a7336-25174c1a946mr104229935ad.43.1757325731677;
        Mon, 08 Sep 2025 03:02:11 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:02:11 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:43 +0800
Subject: [PATCH RESEND v8 19/21] arm64: dts: apple: t8011: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-19-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=K4a8tKqeVL9BaqFzY33bqex26zqvwpxkE6HkJdl3Qlk=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlFIgN7AzA3zsULl1lyuey9+Dz2gDXqJtM3h
 icR5/bhIDmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRQAKCRABygi3psUI
 JBapEACWJrARmkX9DGZE/hI8fBIDDVdvy5/7k0/9TyFg3XAvBnwIfD4gBCmipg1RtK2chXwzIYd
 YaTCB+YhIraduDc4zMHrItEUQrBaX33oRcsQDoHpIpl+8jFgMvZYejumwotCnhMhIyaGh9XWMth
 BoHK0bf5iUzW+nPz0CB21tD0NAJo79uOC7JFpW4fwteovhN3wvW3fglcBEIfI8jbBmIuuK2IGA3
 5qVD20iehJRzt2M4du+V7HurBDPtyUX2KaFAEjRe1wogOD0xhM4/9VGyawrteSzOkox4xiO2sKF
 PoTkTaVQfpzdtElEXr1iGzHF/OtV0aPdX0fDk2fe8+HmjyFQOWp+0uRAatJZgITH1FzVgnFzh4p
 WylgpiQe1iQFUAK5mTk0C97CgyZPvwGMVMediKAgqMHe8X2p+G0ksahTxNQsObrXk7yAjRrH4o/
 luaaOaUh8cdD+0eICfl46QSRNKDF8+t0sqodYZ5xflNgYde0ZQDYQTAdNqa5ZQKJF9vZmz7Hegz
 +FNTK20rIVVj7M1ry228bt13K/mJLu5scrNfRCxkxjUEUoQYodkQQwtTh9p4VN/+I/yEc8+BMVz
 xrJOcOQTAyDnPoU+Lu9BfP/B+3Zg+TjRBqSukK5GxA6VDVQp1t9ONrJWGHUjr+zI32iNzeIY0gM
 IP7d0vzBi+hNEvw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodse for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 974f78cc77cfe28d3c26a52a292b643172d8f5bd..ac203ac4d6eca75655cd590deba5c361accf2375 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -253,6 +253,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t8011-pmgr.dtsi"

-- 
2.51.0

