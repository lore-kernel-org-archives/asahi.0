Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13A7303CA1
	for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 15:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454332; cv=none; b=tBftiqvlA98PclNYArm2Ih1Gp1LqtlRiNkr0pM5IfYEXQfE7dMnOveT1+dvCeFCJveDITRcqnzCLZMqTcIXulFCjUGGlO03CAmFGxtmBc+7SWfNsiIj2BSxlIK2JM5woUZsKqrErYXMy/ZPAtaE3TrbDzzmIdLb7iMKGp8rVRxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454332; c=relaxed/simple;
	bh=aC00DD3jiZSVPA6I5+G806JpCyFv8tDWkvwqkbp+yEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WESm4YaF2gh2X+T9vq9hEH3/jfmILgI0hNNbqnCC5yS+dLttY6GjqJUyW9WNxFJXsU3FJ6aEut0bXItjFDofr49mGptpirRNpn/8SihF9kAFaxTWDf8YX3uIYFNzgM+iOwLPw6eX3fnSpdSK+PRpgjUk3owHe+ZCTD44jpFrvmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVa6oyF2; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVa6oyF2"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-339d7c4039aso4904235a91.0
        for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454330; x=1761059130; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/G/Lg7srDy0beJ935wpO9N4JjYVVtt8v3yHlGagArU=;
        b=ZVa6oyF250A23hZtL25B0YUKNB3YpI1d/8GuBjE6qhw0hFuc19ohm8/Zb0R0tNSAfa
         rAEkyAm4IX9HFLiHkzFJ8EQsedTjXcx9tSen4deCaIEoUgvhmlNSTo1/ZiX1j23LNtO1
         +3XZtWfI332w4X8UnMdciit1ARKMuvwD2+JPkiLzJujyoWKi7axLstvaMX2nXhbLetFe
         DaPvDNZ8ntJnZ1Z5CwEzfRao+a2P+c3hfHNyWed28oKVyCTrzVhwHCAJG+Fu+QoAS7pz
         jbIEUG41hblb+NGphXnvsWrKk2LLl+176W47ewQgZkbMWhz85nZ8gkQlxUON6w3tl1ID
         GDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454330; x=1761059130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/G/Lg7srDy0beJ935wpO9N4JjYVVtt8v3yHlGagArU=;
        b=t7yj99j5GXrdc3/Hiw/sKseLcPPnQGm0CP/YE/h2925gIgf1P1k1gxZDJ5APfxGIGL
         jGtXrDFV5URHVLfh5MvRroKngKVhlvjuJcXZEePRfpnMYiEfbwqmQQcXep1FJWH8ho7S
         9K+rbSLMPAlhcmLOQo1x+AO30uclVuWHg+H5wAkpk1kqdIacTZ16w+ZHx1lLeTzXdB97
         tEPO2WtV6/JaQGZHEYsS8/bVTjt8krB0bTm21xCkllg64ZXM+4Mfq6sUNwU0nPsetGcf
         dQ2hw/qha1YnNI+wTXAK3JtCwXuf8KMim+yNDH8xigDROws/xr1Hu9AIvUG/HvJlmOHl
         LsXA==
X-Forwarded-Encrypted: i=1; AJvYcCX2FgBZgKRpEQMgiuRYFWFuWLJYClxZCT5yN4LowY3rmq1IJZBcqW/Gszv7XGnIcTUGtF7poQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzTel82ksAV2tDPVttkvIYwLvJxtwEbi3IkWLIKWkCdFcAHn7zc
	3Lx91Brnedpuy2ofIYoXM6RNsFmcbOar/j/Ttel6OoCk4QL1ngodOYWg
X-Gm-Gg: ASbGncs+fzDAQDgmppm5bVmMsGC725qhjgiaFsAyNwbzwWOnOOEicydv+95c2HtwrXL
	tSQxnFZFPB+u8ygd1eO2b1iO0/tyUOK7yqKzroHB19EiJG9DCRbMal14XFu/Oy8cFNhcoq0VmyI
	J3dEG0OkzWWZtt1Tmm/xp9YfalMEmTW//iDZ5ieMuQu0v2DMWEWRcBMhJuWVmr8/xk2bb/BlcNx
	MmzYz96rV3Za8o0GtmddbGLiUApwLKPHiL8CwuLeE+llC6VbkQI4vi8jT93qgTwKpHlSB2ozWMQ
	RriWgOJJfLjKElK1QQ2hgC+ea8a5a9fQHKYz0qnwtDJ8OIY8pe0vs3bahNc5PRYnToJuXPd+P7r
	Su1z7CzMQeClvCB32sc/pTAjZTA6EV5czgfIzgHxDyfI=
X-Google-Smtp-Source: AGHT+IH4HBeKhh0rs/WsBsl8Ozw9jy+22oWE6s7x8YS6IasXPfN4lyvr/JwIJU3w/u8b0njenNKsAA==
X-Received: by 2002:a17:90b:3884:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-33b5112974amr36908126a91.16.1760454329752;
        Tue, 14 Oct 2025 08:05:29 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:29 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:53 +0800
Subject: [PATCH RESEND v8 20/21] arm64: dts: apple: t8012: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-20-3f94d4a2a285@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=aC00DD3jiZSVPA6I5+G806JpCyFv8tDWkvwqkbp+yEU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZvaGEqO+ZN55ucW9OJJdfiSgXdY2n6ZdLkV
 GGDjJh23h6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbwAKCRABygi3psUI
 JBpoD/0YSyScg6oLOOGpChZtwSJeca8rNagdikOaYnLGKmjW3R7hJi5e3gdGkunPGdPyfk7SVPI
 EmVSWxvpMzLwYgd8uVw0j4IFIBIl2Toxd901AgnsGUO/gBoILkvz+lzF/Px2HuO8n9scQMiS5pM
 7vdWYHXt/s3f2DLx482Ja0H8BdHULUw59x87M8nzGlStRpqp/cFGmeRFwSQMSADPgaz2gkYuQJH
 f2bA+gLhHnz2qJ+uYMiYQBOj9iK0oa42bUdXwSiqV/DXiFiaO61DreTME4PJaP384XepWCg7jQu
 9pUmhh4lbnuqhSqNDtCUupSCaYWNm9EvBk1VrLf7Lfb4ZiKxIfMjjytjLDxchio8brg9Spb/IPb
 H30YLe13hM8Ofg2GcaTSowwY0npE6vr5QSxixPbDu10uaAhaK2z4fo3/V/qrVuAQbSQafE7KgL2
 amLqImtDuMDbBOMzDfY65vwwZTAqqCKT+imkfjt6HPMA9DbfihgoZJNGZleeFmYVWpu0mI4S8ld
 wLP6m4BGRUK6alHAGcHXfs5sROr8f/F7V8pcBOMHvth9aKZkWxNRjYJpI6k88eUEb4GnCkAGKns
 gEbC0XPjHQz/9w4kEILzGbXYID6au8ewy4bc/mBEUv+QmnwudYoopjOUAqKhNKA/NMNfoMkYK1Z
 x/RqjAo4T1ySY6g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index a259e5735d938cfa5b29cee6c754c7a3c0aaae08..fc87ab818d975974dd811cedde27292ec79f2c8b 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -289,6 +289,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8012-pmgr.dtsi"

-- 
2.51.0

