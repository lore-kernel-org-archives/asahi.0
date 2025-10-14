Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179A52C11E5
	for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 15:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454311; cv=none; b=gXYmDXcP7TCizhzdLykdAcHJZSH7IhBzSZOJsibVRL2/ueKiVLfnzvHf10y7Rr9W3KlBcjTZZnuKt/vdOdC02ehN70goyHzcBtqmYm8JZBhnsYT6KtWywM+7URtYTh8TpSf5HdjAdf7mK9E6YAP/9EDiKzTU6MaCsgULeL6bazg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454311; c=relaxed/simple;
	bh=1JKajXUwqRhul1ka4zSxgmuIZmZnF5dN2V8kqpA2Ejs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XrTuDO25NbfNto2/zngbvMXHIaH8kCRX/70816OFmEbRW9WNz3z/kOJUNfr8JddMkBIdsUN8gphuYLX2XWGiekj0mg5M6vXnPWd4ELAkOW7PzliB6Bgbx4jGbwEUhHOE8/w1sBSElPYsXvANc8pOAeLfdTzukx+35lgbXzlfclE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PV6vZpQx; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PV6vZpQx"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-339d53f4960so5721156a91.3
        for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454309; x=1761059109; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyHd36Q32D6LVFmjxrrSCjpcR8v8mTvafzGLYpLOI3I=;
        b=PV6vZpQxn0gkyOF5TwM6++IPATsphzMRIg/qELIGcs0Bp3U7v1XF//AsyPusW7F+zv
         PBTTZzNVKXKplZLKoTwjNqgr25sgZZCYdTjnok9SZ/rNItQUzrI7+b2yV3pq7w7HOfPH
         UMeE+K89hMU5QRBkX/5Qzzqp9OFKqRBn3TUIke9B3eTAJ2fFW0gwnZkNUWnxKvSvwFB4
         jopPwUc4tmKB9RQJxwhzX1STReLvD+VpegdLwfpUTnUr7d+6tHG9Pc3/1MHdQjB93zn3
         9BVNYlwmOkHCE4UAqFZ2Xr8uE/cO/wrI2znwa6w6s07s/cAF4tpuWPBcWvwUNJODABm9
         HqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454309; x=1761059109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FyHd36Q32D6LVFmjxrrSCjpcR8v8mTvafzGLYpLOI3I=;
        b=pEQTuj8V2BCvxV8A3JUZIvK0oReqXUXCMqB/hZLsk7P1v41VkHzbX3isGBKm2N9LRe
         BSvezmWs4/n/7WTv+tek4YHTouICiYQc7t7Ar3oimD4BZT7fBmpSRXfBNVMChrBpMwIp
         I/ctnFqzcUw7OABiR6xWcPTQxQ8YpuBkxK2iPpnYgjY9g8swefO0fNEaiwPnBvaMbAyy
         ju0o1ZevejCQSZXT+eitCsm+OyZWusSx4A4VWaDRs35wjTv3qjk1SORG/sfH//WVaYXc
         BKhCX/fE+eYd6E2u1t7Qfb9k5wMEj+WiGB1U8KCZLfvfqaIOHEU1UZUkmTr0140gI6bF
         oaSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJE2RSPtVZRbxuQBB+KrXOp5LjoCJrbAxt6gww4LgVEmeVnJI8ZF501qwi05YcdscOdBjRvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfdbUMTTYGsjYfI41ARm1D3HH0EW0uftU+N9Qlcj+t26YIEWMW
	uHWUERzz2IUGk3Il34lzSKGrlScPwiiX/8eTNb0pLvI11QKiSzwb2EAU
X-Gm-Gg: ASbGnctoJRmUYApLZadkh7KBlXabOialM+yNkMoHZMFWgLlNT66ZBr9TQjiAPXbE9ka
	iPAonzShL5y6r3DjHKYos/6STi+r+ogIHLoACZoFoxhCtdVRmf7TgB36It5LuFFQVqgziJAa9Ij
	ZgpfPS3UrzkfSsCTMlXt/cGRazxM3Fnrs4d0/67YEOTO6geF8ol0UnvTXNDC4LeQI0zxqdkphNm
	kt0qTCS87WziFveb0IBVtIogYFsBW2RfDx6KQQuS/JD518eWkAVAktxb5VErwVGcppJhUgck8pz
	aFNJVRBtjZSO4zyEx4M/Vv0mtaD3HKnX9VrW42XXj8ii9iVdwtsWNO9RDrh7mx3PT1R7GdW9JNK
	i1i0o6aZQlK2tfTbgBbRCMwB42bvp7kcBa09sCg3Wiu8=
X-Google-Smtp-Source: AGHT+IEjY7bDQyIY5jvN45R8h40HRz/mrkV41Wrt6tjyF+cIPRkH0RZhP/fAaYofUftjWnewdxxDUA==
X-Received: by 2002:a17:90b:38cc:b0:329:e2b1:def3 with SMTP id 98e67ed59e1d1-33b51168d95mr33754194a91.10.1760454309043;
        Tue, 14 Oct 2025 08:05:09 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:08 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:47 +0800
Subject: [PATCH RESEND v8 14/21] arm64: dts: apple: t7000: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-14-3f94d4a2a285@gmail.com>
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
 h=from:subject:message-id; bh=1JKajXUwqRhul1ka4zSxgmuIZmZnF5dN2V8kqpA2Ejs=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZugCbmni6EPY7dskM7QjCDK0rY7DwO1/bBA
 DN+fo8D4aqJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbgAKCRABygi3psUI
 JAEbD/4iBlLYvK5aeVArd4aJpETMdoyQya2/cnTtxya7scu4bEBXmzUl0lxJiBj5ca4LuUsXV3H
 gPSzIS5mC9pa2dL7nGt+hTIZUXfvIIktGfltui37vlUFxUPwopY+xcs75U1bjVGX7b7+gTYagjY
 FZxBe2W1f6iwEIZtUcT/6sEcQDjQbuqWUWX9LlzO+LFVa8wS55Xmf8gBwA/UIFn5O5Fj48BjhIn
 nOEWG/kV9QDPi7GvQ8Oenq6HT57WCMGX1sQGMTXIUTftuSdGbTM03sN2amh4K7g6X6YVoass1VB
 IAKHZwYiVjObkjB5zXQKz83tTYq9ewTqR63fSmuGSmaxfkX2q4fZXKTMjPlyMU2NeoNsX0Ho59K
 yydP42BIWTjH+9g53VFhlPUsTBbSdCghjHMQesPf8+GSQ9uzyeWenr73lA4nqVxqVIB6ftJOqus
 z8CGKz3bVyob8Zhg2OGhAz8CEu2pxZonXUqcH2duqy3WISGftEU1XxkxXP4W80dFbku5SlZKve5
 eoqx4vvPKfJArysAkflnRpKJ5bDqUUcLLYGo/X/x6Dyv5Bj+DIunaRNXNHxjOrfLUh5SY1s+uNU
 /cwvoL0wK4LBZ/pw/RWav3cNh+cbohqQzucWj1yyQyCmewgbMRWc+1LE/A4bcbRMQnAnkCndhzC
 Kp9YaPmsU82RlDA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7000.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index 52edc8d776a936ca5ba58537d4d68e153023f536..98c41473a84098bd70df86c2728a8080b05b41f4 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -206,6 +206,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t7000-pmgr.dtsi"

-- 
2.51.0

