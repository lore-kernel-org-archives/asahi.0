Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739B83DA7C5
	for <asahi@lists.linux.dev>; Tue, 14 Jul 2026 06:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010516; cv=none; b=VKKPfU+1IySJk4IwEIZ031fX6p3SpFY9zOP8dSoy+JpcbSkJHHXpm+32wmbbfghTbVGj2ttYHwY3KkPmjG7vPeO/3xB2b0iunHhbm+n4GN4bEmT91GLFYVU1UaSyvPkqsvbHvFCANcnTlE+lilx6qOf9M1uNy7xy6VEWe/zFkew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010516; c=relaxed/simple;
	bh=V+frO5wk0tnXRPBZHabpKOBw5u16aJAV7l/JMbUCB+M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RjpJSsTbdzpFH/Wc9IEHoxK0nmtFTptNPp8LO+ROwmZDxpHSAUEdsfONUzgZQ8Hb3qLDaJKu7HTAG2tk+7fDXpoZ3EL1okeDCbFwSijOcGoGTStEE6A3A9TLzkHtavPqSwB+HlkWbSpWC7mqG/BxIp5Xhirj+AEzUywR92JfMSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRGjfKgA; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRGjfKgA"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceab75934dso30061215ad.2
        for <asahi@lists.linux.dev>; Mon, 13 Jul 2026 23:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010515; x=1784615315; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KojOIw0/7VKNeIbp9mqtjfjXLwzayJpBCU49qrDmgzw=;
        b=nRGjfKgAyCN5qqwX5+nHKgTInih4EH3x7TnxxmhrEt1N8g2izzxgzhibjbySCtmBjS
         SE18SPsil9+jYQGeKjbgSpCp+2V3MU3ltLTMhFSbwUUQfE/AQDNjV+cGgekugNKIP5k0
         x82XhqPms9efILRb09Tv2GQ+AZhyAawUPoPknMkndiCFz9z5HV0JqG5e1KMc2qFBXydl
         fhuVZy6RsSwGTLPRp6J7OUAS9Uke3RHB5ZmSov9WwKbXeYbgeghQvkkPPIaw8Ns+OmVQ
         RlteDEklNWVooCmrL2f+ZwqaQSX0pG7ozHRTEXN6LkZrGvA4+OYU9OCJhi9yvJxd5Buw
         1Hxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010515; x=1784615315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KojOIw0/7VKNeIbp9mqtjfjXLwzayJpBCU49qrDmgzw=;
        b=Qo+ZZSUiaVpP2LDMGZuY8hTj/pBqZTbYe/X2yKNDTAlOqM+deBsXUjaPS/OCi6AoXW
         /ntYnjRgwBLX/4cn7TXUUOJcl04aQ2ETMQwlk4EGvHiGdq4/ljh2fqqJspJK/RldqXSe
         ANWG6TILH8cHXQMYyao8fHlb6CeG64Oi1s26uUlbc6OLZqIHO14m/OF0v6bF6+6eJ1/9
         ktAHwgdc9nEbYinTRv/AvXwnck9r3tlRhaGMN3wUGTVHJioYHkVOOX2+vJBGwvJwHTDu
         KWma83wmpgNzwJ0gWC673d5F0sKF07uSLoVhLI+RPI7p5xEkkro/dQ9qVvnjDZ4HUA3m
         5XYA==
X-Gm-Message-State: AOJu0YwAU09qhsOq8Bm6/XACCU7JAyFUPxSwMQq9MmwQCUOGXSSNBMAy
	ToY+fBy2gFGX8bxApzohmjpGqE/+fXHVRS5EcfjO/rgDhXS14CT89DAE
X-Gm-Gg: AfdE7ck/gnUPru7KV/5EdRkp7CJABIhTpF9s3BNytJCQO7KFkFvsSDo8k8lj4+0SjyY
	QzAgQhIEA9LW5hg4ba2NvZSHA8cmfHrwEX86isjNdaEaVGn11kcPxwLmvFPrP+3u0VZl6TCCH8a
	l50yBEjuLpiklvh5k0G19i+JRgy/zmBU6ZwQXTL1N+pYQnAVYC9QQoJUS3LDHk6XAxJ0YduWp2w
	N1j1wrMQT5Nmw/MyHp8O/sscUKsXqWJON1y+eHPlX65PwdxqU6crd8DorosSNxMVxI5JZ8iTlM4
	sRmHJTrzUIeyLEp6POudkjfspA0c7Y0SgY2dMDNSnNCZy5uLvjDy9Z2BYzpr2YcHbJF6YvtYzIZ
	dHTq0YUcNCAPUpTO+GduKk1CCkQmOByBcS2AllVqwiY/D9ggpiiMNEK/IXf978mlGgdwwkR7WaK
	RsekqUUu+OfDVYqVcLxhCzPmglcmqQCmp403Y+1qM31hoYIulJscBbkgvkHspLCT9dZ3ukn+Y/L
	+7AlkxNXdqdyMtaI/dDJGALa5oVf+OY//wM9w75ogZLMLulU968qhrX5/ybDsR2
X-Received: by 2002:a17:902:cf0e:b0:2cc:fa08:eecc with SMTP id d9443c01a7336-2ce9e9a6f67mr116750585ad.10.1784010514891;
        Mon, 13 Jul 2026 23:28:34 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:34 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:10 +1000
Subject: [PATCH v2 03/12] arm64: dts: apple: t600x: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-3-13fa78873121@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=679;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=V+frO5wk0tnXRPBZHabpKOBw5u16aJAV7l/JMbUCB+M=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xn2GO+oUtwUPDfxJPsqHbZ7FXUVp91WfJrde0vt5
 EyG21zfOyayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFN9s47hv8ePw0tWnA88ztt+//J9hQ8JR3uaCzP41+9U3qSToBzBkMvwV3LThsY
 372YILlXN7Yh+XRF5V/FY3uZtOusY7F9N2mxvwAQA
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

