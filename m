Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18331286424
	for <asahi@lists.linux.dev>; Mon, 25 Aug 2025 09:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113383; cv=none; b=MvQLEQ9BfKZPCVGr16uyP3e7JHFu8c6krfycB3i2PkyCPgISRCGdmEBFobHZrP9Jhw3wrknGcfXRxcvIX9tgrKJEJ2l+tJh+nmsxA1FmOLOq8y4uHo2Gd++8ySoZiv49AXBuHQbFMLq5bc5i6/tGnhxBhV+byta7QO3K41/DQ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113383; c=relaxed/simple;
	bh=CYNjF9OQgn4g6Ftiuun6/MohBcP92VmI1C5IHAHtgWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X4siiYonzOF8r0zyjg5pO7K8N2zHxvjUtOBOLWdrni6gWaNDrH0rngurWTL0gTlkm6Hroqss3W3jAbkoTte+H3u1DUcJInsPxC1r5cq1zd2Bm1+6kcg4OmYGn9gGLObepzFffzDDVv/58PQtZU42wgVNIH/K8XF2y0cI2dT3GkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+M4sOgY; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+M4sOgY"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-246181827e9so31399465ad.3
        for <asahi@lists.linux.dev>; Mon, 25 Aug 2025 02:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756113381; x=1756718181; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Te1xVrQgzDBuz4rdm+oAY4F74VBZ8yuKiz2U07Pbv64=;
        b=e+M4sOgYXOV9Oz48p/7nCdBZOhFdipKyTgmBf2x/HaIyaUrr0D35domQkwUYOmAtw3
         SD9YUP+anyjEmWkpZwYqbWPxohyaWngkPStm6aWnqkKM2iF6f4vhIfGnEGT3rV9OIB+9
         d6ZKxYjTEFAh7BlfBKdhgl6OwJp2GJ1pLTabNcFwq/l44Tz6oVQz1qobxJV8Ar3v7nyH
         4iXriHT797p1AezPyCp5bvkHMRgbCxDDODf8SMVG4dFK9GeKArqZXGWaz5VDzJAf12ud
         nos99GSa1UFfcBnVopq7++UwdqFRiu89EHxVob8KBRfiprdp45fKJ7ApWyyUmgdl9vnQ
         PjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113381; x=1756718181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Te1xVrQgzDBuz4rdm+oAY4F74VBZ8yuKiz2U07Pbv64=;
        b=DYsHC/wMPOsdva1M16M0QG7axgfzf25/XOT9khxdMZm29mRpEuYvz/xS6wcCyzwiPO
         mmaaTVNv5RseZitabP8ZQ3fkE5oXDzztOEUR6mi/LglitcJ3utqmggagNF4fJ8AK6mdY
         DXYf+G27gn/cmz/sutqR9akhEHDuPcCgJU1sL5Th0YexA1fkeEnaX+QX4uApZ0DCxo/s
         vHB+tmCa2LwflFEAR2fPwXr0vGi/GrTrOjJPgiMSD7XCJk4MTcNJ4DF/+yfXZHIGpESR
         AsH5frSQZVO2edkxbgkU0ny5feHp8yHR1ty8XbEjgQNxN3HxVf15hJ2livjo8pItx6m2
         oGbA==
X-Gm-Message-State: AOJu0YwOy3mnHtTuF2tTGq8gdXbdSWEsQicxx5j4SpFZq0SNB3SGlpG0
	HZSh+G+ngNpnAJPJoQHqCz4LgdsFP58Wi8Fc4EtXphxCKfSb/CIeijMH
X-Gm-Gg: ASbGncuXtgZ4UvIsdlgT30rWXsK/3iAYZyb95i/IvkysRztQukQZ/8aWVcKW7uJEbhq
	dTgUsiWex/co+2uwwV/BIbzJezw7pNODwRc6vJJ0gA1mcYF15FDiPyJW9swVG/HjNo1LIYNGQte
	SZ7udZc7bhkxOT/JUpOvRhOW1AzJA7yQWG9cf5Wi9SsqFR35qrh24nGyMzjHoCcN9CMJS4hSui+
	5MCPXPBLHgy04fu3qeHKLKg39bq6TWXm4NQPD05cnrRkg7MJSmF12B3upxLkKNDz4RwiNfQp3ef
	Mn6GF8SOfKtGM1oNLs9zdt5LfyyuAkmBsGTT7yBkNb4UK4H8HJYYd5IUCLc+/qPyU+gXPt4RGpT
	bbynANlcaA7qsVksR+iQ57D02l+ydYj/vQUKiIg==
