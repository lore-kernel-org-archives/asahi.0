Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDBA29CB4B
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 03:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898277; cv=none; b=RLnis1APd3EcFgDAiV8o38AphGfGpxwtn6O3EGYxF7dZJLN+eF54aY0ellPf4YbBwb3Sr4sdX+DRyndvzPw+gT6/+V8w2H/ohaqiVKluHQqoO3iXpa7cOkL4fWqKGbmoaj+repCBCgNRUcHEohwEn9KKoWd9EyklJc54skUf6y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898277; c=relaxed/simple;
	bh=umS18Mpui1EoUACcGD+WdVdka5VgnqwULsO8fA+OvnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f5utI9ubCVAHVTtPFIfNKG+bUIcc1TWL8rHabv6zqrEVjh+mXiwkBbQ8gFIOreZAGkfZOVl3h6QqWpsuYCf289IkasUn66WoIdhD9idjqkbTOLHlxLnPuonAGICRs6TH4fHOBbFBe13agTmMc80F0zP/V0i9UdlfU9dS90oJVgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=na7PfKeO; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="na7PfKeO"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-301918a4e3bso6183014a91.3
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898275; x=1746503075; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=na7PfKeOrgQAZYURj9TpTxG3gA051E5LkFAIaMBoU8VqnFYKnoESW0kcNBwfsIW2J/
         6wHi5YgMhydZSHqewwuBRkv2yz6NbBHFLYKFDsPjZtWFuwn5FurJ97+/AR9T2z0LccwF
         DNWyP3jKars/RvLUNKLm8oPdvfkpLMC2PBKPCPZFCy1puzKlkk57ipD8jrZ6SLdWw8nM
         U1JEb5Cv8mxGFsKpGpd+7EIa/h/6X1drEHD+9LegGI9+4nAIaa3XspEk3omKy+Ozd9Uw
         LH6h5HuRz6HovdLS/3In2+K5gWO68IyHLlf9AdR7R56L/P//A5GnGgI/YwuE+dE2II4C
         Ty8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898275; x=1746503075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+utL2luHU/M8t1jzjSvkLs9Wawp5wUxO2TP0BW4NMfc=;
        b=XyXjoc7UNL8Rrlwd/kFEXprRzpm+zooTRK3ylBPjcLMd4039XzEvyyegzraYnY88Dd
         TVe98WP45tovz75SML6Y79tTi/obEqwcPd8856Jc8P9xDjCZfaa+nRL/5c4holQePi+I
         2ANtDH89uhM9ESNtXCHqoTqHKgZizjMBY5o4ufEqSzZKyVn1Fa57rBce2QLagXGORdII
         GMZe+MeJieua+s/8/TX2Gz5+vrdvupiaWV9hQ9Pzy7+Bq4G8+W7m9uvabyldNxrm/xGq
         AeRzEF/lqlNvDjU2twojmd4OIaEm1CxcqGJkg3e4BzC8Hz9TVHNgYpXdNLlAH9Vb+/1t
         gQqA==
X-Forwarded-Encrypted: i=1; AJvYcCWJ3B8g0Hx7HIV0HV6YHDj2617/B7862sypPZdK4ggKS5WBc5PZQOTwTsDJ3UNyl46hxP66Uw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrATeAUG2jssFh5PDD55/cRH+kWjdYv8tVPeIXEpf4yKV6cp53
	5KFRsr2MmmHbBtfGRrxTaTZAVWD9rZPM03e1l4I27EK56QmAGz9/
X-Gm-Gg: ASbGncsaekHp2BA/UEfLxyRp2TlaAw83g9VM7NQprNtCS2Lg29QEMaJjd/cr9N1Wzym
	r299i8jYLmfiDYytXkeB932Yl4MyXeLvYBK91o7ojL4nKXtT9o4d8qjUWsjiaubjrJwlFL+rLDd
	qmINevTn5ZXYTow+Xk6YE44cc3kbramV+gkRjOgKL966C1Y7C0y2dklwWAlYlql31MKruYJ9kqV
	SIjC1Rovh1ZNGMRXBkIJjWywE4kkc169lrOxUqW9RpSKw9iyaJ8yrdRHyuOjAOzaW/GBXn4I10i
	9cyvDe0CO0p4gtWWhpSiKb9N4OOQVN91GefDuaaeqAEx90QDu1LF8jkY3g==
X-Google-Smtp-Source: AGHT+IHWfMjbVQ7CEMWplQp6hbDhEW0CnashZJmxKBOUPepAX15akTtG/oxgIuKanhYarcPeCqHQeQ==
X-Received: by 2002:a17:90b:4c09:b0:2ef:2f49:7d7f with SMTP id 98e67ed59e1d1-30a2155ece6mr3699740a91.18.1745898275246;
        Mon, 28 Apr 2025 20:44:35 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:34 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:41 +0800
Subject: [PATCH RESEND v6 17/21] arm64: dts: apple: s8001: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-17-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErl/IRyZyitmYveeenL0GQFh0I4cCrA6w6+0
 9uwRuLZGQaJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5QAKCRABygi3psUI
 JKOPD/94+SO3FKA31NGVpaytKTjTzwMf8DGMAGqxJ3qNQv1fbU25mGiif6KB8zFmOIFvLYaKWGL
 3lHVdyBFk3VRfYjagBokp7A32epeJOpRr3bJVzBAtyIVZqgpLmfpMToHKoHGY++WMKTkqCexJcY
 1AIvtoXobSR0z7CFGe0K0VgakVOwp4KwFMJPtA3m6hveWhGKvUvslHaVSNUZfI8BvmyPZFRGF2B
 fkmqjzN8cyKVkPUbTvKRd7j6hIRFFUtzQ0F2bOvPjMh3k1hguUCEIraz0IrrJY89cYgQI6XzstX
 crkcRrNhOfbzhUx7Bf+JAI4RKtY1+2W6CSEXXwqfEr8gm+WxvaeeqyUHxORn7aXXXcjmZSW8esG
 FxKwhUjw33IrQrZtNqUD96Fh5DL4852ZvjvFJs25Ro5myt7hQOroQfZuIdpZ2chsNQ8pBwdwj5H
 b6eOaanSwrQX3ueBcLwJlIlfjw6zpHm5uxhCWQ1+qgKlTjF3GW9uX6zL6GjR8uWV13ApHCpN+Zm
 Pqf9CZC7srE0xwu7pfhnT9kbhIvEBjnD8rd3elEJ1HUD87JRVph6NcubeYCNYbPvF5XXl7utSGJ
 DICB8VUoC1e5100qCY2XDRjVWVrIOVJiLT8hLwRbmEzMLRjC5yX410cSKjuiRClh7xqZq1yZE3L
 +EU36l+T7kjRA4Q==
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

