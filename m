Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3CA29DB9D
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 03:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898284; cv=none; b=ASbT4R/yaFet377NQykuD5Izsiut3hup99mzmVxR7foaD8Jw7k5geQbA6ARkmw1QK3raD7/Ea8Efc6T4HKpiYSnGDFFPAqKfVv0/YR3knfgw3+8DQlWoxp6FEgpQDY3piXU3kibl0jgbx1WJwfhuuxqrtJd66+8SL5s3YtKRpSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898284; c=relaxed/simple;
	bh=ZNIQgw4HnW0u/JgkpB+HMZ3DOfGGfZVMtPocokF3spo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hys/rheVmz+hXMS5qoH2VrB87JNOGQunY6qzg/qUpBtasPGw5hmhD8g99bg6tAJqIo5noIqlvqIo2JC6eW0rCJ/dFPKYqjEXu5MT+CNXsS+Cgn9ZBnoRV9a/283T6xbhWkwFZARQ7+I9rKp8e3HpSFNsKQXo98RcfS94azy3U/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FpSa91b8; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FpSa91b8"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso5615943a91.1
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898282; x=1746503082; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=FpSa91b863UThjJIMmbmDEbSAX52c4ojlGSmtRocl8SFqqzuY9i2Z+IOkYkdUOH7ow
         x+QFxB4Ki6Qhb/LuUmCcspYFNe9TIuHLOuDAdJE9DLAnzDxT96GsKBdHyFfpRRt1KQ4a
         PETTK0K7f1fW/8Ra7amL/VSS2yVloPwM2CZEpgbMfC7dnzSypGW/4bf3RCR/ibmcl/oW
         JA5PRtTUwOQcBl+RlJcT2XnazpR/Z1Ei/DfYqB4dZhCysrdHYRHgxot9jDTJuSSKaHs1
         uFyhpWdzpGVF2K5gNHJ+4EdURCkBT7e1BUI+EHyj+doHl7yI2Pv/HiYA3VBbsJNhd1l+
         0aIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898282; x=1746503082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCporfr4EIL+gH/R4FLi79/b+qKEezH7ywKQB3RTf4A=;
        b=K+5QEp8fl+KQ5cGyh6JQ7mvDxQmxoYQjJHP3ttEeELGOY7a7mihcrlaIsmAlrBMBeG
         lECQLOaDha2cLsekXp2ViZ03EY2yVbJcMGzWhX9Y0jib7B111JBPg0+6MchZRUcDqMC+
         LGYWyeoEYpGN718OhQnoi1VoMUfdeln6LS+4PAcxLzlOvquJLPOsBwguBYALsyJjTgL5
         8rweekKdeE2qbtEop9JAsZgfkvj3J8Ax4Q1UIcYc8w5W+hgkrWXICdpuZEYUo6uY2NmV
         n3Q9GGsrZPoA7UTHO3GU5OSZdJikEcNQlQS/fOpEKO0AfcpQ8MQcILBLtAGmpDNtkJHq
         ri3A==
X-Forwarded-Encrypted: i=1; AJvYcCXhARvaDBLcpndI+XyE7DtooA510gqqTvjbDW8xmFRIo1xMNtggC98GYrmseUap17vhjIe0Yw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQdWIGON2c585nt26LrR/cgVhjVwczq3VeI359xOv/OI9yAYPj
	yX8etjmFOgPC1F6wPvSOMpMN8F2bwAOOBXC54fT9K8N3nteLwLWi
X-Gm-Gg: ASbGncvZygkaoTGJ+bnhgYazqoSyOTtnAXL/4SK0hco/BqnPJVn0v44JkIFTdcOpLKe
	+tF3k8Utu2ipjivYy7X1i+0fiL1D4X/Wj2zFiJhvcY3G7g/RjzowV4jvgs6ta3PWPz+IcjBUkrZ
	RYmg+v00/NPF537Iv5Y+P4+mVa07Yhg9ugPM82ri/JNHiiV9xcsnkO3dlLm0ixS3dWKpd2DrZUb
	M2TQmHHT/11FZ5YPfI/PouakBPmdRmGI1wXgWkKBXEVqlYdwmrHoopCOxZMHMi5IJ60JI1U9JE3
	R9ltMlG72TExl4usOLm5Z7mweAVWO/nS8RkpijquXc1eGG7kp8fiCe3VsQ==
X-Google-Smtp-Source: AGHT+IFzFXVneivf9OPokQY3zw9bSNPj8zkSDTlCOwbCoaI+2d7wrwaio94T7tzORQTF6aRrfbAhmg==
X-Received: by 2002:a17:90b:4984:b0:2f2:a664:df1a with SMTP id 98e67ed59e1d1-30a21546c8amr3148992a91.2.1745898281922;
        Mon, 28 Apr 2025 20:44:41 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:41 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:43 +0800
Subject: [PATCH RESEND v6 19/21] arm64: dts: apple: t8011: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-19-ed21815f0c3f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZNIQgw4HnW0u/JgkpB+HMZ3DOfGGfZVMtPocokF3spo=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErmhAaAeRuhpFbi6gLnsvgpq48CyERFohMo0
 o05klQB3lKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5gAKCRABygi3psUI
 JJ2oD/9vTAubABP6miBhIXITGpYPldj+/FlKBXzefi6FCtClttM1Vh58xbYEO36GkrWeGDOZ7jZ
 VhKAap3FjIz6Umg6gO3TTPtaEgE8lxoACUUkB7d8EjXlm4BGIhELKMdlVu9hNqNREMpA0X5HoY4
 5IijZygjLtt1g6wP8oa08TSi7CApM9FILAkaYRuKNzXh/1BfWsslseDmpJ7VINmMzmmZEUtS6sC
 fVZiehj8FMwcwjFLNdf6/NlPaOmes9aIl5quoIC2XH30LBCY4L0Nt95xXyDMldkLtkCI51Zdpgs
 9fyzSeVjf0YH42rkH0G5tdytxLMUuyNigaoJLaVD/nQWswN7QJGhZBWcpOt6XC9xglliCFjvZAS
 mF3lU+nMuhA/u3qscGRrck8aTS46io12eWrAmhUEHp3hQC3jn/9S1Nu1Ww4ivON7v/EhxLxSaie
 12QNz5nlzAYQQcCOz4blxc2AuNxVJjYi0W1JvIHfNuOwPR5Jhy1bEcF+kbBLvqp7q7B7Ux3cS85
 gaCa62HWVailnmqVgkzLbav/DevA8Swc6kQ1k2gq2vqhsiorBqsOTWIyl93SHM2Ub/usGbdQCn9
 8e5HIvILx1jjsNBP2LRBxpgORNuFYqgu7hrHnh/qA0/muSE/IHnIHY+io2RhQBnLuQc4V31Hzsn
 cKZ6gFO450NZrxg==
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