X-Google-Smtp-Source: AGHT+IHA47RwYrhQlSdnPL+YYSXKWvogaXdS7+aDOLyvLluP5swy5MJMTU+F1aS+P0WHsZaiEZ4Ang==
X-Received: by 2002:a17:903:2f44:b0:242:fba2:b8e4 with SMTP id d9443c01a7336-2462efaf1demr168678245ad.56.1756113380983;
        Mon, 25 Aug 2025 02:16:20 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2466887fc8dsm62873875ad.122.2025.08.25.02.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:16:20 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 25 Aug 2025 17:15:06 +0800
Subject: [PATCH v4 3/4] arm64: dts: apple: t8015: Fix PCIE power domains
 dependencies
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-t8015-nvme-v4-3-6ffc8f891b6e@gmail.com>
References: <20250825-t8015-nvme-v4-0-6ffc8f891b6e@gmail.com>
In-Reply-To: <20250825-t8015-nvme-v4-0-6ffc8f891b6e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=798; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=CYNjF9OQgn4g6Ftiuun6/MohBcP92VmI1C5IHAHtgWs=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBorCnSe7tdWkaBU97yy4wbnzIj/pY02k9llba3c
 I7lzujWLziJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaKwp0gAKCRABygi3psUI
 JE7dEACzNVpLM+4i8uqFOcvOfkjW3xgay/vR53ye42qMYaEkvaP37KrBfyROeY1ZGEj31z6QKUv
 D4DPls/oRz0S0RP4ck/YVCFrpfljG3aW9Wq1f9DshvLquSf3e9ruU0QCi70tjs+dt538UoGJ0yh
 l7bl7MRAkV7DM23zcqubRmTY5F1z+yiLjdyaa37estt3dSJlcP/RhBg/K7YPpfH6vtq3ywLImyb
 K4/GkOhv+8aK+wjafHlMLooSlIix6W9m5iEGlO0z6KZT7n7A5LSYoVoX1182hCQMpY+6MV8wfXn
 ZDGRpO+Zqsx85UJjZS/bfCSzRpmAToQ01y0bD0WnPy1YjpChz4G1rPaCePat+OTgGDnmHmOIp+I
 gDyU59GEHTc4RUAQsBKxVE8swI7ILEB5DhxKSCuOORCf6DlQB4hDjxcduOA2W6QayDpDAmk6ZIn
 /bhAKiN7+cGq5Do5Ec74edy+NysyAtcY2eC9xIC4w589hMTbovRXpWOIaDB/F/MXdwsVgyojWnD
 a1dZjlZ5RMCgzDrAgnv227Iji6yzH5C5WQSU4qViyAcRO8z3CCKcZtICfRk/h1PvqniHJUUSVo7
 UOD+So9LIrnSMgsY/wfLY/Yh7fM4rFMlJliKNeIEygoIlMpmPrr/ja5jYXIsCvO6Q6UFS6tMy/V
 xEsbtftF5ap2cOg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Fix the dependency topology of PCIE power domain nodes, as required by ANS2
NVME controller.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8015-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8015-pmgr.dtsi
index e238c2d2732f7944dc1f984a4eb647ba212b9ea5..1d8da9c7863e5b7a732888342de9d481f309edd8 100644
--- a/arch/arm64/boot/dts/apple/t8015-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015-pmgr.dtsi
@@ -658,6 +658,7 @@ ps_pcie: power-controller@80318 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = "pcie";
+		power-domains = <&ps_pcie_aux>, <&ps_pcie_direct>, <&ps_pcie_ref>;
 	};
 
 	ps_pcie_aux: power-controller@80320 {

-- 
2.51.0

