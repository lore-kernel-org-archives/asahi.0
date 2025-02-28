Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 107591AB52D
	for <asahi@lists.linux.dev>; Fri, 28 Feb 2025 04:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740717158; cv=none; b=XWrPPpz/pS8sxXJ71Pia6Sp12cQOCJM7BLkfxWzGOlzDbBipTWMh+AHM8BlGr/KfB6QIDU6NQKlosPnNuU+ziz3q8WMN+O6S6oJVo1oWy4TPPx7bh9nyA/2BKGQhqG51qzG4pdfYQASTGHw9gB4AOA+5SUFTPAUI4ZwQMSyRTOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740717158; c=relaxed/simple;
	bh=4rp4ZuH22jaaPDSR9maRyjVWUX85BHaTNLUELPlHAuo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qhCICIL2dMp97aMAboVeejrgVsUb2qiqW7tPRs7Sr9ScPigP89aS/UEfEMc1fKHRCOO9EvfeN3DIDammIBuDJMgfsFcko9FF1BVKyI2MiPBxGBb5fC8QOdeLBloDyA8TFubI596pVFXtuzDGcYoNGpl/MMDveK3GObXAadi0GqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f55n83+0; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f55n83+0"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2211acda7f6so39132695ad.3
        for <asahi@lists.linux.dev>; Thu, 27 Feb 2025 20:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740717156; x=1741321956; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NbsovWlJl3HjP6zWFnVAwJ1WjNbEUYuyjrWcVHIxRyU=;
        b=f55n83+0Z5MMVsC2ep3mQwNI3dji9TixqJTwdCMzHlft0GAPFAa0VQFvfTZgY3xNxw
         FS//A4fvq2rk/1k+G2uD9Gtbxg5027CsmYcB/M5CrY7B/oOPZZlQyCofZg3SRGLKSo9S
         etSAkQmdrudbC+9D7umztiDnsYM8I5RIxmrFSubjt73f6pgwPGpx+LcgxSOBymKcxtlA
         XNckcNOy9f0LZ9xvyde4QRfWu+IV/QwW94iwdRDqrDR7aghth1SrfK81ZkyvTaGxqkXG
         q2UlvsO8BgBAxxPKo9JLE7DlYQ0kjShEIxEvqRmF5Ab7X/vUjlEIwyfH2yLx3+zdPXnd
         okMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740717156; x=1741321956;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NbsovWlJl3HjP6zWFnVAwJ1WjNbEUYuyjrWcVHIxRyU=;
        b=QNulbjy8kMFJ1xwveOFTYmpJmVg0GOBf1sXkJoARIvTSkMBC088WBcAQqBvL/P4nLq
         zVYooXLoBk1hwIZs0h2aDKUSDUWpXVEzKLSb7ENALaCWRpQmv0dCCyPfYENGutH9W9yH
         Yc21mkgEjb7RhxpbLZuutOI0YBdbYMJliPlo0GTnL+VmFdzk0j6mBKNF6g48mkl6C9+K
         Y/qV7tdIIieGeOtj+2y8YsVwVikAmg1MuutPWM+e8fl/9x1VKzMoG/7jkFjDqh5SMlma
         NeNcAuNQgL2VixQYqNdcbSWRLFRMUD+QrWPVnqk4jQVefRQg5IoVmAGD+fu1zIBcEVId
         nd0Q==
X-Gm-Message-State: AOJu0YzS9k/44zhd/q0OmsAmdI+f5PELbD3d+Bk0QA/DN1HXLdpFblC3
	t6i4lnGPRsN2LhxUPJgRvAujrH+34jb/DIeqs30Tpb1w2gYnLF9s
X-Gm-Gg: ASbGncvPH0AwoeTPhcrTb6jDbsVCWHOv/AzSAW4u16V/RzsadXRV73gTflgRPLm8+m+
	qLsmJSjEaJRSdKj5rD9UOfgZExXNi+l2YnUXCeCowKCHS/4iTsPKMFkGT3cf7/RzMRwpsNXBAem
	Cvkd83WLx30KZOquP7vEOo1ZXvoxV2F3PWUup0Eu2KAnvwQAJNTpr/knhUibs+xkqZp9Hsx7Twv
	G46foUXcrgiY4bmAKYPVS4MySkxXrIcWF84T87D/vkYdr8nMBAEgLpKsYo3LWS1Y3raD68MxqBz
	nlcXkABLNmMeXk2C0HNNK8Vm8lBD
X-Google-Smtp-Source: AGHT+IFIFTXj137/X/rmkDNf2WcTJ5lhprjIpnLzgn+Cb3Ywj0z6i3TumH6T6qK6jrOETPuJoy2hTA==
X-Received: by 2002:a17:902:d48c:b0:223:5a6e:b20 with SMTP id d9443c01a7336-22368f6a0femr25154815ad.7.1740717156275;
        Thu, 27 Feb 2025 20:32:36 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-734a003dcafsm2738204b3a.132.2025.02.27.20.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 20:32:35 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND v2 0/5] arm64: dts: apple: Add DWI backlight dt
 nodes
