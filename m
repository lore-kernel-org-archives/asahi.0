Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C921A4E77
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740715926; cv=none; b=cfUEStb7uVHocozztV83618veXwVoUsM23jAPJ7uZJvTm/mxr/zuNJO/C4fqy6sk/3njWKfAnZQMqqQmLFhgLWr4uUSsjQ2cSDFo1ogqQeq/BYf/qms+vBCaLnKVQf4WwSmdnbn69LnBIPj9WOyHH1JvdkJlI8kmhOTH8utbd48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740715926; c=relaxed/simple;
	bh=gbMJbPuP8ggCUDDTugVSbzAiMEjb5T+FHE+EE/UhRsE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QnzqDZfVu8utlaRGlW7XSeOKI5JtHMbhOE+r6OWsIflWioDwBPO9zgnoW+s/unRVGQm1Y8KowRHOi/E7kKTb9ah0zGv5Z8Al58XAMvPRf7G5LW0d7Efanm4hHDXweY4GbwfQTfEfbRGZ9W1TKxw46L2g/kGi1bzYzkMLrOHf4K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNNwF+z6; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNNwF+z6"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fa8ac56891so2818063a91.2
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740715924; x=1741320724; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FdYvUWAb7XTZZfCxvHyVpJfqR01oQeWoaD5JV/9jAh4=;
        b=PNNwF+z6rT7paRgxCsfZAFuigPMQQ6ZwnHQmN8HuXo/7Wx8TdnYHJrnaH7bn6wJkXg
         RU7sSui5moxaknU7Qv3VbkJ3Bs/RKRoAHxYBHiUXQMQqYfDMuAlKaQa91vcLZfE54lrJ
         xKMbHQY/6PBB+P6TtUcuHqBEJNVQ4yLAZGzpyQH3XlfAyOoGtVceh8+L2WtRoiK+BTDO
         vOxFyX9G6/YJ0H5GClvNa/8STbc467aPTML88Baqg86vAbfKLoUqOHvq2RqoaQW7UQ+F
         sa1bL9I0o/0MXFG5gHHn/O9x7dDohjyFFS/RoZkHRo5xD3e7aW386rXIQxrWDY8MpNKC
         Bpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740715924; x=1741320724;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FdYvUWAb7XTZZfCxvHyVpJfqR01oQeWoaD5JV/9jAh4=;
        b=pnVeTJsl/4bsHcMzQWklrkdNLM2pBjCstm9Dk8SRTGG6Cxfpu9r4S+byvfxwJOh+iO
         HgQDebC20tBTmtis/Wj/C4QNsVejfGVe/5DDUigC4YQx6bV9xw+ScCrH7BKtynDXTUsh
         b4NVWezIpNzVt68Snj76dfHzSgVR7xxdWQr1kSN0vOY0gIynDQ8bBhCwzVMgpSMp9rAw
         jL4krwxJxNwifRd3sL52B+DIIQezUWDi3fMfuDniMbE1AmIdpWQDZoA1KaCC/k7AufIG
         cFpLZXCRy2XyFhenQQZUSgwB3gXhZILKI3YpPf69HuizvOxdkyFZJzhGmkhTDtrRiknp
         oM7w==
X-Forwarded-Encrypted: i=1; AJvYcCWNi61bkuAM1QxNGeue49+cUbKLgvUL03jPtPbXM67qLLyL1A8PzQe8tHAga9W6vozuiAZdZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yym1GYC0DRLxGwL2cNWwHEjo9Q1T3uHuGffUE3elzdYI3wQofTx
	5KUGjs0WDfINDehFFXXEC60SNT6khhMsoKYyvOX/+MkC8CHypHqT
X-Gm-Gg: ASbGncvKwZRXlr+KdNMz3yvXCA5Y/4GUubpErPF6l1hefiYgeykUDKxQClLMXchgeXE
	Cd/OBvSqtqbZ923coMZvcqUk7OVJ1wuTe6j9dkp8ZklWQXWJYzEWrPMg6jYfJy398b5LjX0C72Q
	r0okXKhoR5hleVghi/eX/vtcm8cEkb4/PM5WzWRA+B15c/VrPzW5Sbjl/Jo5rBLiCL9w6f98yxv
	L35NWaltHBrBUBYZbPW8DjeTYUY5u5RJbhNCV5clN5lUP2i2B4W+ulY9tupgOt2USzCystqwiKC
	gp17doVjY2cI6cwx+gQgyaif1zw=
X-Google-Smtp-Source: AGHT+IEZUDDAXLavQwDXUSG1W13QFrekWn1iP4y3s5pFZHode2QXMI3+ncgQHGdyNcHsE7wI8qqVmw==
X-Received: by 2002:a05:6a21:9988:b0:1f0:e4e7:ef7c with SMTP id adf61e73a8af0-1f2f4e10369mr3442876637.28.1740715924154;
        Thu, 27 Feb 2025 20:12:04 -0800 (PST)
Received: from [127.0.1.1] ([49.130.74.133])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-aee7dec4114sm2387856a12.57.2025.02.27.20.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:12:03 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:06:41 +0800
Subject: [PATCH v5 01/11] dt-bindings: arm: pmu: Add Apple A7-A11, T2 SoC
 CPU PMU compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-apple-cpmu-v5-1-9e124cd28ed4@gmail.com>
References: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
In-Reply-To: <20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=gbMJbPuP8ggCUDDTugVSbzAiMEjb5T+FHE+EE/UhRsE=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTeHIP4AdceqgfqxLnsvMGDhSyXATgprKvgaa
 Qf2+iYrtMuJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E3hwAKCRABygi3psUI
 JFzuD/9gYz+RAoruClJw73GI5SFqh8fyk3LiF5737RSNGLV7U/CDN+EykGjIgKhR4GgDqsmkw+r
 tliJKzZf2aWdpvqNlHBnOLA1rd4us2L0rYCv0a0vQk2tL2uFIwcLruKJuYZKRAX6ldZnMcixNHB
 zi07woYDiS/gqHtxca+5BHc2Y7EJLz0XGAOKuwTK13SNtXJTrGnadJbs0NyeiPwMZEXlpCUJii7
 BrzGnbE5r1eIir0kPNy+Vfq6NW630pUeCgeuN5eCpoNZ19hNSkzi2Zh1t/ayQwEu0zvj9/8h79F
 4OasT7nq9Dt3fIHNFklDSUihpGVOsb45PQxK5J6oCAje6EwCbkmsP7XqqzJ+gAIriYaA4ALXaRo
 CAtfDAChnIQ0zB0ygioHtykCJcFnn5uofSppoa48y8sLRYPpc93+zZ5JzRL3w9nc8Eem+hpeFKL
 YDaHD2svRQnItWmAbTv6M6iObzf0KtFTZfHAYMvc1yApfdYtaHaMpNsHcH8TL8NsO42j4N7IG0J
 zfpyzSVZ5cJU3G1EyZmc3g+PocymlIVkLoUYODskLq3iXz8svgNkRhUcjUm2MassRUVfxxJyB/n
 wiiA3ddz0cJ+Dc5cltKtfWF4OQuGvGCDQN2a05PayEUv0HXhb7oq68dgYrMhL3RcrYn23kByQBi
 PjJvDiA2PWqdHPA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Document the compatibles for Apple A7-A11, T2 SoC CPU PMU.

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

