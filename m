Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487C01FF1B3
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740066716; cv=none; b=Pli/ffRhSKh+QLdbrn/HiX7f/m33s2jvaJJB5jJCACVI6PX7GO2GXVnMI9oVcP7v0IuFptNx3mZnsI6Y6jymx4RFl50IcaCZvVvjQ7LH5DaGlTnxESRC4eio2nu92KzIxLlEYB+9j8SisJratz63q1e8FS5UzaqG90nm0ZBOlnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740066716; c=relaxed/simple;
	bh=fG5z+I6G4IAhE7dnPnquPSBWf8fdQscLoMVg36c2Odg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JU14Ts4Ob+IryToMs8/WEYxSclxMK/FLSyintl65YFZfqr90fOES2pKf3qdCsfIxsNG91UhZitSzppzfWwtCeXUpElPW8wDKrt0KCKiPjYLCsxBLbRt2hVFHV00tq3DQq3rQ7c3zeiBiMy3DPW6my+vODW36PXVVlZ2B1xG9hZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XQ9hj7r1; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XQ9hj7r1"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220c8eb195aso23001755ad.0
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 07:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740066714; x=1740671514; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0YU2/erqWDrMnbDnClvO8uF+WZwecalDqDcoo48HoQ=;
        b=XQ9hj7r1BjpqodsHPYRJ6X35rbvluTqEYV4WDwj7lACz7t2F2Oq0KS+nGLbcmHIITv
         6SZOmNvPQcyYMsOecBhEpwxZeasDuHt3vZc4vGIHo3Oqa/BbHSZrffROHSywbUSRpDGl
         FBKk4FOGsfkUZv0aFYUQJRcPkrc9RN8JYIB8RC0BIrNnABXn/W0CnrqPbyq2bWnFSWfD
         nTvMvw9XU1k3Kn/fjxhB3F6d6cvG70MbjQkg57d6xYWNPl3YdBJScQpn8CgfecOu5d7q
         3Dnb0ogVArY7TbIMEhDicGo4Ykt0QlbUoVsYKko9jERY+EzDr9TgyZ3TAdNPFkTBJQen
         mIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740066714; x=1740671514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s0YU2/erqWDrMnbDnClvO8uF+WZwecalDqDcoo48HoQ=;
        b=rZvO+yo7sC/NGQ+HeLmP7BSCJJOfhMkHVgdL2d96eBBL+AgPwXWAFLzxHEXfAcriC0
         PkZBLRpkF2BMqTAMJKsEXAjUEjSmirfz91wtiKEzlClI1phJOALZyoMn/p0yscrGwcXG
         3zZNliJMCMQnpC5fs9OZsJLOD5ZODY4wgPDIuUzzCICkpdlIoEw3ggSviMtLyeduJPM7
         xgtng5dfOnSoGJuUCyJXEGFJiRsTzgZ5ftGbjF5iO0holYy7kxkAma0JiDPZYmKzlSoP
         WvHv/r9faUbYdx8aJSitr23Aer6IkoOXzPDUAC/bz6QR1QXZAXiUBa9wb7/ntE3Y+e4T
         bqPw==
X-Gm-Message-State: AOJu0YyAeXK5fhTtsRMyM+CNG9vWb98DAkIMrsJ35ABEwL/5O7iSgUNq
	xPfQKn3Se2nu7PmRijvk23fDJ+XF4mZXPIIDGheMFfn1CnDBHJaIHKaXtg==
X-Gm-Gg: ASbGnctJy3jSKMDtMJ9U7xW/PPSj8jnrUQIDjlNhuqZZAlu7OF8EO4batuWhMOsB+6a
	S08rszgL6xpMM6iCON7RDOHY1Wa7cqcSP+U3/DkkbXpg/aVk5sEvyVJiCU+axxzk7jQSJwIa4wY
	glZty8mRPHOqkg9866v9fpwWKt81gxLJp+EwZ++ZYErsyK1xnRkMM+nA3V3+KrJOMFg3vKo3rjE
	uWCT/uoNmz0MPkugXDKIbxjz2IXXH20axXRzIPusFsnv444ZkG8ISMyMZrEvcxP7StmJKLKiYWT
	IVFxxXhcICkU1eKg8Q==
