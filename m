Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6036827F747
	for <asahi@lists.linux.dev>; Mon, 16 Jun 2025 01:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750037578; cv=none; b=T1I4dfniOp8hSRqG1wQByH0iaGJftuuUJEt61iV4SWmxvwkFA4ctp8szL9/Hzbs8rPWPDzVxvefdFZEjKxzpBT/zJY2VlWAawkxbOv0wlTJtOpSXPvtDTCw7wvkyyRbTpZDyLcev+1kKuxGkYxkAiZjglX6kW1s/KPk5ZR1KjMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750037578; c=relaxed/simple;
	bh=LZ5pN5iqWz3OCuzIiw27nZWBzYhm/oPtBhWwt5qbJRc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPK4a5qimwK+WKs1okf02ayAxuqUKgOOhgyegaYS5S56c6TZQUmHWK+vNxg2yOQA2d7W4XzdYm5P5rzZdCUP60g6VeVfSD9O6SyOYvf8E7QCgf9g3gwcIfwMGNjG7KGV+bTxSeTjDMyU3a41FWPkn2fCfwelM74m4JZF9zj1kew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/tnXgMS; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/tnXgMS"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-234bfe37cccso49167885ad.0
        for <asahi@lists.linux.dev>; Sun, 15 Jun 2025 18:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750037577; x=1750642377; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=;
        b=W/tnXgMSc7h3zEW8PCHww7sdSRzFYsudFbASftHh/Cbo/F1ZDykEdlOs1T/seom2Hz
         vDqYXTeoF+kaD5wr2YTnVffZUaxTRG1Pvz8NTR9sYas8jXKpT+is8yxeGBqfJDFp8Uzd
         7/UcVfsZ8Vz9aBPvLqJNw3707zmzf3IfcZNgty8uvNqmDFZSkeYZHRMMjPnUtyERyife
         Uj1n5JUc+hc+5MZ4uECb7+TaGEJLvvQ4EKZtyzwP02/4x9esFEkSyjJ9aNckl7R7YL0E
         sQbjiKqYtxirDFBC7LRHYizZA3DrT5D7oVTnNieX6VaWAP3fUFSuTvLxPKbQYoi8UkOU
         BrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750037577; x=1750642377;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Pp+kkIFVs4gp4J7ADoVk3Rc5HkxtiGkD1fRapo9f6w=;
        b=MMBpJoy2+KSXxIcM/6jP6YFNqXiIQMDbiS2Q+E72UDGthGTdE9PstiK/euaSXfN7gf
         uQn6i8J5RyUN7Ou1m8r2qlOjThNudFm1iSWzJDDwwVo60ovbTW3o03o2gZqLZrPz9M7M
         2+rdvdEx+5FsWtLR7hIyYMUVY4ZN1etm2XNrOEASPXY3xQZt0oX7mn5SaIB5ipQTuSw1
         M31iZrJIFaUAW0G7Ar9WMZK56AG6uBfTWdIJ4Jw+v+cC3mbfztKK4eKTRSVhsm2t4Px9
         S6UMHTMB+QIzWrwoRq82FSrGknX/YfarC0x5YjLQSCbFNZSsF0kxfb/WdHBADmloiE1U
         dUwA==
X-Forwarded-Encrypted: i=1; AJvYcCUH+poadweEW76cwJpVTXNdpZ9WLjbeXhSvsq6nG8GftX5MPUJ8ddoNWkGn82WEEL/TUmhUAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyInvYEy7jBvJyaplja5n9V3dHep+Jxzvsky2EDUrLciyPKB6PH
	N5+imsNLFTPipkmWS+yft2wvXogsMsG9vgy0MUHxWX2sV+RN2n6m51CW
X-Gm-Gg: ASbGncuOYdWY90hS0GnyNYN1CBCkP5ErbOcofzi9Nr4G4ibCKL6WjIBsviDBKrjpl+o
	0kwF/3UKYZZbAUxg9Brc11YpRHmrc4UCLdZt7a0YmlbvIfHXapr4AxyyGXaS8wCRxLPwHkJWYsv
	XCP60+p/zrTiquulHaBltOWskKix/LNXM8j605tbPTFsbyDvjEnlH346vhTyKcD0M9DiweRlUm3
	yCQF5jDN2+s5W1N7Vomd1yV3ek5k7U9bTKitlQdLivFh+Rjsg/dkfeUKAk2zgOJTgEvySHj9GwB
	YU5kL25HRrXYjgaVtrwPjoQ9reTDP0nRaIz+pFzw9Cs2EVhy6fFTf7QzNhj5F3GlkN74r/3Z2+/
	6AbY=
X-Google-Smtp-Source: AGHT+IEVCoFVOutZOc58iIzo5g4oFAqueJ0SPgfdmz6BnSJcYj7dC2KnJRB7dzwQBr0haF+R+zbkNw==
X-Received: by 2002:a17:902:ce0f:b0:234:8a4a:adb4 with SMTP id d9443c01a7336-2366b00eedemr118831265ad.21.1750037576712;
        Sun, 15 Jun 2025 18:32:56 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2365deb2cedsm49932455ad.163.2025.06.15.18.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 18:32:56 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 16 Jun 2025 09:32:02 +0800
Subject: [PATCH RESEND v7 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-apple-cpmu-v7-13-df2778a44d5c@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=914; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=LZ5pN5iqWz3OCuzIiw27nZWBzYhm/oPtBhWwt5qbJRc=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoT3QYaNhoHNVpoP2f2HSS8k4EzqiYo9wg7u9tE
 CJZOqsVlqCJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaE90GAAKCRABygi3psUI
 JLN4D/0XYiURgf560pd5iqzLJHOqI/H1/M8LUyqN0RZfrm2CAKpRHah6xfBnNtOQbAo0ZJARO9w
 2jdbUvU1Aj9DWOjiRLM5AwS1l6C5n4kyAcn2OtRFgQlAhjgwpw9Mhy7TGwhpfSA+QWZvg62Qc7A
 VA3wbGfk/pgaOdbrEZ13wxie4Ats7ZOPyJck6YRGeHChb8onEOsPQoBprEt5byAGO7z89zaBOa+
 028KIs6+OZOhmv6I2FvvjhLluiLjphCs8QM89gJuL704Gt1UqcstaMqfRyWflt2UdyKNZHCDA/O
 suhAfiU+MpVBgXC1I7GSFiR7oHSc7jl02GIN2tD/QqUBlMuHCBBG4XZbF6R5T0rAa/8yGscCgC5
 vqFAPyWGOgjsp/8l8iHhMKTOI/bW8L/ZP3vOB8kbdPDaCbZ+yqVT6hgM8BKUbG6U1MKxkj4qz5i
 jnhF0MxPUcOHcmP9xF0mCK2CM17obf3mBHACb+87D3v1zEXkbEn10913GE72DAGkxiWbfHvkq1/
 0GdlXm6h3aejsyTiVEIaJFiIjMIxbmZ+67QWNRqERjUsfbLrHK7ak+lmhNFzJ8kz/QNcnf1pTcs
 20aj7HHtsBXThGqOfGfLYXwU+vJqP2KZSaqcaCbnr/jvuZAjCxoNclniNzNtrCf8fs+6tGnIkiH
 r/dvfmOymQjqd6Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index d820b0e430507f681a5f2aa13a498be98080e1db..62d528d4b7204af28b66a90d68e27e1c78e2df26 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -138,6 +138,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,cyclone-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 178 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 181 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s5l8960x-pmgr.dtsi"

-- 
2.49.0

