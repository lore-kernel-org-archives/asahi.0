Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F56A29AAE3
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258222; cv=none; b=q1+omAf1DqQ0D0GME+uGslAbSmp/xGv+lRqF+6aFVlSV4OsOI1yWoTszeVeIcI695LClUKzlnZl+J7wQ1mdr4XR7JZjzH19zvJs5Gj6F1vjAuHvQMjC07GcNTekCBkId/KO66zO+kNjTwPRPuE07zlBdH3bRZw+tcxkElIoQ9io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258222; c=relaxed/simple;
	bh=OX5KL+MG6sfpo1KjHjEhXoAalFtdpPr6gBFVJvOaFLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vAg/UOO934bvUrFPDR8aGzRwCoS7H5aM1J+9MMctpnuCgrnPFxalXdVjTLm4L5xzoVU1daO0dJaPoneT6AUNg8wsyCdyK1F9cFhk9AhhaItfqyc0yeAYJIhIA+DeXH3IIgWUADO+WFsc0Zof80ZbQrPTiaKQkk7MfzNTlAfasrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6xm5/mU; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6xm5/mU"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso13359187b3a.2
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258220; x=1767863020; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NS7rXNvu/k+fb0x7YdnIE3Agpb80vBTRZvlvmIIsndw=;
        b=g6xm5/mUVI+TZiUcmAnptfV9rvNbDXsska491C19aYpm0jjdik7n+a9QgLSec2XSi5
         BkhfFHrdPMfBXTiUu9G3PwyMFH5tg9SCVidsx9aZf1a2portaE86ehPBB4PUigF5u1/h
         B7OcedLyYa5tZQ0F3LdOCwucUxaoodQgDhpHQhCfkYxZBKQ5m3dOlVgo1mzBC7SjptlH
         4jIPI06rZSW+GSdxrkhic5WM1E19Jvod9Pxml8GEqzGA22PL74W2CfS4K+hMa7MsUY8s
         LNIEUoKFtsAZsVo0a0uFXRCn4Zv8I9/BN2B7zYp/RKgrUiDA5tL+bLngg2w5VAmVWqGi
         dEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258220; x=1767863020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NS7rXNvu/k+fb0x7YdnIE3Agpb80vBTRZvlvmIIsndw=;
        b=GUQIxH+ngw0rklKuN8FwQPRRHo78Yf0DPn/8AZmFA/Dz6AKOrCJxYzs1/A8+Tq2hqJ
         HwZiM8Z7Wqlq4brKd/Alocg2SkJOoh81k8mn6HZChE7hFuszhNXdUFLjKklLMvGoXgRv
         HCb5zh5fzXEaDJsCNY+vSXiz5+SkHIMW2jz396Is2mkIjYzqLMOW/fqVuMin7FNO/V7c
         8RIJZpmjLIQnQMPfDfuGcILk3kSx5+SZXlgHJC4ANq5UyGyUQw3qDohKNiLZkcizQEpg
         YxDXlRWiyNSSCa8Hw4TcB3p5M2egYhdw+7Nm8GS5F5N6Wki02N/mLZU1Z4YY+GE8VLR4
         8ecg==
X-Forwarded-Encrypted: i=1; AJvYcCVQSwzzaadXJPVMBVN9tiTGLI+waxG9ask8Gfh8ZNCDjHNgn2K1n7K58MKnf7252vD3nqNZjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh1HaXIha1XCti+6HuGsChpWFYKr3nbjBCveRmcgJDyzmajxht
	1Gnpl0YDb74nrj+ZYj3rFGSfV7Cx4baOLt1VGpK6mDkW6YARZLGgIG0pqMbgGw==
