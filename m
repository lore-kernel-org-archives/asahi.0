Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7E23988FB
	for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849487; cv=none; b=bEzkxTsWe7AuL+4VJm937bsmD6IHkRkWWoy99eCSN+OpUFQIkL0OOkOkuEh32qI7v8ndOYXzApukTvOrRu0hkN/SFNo/UwBDtE4N9dIwwtiuQxEr1i8XoHj1cXPfLYsJRbqUnJjkS1IYu49ykNAaO1Z1Kiwb9ebtOEwaeUFb8sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849487; c=relaxed/simple;
	bh=HLHEl0SO/lEahgCGK95iQtDGGar7Zg/9GoIChI66pAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXNF/wbMk222melYTOgnVt16FaVS4R0Xlfl76lpnJc76XQ74pANmvNpAkMKrBF9GaUI/o0cnr086gyopiBxT0GZWsHS50hrywTGcAdpxJUVjIK8Wp6QimNiXevy9mg5ZtIb7ivxL3S6PC6yApiTMOM97RlSg9NtTEnulxLi0OK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cw5gJHpz; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cw5gJHpz"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso1605630a12.0
        for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 02:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849486; x=1784454286; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fsJLZhqOR3UbjWEM7x+FIdlo40Tmj4551WlKIRMpMPg=;
        b=Cw5gJHpzpQFLz/BJ2FybfweO8Xod9GFdGnkpRU3iLVageZNrg94lKO3+v/DmWWhawM
         JnwzYHz/xwt9qxFsa3ILN+JFqW4OGTUMiz5RETI0d85JgM9cUckLhX1MSP4AHq6h6iYS
         t76y/ESHeouadvcW5YlWVimoNDRTr26WspSa3cTRLYCrmjufuSMLt6J4Luf7aIP/PvkN
         FtrtLD5jQjjNCeH217JLGPdcWFRYUqJ4sTW6y3gjpmdiaR0IUvTHsa4iMo0lsG5i2bcy
         zdSBmv22qwm59oxUSZusYd2KJ8vqQZL0TxrBeMwsDPD676V4LhjA0poqSsvFmTQTIXIK
         X6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849486; x=1784454286;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fsJLZhqOR3UbjWEM7x+FIdlo40Tmj4551WlKIRMpMPg=;
        b=JQvWO00pRFX123xJ+5HRykb5NJx6JRt9YbiWhwrrBidQuxqhnsvwm4D/SRLhSWimjp
         eSyQrvsvywrNJ7q3cnjuDqTUpLpyPnZgoU2CcGJog72ttdMqJTMHpNApPK+CKeK7zPrI
         roqAFbFiW0GTG8T4VTmN5tMSklifWPwdpy8xwKk0NVY70p/VVUl8Kt6L3sTC2l+hWT/2
         Ys4uSInWugK8xYOnQD8Juta6ais3D0RajdMUGp+v1cyCFKVbiH5Qhn5FWr3z+ejuezRo
         yYX14IFagbU/9kPZ1R9tWLvem1yCUXUOYsEvHhRmlWF9Rz/DSlKtkeS4cVNx9Vk4sPJk
         lRVw==
X-Gm-Message-State: AOJu0YyX8SFvVoe0TsN67ofcYRCrBQaya1MvvEedqYW5rK5D8ql+SNZ9
	pqXACvdZnKwcVG54jVoarPI2U0UrTXSTYZrNfps+kdSD16hZ/bt+HywM
X-Gm-Gg: AfdE7cmU6Egmfc1pSAn3kfL2eQcwhk5NZg2zkd0WkGlVTkl40g9RpBuh52Ylycg2TPJ
	xX6YZ+XbenkCwpKSaRegQjOElR48mQL+tXi02WGx3qXynovfbLDkcsWVfZIvN7kskKdtJkivP2g
	d8CKrl5/eqcabvxt2bP9o7RqTzRt26ychguAFbGFsna+KQI+OqO0gtR1TwVCo/6xm+7LvzW0wFe
	jiGrfxL0bCVM7Xkb08jT0DfGgMPGcjyZ3DNu0FxwVtRBcps2PZQNmUJ+hRyWHKpV3t7tCxb5178
	wDMklQzA2W1DIyl7MsgenjkmnyHouCTzlGRh+IjGX73sDff0HLzF3D/6QtCEhJYffhnC66g2Tiw
	Bb3fEgYQdtmySZMTa3mpJTvIb2YY3qJRu+2+1aMsrPEGHezPcbwQtiUboMCc0xTOgTd4Cbx9t9m
	H/edpWn6SGl/9JQBcLO/X/uCQPSLy0SjpVpaLRp/TBTVtrT5xgDhq9Ie8xnkYs/NNTvNnrkN0PP
	jhDaLL9Px3kzhL2gXhm54iQRRkClbRQsgQTbcEIMbpyitsdcjC+oNx3VZmiB0lV
X-Received: by 2002:a05:6a21:7105:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c110d3a4e1mr5501916637.73.1783849485889;
        Sun, 12 Jul 2026 02:44:45 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:27 +1000
Subject: [PATCH 08/12] arm64: dts: apple: t600x: Add common SMC hwmon
 sensors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-8-7763006d57c7@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=966;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HLHEl0SO/lEahgCGK95iQtDGGar7Zg/9GoIChI66pAs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU9jNB+rbDxoxi9Xvb3P71LkA7nFa3v9Gqub4l93J
 8e8kNjUMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOoXSxkZ5rd+btgXE7VQfnox08sb7/1VN8/jnMda9b/hS2HA3CatJIb/lZ5R3p4
 nzz/29lFbfZUz41od39njBQKp6/fqOe27cVubEwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t6001.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t6002.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6001.dtsi b/arch/arm64/boot/dts/apple/t6001.dtsi
index 6dcb71a1d65a..4fb934d7e71f 100644
--- a/arch/arm64/boot/dts/apple/t6001.dtsi
+++ b/arch/arm64/boot/dts/apple/t6001.dtsi
@@ -67,3 +67,5 @@ p-core-pmu-affinity {
 &gpu {
 	compatible = "apple,agx-g13c", "apple,agx-g13s";
 };
+
+#include "hwmon-common.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
index a532e5401c4e..0f81fc612a2a 100644
--- a/arch/arm64/boot/dts/apple/t6002.dtsi
+++ b/arch/arm64/boot/dts/apple/t6002.dtsi
@@ -305,3 +305,5 @@ &ps_gfx {
 &gpu {
 	compatible = "apple,agx-g13d", "apple,agx-g13s";
 };
+
+#include "hwmon-common.dtsi"

-- 
2.55.0

