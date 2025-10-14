Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FB8302CC7
	for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454325; cv=none; b=R5Gr+959O025I9sSGdMQcNzfhqTJvOoXdeDfsuIea7nxrx3xImt5j9mUAB7dUkQAYELtsTl1KLHkielOo1gbTW1A3cOUb/vUw8dOJQHNnaLCj8PduYZQh21fwGetCe8wE6Le2W0MY8+2D8tEpsLF0xTQ9T4FxbbvjaG0bh/pImg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454325; c=relaxed/simple;
	bh=I5bmZCvx8lSOgqzXisEWeIL6b++oNn2j9gQ7uou5JZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XYx+5RMFtG10cF9n9dmH0UrR1r/cdLauWdSwdcjLPrAjKRR85w5/AW3/mF6ISjFiAvayhSZkT2OJgtp3uIMfcZVizt09QGpepoGEIbk7onNgHAOTGF1d3pnHZeAgOxCGdSNK0rHrd/Qq+QmJpbSeY0kdmn4B4AQiHU3S3gAvbRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c3bnvgk/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c3bnvgk/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-28e8c5d64d8so50470765ad.1
        for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 08:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454323; x=1761059123; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c7UzRpURIuRgTvljraCf/vxpCIMLGtFavfo4dJ3/GB8=;
        b=c3bnvgk/uJqfbAKnMOX99xHieemmWx9aSIp/JPan132uRasS7Wufui21ym5CrykuB9
         A/tJuyCBrewcNk1U+BOUNnf/c/rj4HlbMAOlVBuOkWNvB40e3QkWX6iDVBlff0VlDEc4
         j79DLeHzAa/pYFxXqJglFDWJT3pHvysJTUSickSljbhSbO0GAloh/kOlEEUwaQ7BQEb0
         MJiIh1YnRN6Hzdc9k8YZewxGKDuFW2eyaJ4XVJ4fhOLtHHfzB2j/1AHeoL4T1UPdNVNw
         3jkFz2y4qNG8MZTH55kMHqkJ/gupNagzcwDarudV+HB5OVyPcwUiSStjsbDyA8j1v/bB
         DbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454323; x=1761059123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7UzRpURIuRgTvljraCf/vxpCIMLGtFavfo4dJ3/GB8=;
        b=MKYfvkhfYfggzDIN/wqrxOt+OAeTc92moNld6JXkEqzBMCHy6mvo1nGjN3nUppCEet
         zVdv0GCtnVwR1BE238K1SIRLmqr0h49x60eBur1CA3vNFaIAM32pNpDohF1cgZ4rOiWd
         6k4i5+yAWs7aCIJL1WK0FeTH/xP+ceOTBcBkpXyQUTiK87u1hNW4tcI6N64FbJpzuF6N
         pzU65M9/xhJ//lDAvoA7j+YM5crRJjPFN1FIIALxn8iTt0ZTWPgzEyYd6Sx4BTvHA7oy
         ar2JrdaMmwCljKZiLH7pRu7lJHUQXj7X4F4Q3f0+80oulWbTa33yMxkol1moH7S3hUaX
         LUyA==
X-Forwarded-Encrypted: i=1; AJvYcCV2o3oCzFHdN460Za4fgGAV0j8EkMm88splDn8rBMKggDkcCfmZdCTuCiy0FGzBY7VT1/bp7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQa7/QiJ6sneEt6rP6CnC7G8M8/NRyEpN+8Z/tVdv+CK8o/j07
	jrxcHsRsQAysEdleKYNekGvOicyO45mGbWF2gpa83y63kTncSsRVfWMS
X-Gm-Gg: ASbGncvOcmatnQeh672+cvV4jZ01RB7hZdicjWadBqt8Rw4Yl34xR9snP0+E2xjoaHd
	AyUbusY5IJOseOdh66y6uGdUjhDo4j82+dVZzWKCgbqXjCD2nTQnQoc4JhWmKL9zHvq2X9fVLN+
	qp0NEczAMBGfPJau8hEc0FHftOyQbmtRXn86PPy5/VAcZ5jc4jq5wZonN3jfBqpe3kzu8SX8+TG
	ICptxVT/atZrEnjjo2UDPpOiFGWWKXnF45F7sBhOp3trKhVJoRCU+rmQBBLqaMY8W7O68Ypz53h
	nx/iKPZHONDdCB6D4VgnbAUjDzTIkvbO1wJZjOkQpvmzZ8nQbwoV8hYmKo40rozmg6TpYd9r/Rk
	/DmFyDwqDpFKbtKue4bpiNQyrWh8BHRbCYrgIUv0RbQQ=
X-Google-Smtp-Source: AGHT+IHWoti0arhwAJ8/ehOp+A7jTPL4DfjepOYMl0fCMINaTjupjut/t4zvp2r+UEnm0n+I2R1stQ==
X-Received: by 2002:a17:903:2b0e:b0:254:70cb:5b36 with SMTP id d9443c01a7336-290273568d8mr282473335ad.8.1760454322930;
        Tue, 14 Oct 2025 08:05:22 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:22 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:51 +0800
Subject: [PATCH RESEND v8 18/21] arm64: dts: apple: t8010: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-18-3f94d4a2a285@gmail.com>
References: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
In-Reply-To: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
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
 h=from:subject:message-id; bh=I5bmZCvx8lSOgqzXisEWeIL6b++oNn2j9gQ7uou5JZQ=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZuYkjRFb4PXdnwb4fw8h24z1bFwhtr/DQZY
 FpwFq8WkAyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbgAKCRABygi3psUI
 JPvuD/9ymjV0qW8N2VaqTxRqTnf7Wso+LimS4Evbq267jx0oIEEuxIAxTGDbeQWAWyet9DAebNA
 tHZjixPKFbR2gP2QQkaVW2uG0jZ7xSumkITy8nVtog1K6USKN06PNnE2L3D9oAfhg/kFPhym874
 eY3cdNGD4yoZhDeH441f44UswbG6ioxOJFOJQvBtWvwMRr3M4pX+6jFutcsAy9hyd1bAG99Xfqq
 A94kTQmdAJ7IWGM2LsC8gKNAaQMTdlQ5pGI8mdVDLMpT10fqOTt7sUk9SvMF6cffSuf6t5yV2fw
 HAnndoskEI03SeHfRmAqLzonuDsa1I4NQxmRZMUq/DsGjoBMr6nHp9ChSC3ve0awXWQo+0oeobB
 6J0CpZ5KYPeluNH1qA3WdyRWLIp8nWZwFe3SvuSUWUpJhSrB2j+MoBxjPg8gbRnGgloqHbbe8RO
 8jjLSG3KQ9QBRt/dAkIxfkGB3VMtHSz1Tmx3ElsmxIKdLPIwmQTa2DlqERHfztZW8lEQPyZwz7I
 12zfqcYDWhn87u0lyqFVfUZ6kZcRUx/tTBSLp1fjXm5JRJ2KmTb7EhtwHmwQOP2lcnSMpq2opY7
 d2UZgRW4510C4wxfSWVNPuZfSVJxaWJM1UiqpE88/hPoMl+WY0g3i/R6/wBuCiOrq1vmlW4fqrj
 4j5IZLtJeyaobJA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b961d4f65bc379da3b215ca76d5f68691df06f4d..d187fbf7e7a214cbbc1027034efd0724ef7f8b83 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -256,6 +256,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8010-pmgr.dtsi"

-- 
2.51.0

