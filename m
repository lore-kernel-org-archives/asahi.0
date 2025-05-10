Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB83B25B1E7
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889948; cv=none; b=VmoBYjQE4ZSStoGLsYzMKpUsmpR7tHrXVgFNWeHvKd65Kc3U/eUpJoHoOweZ/S68zg9vBU7C+iyJSvQw9GlE1AvFl6sPW2nE8XXRPPhnsdt2HRGYN/N7U5wFziLpQin8XVFDlRXAuJIcpFP1t/y6ODE6dVCZyHRH7p9ozCFMA1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889948; c=relaxed/simple;
	bh=umS18Mpui1EoUACcGD+WdVdka5VgnqwULsO8fA+OvnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=anoF/lw5V9Xc7a9KnIknnWa5ocwKInfsGD2LedVRDUAfMnzeNGKBGmH9fSmIlKyr0DCTzmiknL2kp7Dug6zLHgXAPORevsxn6hUj4R6dAYSM4yWlrR/SN39c8eQcXyK/EO0uCIUP2ddDsYbCOwoAqCJYOTTwL4gLsoMKWnGX4Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3RaMk/9; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3RaMk/9"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b0b2d0b2843so2335582a12.2
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889946; x=1747494746; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=C3RaMk/9rnwdnnnSShB60gucCE34Lij9+TsAOba99+zEDOReMg+kEaCjz3G+qDgOKu
         GLpDbp7kNHVPvQxH3qfCRVFAAHzXUvqPxyqeguaNLuBA3kUS7b/97l//1YD8AUy3k6yY
         Nvk5CCvyqOXHoX4FLzqnfot0HWiyrw7f1X/ifle2X5vFrkjK9hP/SlZjb2PvnHot0Lv+
         QgqXrZWxS7mEIBjI001IPjOgWjbSLtcitJcrS+CHnPKFgZ6uY+AHNJa74vJKKmPYFTdb
         yQv8zTB9QZabZpODpDNqqu47cFI4KsXnMPwtHBVMNVEVfTgf2+Dha6eJQi3zFZ/z1u+m
         JA+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889946; x=1747494746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=p789+3VHnaVd7LkVLLFGM0uGZX7aY2UTb1nMfDcSJ+uf5U7sLoC/Vm9SdDREcG96Iu
         OIaQd6AjbOib9wru65sgF9GL/ATqBiVxDK71EbSRKrw+Tug7nzFXAm5WkULyZmHptcOS
         BgYvHvlJzEi05DZQT2eDmkKwHKmTiIO4JkVHxak/vQnKFqA3bJTok+UEVXdwOxxJD+uI
         rxMjhdXaAQJeLCqUdcCbuFw09jEmz0SzpnvNGxDvEyKpKTm+8pWfyXXBVLaHVcbzF99w
         6AcNKFAG0bLNv00cH2AhiCmnACS7kIPWMATHrB2bEZ3U9KxPxCYhhHl8z3D75PhZU5Gp
         NF1w==
X-Forwarded-Encrypted: i=1; AJvYcCVW3KQ+a+tYRXc2NlRFPgBNT0kk+etf+i2KISegdNJeY70/w4cchQ65I9nHL42JLG3e4yyqoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyY/Jg9TBaTGG3CtdBKfEoLiU5l7YOStIrypCxf/sFV7IkdlZ06
	Zz1rnctH/ofF02A/KZRuCTQ4Ub+Q827YvNjZT2VZf7segbmdBNLVqPuO6Q==
X-Gm-Gg: ASbGnctFVNU9i5xkyo69ItR0A96oMaS+rMOvi7c29bgf5YvhVd3xmA4NZbrFIqrM8t/
	NZP/dvTOH8pIyYNBANZFvRSIilQJ0CmaZPmoA1duHX2ijODkkZYv+ILXSjFJdPNDFTgVH+lohos
	uH+HDWnd5Okab1OJSofTU6Pv1WaBkFTRGISBNESkpF7nK6Vy++ft7Chp9Viopjtxb2DuVmnvz+b
	5GxV9uVD5qJj+/rZg7G9qBAYzvT823lenwItg4O6F6k93SEoCw7mk5SiZQ9xDKzEWXaL7XrrNPm
	WF/qJUNOmBlNrXtME8PKt0wndREHeCizAT1PVR29kCJRDENT7A731A==
X-Google-Smtp-Source: AGHT+IHvpyWaj41xEJ4fgTCl3JLKcagSaqSvSd0GQPAB2NLjBkSapSV9Zv6NdP86SFyL3wsGhog0iw==
X-Received: by 2002:a17:902:ce83:b0:224:fa0:36d2 with SMTP id d9443c01a7336-22fc8c7c0bcmr91362355ad.26.1746889945680;
        Sat, 10 May 2025 08:12:25 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:25 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:58 +0800
Subject: [PATCH v7 17/21] arm64: dts: apple: s8001: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-17-bd505cb6c520@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=895; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=umS18Mpui1EoUACcGD+WdVdka5VgnqwULsO8fA+OvnQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2ycF2bw3pW8inBZRIdQmQjyjU46bjoUvRyrt
 YQ6AHCBUqSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9snAAKCRABygi3psUI
 JIc5D/0VQtva3ilCixys6Vr4EbzfXvPR+1Mz98aBHk5EgmotsOVrHArH9ENBqVQ/hwGkV1WCxFY
 Q3Z+zsshxMQ/LbtkpORixMbpkIcmj5YwDhOvCS5tbDqU6gtVoUgHgK15IFeUmoPalsv5TY70xZx
 WcYk/w3seRQcVgW7pp61jdLE3M/skJLGxw4Vs1C/h5bvqBKCmuj4HzKwFrqX56ysqsEBAVDplCv
 21kcI1cB0Ka1ZFsVUBOiP52hH3mu/A84SeGmjUL9dJBMNY8pJjtw3sbgaIP4CeauRbLJkUO+N2Y
 nVZHttdDvWtaZ65yOqe6hYNm8RKF0RAXGgoLYqvsyf9z36YkgoLRDCMxfeR0RyMh9421NwP/FT9
 rwKE1uF9qsHpeVpgzwNvncSLx6JgwCW7d5Dv3bvBcMh43H3nSYCnbz71INK0s9RTRBZQTwkeggL
 m9j3yLmsqiR/7rGAUS7FvzE8GHlz74wkE4rng3/68dhbTqsY6mWDy1oTFoSv4dPMWaGfoGLVoZb
 nYsbSvHx+BKwR8hIVYTX83B9NC44WWgsYlCZGQuiwOMl/lnCmL7R1UeXRV8OFXWpM1TBcPDWYrm
 bhCMMA3ui8oNM7RZdzc+IOlwXxVS3gAjR8cCGIHab+I/gb5amYkdzQe7E30iYzi7i6VYDRut0VL
 rI3xk/Ox5RZ1Uag==
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

