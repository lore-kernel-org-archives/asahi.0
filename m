Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA953E073D
	for <asahi@lists.linux.dev>; Tue, 14 Jul 2026 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010546; cv=none; b=jVSUheOLDEL4k8YnN2Nu1U9OXHWYGCW7JM2slul0wFvDunto0xGTtJ/BLM3F18oO1cUFncseisvpd75l5nBCxS//o9FKiqRFB1nYAmBcjWXs+J9R9wISpBovgkUQreHnWzGVSZjbmUPW4V2Gx/Xzxs3Ptd9zZtDKfAuCgCMa2UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010546; c=relaxed/simple;
	bh=8/vnYgv/XYpka/uGiQL2oD+pLTdDywIPDenEMn+m6Q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FNZ9Rn1KAlQ/AnW1iI1Gq3tmh+EkphuOPDFcQHVW5bdM7EWHESC3bj/9b0GJVSJoMVud051IpiLfU4wShEEbLz88wbW8PDPj00SWPaNELEVng+NI8umEYaUL7YJLaAXYm3I47ZLZ8ziTi9kN7+YoH8+ixGP8wItcSvZSwyMxNFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qF6Tddo4; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qF6Tddo4"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so63653415ad.2
        for <asahi@lists.linux.dev>; Mon, 13 Jul 2026 23:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010544; x=1784615344; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9FXdmldrkOS3aJiP/5Cuq221SYGa3bLdMeazyZQfaZI=;
        b=qF6Tddo4hIsbXYWlcpSJadMHjNkVi7mWXH/ZrT2GEeDSB6TODeIHXVw1iBnYKeEiC4
         hebxA/O5iXiUJjRqnzBMDR049/gk4ejdDzerbQ0dDhVsLILfnqTpjwcKQf/HqjpsHUZ4
         CeCEVIV8anBRGdy60R/8Ma2ha3bdfEeYhfiM8+eAu+0wnRT/t75meboxaC+ouUIu8hNb
         q6u4dHm2zaqJNoJRIo1YkxHZ+LBZAPcZriuFDdVet0a0LrCqkwXqh15YYM8nacyRkwkh
         +1XT6I6ESk8ZPM5dnIpo4v/aduvtro9b405UltfOnWb19mCqWHkQmgnwXXTrXIu9kyzY
         NY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010544; x=1784615344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FXdmldrkOS3aJiP/5Cuq221SYGa3bLdMeazyZQfaZI=;
        b=Hp/7nb5bfEfoWtEDDdEUus/tPyBpbZJnPSPzrsACNgtBXP+/KYdkQz2N1+M5wJ73ck
         u0tUerhEFfy3cf84Q3wfxmZ4xN462os+KRrzCSE3+LRX77aTltRM4cP/QcI8g00/a+U8
         BzAH1GDCwhzzojLithL19PS2IJ+PQwobfqXenS2Y6urpIwptvR/9QBl4aaYCRvlxh1hO
         lJHdpzam65/BGS2xArreI3Mu/0zNschZBkZo6Sw8KzOmLTT5k6XUX42fYXRuTnmXNS7N
         c6l0K3mNHdVBZ2V26mcJY4o3kMh9hwEEokPLZEOeMz2dR2Jp8539/0sZkNUigGi3XjcA
         jfGg==
X-Gm-Message-State: AOJu0YwEfhayhljpJ88WEsbhAV2E7o6gDYQ8joSzRovYSjlS70SCehST
	j9LFYl0zg8LHeqOmGHwZxkSptcG+ceka0WYZFp4rP+r3fD0BQZ0OZk/Z
X-Gm-Gg: AfdE7ckZoAafaF5JM47TJTZk3RDiRGMMpvSsnpuSygF7qXKiA2r1Q8HeNwj0C4u94q4
	dTRbBAAXq3rkW7jdfwcoJ2BB8sWQVQTMD4qgK5kh/Gu6I16h850/Z3m5s+Md9cz66Xq+9wILIlz
	txsFU9GQX61bAY3zAj5Wq7pCQldP+fDg43f9kWwBRnhcbwCzIUJ7R9NHbw1OVX8uE4OGzJWOK1l
	CmsSwyXI1QxUTl6ocoIHIemipNZ6QYPlqpo+b28CZbMXLORGM1TkiG0Q5Q9qi640VcJaS9lvyl/
	V7hlWFF/LYec2NbRU7C8PRyWBL2JBUchGGqmyvLTgyancWJp90a6qGDRbkmJd87+ICySnBCDorU
	hCFXfc9qLstTySmkFnzVN6Nez7KqivGN92s7n/pYsSQ0ftIWQN702y3DIvNy9LVXdUBZlHcS6K5
	7+TkMEGIiN/djkN9R2loIkSosK2eVZjE41h9HT9k7UeUfT4EV5q9OP2p1DiC5afPmE7BDj02Wdr
	Y6tY5uVhQXrrq19vbPRIgmPIdpTHWh2nTVZac+GtobqEnoEc/ryAgeolI+oIT5t/yILD2uPsk0=
X-Received: by 2002:a17:903:2287:b0:2c9:fbde:ab66 with SMTP id d9443c01a7336-2cef147707cmr10986445ad.37.1784010544425;
        Mon, 13 Jul 2026 23:29:04 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:29:04 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:17 +1000
Subject: [PATCH v2 10/12] arm64: dts: apple: t8103: jxxx: Add
 device-specific SMC hwmon sensors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-10-13fa78873121@gmail.com>
References: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
In-Reply-To: <20260714-smc-subdev-dt-v2-0-13fa78873121@gmail.com>
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
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xl7zHTaZSaZSWk1LzK5M9+9gUtqhoXtnysHTQ5ur
 7ew+FXQMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOqtLgz/dM/OEVGzm6gcofrprBqvrVaN02PfjgS5pY0XxErE1y8KYvhfwbJ9f7X
 GNjOjyOLULWcflAkK/bfJmiTM8Wnr069i5UYsAA==
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

