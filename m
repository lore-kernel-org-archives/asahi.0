Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96491F5420
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 12:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054151; cv=none; b=MO7zPsN5TlAsFHogbIF3ixjwnq3+sw2MKJChu9+qxlrL+7e6OQ/T/ERLki0fEPhvdrmd7vU1aJyUgNa85aOyGXlT8TYgv0zWch+F2poaypO9KzcnLnrhnMr3BhV96yeyN8aKdyim1INvkNCnqBl2rOeYDztlB22+XmxlxyuJdb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054151; c=relaxed/simple;
	bh=v1V3E5WkHVmqS/D472EV2ffRCymQYBLBb580WG2bKlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hl4WTVRTjcqdlQkoLZEMZOCgSer5q+v5R6q1sv8PnH4prqvJvNQAWmNdPld4sP5QrdkV4N0IW8ZFN5gObrcWujgwVWiyTad8sClNA7OysUsjRevOz0GWExDXwfaTsqJXEC8jNXeengbvuYOrNHV1ccnD034bEfYzzJP+SuJQoNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJFVvuhs; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJFVvuhs"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-220bfdfb3f4so17450225ad.2
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 04:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054149; x=1740658949; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+fH+M7M0QPKx2zeAS0ZDdKGKMrlScq5PHQ29ysgs4g=;
        b=iJFVvuhs23yYeMwMU212L7ga0ZptG5q7SCHR68PRoA3fzPzLv4URXEB3V8Ks6J4r3N
         HRjUWRXtW+041T8WdlWMCp/YKkyze7amGS61x/xFZHjQzO3vk++kDX84e/nF2Y5W9U66
         wi+NnitE7kdSWzWp8q5ObCQ7hS6xZUMoIRO4SDZAzkSQUEep1FUS7L6vgCNv9lZZFKzM
         B/Qn6xOTqjiglWRypgO2npc4OmYH7aBjSclG7G4Am2jwaflDyUK/WfBj6z1t73x9v8AL
         IryqfRoO5GjGlwZghlS+WsnM7gUTQgYO1ryq56woKHdCGH94OzFh2k35io0BVPfroSvu
         pLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054149; x=1740658949;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T+fH+M7M0QPKx2zeAS0ZDdKGKMrlScq5PHQ29ysgs4g=;
        b=ZOj4ul1O8OGGucJYwG4nd5wM7OApUQ+r6jxV76xSvPHleTATaZL4AFNpbT84taZf9k
         KIjL/2FqQi0G83HAmcHY00xJU8g3vbqTv5k2EF3yZAYI/PPnGt1faBQcKpwfkJQUBFwD
         6icbi6f4Dv1dlkghIh8H8peoRKle7heRdl5OQfT2YnQHnCMQxKYqPGql7TOiV+Cjqi3d
         ALL63836jCLX+DjAWze2vICK4bl6TnLEtO/ddTc0/JTXP6Pfghzoj8pzbDp0Ube/wleA
         6SMrZ2r93iEyqGGFN5lG0d0jtXA/MrTFcvwD2nEoR1c+Fz/LW+rKSVGMXnn1OiUVeiJK
         /9oQ==
X-Gm-Message-State: AOJu0Yxt/geJasacEX4zkTVohogBIO5HeV4ewAFdZjBrtJGCpqjQQAxQ
	T2IUYMYHIZoaJBQZKIEMtLoU/5mUD8VS2R+6MAuStPZovDtnS0AX
X-Gm-Gg: ASbGncv+r3qpB9z2xGsHStV9H8Q7jmJwzO9n0BD+06aWX7XBKGXgLchx0fzIMTT4XiW
	JKVgLRxFicjcWHPB57aYQ2zEwU+zobWAaN3RHLdNOKkHJk/fbvB68CXihRF1WjwXhbsFiPuwrZH
	kGrrzgmwsxbfiT/jWS5bmanvvyZXsTSZCkh2hCStmimzOEjZ3pU/dUlnuhMzv5pjTmAYlQ05z1F
	thyBsAEtKF3sI1bQOaVOVfyg4e5k+e6N691GXqqCJnimzQK3EiPCz3cFf6BJrcrNKJ0Q7JXyXAS
	YrGe3fbUxeAoCIyP1g==
X-Google-Smtp-Source: AGHT+IF2PoDb3Kk94qSCiGVpPAbMGoiZGlMtDUf/oiV3gQAi27yF+wvBuQ9G/yPKmlllaTDzw98zZw==
X-Received: by 2002:a05:6a00:3a0a:b0:732:1840:8382 with SMTP id d2e1a72fcca58-7329dcb4d5bmr12388136b3a.0.1740054148987;
        Thu, 20 Feb 2025 04:22:28 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:28 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:42 +0800
Subject: [PATCH 1/9] arm64: dts: apple: s5l8960x: Add CPU caches
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-1-2c7011097768@gmail.com>
References: <20250220-caches-v1-0-2c7011097768@gmail.com>
In-Reply-To: <20250220-caches-v1-0-2c7011097768@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=v1V3E5WkHVmqS/D472EV2ffRCymQYBLBb580WG2bKlo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5+88E85lGcMv8Rj8CoWvDh/DXWVEM+KTtJu
 lJUXhUbSkWJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefgAKCRABygi3psUI
 JDxRD/4wYsk1/SWK2Ze/Ilh8czAZLIhE+GPx1uP9bjI6owuI8/GWARs6kAN5HV7P2kIug9O3TlK
 SGNQfpNtxf67htonZKRdu4kErrjtaCV5FoaGMA3x/cEtmjnDgykcmFBFvQHtbslefA58hO7ecHA
 TQLAb/Sk+O0V0IByofqAXToAuNED/5DOMi9TuNHGa9kEuRMpMkPb1X9YcDgkf7il832Ptc636ub
 lILaGQ4isJoWthOXCNIQa9wkbFvzKucQbZQegUEyMWp4xn73KbVIgpo1+ZyIZB7zkNbdTcedI2X
 otIBsmJalY7NaswnfVyKMSH0F+wpGjQgfZWKhZqsgmkSB5MXu5IsTA3hBVcEAw3QGfzf9wPQWf7
 h8MPZdmspfFdTT/ppimuWvjYfClFIpKq75rR3AnJD50wbi+BNRmMeqBXf2rKu28VW1bfLkijt+G
 PD74iwbKDli6QID3VebOC7qtKLIJ28RsJCWHi7TF5STxA9BMlhWxoJkwMvYiuTN/0zS88pDS5EH
 t8Z8dUEQPtPrpTWurpq3cuMGVceCUXIiDPM78PF8r7u7zAyUdBMDsC0kNos8D/psYlNAPWEAUBj
 4OPEPuP0XjX57aRUr6GGC2VZs6pRg7EexeAPvDtwKph2iP+Fex6DTQBOJn5K5AzDfpbK90HsRfj
 QwNU1bmoLp2Nsqw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add information about CPU caches in Apple A7 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s5l8960x.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s5l8960x.dtsi b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
index 64dbae5c73515bb6a1651b9b26d349d0cfd0408a..e58a3a280abf72c0a390cbefb4fdf89942d77512 100644
--- a/arch/arm64/boot/dts/apple/s5l8960x.dtsi
+++ b/arch/arm64/boot/dts/apple/s5l8960x.dtsi
@@ -37,6 +37,9 @@ cpu0: cpu@0 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
 		};
 
 		cpu1: cpu@1 {
@@ -47,6 +50,16 @@ cpu1: cpu@1 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>;
+			d-cache-size = <0x10000>;
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x100000>;
 		};
 	};
 

-- 
2.48.1

