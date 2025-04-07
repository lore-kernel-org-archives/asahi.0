Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A296D229B36
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001236; cv=none; b=ZYLlpd9LHyrCD++Ee0nl6uXSTQtzNf5ug4Gdn6pRHBYX/v+/urOKOSNc4Z6e2TA2zDPArxazzaAYDnGETCoTOtsKbai0/XzW6EcdU9rDBkEzJJihgPmSHZSIYVlSdAEgib4cS5UBixeO8E6AMX0hZzaj7UMI4mLEwYq+UJyKg9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001236; c=relaxed/simple;
	bh=ZHoXysjC3tKjwBhupXya9t0tvevKJFeLclU2Q2P4acg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EoDVFjud1XCj5KoJbBMoIYurfIfwsQ3Yfcf8Y7arxQFBABsb0Y5L78bcANU4dBYRqhSGYurirOYqpOc4rySH/wRiaiRtr7NyyemlHOvDn50sblbGIaX+vYKXI1hXoMNukcxdykcsw5LJLAKhKnwteIl3i66PneV6OLdhIleIFvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPKhd7c3; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPKhd7c3"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22928d629faso37265085ad.3
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001234; x=1744606034; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=;
        b=mPKhd7c3tQJYKqmjlrPgKHyCoQ+i2LvfR2/X6DdjwE5WNkeOv/hX7W6EqJgzPyBRc1
         /EJGgUQOZwSBsadQ84Onb3XwnxUvIK0uw6i9kBH8oVx7Gkw87O1/IcxArgIMf28n02yY
         lPo0HGkGTChXPo9Q897bzpX2nqVtH2F7i3mDCg8gKo8J3+TnpptwTVva7SLv/50F2S/F
         4i+fUrvhE8K8lLrDqFJEoL2AhKW0dAWE2LUBFTBhGHOsgYhq8Yizlmrkhdm7NvTP96Yx
         TOeFEa+u8ZPt/brkd2SHgsbHRyi6gCj3U2fd62VbmIub6ZvpJ8TZH28spObqfB3DHyKX
         RkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001234; x=1744606034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgYxG+vTxBAlApfr9OfPBfVTpSGem7njEO/S/STMqlg=;
        b=N5AnqYGB1vufsM070W/Z40xXVd+gJerm3ivAikD3fKNu9c15cW+fBVK72V6xVnN8lk
         JgPTNgOBnvuoBRZFUkCtGdmoPQwgkcIFg183FP1cUQep2GDrIQ8AGfURGKYvwFSJ8ZoK
         OOESG2w9M+b4WrmKcMRvu4ejoi0Dh/WaIetZNcPfpkr54QbzU08UVfDtbVykTX+iIbwf
         kcqgGCe3o4dZQBlNFAE0aOR3vo25waXph2eI/31uomOWeOgYYktfvBB2658ZsR4/2jIQ
         xMfTcrVYxrKBn4wc7PCY+O6e117keq56/tROHac+4U3GRJdw3axjkoLoyieAlSPqa0SB
         osug==
X-Forwarded-Encrypted: i=1; AJvYcCXrDAsXaIZDjWWcyQF3afle41Blza2ZGZfFjsoyr0iZe39sO2wytPQHMcqFXRWZB6BNNfNrsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhT/sEQg1I5XZSCyy7p512WCraJKB5ZUZsn7gA4+/yWhislDzg
	ycBcVgQ8s5zH/fA2E22Udtj0nxqGQMW3/O1uHKypnwRH+YJSJ3Xa
X-Gm-Gg: ASbGncvnYaMoz894u3Mk7627wSmsnqPW3pmQnNnmuTUhBvf1txr0193VhoC0PWAr81Z
	sHs5omcapj1KhDYrIlhROG4ZR2QfYYRyRkDWbsbNFhOQfGTMknHFO7OmjVAJg4Faoy7bPkvgykk
	3DZthGQbO+YUPftniYSizIhIvh9Z5Rhgw1MGz9gAc0uG2zrS305UlzdW9PdBNYSTxjZK6JB5+d9
	oOReahl07a/yZNpgkO3DJ3/gRgL9VU4lbPWgGra0qQmv8DbPi5i5GxY6KiExCsdNGOO8W1JDfVD
	4vwqBvu1GVC+ooQ7Ff9wqtml13gcwiiUDDLa1xlHH3ey9j4=
X-Google-Smtp-Source: AGHT+IGVRXDaZv4MaSqiCi64YlbFNaNr9jW0ETVrxcDxHOUBBfHyhpbXAoN/raHDXUOn4FNed84NSQ==
X-Received: by 2002:a17:902:f705:b0:223:4816:3e9e with SMTP id d9443c01a7336-22a8a8656e7mr153126495ad.13.1744001233923;
        Sun, 06 Apr 2025 21:47:13 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:47:13 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:30 +0800
Subject: [PATCH v6 21/21] arm64: dts: apple: t8015: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-21-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=ZHoXysjC3tKjwBhupXya9t0tvevKJFeLclU2Q2P4acg=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iIlNNKyQ70bdORJ/DAimDpZx0W96Yy2ZPys
 e7RrOF6AcmJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYiAAKCRABygi3psUI
 JP/bD/9WqrXV46Nv698aK45neuhPCPVAAc3Zr9tC7sjf1zp0kioLkofK6D7l6saQtbodG8jx1FS
 LMgQbxRn9DZ/J84t/w2rAzHNhmLwYbcZ8tZOxYVZS2eGFT6LffyzMAFAMe0yYJLVZ54UDqZh7NO
 E9sBG7INDBrYld8DtQvmMrz1Ior/Y0LfVO6vKfi6kcEcf0SF6HNn/gBZdgUTZLrpKgS02VM/tbY
 Cowa7yYIzwpJ88bllbQcs8gQlnNTidfz34h5gcxooIl2amFFndI1RxVihVTaPMJpKDN+ki9R1EM
 wEBj7B2ayLyRwgaCPZ/1fAeZdRQ7U46Tx9U7qLWgAt9jW0S6s1MN7PrUflv/VTyFMQeTp0ULyGy
 DkGNUU6ThWXz14WZ/FYItrLBlVqaL+YEvGyvOeJIi6jAnaTL7csuwGhcv0sHy6mTSSJOuLhRIun
 4gxCERceNX7oIH8TBdI5syXlfXL9RqQv7O4QgWZyOCk3LpoqhSxEhtcrU4msP4ZbYPXZNnZqWdS
 Hviw1ML4rF3DNGo4Zc7zDUDJhJIVbiivpjG8tQ6CusxNdTfaGthZe3tIXspiFDRp+nHy02wMQue
 Kma+c3RNQcuByy4bB95ZtjvohUO4RWK+V2Q+5moOG9+uGG+pPSTfD3VsyxXZvbaHRV7CDaMl9q/
 Jvv0FscN3xAoXJg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 4d54afcecd50b50ed1fd386ccfc46c373e190e6b..e838b65ea63eef9c198032ee87e63dae282141dc 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -252,6 +252,18 @@ aic: interrupt-controller@232100000 {
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
@@ -380,6 +392,18 @@ timer {
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
2.49.0

