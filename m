Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34337278148
	for <asahi@lists.linux.dev>; Tue, 29 Apr 2025 03:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745898270; cv=none; b=i9sSRFTvzIRCJGyPrthDoM+vzBhOqkc1m8OP4H+pWiM7zdnHbRuxqSs4JOesy63tqcHoceMRbf0Q9GW1DjgApuDQxLsU83lGOEfcwu9NbLsex2/jA1UBesvWOMuWId7j8OlXKHIj6f0fDvq0oLghGa1Er8WidXJ7F5vniScSR/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745898270; c=relaxed/simple;
	bh=/9xxkCL20iFcrQUCvIdlPD0ncxR9ZewCh+wmud58YcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e32fdJvaGP+6Qny0f6/L8YsDz5VGyjNNxOiUEEftbxJvk4i4G8dZ6eA/j5+YjLcPtl0JzagExqItjNtT8rU0vEjp4uw5c/n4TdqsIFIfO1hljmUPMObxERFgNkpiojcSiv0Vrw9+af2wwPPR/UPpM6o42SOoCMyeF3kQMLlK3as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uwyr3Y2V; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uwyr3Y2V"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301e05b90caso6150535a91.2
        for <asahi@lists.linux.dev>; Mon, 28 Apr 2025 20:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745898268; x=1746503068; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=;
        b=Uwyr3Y2VPThMQO6HdjbLXnt+SpKiTBLQFKOZ5A+mDkDk7HWui5MibzDsnNtpf2F/d5
         toiWdp6yON727PL9L4bF2CCDOnhM/3pqTM558NvpHAKz7x7/JocTNCRQAM/YBXQCvtVI
         rWIDPDtJDN13Au+bcu68yq13/Fdo24bBL9qVS97GyOgJUvyitXfHRYePxFSc4ISIadL+
         PkKDF0U1aYZ3McaiVGuiXqbRMrRLshts5zZYvWle128IJnHNSUBTW7oK8sOI+I94Q3t+
         hcvoqgifGbjJpVTQQNa20pDU7N6vb75p/hNl/GRFL3vPomFylE/jRjpQZLOCQkj393N9
         XDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745898268; x=1746503068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t22CBONJmB65GQP7nsD4ofUIJ4+sf0vAxHh7+1UHNU4=;
        b=gXNXDGJAZao6EgC9/7mdkr/mCmSnTZqvg4NJUNx+Bp59Xhb0P/B8ZtKXg84JlNHiLV
         qeAmMghj4kIcv57umgb+Imhv5TTZpVuhOgcpL92ilL+/dVHyYDr4l1DyroDUcyM0/GEU
         K0Swq7JG+ow9ZQlLKzaMTZ5yydXqABTE9FeMj52hOCO0W33b9AdISOqQuk6EuG2alJa8
         XM3+Io1MUPpS8b5EaV4Td3ZDxRZUEvlPxnPhP4lt1avvThe9M3iZroh7mqImpBj7V8Ay
         pn2+xC15q8IjZoZa0O7TSCipmONIVz0fCg6yhhWq//4Z4R9TCygERkkqJG3Jv0cfsGBz
         HGtw==
X-Forwarded-Encrypted: i=1; AJvYcCW+HG3mMsQZxGC57IRg7Jcqct6fh3g/ku6o1YRihp7369LGJ6yHAWOpWa7/iSn3Su7x7D9JHA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0ThCZoi1v57LuKGdz1ZY5WqEkqUvLFmiNj+8s08iLAvaBqeWg
	wTmmuwnmWP+8xhP4Bo+34IcsI3JbL4eTbslt9BNkET+PC+7uVT6U
X-Gm-Gg: ASbGncvkdKZcrFhAzUwkNtkA48fbcvNQrErpe147WYhtd8gWQvS/pc1QOIW79E76r7j
	gUUscJajZ07sjSNi0+5LNGx7NXM3/L63jG5puiFjnd48tREQwsBEmPUCCJoFDR9l1vX88VHUvSn
	wFx3U+gldSh5NklfvN+MyfEMsL6rKuXXKx1tXFHCe4RqQSHZqcm5l/633pGZJ0qpHaQqzHNAlHb
	HbYfnJKgMLKk7U0muj8gRAGrPNkrXtd17HFGP3r3R1MeQYMPraP4QiHZJrZNfV4pa1DK9SyfMOy
	MSwNds2bbq7gx4gfD9JCXXsmq9T/FLH5NhuyJagnrp1js5902m7wKUK3Xg==
X-Google-Smtp-Source: AGHT+IEWEAw4OwT6q/IeOWjxagm4FtQQx0OABKyoM16AT5iVGUbP68gxrwVyzhJZKq9oXmYDl3pltA==
X-Received: by 2002:a17:90b:37c5:b0:2ee:f687:6acb with SMTP id 98e67ed59e1d1-30a01329347mr16385125a91.13.1745898268547;
        Mon, 28 Apr 2025 20:44:28 -0700 (PDT)
Received: from [127.0.1.1] (wf121-134.ust.hk. [175.159.121.134])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb7fsm9953249a91.9.2025.04.28.20.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 20:44:28 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 29 Apr 2025 11:42:39 +0800
Subject: [PATCH RESEND v6 15/21] arm64: dts: apple: t7001: Add CPU PMU
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-apple-cpmu-v6-15-ed21815f0c3f@gmail.com>
References: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
In-Reply-To: <20250429-apple-cpmu-v6-0-ed21815f0c3f@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoEErlTlWClVLzzj9JKvXwgD+WaQ6ahUE4T4P/+
 RShtTYfN0mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaBBK5QAKCRABygi3psUI
 JJG2D/9mYelzQkgmHZJ+Gk9hwJh+/0FCUyI/1EeTu5DrTgqAnxUbT0fLW+7ldfhF33cOLMANMhV
 YnPNRFc5GiumM1clRZY0p92fIuG7o5b55Dui15dcarrcBZb5NRLiet8WHiKuo2+W4qSldLIjnp1
 dla6eCkdJajYiesIZg1MWs1gh9qqXvo1UMbMRtUtfb/mQdrBqap9y9DBKSCsS4qIMlhOO3zIhXM
 6yUvEC8TiY1NN1m2FVH8DgSsObS5a+pGm+vbmVrIeXDlD48fmln60yS9NbD4CSCf4fF/Kh3MXjU
 CigdKHVnufn5Wp8QS71MWLWDyB8I+xhwWYFi6lDvkpi+q/eLEKq0WaZ+8+hrKd3py5v5dE3Tobv
 U+lH141KU6QlRdwUIHxERkksiG9XtoRk2QM/xA5ZOSzBSMc0l1tslqH5Ew8LJsJbjaAVUzcx660
 Rpbg+7i/TBidpdCTv0jYsMyIUNvVz2YQeDEbp+rEdg5Dt5CsRaxl1VdA9qYKIaFq7pHff6GSyn/
 UW17ny0wsRg2S/FvSheuQW1XYQjLZvHmpLlGchM6GnNAs3z8oXeuYAK6y4jOldrwy+Set48FEt3
 gR8h85WlInSig38WV67JiaruYXYdHpxkK/0tnoggnqSi5IqExrL23Hx1A0GGUb6uuZ5JWlNzuMc
 ZiHX35qQt2rAeFg==
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

