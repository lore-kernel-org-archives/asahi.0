Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2E236454
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889895; cv=none; b=YdH59se4wPfMMzX/+C4A7V2aGhszDpVL0ddJBZwkCFgVJKcp80hcL8Jy2zxOAzQd7bZIBSZIZ+r6T15MLrAViCaVPnT4u+g5Hc2JzWOLiQdlG3aWm2gIV7TOc6pUXRGCp+Mw/s+Vz0M9cz6QpzRSlhD6ddzlK32ytJXn3x6cTZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889895; c=relaxed/simple;
	bh=nvc6B3SNJrX+OFSnYkWwiXKVem6neRj112hzdXP5HLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bLakteQDzQLE003qIS7rDH2QzIpMkDY4nQBaPoic+FZ2eWeIacbM9R9mlJOnmPnkWfifspzXZcdI+UUBOq0MrDBNMsRmb3GQqqipcOiDX+JFVS/XxVErIb3gQzrh9ApsBDd0um6GWXcS9UxyzjXWQZONM0UKSJMtCfsZZWTJsg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhfjHJx/; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhfjHJx/"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30c3a038acfso2620661a91.3
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889892; x=1747494692; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=;
        b=MhfjHJx/vvTbjEV4/W+DmU84pW20qsygKTpl74VgAkBkEVermIVVwFKqAnurEFUVvt
         y0ye9Z0rvxEsVecJMrOtI6FCT8jpPNTQOyL4Z7DRRQ2CInYi6f6frRCJhSP7mr0Gc7Zf
         VnaAkCGGRB13FuKpJkNUjNZr/7VXB1nYZODrxXrb9B8Q+XSdByK4M5Wq1KeRhixGRQB3
         JHWH1tCq1ULV6TJ5xJw8400uaXJgV7FzL3e2Y3SJ9Gjsb446ML/ZwT5tR3QO4hJWf9Sc
         CuJupI6D70hMBAuVjtXSPhgqx2doVUftz4P9uyWrH6TltKAPuwM2sCpY7srTNqL3VJ8C
         RvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889892; x=1747494692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1WhR61nr7Ljl2PHcEGBKT0kq+BKIGjpo8813I6tRUqE=;
        b=AFHBKi7wVrWiCq7hSimbsHES4D7bz5cFXWsZYBuLZiQHSFBc+YiTE1RIkOYf+tRfa0
         ifCx+EUGe1FVSYyt45mSOlXHCFE7qLb58gOQ+ZFLL4+AnVjY7xsbb/ifdv83RKWiVRo7
         COWKWCuz9v2+QGajgzBlMlx0wznwE+ponb0yj1sVT1H4Oic+QF3cw5nqx2UqxnPky9MJ
         cV/jbnIffPXzCEX8lmMXbDaLhB+a9JtFKkIL3uYdP9rzLzWbuwmbi7jEzUCW+cDFp8S5
         7FSEFJD16gm51FW0cz9ZwgLQPKxVi9xuJ+k3wMYbaDc+hx+NEzOsiYJpKcksQuuK/1ex
         jJfw==
X-Forwarded-Encrypted: i=1; AJvYcCU67wTReYbbK8UQtksyqxybC0bfpECCMRH8rNFBZ6N89CrE8MhbpJ02odC8JtsKKL74NUFzaA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzeJts8+ANDaZsFSZfFVT5gvYyUeWgyMINn6hbXdelP0Mh4vpq7
	jDNkm73nxUXlO5wkFkjDFug0CwqvxA4fsV7DDkiEwKgYD/ivSZaOuFE4BA==
X-Gm-Gg: ASbGnctZYueVmmbTkQqkqXLMdMBN2ZxH81ZhXIllhLI/+3KeBUpwXtHVu6lHKyaDvgV
	Qij7e3gSM/yQ39/WiPdSLC/8XQLTdQv8uXrH2DYvLBakgEB48CBaX4Lps3fQabsM80eezKGuu0X
	p0KfBagHZ/rybXCSZu0ot9W8bGQKjh6D4fwO8il/n1X4JxIXdsLfch8TDUMOiBRl3RvhzWxQJzz
	rOtdRXcwqqQydALomKJojF4fcCPuYojQfzC61GXOtYer4/kN2QFozJSxw1ayzcGQ9CpSncrU0Ke
	dseb/ZAsrDc34+XYcpuoEzKrqlu1i78dbTja7LL6NOZn0PLuXmzpcQ==
X-Google-Smtp-Source: AGHT+IHrMovLoBYB06/EjKWeBypsMBRxgshoSisDFkycvgWn5VOYB/k1ZbKV4M3dF8qrnRM0Y/GUUA==
X-Received: by 2002:a17:90b:4a4e:b0:2ee:e945:5355 with SMTP id 98e67ed59e1d1-30c3d2e355emr11285339a91.19.1746889892151;
        Sat, 10 May 2025 08:11:32 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:31 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:42 +0800
Subject: [PATCH v7 01/21] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-1-bd505cb6c520@gmail.com>
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
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=nvc6B3SNJrX+OFSnYkWwiXKVem6neRj112hzdXP5HLQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yaA4PzDuDwaa2SwrJCn+pSUhc3vXjTbIK3Y
 ZBYp0Kpu5SJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9smgAKCRABygi3psUI
 JJ83EACDDpTag1arv9So+EYN0Rqul10K5q2wzppnkN9JShqvDgPNebEuzwTqkYBwJwUKqiiCFv/
 v6ZsMDt0JXkMPIz3TDaWWApJE0rlXL9sHugoO3WiBMUHPn7U20KF/lwMM7oRYWjfqq88d4SSv/b
 4Z5bhlvE0TpiMvgLPVzbTmkezwgGT2/EB6306pmzdfkpSVXLVyInZgiINknE0nxXnPsEQwxk6TN
 eA2xq2C6W/YFCt6PofdGY28mcf+pUUbFinY49rLOSXQTc2eAPje8PG3tRZ72Sbs9IwM4eQK4yyq
 /aQwSogTYmOPOUiVgsemR1FH1y9951qZibKgs7m54V67S/eXMHJLuaTtTrcd35XFP7MWyrdl34A
 oUXwrHfmreo95V916qgUtBWRe/915JXyytXaQ9cuKXNaY+7F2UQVToTPz5LL1p21FGOeLYIKk/a
 0gcL0+9xkFUGiEn00PtdhXbOzO2ycYS1p2r0cqupvSek89hFdeK4q8IdYITMxiEG8RhMuChews1
 aATU2TY+2GUASVgp0h04fK+WYB6tn89hdEh9B8MMVY0Ah/cg4/GwMbhvPGkOVruMZlQP95OzkUh
 SAFw78LVBhKHYN+udFOYM31qWvFYN8OJj258XdUugMlHNufB2zKN4vXrzjmwksWcDyJ9T12FWG2
 k07olloAlwHGTjQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index 295963a3cae799a54560557137dd6b3cf4bd00f9..3726e1b78c42f150cf1dc68a6b3aa3541517c311 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -22,8 +22,14 @@ properties:
           - apm,potenza-pmu
           - apple,avalanche-pmu
           - apple,blizzard-pmu
+          - apple,cyclone-pmu
           - apple,firestorm-pmu
+          - apple,fusion-pmu
           - apple,icestorm-pmu
+          - apple,monsoon-pmu
+          - apple,mistral-pmu
+          - apple,twister-pmu
+          - apple,typhoon-pmu
           - arm,armv8-pmuv3 # Only for s/w models
           - arm,arm1136-pmu
           - arm,arm1176-pmu

-- 
2.49.0

