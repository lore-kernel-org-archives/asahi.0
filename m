Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E038B2BDC0C
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258229; cv=none; b=AK84mzVXsKP0RwB4TC2YnX0mhB9mqktaFjxEoIN0I2sQCw4c7me1jhT58YSs8QKdP6AvY7P+EUjqv48OZ8BnEI0aowBMAFrb0gdLpn/1Q1coXM2tMNejztL3y2llUzzuZO7XaUGNpa80ICx4OiYmanEoP8OaDyHyZFlc1S3wgAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258229; c=relaxed/simple;
	bh=trWVfDATm/MwjZ2+dtjuGYhC7m5DG/4DEiwR1Jy0uIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CnemhFafqeOB//HjTM2NxWxolEGTqSXg6SSKyIxvbDFHtwkydtK2mzU/MSENh7yrMME8tvhu2GpRnXlxM/U3XoUE4mp8Aipy7mBYCGys0YZuUBAnofs35B/LLqIw0g0cZ8vjXviQ9pR6/+KESc76F/T7fp+mzMLMQ37lNf4OXes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mB9cRf+C; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mB9cRf+C"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so11671019b3a.0
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258227; x=1767863027; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tdOFnD1zwwXEjmETrN68s5mUpHoY1S7934/U4qRcoA=;
        b=mB9cRf+C6nULCVJxUNpBPxRHiA1FH0l5Cj9KHWkn5knmDRYnnf2SFzVYdLQt7cgzKI
         s7O0O2S23uraE1DfGrPkTfTomixaAIQTxBS4jOGnRjTGUSkYuxl8QshWtvrKqrq4U2mT
         p8rdhBiv0DteJbFYtOumiE4Qj4o5Spv73Blmfwa7jIjy8T0DEtC2pIM3inDxObmQHXNW
         U8t8k1X/0RLSp07nqaEYF0V22DHFHWfxB+rd1OU7TIwHGb6HI8QpACxKTtixkF/u/dWU
         rPTlWDLWyAs4IUMWoIvELfc4tUg4Y3kHF9MnBGuHVOHVc/Bb3y5LxnzFckgp4L6tp/VT
         SxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258227; x=1767863027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3tdOFnD1zwwXEjmETrN68s5mUpHoY1S7934/U4qRcoA=;
        b=o4D+bI5xEoJb1eXHC7k+UlvvjSyC/wUkpC2ymepRUzbxoZvUvaudqkz2MLNkVs3WSK
         sJnFaAQn8DKpzx9cYxmBpRJRNR1RIgq6khxgfnOS7RRxXD8uwheBcmBZV1clRfBXVRTn
         aZe8agTyoduLCfEv8rIboshOgOtYD152qMS1jSWoGgl5Hqg3YlNLPZpqGFyJtornInHK
         wqcSrJFJj5wRPOUHuIq3H3XQsReX7KV0HOPlnyobYfYHExtnLmuY6f8+eP1yC4or4opX
         MKM9OtC4jpP16lHl5atfieq6LArUVuPYE5KwLDgCbJBeDJshZfCB2rIC+2WR1id+6x99
         +SFw==
X-Forwarded-Encrypted: i=1; AJvYcCXwiwlHwodFM6hB5OeR+Sot/zf96jTDwgbb9kbjMpRJiNUhKOFeCa+ocyYF4mbPycm4mSq6RQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ23vM+B/wd9faaEjm9bhlMd2m5Sy7gn5jrp4tPYLqQ1k8fvcV
	+B0XgtNPN5V5nitsKZfIDu0RqVZswXSn83arEmV478Fgw8K1tteNRV9T
X-Gm-Gg: AY/fxX7koP6f7NnyzeCjPt58gi6o88Ty5DxiDztTID9vlWGuzKkQkQb0VQs1fMXHr7p
	02U1SUUhTmfUhxkjpYjddJ4ct9oIDBYmtDj9NVUy5gzhDhUBCRR/Zq+aLW1a2PDSbhJmnn81zpl
	ioUrTOpIzF9Y7LzLRoYwatjXpQRL9Y7GVRXusbLwVVQggkfSto7/HvFHTDwU6JwhCDhJInw4rpD
	hAVIY/jX0BPZEe6ufMxFfMorDXaPqa0Q9rBEev9g+g4wTWrEjIBZsBgp824LboYqBSaJAk/Y+sa
	q6uC9Rrc4z0Ly3npA4aetx2ZVb3i6IKzNf5E8FSjAjj1Wj/KIttgXT27yytp99No+ic2JHuPHJR
	8hZRhEy5G3a3Ss+HlyuAnXOgZP3hUJdtmUtwmMS8/IEIvJF3DP3j2YwuOQw75TlECtdB/n+UwtY
	9re5zWB+AIL5aL
X-Google-Smtp-Source: AGHT+IHO9HLDqLnxGqMh+mxYDWViv1/O3WqdN3+qFILp62mk/kOweAuJA1AZ8e4wVoEHoRWOZ+prQQ==
X-Received: by 2002:a05:6a00:90a2:b0:7e8:4433:8fa2 with SMTP id d2e1a72fcca58-7ff6607bcddmr39960635b3a.42.1767258227104;
        Thu, 01 Jan 2026 01:03:47 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:46 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:57 +0800
Subject: [PATCH v10 21/21] arm64: dts: apple: t8015: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-21-48812c529ffc@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=trWVfDATm/MwjZ2+dtjuGYhC7m5DG/4DEiwR1Jy0uIU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgpSfeNnDDFSIT2Vc+1Lesv6jNsQYcFQYur4
 OGMFS8dLn+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KQAKCRABygi3psUI
 JKgdD/48Oa+AjeAoAVsrpKQTk4o35ek0CzqaxUwDuPnoOwbkEgFd9Gv9cAbMM2eks5VybrHunJz
 e5NYXyt9bxOKT51Lq+Xkyro8ixG0EQrPItJKj8ckf/yA6Jitm7fikoHiQXc3PkUC/MuJkNcEV+6
 blmxnWxOsdxt2pbkxVBVk1ywud8xwITHXftKf/OZ+gUCWOaHgWXUEdZ++zxDCGn6G7BB2FNPBSj
 3RMWYElEv3m00UtjLwOVegeF+9LQYasHUjckXbFLoDBXqSmwvyBSHP1MurONsa28XQry5VlBHku
 LSF50dJsLChEaxClORGyiVsFvBMlI/WRnnym0EyqYwAHLZ2KLfqLvqsJndKpbF7RXdfbTuC/r5G
 1v8Xz9KfWik/7JJ4vmnSMoAVJ8EwE5XkckvZYUPt3k2hC0FUS+YOro/8fPOs6kev4KJv2XpZXJI
 cE0NhDyB0MfSclFPKZBzb5frmfVGA0+PIUwXEZjHsirGsdOhbLBDQq+ZIxuUiqfUsP1X5bs1Ohh
 evZE9VP8zemVg8jruE9jT8nqu3Ve2kw5+w3T4X+spL84wVi5lGnMmxefqyfyXFSNJxhvwM1nBf9
 bXvbE7sVJts4ECdTCJlZg3epyUkjmC8R7apIijQZJb7EQj9R3wCtCysNsWW3UgUOqmeE3BDJ6i9
 YG47wDhWWBmbfUQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 586d3cf1f3751d9ee23262e55fd692bfee86c13f..0c1ebab56d6b36ed5362a042ecb6cecef7c97f64 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -341,6 +341,18 @@ aic: interrupt-controller@232100000 {
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
@@ -530,6 +542,18 @@ timer {
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
2.52.0

