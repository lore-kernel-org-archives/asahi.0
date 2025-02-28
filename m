Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2B31AC892
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740717166; cv=none; b=XXQYuHbk7qhdTZ9jA9VVSDJBzoEqmObwo63POou9pUyjkcPjeJpvUtcufHREOXIJSMv1/+bWSTFbCAzJo1L6MKiMbZyeQK2CxxZBJn2tsgrXP+Fd/WB8XVwQywVlh2pxGOOo2FmxTBFl8YFMFPvIYgSgsCFahwD+wby0nOibCcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740717166; c=relaxed/simple;
	bh=3G32KGPWtAlTMVeEh2nFd9QMJAqTbBI6LKbnc/7mszk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lNwLHYU3CH1w2UvP4idR4eZaSKgTJ5oVoh0MTL2vP1Na7ZDwN88ip7SJ5Xy3liMu3di9n50t99VIJPexhQiXUgDFWHzXCWgguK/8f1NYoF/6jwzubBSp8zSoKJXvMPU0JkX608g0+NO7MTJchI3Cd8bD3Fi9v/UMIyrHsLTZ5pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOaCJzfu; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOaCJzfu"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2234e5347e2so34633715ad.1
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740717164; x=1741321964; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=;
        b=fOaCJzfuctDffHCVE33MOq5o0ubFH5S1SViOXv71SimfKkDjtWjjO7mjn5zcimSqeK
         jb9q7U60YjUXWpHa0V3jgtlIy1fMtIYwQza0Peb17gRMznBAOmYu8fskrgcw2Jp7Nvkh
         zJRBf856iQR7Ijl3t+YVjnJ5ZuCBEqud1FUL//DG6Gy7rX0nM0pNlvJS+Fx83iVBZ+v5
         Yk9DVyHt9ekACTB51imhUkviyE+yMpm+FLlDe1VytHYuyFQB+Ku+f4UZxy/sQcVse/zX
         GSIiDP8758qggcCtWxaTE1PJ04apncFjZjIZJLVrXW2W4SZ4p+HKXugPICN6fCwtvccp
         SKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740717164; x=1741321964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unB38tK/OXEn7+tTxdPa8sEeBESGQmaxRAo5u3OkTcU=;
        b=hb1DyE8kGo8bZ821hQ+2aiG2ybhYEwReF9lpg/eSkgEEIL27T4LYm+AMxbsD7vU7zB
         bVzBmavO/L4gFG2rKFYW5J/51emV7i+8WpkDCzcf5qKAj2BMyKLdruq/6IOXMbbp5eXD
         uNMCV2sjRoFL6exNTLyOZGGlyAGklcgoRZ6Z1spwsnD4L81sLRjlkUKwPJ7MV6c+TCxx
         Nnc75J2Oe8kSvyuVMjqA4xrA7tFF39fPpZP1YkB0jPfKnM30Rj/JKQeEGQI8yG2Ni31A
         olfUgMmyvaLchhew3Xn2pyfNaV4iH70b/hKCLB2gWQv6GDPI/tEdvcDj+8fE6iHwB9WI
         VTqA==
X-Gm-Message-State: AOJu0YzeopUwAfkBzo0pQzds2mDn6KBco/0oVGWV0pZYBEKeIuwNS05k
	n6BjcSwogSeRiMj+7up6xBW8CQtyK3BQOP4tu3DicXPHsk/yDOSo
X-Gm-Gg: ASbGncu2Ff8laaxWJJR5kMI1MeTgXTNetTWAZmCOkaJR/2dpxF4gplj/xKLasVW13Xv
	iFGhEN9DrXaN4XdCb7TLlvlHZ6gYIPp27xyA9ajayjCuPzMCElWz6Q9+FSIO+zyQqLxqqdLkwVJ
	IzIa49rrhwyNpzwM1VciKW/xp7aX5k0zXh77lsrsRCjFxetLpIQ81JWmmKdvOo/FQbKLaO7x+Gj
	rnu/2c0OdTZYuYo5WNSrseuWoTN9TxcmMoko98k+BMCJKfoUfn5OgjeDh74LjR0Hy4hJWJFTUrX
	5QPeELRmcK/suNz4+RlDUujaTcXv
X-Google-Smtp-Source: AGHT+IFg+5uSUdQKIcOHevPwG4gvUUQENF+9eyVR2fAjMayvJLeh1aOJcH0DAR6JTEfeSuEC7g5pVA==
X-Received: by 2002:a17:902:d2cb:b0:223:6747:f82b with SMTP id d9443c01a7336-22368f7b57dmr23171675ad.13.1740717164467;
        Thu, 27 Feb 2025 20:32:44 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dcafsm2738204b3a.132.2025.02.27.20.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:32:44 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:32:14 +0800
Subject: [PATCH RESEND v2 3/5] arm64: dts: apple: s800-0-3: Add backlight
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-3-69e450bc4bfb@gmail.com>
References: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
In-Reply-To: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=3G32KGPWtAlTMVeEh2nFd9QMJAqTbBI6LKbnc/7mszk=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTxhDOkEVgFMoHt2H5tos2j7LWBw/x05ZWAHF
 NRQYG5630CJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E8YQAKCRABygi3psUI
 JHhLD/439IiiPVawDXH40dmN+seX0BnrtlZbTnT4P9BBeN5zdSNzGHqHh94qyfcKmxmBrtq/bTN
 gW2HoumEraTXleq1xX4hZ96EftfEX2+5HNEFIkG91mHYm70hidQoUDl4xvnNoFQpLjOQgOuRvfq
 CoTwGW7MZo7ay3RBYs3aejti7nar3SahGDUsezigcbsVyy+8N6FnfZldKfR1XudUoRdIfuPFQqp
 LI7pmArkKbxpBckFFpgNZPBJx62yuVeHTux967NeAr9BrPb1zg0Jt/CmB1fdvbLY9U/1zP1zB9k
 PkiNrhb43ZkPbNJZkCt2j1E3pvkcAJoGn/WQPGAdYd6lMfnYD/BD0/JvrzeembDujbuvLUTw3kD
 6MwSJ3P0+s3xhwtfWtA1TUJeCo0fYBbwbX2E1ncAmJnnWYDkZniCrb9lxMC3sRiR6XLSb/IBIxA
 PY3gqhc3wC7pAKvDLtHTFDFt7iYW15i/+WQSWNNB72XT8g+uSKMSx+cW+Y33PJmVFX10oney8vd
 1Xu+mds8Y4zr4PxcKdANjx68nCq1p6he/Nmi9oPJHVYd7G4uSOfbGYQWpcJ/xyp0sVWW7Q+uE/6
 ctWq91Dh5IqIeHfYtZ586dPngN0B8mV/izNXOZu3J8yBYVKeLmoY+js8yu9mKJlU6oazQREuREQ
 4clw5j3mOl4IgHQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add DWI backlight controller nodes for Apple A9 SoC, and enable it for:

- iPhone 6
- iPhone 6s
- iPhone SE
- iPad 5

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi        | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi b/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
index 4276bd890e81b16f19b04e1716a55f32f9a371d9..cb42c5f2c1b6caed4ae04ca0b6173e23bbda47f0 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3-common.dtsi
@@ -43,6 +43,10 @@ reserved-memory {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index 2aec49f0da6467519aeb2561d00b14f46fe216fb..c0e9ae45627c8150bc0ddcdc1e6ab65d52fa7219 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -91,6 +91,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200080 {
+			compatible = "apple,s8000-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200080 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,s8000-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;

-- 
2.48.1

