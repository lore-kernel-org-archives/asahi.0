Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD6321FF25
	for <asahi@lists.linux.dev>; Mon,  9 Jun 2025 15:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481207; cv=none; b=ZCRZWEHmVjrrbEp5Uu9zml6Or+CqcU1xBsqIBSzxJcd1fYSIZjoPgyM3QQosdem5qQa+nRCzpdfF1HbQXiIl/mvbE411hFmlczTsmcaJDiTUGgwsy870+2rfp7XPDHr6eX/hIuglpzccIlOhciHYv646V+YHOCzz0qCg++7PXCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481207; c=relaxed/simple;
	bh=eRCFJ8dvOjeUHBlZsV7soqFq1C8e016G7WXxzwjB5sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sWWUz2Ja+HvMZpUOD2V8KoD2QXmBYKGDyA2RimdrLJ6gWt8wqTZEVIJ6CL/85PlSwgkmkiTbGY6tGodg4/uFa8ZQSb10ANXkxVT68TEQtwxMmhEOysaNGB/yhDbL9jDJ8FeCuhYvpPMG0rIpzNv9fNHXuxWuC+PoXLM0p5N6Adk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ctc5qd+d; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ctc5qd+d"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748582445cfso370437b3a.2
        for <asahi@lists.linux.dev>; Mon, 09 Jun 2025 08:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481205; x=1750086005; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6yVhZrBH2XJkvXeJPx485NaUg0f52uoxVNkAfcEPF1w=;
        b=Ctc5qd+dy2+XdO47wayo2jCldNKAv7eSL+A8ceWEsZ+Pc1Qe2Esj4aSZJqz02VfMv2
         6hZraUBFD2uRGeGg/4IUKwyXL/ntLJ57XXDi5iSPCK6DwoSSzrHhadNvhEl37l/7XlWR
         C0Gw3i7TDjmKv04GZmxVRpKSHcf25I3Ufe6/TjbE3vTzk1zP3EQP34KpQcTTZOe+iRlA
         5rtqc0fi6OEY6GKZa6f+JtGOSI+Erzxo4EwNAgECboJPhRZ+2yoonGqsawtEcNMuhvVN
         NHI1dLF5rey9amNCTfom7ogCW6kraIx39FnUfSXP19Wg0rAoJbRicmVkVF0kKUIHK7EL
         nNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481205; x=1750086005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yVhZrBH2XJkvXeJPx485NaUg0f52uoxVNkAfcEPF1w=;
        b=XDDf7QXxpnHvdARRnipnXzRmSAucLU7W4GLy1mgTMFJCc5Dsb+USiePGSExf/DFZlt
         ATG4hLDoiQEqlLnepDYYPD2UmF4mMttvHuy8CfoJ0RFmGST1ZOz8p7ZsWPbNS9Bjranf
         2uyTAx51ebC4VxryMUe5AaPIeVv6mVitDTrtlUBOC/gmogpjy2/5xj1JvesxjOzNJikc
         i9YiGjyIVFXXDGPsl4myHBmjRBfZqNYXwyqndCmUuQNU/Xps0nF0P3Ul22lpq446x0/y
         yUQpmUzWMnVAdKRsRftfOcy3u9GHJVeNR9duwndsKoW+bOKcul5upKvbaXuk7dUQAum0
         VVOA==
X-Gm-Message-State: AOJu0Yz7ccLZsaSXkyqjXeiRbPJiy3GhdyGXGkGoBI2V1Bzu2OlabDTv
	IifMCeZovPD61SbwOQA1K+84mf5ySCDybFaNuLh2Hk8QqrOfCSTc+5Zq
