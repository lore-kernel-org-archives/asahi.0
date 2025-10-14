Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345EE302167
	for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 15:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454321; cv=none; b=YOwpXxlmdBj0/W1lfcl4UhTfEynn/cfvPGn7e/NxN/rKh4gIgx4dqXLzcfa2eDM+fnVeFP+asWc2kkdfluSM7Mc4dtBbMp1M/vSSSRBlqIfCRo4i/KRBJAeVZM9Zi928QrUjVMo7hIyYZ8CvYG7GRLv0/UgWqdZjuhNXsHgkuzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454321; c=relaxed/simple;
	bh=KUmhbvVhE7a9qQQiOxTeh6fcRXxeiaIPFMb6Ibxmxag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KMygtOSEY7qQ/Ha6j+/ksiGzhLMokvoYFPhANq61KzKzRuFUR/v8Dk+m8+GdsDjHOL5kVnNbZWkVTM1+U0kdmpFnoELbo/BY42N+JjomRFHe1JCJwIeomI7/09VRXjdrfNbeRsKYpQd+KqjdN/o58kDWPFTZRmaglNJleWEjPUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YwXqFEfC; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YwXqFEfC"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-33067909400so4022549a91.2
        for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 08:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454316; x=1761059116; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKXUCmU9jFowxknRpXATBfrh5U5iaqmYG7UiFDMEOEw=;
        b=YwXqFEfCExYpetEYYN6q6lWzR1dQ1BzSrs9TiaTwbxBrbXDV5/i+j38LQVg6UyW1Qp
         92A6HWCGHVYI7LIfYnxKJ6VZ/Zn3MSBDJxo6fF6JkxnIebW5IU7JBcLnPyrcjwVCaEt+
         8j87m4ppn1FwrkYgKJKCH9hJntBs9nrlDHK2DNjT6MW9+krxqQ7K1taZL3xuuc7Y+Kov
         rmBgTZ7GEx7mfPXH1qbzJyAX0c75UojLAbEHXHjH+XmzSxZ7Dr5NoLxjSaJrXh72bb8S
         gxw0Scl4YP2W9W4lb1fVnt3V6AjYufG5/zo50NJiMofbPk0fBd+cs+t7FsOZHoa7hbt2
         I32w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454316; x=1761059116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKXUCmU9jFowxknRpXATBfrh5U5iaqmYG7UiFDMEOEw=;
        b=lKkV9ZXxllLeC4hiFW8axBgH/xH3aS2lVkrPZrI8xYiulCrzIqusZXaRdI3v2Ih9s+
         Qgprxds6xOOUYh2TVvWIg8DOH0hYLtPYVs19Q/daV9OSIln6ysoc3PAIyx9EMUq1Eoi/
         56SB2krYdihb0WcIN/P4XS387zzfrpg6ZD9FheqeH9wJwrhGu+OCxpJ29sA8UUlLGIK0
         An4aFSwjtXHcxsxPYGbaQVyewRA2JO/NGM3w3mOBQJWgnCNHhluwqt8nyO2IFiuxaN9p
         FCgogJQC1f/IWyUowdxHIJ030C4zhsxbAivJ3k4vxyc/nlh7xZu+GaKEKxwi39i+bZK9
         BMlA==
X-Forwarded-Encrypted: i=1; AJvYcCXBmBaQ8zJ+7huSeeRVstWLSCEbK3bG47y9oMl1rqKmRCJeoiy81D/TKCFtHyyrGnxUxXwYaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGu0zkBjzBbGrD/Jju3ALsUmk4wQHCbZfPMSikYfa16Bqv9WrF
	C/nC2YLWhrHulVF3heWwIqiUIkLyvMW/zD0jXqLxxt5Br1dggDFvp9Fo
X-Gm-Gg: ASbGnctVRuBn/H3ekfCSXEM4lKscfA3214fb+2oH9DI7X2yZ0CmORygcYEE3bGICnJW
	PQxRd5BCNCHkpWBZEaFdzTnnn7UW6EimHrmdhcRJ0YI1r3FEsBp23vnI2E/EdxtorbaGv5TANBD
	TJVnnK9ivurnx/UOXpqqOO5/cMbzHIK1azTLiflryHUWvjNlwdIimINm4sm6eeggH1QRGLaY4wf
	Zg+7KunVEISZKaGCdGDzr8QhYt8sHRYJqVb78ZBW+ZOYUOl2mLDDutrbfjgUd1YqwsiTkGFAbOa
	YFDKFmGbInAkKngb5/i42Z3N6WVXbEMiWiB+uPs5sNRl0wa1mZ1slB9k/vTmh3Qd0sdx4QQMeN5
	YBzZTPPQ2xNY/oOpyB78FjaJZO0HNmxyYeC1ydg2lg/c=
X-Google-Smtp-Source: AGHT+IGBkWS8gO3ZSwZOT6x7Qoh3z6cOoLFKGH3Z57P8QReIcdrjAjkWJi2zfQBYmSoAjoVcg5azOA==
X-Received: by 2002:a17:90b:3a92:b0:313:1c7b:fc62 with SMTP id 98e67ed59e1d1-33b5137591cmr34129260a91.22.1760454316096;
        Tue, 14 Oct 2025 08:05:16 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:15 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:49 +0800
Subject: [PATCH RESEND v8 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-16-3f94d4a2a285@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=KUmhbvVhE7a9qQQiOxTeh6fcRXxeiaIPFMb6Ibxmxag=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZuMNyJ7OTVUXLasrGIPIVb1HBj9fWNw8yZt
 x7jbIc/tzOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbgAKCRABygi3psUI
 JPs2D/9uehUxcAwSWk9iIwuMFWleyYm4LiS7tb15vFvqVEPXMUdQbk3G/e3eMusQArCpn+ycogj
 GJnwe0S8BwwKu3XcYLuNeIltnBhYG3ttIWXlIv6+v0wZd9gnGNEfgBUFUdV/jOuBlYRltuPxhhT
 eZiVnlIyArZJXWC7ZUPvjvnAGUs9HsJqJ7mw0BTcxhi4fUowK/2T5rPvDO78eBAARkeF5YGWqKc
 V8zTBUCHNsYb/mKXrGMVQik7gN5e4OPRvelEjnJy5vydwcTTKWc1G8skj/Psr85LG4blw3t2OF8
 9wzNSPW0+qJVs6nJTw7OHP6HWqVOk8Ahm0BWROI3WF7NFa2lKb68hQAnn3r+/xOT+VDTntFMu5w
 J9qwPqKEBxkXTbCBlnsJaXOFhvNaYmgcQjbFdwyunGgv5/kBIpeOYbwPVm4/LuAZvHsfONBXSK9
 uX0EnZrWIBvlEfOo8x4ZBITYaux26qtx2xk6fMsFhdgDXLTmZmu9gY/leIam/UuI3i2tCEkgjrH
 Axn8Ce0OR7Qp2DpYzHEwFlnI/jCaQ6jhcyI/RoUTO1NHPydclY5HYZObCyuVkR/xJVfCIpBCfks
 gKH0riwiIyWOaccR6cKpl6YEpjYknaMSuK+/sBaQsNs69k1R5YYZUVrei24afzpvPjXdP5OjYIY
 r0MyYbipMVm75+g==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 09db4ed64054aefe5b8f8298553d87fe5514e81a..bdb66f7e0de43a6a751af37c9ceabba44ef907d6 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -180,6 +180,14 @@ timer {
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
2.51.0

