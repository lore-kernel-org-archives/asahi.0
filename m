Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC08C226D00
	for <asahi@lists.linux.dev>; Mon,  7 Apr 2025 04:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744001216; cv=none; b=huNUKnHp0t/TcNmHXXDfgbkWKdpglHn2SaAr/jTQcIAMLiD7XSMM6M494klqHDpZ8hLphJ9FlRWlGXFFiemNyrTJpyDDoJlyW7vb3RFewRHv9heWNdfTqmWLj6BvSmawL7s0fHls6IKeIPW12xyhCSg1aEScVblC3GinXhNlrro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744001216; c=relaxed/simple;
	bh=/9xxkCL20iFcrQUCvIdlPD0ncxR9ZewCh+wmud58YcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j03WX1ZOkkULKGhSOwkyZSEktPWQVTPU700eo8QVPfXH7NEhgrldyv4pStGXIopCcIq6E/juNdC+mxH/41SoH/PplqQ8u0qN6RHLT3T5wsMrOTHZeS417Ap9mfthDEEb4kaRR7hPVAIjNiCPu1xzaaLX1+cY3Cck+6eCekyhFz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdBIExSP; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdBIExSP"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-af55b7d56a1so2656699a12.2
        for <asahi@lists.linux.dev>; Sun, 06 Apr 2025 21:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744001214; x=1744606014; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=;
        b=gdBIExSPdvdYj5Cu2gqYM4cM/WUjReMd3AvfOkx3L8gbpcQyrScVkGqKAMIuKhSuqu
         D3iNzNy33qRCKpHZbW8gBZsgttgXcUo6tpV7Sc5iHHuW84qnOWuq7jCt8c7A9weTOhbU
         MU6jBG69v5gBolYLdVtGkRGHL8Z6CzXDhVhTmPXfnGMzMSNwlNYAuLd63RqJ16ZfpYf5
         f3D2wfFXEbWuj8MRAQtER18UTEnJMpxYJgRUWmYLVP5DaUv9M/Cu0jHGJh4MXWJg65zU
         su/Y/80PRA1y9HB5xsisLZiqdbejzL3L590HRjnDDKqxsrRDGLk65cxsP2DSIgLMvdBo
         uJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744001214; x=1744606014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=;
        b=i5HQnzv+FLuZsh2pOl/omJucy7EOR+6ax9cwXSQZrlbhjczBP8OqSZtE1H3Lg/coYB
         1tVCOPIuwBjqthM5uC6yPurfILIOuG/QOms28VgV711bA2Kh7FVvO9yqqVWrOq2YDgbh
         SOBXwFre9DFZJedl2uKw+3OmViHwp7g9owA1Us84RVWVCS8Pm5Z2oSDC6s8t5u8ISAlc
         PgeOve7WSydZ6eDr49lfGSYANjWb4nUY5CAyqTx0ndWBwhxs2yCovKN8vqZhdqHAlT9x
         LzWovBFUTlWYqWnRPu7JTZ0naVU9Dxj4C9WmYvEHcVKu7jlLGZUyxpRnlJMd4Ndvdiz3
         5/Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVga5aUkMgzbE1LXdNtdRX5Hl4VltfqxZnqWknwJLDjIP55gBWJSNyqDpMzXbyNPHMfjk+qfg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxWyKLqloVC30tliwTfsdhmMN1NgFdp03IxNSjLRX3dEUXdEug
	lYnaSP/emGm5HwYqv8sDmWefyMt3iQKfhA5D9eKhEa0zzVNIFJ7N
X-Gm-Gg: ASbGnctCvNiaqE5uQ/zgKWTL8O74s5NLlfA8X7l+9J1+jRJlzcO1feG0O2QgUi2gnao
	yRktxIxXtCkoLWuvfn7YXUqDzomWxWweLEKDPfQ5PhyGLmIfwpEVpAzJgQoKwU9H9woalhwqmA9
	J7YOTt8c3y1Vw3rYtRjJm2guy1CSi/6LSxi9sZwJALAdVAfnEB2ysb8q3LEpvZF5HCjuvjII7py
	0Qc+0UVyerH4k9fVt0uUP2GjKsY3ZeYKzuT3Pf1qjUA3oYTekJUq50AIDbkQtRJrb3jjruGdD5g
	M4CeOowtlOYTgFO+z8NIyrXyVne47xLDn1W7WyIS7BqBstY=
X-Google-Smtp-Source: AGHT+IHkFpKG5KLURShxQe/XDzfzWnriRP5pm3fYD01e7ndiHQzSjwI+zMrCouTlArXInI8jl6xCWg==
X-Received: by 2002:a17:90b:1343:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-306a4b7015dmr14258833a91.26.1744001214056;
        Sun, 06 Apr 2025 21:46:54 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm7765810a91.32.2025.04.06.21.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 21:46:53 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 07 Apr 2025 12:45:24 +0800
Subject: [PATCH v6 15/21] arm64: dts: apple: t7001: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-apple-cpmu-v6-15-ae8c2f225c1f@gmail.com>
References: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
In-Reply-To: <20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=/9xxkCL20iFcrQUCvIdlPD0ncxR9ZewCh+wmud58YcU=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBn81iHfwtmOGqo5XKi+MJVM24nFqWXwya/Kcraw
 O5i/ZZ8CaCJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ/NYhwAKCRABygi3psUI
 JEijEACr7ACw4+MryIBoVl4smMOuI8RCmwN+JZ/aBT3OcN+QuFY/0FfHpsd0GkKD+HS+kKi4XJj
 RuXBjk4nvy4rZJAa3R3Y3mvva0rlW7iUDBhix24sD4zXYqnGVCNOyPBkkiUd8vIv6TX2bExPK6M
 GyOeTm1mSiIi2/aSWJGTgVrmJEcvcZdnUJ0NYSrWmvje1lr2RsJwBVKMwLCnvlnwN/m1YSL9qx/
 /t4n4JuQCoMtQ8lyg6Fr47wJcAj0YSm92GhA8BdzAGAQvG80u3VXfDiuQUvCcgNkJe4pS1byR+m
 6Iw0LBo0mqKZArdToqAOvGMlvWPWwA/7pqyQlxR48ZT9aE1qDI6UqAl12/9duiZ18hm+XkNlYEg
 LjqORKXEbvhSK+G/MljXBxtWnthQSpvvuzFtxWZeVNMFng2wrJEjd9LYkP7V1ElMrRRiiQiEVxS
 Xc1ShfI/BPdAYdueD1zqhSTfgnxjNuSSW+XBzjhC2My2fypAY7l3U+TLbnrNesgQAFI75x50l3X
 4rtaz2+V188Bxkp6osE+pBTWE9usDgq+TAc5tD1VxJck+zte5jOpImIRDeT1Dtse/rDd0FoIEj2
 /NqfRob47D3b25C1NTgjFHHmdBv2lhECqREM+bKG/kkQzx21Ete52j+nGCT0I3Rp7ffhr8E/YGU
 0n64V0da6dVqfMQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index 8e2c67e19c4167fc6639458ce79588e153336603..fca0a100dfd7b29086735d36fec0db51144da456 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -183,6 +183,15 @@ timer {
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
2.49.0

