Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E7E25A2B9
	for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 17:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380985; cv=none; b=KEuFqfpUNzhiHLx1Bw203dJ6oxQrAVOqmJQjMwCnt8VTOec0y27Q+ELbq0m+7o5vjwLhptWDKBSgtNPD/S5BL1UfYC/1alYcmIjD8j31oAlXpR1T8UBXeUoICePu+LI9S+MhiCd91Ne+MBvwxWFXG565XOLShGn8xFIrCPPeCgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380985; c=relaxed/simple;
	bh=xKNBKHADoFe0D0/YamWRency2Eic4YhwlS1J3poCzGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OxXN9EyfdCNR5wXbjN3e6go8eh883Os675IORqJEySuQWuwLJhZXSXKblGxuc72yLSdf6uVnFgXfvecPa5AS0QsbSnF8LgMgZbtUV5oP7UpZFFaZvHpaqdG1/gJalMn73g0p6eWVXWqQx/StkE3QWaNzRd4NU9TzTNPAOTgDg3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zw2esZu2; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zw2esZu2"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f61b01630so18287005ad.1
        for <asahi@lists.linux.dev>; Wed, 12 Feb 2025 09:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739380983; x=1739985783; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCgOaShG88KaX9ZrY+HfMI5Bon6pKtYLqZUjsI6n6g4=;
        b=Zw2esZu2q8roeEDe3WrIsf5hW39Yd9vnfwcmSk8RHVyn2LbA5FUy7X08UVTg4WosGm
         yV/b0JPEzA4O6HOylv0WUQQKf/G7i3xSSQFDP6agbZaOt65Y8P/hfDswvu+1DavsUJfU
         O5lCzG/vWjJCSmr7IXWUJntn52q2dcYl0s1WoAn7h6AMoIUfcGUruuIij+hjCQMvWc5r
         Iw2+Tencw/yMCSRwO4w52oJN11FpJ6zrqBSpKj5++NDqugqLH+4HqRgbnkeSgPSL+u1i
         1REzfgT3T37NYfaspfM5Z+3tJObFuZV+OyyWnQw6BxCxZIs8S1qHoQ0Bpv2mbe0vwsVt
         mJPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739380983; x=1739985783;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CCgOaShG88KaX9ZrY+HfMI5Bon6pKtYLqZUjsI6n6g4=;
        b=wgoEGZbe9Ve8v+DvFT1dscV3Ja8tmbrngqHyGX1CRamRKYCRBLMvmPQKlpl5NuiSas
         7ZGstYw2GPyaS384cf61XsWEUlx8BqKqqqwSEPoDvYjvKRRQ04IPfu5o9YPNAylS/XsC
         YGPOtuOknNPC86PfQTrtpopGZAD1drII8G6upshFPvTnSbnkUPq0yPZ1Je5d5dmTNM9z
         Dn7oqnKTt45f1uvA7VUYm0lCTwt9ULRNxdXj3tccI0Hkns/rqGDrMsQ1/JCma1WVpSY2
         33Lz9h3L2GyzqWNs6p5D4wjJ5tSoGCTvlEjs5nQgL5JloQ7R9hfPCBKw3SPynLvUh3mE
         wI4g==
X-Forwarded-Encrypted: i=1; AJvYcCWk8DDb/JaPN/vl+VBUN0Rmfi9EBEjDDBFSbK9TyR6WNRAd526qOgnSDCbvmMi2tOPmez2SJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIniS48GlL0u2fZvHdjyBzj0Xh/0YWmKlgjsBluGACka1lWcQ7
	JFAPYHq5sCF9+FVjuHDTHRnzjHFfd6/1MrSMN3/vBNOiHQAY1YMp
X-Gm-Gg: ASbGnctUaYqAT3NR2StU2VCb6Y75VdDu0WxvMBseH2GMRaeo8L4P+dOheVDobawo28S
	VhrhS5g9uGQwzYvXyn2/QAlb1U0mJiZoBNRLxM9ipaKpWp9F4HU2Z90Up4aMnyX2wPtxlKF2hQn
	Qj4kv+ibS1UvEK8Xuvl/ZoKZJPlETJlKIA+4bkMiXNTHRh2TO/8EtUmcZsIFuIm4+XiHo9ujFUm
	21hzdkkFBCFTHagXyc1WzEPFZt2+oUYqsrA/zTCAfRRTGn/DTXj5d96p3/4IpOpjgOR5kKEgq3K
	CGqajtAnJQW5KISTdw==
X-Google-Smtp-Source: AGHT+IGEy1jSFc7CoEH40Z2HRbFahUzGAgG3SF1zUBLy8tYFGnP8eFybnOnuulflEwPS88Om92TV1g==
X-Received: by 2002:a05:6a20:734a:b0:1ee:64c0:aa85 with SMTP id adf61e73a8af0-1ee6bae9454mr152576637.6.1739380982936;
        Wed, 12 Feb 2025 09:23:02 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-ad54f1691ddsm6001705a12.61.2025.02.12.09.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:23:02 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 13 Feb 2025 01:22:24 +0800
Subject: [PATCH v2 01/10] dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU
 PMU compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-apple-cpmu-v2-1-87b361932e88@gmail.com>
References: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
In-Reply-To: <20250213-apple-cpmu-v2-0-87b361932e88@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1038; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=xKNBKHADoFe0D0/YamWRency2Eic4YhwlS1J3poCzGo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnrNjvWO+25WvZjqa60EjVC9mqSIkhHbwtfm+Dt
 0wHaa0R9XKJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ6zY7wAKCRABygi3psUI
 JLWlD/964sLrzrYk5mzJZPYQe5C6BGPTmD69eecHjciATrYkefUjS2mNGrNwu8fFrk33S8FEtRE
 9pj9HJSteWctfZ6jMMOr6XJm1FI9KLbo9TVxRhnV2jn+rSpa+v7LXJvl4ihWFoG8jerRrt5ULgs
 dCx440En+aKZ5MWPwUFXzq2RMAFaFtH8O1Z6cChndMEq+MGK1fIiPwvC3iXBsPmqQpmF1y/tWYB
 wuyLcfHp8b7JzSp0p/6J3iWi8inJYdUl/+EGJVdGpdIRXkl5gfUGG5jIXq3YAe52M0n5qvC4RD9
 B6CL4BbtmIoAvl60FAdNMopJD7iritzvulBVwQV0XN1HC7tO6i0h9AEI/GlK8ufK8hhc+Ea6ZwD
 OdMol0Ub0+iMpogYqSYh7qH/18QGXBOxik6HQ8tXZMDMxdIhlCInGNezu5ApJfGYsyLebGFSrpQ
 Sxmo9u6yQ6WCYjzNNzRmArs+BatLYvUrcvmR94sluTAf31d7OIZjVc80Z+BgPA47QnffOq0vVy6
 SaEzELS2cfqOBV+wV/Ou1Xo7t70prXQeOhJ4Tqqqx9smOsyoYpr1Ag6cKh2oQCKbmLLTxzZN7LQ
 7ZqdObroNYRny61Xyy62qTaTII35GjEVMYi4vpB7WRDHsF9tqSZFIfB9Q+2uJneOMF0lCO7Odl/
 KV90+5FraX7ke/Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Document the compatibles for Apple A7-A11 SoC CPU PMU.

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

