Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E81303A07
	for <asahi@lists.linux.dev>; Mon,  8 Sep 2025 10:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757325739; cv=none; b=DJHmrFWeu5mvQfU4FdoUIfS95YezbIhWsKONsDz/GXSAWHYPa6LSkReHVIrLJQWNxcCuLKED5i8ZQLp745jnvVoMrBJ7juLEMDR1pPnc/Y9qzifRH0iwHKLS+MpINJRpiP7uW6zK/O+w35gwn9GW/JHTG0j6+t/lUInO3p/SRg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757325739; c=relaxed/simple;
	bh=aC00DD3jiZSVPA6I5+G806JpCyFv8tDWkvwqkbp+yEU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZHCwDxRjA83Vw5b5BI5/eUk+YyvnXUPrSRIcGwyzoenz51ZEYs6vxjecotcFkU7qGTMDUEvN8QJub/7e44263Ca8OOcXDdBaW9/q9IcWUNe2Akg7HyI9h8zw+vhlwp8lW2aqQoGVM2nLRO028ewsVmI16GzwWySJlzGoVS9paFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGeneXmz; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGeneXmz"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-772627dd50aso5586822b3a.1
        for <asahi@lists.linux.dev>; Mon, 08 Sep 2025 03:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325736; x=1757930536; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/G/Lg7srDy0beJ935wpO9N4JjYVVtt8v3yHlGagArU=;
        b=aGeneXmzhvs5tVp8sTi+e6bSO8hFrYxXo8irEspb1cKD1q46ykHmHXWpmwo8aufwrW
         QCx/YFMxXy0Rn8K0CLSKotel2yv6xDB7VKK/voE/7YstxqCJn4IR8aDIj/Dx5tRY9/yd
         gn7pOXxp4cUsMqsnxtQbfu6fx2se151uf6/MZZ1vXpCJtebi754yivV1JuciUvXngpYs
         1phoXpVn29+zhTqjoLIBg4xvYeLKpX0iaeYchhpQ+FBVgGdxoZmvhmKGAYKQtyjbhd/O
         z+xfrJ8ZlumHvuHeZy87vg8BvnobJXkJT7T0l5t972S41loXbd3wx0PWuoE51dSo6ZOC
         EgSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325736; x=1757930536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/G/Lg7srDy0beJ935wpO9N4JjYVVtt8v3yHlGagArU=;
        b=nNrF74xo9IGcLva9V/DRXt6TKbkk927bBZ+0gxJcwN+KVPeFPr3mwsIt4wr24bDBAD
         BvUEzeIWfr2GSGkOMyVHTdUj+JOiZI0KGKYc4o/CF/JMcC+j7VSkIzgElFrmFKJYml0Z
         Mb/cRvQ1D+ygLeQpq7s/4Qs337bSuOsBhaCAaucGcq8XlyiTNXNRJq1DQxPsO0kE+yRe
         dBNGvU6y4k7ZhK+ymRl5B3mEgfruCL5am7mmkO8wTIjv2gFv/eH1aAEX3PAP9WcNNhC6
         Uc6f94uT5neUOZdvFJHnq/Fy6ext2tc2d0gKqP8cKBJUHKEVkTamY1K6HviLXO+qGMET
         d3sA==
X-Forwarded-Encrypted: i=1; AJvYcCW3nPFsI63/TKcvLtvdyT16FajOcLHWTsfdoQoEZhXtPAXS1E0jIXQpALdMxU//7J+abeg/Kg==@lists.linux.dev
X-Gm-Message-State: AOJu0YykRThtFWif6WX+sPPkZAMB2CZdjlv9HfAf0EoCnO9lK+Kpyqiv
	tocrUxSQrgVRTSp/P7eOfgtX0JAA45kar2zCOvnmg1Ctg1BOxBSVwG+PDifh+kPHdcw=
X-Gm-Gg: ASbGncvYAC21P4CDaheDEwK2oLkTASff3eLebCPhbQZKQtG3jF4jt2dxQFgHNdw59HZ
	l4tI6Kz2IawBo2r6iVXN62bIA0ZDl9+WPfA/h+G2dYOYHrqpr5SLkWRTfPbAb7uPJE2qCVRaeLx
	E1APDKdfx6cVPy2+rJf0psTEXki0gw0lLtHZuYWgxSBmcn/h5N+1UnKvNc7FAEId5jo3wp/bbYx
	eUmvxK1wztl/6aI0OSmB7VMKaOXT9K664tv68Ij0JMs7vrn1TcRwXdLgi+THGhll0jzMNmDgTLQ
	JXnOv3TrCSMpaJs/KIO27P7+yhpxvHcOsa3tR7Y55d1oYpxVlgSVnE6kbaZcqmncsq+/1z07jYD
	6bkUltMt4Dy9yc7GqKFe8PR36zsdNlrbhMyhOjg==
X-Google-Smtp-Source: AGHT+IEAIXwSOWBaq4aQTTAg+ktCQQ9sgDbFz59k1ZXwoZKqObK9N5fMVhMYXm01tFsE2HKdytctkw==
X-Received: by 2002:a17:902:fc4f:b0:248:aa0d:bb22 with SMTP id d9443c01a7336-2516e1be7a9mr93271285ad.0.1757325736198;
        Mon, 08 Sep 2025 03:02:16 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:02:15 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 08 Sep 2025 17:58:44 +0800
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
Message-Id: <20250908-apple-cpmu-v8-20-d83b4544dc14@gmail.com>
References: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
In-Reply-To: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqlFBgLFwy76RbumxIV4c/4RoBztS1KNxMhXp
 g+h0sH8bYOJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pRQAKCRABygi3psUI
 JPrBD/90RC79QUNeWxSVOP9mLx2PGE9DkCLNIvfuATE0hOmwCczenMR5rjgeBu3TcOy0TL5LiCm
 8BhYt4aqJvKUmWNN3PgEud4sP8LUCDqGarjqZz1v+cyHDkRe0JYy4F+PyOstw3hUr1JxQLSxkQP
 HnQjZJS4N7v1TcAI7fLUs2tRdzbayKHs8LwptI+0FaQW/lPboIjhpvtacsFdaL7XvcqpDmiDgJj
 09Z870pzP9lSW8QSO6XD6KDT42mGF0jk2EtrhOVGm8UnbQg6w/6L8KB226S8kJNo4kBAL9PriO7
 k81he20AOwARbqedkQ/Cc+KDJk4v2wp/1det7F2t5LBd2b4xvvJsVfH4HJ2/7lQVrXcOzZIi7PC
 gZWCeBTiejrJmOTg8fr1ctNBQXvTg3psIMvzneDBAX9Eo3Xg6ogoSRLljCOHprQ1pMLxIl5xbp2
 h5J5ai0+dBv+gtYuTyknryYVLJc8tizU1jqdpZFKaI8NbfzCBX6rEMQ54o+hs0m/1XkwnR0nV15
 zj/G1Hl0YagMVy73AlwTdEBo6pI3tVZiPT9O1m2YNbxtkosB7cGUPHXC0YNDhjqVws4ozr7JLG6
 mhg6FLxoU2del3YxiZxOojjgIxBxzlCHC+ujRgGfZe0BIfpfYtl//f4oYeRgYXBetbj6hQhn3WR
 5DN/DitjKgshA/Q==
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

