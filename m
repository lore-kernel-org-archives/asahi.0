Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845B739E6FC
	for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 09:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849500; cv=none; b=dgs9XYjeG+ftSxIceh86ruHSj5gYM5n8bqpzX+WrsG32MXpK40wiQgWWUm5qo1fy8QQ8/FyGO0DHlpNSYvwVtQOS17+EjJCiPa3dSBs76frNxZpPjHyFk087I7MY2xJs5R0oPJCrNJahT3qvTbBAHFhhu7rSCcwOu9mPjpL8Ixw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849500; c=relaxed/simple;
	bh=b5cJQbI2rPQBqmyd+tyRrl79csKGqBEcw6hZJ4ZNy20=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OAI2Tresb0ZHcp8p8NPlJhwcEIi6coVS2r9gy2HD4IpF6mh9p1dASSofUEIB7ucA//CIU0hFePPJy28+Aadz6uqqSCP1BpGHjvDFZtzXGmTsqgv0pc1fUD88JFbIzkAGH4fndkItBSvcuvm6mmqyd033N5kAkpz40WuWLaOImY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFswu3Hf; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFswu3Hf"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38df94d4dd8so6560a91.2
        for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849499; x=1784454299; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8XZtIIseDB8jd5vi9+iZWbpGqG/Pge6b+zJURkaj8iQ=;
        b=CFswu3Hf97OSrYSI9wmo+bxIZvEdPwa7J5lKvmRr1sSOViC/RIWTWYWjll06NP2sF3
         WojU4OChLcjx8JHpRv0mzt8T9tkdkr4uIlXE1gipMqK/sRlurNWhMaD2IkvM3YDbwKOl
         X39/7lHqPQQMnN4oSeOS/XARiTQZaiKirdc0uZC63gcq/gCDN7aBO1MvZHKxvEntSair
         PZxElTuFXlKsvrldStsLUi+IZeD2Ha3n229EC6VgZZ7UtQIRR7FsBbPHTm5FyLxsVqNn
         6xPO/pjVpXCW5JJhNAsI7mkIgcTgJubCyywsPaHtmrw1J7qFWzmaiJ57/cU+gNFJRqgT
         CIDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849499; x=1784454299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8XZtIIseDB8jd5vi9+iZWbpGqG/Pge6b+zJURkaj8iQ=;
        b=iP9tWR5iI8UCgDntJCzMa/u5iJKece+qs+H/RpjTm1vUAHbupJU/Fa1SCEsUWb9pmP
         ty5YYPgpKJ02WOewbzXUx5ZQDVqQYpQfdCn0rcgDc7gaKDA0qElPnnQV/qHAKxP50uRO
         LR1I+ASX1kXyYghdNVYcFavjhZHnIiQDZN+lMvmrADgpj0LOrmeB05mUkH2O8yHefFfl
         1WO/E8vfoFG4lq7ZIf2a79WrJOcvnyPBt8N7AZn7eAgtBKdT3hPuY6pnwSSzN0usIsow
         YYQY6tYNuvYINyJlO6ieLXHbhE19C5rGkog3q7oO5jT4PRXSmKl63J7OLd70QaAfmfEX
         s8Ug==
X-Gm-Message-State: AOJu0Yxw2OEc1eqbOODfjWZMF1nifHiTOmVWpQSpcHxQ9xXghY/9savB
	TRgXu38XdFIXcXpz2fNUD8DkUXMl3nz/KkqjaRriujGpfT1w779OlzJR
X-Gm-Gg: AfdE7cnEzKrVROjQA0E5WNbkZMKUOMhgz5z+R7ik8IhUvobvmgto5ErI3JKv+AvQQX5
	32ycbAlOMORcsH1nocsdAwmoWI8LDX2XNdNykOSWc48WGPuTzzwvUMdq8nu8m36lYD85Fdz/0ld
	B7O94gfaGgKpQiEyvbd1HFBuPqwsmcDoZLqBCXh7C8vef18aZutJqKK1slkZDR987pbcSNPjcMo
	cjHWjjpd4nhwDJhUOm254PHoMLdqRewM5yBMfPJD5OCXQ9Q1kfyOwD15gkGHugszGsiZmS2ob1W
	GGGEfMVwGHRZk+s1Zino2lO2uGopDtfjvn5FuejNRj0RutiDMhmTCNcP2eYbZGsoLwiqz09VmEy
	UM8AP/oI4at4HcoOou6n5ylTDGAM8Omp0ujBoIYOcYsOy3Ns7jvdtVEs1VjS/eoIzi5K5sv6kaq
	92YuWWeURL/pIHOVf7SZpFFfKcreQpCE4SRs0M7kFGzGiMZC1p5yypBSoQx/whZUZ6ZEa7+jPTN
	UVWpcRMm8bOofhhw3Ap9Zt3aE9QwN7fSu/xVL0Is+q1OIIIIqXWa3/+rhewanM5
X-Received: by 2002:a17:90b:3b89:b0:381:5a08:6291 with SMTP id 98e67ed59e1d1-38dc7779d6cmr4445784a91.20.1783849498894;
        Sun, 12 Jul 2026 02:44:58 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:58 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:30 +1000
Subject: [PATCH 11/12] arm64: dts: apple: t8112: jxxx: Add device-specific
 SMC hwmon sensors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-11-7763006d57c7@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=b5cJQbI2rPQBqmyd+tyRrl79csKGqBEcw6hZJ4ZNy20=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/XXn4VvKanw7kqSsbi77ETk/afz7nt27dXzWhWY
 oRC+teKjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRPj2P4n8l+4XNXcXJ8Do/WB630KceKm8/HHfzCW/nkms2Onbue32T4w3PSjIl
 5gtbbmDn/VzwpK+35cbxOMY6n9mGuiU7l2c9TGAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the device-specific hwmon sensors for select T8112-based devices

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112-j413.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j415.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j473.dts | 2 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts | 3 +++
 4 files changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 1a08a41f369b..7ccfceb08093 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -91,3 +91,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index e37c56d9fb4d..fdc3409d2e07 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -91,3 +91,5 @@ &i2c4 {
 &fpwm1 {
 	status = "okay";
 };
+
+#include "hwmon-laptop.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 438f972546b8..105a9d118980 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -84,3 +84,5 @@ &typec0 {
 &typec1 {
 	label = "USB-C Back-right";
 };
+
+#include "hwmon-mini.dtsi"
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index ec116da3e4dd..7cea5c594810 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -146,3 +146,6 @@ touchbar0: touchbar@0 {
 		touchscreen-inverted-y;
 	};
 };
+
+#include "hwmon-laptop.dtsi"
+#include "hwmon-fan.dtsi"

-- 
2.55.0