X-Gm-Gg: ASbGncuxspI7sFkqxOK7vsNUOhalIxqQCfycBzQsgCY2v+tyDtJhYqSXS6TGmNlQPQO
	X8H33guX3cnEnKM7Ni5D+MVGV6XzKbpvn4yKW9kfX1koYx0oDKM7nlwECshnraQrEnVwBkdvEL1
	6SWb9oYP6ZGMEAWAOojus5LLGwJdc2qzP0n/E6nDD/XP/GLXkG4L1drbw72zMFRgEdHvv1zmCzw
	QlEEmp3y8MccsXoIpoGYybeGkhzElr+opMHBneA5Bk3RV7oPu7t3RYhGPrP9tLiCnH2VHMLiww8
	hbXzKB1chg8NMztAboZlbbkdys8oPOF1J8FD0k/3UTayeHDSDj5qvUBBoBOxPlOd
X-Google-Smtp-Source: AGHT+IH+dUGtERHb0SkAjeq/UtecPsWqtL6oN8jrr+gftw/s1gpay7JsfqSU5olPdi8j+/+btNGsQg==
X-Received: by 2002:a05:6a21:5006:b0:21f:508b:1a19 with SMTP id adf61e73a8af0-21f508b265bmr6732985637.14.1749481204905;
        Mon, 09 Jun 2025 08:00:04 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7482b0ec4aasm5988402b3a.171.2025.06.09.08.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:00:04 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:59:41 +0800
Subject: [PATCH 2/3] arm64: dts: apple: t8012: Add SPMI node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-t8015-spmi-v1-2-b3c55ad01491@gmail.com>
References: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
In-Reply-To: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=eRCFJ8dvOjeUHBlZsV7soqFq1C8e016G7WXxzwjB5sU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvbsiqjS73g0fmtM9YceCfWNGbT+a21zFkYMs
 dMU+exBZz6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb27AAKCRABygi3psUI
 JPDcEACXAPeKbolXqg03eEru1TW7lWCQ6RPi4XUsGtQP3Qlrwq6TIxfHsjD/eNXSi85/dJM6UpE
 Ie7BDF8L4S6bVfsaZh8WLlGXe8/VpGEo0DK0aCdKUhg3yVYv5A+orpxheFgIEWS2cKs+/x4z4TR
 FSRtT1ovLmxeAoF6JJLPRnoUr6l7LTSHrkPQao9YztEv+yQ6ZoHwtamzhplHEVuFLvWMKiblQbx
 wLlDxQjEtcULk1pSUkfDIVaKWPmfoITGopUgumPwmEdZIO+5gNsuV1sKduLfjrs7wYGTePf1Ypo
 uyNu2ry41rRo10qw1rCAMoolpgbrYYXOAOnXEY3faGiHRy1/3WLv9WP1ZHV9uPmtmb85hPKN5DE
 hltsq9fErN+D7+nVrfXZst8JbNXfHkVTR78a5WP6wshssfqiorSS7tnkgKcoVSbsCtm7hpilhm2
 i7iLNLo2U+5IZX8K03KTf6NuACNl7ydxvBtZdgqOdyIA1UOn0Y5lm6bR5LZhPv9Pca5FPlw3yCF
 dDh58y1ejDI0tSzTE3weRFPT5CyjtQLbwV45+DoP7FNCOn6wLoNOk+PK3tM+pSTv300hdW7aMI6
 iv/PmhpmgtzkEZbwRE+X6DS1vffslZF5Qih3tdT2eeQ4yEDI9EDg6XnBex6jRJOy7T0E2fmzAmG
 5dJwu+lkn8Agqdg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add SPMI node for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index a259e5735d938cfa5b29cee6c754c7a3c0aaae08..60e73a0401a80abd03f82d24845dfc12d8770ebf 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/apple-aic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
 #include <dt-bindings/pinctrl/apple.h>
 
 / {
@@ -220,6 +221,13 @@ pinctrl_aop: pinctrl@2100f0000 {
 				     <AIC_IRQ 137 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		spmi: spmi@211180700 {
+			compatible = "apple,t8012-spmi", "apple,spmi";
+			reg = <0x2 0x11180700 0x0 0x100>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+		};
+
 		pinctrl_nub: pinctrl@2111f0000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x111f0000 0x0 0x1000>;

-- 
2.49.0

