Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF56A3002DC
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325711; cv=none; b=gUS6uN4wkwOqlL0MoY6e8rl3iecJ+6QlpCm5VA5vMLwegyoDfl0TxtRVKsQJgIsxoq1aEh9WMVsdEjwZGYlfd8Dd+JfMh/+v8uKHd+XwxKRzg8VCFP6/snhN+SU5KLiiu0qD7q0jBuRrxnNHVKAnfzso9gskwO5BqOgpoChjBBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325711; c=relaxed/simple;
	bh=1JKajXUwqRhul1ka4zSxgmuIZmZnF5dN2V8kqpA2Ejs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c7ufg8Mm/jVLbokVF7iUenx+8rze8ftAMX17oo9dbeV5gRNHIVsYjxjLWzAXuxO0fnAFk+EdrHgK2fnShbnYzLLN+ueZHh4kliEueBn+LNmjicDvQ4Eb8STJmnP1qOrGedvfwGmW4rpwR/wmD7ZxtwpDOyrXpeMBlghLUA0ZxLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSeJQbQ0; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSeJQbQ0"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-25221fa3c9bso10986465ad.0
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325709; x=1757930509; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyHd36Q32D6LVFmjxrrSCjpcR8v8mTvafzGLYpLOI3I=;
        b=nSeJQbQ0SPXSd3Rcoz7ruu3DA43UTajMZOi+hF8lKGhIk1tHqnGJOGSuTIP+AzYv1F
         8NzZL9aezlYr8VhgH3C/cdIPha0es6J6S8M4JYDJYuxA6SLOv01WLN8gaw/MX1AYU8eX
         ltll3LeyPxa5HB8r6f2hLpGKIWdTFWtEoP4tnp2Saj0TkLvc+V/dqFcqV9oggAnNolmW
         SkPb1tdMTuyy1RFTSt43+8ZGP8YTtduej0DU0lZGiAfvacNTRgKcucSuwHlmaujzjHdK
         5Jhe75a6vhKD+1CwkaWbHBJ66DppPXWf4br0ghtF6vJwzKLFG/7pliTenPyv0v76mrjW
         n6sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325709; x=1757930509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyHd36Q32D6LVFmjxrrSCjpcR8v8mTvafzGLYpLOI3I=;
        b=wuGitQUqAz9rXNPZwpWLOOv7azxVZ3uFfTr7syynp4Bt3TpzZfZOizc7dmm3P0Fk2g
         j74K78+5ClLHwgPe0o9r9OgB2xTc/8HR3qZ3SM+vG6chhVTlNobldmLCIpRyLHdGqpkx
         gHHF16YnUwbDlwPK97MCQJ1K87Qb9C/TDpqL6waZBU7xjuGz8BILDy+1OotLAYXZ/ZJH
         pMWHCBvhufPltpLaBXHiMV7Fy8NhMSpO11EYuqG+rmakZlATzQZwCDBhH5W8R6OcDP7Q
         K9Wk/z8DJDLnx/IZrJsBSFvozJHq+xzG6dg4aLPbFAUf7kCp8dacvLr6UOpWi3X3Edk1
         eFMw==
X-Forwarded-Encrypted: i=1; AJvYcCUMPvVuxsd2Gnh5lcoTdCVPen43PjoT9/PURqnJk5JtSWAcFZIJioo/0AdsIKF30Dnvxf0eXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQJolk5Gm/R/uMarlDOa2JEaEvH0InxqyzCiWy0+2QPq04V1mx
	rkB1KyKY+jrnPlBIFWLhCgz6D9fbbwqm1Iye3Snf84taWKTJCxG1aN3I
X-Gm-Gg: ASbGncupNVs4LzhXU5wYLC8gmnHsT6XwULt7hCwh8mv29Kp2LSiRLwiBQUAvkIXK0RI
	MngeRwVO5keK/4B2RqwBZlPJX/eqkrC0j1L5m5a1xIt2ypZwKMsdTbQgAComv1z7QRNDOb7nCIR
	LIlp1GjOJEpERWFOwp9ofd6p/FnjlIGU2/EhrB8JaG11qPm7VwrC/IUkMFaHcJAOXr4AGgmqoE/
	tBbsR7gvkm68omOGHh4B3YVN35KhFWJphepBhG0B8e5uDakR8F1u4/MD+cyWIqocQWSDS0zx06c
	0Tp98TbprpvRplTS7NytPZ6bmT6ys3GEwppUX9NosZ0fz2LgO0iz4+LiDFrwAUZ3lYbJdR93t+E
	EVvyzuQVmqFLOCz2LeiqkZQbX8LMCNs7uM7f0iQ==
X-Google-Smtp-Source: AGHT+IHVU3ALye4sph0Wu+Tnv2WEHOcB5qvS7mM3i56TPwTLcEJRcMe6hHtK6mhihmKypJeKyqYQrw==
X-Received: by 2002:a17:902:ce89:b0:24c:af27:b71 with SMTP id d9443c01a7336-24cef93a60bmr134956285ad.20.1757325708812;
        Mon, 08 Sep 2025 03:01:48 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:01:48 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:38 +0800
Subject: [PATCH RESEND v8 14/21] arm64: dts: apple: t7000: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-14-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
 h=from:subject:message-id; bh=1JKajXUwqRhul1ka4zSxgmuIZmZnF5dN2V8kqpA2Ejs=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlEwbV0Ai/6KcBnAAiK7K8h/Hekwrf8ii3JD
 vUIXaW0sDKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRAAKCRABygi3psUI
 JOnOEAC19Bj2cTcDw/YbvyrR2Y1VbvNwSkj4qxaAx7xK/5DBRHYeRBprDK+1I0jZhVFQEVAcQp3
 /ASswENjcVv/tgFKU/1PM6aQQafuVRTDRKa3Rbtips1arm3MA+hlj7pmVMkbN+THB2vxPnJtun5
 mQtGm2BEqf+TLJvbm+G/n0jkfTbCsrAu1/N1QXNt1stLCkCPZ0WlUQcLGkPGdhYJQlccxH5CWuo
 YLQohlunR/Lb0fKzwYVWSRHqPqKJWsSjchP3wUg2uHLnrKuLQMQOkJqOBCWnCVzmJYOpdNIw5sx
 gLl/Ja54mmF1N3cWrRkqeyWD8tjY145npqfbvHPpeWzcQpTh9dzWMFcsBcyAr1VSd8jGl9nHntV
 KAbvPrvqeJUOZAp9XU7cih0V5uq17aqZ77tdnFpm/bxgbNCkdIbqa1z5phh/YgJtB4eDhiZgMxE
 suBo2jWn7tKLb+h7bQxAkcTCQ4gKtDj86TwCNDr6ANv87FtVUdLXFQmaf5VxLWQ0grbwxDNRQkC
 KIxxWW/Gc/sm3jJc+d4fuZ9gQbBw82htBQhIObSGCPj7jSwQ8k2nwMORywqrLOQ4fW4CeQd+UqL
 Sw5XyebirPlIIK9P8nr+nPZxMqf8Gqi3zHxbhko6sZ+XiQsIDkpUOSv1QGT/Fa39tjcnsRqJBOL
 /4nn0Jfb64M6Zng==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 52edc8d776a936ca5ba58537d4d68e153023f536..98c41473a84098bd70df86c2728a8080b05b41f4 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -206,6 +206,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t7000-pmgr.dtsi"

-- 
2.51.0

