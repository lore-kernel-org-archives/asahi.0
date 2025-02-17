Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BFF81720
	for <asahi@lists.linux.dev>; Mon, 17 Feb 2025 06:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739772630; cv=none; b=QIN19ESCKRlFFKPWNXzCJCer4Nr7nmoHOSr5xPyhQqT1GK4WDS7D8gkE1fREBY1d54rbi/goDz9u9nARW0337AZT7qVITp8ARWvLxDMK49AAwDfipPukICZzJ9tBQ+zpw0KGxv8XLrYML8etLv4lZjvdf4Dp4TqFyvDaO2jKhJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739772630; c=relaxed/simple;
	bh=CrIuLPMpgJln1b65h2U3ovn7OZsssqG71Lr6yC+n20s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=NKRKT3z2RNEHzPC3PED0ZXTwVrc/eSiaZRglaBR66Mi/vaYfft86vMLhClaEhQ3ix7VNgF2RIDq0kfUbjSDxgzBmybeAn1fRDRy4WfRsPig9UavFF3mGvcK9X0tqNpaDrR4KZ9ybfgWSsOHyNs01fZXg4QFlEyVznSD8jIAP4zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bc8fgLpJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bc8fgLpJ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-220e989edb6so73421495ad.1
        for <asahi@lists.linux.dev>; Sun, 16 Feb 2025 22:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739772628; x=1740377428; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4pUbnlIaFpXwj2FnC9KQKdRLGokSGMi945pdWEyQAOU=;
        b=bc8fgLpJKyCJqTX9UbIA1YbQO8vSp1wNzs1Vb6crScAixRhvI0tsSvG6ZtxFNBm+ui
         CvJ6gcEwOj2avkGac0CaGAQpDrXn0g5OAyWFmiLVVx+/ww+HtgB4VgJK/Q5vx9u1FABV
         quKbxzsqp6ysOJgWnjlzJP49KhTsP6ybuIQrItyAvx9jCgW5rWm++Me8Kt2j4zD3m2e9
         mVwHddr5CEbCCUf8qngSa1+reuRrjARP0U2VcMod4jbFfinOgi7dC0M+2Hl3EbQcSYlK
         Y8Z6otaRmgAZRGC0aMkHsR2DFxFLsCiHcGCEne/JnXiIHZXoTEt3ShUL/r28pq7VKYRX
         bVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739772628; x=1740377428;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pUbnlIaFpXwj2FnC9KQKdRLGokSGMi945pdWEyQAOU=;
        b=VyyC1OAWYfmT3UJmR4D/Dbojie3yLmY2L2XoDP6F7XCBNPEIPCD6lC4WIXZxoRZQNX
         15OJt90RcztrchGa7s2R3BppjcADoh+JfTbI/44jnP9teI1O4WlvUf+GHCW+pXGZyq6Z
         zAXGqX2I8qq8HqFmFnpbKRha+vY3ijS7QK5yZu/NbkMAP2kbHly/nhO5BkEsDK30lDNg
         GqCx7dNJuLeKp/2lqB5/6XzdsP1Mhp3psFtvYZciEGYtt/z0xQ7T28rvKPabjKLb44ml
         zOFA2RmguJvKGtiDcFFSLrn8St0bfQ9prw6qoa9yl+KzKTgP71WvbDsVA1hva46W76KM
         49xQ==
X-Gm-Message-State: AOJu0YyVY2LyWRaXIJa37v3eBOL5fQSitCPAFm9fN5RyIaubpd2m1OqW
	y5zmWiqTiSEN59php8b4GWnVILACuxUi3O0GmRZnGVFdurgxW9do
X-Gm-Gg: ASbGncutaE19BatHhJQ8BNRdDF4Q6MMFifJmR+fwHsu6iN/pH8MLBLbME+8AFSbzpJm
	oqKgSStmrvs1wBcHl4+b3PkH208PqzqOdPfbmVYCykepn3bFOUq1zd+eUcavMuif0MxHi5W6yFh
	iUIIH/DBdgZwdMiKvsLF+O/sQi+RanDEhzcrWiKaESyo4g57xDblemX9qi2pLnEsH7eTEccLbJC
	qjwiwHIJm20RgJ/5U0gXxdwhqppWRL2NX9FdYM+DlL/r7jdLQK4zh+IeNPiG9+93tYqcItdnVt+
	Q7mDU85oCLsCoscZXg==
X-Google-Smtp-Source: AGHT+IEP/BxIfU7rsnxdSBvVts0xAblW8C+YTQavZsFPW0gEu8GetnOdrXN3b4iJF+M3Wd3LdxRhGw==
X-Received: by 2002:a17:903:240b:b0:216:3c36:69a7 with SMTP id d9443c01a7336-221040bdbefmr126914955ad.45.1739772628094;
        Sun, 16 Feb 2025 22:10:28 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d559614dsm64411795ad.256.2025.02.16.22.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 22:10:27 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 17 Feb 2025 14:10:05 +0800
