Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE7925D1ED
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889958; cv=none; b=eFCqMa6ZjYOR0sAA43sBP2LM0Kd9I8kgjO4heeHvx2oSDWPfgXOd7M4HuYiwMeaoreHyFxCI2TXvtvG2OXUa+PuAkw0swrO55zoGVMU4wVUTrkRBhmPto5XGXnaMbu8P+rkjaQsqycpNFaRy9r1hFb5PX+EIDATErOYv7PlB0Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889958; c=relaxed/simple;
	bh=iSgQuvf9kmSTE4D2ckw53TzjQOR5RrwNb5r5c6wUTAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ptnnuRUY+f+QOL1SxqhL5MECPzaFat5dj2HlUZPuVXBiPIURLtIa5u2Kg8L5enQxRlCUuD6bLoNjH9HVikBBwkVigYLWNOxLfFzMQN7BfUsF8ChCTqOCW96SAt8I6RGn83O3jqTm1ha3PyVesVrp8wOBo4ge5qH25wQ6z7oMa10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AXmrRbqJ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AXmrRbqJ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-740b3a18e26so2469842b3a.2
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889956; x=1747494756; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=AXmrRbqJj857zUGmFCg48W5VSF/2DWX8hXWH7W+bwVXleVJYIyREWdQzs+mwiOGg83
         VUvxVVkUKUwBUk4Y7UNbd/cB/Z8rpc7eX7Wm0BdDSf5W9HPNwJoLnV19UMHHwMZ4dU7T
         eE0Qj+l2WyT+OoPCMjjttCwXGWSE2knI5mcGQilxDa7um6Z4IN0o7r5T8uHzSPcCH02I
         /diEx+wKUJDolz0zC/M9yBB13j/UbTDb/iv4KV7kGLvJBffTszEGZqd+gwvp5TxsO38h
         T+7YnUPAq/A+GguUsqYdFmwfq4uw+PR9awq7h3szUEUT9rE8TVPAXEsjVb3UjkkhSrAL
         nEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889956; x=1747494756;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbV9nsv1jvdE6TIAVwMdOO2R8WMK9uKpowquURgrnXA=;
        b=E99Y7XgbFlG6gsHjNPdnaj/aPx97YiCrux7txIZYRVd5XSKh/1rpQHRJptjAC8YCQG
         fC4wPeMLkv+mXiKCvOS+B018atcNvezb7/Uji5taXDiDhhbhINeNZm0fc1Vh1wK4WCpH
         kLybkzd5Gz4mY24sUXxWZbxXqTMYb5JoXMTkr8clDobbuU4gw525w0NyNsQCwv+2Hw+n
         LaH89YGnWfhAi/HN7VaIzqKimIvJRor07fDmnvW7uY4femsTJTFswvEZeyPx/uc/wNbg
         GUdcKiGm8AGiesbizBXIRaaTi0uimIG7GW1SumCam17vzgClJHvghA2cJ1ErfOKM6JL5
         AiXA==
X-Forwarded-Encrypted: i=1; AJvYcCVJXeBqheDwmBAob80oVbIVd28DJb0UIKMJz69prD4/ObN1zC6v/Otm6+Q6+xW7skRyCmPGgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YygoJVRt53jiDLjJ5EJ1TtFMAuMWhL7EZJQqCz9HLiMx+tIyUHK
	w5qWf5HjNSW6zxNUhlhFhH67PybUMwliRl9nv/SpmG+7PN0SU8tgNJQplw==
X-Gm-Gg: ASbGncstu8o+T2DstQRfmKR4aZcdPfru5DM+171d2PZ7jUgrRtfQfjYqCVOZiV3VkMt
	hdfBqi+RGkprxjJAkjFRUC1dlmBVphW9ltHSuHuYnvNJGiRPyiWAr+vXi1zLCV2HTnMeSiWWwjL
	CSWsn02yUev7DbouL8ze/ODySG9WPCUUThEmh844JTodeJD3wdnBlC6BZNcWd8SYVrtDlDtGXxe
	CzuS/2D8wYUaWBPd26YFyrsoQwk1Jya/2uzoom70vBnEk+9doGHU9aF2b2y99Ctq5pnQqPwZnr5
	M4dAY2XvsHlfLEorIZ5XUzCAju8/9uMns3xG4NO8kXrBzZ+zdVXh/A==
X-Google-Smtp-Source: AGHT+IFtT46gV79vplSRnTNjRcV6VyD0gjugvAu28DSlS5zdUyZuWrk5PiENyazvHXLpdDQYOK/V2w==
X-Received: by 2002:a05:6a00:802:b0:736:4110:5579 with SMTP id d2e1a72fcca58-7423bc02f2cmr9779057b3a.2.1746889955645;
        Sat, 10 May 2025 08:12:35 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:35 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:11:01 +0800
Subject: [PATCH v7 20/21] arm64: dts: apple: t8012: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-20-bd505cb6c520@gmail.com>
References: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
In-Reply-To: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=iSgQuvf9kmSTE4D2ckw53TzjQOR5RrwNb5r5c6wUTAU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2ycJM0T+aDWIJbJWermJ+AjpVyqLgXvTkY+T
 fMhQWkGt7WJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9snAAKCRABygi3psUI
 JLiMD/45EuS0n/6yTHNsSOa6lVCy/KV6z2Zk4JNxPI37jcvxmnSjlKGwTx7Hrg+1Vg6dzj+YAWq
 1cKhgtT+3dA9YU5NQinJIFf1S/KtAM7uIygOfyT1DaztAxcHNrjlPl32Qsjpz68fUnCWEXRtSb6
 Xb+hX5d77aj5RtYYS5nLzEz/XTmD3Lwm7KpEUrDnSTYtODpTW37DvwZGj47MIkJT1VPM0F2R5kj
 Mh2eLLpScv+GCSU8ONXP7qwbM5/0V1Y2cYHe6gxM21Yhr4cnM00p8VMqjWBDL+cv76tWAD9iFjh
 DiU9NXXHf4vm/ctnYJtOZFuiLTPPkj5qDuFLv0nhwmxGDODZMdnj4fc11E3xjhiNgbH1Thr+QNt
 6qACz4PEEqYYzYX6CynTRmvCsUi2vg/+3DZgXX6q6GMz/zaKqDFNcSpxj8hrp21eF87LuRv8GVt
 /vCqLCT07xCO7GQ1PkC2Buvp0vpIEeLcAz6ohIDaFZhfG5zWBh0xf89GQdHn7OyODh8wIFLsVlc
 Qud81zVKqlZhHuBgJGiE7yG4N19+IF/4ILaQsW76If4YzekV25qOi+QdEDu977V9i8VViPKExdq
 hSU1bXY5WhjXdK7qAq56cVx1sHioZXEa2JeYdEmcQPgbTyi94Ncx+tDGCkzDH0WRf4EzgtTnobv
 2e7IwMvoblab9WA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index 42df2f51ad7be4c4533e76d18e49a9a747b6b7a8..d79ed754c68dd89fc8c52887e6dcbbce04fe126b 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -276,6 +276,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8012-pmgr.dtsi"

-- 
2.49.0

