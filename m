Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9606A2E1720
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920616; cv=none; b=EDPBqBh6SDtxUwRQfgMzM+6uAORACsIiDlre+vjHtSjlrWdsRUDyN+Itbqcm6GrGNBlMIvu0CYjjeMFcIHCn/ASgtW/8sz1cBtJd/swtk40eIrrSzH8cw9TIo/K8I4fuoa5GJyLRSB0AJjW35YmIIEYj5Ybmm2RV8XNs1uYghGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920616; c=relaxed/simple;
	bh=eTbqxhjvOODiLhj/5157aFqKwPGN5aKmzyQKBhjppd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IsNE/YjMDQldnYYjcGJFTCcvloJmJ0n8IJHspen1E43jI6vT+GVLWJC7X9ZpbBPuqzApx3lTrHfGyaq3kcU1QoSV85wiqWxUxT8n7wao2jy1qYEDOKhnoKTjXO6KGzB+Yb4bCPbAHPC+eCHg6s87Q9eWRk36VD0IA7E1MJ37Wxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJD+1Os4; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJD+1Os4"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-242d8dff9deso17302885ad.2
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920615; x=1755525415; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+iSjFHeRJ5eiDxIcF1+Ur75NA+5IvcpuSZnDo7kguQ=;
        b=aJD+1Os4fkA+872rD0U4Y2ncMUwDZXmqwsYObfp+V5GV9rYhU3JUAsDLFLhS34oBXw
         ngREydPnduhIuNIh5jpXZFyNk++XuT35Nq1uDyAMYCbWaMIOh5YDLUnpEhxQaWYLxz+q
         Fs03FLzdnM3xOHTVGW+XKPMgb6ITTO58Aw0vvJTPF+WVrqrsUTM7PAn3a5LHbvVBg3sQ
         UOtE3nHagLRtEpRBvw6ymRiV0dw088vvSPVZYSy7mHbGTcaMiNNOs+nZ7HfWWirVKwyB
         03GW4zI4TV5QWfEdUlH07hsa1vJTweJlVSo29aYbJlktr/MDCJCvcD9dViyh+ycoa8Pw
         5xHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920615; x=1755525415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+iSjFHeRJ5eiDxIcF1+Ur75NA+5IvcpuSZnDo7kguQ=;
        b=W3GbI/or3hW5HLAVzUjKlIiC00o2BhiGySe4mRrIr7zdrwUQtj09U5RF2S29BlGEc/
         IEfDc+jT7ROdVdjhcW5BXVGzSMWNffeHszHnSziJLmhptfEMZmUUrEMHYodEvsnYw1fr
         No3IhUgkO8faCekxlWzFY0PSbi531+Bp6TS68KmjNw6LCQ1/cTHK+gEiQh4O8NNGoTul
         Bv0WhgVRA/REYA0eGNiOksT1Cvzoxu0LTWMtNfNFCaGA30QiJ7f7IBzZ+nIvxNS/zF/E
         p0ykk6yImEr7PbWVviEfKDYx0Y6m6Y41YA+BTNdhIe4DIaita5LNH+/tUMuzAeK3EX0n
         /AQw==
X-Forwarded-Encrypted: i=1; AJvYcCULc6CjZk438AqrMfgSiCryKHCk5g8RvcBDDIeMsSuhE6PSlLdABBUf8jCb5ZXvdbsBpDH+Vg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ/1fNxHxcR1C2iXZ5hvKqnqMwEOx7iHZ+pfewnrE0Dhcjw3GC
	sbAOM50GPffiwr1EfyRQrNvWi8XhhAVGGxrBWAuH0n7Fi8KVsAG6D95+
X-Gm-Gg: ASbGncuycRm4MBmtuDszCnaqhIUkRaV9lPFPwkk9ZXPNYXF4LaTg63OgDSkYgdnou41
	5PzEOkd9gI5S4LKZwRIRvpFL75ng05+vF7HlKjmaxgihFhHkr/G4mMfMJkZw3/APx10nfy0+DEj
	Y80iqLKzr/VIZddwwSwlguGpRKBj2P2HKl8HddAPIj0/QnlBRBYVn+QBLCMQr/1Gr0Q5IPwbU08
	7u594qpchfVFv+8HzfQi0zAXxwtfYimbxK/xk23md2QQpJjkPkr4v1ZBprxwvnVm2pE7WW/a0bw
	YA2En+MNHzHsZgZ+xMWi6bDPOTRSK5erTwW//2nIMxKAjSXsIUsnoufX46ibV/VxgGvf1mUaqZL
	+W1lsIPh9GMZxYJpot15hZId8x4ZGdb+gbE/s0MfhBNXdn+c=
X-Google-Smtp-Source: AGHT+IGAEKa4dcvVOWglncYu5qHSdxVoMhR4DaF/6EMtEufkq5ee1uvDM5bHuBpczqPXUeWRNZ73yA==
X-Received: by 2002:a17:902:da8b:b0:242:8a7:6a6c with SMTP id d9443c01a7336-242c2008342mr219863425ad.17.1754920614853;
        Mon, 11 Aug 2025 06:56:54 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:56:54 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:54:52 +0800
Subject: [PATCH v8 20/21] arm64: dts: apple: t8012: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-apple-cpmu-v8-20-c560ebd9ca46@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eTbqxhjvOODiLhj/5157aFqKwPGN5aKmzyQKBhjppd0=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZDTxdZBWMtJk+fLj4SOBpL+aisv9fok/sfs
 4ifj9wkreGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QwAKCRABygi3psUI
 JAsIEACtst6o/4ptTPiwslKdB7Wtd+dm97D03aR+XgqDPmw2bzdXBOOhfx88znmpdLchjjeybkt
 hlPwh/kmHjJCTtMyD1mIZViQ7whhClMBmMYD/+bRjYzNrUH269xN6I4HQU3l4XQ4PpsTR6FMu5I
 AFltvdjs40iG/FKHyZh2xnChCEpb75Y+tJJ+ns9xL0MzL62NTIprA8Zf59LhrHYLcryOJd0tI9e
 sL+4DVQIrP7N4aD7XyHGR6CMvsM5YtgSCGh2G+ZMTeU2KbGzr7+FJuxUa2pvNLadFvYoKGuQgVa
 QSFlkvdYQwYpnEj9Ah81+HbUbVhxcTkfk3+pSvU51v5ThhNm/xnn5153x82jiiqS4KXucgPuxMV
 l5hPGcB0w8j77SWkp2bGPoY9rS57/2JXJ/yvEb5MYhj3bTzVRU79j+bnF1E6TDNk+4xVtAMSTyT
 EKS0o+XQpi76zFf1+oKYxUKC+I8yHjmwj8efB998A58eR5mnOtm+EEK7dWCNZOTeQUsiEDx3NbG
 egtTvL+wHupMMHLrZ3a7+tn0IG/Qo3+WdeXPnW2X0z+9JyrsyB04JwwTAJyaEHxrQiup0ziM2kV
 u5VNmCdaQ54UAIG3byHcoaec9eLFIEB0sl+5GgAftNYd8X7xg5DBd5MYrKDgJMijKkhTbvcZDpj
 9ZuVedWcZJ0+Iqg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index a259e5735d938cfa5b29cee6c754c7a3c0aaae08..fc87ab818d975974dd811cedde27292ec79f2c8b 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -289,6 +289,14 @@ timer {
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
2.50.1

