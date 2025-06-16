Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58562853F9
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 01:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037592; cv=none; b=ggDhFcdXwAj1+8zw41XOusBPodb/KNPPnf5Z4hKrw9vu9mcL1eEXJV4d1WqrIQ6uzxOSKi08daoPW3KDoKMQrSaXUKnBmWEqT8J3Fq80s8UhLasnDbd0BVAOVQbJ4FMNHQEngqWTgC4Q8aL4WYiTNSxcfWy1hpSqcgPUOWcRkWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037592; c=relaxed/simple;
	bh=umS18Mpui1EoUACcGD+WdVdka5VgnqwULsO8fA+OvnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dhCYDIssGTJh3JtIB5dOJ2HTOATduGxnte1Ybf4MLLe1A0kbTB48hYlIO/oRkxXd7cOPDXth62ohZmGvdyJob9LpkX18R7x6LxBZKp5tFNLWRQ7jyjAHoJ6ZOt75CiYsY5HOYZD57ZdiydMQLzOt8LV1osTBugMKCHvLT36+e7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FOTfhQ+m; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FOTfhQ+m"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235e1d4cba0so34167745ad.2
        for <asahi@lists.linux.dev>; Sun, 15 Jun 2025 18:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037590; x=1750642390; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=FOTfhQ+mVFq5Gk8n/9A7ZZZ6vWkYezn666mgN+IXSu8+VU4PGiEaNATJBeRsPdYmWj
         tSDbU+GVINJRnMIDlrIu5VFeV5541tcTYRqJKmA9EgNayXlzTZrHlRLH9kmlvwqX/zrd
         kXJlMElNjABnjMi6tiPfPROFWL+ChSNYCvvsykTxfGj8wKlCGRIi1mu6B9oMMX9OnLBx
         /s0nQ487cJAx80qFVO2oh+WUPGKZe+Pj88LDNHBEpVejWL/FgJGphaef2GUcm4BGehun
         p24JJL6p/AnynAO7QSlMVgaB7dzoOdsCg/4mDPwD4cJUgzkq0zN+CwfLg3IjpQzk/yky
         AjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037590; x=1750642390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=IG4iKsHvVdtHPQaw+goYpSpa6MjpWwrjrjHXsClkZfk2I8+sXLdtMfnqVR5p7uc1M5
         Md9Nl84m8S0/BsN1sQeOkv3M4Sk9u2ut8826FaYfrmS3nbsTDHYqfL/sFHmeO+FKyq8p
         p/61v0SRl0gOfAAyUdGAUrNgMULfJdz4nTDl8Er0kUL+thX20U6V3Ya7nplPogbOc6lS
         KAUnhCXXshGECFm8JPwlMI27bpS/NHNTLrRxqMToVQHcbxgfMvaJAkLdH/fxM4S1ml8p
         S1DGVLDKK0iVT4I1c1kprz8m0mHhXKoQ8fA4tcbPjJjYuR5vZdLyKtDdXxBQ/medBKiZ
         vERw==
X-Forwarded-Encrypted: i=1; AJvYcCU2pds36vblthcAlf45oQImQa3F3HpcrbvijOgbHq1iLoC+Tf3iYsP/FAWjDP+Fq1jAdCY5Cw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy95R+M0o8vSbXw2/KWj0piBG2N+DIo2unYMPSsgdXSGuhnMms0
	qU4wYOpR5k2Zrae2/Snru11cA5FJbNMeFDyVzW9GQPpWUxOUkDawsJ4v
X-Gm-Gg: ASbGncsk0lyIjKZQFkmwgrKS+kj033ssfbK11vLODqukbj6VbHj2JswI0kMHWPrOd6y
	GivIfh7hqb1oLdtpeszCY0xnsC7N47UIKMXfj7tQWV3EDiFx8CjsxT9GIoQcyR7k60fa+N9XDiX
	hjM0ScXpa25Hh2YqoISMn01XHFinZvZ8wET1cnKp8n5cMqj0l2WaWEB+8jGreAU7QENx2Z6AGw3
	j6eZgRv9LawRyGLrkqvIij9SLKagmEjxWTtWm/m2X6kyHQINGy2/FPSpphTl2+Unub+lAp0O3xZ
	nk9a+kthiS9KhmKZ3z7I3XJqqnNXBbbEW3vdm14h4EiseaglP3SxRwhKHXVgadLibo51h6UvptP
	yKFfGgP7UkttAnQ==
X-Google-Smtp-Source: AGHT+IE3CoHqmpfLy1DzF8kDoAHeOUuTULE+bjRl7YCy9LgCR6uXCb2k/LnCPpIUZv7XDGB11/5vmw==
X-Received: by 2002:a17:902:ccc2:b0:235:eb71:a37b with SMTP id d9443c01a7336-2366b17c413mr110186025ad.46.1750037590096;
        Sun, 15 Jun 2025 18:33:10 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:33:09 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:06 +0800
Subject: [PATCH RESEND v7 17/21] arm64: dts: apple: s8001: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-17-df2778a44d5c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=umS18Mpui1EoUACcGD+WdVdka5VgnqwULsO8fA+OvnQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QZQhUOZouPvn3IHsPwwoR4uGTf/Nhz2lJMe
 hJ2wzVTKkKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GQAKCRABygi3psUI
 JIdMEAC3ItExFqP6qy4Q2p90/jpYVFMlGe8vDrr7GdPt6sPfMPUziMg+wWWX+44QTRWBUdKLbrq
 SyNFEuUG2P/Ll5Au4+7I/kArzdCAx65VfuN6Pkm2yxndRGLtnxpQT4yBPoaTfzv0OIGIXj4f5Ab
 JcAAeb5+N1yMPskCCid+MjxAAUDVAkXAbA+yg1DmdqSHrcgafPoRjJMqn0Kc3ozCePU/lIG0w3Z
 MxqIQprBMRxoupCzexUTRypr81q1MyTKF5LuwgdvYPHTanABq1kWujlGu/34Ik4U1S5rg+y9cOe
 YH2GHSOkAQ5ZJRDfmBtbudkgl/Vw2iuKUhi8xPeAzUQQxGAal3pJFfPa4QAxPp1yZfX109KfO/Q
 Nfzv0pFTl3ATI80a1MmoXX/6eCAXCNBJH4fI3f2XQBLH9SYKw3LK9nePx8mBzIo+SOURZHVUtZN
 7oBQL7qZCS0dGEftVMDWjcm1GhA34O7ELjktmBbI7dkwyA3TfyL0KL1E6UhquqotEuh5xvYRePX
 8bmW7nPsYlg6NhKJuydIOAHMHiApGsN0UVVgLXPwbih9561APtM+blVDQDWUE8Fcf8gkT6v4sMn
 vLtoQ3DSxRsNgMau1tpASWTTHkS4HmEKvJ8CpSthb0Vx8oljvCpTrKadzHD2bSPQIr0xHerThJm
 LuwvvRayA9EYP3A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A9X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s8001.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s8001.dtsi b/arch/arm64/boot/dts/apple/s8001.dtsi
index d56d49c048bbf55e5f2edf40f6fd1fcff6342a9f..33760c60a9189df5491256f81db7f413cada27a7 100644
--- a/arch/arm64/boot/dts/apple/s8001.dtsi
+++ b/arch/arm64/boot/dts/apple/s8001.dtsi
@@ -209,6 +209,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s8001-pmgr.dtsi"

-- 
2.49.0

