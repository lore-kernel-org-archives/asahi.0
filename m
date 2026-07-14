Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED793DB30F
	for <asahi@lists.linux.dev>; Tue, 14 Jul 2026 06:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010520; cv=none; b=h5h54A1nMvmmZrPKCwNniTw7xFydkQqyxM5MPE/Dv6DlGIWgZu0q/b6gY9GusA1W1OigosbRELObMgRrBGa1rie6ARvtgeXSXfIrCbbB0Dk59rXi5YSXXskB4kaiKd2Nr5pG4epbcQLuo59j8eBiQ4o/aLrBwOlvHxS+64cwnSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010520; c=relaxed/simple;
	bh=gUnSQx6EnJXaYhEgNgLK/1mFnXBvIddQLwTUbxqQBrI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Bh8EUa8C04zJVtE7H3ivg9kcmVdBTNovsAwlltOygF0Nb8g0DXXMRT81yslKq2Hvr3kFVWKZbdFMyWUnKdzlsvpqIJ/v7IzbEwBbsxdD/Q7bcULxd5tFINkWPMcS0NdlMeY2KPwoq12wU2rne9UTkUw8VilqofHqN1JXMaEIYSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzzf8tL7; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzzf8tL7"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ce98cb8165so6370815ad.1
        for <asahi@lists.linux.dev>; Mon, 13 Jul 2026 23:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010519; x=1784615319; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1sDKgNris4bKIsSSZ8ZkjrW6Ok7Lj+2yHiTlwt8/ug=;
        b=jzzf8tL7UBo0ohVn7yk1n3NIIW6uCoGVTEcefcRbffmlIOukMNyxcCp4HRk4RFSZKD
         Ij4MTV8ZMQ3SuI5M3d5XNiDuCM5z8kYhGlvNHGLYgrqzmK0VCPa4y+7+7LSCAzNiYNIq
         L3oh5y1qhWOLbCUWjNoe9jC+Qoa78QiKfI2xcM0FKg3MwEPbLFoViKcmP0FOP58PyaBN
         kxhoXhXU/0zoNDNGTHUKVVXOcwFH8ZYiholng5wVT07LuH87FUe785/6Ri7DeKTyuSi6
         xLIwniAgxt5xi32vVL/3o2q19q/zwDOCT9tc8TtYBA99ID2E6ihL2Cy6qsHgHRMI6mRT
         WUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010519; x=1784615319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1sDKgNris4bKIsSSZ8ZkjrW6Ok7Lj+2yHiTlwt8/ug=;
        b=VaWl1f6X87m2UyrtVbnP8tdNf0On2kApHMOrTvOZqvLio0bnec6KFrV2+wldIF8rbX
         D2AQX7ILbbrIlxe4gTNVbjMLpkoeyb8YLbpF7F5gwJQLTKL3Wj9K6VT/x/1AqwJTflFw
         eYqBeEZtXBDLnITgDyrUVEMgvN8uFKplBfCz0kj2DMcQCztvowFFvDPpc3PQCuL8HpDg
         0PvHOPvq/UPBalHMqNusns2gfzws4ZNIVcEn2qh8SU02XvxrTsYw0qUSqWEJ7xPRCoo3
         vs6Wl7NGAcxvNPWr5bIZSQuOndMypRyi2XGdFaLuueuU9W4hsCSOmG1O9OYMdVycBfXH
         w5Zw==
X-Gm-Message-State: AOJu0Yxh+G5+OMfjgkewDtD297f0CIgcqk7lmKriBjjE9K8m0EciuFQt
	J0sTuKjsHktpor3Sm3X/wClcONLqZgFzJWiwVeWEYM0Wu0CNZhikoMs/
X-Gm-Gg: AfdE7cmHW841DHqjYtsyYLbJEVsxUEASzW88Vdoz5CbWNwx6tbZ9O2p19so7SnxejWz
	RdIZFChs2sEHKMQU/0D1Wey9zz3zF7EyvuQ5BgnZOEKaHPNdN5JtCFrNfaNY0jAbybXHok/gRvl
	apA/MGpYjXP0llmq/Xe5BTBCSb+jpDj96pMCqiyMtwHYQS+sPSfuXhdcO1AwAts4wQlhly9qddf
	5kVnOStUTAmZCOkbsYgLho2P1bT9a3Ra1BMiBF2KoJw6GupqjxErQ9f2lu1i8SXy95v6dM7cQ/B
	GtpSWRrvIBWGoIzEKPOwW0b0TEV6nFJQj8clhEhuCjqr0ONNXe+s+x8sX6mYkFY5N5Hvbw+Z4xd
	cCuUvn6cpq3RZMdFtiAcc7hSyo5lggz2bgvrOW0CQw/KFaPWDT9xc4HdCXBdI5eKwXFNOHHoF+E
	OFYa5eykl1cd1WNkdrIwwGT/dz6FrrJOdXYmaZCUqEfPQbQ6ch8y8vVlIv+ry46eGG7j9yWvE0B
	FFKZK5XjQO4buZawn9fkJX9RL+qbhmt5Lq2IEoCYHUf/GpaVgFj9N+w7d8hIyqM
X-Received: by 2002:a17:903:1b08:b0:2c9:ed2e:b8c1 with SMTP id d9443c01a7336-2cea17f82a7mr116774045ad.12.1784010519128;
        Mon, 13 Jul 2026 23:28:39 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:38 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:11 +1000
Subject: [PATCH v2 04/12] arm64: dts: apple: t602x: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-4-13fa78873121@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=681;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=gUnSQx6EnJXaYhEgNgLK/1mFnXBvIddQLwTUbxqQBrI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xnWivv/W/4/x3RrdIzlzWU9vRK7mipW71t6cSbT+
 hMPL1/62jGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZjq5hiG/8GNy25EbpV/PVXZ3fRO947qQNbgU4tFsrZyLBbt3NVn6sDIsEZmxYw
 ljJN2/DrpbLKm3v2p04OaCZdWXxaP83gd3hJwkR8A
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

