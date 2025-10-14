Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE193016E1
	for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454307; cv=none; b=Ram+mp7EatKMEFa5zK2+AYXBsLK9ORuQCAIabnYJOApU7ULsbggz0wdV5kY8jWPKC9H4yTZAqYOnOY9TGoNn+G9Fd94k6mDo3SKwuL4yBgxXGV5psrEZJ6QZLQjtd3eZJg90AXM7EJ8HwW/CW/Zy56zvvsQPyNErerA01qLO6nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454307; c=relaxed/simple;
	bh=XiGGX/gYUODKcUIpICueRO0ZWhSBnplWOTrgw4sJMTI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P1RhMbeinGxbK20Q3G8MLSSUpi9lzcSS+jSU1/d19x2Zf5IkhtYB7fDXSMn99/xa6GGPd27BPgQ4weL9FuAl24Z/v/+3VQ3fVRKqoFHzUAggHOsAh+Sy5ABIEGTj4yWHAnmqxTOeFTsbRUlKNgJ1YWx08lzxh536ySUIaccrgHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HjV+tcW+; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HjV+tcW+"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-78af9ebe337so4342131b3a.1
        for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 08:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454306; x=1761059106; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsMRt6a+0MtEqKde4YWuihoSzMbsHghVTF7OAbgmvz8=;
        b=HjV+tcW+yDM5GJHiy9+vMTqPZ/LKGsqzTGu6FTzvVD4KRfhPKfXxXMt8LCUnrGc1bO
         dOVnm2UcRu/HM6+3RYfrKnkbyHWSLKp8mwenbO5yiM9fTHGmkmeJ3ZYiR77USdJEzDI7
         jmhWph7aP0N18VxUEwGUmAexPjTZ5YcRI0A7P/vlmaGIU5KTdTdM8bTrMGbhbSubNj2Q
         faZAsm/xXyaZ01ADeGBz01js5VdLl601MCTHtPBcA8s3b3PSYe8GYgltvZ0fK8h3BLCH
         c9OB1Azubd/oZnDjPT8TbRgJCGsFAhEWCljqFHSzTArYRYSCZAyRE7QJGfIdxAm6qP74
         wO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454306; x=1761059106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsMRt6a+0MtEqKde4YWuihoSzMbsHghVTF7OAbgmvz8=;
        b=jFUFuvQ9KtS8vFRAOyyWvEAX0llqDTmZaX4u1m3y08QFIPTl1NVEEKwl5qH/vqm02b
         7Xaa8Sz3vSH+RGll7xKHrxC+gt8pXDiKfc6o6ReXtN+qIfDaLsiJ2y4K2Oj3ko3VOjK6
         Ovh91vyGeJZruRvS/bROPBXQ48mvZ7g9zP2A4xirHMfGKH0M1rInatANLMj8uVzTmLyF
         95M8gzdRMMDBf7sWi2N7GOSOsk5wt/UUotndPXp6fYzjXdG2hX3yQ6dc5sX0iwBGik62
         SmXVLrDFirD+fJ+TwIDwU7JuTCBbLOCAd4Lc0F6tDBlWczwIMmUMAIwGJDhc0KT78Ljj
         1G5A==
X-Forwarded-Encrypted: i=1; AJvYcCWtJM1aAbVs9LzV9BqaKA2Djy8WVetzh7RvsQaIi5KyAPuXz13YlDBz/H6A+HnsoVibZc+1ag==@lists.linux.dev
X-Gm-Message-State: AOJu0YwH1M5UjC7cTBR+sOU5vk4b/kKxOBlum45LkeSJwrduimqCH6UB
	7Zgq4wXtQHmOb29d5vcuZunzJCon+ink5wi1C/6aBk9jeczx53F4mWkF
X-Gm-Gg: ASbGncuXHQR3ZacKfa2KgH6HfRmefmxsNUbvdVmJpN7bpJ7zZ5ogULnAsUN5nfFI6fD
	G2BK92SzJuXOv+yNO7aZwlk4ngj/9EoHwg32ZrzFrjXP2pHBv+H1S2JytvmkWnJBi6BccKLa00q
	bNvXCV+PhfIEQHfhWISKP7cKhyY9FIE4l3AvYWDLb/U2k0t76mLve/fw6Sk+sHR27xk12WVXSF+
	9vFr4WhTjJx+YrqdULF86gzUUDENuQQ8P0NGZc0uvYeY2aElAEFO0ajF+TGL/lQ9E3jHadYL6j3
	6qyU7zdxMFpysXhOGau5WBA5+NyqN/rPMcAhIu7YCtiH5Y7mcv9qk7RRNTqQsUwuvLFOQR4mG1P
	s+vVqE3Ndx3dRYKfZtnMti/eLjczF5AD6DJ+SztBN9AyrKP0N+PJQLw==
X-Google-Smtp-Source: AGHT+IHfYvpkP9qBYR0QxPI4MGOvmRjmBPWouaaIKnO8VsRvsEyRGrUKru6CiIL2ZB5M9rvBGZzptA==
X-Received: by 2002:a05:6a20:7d9d:b0:303:8207:eb51 with SMTP id adf61e73a8af0-32da8462f4bmr34021694637.55.1760454305535;
        Tue, 14 Oct 2025 08:05:05 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:05 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:46 +0800
Subject: [PATCH RESEND v8 13/21] arm64: dts: apple: s5l8960x: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-13-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
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
 h=from:subject:message-id; bh=XiGGX/gYUODKcUIpICueRO0ZWhSBnplWOTrgw4sJMTI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZuP34mQJBCd6DStjvUZPuGtGfYF/188yqem
 GL19LCKE4WJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbgAKCRABygi3psUI
 JBi6EACU9XHCs8g+4Qbt5yLz0F/EmK7cgyB1bpMgI6YWmKeTTXtIGIGFCPumMb5BOwQ2XU/cQhS
 pcNOLz7i0HEv7X/unBThX2PCscxe+9eSw59pvdHe4eEG+BDlHTFbIqZmPTzE2kMNZPLRXAGLdXU
 +UZWuG6HsNZSOknammazcOredp9P7t8+oCxz9X29YuMBXlzN6Tn95qwDmdbVUzuPBC4OvIY5/Jz
 uKigRJS/Jb6WCsRKMKx5v8QWbGRF4MRaBL2ddz8AIM9t73e0KUsnGG201jxuMUnEzPmQsxbngFi
 KdoT97UWsrW+eBqgVzrN/LoBPYcIGqskAcw4TRUmntFDVqi2S/cN3zbS40XpwnU9GNqwr798pgB
 ZYNP/Ay0Y1E2hbQJ4OqT8eEEFklsPT/7nw8hU+ZlcV2/2gIkSlUNN27N5M9fEULSRYK7hTYl3dB
 ft4GbH6QRVusX/oZVtoxaXQbKDJ2kvQw/mabUxusGg1CAsecpBDQYRky+n9DBIKRY+bqKVmWudr
 JrxS1XszQOq3013ZUOxJnDMsSMBtsekgfjST/EAIBJ4MZoI6WbQenxgZjTsIRFx7C7rpC4qazWK
 CFW4RAYAIuIArBchm8OO8dpRHXeuSnnWFezg3vOrr3cSX9TX9asFqC9xiSwxgfOcpG96SSTLWeq
 +9oQspGNJtE4Dtw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 5b5175d6978c45052ded495fc0d18ee3a8fbfdcb..1a3a90f7b9ded42e371ef0b41057fd3081579615 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -151,6 +151,14 @@ timer {
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
2.51.0

