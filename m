Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A3C25A323
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889944; cv=none; b=ul0EZan/Ij8Alyujqbkl535AEZRy8v32fYWYy9ae8Tj8XQjVMGJLQ6glo+xP3PW7tbprNL5pkcI/O5mdDy1VWgMhkuIi33Fya5MlTZ1TNuJJMqhxx9DdPtW0skhVlbaFKXdS/4n+TjHjv6w39a2nDRglvnTSHEhKKxl9X8ICU8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889944; c=relaxed/simple;
	bh=duxT7MNXJw4vPLeIH5239k3CmgZWAQGQK2kW07pl76w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tkmUeKU4EoMo5PwIOvzW2Z/HRTIrHtUYh6+L7yx/Sv3kr7HibaorK8WcXXc65EjROTq5dk/xouG5gDkNrZBPTr9nVcWyW8gQvoOaWL2M5yfRsLTKMrnzIW+uRO2yg5SZKwlpbJ6CMCQNcbieBCSOPAfbJ/4rSjIQOEvOr16qXgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxnAvl4C; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxnAvl4C"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7423fb98c5aso1355672b3a.0
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889942; x=1747494742; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=jxnAvl4CsAgygGjmsAJvDMZq6z/lDQzkQ3stwDnVSkGD5A7BuS22oFaXHTXTDm8Eav
         LeWBY6HBWdE0bmXVlVIfUWOw1KUO9vxsMWEV+jWD23iX2JY87Hsve6a3ZA63AXs6B6Ny
         2Aabr2Z9p9qpvxvawA0jWTasCjJk7PKQat4EKST2ZnekSHbprR0hHUe0n2h3M28bdWuc
         2oMuDFJzy/+KTRucBa3Rtz9NkQBm90co0NLbK4tmCi+5h9Y6yxHxyTazpfSNG/HuVGM7
         VMuT2agEJg7wEJhkB4++hbqlroscUo0LUEuyKzgUi/W7iQpk+nvaXyMdRQ0M/aXTLsld
         ur8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889942; x=1747494742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QbHFcfneBNmb+XSCJr8gKBnaCoOSbgUaXguXGZhZ7I=;
        b=iiuIhxyXaFBEHZzuucgwle+vmBUNbaIcULjkDPloNLHLtkljBzRrwUnSh4xxUvey8F
         sZeGA7CcNfG4yt7147g7QxbwqR72jD/VKBsnp3P44DE1MYbTKzXhwnsp6GKbU47OcCU6
         EZPFjzfh9jb8/NbQh+Zqlmai5an5zpNxgL+G8qFx0IJkh2eDI3TWPmeb0OdSAa1vvv79
         9ABhjFbWINc8+K6ojBY1L+SfDfuOeLpJzoxOcbtYiRP1pc1m4L1HRKWftHQ+y9ZImkTe
         YDZjxm8d/lkgs/IzEf3UQ7y/HSqxx5JSo16jaKp6VmvLghSP7rN1HabGeTRq0/M9q40W
         3GnA==
X-Forwarded-Encrypted: i=1; AJvYcCWKLe70eWgRckGCeAtqUFBoyYvMX6qQPVOb1JeU8OwDZmcaYRyGaFSF3atC9hg9A15f//4VHw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzhjfEH+ujd6UWT9oqCQMDubYVdJdnZVv9G3Zjv9l33td2taY4/
	VGrXvq7WkinIG9ONYGqiAVwK3Kw9ZRG5dfmFKTXOjRFhsL2r2k5LavVZWg==
X-Gm-Gg: ASbGncuF5TEKc07mH96xQkmBufOyS9CJPzsnrQ437GQODYXDZGp3lOR6jufFeuns+6j
	XeTVFlAmisTPq6nR6jnoWOgAZbOsuwkaOq7mbHsn+cDPiuHL6+aeFw0fnPYqtLYtLe8yj/+4Jks
	oDg/W5O+IbFmkisFNfVgRSbk4xyPsIMX9UUIaz8iUPVEkjsSmWEJNoQ4IFCN6OtejQmnviVjKiN
	VdOB5nx+61W4IN29Whc6kFhIgWQrfG00rIl3082tr+6OQ+b2sXwrFYKnRs1X7EBdCF+fy8mYRRL
	VPMMNoBy6R9xS2GTm/Th1tkf7oWfqhbhwpWH7fwX8TUISFObivqucg==
X-Google-Smtp-Source: AGHT+IGjCiaq7DPW0ss5kSC8m5rXz2rGLoebcSRmwEAm2E1zJtcjgOYnNTLJIp2QwACkdCzP3uIZDA==
X-Received: by 2002:a05:6a21:999c:b0:1f5:8a03:ea22 with SMTP id adf61e73a8af0-215abc2a292mr10479573637.33.1746889942388;
        Sat, 10 May 2025 08:12:22 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:22 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:57 +0800
Subject: [PATCH v7 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-16-bd505cb6c520@gmail.com>
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
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=duxT7MNXJw4vPLeIH5239k3CmgZWAQGQK2kW07pl76w=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yczRzniLnke3xszhfsW+XGkbCWQ5y3Qb5cp
 1duw4wxyu2JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9snAAKCRABygi3psUI
 JMKZD/sHdqY7/eb2hXZJM9x0AcT6jctbVMU0POC1oe8iZFkkQNQhUTEs3yCishcMCmvQkqDCgK0
 8LbcyIOxnE2TnWL4QoayLcdi3KLGaoLZe8x4ahuZk45u0jnpnAeR7tb4PgTdbSwUM/7MJmx6XqT
 tbkU8bNsd4UoBDpuGVQ7E7f4JQULOxWYlk307fNflieW+4D1Zc0kr7Azw4ZNUXzFSSkxuKBN41R
 oKyLfYtyatf1edIp6kiM8SCNlNhZUPXtSsn0kVEhcKIZYJw5U7yqZqACMzQr6cYZZa98U5CDkmx
 hupO0pVY6XJo18lOwf50WcrM1pZpBT94JY/2cPdRf85LLbJg/mUxgESCs62YIoY6U9Q42V7flLP
 VqhwpRiqKapsynvnaOaL1DY0ATTVtUG4C+rSjVsjEJNlrWGRnLAEjj4nwJ0kkREME/PEju5P/CT
 EDSig8hTX4lfUfvxE/h+G7K8opgOTh2bEsUY6RDmA9HZZVSS+4+ltAHHWMdVLA5TW4hrF5R2k6U
 Prra/uwS7fNjXHqaatz4be924qUmfPnHbvfs5hNPLSX/CCZhf4MNTseeF9fpeiCg2yJx25ed4lz
 lLLY2mxQLwTsqMK4/athAgSarEOX78leckjcmOE62hBphzRtb6QkfEg2TC4T9CwWWAlc1m2C26F
 TSymqJmw7zJBK1Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index c0e9ae45627c8150bc0ddcdc1e6ab65d52fa7219..56ac6e7f3803a16beacc74764262b02c75a96fce 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -167,6 +167,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 76 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 79 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s800-0-3-pmgr.dtsi"

-- 
2.49.0

