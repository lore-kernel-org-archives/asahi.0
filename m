Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6873019DC
	for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454317; cv=none; b=It93oTeqsO0/TYUDIFBlXdRXmRvOVzMlAZ2MEji/aMbQVPEJtc/H4RWomD6D5TMcGrXk30FDx/Xv0LhNl+Y9JA3mx8L63Ebo13+c4qLAtReY0d7MMoFlqzd3j9/glTTLA5YW7jdXYiOa3zV86ZOwf4d/cCrLS1waLgza1lb3b0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454317; c=relaxed/simple;
	bh=lnaE9Aql0p+zaBjSHyK2yyUlKYAm5n38nVhdpv7cd64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxgApVnAbULre2kWpGNZdA8V32C7OsbR3oJqxjL/aIw2+VPzzUSaNKZICuwM8GGmd0MOIDIQPGDXBdONsytoE7HEztc+4XAGikLUbmG3TTvC4OiPTNjZeAlqOJMRFv9Ha80vAPG6tT1rd1eh6C8BQbTXyw538k5AkJJM2sx3hcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cZCnczNz; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZCnczNz"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-780fc3b181aso3244093b3a.2
        for <asahi@lists.linux.dev>; Tue, 14 Oct 2025 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454313; x=1761059113; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QdXx5WHPadAVmQPefLqhuYKaW1K4eJN9K2RwteEElB0=;
        b=cZCnczNzwB/XTknjHf2ogYoP3p+3UU+wlgPANyzZP3VVV3bhnBiuJ5AVVw0Lc0CCqx
         U0egA5BXvCz9jB7bIOsxYh1j8npT5cckiKCZsFW5R3FYixt48si/qH4BjCpQPNkL/NnY
         kUGUikr+der4mORa3RgAUwV+2Rzi4f4IEBB3vqKxxuYZ0JBfqAwwiJGUpyewobRg2rpv
         MynXg+LxePDPhDauQc+rvlTR5jqiBfYtsQCLSGoSVC/J1QOWifcjlZHmDjt4AHppQUeE
         Gy4usI5e+4mj1IXaQV4pksuqYM3W3RGfNLSsQH7rcbeboWfQcXjElABgrBUP317O1O48
         eIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454313; x=1761059113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QdXx5WHPadAVmQPefLqhuYKaW1K4eJN9K2RwteEElB0=;
        b=c4ZDngIynsxEeXDyL1fcfoBlbp94zpQ/LMuqzISZ2iAA4AOZ3igD9tyNdbYrlW/2XS
         ui0fsVTcGzE3IwrqtRduVmV/FasW7s2dsWuBGff0z0YQlDRwGvBBpaSfx2WkTZ6CJ1U+
         MvRF4eop1JGbRMAgxjtdbnLY0+DBrmN6lHv7OhwOvNzNEk79J6OopnsREYeYhuNWszIG
         rXzk967jje02jb0s894C5VOEsmhVVp7F+DADqoUYFumhmuvo+Wv1iPgR582mBVKTG9sC
         KK1NrJDlF0nXNQKKoU+6I9cnxYtWgNdoo5lFLGhvg+DdA1B60+URtTIM6GoAWv7pfXKW
         HHrg==
X-Forwarded-Encrypted: i=1; AJvYcCXK/d0cU5tMveOM/RVSHX6MdpBSM6spW7wSPEEY7j9/+Z9lYI6dhUwhgeVKTc7XUbWR088tVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDCCV9Rr1+d18p7l2tkOPW+ujVi+lbIdP1pclP548jPiUYNGvy
	N+Enfr+w1paZ3QJhuv68iv0mGJtoIv+SB5uixnhRMVbnRC7M8z8NE6OOPIA8+Q==
X-Gm-Gg: ASbGnctL/lxTK3/RL1bLbHXaQrtW7YD0Idh0xLAjLpDgwemIIwthGJuUNWVotfRgaoJ
	12uKNo+YgW2fPVfkj789L0baLciBwJcKYbEcc79xzQtqGS9go6qV6BOdny2r/XPBpFbCMcZe96G
	TNsDE66ANvDQU3Qxk2e1bKPty6eJ0JtzdiE31QJXVnb8UHXzD3sWqz3XFNkdmIgDmW1l52lE5uR
	oZi806pexOF998xYYTyxP39pPVD/RmbPB6koXj6TqZHUUKAGqF4G5dmdDbdMzkHQeLN1lpUDYTE
	P26zc/+ZzO7glv0AagPx5fiWKl2LXLW1f7RttaZAS7L9iX7ANv7JRDv5CA0md994d30mGZ3SHZA
	5nEMW445HG7VRKvK37rffCR0nST1/VotVmCtp5XUp3HnuEQOPeRrqUQ==
X-Google-Smtp-Source: AGHT+IHzoB9us+k1Zg476hidLtO90F3jrjp+605FzoN2M+/LQdkvNujqWL2evXPEkPxkAjKdrdfwDg==
X-Received: by 2002:a17:902:ce81:b0:288:ea7a:56b5 with SMTP id d9443c01a7336-2902723b882mr362687865ad.15.1760454312559;
        Tue, 14 Oct 2025 08:05:12 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:05:12 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 14 Oct 2025 23:02:48 +0800
Subject: [PATCH RESEND v8 15/21] arm64: dts: apple: t7001: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-apple-cpmu-v8-15-3f94d4a2a285@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=lnaE9Aql0p+zaBjSHyK2yyUlKYAm5n38nVhdpv7cd64=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZubTrG7nely1tzAQg7wIlykutHNDRueaZBf
 ed+SCa1nVWJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5mbgAKCRABygi3psUI
 JP9aD/9O1YtQ/3d2Uh81AoFfZe3N4gJv+zw+TpF2LNskS9au5ii1jPnoSk3o3g6XP1jBFJarWrN
 pxCJsqKY37tidCii24MHmkbEuRJdiVwM+wYt7A9AgXblvhDYA+fciSOW5qHKtzhvD6+W8mNxWqF
 Ju1y/WNuqbD6uU3W/G3LJ0pZBfawka++YSU1sFtWZECr3GchFTbyIyR/Qr2+rwmlbehFQE13jbj
 z53bvkt3aG+ZtKDIAXiZOgBQ/t9vQerElHCA/ADoPBczZln8YrdsmBgR88YYSgMpnCDfUre5424
 WngPsYCCfVTxh7qG2EL91wLKxcLfmzjkzOHF9kqzq56pgOj6PJv+h6Yj6obo16bDhRURCfMeh6G
 1f5ewGz5M6+QIuEnMxXNsdMjVRVvqcV4NP2LBPULU56E7F0akXRg+DEQbaWDtE9qDjODZulY/P5
 6DDcXzdBg8tSYDrt9E5rXT6QQsxBVD1xNqaLU6fv+JpOD+8KZbtDe+eO5Djl4YQUZaFbJzta1px
 BfiFXS6HoTB/p1j/lli6vBUk/gFfZNYTkDb8Q563YKBnDMe9kVXTsOkRJSad1Yj/mC1HHUY+hOM
 B9ozCNLR6FmORwDHeEQaSrUDFQnv8A7mjB1LRmModrNWBpg3INC5aRB7OvA6WtwWsw8+hYVRD5F
 VY9Gcwd6nL+mwhQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index a2efa81305df47bdfea6bc2a4d6749719a6ee619..0e414018f5acbcdb10db92bec6e26ba32e53c781 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -199,6 +199,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 81 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t7001-pmgr.dtsi"

-- 
2.51.0

