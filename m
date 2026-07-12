Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F51239BFFE
	for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849469; cv=none; b=k9iQLNp2I31JUR78Hn9XxzjkkFUa0lViGhZgSe+y2naYDmxk+FGsO9BGYq5AJglWjYQpOTiXXZt4imwiRpNW7Lofet0zKQIGhvMOGHq3RniNfqitqbRZzRFdgpX449uE/nXIZ9x+5ySUb31IsYMA5n5sBD1FOW9R6QbH/t0YAV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849469; c=relaxed/simple;
	bh=gUnSQx6EnJXaYhEgNgLK/1mFnXBvIddQLwTUbxqQBrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dGTfodtP0eccFrdirpfsb4BcWKYbeCYeeuhdXH1zh7qu+wWgTQBc4KfJz6EMwgS23dTsk3ICo8nMGplg3989+c/vTrJ4Uq8JQYcRtbD8nwL1f8So760lqW8n4hoOs9QnIzbzl3A7otUlYuaqCAfLKs1I3NAdLV0vKFlFnWtimug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yh1QM1bd; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yh1QM1bd"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383adaa461fso1463284a91.3
        for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 02:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849468; x=1784454268; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1sDKgNris4bKIsSSZ8ZkjrW6Ok7Lj+2yHiTlwt8/ug=;
        b=Yh1QM1bdSGDni8h+1QxaHbF+SnHAetdmxtARWFaL6r8JSj6FyJW3URN/tC409BiBEZ
         /eyBJ6IvHpdC+sEo1Xmt0V+yBUKIzeeALkje+2qvzwKLvWlTFbCJxUHwCjmj8MxwG/vb
         o7+rrbLlMtHaqvegkSB6Oc9prIEh+XnSrJVdQBn+gD9bQDvoqP7AhBsLa2ghG/S/EWM5
         Nq1fgjT+A9ULMW+dFm5qMPNGM2H4oGVbw2VYEKEYj/VZpFYNfTLLiut0IyD+cuhO/1EK
         lZ/lOoR8+T3ZFBUN47HZlK/6wrBBF0yMaVcUt/Smh0tZTCwLIfKuvJsc63nRHKvpmCVY
         Hw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849468; x=1784454268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1sDKgNris4bKIsSSZ8ZkjrW6Ok7Lj+2yHiTlwt8/ug=;
        b=OO7hmIbTMmVsKxw2KFLG6UcKLuTrJG8o8l9VvNJysHmD7EG9FS7bkTleylOfYxz5/R
         n8E6KkTHFbP0V/daU44zsRnZFFwPNY3PRMoCGGQgDV4FU8zNhWqPMcQBpH+8dJRbgU56
         Iu5EMgdbGzU6zR6zxgPCWfd83JhcNb37uMgrrCh/7xkj5bzqHsaVtUg3vNQ2Dqj0Ab9N
         gLs2hhHiDfcfBXca5cAMoJHZDQdMsEmatEs70InPaIjdJJdu8DM3xjy5mfkrRN9ZjRKF
         2T2Ob7JhB2gFJDovpHJBrpLAAY2ZYbRUI2gQxWuRwdmbH497RYImXFvRu+HUwsesdzKX
         LvOw==
X-Gm-Message-State: AOJu0Yy8tkYrSeWYctkU7+CLMBTMLAsKtXgDp8Z2T6ez0943Ktm5kGWc
	6d78QB2Hr4DgxXOJHc45hZrwZ2yNI9ROyxR2MtfDoZYN8GE+SxaUqKTDWqAHqQ==
X-Gm-Gg: AfdE7cnOpdpF+DKGG7qGT8UoticeOOe8BGN2/L9eirsWh/EzqulR8ieOISDaJigVGg3
	qaydExOBKSDqFGzgCg6iHZz911/di2bsL5mfkR+Juy5hnXwG/sSZ4UmafLAQ4DJPhX2/TFg84db
	cjoS5oBaA5/eBQb4IaEceF0YvdEmEtvev/aPe9sCozVZEz3PdU+ajQ420xhSthi93SFhIqr2ZJ3
	XRBG0lrPb0TCYUlSLXmA5uKdAUK0cuFjyHt6yNcBX3ETw0E7pg+U5j5I16flKTt3rEnea5Ze1vF
	ZpWhnbb4clVLFS3f8rnoLF0zVuZqfClnbYQwVlfv+29YYC3QubaZFgZWoBmwblNPMyKXH5gPD2L
	Yea1succBpnKsZ81HlMNFfboAvDPshUqABmwwjfFHBfnFxb4wybVWDjVY3Uy53ABOREXK5lAPfx
	QG3DyrGdXo9kApVq8v3VtpG0eR1Yj1zzf1ECK8KDI5bkq0iNjxFznoq/9aUCkD80czZrCfl+pWo
	LapQhUh7Rf5YdEWxv8Yjy/j/ehuP9wpR0YZju4yIC5IevAID6OTM6tys7lTKT6XtWYYEN8zyDo=
X-Received: by 2002:a17:90b:3502:b0:387:e0db:bc32 with SMTP id 98e67ed59e1d1-38dc7bbdb04mr4779557a91.40.1783849468005;
        Sun, 12 Jul 2026 02:44:28 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:27 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:23 +1000
Subject: [PATCH 04/12] arm64: dts: apple: t602x: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-4-7763006d57c7@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=681;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=gUnSQx6EnJXaYhEgNgLK/1mFnXBvIddQLwTUbxqQBrI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU+mfV5bauIwu7yV8fCN4JyDc1hirrLe0jI8frDq9
 DkHv3nzOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFPtOY3hf8ghVrl2+a3Oe645SzQH3DNbclJpwbJ9Dx1ru5L63v3+zsTwP7jj3no
 JqSq+xUnuM+MFdL78tpmW6bok4coUgbK7nb5/mAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t602x-die0.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t602x-die0.dtsi b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
index 8622ddea7b44..301df2f006a0 100644
--- a/arch/arm64/boot/dts/apple/t602x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-die0.dtsi
@@ -122,6 +122,10 @@ smc_reboot: reboot {
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

