Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A41D39D6F2
	for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849465; cv=none; b=Rrd5nyDlewRSUdZGFaDhv9D3Pf2GbmfQxIlz8zhwFnHPsNY8vlj6KAS+rDVcJo8vIIcL1LZq4rv67hAggJZDkDc1200Zt94l/Bv/Gu4vgI7nTKw8TT5CurRrGcXnwVhAER+HjLNZe/QpU58K3yQhdvFoVJ6Fm+85OkVxHgo/yWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849465; c=relaxed/simple;
	bh=V+frO5wk0tnXRPBZHabpKOBw5u16aJAV7l/JMbUCB+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/gsAt/Hqtd9vP+pIxqfjVwHch9rE9wlH6NrKGkvpYoPnzctVGk/KTjf6JnEv2FJ3oHkY0hSiuvNDC6vk6vtvFidQqTOTmZ0HTxPqHOk5w9mJyuX1gD0RhzLLBJ4sO/vUfFrxLOry8lye81BQs+hLFW8yxfbfZYJzHOi3SWYwpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AULt5Mdl; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AULt5Mdl"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so2211903a91.0
        for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 02:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849463; x=1784454263; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KojOIw0/7VKNeIbp9mqtjfjXLwzayJpBCU49qrDmgzw=;
        b=AULt5MdlErjaAH3ra8yhfUaMkaOiM0TVf3p+dlQ5T5PQmAYzHEbC8eRnSUDX6O4sid
         Q87fM+cNyYlFg2/J6RayfambN99p5gFJ3/R1bCISpEd6Ir7IhvYxcgQxa/wjxbNkbRrm
         aopecByiXJZVqgm2yspn6XPlUiniD2aajo244rasn7bxKj4leSvgVmUAGnpT4Ns8s6gs
         LLgGnGXqjPX4USG04hsf6k7Rwmj+QC60duFA3ETMMKaiVK++3JNFU7iqaFfCrfZ8PZe/
         grFwqusTWQCj3r1M/eSAhPW9sJ4RH1LYMYtnhOUbnb/Hp63JNYcjsR2gGwJz05Lnp9X/
         2LEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849463; x=1784454263;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KojOIw0/7VKNeIbp9mqtjfjXLwzayJpBCU49qrDmgzw=;
        b=Z+E+5Gkvh4yO3Xn2XfsKlEd1MZwJwwIS3rYFNFrMg0yeqmwBag9DwD3GrTplidbulc
         s7Vntvfju3nhGuPGKXFKXiGf12ISRLFRV3zOVmc66L4jgJ8Lt6sm5hc8yVXYPngYWO8n
         FFh9gcJeeZFOevvm0qq5/7ATjRTH0OXxFHMDBlRP5HCpDSY/BXKaqyKj+Lzt21A35uz1
         2/8XsyIu/vXO5YPqy1D+NlRlTyLN1ffyvMpgmXqL5u8B9Q0Tpt+iJjrpoPcUvfIqV3Zj
         VtcBBiFVoSkA11dmZ3fR8zYuIJp8LKKZSDjsTtTjtCvB/L3BmO09u+JeVxuh0x1WKOHK
         2RwA==
X-Gm-Message-State: AOJu0Yw7Zg+Vunx4TiSxAe2Vg2SQNWJXgzvKCiNhwBOV++fGGS/Joo6f
	abdRWT6Rt82RGQc/N5JDPsRUKhbiX+eLrnL0n9ptnpdt+jzAOMvi3z+b
X-Gm-Gg: AfdE7ckT/mOeehHX+FzNQ5GfyVachi9uyn9gkYq7s9sVna+AvPeoQl10yF74pWqDriF
	l8jQ9u1+G10CIMIDpYfXorCU8ruz3DLEYxA2UqmVYEpYCC1kd7R2EBiDutbiiNQcArOilwSJ+v9
	ytckRSKWgsKBfUd2ZINW1prZmYDgVVCqKtMNcy7GlyfMy7vBrezqbFUGvmsnMfpe+0uMNfkWz00
	dALJfFyoOX/QWeaqJpQZ7TI2feVxfjEmx195n8j1OqfsB8qBVfe23I5x1CJYtXwudNGU0mOIywf
	qT/zaI1jTYQLaTIrKGA039ihF4y/sBxlXbk8w8C89eIecdRfdL700x1eC2qXET2yahIa24i3EVN
	z95AFsYuzNOpjDK5+Wy5+DAWMkW8vRVJaivvdFXlO4+KPV1Xd4kV9ZJyc2Hu9G2osKepRKhfeDU
	WF6ItHUJ2CdZPZAcuEGhy8uGDTiatz7gfrcNbuJDSfyMQOMdSwo4jgpAnSlr8XbfPJhqsVmqObQ
	131KajFsxb5y4RmAjXOO2BOxbTZq3Mq+eAw7Sfai2DxloiPV6hox98T0iiBmfzT
X-Received: by 2002:a17:90b:2802:b0:37f:9ce1:7364 with SMTP id 98e67ed59e1d1-38dc774cf00mr5465528a91.26.1783849463612;
        Sun, 12 Jul 2026 02:44:23 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:23 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:22 +1000
Subject: [PATCH 03/12] arm64: dts: apple: t600x: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-3-7763006d57c7@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=679;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=V+frO5wk0tnXRPBZHabpKOBw5u16aJAV7l/JMbUCB+M=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU8sOyuevxZZl3o733i2iW7IseYJiSGud+YevHKgg
 Z1/4xuTjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFQzf2D4wy18fXJQyb23Mwun7bi07ZpFf6fL+eoLPxb+mNf11PrFVx5GhoXtL7R
 V05o13/tWFHFd1XpvXDRBUCD+ovra9uiOhfr+/AA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index f715b19efd16..17db8d7a850c 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -45,6 +45,10 @@ smc_reboot: reboot {
 				"boot_error_count", "panic_count";
 		};
 
+		smc_hwmon: hwmon {
+			compatible = "apple,smc-hwmon";
+		};
+
 		rtc {
 			compatible = "apple,smc-rtc";
 			nvmem-cells = <&rtc_offset>;

-- 
2.55.0