X-Google-Smtp-Source: AGHT+IE8RED21Bp6xhI9HWjc7ruzxzx5fVu7CJktOQA+Nvq9/CXCB0o39pnbOtdMG0YPDQ7Bt5pSMA==
X-Received: by 2002:a17:902:e746:b0:216:69ca:770b with SMTP id d9443c01a7336-221707775a6mr131233215ad.12.1740066714503;
        Thu, 20 Feb 2025 07:51:54 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-220d5349019sm123694345ad.36.2025.02.20.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:51:54 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 23:51:06 +0800
Subject: [PATCH 4/5] arm64: dts: apple: t8010: Add backlight nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dwi-dt-v1-4-d742431c7373@gmail.com>
References: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
In-Reply-To: <20250220-dwi-dt-v1-0-d742431c7373@gmail.com>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1505; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=fG5z+I6G4IAhE7dnPnquPSBWf8fdQscLoMVg36c2Odg=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnt0+M8LE8bsWThAPeUR40vROINMJjWs37phpAQ
 3m62h1TqryJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7dPjAAKCRABygi3psUI
 JDb4EACoI0y7cteXJJ99qb6oFbOEw39+ZyQLxLjbcKIiBueVvQZo5pYL0TASPWLu/6t3+YmLFiE
 Grrnko+nnMva6uLuS+qfSsOUMKBNkcleZm7/TE3uUXddo8jM6WNqYzuo7wCUJJCOeNKQECt9mUa
 2SQ1/2GFkLPOGKZpw6gADOVSIPQub3gFo79123XTK3/8My3UAx3lZ037gcesBkePNE5yw87k8e2
 8o/k9ldBIGd7ab8o4+9QlnPO3KY4arfOU/d11dlFFoQCXjotqb9mIoV+jqyFfWXY+tcrIpZ1EmV
 JDc03nkvM+FhcRF+VR+eYd4U/EvD+qUiR6mEq1cez0PtEgM4o+q7w0k8JAcmwsilgW6LhoXRy5R
 OR8Fp3YAnYUKlPEiQ1P8QLiyKPj3DAFHAqQ85AJFQih7FLBp1WAgeGM2Q0UsmcVbFHsoCyOFEq2
 bBtYDj3MaRgGpyOC894pZjBYQJQ5gpdv3bIDNKmKLA3wLSz3N/g9tNBPTyLUSSygl1Qb3NyXvag
 Qcg6WaGsjOcUj97xTGhazI8EaEb2T7yJtjU5qL3kRq0u9AL9FWmgQCfszZyfpG7zinSec0mgSpp
 tH7IRdzYLSrU66PLmRfHGzLolNzqBfiWk8eyxLDJZYQ0Em3Tpd7PXSvoBDtvbIGmvl7WyDp10XM
 gFFtK7WMiVNFpzA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add DWI backlight controller nodes for Apple A10 SoC, and enable it for:

- iPhone 7
- iPhone 7 Plus
- iPad touch 7
- iPad 6
- iPad 7

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010-common.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/t8010.dtsi        | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010-common.dtsi b/arch/arm64/boot/dts/apple/t8010-common.dtsi
index 6613fb57c92fffd41c34a61a78e7bb6b1888a5ea..44dc968638b13814baf94e782f2267191ce267f9 100644
--- a/arch/arm64/boot/dts/apple/t8010-common.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010-common.dtsi
@@ -43,6 +43,10 @@ reserved-memory {
 	};
 };
 
+&dwi_bl {
+	status = "okay";
+};
+
 &serial0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b355d443ee476e7c98b352470e3b1b5d0fae7652..17e294bd7c44c7961cc3ba0ec5f4178840d5b9c6 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -167,6 +167,13 @@ aic: interrupt-controller@20e100000 {
 			power-domains = <&ps_aic>;
 		};
 
+		dwi_bl: backlight@20e200080 {
+			compatible = "apple,t8010-dwi-bl", "apple,dwi-bl";
+			reg = <0x2 0x0e200080 0x0 0x8>;
+			power-domains = <&ps_dwi>;
+			status = "disabled";
+		};
+
 		pinctrl_ap: pinctrl@20f100000 {
 			compatible = "apple,t8010-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x0f100000 0x0 0x100000>;

-- 
2.48.1

