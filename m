Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F10C28137F
	for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739457388; cv=none; b=dOshIDL2htEMvQy9Oc4iZ4ANqXt3KPoiqRLbnshRDUc/ELeTFn+mQww43LephH0u4GfQu9a7mW4TrU7K1Nkdr3o3XwcgBac5FiS2wgb4xIwGWaa2vVSmsCnd6UGADQmqVRD1L3cQa6SIIVKUXWFLgnrvGRZr/uYx68uuvA1T5w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739457388; c=relaxed/simple;
	bh=IvblILNfK65nRmNXFfVq27lzQtZVkqPdlXpIO65Xo5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FIt68M7T8s/KG0fGKVurhiSj0b4Fp6jWOapdyycioJFsq9aB9161FYg2eDpt4aJ78mH/k4YDyDIDNMU07H7OfFuq+702UhvfYQWRsyzNVNl5F4YpqDHTN+ZZp54lj4OQecnc7nh8sEkP+c3wfQNvky4TGU7k0DqC+VOPZ9uZ1x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFKMGvbF; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFKMGvbF"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2fbf77b2b64so1771808a91.2
        for <asahi@lists.linux.dev>; Thu, 13 Feb 2025 06:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739457386; x=1740062186; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vprohxk3JreCnU/aMQ3Cwcsm8vUQGIhxwt5YLfMxZE=;
        b=PFKMGvbFKa/YuYgzTFG1ZtyJDsTDHTIsPFRYDUBSilkD2d/7Meg4V2FbydXhPMtCkz
         7r0/fZovzI3/rkagb0sWLg3u60XW2yc5MFmKXsamXJ9kWFH/bUWjxZ06oVcjn1aKuEAG
         8gv8zXN56rjzA9B1Tgb5pjxDE1rRNzzRPU17Q5L7gQgzuWLGpKbWwwfNqXhn99BL4M2i
         kXmMAK/StE3GD1vkn9AyVSUWoEJ0LT11DIqEaRBer8eGUGBUZ6MvpoVunR5AOSu3l3wH
         TMgf8v56W52WpUvZQ+txa5R/7v1sA7xqT6vzW/Q22ttf9h7IcTuaSapOMpR1b0triHKj
         +hkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739457386; x=1740062186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9vprohxk3JreCnU/aMQ3Cwcsm8vUQGIhxwt5YLfMxZE=;
        b=p9TNK19FxpwWKI4tQYzAVds2PZzgklsmk7vP4inklmOswVsxYP4gb+w+T0MeJ4Th65
         cRdqnAwgBGTDAy6STBsyRdShkWsh+FI7pRNMiNq0ZjHH33K56wtjTCsGZhKOY7LAz3ix
         /y2YFT3Xj4IJdD67LNWTgG06f+TIQdKlw6i1qsttfYifbrmfCzyK7rxai+6Uhx/bRQ52
         g5MTt9m/0ZgQMWLc/NHRkMwcZXCLJea+Xc+klWenuNoIKwg/uhJOHKxS5F3hRi6AhMpF
         SpBYY5vcO7iSX1ve+c+RLGcRrqskCfspLlchJIhir/xsnCQuvDLF/srZdX/TmEI0zQRv
         yP5w==
X-Forwarded-Encrypted: i=1; AJvYcCXeZzj4qTMqovDM2/4T2UqkOd6SiCmV3TGilnQIQ4SF1joknUF+vFuR+iFGAER/ALR87QPVww==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBdEbHX4x6M+MVxXfYTKtIG7CDQF7CwZWohsJ1PsyJZp1yP/9f
	eEtzoDPK69Xi2w8hE17LEMDkvNLduyJXkmxjp0AeJzvHv24AbFkzFL1b7Q==
X-Gm-Gg: ASbGncuYVvK0qI/XskQUant78rGQlYYobr7e/T+VyJM1xLQ5ft+XM/Mkjvp/kQ1zLNI
	SvMJu93HiYfUy4hSUW4aphjq+T0KF7908sMc2TMY0eZ1/KlXAGauZD93ek55whgb4sri6ZQu1dI
	id9RtSkGW437DhEI6Nt+Xt7vsmqkIBHquyO0rLj+xvcJ6dFK1DLU6BFZOKXLzplETwKSpgEaOA8
	xed6cAssY8ZX9M89sA+dmedOeuAs6ER7yM5KRmXsUaGdaEqfWoDEgnpmEcV3x8vGCzeECuolIJ1
	iVpSM6bOZoEDpIMr2w==
X-Google-Smtp-Source: AGHT+IF4RaBshAbsZAbU0d+7OJwZz5y9P8mEbE5ZRo5bsmk6xrlhZCkCowKA/tadWVVR+OksLyqQug==
X-Received: by 2002:a17:90b:264c:b0:2ee:8427:4b02 with SMTP id 98e67ed59e1d1-2fbf5c5e239mr11221868a91.28.1739457386366;
        Thu, 13 Feb 2025 06:36:26 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2fbf999b5b4sm3655165a91.30.2025.02.13.06.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:36:25 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 22:36:03 +0800
Subject: [PATCH v3 01/10] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v3-1-be7f8aded81f@gmail.com>
References: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=IvblILNfK65nRmNXFfVq27lzQtZVkqPdlXpIO65Xo5E=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrgNi6bH9gq/2V1s/QQdHuEps9tUpFBbFo4avc
 B9WT3691ZiJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ64DYgAKCRABygi3psUI
 JJzMD/9JKed3nvtgK9t/Ni8ZcHFenj8Iiwp/D4Ve9BJ1bFG0fhvJrI+hHA5klcqShBgQOWuqsFr
 yHR5nRlQFoeSHj8Bv0JyO2eONb8ebbYwA/XBkTvbZ31m2KRtDISJJdwsL0vdWO91li87Yr2aPIK
 b9HTj4ZyitNTlZe55/iiLXFHPd7KjAJQ/tYu1cnYgUSa08myxtyZ2yhWe99ka1mwsFtiJZdrXWb
 3nv6uxg50Ufg9mi7+10vUOLpxjTtRbqoYM3Vo5SZEUyMGNGSx5AKyymujuwS0QV5/EdiqnAutme
 jE1mJXD/eJAtbE2yUaGYtmsNrvcS73bfE/JQlr3gvBZX24t/Qa1NcqgsmTYq34RzdOC2zW/LnkC
 pZ/YC46UqKPe48tnPgYWOSGJ7Ek3A7QMgqRVViCtlK4/GkcaQTWrxzWFXP8mPh/3crSN7MC05C+
 6RY1uZV/jFbA+GZvxzg3YzbbDs1HBagXnJu+52StdCvRjdd0548KzCxIgwdnMsHZxm4re4QtlT4
 TlsZPCDlDlq705jcV19amdlPkXQCBYil9tOlpw3XA5LDxyJ+W0eX6veaaj9rZTjqv+ctqGzT6FC
 tMCCe9p03k/evtLh3khQQ5cwm/jybS+wIfPQfba4F1aBdy3uCXUs9cdD5UQqi4MesSIfpq5tDIH
 fefeh9ckgm2E7Aw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Document the compatibles for Apple A7-A11 SoC CPU PMU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index a148ff54f2b8a92fa3fcfa78c1bcc525dba1c6dd..d2e7f19cf6a2d7d2348d163d37c2787c7a36bbd4 100644
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
2.48.1

