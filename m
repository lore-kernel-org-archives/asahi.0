Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21021ADC78
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740717172; cv=none; b=Kuh3aB7OiU1Fc1AoTMIFk09svY1m7qmgfHjKVj1MbgyZtqXWUkYm1p26VJ0ECNTzOeMMX+jy3zUs6bKSK/ntobqkjSUWO0hscVDZjZ0G6uo77TOjcOMueooYzaoPqKW8L4z5RD1qfkeW9/542i88ChaGq1sUwl344Jdhpl5mXoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740717172; c=relaxed/simple;
	bh=qZhdXikI6UVY1zdlQzyoBJcvZeFaA39QMPy5jc+lJ4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcS03Bm6BAg37hvV7alCBEOdCoKXJmKzSR7/EtzF0plG8/OCQLh0tUZCrYDI7nFfgOoJcoRNiPrG2DDUxTb4gWo+aVvHvTMcOFQddeeXSbUdGme30ixtNOOFZzGLqmq1vnZ8nrqcytHvNHKb72gqdG8CA+xMfzhLhJl9qPBfsUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W27vyp95; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W27vyp95"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-220c8f38febso32942355ad.2
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740717170; x=1741321970; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mY1ZEHmtwa1GitLrlmJuselIoFJmZMHZa/Euu9FfPU0=;
        b=W27vyp95X0Sbq+LPMgWGDn/6NqWjciNcAZyHyLABc5iRvffF//yahMTajKl+AOPZZo
         I01kT/uYgT7Om96Z/ruBzpoGaJaglR4xEZRkCmYAgI0kGBpFPqZkikdf0Rd0xuSaLVMU
         k9tHfDPGjeploWJonFQH8ukXx0oK6GzdDQa3kacie2jZJur7bxdWR6fjVIkF88DAz9I+
         fW+8kfoTfWhZL+vOcu1tKG7ZSBmRCYmAt+A04lE0WrV+eve87DFzxF3VUQKfiDCM0Mmq
         f+fhmVpMQvUtIuMtiMB5ZFN5yyunVVl6AzmoyZpi0LuUvSR76LrVAUq06ervE+bMMvIz
         4P5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740717170; x=1741321970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY1ZEHmtwa1GitLrlmJuselIoFJmZMHZa/Euu9FfPU0=;
        b=l+60j7Vba/WdwwgyyAvfAPDLQp0cnxVJZeNEYlpmf193kTKe26Tu06CZRRaiAAAMW3
         USHpxF5JR8uhdXDC17G8SL+bTzGLvWz5/EsY0nk5vSVMaZ0uYubV3PYMA0K/yFh0StOE
         XxW+6aCJOWdbL8nMjHoH2X9yA332vlWtUfkoiKqFf0BKNiTp3Slpv+6qzJ4qvp3DYjyL
         hFUJ3obCDIxtVQjbW4JlgDf/wOvq2wfHnr69xQ+jLvvHvO4m4OUlegQbpUWY96rNt6ll
         SGcMQSc2xNC6GVA7U64E8xsngWxZ77vfRb7m+gCw08CnsfbWstcJvJDt+mK5M14TvEJH
         7uJQ==
X-Gm-Message-State: AOJu0YwB2/GnaHfu4QzJLk34h1R556bcSkU98qc7f7nJk7AqmC6DeYwT
	cfxLe8Ja0HvFHWN5VshvLm3jfjZfcBF4t2gMM03tB4pxTUOkDvHc
X-Gm-Gg: ASbGncu/nBizAZOapfD4rGqZJb2c52/nWHUBBRgaDb9NLw4Tm2uOM2fOI+88HdqNiHi
	jn9nz3qPBqHo//KOXgExIGpdZpE3SW3h0Df5PRfUtA4kJmOvm3w3lRMxXYOABWHAYVZhjL1/LQj
	yMh0wN1Iv9g24SObS6P38nsDApozTMOAS0gGKagDWMvzT8BEAp7TV7anK4tkMlR1WsLzbDcyydo
	vesRcU01t9oD/zz7qse0uMFnu5QP4mz3JxPGCiLETU/0Xx+Xkxd16VOovaSaIVHTTR6CzhgpNzL
	yPI+jmwoTi6VTucWmlU3X/qQ9J+4