Subject: [PATCH asahi-soc/dt] arm64: dts: apple: t7000: Add missing CPU
 p-state 7 for J96 and J97
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-mini4-cpufreq-v1-1-8974e90dd806@gmail.com>
X-B4-Tracking: v=1; b=H4sIALzSsmcC/x3MOw6EMAwA0asg12tBwmdZroIoosQBFxsgBoSEu
 DsR5StmLhCKTAJddkGkg4XnkKA+GdjJhJGQXTLoQteFVl/8c+AK7bL7SCt611j1K6umVi2kZon
 k+Xx/PRgxE6PMNncbDPf9ABnQ8cJtAAAA
X-Change-ID: 20250217-mini4-cpufreq-fd6c19346518
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Nick Chan <towinchenmi@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1694; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=CrIuLPMpgJln1b65h2U3ovn7OZsssqG71Lr6yC+n20s=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnstLQi0lqAMVlCeQaVyeJCczo/BDvZTB7TtJJL
 U0OzcAix9GJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7LS0AAKCRABygi3psUI
 JK6LD/wLOjw9QUSMfzkPdvScw4BayFO1s3XlFg9mn7p2X3CgI+q65LpwMpolEcUK+tGk5PI80fU
 5qzO3YX2nj5octVIGyiZOGlu4WFugsfVqC625tzy4PjSAG7kriuVdkG6dE583nlIRGvECaTyB3U
 UP1je8BCtMVGA05El+/mAdq5n9ZYpmlJz6to+OeWWq+230qovTrKYnreAYjgV2l5zLqQb8lUH+1
 8ljoCwi54eqgOzY7qvs3xlx34VNIxmxx8SBDOWRbuu4oGEJsxlTP41edIGxL82vgjTnmEFVVMTH
 lBNF5ZDc5DlFle5WaaPbkqEUqSdRS57zv6FB6mexeuWXPVd/Q9eR6/Rf/omxdZCob6lKaIz5agT
 6cQKeu0amy3Mawww1G8mZtiU659aIZHJH3wtpjpi3Ckl3kaM/nktXeIS+z3z6vuAmIacGQzdWvB
 r+NDps/RepRzW/3SCT41riRHDIVWLsAH6C+IfVun4C6fo09ypMAwxSNKnf+MDITvDke/P4RKhrq
 MVIAnUjLsBHZAF5tlK/j1Emomp0Gw/MZUc1Fed5gaaPfey1MGUfK98C4vz7lN8JvsyQa4njF8sq
 7a4UaCWlDytYMXrZ0MSzDC+UsicQXbF3V2GGWtBhT8k8ukWFTHWRblZ0ezOW9E4pZdyU8HXAS/l
 6HsT7FIpygtDj7w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add missing CPU p-state 7 @ 1512 MHz for iPad mini 4.

Fixes: e97323994f4a ("arm64: dts: apple: t7000: Add cpufreq nodes")
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Note, some sources state that Apple TV HD has 1512 MHz A8 too, but that
is incorrect, the maximum frequency on Apple TV HD as configured by iBoot
is 1392 MHz.
---
 arch/arm64/boot/dts/apple/t7000-mini4.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t7000.dtsi       | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7000-mini4.dtsi b/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
index 6da15d15601bcd553d6d0e3fda93df4685b57ee1..cc235c5a0c438f3f07ce5318a75dd928615b7818 100644
--- a/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000-mini4.dtsi
@@ -57,3 +57,7 @@ &framebuffer0 {
 &typhoon_opp06 {
 	status = "okay";
 };
+
+&typhoon_opp07 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t7000.dtsi b/arch/arm64/boot/dts/apple/t7000.dtsi
index d4b479ccfe8c9309b8de6c23f1e90000ad287992..32cac8c30e62d657079dbf32aece8af0fd9cef38 100644
--- a/arch/arm64/boot/dts/apple/t7000.dtsi
+++ b/arch/arm64/boot/dts/apple/t7000.dtsi
@@ -84,6 +84,12 @@ typhoon_opp06: opp06 {
 			clock-latency-ns = <42000>;
 			status = "disabled"; /* Not available on N102 */
 		};
+		typhoon_opp07: opp07 {
+			opp-hz = /bits/ 64 <1512000000>;
+			opp-level = <7>;
+			clock-latency-ns = <49000>;
+			status = "disabled"; /* J96 and J97 only */
+		};
 	};
 
 	soc {

---
base-commit: ca96d759d8d24d90b1726c2cc7c568ff4728bb42
change-id: 20250217-mini4-cpufreq-fd6c19346518

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

