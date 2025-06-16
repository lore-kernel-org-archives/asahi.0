Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0614A1EA7EC
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 01:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037595; cv=none; b=Pjtloktn/z6mi9BpT+i45G6I+TsbKA4jEhaTpx018rNdeGUFZQF/Flnbz/4XvZ58TAcCz1cQHUb2umi1qRAeDP2rl31RxNWMnHZkBeET+51fKsErrq/dTIhBjggWVJ6aPXfJCraItbWICV7kpKsdfip7WHBSGVLt8UxiM4cmD0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037595; c=relaxed/simple;
	bh=kZviMfYtRCR7gR5VoFkDRwcKeTgAqfWp35C3egDQLf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gi8rstE2A0yGOa4TvYqLQ6Ci3/F58ot7zrNJVH2KWVWLjRvHPxUAIwmiRa8/9GXfdpDy1TpigBhyjxJmnfZ27h7yAWMxHh0EgmQieYMWGohBytVx7v4P4ABkk4UWPGP6Xz19y62hD7tBlta3mT8DxNb8Vj552gkqkGWehfYAnm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WsKMdJJs; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WsKMdJJs"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2350fc2591dso35519925ad.1
        for <asahi@lists.linux.dev>; Sun, 15 Jun 2025 18:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037593; x=1750642393; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=WsKMdJJsf1fwBAAFM1ObJyEvqYu4tonvKRv7SBw6kR0abs7zHUT1Xi5s4xInNRa2lj
         W+krgSm2zlFxW6Wh8Wy6DecxHbltj4gGL4XeQ0VLg2BKbv+cmjfdQ25bHyvu67gItQHe
         Hh+V25h/mGa6/8dsHQyM0zW6JlniSEXKyWodqsSw0ERckb5BCndXW3VQ3+eblDSkHs60
         G9YJjSKNQu/49NRN8cjCntjTwDuW+pVouJNUUsalnYd/d3o0On3ddMD9xZZ7h/PbIKtw
         hQmuV4FsDCpklpUGyzAdbdhucJDgfvMNn9FWPbELqnPyNnRmwG+sA471We12/DgiuumD
         rzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037593; x=1750642393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=ciOBF5y3dBWQM+07wNiISR2Gh5Qa7Kd+ECWkNP75KfYp0kAX9+VIxEp63vSVn3ffMe
         CANyxZmEzscJd1Frvvif4pbKiGYBxasVen17X9bOKRHuKvQ0LdOIR2hyoLxivWwkzp8h
         1sMR1q+jBzVbEdNzG8uiTscaY5Bqim3c+D1LSpYO+oCbHSIEw0m/KZG8YzwSPjlXiPny
         3ih0aY2w9HJuPaCMKuFI4Q9zQ3Ud5f4ZzAo+n+LhcjLisiGOzAsKjxhu0fo3oR88zQJf
         XwOFibpDa0Mxu4ftwxSN3+M820uXcyAALmuXaNmhxkJp02fSdWBh8LNPtqmUwsC87uBm
         H8lg==
X-Forwarded-Encrypted: i=1; AJvYcCVlXKMdAslPsBB2BVur0HIEsRVhKrLaY9nuQrgI4O/rF13FpvROkn8pBXYZVOmbjyjilR49Og==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBp/NLdm+vm+F6jPHMFd0XAL8vPVy6ckGlceymi74WaFdgLEdi
	wjOBL+03DkBdoBLXdp5BW4lhIhk/omAnpvIRpiRnEFWY8QP/zk5TQR7R
X-Gm-Gg: ASbGncvUGm1Sx+QySLk2+s2cPBn233BC8JQErJW4J3mNlQjjlGQZ3wLEd8F/dlqq3Y3
	fwUNpuXu1iABCXj634EOs7hEKGvb4hxtRtVaGiIizDFzlmjkcT1kMgXiNJkKzZwT1X2q6bdcQvF
	qRZuWn/XRzzCDsyLDMT+vUc2iUIaBOIiyUdnDpKEagLiSkhII067xwClEqlyxLuEWUizpmAc70c
	uvIKXlVPSxeiVQhyUkIV3dcRspZkzgecoe4Cyq2ouyWroymJeFzrc6QImSv7ciKH/0La32bytH+
	8xAL7l157ELYdT0ZV0CCv0UWDSVWNQhI43G7SfE/+BFxeoi3WC8FBOFVNluu7JGLyd0lPlBAYNM
	oXCk=
X-Google-Smtp-Source: AGHT+IH8RHIqmgqFH9/PYcKJWUdxyaFMM6Kq/4bBmlVBjq5NMwMgObIJXACByRuQ2ziPGn9ASPeGPg==
X-Received: by 2002:a17:903:2ac7:b0:235:278c:7d06 with SMTP id d9443c01a7336-2366ae00e80mr122624655ad.8.1750037593408;
        Sun, 15 Jun 2025 18:33:13 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:33:13 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:07 +0800
Subject: [PATCH RESEND v7 18/21] arm64: dts: apple: t8010: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-18-df2778a44d5c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=kZviMfYtRCR7gR5VoFkDRwcKeTgAqfWp35C3egDQLf8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QZxkPB9WtUskYsmB64PvR/FecyGxWdQ2YOL
 BsUBeRO9XKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GQAKCRABygi3psUI
 JG3eD/0ZWUsTwgTP6BVPRrhBb3M27+1DBsSZqei3zPBEAKmJHMVVMj1eVHoAGXno6RUOXd2MgZG
 1IpvY/dAJ06ulttFowr9wN2W1ZsdWANY9km7h7VSPfmcb1P7qa3+lKXTH/e9xvEjYuA79fiw5gZ
 +e/1mqV++Ai79/O4lA4m6uNHyw897f4dVQDiOwS1wPxFQwlpQZl9a9MN8ob6Pz+AZ/qYky9ZHBk
 RIZGmtroWuzvtOBsckFAdNLoaR9gzloq2VOvzqJzDrQLcDvxFirVy5gTs5jf4czv9l2iR04VxjR
 ATJs+PEXNAX0FaXKSFhpfFoBEzQjxRP4dNmWaUIjue/p3onMJ28G2cp+DR4mzI/gAGwA9ckii4v
 wPsRx6920SpmSLx3JQ27TTjQPm5nPNR7qejV+sXY44NnSicBmC+EhjY8DxKKTOfpePAm4T1EyKc
 Ku1cue/gswf9Uq92t0l5VuetQ8GvyrvLGghtQEy/qkfngMsV6ew88xqhXBuU/JdAjU9+p1Oa6Sk
 8jUYYAUqIrc1drr1vEU6CgNqm6qPLr5UGjAYbdpXb/LQZGNhw/QStM1HPgYzvbvs4L+E6uk4jrI
 HLqbrhp16ZiX/6uN3AS78HU0ya0IStsZU6O7awGVzrvsx5gHvH0y9Nrwvgo19VcmQT6g8fXxILp
 lXTFuPSNFf2jraQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index 17e294bd7c44c7961cc3ba0ec5f4178840d5b9c6..cbffc84480379cb476d5caaecce91f746e862354 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -243,6 +243,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8010-pmgr.dtsi"

-- 
2.49.0

