Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F084F39D6FA
	for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 09:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849461; cv=none; b=K8g/K5S5D4ArVg8NQ/gghKnFNoNUxI62Bhgbvh9K3ZUUyDAd+d9OREXs5ynTbz0UEeD//glAnyvtQCb6YnPgUOgddVgHIQuHIhiBEm+o5Hqv5qAkqoS+inelbHBsxoZrxRsFelot+gdRmHxgcC4yAYKnnPxI2F1oqaobxeg2hvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849461; c=relaxed/simple;
	bh=QNw0DCiBD4kwG/HsRck40hRwum9n25JWMD4YFMUja84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RX0RXbm0dQ3q0rQnuxuZe4gS96rT6yHZkuI0PfV1M6usvYDzGdOd/SsQxyTp4Y0x44avj3eE+BnFn/HDuK8c6hwDzGqc2Qt1f6yY44wNNiXUBk4fesghW0kGQHyQT1F4qFMJJdk3XGpVs4JbWna5gcjJR4CO5l6svkga5dznrjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/0r+EB+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/0r+EB+"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc6dd436c6so26340685ad.2
        for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 02:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849459; x=1784454259; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWz2OfijInLdOPGknBP5J1OrsIKrh2Wgu00STcMnuow=;
        b=Z/0r+EB+lL898DdWDZHNs3p+jdK7G26aLyNVtS7V5Wf2JgXRxFkzTlwHOa3PwPs5JR
         J53t+lQTeR+KAf20smSHlrj51TKzpJ7qckGdTmnTUozEX72CphKFPi20MfnozDPLF1zN
         Ycm7DDDO3+P2w+1rl5oOlNm3fUFNQzCAGRACJJmS/jIkrXG1FsS2Idh+kAbiAAqwWmPy
         z9x3rPftOjVC6afjEJE+gDBjSoCe7DYnIwBHkULu4NeVdT/j2A4+VopvkbcgBmlSRST+
         /8oENtLSoLzAVEjCzY2h+75JQI1B4cIEfdYWHTxvpQLqMdRcVgJRZ20OTq/miI3KhIJE
         KhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849459; x=1784454259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWz2OfijInLdOPGknBP5J1OrsIKrh2Wgu00STcMnuow=;
        b=oG6EU/tru1YIUQXqAqbP+Lco38q7tzPyOLkf/bU04t+cQUsLEqg/XqgT1CIxOF7KUy
         jytmSqC2YIhT9ZSoMlyKcOxiLUe6cM8bJtrl+MBcHJ5LFU6IXVYn08M21r2pridQdRjN
         9c57NXGCSp+/SI2+82hE+vATD1bp0SbwpqI543xmXp/+drKnjPNfqNFCBmOVpjUuVrrh
         GLZdotr7oRwrclvFVU1LVR26nFKg2h5Ox57Q8WQ+/Cf4eL8AK1CzF24IFvBHawkNDuuB
         QQfzkgRdlaj7/UYlJoDN9xCj+K4uJUA1cA3XcFl0ZUnjWzgV4qdMS8l8c13mwnrzjE7I
         Gvjg==
X-Gm-Message-State: AOJu0Yx53f0E2NQ42DWcZZpHzvbrqBD2IssEldcgY1SOmy7d6kb/bUOO
	XK2fAFRNVTJHNg4YTgV0zl0CXWyBDzgQCeGx1VxyWPcifT565Yr7DDAk
X-Gm-Gg: AfdE7cnAobVYxFRaFz5O89O1awHHR+B0bjUw30EP3OhkEdeGNuliZnwo6WrqjWSIX5/
	qr2Me4RROR3JiK8giqfhTaqI3R5lxrGKCEDw1zOpl2c89uln3PnY47rx73TGKvrvkCDJ6JdDKCR
	RqeXhIv664BdlQCGq7PS3rkHXPijjLgTNc1RPpag836iMiY5C91Srkf9o71kpusq45XYnU8hsjX
	qIpZMUaVQiFN6f9UHlPxKz5eqsejpO0aV6OR0gvsgvO99S0fqROEK2hzayNsPNTKa1U7hARqEpF
	J/mIqgr/MvwbJtV34vgdAHhsv1sjrBg5nvC1pA+scq451uubDC0qMrLbR8MXBp2z327IxQMB0s+
	uKCPXSg3r3z4mkBC9n+fJWauWZc342GJwrPO/yf/jYO1trwV6P0QSSjS6c4sdCvOARal2SqriWz
	20p2yR3tb1xJDLXpJ1m1IjNEP9NnRBc89Txk8cdwwKZ2K0sjG3k3k+zJFqVgg2gAaAh5ayy+FcS
	qwovH6D/E8n3gr82fSXmVRL6Q2g7SM1VyEEedUxqrPksIaBUjVXMzWIVr/+tda1Vopg1KlVhAg=
X-Received: by 2002:a05:6300:4046:b0:3c0:eeb7:28b with SMTP id adf61e73a8af0-3c1102d7fc8mr5637252637.8.1783849459284;
        Sun, 12 Jul 2026 02:44:19 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:18 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:21 +1000
Subject: [PATCH 02/12] arm64: dts: apple: t8103: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-2-7763006d57c7@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=664;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=QNw0DCiBD4kwG/HsRck40hRwum9n25JWMD4YFMUja84=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU+kpm/iPhJ+TmVfwJXVy5fLFx3RnMWRwxWgKxxtc
 0tvkkN2x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKr/JjIytNxpWqy9rNHopoX1aanA3mATTo7UFVsvzjHr85LZaajxmZHhSGxx4SO
 1Y+5c/x41SRku75+8X223JFPvnbwmw72/TlrzAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index da774096b667..4d6a0411f086 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -918,6 +918,10 @@ smc_reboot: reboot {
 					"boot_error_count", "panic_count";
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			rtc {
 				compatible = "apple,smc-rtc";
 				nvmem-cells = <&rtc_offset>;

-- 
2.55.0

