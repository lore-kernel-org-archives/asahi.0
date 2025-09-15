Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF870224891
	for <asahi@lists.linux.dev>; Mon, 15 Sep 2025 01:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757901180; cv=none; b=FbndRnmRiShSErfyHeKLiPt9X77JF1dXnTG6/iRYt53qp8eRDqHx3j0A8t50wjiatj8Pm5PDPSsnpiaDCqjGYOyRXqCOxs3ufHxHCYz3zH/7wHvbA6pLrxYJW0XPKrU3HrESZuQC3euhFmKdqjn3OK8BjgrnYdEaSeKyntTUoG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757901180; c=relaxed/simple;
	bh=SoJ2s/7xaJZqpkZFG/E32MO93SiVWiC2LB23uiW2KAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RvIinVS3GbbSRZVHvrMe2+J/CuOzyNysd4rXtGbyLvD0s9SsBehhlmjKrmMjQb/Ak9zk1PYaBp0XcgFnS1DIw590QYYPA8LwruItzcsI8gRjNPwLvhu9zWIRaOYnH09AQjbXcYtQlOs7WSitKxCJayAqaYmajpXaHzf5FyvISUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzzFFQIV; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzzFFQIV"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b523af71683so3059496a12.3
        for <asahi@lists.linux.dev>; Sun, 14 Sep 2025 18:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757901178; x=1758505978; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5H5+bfFpWI0JlLzmp/SN5iCuvqCago9oAPrj5EA3s9w=;
        b=BzzFFQIV+KH2J4bJasgPYvInU8O0+QzL17dnICsaVKaeRdU8aqW3BAyDDQz3xeriiF
         TIoqUJDXTxZlYl7+cRS81Sx8x60uUxJgs+/9qACp9qjHPPiLgTLcBpufDcElf0p1rNlH
         QMgZJzf1xFzX5Nxdmm29rdIBuQiW3ifwgNZx3f9Pf9c4wtuZB+wNnEUP6AtNtZqEY3h7
         wKkIwxvFLhWkfzFyQUg8DZBk68IV7MQmsaDAZTlEMejNCV8PUZTJCVEOgky768UoIzlQ
         jhKj9QZIj9lJrNpKKjOUQY36XcP1fTibumemMeHLqrfJ0gIpa4BsPMCwY5GNIBeChX5Z
         YrXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757901178; x=1758505978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5H5+bfFpWI0JlLzmp/SN5iCuvqCago9oAPrj5EA3s9w=;
        b=P0woLypuYCcE326n2T3b6HDy2J55nGeZ//p0jQH+EsKupR5CWBKERD3GEqHjJpzkT/
         HeHkjEBym6UMoYx10kHsSoCObwgSgTt0FFdw46IbWMA/m3TZS8qCBd47EvybQ5+Z7pKZ
         iTIfbOAzOTamGQ0i/9+U0qRsXvyLKWhkncEHMmKcq0mxMVyEo5MVYkdFP4AKnHcqWKdK
         yKtzHB/qcHBJO2l0qxBl+7bY8iXB1TKrORiz7XHSKT3ne9d/rIA1PvNPESrxEvIqLCse
         4ovryRz8jftZdPZdbUkNOV0Eutv1t1AhOZwR2HJXZhspDVtWciCnwlz/hpF1KXN7LY5A
         QsLA==
X-Gm-Message-State: AOJu0YzUEZ6Hj1M9ecA6ehjwKiYnh/Irr3FTQk0ckXEz9WqjflGAjK/V
	l3Ew6659UxJ9je+jT1f56VabaOXADGbJYY5HGJHGhb9wgsxKDxHsnzBs
