Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56163286425
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 01:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037599; cv=none; b=U0cu9AnVPAWJoR6D2MdN8MTzqBSo0ygPKBiKOhy2G4wNY70uHOGiP3npYkanyErmC6HENEi7c6OShaLOjQ5yyRk4HCg0HzCOGd9oo2at3bZ8G7sVX8qms1OYVIz7Jl1Vtf9QTouUo7v2br59/pmWZjavhC43kIDXavzcNKirP4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037599; c=relaxed/simple;
	bh=ZNIQgw4HnW0u/JgkpB+HMZ3DOfGGfZVMtPocokF3spo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YI4ecCgNkC+Gqg0O/VuTebfqlMjJ/i9LQ7rdNVRMhfkSgh0/6N0ctO8+FBKZ3TBVxfJUClMez79KqUDKsUb5R7lSg7Onc48vpXUr06tGsIch6hTsJum5ObdjJ1s2kCrsoYnVuQIWYzOPUwLVRp+lgacFDv8YFXmhAzj8UFOCVsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSh6qXVv; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSh6qXVv"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235e1d710d8so47751385ad.1
        for <asahi@lists.linux.dev>; Sun, 15 Jun 2025 18:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037597; x=1750642397; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=GSh6qXVvC+igJeKs3y1C4TK+FnBzFYktym3HgTjStPcZAjcE3xnSGdJm/QjvE2pmLn
         VTLaqELJZHvXvLATS0Fpg3nMEfXcL30GdTQrOxzgu86TCn9dAmWHIv9+70MAdZMt21VX
         JVM/CQaCfbwlNMQG1HMgXLBKZ884FIqeqlII24AKkbcj4V4XDVCr9W/1q4ZKxbcuyYDM
         uccMfkb4HfCco9ldfbvIUNuqJlt6LNLXCF3y2ZoZY2TqgcMhto9g3iX/3wBLxU0PZV1B
         2Vns26xQj2sHydGdp8nPlBNsAMPKflk9tuG73VctwEOFcSBuOq54V7aaB+NSuSo4Oi6U
         xv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037597; x=1750642397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=GOKkZbkvwj3nXE8i5BhAM/2meVYCm+www1n6AXbLNWCebOA78QboANyUMwWdlKfyhR
         1rDPTqPjQyOfsoug6HDGagx6WBEx23R2/cqhYrK9LSkTWRXUqCiXrDy+gvilzwAioe/X
         BL4DS1OmC53tKiSsPi1SpZSoNZe5JxsOSQ93NT8lxdTC8xYSW5f1DW9NXttWzAyrLfBv
         LShHFTO0FWWk8zQ5mBliqWIp2pqOAdtsSAM3cKMTOKaoMeVnnZ8mnL350MBIYy9Z3O5i
         XiurRBX1Q6xLqtYPOzoyXGI0ba9IYA6UD5STunbAO/Dq/I6anywJpkJjoIUHynjt3MnB
         RG5A==
X-Forwarded-Encrypted: i=1; AJvYcCVTcWqcqdAwWrz7MFUOnmikVincbuN0N+NfDH3zmeX8WQHO9AY7GAOl1tfNguhlTbKpoXwAtg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJqmXSnGt9NqvRBye+mdUVry9rj4qX/Nuc8h5SOltFOl2yi67g
	dHfGgrzR1ZuzmOzIu13hjwp/Z6eXDIxZqqEf2xF1+na0XKUTZPpLrcSJ
X-Gm-Gg: ASbGnct4xBmN3o/o5QXDEwWS07DMavOn36/kNOru+MEjV5A+i4gi5tLLnf+KcS1++3p
	PelDS6ImMXOIR0NCufUZHvjlmn6OQNCiDiKi4bxBWfAhjxrpkwCJ2ECcTGA91HIRcIa+qkItKsr
	qY034Sz7PcrnMApo5Wuht0swCj8GH1QO3D/tczozDgoYEnpSx1s5IM5YMwuo/g77W186Z3r+3rE
	7lRrRCoCXhHv+ssBu3LCzogoAJ+czo7inq34dvMqxb7HTC1a+IYv9cbVGvpjN7WrvdZEAHw9tSD
	kuoTn37C5Jude+pWYIU5Du1QWzJBzAtONo+vOTcYLey7NlOYcXmzPTIT085IHZWca1pM/cjzWgs
	4kKPDA7RpSLaH7A==
X-Google-Smtp-Source: AGHT+IFC4kmacTH0NlpuXw2+AHIez/RWDk16sXkzaRQ7d+t9yRZVbTRSeBAnjLskCJcp8Tm9FYJVhg==
X-Received: by 2002:a17:902:f786:b0:234:986c:66d4 with SMTP id d9443c01a7336-2366b3df1bbmr107762165ad.26.1750037596711;
        Sun, 15 Jun 2025 18:33:16 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:33:16 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:08 +0800
Subject: [PATCH RESEND v7 19/21] arm64: dts: apple: t8011: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-19-df2778a44d5c@gmail.com>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
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
 h=from:subject:message-id; bh=ZNIQgw4HnW0u/JgkpB+HMZ3DOfGGfZVMtPocokF3spo=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QZWdhHDCiZqkvL5f6HSoNB9nSWhxYFVv8Y9
 Q5y9dGYYNmJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GQAKCRABygi3psUI
 JAywD/4t8Ntu1bnuUwZ9C2UgMJtMiWBnFnEccj46criNwf2bRK91G23yflsorhR+WyOJlvMVPUx
 BWM09BOztn1FDKIKjQEz15R083BGOlEC2TVI6oxhGiuDYmyG1WQBugsOcNsi8ZLs5kZuUZYsd3y
 0gdo6r5UCozs8OU0Bp0YLJ2BZoansPF7XfL1Fr0yz4FI1ukV7e2Jdhv4bpd70CU2ihw34FajulR
 AVzrNQi/ZYuuFGMbZaAk1ON/lYxjffEWyBkZIbbFgN3x0doi+M4PdtImZde5KQJq2ApUhzsFPzz
 HuhngbjIs2sGlUBwE1dWAvPYF8tsagQ1Myx/vgdDBUGMdvbXEeg3oHmHJY1BI4yC5e/8jvZ1y+1
 c2p5K53d/aGrFGYpXzDtyekmmo5nLkGX4oz/vFvyx//ItHiO5UdAQZLn2soaZuef+6/AGk3u5tm
 udgh4C+WqOh1lIuqX+FkYDzM20877vZFN76TJxN9Sh+RLHZOM4MsCzBVS8LDNoSEaomATSLDbKD
 1fQ/6TrTFedYy6fooLi5kumNKnBo96jAMl7i/s4OKSq64X0LyWzRZrtJrphOt7+OP0XnW+b5iCk
 8KWusZYlyiJBFKXCvHZqyWqBXHUy5c9PMfbE0VuNUMOtFH8Zb9sjetrwYiJrRdXo7XqFePFWKCS
 uqNAR3lt5xMOQEA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodse for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 5b280c896b760dc8b759bf38dae79060e34dfc19..7fb3ab738f67583d9a19a542bf36ab2806268d55 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -237,6 +237,15 @@ timer {
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
2.49.0

