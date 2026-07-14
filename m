Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F6C3DB992
	for <asahi@lists.linux.dev>; Tue, 14 Jul 2026 06:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010530; cv=none; b=VCvEKAkmtDOJdeDgwSge3meIvv1hTknT/KnnyPmPsOEC34IG8Z2nIczgwYHsmJgiKKbbSYj/psL+hp8K+RPPh30y77XQa9+FeHMox7neUnDStM8aUk5kbjLrATtKe0E7z4WVGeH0RF/0meKpt3SfhvZ+iLO/VafOV9Ww8ri8o1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010530; c=relaxed/simple;
	bh=7u1MxAF7Cm+8Fvpmgb0ZciAKGCBJ6Tnc1FxGjq6e2jU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sPpmJVLRh3mYlqiTHSEyl4afxDc4jsk24i3OZqFGpFFYcIABOGZqC7zZRl5gvni9Fb5I5RXlvWJrwfO4sRGdRmi5xjTD6SMX8ioQJrEdEdBNElT8N71Ny2iEA+LkGbBoKRy0MATwLhVHjPThETUwDLGyCtDTDFLRsOnpimvvGP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbVpVQEQ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbVpVQEQ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso5380805ad.2
        for <asahi@lists.linux.dev>; Mon, 13 Jul 2026 23:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010528; x=1784615328; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsJU27Z561y3XTmKXQzrI5pSnWmaE5x+UzAWrjuTKgQ=;
        b=UbVpVQEQibBdQ/p7ACdZWpJIw/SxE9OXhsU963NPa0PWI2SwB4Gkpx0lU/KRuqAypb
         pLX0MVWFDC91Ndj6B84BR8ug8goIRUl91RAdQ+r7JM4rqIJOnFnKAV6zYAzR+jt02VFc
         lfGQbSql+/jyADsMPjpLbkHtpK2GClBxq+kEReBQZmPxx8tMTCUl9R2eMtWpVUDpU6ei
         VcTu9Ko8ATnlCD+C6ZZRzGpFRB1QT21wUFooKBQwzm8Y1ip7ICBJiZ+K08zn7rYPWf1a
         9TDw46lQFl+y1BCgyAuQeu4ih2+FA3BvL9mkPemK/uaGGo7fVNOzxmu1NziQtJiFGzNO
         qllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010528; x=1784615328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsJU27Z561y3XTmKXQzrI5pSnWmaE5x+UzAWrjuTKgQ=;
        b=eGwjG2i/gZlvWHcFWa2/0I0MZxbh7xpVEzskDB7hFUL2wf+f7hbMuPv50xG1YdGWSe
         DUkb7LCKOA/E7/xJnJPYmDJu2eTFX6yR3QI7gOWAMgJFpueWmeu2RbFwGYnaDxZx3JGw
         ZXQo/ehiik8adFyFC5v4UtsLSetNtf4hIWBlHFgePFWYsy/d9tuqvjYTCuJOkwRSx+V0
         e9eDt4ak5O8TXvjejs0ytCNQJE2x61TLjruOaZQdZnusASNVtbLfr7oLCZLN1EH7J/CJ
         PF/FJaqXRwooWMBWH1n5CdiQHYVOXt0CyusNJ164vTXqHVuwSGWzUri/CPqhXGRahmCn
         Y7RA==
X-Gm-Message-State: AOJu0YyHf8BwSyYmmbeUkTKgSw2tYVl+8nRqQ9+4eslJxUJO6loSy86e
	g+sei7csT2IMj1I9o/VSfr0kIUIUiKOgoBaoGKjKtJZmAM7Bz2D2In0j
X-Gm-Gg: AfdE7cmFMnS+Ni2zGdg6JcCMC6icbJZL3jFSCq62Apg5X5FajT7LLyuzGAbM6TUGX/L
	Rncg5Su0GCPIjCt+jFkRaX9CjDytqN3o+pi18+6mqxojWnCZGhrvfxVhJGHI9YLrhCDnjUkZ5Jt
	jU9E6i7CNieckzBWKYlz9Sf7hUCYhbpqRSd4+/qsr/uNnHqatD5SSNTHjE8TtWodoShLdBhBczj
	Sz+vDpuw7EWF5tufztwz9su3UbzV1JQeMF1BUytZjP59gNoAphQT17DxmwPljNrqvlrENTsJuza
	tu4zoXT6iH7uRM5pSCfNRRmpo8NjXsfkmbbOCl/+6u1vXBLiVN970p2wrydKVk+CCqiMvdKXsG/
	qy97j3VKYME11HUdQoufgzHSaeAaxg3AZ/HygZ6701x1yCQS3g0zXb55f4YRzyUCJqP1L+ToAVQ
	pT6JtEhulwWghrjEnxY6z9wYBtmGHzwF3FlFH4LoJJrXnf1KNCLDLyCw44i7ElAiVDOkg+QqroR
	qtdH0N2xVjzNBvTZk/0r9Ezzg6kniyTuetftd3mmuKbgS1DK0KAMs9fIueVGRYF
X-Received: by 2002:a17:903:15c3:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2ce9e99be82mr119230495ad.13.1784010527653;
        Mon, 13 Jul 2026 23:28:47 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:47 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:13 +1000
Subject: [PATCH v2 06/12] arm64: dts: apple: t8103: Add common SMC hwmon
 sensors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-6-13fa78873121@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=535;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=7u1MxAF7Cm+8Fvpmgb0ZciAKGCBJ6Tnc1FxGjq6e2jU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xmMouJqPSJF1noyrbuU/0zUwupFotSdCUmn22tNL
 MSs92h0TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 SMdYx4iBi1MApvr0IUaGNct4zP8pn03a9lHU5/6Uf7uPburYLLTokoCc8bOoqbskGBn+Z1p5ude
 H77je+v3po+cBclImC7/Ovie66c6Jt66B6s+T+QA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8103.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index 4d6a0411f086..5b68bf0df4e6 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -1250,3 +1250,4 @@ port02: pci@2,0 {
 };
 
 #include "t8103-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.55.0

