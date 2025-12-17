Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B5134D906
	for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 16:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765988740; cv=none; b=HW+qkqjUEZAnSgpkT5gl0gfDcEHpkeSSkURpOuRK72czCqMx0Sx0bKtgUui4xEe/5rJGI7xgBCWA0IztvimU76siEObZlklqrWGQcM/Fi2Inr5idxF0YbGXbTj+DEUrtCwXxn8TNIWtd7E89bop28cyyUzvNyR8tGGGtLvJPplc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765988740; c=relaxed/simple;
	bh=+Y0a0WIcF+OvRh+wENdR2K0SnXmQmB8D5lWAyKi2wlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FHNxTxwQ/PNyjoiV0KtTr3jufoG6ZFQGi0uVh/OO8gTrVzJ3s9hI+DWsYDp6UPbtk5Ux9n51Z114x37SsRxvlgMZlGFBMXwEhngmWYnnuSD+4QtyNdwlI3LQXfjeJxGtiFfJNygc4dx+kBQbH2Q1vi5tQ66tdzqrluPhD2UnkCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuR4He/u; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuR4He/u"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29f0f875bc5so78959605ad.3
        for <asahi@lists.linux.dev>; Wed, 17 Dec 2025 08:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988737; x=1766593537; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJ2g7x+wr2VIeqIG6aJACDKejjD/eomNYXl10MONUeA=;
        b=VuR4He/uLJZqCjebIo77N36YoUbWIjrN4KqaQ18vtI7YoOmVQB41hAZBtxr5i3w4xJ
         q9KSE12tw7BXDhMUPA505BpfGcrptFp9LGuAMU6K4uhfliKmbDA24cQvvsdqYO9q3EwZ
         D5fGxM9qgFg+UXh5+0RkfFomOLchAzJiWLICvU9t0Eim+e/Fe6SAR/j02YX8oagm9EiT
         2YZF0UlwyZfgmlXCApowFBv8/TmCAluUkwWjq90xJREJmQCZmj4rL+J/hM5XMXmstW1P
         zDxv6XDRnVaXjYU+eEflFlazausnjaiSSj1zRvE9caucHlUEeNF4qlQOY7teGEmdk5za
         hBAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988737; x=1766593537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JJ2g7x+wr2VIeqIG6aJACDKejjD/eomNYXl10MONUeA=;
        b=XZIPkUlNkfxRJy7AzChJ9Ula1N5Luye6QM/Q9AeCQfj5m01gDCmS+hh6Dro59qXVR2
         drI4HRLT3Ilw1BrwvrUutQOul6emPtQTYdGGuuDlmuxwpokor4wNAT5LwhoEgcRwcoQP
         lYPpSYnspNDN+EJSTH1ZKNbIl4Gxc0kDEOvzJ3eAPWTnurR9hZc6zUafTOFrmM3agD2Z
         F6EOdPMLf9d0Dn1tp+M9g1NyWz9zZ1ycsuLnFwHB+GG4i3d2F3tCczCy1lxL/tBRnHYM
         CypSu2Qcpm2fQ7WLUHZU61SUc6gnGTY6e0zx0TIR7IjuRbHXRfOjPAy6yAs6QzmPP7RJ
         4rlA==
X-Forwarded-Encrypted: i=1; AJvYcCXYhpYycsB8H0oQFxEVUxMsDRm4TePCj+5pdxV1baMXcEmoaid5UZg1wNaW3AU2imZapivm6g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqMGrmFhzPB2in9fOBilSHVNATw4iExEYMGrcJ15v5P4G6rjLa
	B0mv+EBzaLEF52ECptCCeNKG1LZai6EvXwCygnhh5jBrI0w6fj9paJt+2GBk821u
X-Gm-Gg: AY/fxX6ySpuwvVEJ/C6rQ6ykS6Ab4fzr2B2MHK2dGlSSllE9c12BQ0BAzc3+CqHcsM7
	N1HMAQ3bI4bHlcIsV8TvShyHCoi8/1+/ZO6nK/kshNxXyFhdOfrXlNR536tZXxOqS9s1yLcyQWy
	c0kVpai2kYGcE2l4QYNoZvo9saqfTDF7Lm/Ak2F8BngkvZXLJhYT2nJfZMxtx5i3uxgMUnlE2Zw
	1GnoxhYQzPXKq0KFMdfIpGVRWpsPdQr0vYKdTQMyypatCYf/+RVsiw88md6C1AWyPljLNar/OQF
	k6Y1sLF/rXQPuyd2nufkuy+eJokrgWt8j6+is607bp0FOdKZkOC5ErybfmUMTn7pw+2L8jTzjzL
	uQrbmp6xlqopGQHGVfzs0vIN7dJGwyrZCDSXcYP7PMJACsaQX/bxLI2P3XTtvZv7xw1bmLVhoY/
	cN31tYqEahLShLxWQUwpplrCY=
X-Google-Smtp-Source: AGHT+IFkx8/ULLaclRWeXQnp3FknE4nFeL1wYOatsRa4nxVopZsYO4Ep0g1d9Nf6orRKrMY5yv7hDA==
X-Received: by 2002:a17:902:ef44:b0:2a0:a9f8:48f7 with SMTP id d9443c01a7336-2a0a9f849f9mr145464645ad.55.1765988736603;
        Wed, 17 Dec 2025 08:25:36 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:36 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:31 +0800
Subject: [PATCH v9 18/21] arm64: dts: apple: t8010: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-18-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=+Y0a0WIcF+OvRh+wENdR2K0SnXmQmB8D5lWAyKi2wlE=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlC/iLREqKTBWyiQSUcAXdch2o0njKG9Al08
 TcC+2X5MZWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQgAKCRABygi3psUI
 JD0eD/4pVaQ23XX6B+Fz65fzVa5a1N7gDangt8BRGmtK4RbXJQcwK12ed/KSO6i6t7r6RkeZH5G
 b3V3+h15nme7HrfFyIbxJ+TklHl4e2rZA28BBmLoVn6dOFV/x3ZtPYuwHVdWNSp2/7DhZzH1Q37
 6BTuOSseNtCcLPe8n/KEvx5CFEr5gREp+EQY4NUDqtceqA/zFJg/jHS4jNQBfu0se39Pn4Jxcx/
 QzXxUucO0/dVcYGKQ79a6BpnThLu6Fy4hwh1wfT8y0N1XgV1bSw6QeFDkvYuXmWGbwOutGhAm/X
 /Wb765ZpIaT/vgi69kbmCXgqur0RsDyAR7uy5L6+4knysMmxnosG8ZuXpCwzdESChCoXncYfGxD
 p1cyWUPC20AQftH6PJwuWyS8ph1DIs91Q4pvllAVhpmYq8NPMUxJy62vOy6GTRHb4yxAfHvGLoe
 4SWngvxXBl70SPMghL99HRz6vDi7jXn6SY4e31zSKlV2sHEk1tUzXO4LjzyLuhj+3Jc74qx5Sik
 e7791dK35Hiz/iCy2gD/eMqNwUUIioKkZQe02O4n4ccQNxK74tRwvxuUdf5b3Mz0sI4hSuusTXu
 +VvyfdhXT3MVurzPfyigziyJNrpjAK+nMzdaNMgdJwGrekEMjGwD7J6cGpf3UCYzwX4MxKkv95z
 ahy8p7F0lBtPoGA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index 522b3896aa87eb290dc831cbbf2cc8e593844097..3cf1eef5cc261fa1dc699e8b5c9991e2215a6010 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -332,6 +332,14 @@ timer {
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
2.52.0