X-Gm-Gg: AY/fxX6NLj3FeYmiqFZbeGWYLfcMIR5Z1xRv4OHzXWsK9iH4J4EqByUMb/yFt2Mvgx3
	vajaegVGOEc/RDs9EKLCe0fBFlW1xWW5XIRyJkzjtVWuyoqRRNtQubQ0w6/iU7eugkjPoQiFLbr
	0fC6pVbLQo/IofBXI9hAU6DgGmWjBFexaDxs+9YRkSEiy03eQyIPB4TUQlnCObxDpiBtAKm/QaW
	1l3U+gaecHJCBiqnwwt0tNAaMifJEEvncieb+PQpVxbUvshSc/Vi9sHEs7fG+lc8vu1uQ9Ab4kU
	SId62IziwbXlS1dIvt/CPvwAo0NTTvzi0PJBobBF9JMTEK3lnrF5mMmrbT7FbmK9ehzEfPKAciN
	7dNyaxvmbM/9F3YSMLSv6KZa2UnBUDESvwwI/bJEsNg1Ng25PZbvyigTtcuVP+rMqbWmOVgJz03
	RMDHQTfKmSBH+l
X-Google-Smtp-Source: AGHT+IFe2eYmVWLE8qLLK6tWjkKXLBApqyzquQyvEELPpD7zudq+rhR0KNlRnMSRuoUBRZkLLMtt0Q==
X-Received: by 2002:a05:6a00:6009:b0:7e8:4398:b367 with SMTP id d2e1a72fcca58-7ff66672842mr21088807b3a.58.1767258219859;
        Thu, 01 Jan 2026 01:03:39 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:38 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:55 +0800
Subject: [PATCH v10 19/21] arm64: dts: apple: t8011: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-19-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=OX5KL+MG6sfpo1KjHjEhXoAalFtdpPr6gBFVJvOaFLI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgpeeS+UEfUxUfudtiuD+PcujvuHezCHD5z8
 x9ladDrvDeJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KQAKCRABygi3psUI
 JC+uD/9SAW9UXMI8I0m8V/UHzOCtWUTPWfbNC2fPY4pLYEu1gNB937JUCCFEL5QoFfVRTabvK15
 RaBDG/EzwT4YHXcHyPN5ehspY9NIIh6kUqh1+oN689J17ZkRtisRM+N391Qfgacwj5XTjypx73O
 y4uihlGk+Ha1D9WAzs7L8OWyVGvRuxZIoTqUjdPWhKgHPxO2KweN5v2giZOpmJ0T1w2uIjjGaPa
 F4yli6Q9Ck8Mx/wQ3ls1nuA7TU/21leS+84f3t0KDBQTByLZTIv4/FtfKcZdncLjlY87evXI1m9
 2l+fLDspjdaFUMWpgmDsLCoir39s98aqLwa8y7M67+jre9zBXMPpHCwK8IDSant3skHQU2mioRF
 QAEsruAQuPI4u94MAtgtfEm3jmL6EZoz1TFRWdo5alsh09Z8/bFFIrurHAAwOrM6ayecJyIlxbt
 YDKh4UZTSvzHeFqIiWudQNuXu0bAZKN0S8VGQZGONe6hPUl8PDbf8HMWLTFIsLakMUSkhvime0a
 Eo3/STxQKgq2S/3rnHxyKSATl7/IdJeZ4QLz+UzJn8VLN9r0We88iZHVfrw1TCZIdN6DIzM5tUI
 lgF3Vzr1oA8AAdrUCjMWLcd0HruyQujEoxW2QLgzBSSUlxTEP4NvsVM/3TwdkIAWalc9qjlWW/r
 tbo3bM8BJ14ggAA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodse for Apple A10X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8011.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8011.dtsi b/arch/arm64/boot/dts/apple/t8011.dtsi
index 039aa4d1e887625e7b6ad789bfd9aa032dc58d01..7f7b0230cd648eba2533f860622f683771197bff 100644
--- a/arch/arm64/boot/dts/apple/t8011.dtsi
+++ b/arch/arm64/boot/dts/apple/t8011.dtsi
@@ -329,6 +329,15 @@ timer {
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
2.52.0

