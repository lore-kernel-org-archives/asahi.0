Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A09724A06A
	for <asahi@lists.linux.dev>; Sat, 10 May 2025 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746889951; cv=none; b=gCiHC4zdfgYYAq8jpHqtkPkCn3YUTq1EvQmGMuKsfCvbtWNDtEBosV1X95EvSK9zl3IP41T499tVKw9nIzj5HhVNIGsDB+n5Ced/JjJaN7+JUGwz974hq5J5iww9GS1VWyYoHK/Oa3wKAw7oZg295cDpyU4Z9RkIr/kYA8+lM5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746889951; c=relaxed/simple;
	bh=kZviMfYtRCR7gR5VoFkDRwcKeTgAqfWp35C3egDQLf8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ur+1tsq6ls5T6AacJ+cOTRWrAYgJFsHVuhO1vfDkdIhen+NBe4TaalUg8klJfLW1wUHaFUe8t+yn3r9T/PwhCs/B5P8mgZ7cikvo+s8zUj0qZcrIPavqkeQBClZ4A5QTqX5KrlI7NCyBxbbZLVhIkJeALyqHKu5eLUXY9JeP6z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rar32sQZ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rar32sQZ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-74248a3359fso1102639b3a.2
        for <asahi@lists.linux.dev>; Sat, 10 May 2025 08:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889949; x=1747494749; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=Rar32sQZNfkoRDWZ+NKLB/yV6540tWa9uCtaG5WvS/b1ZY95hRl9Tu8NI6bIOH2vXW
         mXJ9CxDsut6ni2Fb8taiTpeEOIhAma7+4pRe0myzMeCx9R4VWujjxjoVcGEnCyI6+yfB
         t6KEOpDfbdOxbciBrFF2QFJbfppQ2zmPnhu11XhlcSkLiDfmz+UFIP1VYkhyKGLMmaM/
         e4wkNXJ/2aBvYOkSXv0xXmlYyZU+o8q/3k6PGXg21kCs2UoP5VDVeLCvBXeErgVJW+Dk
         pRP/cmO2ABMLO9yaYEbGoV6ZeHeSJKBs93JwWvCLbFzC2BLkH/1IcECGamB+SptUOhwn
         gvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889949; x=1747494749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65yvptSdo6oSSwoGRF8EUfcgAwuQwDq5kFTQAdR/3Jo=;
        b=iGpKLqNT7wUk76qYFoa04sYOwJzbpwPn7dmvmDJo6gNth+e2+Ll/17l41J837sc7qu
         89fsPIrsYkDkFsEBu9U6O2THfd/2TEAevHwv+ovOim3wgjeZkv6kNLPnri9n+ZS2BKK4
         VZu2U+3QTcJdR2xoSEjZucYe5UVlWJxG5BVXiS5xH3vz1s6XpBpD+elCMtikoQ5iNXMY
         WlHC4XBn7R8RUeM1BSwc62RlAPoW6wgjdZMwtwZjhG+DUdpu+0tir5+Hy2QNEzGRw96M
         LHj6HqC6EPPhXzelChI/qx3+W48q272QPhCuw35KismN4I/e4rPxpmy9DPtPtS5oyHKr
         plQg==
X-Forwarded-Encrypted: i=1; AJvYcCV9roB2y7hlRYeQ/HjRuPNVXrK1q9WTuZOmE95K+h6PaHDkxNTHc+YTLTv1hub2pyNv73jFdw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxV7LMrR05ajOhaqZhBVcBSfPm3g+XAPMiZ4f/MDK/arBCsvFaA
	pWwb8dDUniU+8AqQkSEpIFcFQ0HBs+PdO6a2Unw1SJIkG+tq5DODY+bR5A==
X-Gm-Gg: ASbGnctbIFyaj2U7fcZg6C+U/r/MmUT7O2z2CDQvqP+pLWl4EVcssigCbmJ8yJLXmZq
	2/zhHu+X5Gjmy6sYpDGDrvM2BE5mlxMMHNH3FPiE/PAxkZFfKoIli/O/gQSGqgMh3fB/stwhPok
	OrJZW++aYwDmrHefhPdjFWbWVKKxrtp2q8/n2WClGEapVuUpOwK4M+rqMDnErW8TOwpTe8Hsu2k
	U9P8KlFMbVIwz0GRiCIA/BO2iqD+8sl9VcmPlMmMh/SurDB3UkB1lL2gUZ+7CqJzWIGC+RBR+uG
	MWAyyFfu3SXvn4havzIuE44NRGZx0eHmC4Gv9dQgDVGhTh8z+zIzrQ==
X-Google-Smtp-Source: AGHT+IG+BSq894BgpcaZrLib3NkONNs7rilLsmX/wtUTZdydylmXWbzGgmMKEx9P+8gKkZDE8JcS5g==
X-Received: by 2002:a05:6a20:2d13:b0:1f5:591b:4f73 with SMTP id adf61e73a8af0-215abd2336dmr12629039637.34.1746889948989;
        Sat, 10 May 2025 08:12:28 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:12:28 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 10 May 2025 23:10:59 +0800
Subject: [PATCH v7 18/21] arm64: dts: apple: t8010: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250510-apple-cpmu-v7-18-bd505cb6c520@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=kZviMfYtRCR7gR5VoFkDRwcKeTgAqfWp35C3egDQLf8=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2ycVdANrm5JPMScq704wfLVmJ3Ig1YS3yWE6
 JmrAGJtLRyJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9snAAKCRABygi3psUI
 JKTRD/4//D6qqQ1IsMdcZK65UAbsaZ/GsdPdkM/JdX0rv/HqppLdCinkLrRZrovJDj7mrzVAT4L
 /32dZ9kA3pXlbbJrGiN69/zvx2/vxIyVWvE7/WZGLvHHjaYVuAf0GxtLSkANeZIa+N1ZyzYz1ME
 MCtkUFP6lAqVDTXudSIIT6BNsK7tec29KvxFCjcf9G34aMe7QZMfEKCjWhcIHnC8UxSCiQtvvwn
 LW9eNIE9EY3w4YGXFaLmYNSzIU3Y3YZoiRIQTBe8ODgW+a315l+SKoi8WgqhdexDt9SD8nGJ0H5
 idBrXotwkNfem3hGkW7weriVLENtVVgCaMhLx8b7h40N5hUMdbx13slGID014S/YKxNIw+x0t/R
 u03LO03HYND5emkMBsqBq7WWgpMh8Qr93P7DChIPUopC0hvDMAG4oywYfVB5IRikD1YL8LPlN7K
 tTbw2pVIgCWdUUAfisGEJUXM/vQEOiT6LDs0eIvGNgHRDrLVi0wywbXK2rk2rYCoyv6wpp7Xz8L
 Y+HcBlbKWrMmpo2nPtMSV0faPh9pdgDf7XzNKTDQG9PMUiAR0P+TLMGVUgBshz3gCJ1wtcZUbHR
 vzY63JDjJutLAdTDnVk27jHSD5EIJwK/6RGd0T1Eq+a/z0oeTrb/hKPaRJUjCra2HTFrTcw7BG3
 owD4MdqJLKPSAIA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index 17e294bd7c44c7961cc3ba0ec5f4178840d5b9c6..cbffc84480379cb476d5caaecce91f746e862354 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -243,6 +243,14 @@ timer {
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
2.49.0

