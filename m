Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7753988FB
	for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 09:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849496; cv=none; b=LPRCvmS/hqOutQ0GcA7uDp+aFPgTuPuWQpdZsD2wSpu2MTMoQXqm8VXVkgTPHpVbs0xGewzoS2kJ0O2YYBHZVA3BRae34i45XmNnm7G0MBMKSmCHxWcCHPyG9AWROqLlIgyeVace/M4kZ4mLZJtF7DDOn2jnAshmjls16qbRxdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849496; c=relaxed/simple;
	bh=8/vnYgv/XYpka/uGiQL2oD+pLTdDywIPDenEMn+m6Q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VFtSpHvOYjku0Z0eRrZ2AsTlejLLzccDLYbOcyiyfARX9sbJfimHNOvoFkqkI7h3bGJZsR15Bq8ez1TCl5m/4PeK0IeTb5Tw8cUVrGxsxHtztqvXtuFSgA2QN2W6XxPbfIOw9vQCf92/azr7Z7GCsg0As05qO7AMub/4PiLWNYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ku4mTTrU; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ku4mTTrU"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38dcbade417so659740a91.1
        for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 02:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849494; x=1784454294; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9FXdmldrkOS3aJiP/5Cuq221SYGa3bLdMeazyZQfaZI=;
        b=ku4mTTrULOAE0fgpVcgdibtK4CrQU3Ema6uSGuBvVyHUSjm2ERN6hSfpT4KapIS/3b
         Oi+AN385miLQmsaye1kInHWsco4/+3VIzpuX3s5XR+fX0Hg9NLvCCdyrJpOa9N9QJ6X1
         H20Ylk3GdEjzyN0Ti7minkKHNrCSlp92JBV0Y+sUij9XIjxdJKHGldwtFN7s8V4fbPCj
         p91vbqbL/EJZyqa9SDeb2vqxPvOJ9euuJMWv5w7/HAChOTSOYfpvtY0Hk6PPwFmIzVaT
         EJmHeIv8ijcaVw/TSjqfXGOL4o/LpHlWW4nSSlE4TtxIXOZJn8vaWOiCxOIOjWMsogjl
         9kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849494; x=1784454294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FXdmldrkOS3aJiP/5Cuq221SYGa3bLdMeazyZQfaZI=;
        b=Bmw+F9WwLOMP9FN0mrCd8WWpi9bfBAqPepUs2Js8n+h43VZP2xzsmnVcCjeRg7v9MK
         aOe4QTybmUlje83Bzh+szLKGKO4NNgrIe61MhcccbwG4j+TaxW5Yj7hi8Zh2Apj79zNX
         CQbwPFPTt3tOO6K+EOM/STMY4nq15FkKIp2NzuGQ4eRkKQ2RHvS2ndj5CgqsNg35nTGD
         dzf/vFwsThnjjTQYA0Zy3DlNLjUvU0ZpM39KWUzu69qZKn/r/azBmvY4+ZzpMAWqE7KB
         UdJG9IRKrKndT1JWJhoscXTexm0ovdH9BfA+w7utvxwqJx7IKmRJnODthYpnKa2x6aNu
         ppLw==
X-Gm-Message-State: AOJu0YzZxZjpXoLKXlU08bZkBfYbOCErN/2g/5H93jryfVn9smDUPk61
	dcB6dJV8T8r/mdb2Up8XARso3NUHDoQBGGnk5eZ9UkFAG3qb27LJaw3R
X-Gm-Gg: AfdE7cnkbhuylZeUAF7WDoEZP+hX4LxqB153tfT1pwbvXZJ9gaCISYv+/zyjZRWf4a1
	QgA0ezIDq+LlmhEx5Ga/93z2DTQKafXoRDADHFHUZq7iQtNKKh+XLBM66w/iN0L6PRLA5rf5TuO
	hykzmbk3BeZ8t8UCMdBXgnsek+vHA5IABlQmgLlJjKts9YIwhjLm7naaDDhaXmgMYGf5Jhj4ZAY
	JNrsQuk8rcBXxjSOxFtJ7npg2hZXt6y5kuSZQFeiLY+WW+HWLeReRF7Fvp3Vhi8Gfc12yyph2tN
	P9mvdN5snGaPkNgS14nB5ZouhV7UnBtXpOTrCREaFTrziUptYve4o5RbjYf2sQSNZQBPfF0qQks
	yRIVjMhN55UWuIhnumCDvRlFsb9VaQRKUtt1f1w9KJ2TglYFsjwgLk2BMT+WQE30xVWwVPEnTZB
	/HaT3WoY+6r1dx0pzcaX8SpHyiHPqOZ+pIhPfhz1VZUTot1FeOEGo6nPoZciDKPM29wssX6VzZm
	506FcAPB07pQhhuyXhRfO1wiXfsz8rvs9gl34job3gupBEKwACOJxaQcY35J6iPt7Ya+qyQbvI=
X-Received: by 2002:a17:90b:5243:b0:380:71eb:4014 with SMTP id 98e67ed59e1d1-38dc7747c1amr5458934a91.15.1783849494649;
        Sun, 12 Jul 2026 02:44:54 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:54 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:29 +1000
Subject: [PATCH 10/12] arm64: dts: apple: t8103: jxxx: Add device-specific
 SMC hwmon sensors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-10-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1411;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=8/vnYgv/XYpka/uGiQL2oD+pLTdDywIPDenEMn+m6Q8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/VAvW6a1lWsh88sVBzTlO6dHl+kAjTBpeT61u1W
 GcYeLF0TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 SMdYx4iBi1MAptpNj+GfwlRJ5+aEf68VP+0R4DrOrpvlee9UWpToiiAm1uVSwQt4GRk+Keb0iMq
 eFHWW1WhfU1I512Oz86GJEwpflGWH/uPSfsIPAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the device-specific hwmon sensors for select T8103-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103-j274.dts | 2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts | 3 +++
 arch/arm64/boot/dts/apple/t8103-j313.dts | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 52965258200d..1212852251e0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -74,3 +74,5 @@ &pcie0_dart_2 {
 &i2c2 {
 	status = "okay";
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 52f63ae7a58d..1d074b9e6018 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -132,3 +132,6 @@ dfr_panel_in: endpoint {
 &displaydfr_dart {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index 9eb2825d25dc..f8b2b1637b9d 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -54,3 +54,5 @@ &typec0 {
 &typec1 {
 	label = "USB-C Left-front";
 };
+
+#include "hwmon-laptop.dtsi"

-- 
2.55.0