Date: Fri, 28 Feb 2025 12:32:11 +0800
Message-Id: <20250228-dwi-dt-v2-0-69e450bc4bfb@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEs8wWcC/12MsQ7CIBRFf6V5s5jyqBKdHOzqoKPpgEDbl9hio
 EFNw79LGN3uuffmrBCsJxvgWK3gbaRAbs6Amwr0qObBMjKZAWvc1Yg1M29iZmH6oKXqhXgYvod
 8fnnb06eI7nBtb+3lDF3uRwqL89/ij7ys/6rIWc6ywUZwLYUUp2FS9NxqN0GXUvoB9S7ck6QAA
 AA=
X-Change-ID: 20250220-dwi-dt-c9c7af33bd16
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1830; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=4rp4ZuH22jaaPDSR9maRyjVWUX85BHaTNLUELPlHAuo=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBnwTxg8y3rR5I3zbiOGRc9dw3HOraEEJaxBIm1t
 EUiMRlANGyJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ8E8YAAKCRABygi3psUI
 JAAND/4qzqZlQz3BLTSbeu8maFlAIG7yGIZnEvuAovtFJ9y/J0skR1s2VSx+IQHf7kyfIe7omYf
 /MPTjOiFG4NfeXGUJLUSu4awYgUrn9ZT7OWLfwu1aQtdgrogq2gqbL6C/T9dVTINYdPhc1eMpHE
 QxuZWX61bnCtui/lfuA/hxrPYaM73bacMqCbTkMAcUqAY2gEik+d9/DVvORncGjlIXwJBtsEwhW
 5grg3wukTWwzq9pSbgD5mehNcU6miA8aaT/35nSbzlsrwh7DjI8YA0MFvEsu9w7j3ir8ibRyId5
 VC6wLAgppug8MVcEdj/iIxyMZwGJmDbH+DK6I7vyVHtFKMyVf+tTgpbydoDbvexp7eqJXAc9r4i
 MCeaf0DwyBp8l+La2/6BgNqh1t1a/sh2bBMbzU0XgxYTanzt0IIlZCe2Jcp5t6eYOkS16eiRYF+
 VXzWdWd/EHl6XFqotn+TcjdgjMYiFIbWCS/3s5Ji71ToeViZzsvDOyGlnsSf6gkNOsmx+mymPgt
 THbznCQB0qAfCUPEk2DxZkFLYHE4y9qszprG/RxvQURMRXdtv2FuiP4kI2F/DBQA+xlqyVTIe0g
 eBf1s/gwMbi3AzFH7K55wVzM/3em73ix4atBLLVxgnaJsTt+tSsKz9psJlVs+ZV35saoncCvFkN
 fZUc+zJCt35abDA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add device tree nodes for DWI backlight found on some Apple iPhones, iPads
and iPod touches. Not all devices have this feature, as some devices
instead have their backlights directly connected to the WLED output of a
PMU or use self-emissive panels.

Resned because a network error occured and some patches failed to send.

Devicetree bindings are in the driver series. Last version at:
https://lore.kernel.org/asahi/20250214040306.16312-1-towinchenmi@gmail.com/

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v2:
- Fix typo s/iPad touch 7/iPod touch 7/ in commit message.
- Pad "reg" property with a leading zero when needed
- Link to v1: https://lore.kernel.org/r/20250220-dwi-dt-v1-0-d742431c7373@gmail.com

---
Nick Chan (5):
      arm64: dts: apple: s5l8960x: Add backlight nodes
      arm64: dts: apple: t7000: Add backlight nodes
      arm64: dts: apple: s800-0-3: Add backlight nodes
      arm64: dts: apple: t8010: Add backlight nodes
      arm64: dts: apple: t8015: Add backlight nodes

 arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi     | 4 ++++
 arch/arm64/boot/dts/apple/s5l8960x.dtsi        | 7 +++++++
 arch/arm64/boot/dts/apple/s800-0-3-common.dtsi | 4 ++++
 arch/arm64/boot/dts/apple/s800-0-3.dtsi        | 7 +++++++
 arch/arm64/boot/dts/apple/t7000-handheld.dtsi  | 4 ++++
 arch/arm64/boot/dts/apple/t7000.dtsi           | 7 +++++++
 arch/arm64/boot/dts/apple/t8010-common.dtsi    | 4 ++++
 arch/arm64/boot/dts/apple/t8010.dtsi           | 7 +++++++
 arch/arm64/boot/dts/apple/t8015-8.dtsi         | 4 ++++
 arch/arm64/boot/dts/apple/t8015.dtsi           | 7 +++++++
 10 files changed, 55 insertions(+)
---
base-commit: 5744902a35798e516def50348356f867a6c1f1c7
change-id: 20250220-dwi-dt-c9c7af33bd16

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>

