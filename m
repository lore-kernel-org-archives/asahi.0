Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E7A3988FB
	for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 09:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849505; cv=none; b=ky8Ijs5XijPfByr3orLCU8DArE159jmjZ/4veydp6KLxoL/vOVRfVY+0EuL3YFpDrU04p54pG1czGbvebqTHZTldhI/+ptiksn10i7iAX1TKJf4jCdCft7zJfoe2qSfWlbU3EaY3JLPYo3xrIzO5ZwSg5rfqKpWu24DA2Whc+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849505; c=relaxed/simple;
	bh=x8Grz8Kqtnr/cWgyc/taQbax1eaDHX8U8ipxLd2qWVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VtH2DWx92X0ukNDdTXtBChUWjnBT6KC4XuXAqdlLdUqGxxGxQOjZjS4Rp8p9Ki2U+MsyFuVVDP8YyPP0vJNazfiUWxorE+2r42Y+aLEkBPstzxS/syR8M3OzOCMJaB1VHDCJYBY0SQliQT1XottGcXWeuCFH4nnJk+PbbJol0Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIPcBUhg; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIPcBUhg"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-384c94c9414so2096242a91.3
        for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 02:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849503; x=1784454303; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvzgOVO6jhm4u4fWUb2VkpKCzhTp79gobTgqrCwBTWQ=;
        b=kIPcBUhgxcxu+SXB3QpZwk6qxhG85lUduoOBjwYp8xQOqbxq/MCMgXlqppA/rKqSf3
         0WFk8MdlrJ3YVyrNa34d4qfaRWM4lKTRbGbPNzB/T/ubXFI1Y7zQeOG0sWV0CS5ZjLrf
         shfnuCzN8Xy0HGAZQ2VDf9a/SDFAsmIS6XGWMZrnDTQHOjsHDSBvJo1WI/MKguu/ruiJ
         f8mlZ4pWUg+oIsnXRe7mkixYwopwXCdUy/t+eIDD1/Kbq/63YFe6yTo/7YFuHmoXTfmB
         oEn0ZOTeiYjR88m+vdReKuOAD3EDlI6McFVR/HF+saYi7rIrh8maWp7hwLtTpz69EKWW
         eVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849503; x=1784454303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvzgOVO6jhm4u4fWUb2VkpKCzhTp79gobTgqrCwBTWQ=;
        b=X7/bYSHurz+tosG4EMBcluYg20zQKAOMk2xP8aixHTf/geyu9cpcI98yj9bmn3LxUC
         HyDFpdMTfE5Yme8JR03Qg33JeIBZXta2bIGmY1pwt1ztDKM9n7w2p0XpUOn7iMD0ZP2n
         t3JllcT/NeaeiN6DmzkJKmPWdIwCOLsDEBc0zurjE0kRgT97E9UQ6kF9H/zRtbHLpDy1
         DSLWBArqtXwMe0CVlOTR+J7jzy7A5Q9r0xI2Ew1t4KQbtXkLYOLScqUevUHvluuIZ0P+
         GS+aBJUYGIDKI3OGN3cFmvWadB4wLH4gKG4dZU4uGZvJ9LiQB055EvD3iQjVn5ATrJLK
         ATUQ==
X-Gm-Message-State: AOJu0Yzao8g5HfExyPI2q4yLLvcSUORQF9VMrOS1UCya/wGJhKNRYmVP
	/5AuP6zMmenmrDvLMyQrVhXRWcW4EZtJY3Q3hapxojNeVSnojC77eb8j
X-Gm-Gg: AfdE7cmGgwm9CHznkbRcFnRwuXRlDvezDQwxThrYsiuuu0pJd7COuLV/vderaVbV8MG
	3zkY/zpave3vJSt2VqZK/IeYIqyjZsAbmocucoMPqyT6HB5gSwfSqaQLSIKd+zBSNkgX/unIsRP
	H9wd/mgcY/Yd6q6NU2NWsk1CjLwdo341EFyt9JsIMFHe7YThgHMCOotpsyg/fvUhKCjiqzqPd/E
	7AhMj9BzQsABWajQ1YK657QaF0FCPet30PGGNKDer9gkpbHHCFd10tPBi+kZX6lCnSurStlHYLu
	4MZA6XcaurgD1/mMtoCkAqECZQ4Mx6JtssX1AnUH/s9nr2jiYfYzBleLAXPi/oeETru0YW6UAVi
	EB9ai/qO4rfFl4Aem0p5bVLkOb/wKfZvdBh5v1RNsewCMdBrFVSUvI/bBYMAKDmhxJQ5XNOa34G
	6SuMkNAi4eIdy2rvPU7F/7dZN9/JAInq5N6R7PP17SAf+tFykudbcYnkz2lWrXps6TRARS+ldVe
	xHlu2j+rhRaPMJpf0+DA/Rgc4HlTAAGNJku4/grVfKIjW5nvjXyq3jE+kj49J7E
