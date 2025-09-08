Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497992F616C
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325649; cv=none; b=MmLM8TwXVupbMMjJSPj43ahUPniE42mJD2xpONLy/lMV0rMJX7STaP8ESCCbadsdQWvx1otrSj3dLKRf1rQxS8B/mHuh2pDoDl3VXCxUQJwBcPim67XhO5ZcXVJ/HsciGB4syP0TFfM/1/UMfFN3D+aa82hVxcKb6L6qINNDsSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325649; c=relaxed/simple;
	bh=octx4ZTnNO/R4DCoPqgavGVNNjwOBSkdB0RJJeuCRxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qCRflu56dgJ85AQMB7B9aG24BAp6Sg14EUlTBP4IBAe2xXIvzqChibJFecKsT0bclLjhuy7U8gCSho1TIwX77If/G5HsMeIHn6ZkkSK60YnVtieDcSMjv/YdZCQgCVN8suBi0pfQkDLtBflJRDAt1qyQ7wedkkq733jOz8M3Zgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jN/LV0C2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jN/LV0C2"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-24cbd9d9f09so56341855ad.2
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325648; x=1757930448; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v7IroGFfuMHil+70rPWoixnASrFWM1LVOm0U4Tub+go=;
        b=jN/LV0C2lx15sHn6uqlPvVccCeQy9xK62PPfKTGYhLEudo68jxQw+CuVapa/tXZccz
         HlS+Jj4dwj1jcXILL3nGzZA37psswu1QmEHzWBRwaxkz90tsF2exLhRfICBEZ2BpAlUw
         h77kjQmrDtziDcMaOyMhGpa+2MIbAcldxMx9d91tSVHJCo9umTL6fhPT90His27AcdhJ
         vjFtoAJVK1m6j9kjluTwZB8jHIqD+G9OggyYaRZqwe8vgW9zUCSpF5+QX4h3i6XNhLuP
         YqriDSHfgJLMAjU8J7xaCyBOUlr/lzLJKvjeYMRLMMa61afuZGpSx35FsTYp7ldKI0wx
         BdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325648; x=1757930448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7IroGFfuMHil+70rPWoixnASrFWM1LVOm0U4Tub+go=;
        b=EaVI1hC26JC2dFhttjqMhZ3XrkhhPYfqTc+EdrO50g5hZCXBBuj/t6a3c+RlWkg861
         GNFVfzy1i63NoZBCRcQR8vZQFcL6bJR5TRrYToYjQemhhz9WX1m1mRk6jSEXyraWdsgc
         Y4QjIAJNrHosI1HFEvSNIhPlUDDebiA5hunUGl1TnIeus4UPqP2g6gk3Jk6csQ/83yzs
         g9MXoCFC/xMNq515J+gFJ37rO3XLnxgsYzTqYafMvazIj/qRg4HzqhlmVl8NpMvIm9HK
         X/GdfpIvLxNs0m1lh4dZGA3FQ2QxhANm2LvX6Vtvas8uVegUCjHxQ25oAtcE4gAY50WZ
         BZqA==
X-Forwarded-Encrypted: i=1; AJvYcCWfe8ctwQQ1B1vfsgOwd1bzYgGPNKq/FtFnCARNkrKqV+tcbEEyLgbWkCmyq4FrDGsqH8HmPw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTZBdc4ZEPuP3+HMHQeGcAa/FaRzwGhHj6hhULuWZL7vyKXAeR
	JdUsGiFKLIK1BLf2nDBfNw6Bkz53m23Pz+Y8SFTFXg/+qCP9Noazm4Aa
X-Gm-Gg: ASbGnct6OpTRAuMR9nxxnME8P0WlFy0tM++AaeQVlQe9ZSfCBlHvpMc8Uy6aZaYUGWI
	A1kLHL8q7CJ65GVxz14yjQRbYVlP5myaccjOPcTxPo5XcAyJHdxwnyMaSIhUg1rk4CIWvrAP2U+
	Zr6uRYpQtogGseGLbAJKXeuf1PGSTYghsFVhWg1od8XIJ/mW9gapnUzelGeeHrWQjXLl9ZfQgKq
	Atb5WOGLkFnzadVUrcP1KY/oOmRQ5harHOxCBBmALK4Arjy94qgoUsCaB6AIFyb3sR8GMyz4+CT
	2utUlW2zF8y9/hox6B+aWkHdDp9ilRriXr9MRCfOswA20I3gTNNTUPcy7L+2Zki0CiBMGhrT5DR
	LipdQR3CkcnWpgbZR7+dKypyock4RWd7morh1ug==
X-Google-Smtp-Source: AGHT+IFsPZJGbWQibtI69hZHXu8fKVk5G6jBIPDZggi8j75kOe9U45Z2azxmFroNNw3gmJ/V7Ni/Eg==
X-Received: by 2002:a17:902:ec90:b0:24c:7bc6:7ac7 with SMTP id d9443c01a7336-2516fdc7190mr101918085ad.18.1757325647510;
        Mon, 08 Sep 2025 03:00:47 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:00:47 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:25 +0800
Subject: [PATCH RESEND v8 01/21] dt-bindings: arm: pmu: Add Apple A7-A11
 SoC CPU PMU compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-apple-cpmu-v8-1-d83b4544dc14@gmail.com>
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
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=octx4ZTnNO/R4DCoPqgavGVNNjwOBSkdB0RJJeuCRxU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlChNFI3mthcIeTlCYyHJhPM7C5e6BjzCC1N
 tL6LoHRUq2JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pQgAKCRABygi3psUI
 JNUTD/0YnBxui5mvov2K8mWd9O1tHzRdmwtmrjY7djVyJI5LorUssKVMdKsrPFSkBwwilP42wqq
 KKLZwunYeSkkC+QRtBrgWnK0Dnk0V4GgAx0Zxz/5R2K8Tb8HWN/Tl/Wp8OYPmBZig9UosPdVLT0
 tRZQo+1EhuMsr6WGqsGVDG16LP7rlqmBK2+yipL7LBZgGNM9DP6VUR3NZ1ji794Bo/zvxWPK6S2
 2INBnCWOCPmbj3Y7ucHBjqQ5Wqo6s+ZUWDmPAt5qty6Pi9rS4IdDUHQd8RNiDCRse+HWqaMWuPH
 VdlCbRmMSZWzkRtNamANXo/d4ByNcC9mmGlpx3GQa2scfPhATeFipJwNm9WqwRdxswkqGUUiyqm
 Eu62wk88oVRSdAJxJUtHZ3iiTlbnkWpc7w3sXb5U941oBDcAhCbbdqVVXGBeDMJY7l27HOK/INi
 Pkm8Ji+xmY3aKOh4ccjw4oYiIZ7A3OZrzCK/Gsfj/eecxPlR84cu2i8OqqRtvficgTiIih+ULMU
 VvDtFCWNaGNn7OoObj93WI5B9VWzWi6s7SmA/cSe9sQ1gsoRO6Idfb/fIkQGZjSNorSbmiTeYRY
 SfbZuf+0pflYNFivXnZu0AlkZdhHQQIMJPDgL5Z2QkDvIvMjALrX28eDsTFmA2b0PDHgiyZvNyp
 /OYG76R7YW+Sz8A==
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
2.51.0