X-Google-Smtp-Source: AGHT+IEd45BbRxuJcc/ODzZoJKKfv+EegnhVjoVMaQy8U6rbvnXBM+bXYqV4j3BtClJXhPFYagq+JA==
X-Received: by 2002:a05:6a20:7283:b0:1ee:e16a:cfa8 with SMTP id adf61e73a8af0-1f2f4e01863mr2897050637.34.1740717169879;
        Thu, 27 Feb 2025 20:32:49 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dcafsm2738204b3a.132.2025.02.27.20.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:32:49 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Fri, 28 Feb 2025 12:32:16 +0800
Subject: [PATCH RESEND v2 5/5] arm64: dts: apple: t8015: Add backlight
 nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dwi-dt-v2-5-69e450bc4bfb@gmail.com>
References: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
In-Reply-To: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=qZhdXikI6UVY1zdlQzyoBJcvZeFaA39QMPy5jc+lJ4E=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTxhj6M3NanBr5AvddymnbZR2d8cHPaGW4NzK
 2jryU6pj5GJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E8YQAKCRABygi3psUI
 JKWhD/9Kye4j0aRu2dTcTj19vBKZO44Ncolu40yJZDoGyjZ61paCAKdGVjuTcWY9c7tit399/J/
 A2uRCQNQFddsl6uIBMMMHvkZd1ldws1boplm2P90ltqOkQ9IsQVcUqia/WlcR3Tx2GG2IOI6ee+
 ypekvAXxcSeKhAvjl4Ds410iPec+ueF9PWWP3eFDHojA7ge+DH4ummzhnrtVscaECWM3zpd5/AD
 2lb4/jDhCWWZuWfdeUhTdl46zakdZIiFImP5OOHHbvpFUf+RPhcrV91g3BI7CVhL12TEZtmBNzW
 5T+0buNt166NeM90BHShWxPKH7fofypOIQFjrXydSF9XKchP27u8TClv3gBRS7cyUcmd18CbFm0
 SM2Y+pbIv3aNU5uf+B1ctiARPi4Gv0oAXhj8Agg+D3hMEb7fG5gfFHNoHJSqChlbEXqsr3GgKhm
 JLlA41rfnGvnZYt/SbXF5Qo57Jul7m7ikBXE7d6LYuzQuM4a5BJ3ZZDBiHOfDrprrQPKsTO914A
 hLEWFZ4wzSvzFatsslxPy999apbmmWTjmHtBNyqDphTDeL2eK9Vl7AN3zPuNpbmZrjbzisQzKze
 uUywQTswPe+5TkBYL0T+gWSnNDbFnGiyCp5iSnhoXlohNdDvl0KhN6RlxrjaZgX7MyyaR1pxQ9O
 5QOv4NskCVgf18Q==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add DWI backlight controller nodes for Apple A11 SoC, and enable it for:

- iPhone 8
- iPhone 8 Plus

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015-8.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t8015.dtsi   | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015-8.dtsi b/arch/arm64/boot/dts/apple/t8015-8.dtsi
index b6505b5185bdd728a7416efaa3dd53d1c6a5fab9..0300ee1a2ffb7d2bd0558f6cb6f86514f4b433a4 100644
--- a/arch/arm64/boot/dts/apple/t8015-8.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015-8.dtsi
@@ -11,3 +11,7 @@
 / {
 	chassis-type = "handset";
 };
+
+&dwi_bl {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index b68647bebd20782ba7a125e670b3264c184b62cd..4d54afcecd50b50ed1fd386ccfc46c373e190e6b 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -262,6 +262,13 @@ pmgr: power-management@232000000 {
 			reg = <0x2 0x32000000 0 0x8c000>;
 		};
 
+		dwi_bl: backlight@232200080 {
+			compatible = "apple,t8015-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x32200080 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl_ap: pinctrl@233100000 {
 			compatible = "apple,t8015-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x33100000 0x0 0x1000>;

-- 
2.48.1