X-Received: by 2002:a17:90b:514e:b0:387:e0db:bc28 with SMTP id 98e67ed59e1d1-38dc77cf117mr4925674a91.40.1783849503296;
        Sun, 12 Jul 2026 02:45:03 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:45:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:31 +1000
Subject: [PATCH 12/12] arm64: dts: apple: t60xx: jxxx: Add device-specific
 SMC hwmon sensors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-12-7763006d57c7@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2858;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=x8Grz8Kqtnr/cWgyc/taQbax1eaDHX8U8ipxLd2qWVQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/3dR4qK5p210l/pqS3Vv7mW7v7f6a3pPXXqx/VN
 NhzM2Bmx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKqPH2H4p/mTUfXNvp1bmnnO8ZfNF2XfMTfIIE8nf0KO8IfHMRJzGxgZOuR3r5H
 uuX197szpeboFmqt5+zey2S1qsSyYfvZDi9V6LgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the device-specific hwmon sensors for select T60xx-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001-j375c.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 2 ++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6020-j474s.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6021-j475c.dts      | 2 ++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001-j375c.dts b/arch/arm64/boot/dts/apple/t6001-j375c.dts
index 2e7c23714d4d..08276114c1d8 100644
--- a/arch/arm64/boot/dts/apple/t6001-j375c.dts
+++ b/arch/arm64/boot/dts/apple/t6001-j375c.dts
@@ -24,3 +24,5 @@ &wifi0 {
 &bluetooth0 {
 	brcm,board-type = "apple,okinawa";
 };
+
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002-j375d.dts b/arch/arm64/boot/dts/apple/t6002-j375d.dts
index a2a24d028cbb..e6eb6b6c386d 100644
--- a/arch/arm64/boot/dts/apple/t6002-j375d.dts
+++ b/arch/arm64/boot/dts/apple/t6002-j375d.dts
@@ -184,6 +184,8 @@ atcphy5_usb3: endpoint {
 	};
 };
 
+#include "hwmon-fan-dual.dtsi"
+
 /* delete unused USB nodes on die 1 */
 
 /delete-node/ &dwc3_2_dart_0_die1;
diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index fee84f809a9c..caded1636f3d 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -367,3 +367,5 @@ &atcphy3 {
 };
 
 #include "spi1-nvram.dtsi"
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan-dual.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6020-j474s.dts b/arch/arm64/boot/dts/apple/t6020-j474s.dts
index 7c7ad5b8ad18..e3c2635d84fa 100644
--- a/arch/arm64/boot/dts/apple/t6020-j474s.dts
+++ b/arch/arm64/boot/dts/apple/t6020-j474s.dts
@@ -45,3 +45,5 @@ &pcie0 {
 			<0x200 &pcie0_dart_2 1 1>,
 			<0x300 &pcie0_dart_3 1 1>;
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6021-j475c.dts b/arch/arm64/boot/dts/apple/t6021-j475c.dts
index 533e35774874..82689c380cdf 100644
--- a/arch/arm64/boot/dts/apple/t6021-j475c.dts
+++ b/arch/arm64/boot/dts/apple/t6021-j475c.dts
@@ -35,3 +35,5 @@ &port01 {
 &pcie0_dart_1 {
 	status = "okay";
 };
+
+#include "hwmon-fan.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6022-j475d.dts b/arch/arm64/boot/dts/apple/t6022-j475d.dts
index 31f24bbda968..f50a6d56f3d8 100644
--- a/arch/arm64/boot/dts/apple/t6022-j475d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j475d.dts
@@ -44,6 +44,8 @@ &typec5 {
 	label = "USB-C Front Left";
 };
 
+#include "hwmon-fan.dtsi"
+
 /* delete unused USB nodes on die 1 */
 /delete-node/ &dwc3_2_dart_0_die1;
 /delete-node/ &dwc3_2_dart_1_die1;

-- 
2.55.0