X-Gm-Gg: ASbGncslozUjdWGUj9jRpsybS1kqhvPQF0Stjiw1gxx3yFuepmziD/AL5QTmf85OaVD
	R9P/0jE0UvZKqKD5tqkjpbrRp7IBTc+3cjTM60kGLpPC2pcpIaGQ3EFrZiv5BanOQWO6U4/OYN5
	tG3/ytUGa3cPeNO0l+WTrMclt1SIqWlDiF14Pr/HhwcEwE3UsszNw9/DxsKz2CGlComp9+28E9N
	bplxAkle3ATsJJ3mzXhteecf6PdyWn7oA7Hg6VDG2Ybr3FUIEpw3apaVHvB5U6oWuR99SZamDmf
	n1XZtwfKEICIqzkwQXKKDJTi12vy+MaKwl3dgx9tAuo6rZCzMnr5pE9IvgSD+7xCpYOmOEofMGX
	dp7YX8jnjNVUW19tJ4FcRlpb5grE7pQce6fc=
X-Google-Smtp-Source: AGHT+IHMm6zQWGhC4CRJdwqcwAn6ExfzlmynisceaUa39WHIvw//bJ//An8p3b+Oihj72okwQgAGDg==
X-Received: by 2002:a17:903:2b0d:b0:267:95ad:8cc7 with SMTP id d9443c01a7336-26795ad8ec0mr6064675ad.54.1757901178029;
        Sun, 14 Sep 2025 18:52:58 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-262df893ec5sm41565255ad.46.2025.09.14.18.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 18:52:57 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 15 Sep 2025 09:52:25 +0800
Subject: [PATCH v4 2/3] arm64: dts: apple: t8012: Add SPMI node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-t8015-spmi-v4-2-758620b5f2ae@gmail.com>
References: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
In-Reply-To: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=SoJ2s/7xaJZqpkZFG/E32MO93SiVWiC2LB23uiW2KAI=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBox3FxeqmBzqAGD0XoST/Z92rIDU/5LkiQ3p/3r
 NRJnPkuJ6+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaMdxcQAKCRABygi3psUI
 JFfQEACShZQC6WLqLE/aDkYMN3XdssIhvINVp+gaUZw3BZ2/6GDq6jyuhu8I6j6HpOthCOP9PXf
 lQPdknQu8U7P5vGITb510PzdyI5GWk2tbjECEFM2GCrHvua2OCaPvKU8iTDapw4oG7QvT3mrda0
 kHmnObP36QBiuawsVeuw9y/7fm7cz3vPVI1FiSOFdyQC7+yBpWurCfYYNd0/vaK0nQOeiKtiKy9
 Rhg9nG67+GSijrBI3Rciv8VSo5Gcd8txQyJ+xYiA35aadAukvnNgtrk88YaThNPq5rRokB9DBuQ
 6Q1hszoSx9I29qdqBn9p0APfkumQ8PuLxVtDGBox1B6yDL9pH3iQg3IHFxWAimt7LU4QC/TZBrG
 Pjbsh7PBXLqUMLHb6KtjFEBe/U26LpKKv6v13cZeF91cKWJczxVrTwfYb0TkILbH/z3fMGFvow5
 a5rAvPuRoDL/sPa/SBnTnrWOdC2m5YgwaWR1bNc9cHCcirB+G9x9kB1kaBBTVY93dwpCGLqPpJE
 FJL1IBL9PMnQLCY0b9+QD/urD9nMlZT4z7bZdT9cynrka3jO0AhveaLQftQ7s+Ls2THKiN/ZiyU
 26L0cky6XnlQ42ZRnyi+Yj2EsQJTTJIiM2lfd4O0Ixs12EFrLSNT9C+zCAWZwroItStwD4ZZyIo
 G6LJq9iuN4EqQ8w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add SPMI node for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index a259e5735d938cfa5b29cee6c754c7a3c0aaae08..e7923814169bd4060706945561910ed1d5c2e0c8 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pinctrl/apple.h>
+#include <dt-bindings/spmi/spmi.h>
 
 / {
 	interrupt-parent = <&aic>;
@@ -220,6 +221,13 @@ pinctrl_aop: pinctrl@2100f0000 {
 				     <AIC_IRQ 137 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@211180700 {
+			compatible = "apple,t8012-spmi", "apple,t8103-spmi";
+			reg = <0x2 0x11180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2111f0000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x111f0000 0x0 0x1000>;

-- 
2.51.0

