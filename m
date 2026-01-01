Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9162C28CF56
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258218; cv=none; b=pd86TS/yjp9ugzlS9IlIi3NDuHCJnV4XnFGtx9qX7ciWk9TAhO8vHdBI/0E6PSHOLUgKziCs9Um4umjoU9sqHXZ5M/sYscuSCZZO2FCs4BhrHgLsF6kTVydJ8g1ceZWRI6vmvRT49vXocR5Oou8+EbpeXFdev3dG5VZdF69A8Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258218; c=relaxed/simple;
	bh=+Y0a0WIcF+OvRh+wENdR2K0SnXmQmB8D5lWAyKi2wlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j3Up9nuTunT49m4rqhMyace5wQtiUdKN7gQUqt04/9JND06zhVXeKTvzdtVTkmUcTL0oUP4leAzLufkwmCQtkwTreCepN3NQ8AFzrUmQeSvQUCwdwK7c7Hi5FA2mOR0wz54Ot0W4ONnI5Gst3aRMkohSH4+l+tkHzc6jnRo8s78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSwkHMyJ; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSwkHMyJ"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-803474aaa8bso4201777b3a.0
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258216; x=1767863016; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJ2g7x+wr2VIeqIG6aJACDKejjD/eomNYXl10MONUeA=;
        b=PSwkHMyJVpC8yY2FNrI3vPWUyz0d74AlEQ8hWCxN/+FQdVe2HuVZDDpo/B2vBmKfeB
         uUkSSZUbU68zJJqLgbOVexQFCZMGVSUNs49HvY5NTd+0tY5CF9U6d1zOr+Ka05ty1OmV
         GTBlwsMKhoBShPMCe2NC0b0ZpXKpIQ4Mofd2lVzAJYwfEhVljCS9MPCuG7Ciri3eY5CG
         aO02VccmL7aR6P0fGM21qVF2UEFgULQBi9o4LRFSSTKnih4wR45aXCiDcSEC4UQ6ltk6
         rHCa7bwD4Rk8NPPPleM9WJEfqDnTciSFnTUmHzN9TRVtJ/qzFOk0RmLMjeQVa/n4DAoF
         fW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258216; x=1767863016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JJ2g7x+wr2VIeqIG6aJACDKejjD/eomNYXl10MONUeA=;
        b=fEyAWDGtA2zQ0YwjU12twUW5dZTs7vaWLqavXbSZK5tAagIBlD9hUpw1J9pEdVKaZW
         6ec8De35APJhFmbhtxylZ+wzcxUch8GfkU2ObK+7TsOt6fLpSvClkkJkMuIbmO3+Q0RY
         X0ZMPt89Rjo4lNxd193rDpT5Q/f8y+WKr8dQYGRA8PO/iovXrBtmWNDZaAlIma+mse6b
         Da0GuIM4H9Y88kMqtLLfn4Dyw6Ao9yZBWIAkcmFtPnMduT7yfUPvZ2f8QuppVaKDhvXz
         FnMwh4uQXB25emtghqAb3MtUetdjF1az98JtnNl0o2584KNINwcyPXf41BSr8I1jO91O
         ovPA==
X-Forwarded-Encrypted: i=1; AJvYcCW+NcfdVPCAd42doid1gMdoEtx3zZmBBmoekCG7BhMgU0lCgNi5K/I23jPZJ8Kt+HfHY8T38w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5nI+3GUvE3ZmmAFiQ8XzEnYQspjOvfZzMR4s1tlakQDHALUXj
	uJvg/Qz9QE8tX59J/5O85tdjZiR+wrk47oHpzMRpYBX9gLaxal1q42Re
X-Gm-Gg: AY/fxX53VwPq3+n5DCeTy5Oy3mNO6mFp+KrXdfcmL8q2XiHwSTYQoMZ68dXNNo3sUfy
	jhJu2ANS46s7R7F8ojfEZ/lPPhlAi0VpqRMEt3DtWQX3+Cq7GUi0SyxOl6dtUurO8SNJDYf8noR
	NbfZHvkpAlsmHVJLgMXrvjyartrI/ZpZRhueevJ+4REhkCV0osv6TReiqi7PUQJ8r/wQaY+gLdm
	LZ0q8V5zQgFPxv73c8YOb3HUOm/Q/cR3I4qlWT/55mgWBh1YHcXHu1SjFB5yJT8TomBv/WofI7y
	uxifx55nnDAgAbbQn590xYI0zLDkcbvk0jphS1VBno6DbUa/fzFaSeijRHyWteb0VnVopOEyLOj
	rWzDLSucRm8i7FvBPq5LTr+V+IL8LLXg9n7eD/spw281lWZAN6RCKF2uEdvQENJSHIIIoWM/BNV
	o4IY52TVJTJygi
X-Google-Smtp-Source: AGHT+IF5nymNXrscYDT3dfZdh6GZrjRO0nfuwmLLAofLcZomgir0Fi2suutrLyvR1ZQFse7dGezE3A==
X-Received: by 2002:a05:6a00:8e02:b0:7dd:8f68:a812 with SMTP id d2e1a72fcca58-7ff5284dc0cmr32900240b3a.6.1767258215759;
        Thu, 01 Jan 2026 01:03:35 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:35 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:54 +0800
Subject: [PATCH v10 18/21] arm64: dts: apple: t8010: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-18-48812c529ffc@gmail.com>
References: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
In-Reply-To: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=894; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=+Y0a0WIcF+OvRh+wENdR2K0SnXmQmB8D5lWAyKi2wlE=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgpIAo0xFMf0/lApSkkk6hUOoy204imPMcjy
 aXS1LJup1WJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KQAKCRABygi3psUI
 JDK1D/wOEdgWStw9HVNv4Na47OndjFfy4bu/mK4iGWWoIefk/T2VvbgoQA9qKBH1Bz0/5hn97ez
 lZAcd12ujwX3IusRLbxduIvwDMJhxrxY/odfYYDZaD2hSWxVQ/15w2CIV3gYHMXc1uQF43qxIOn
 h0fPSd60uZ3TIueTTbk3nG/BVUhkDstWOFr1azPiXt/9KEWsKeH4DYS2gBbcvuW9RRhu11FFK2m
 DGo6B7z+kKVIy/LpVLq7IEppxVp6t5DnTqBasHuPPMcJhZ2e4UUlbVPEzpdMjIle9zW2omJdMnv
 Wp+OPa1976ZvNhUSdyMJUJZzvBa9GYkcIWIBHdVZ/aMDAYhpyZucYyl12UyLjuuexsrsl+5IwN1
 23TVJfsTXzm0FOUfXMPVoCLIXSlvJU7Yqq1GV6hT+06JWFRE0AQkW648yTNFixp2CNYDvtT0sxc
 swkJaMlrjCQUZUYIxV+5zqAaQyuNPGAEEEoDPPv2EoHsQ3KZKHZCItuzNvjiC5WHUaxH9cklUcd
 qio3aGsjyKHPn4P31pgrd1Mk5yltKydQ1AyUGVPxIagPvcMuKauERp4M+ABwIXNzgUeA1pjaOh+
 hY0tCYa41usCDXiyVUvCKJOKfKwCOCnknbbFb6huqvxWYvQXTnDhJK1BFeNTEqVzApWPKQezKhd
 cl6H9+JAo43VIdQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A10 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index 522b3896aa87eb290dc831cbbf2cc8e593844097..3cf1eef5cc261fa1dc699e8b5c9991e2215a6010 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -332,6 +332,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 83 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8010-pmgr.dtsi"

-- 
2.52.0

