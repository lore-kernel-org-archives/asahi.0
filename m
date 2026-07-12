Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5941239B959
	for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849456; cv=none; b=dclitIE1QP27OHivYj6UsGyAZUq8bCTkUt+rNxMFNxD7T2ROia+ivSQ/rOl1D5apPsOTi1itu1j9y0202/BC4tVXkIDfdjKHhHFu/sdl7wKKkmt7YhyyMQ0vMoTezP5gMneKDdx5jEhE30Bdx4+QYTqusjrFI1Euo9LMhzz5g00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849456; c=relaxed/simple;
	bh=sq0oGjxu8DUaLVwSPszvX/dOqwJtPWCsVF3V/zGzKyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sW/T8UDqB6MXDl3mSEP+0ZD9nBxwkvRtV73FN3two5IjIAjAOMhN3wRcIeY3QNEViyNlC2bOITzXgwNW1uXEmxC5DGsKBMglIry/UHzAzBtllRQNiLHxQ+7iLkKKQfngLW9/QRl5S7UA/4AaPM4D3LsVUqO4nvppfmK4ri7CuBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1hioAFF; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1hioAFF"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-caf45fc5202so1723a12.1
        for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 02:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849455; x=1784454255; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfyfU+/y0VxhZvR8biEYcxwDSiNQWNWT41U3UuYJlHo=;
        b=k1hioAFFUVcrCleH8n/9eFF7gDHYML/9OH2MKm7zItULTjusjV1ctAuiNsikho1mq1
         5OmwmUX3vaEUQD9hvrnjSXyk078SE9LmguXCu/29k0/S4wUP4gMaq52lB8tPtTF6O2PP
         JEr+facFu6QCq5G4ALJtcEXLzfdm4YUnCivrmux8C823db86iWDAZZdsa2JEHCYeGSgC
         ncLJPxTxHwahOi3XTL9NKlFTPmm+sje7fkB+z4m3sZlOU3FL6QFi/Tv+l7fPgcCLwbOJ
         azv0GGMcv95/xMFY5BiJgBKHQT2o+H4UTCKDz7O/Yw0JxIFg7RXUulDWnov6DUa7HZ+F
         ir5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849455; x=1784454255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfyfU+/y0VxhZvR8biEYcxwDSiNQWNWT41U3UuYJlHo=;
        b=dpmiHipFb5CHx71+Pf0PcjE50UAjA/X3Qj70nuT7FwK//AT+bezAGtP9y4eGFD/3eA
         1Cy2oxP2tCm8eXENVwWm1lKn+jKV99PjcLBuXeZOqXeQGa/yX/tKjpL4SNQwU/6FuCac
         9S7/jC1eeebfkNwrHSY5q2gTana8rxeM7DNPTaJ4WNudVN82JOhNmrz58sRnBzb1c3ty
         nTQTe7UmRSOfxg622cRnaw6tHcz78ps/mGOk/T7FRIbV6Mvyu/CeCQqbs7nMrzvZHEy4
         ixUUJjxl7sSjCPlOlDDVbMt4jAgZMKikXNKnIHa4fGsoaSFs3ZY7GEiXyXYGekpmovgJ
         Rf0g==
X-Gm-Message-State: AOJu0Yw1Phh3W+LFLs0iJA7+B19TBYYRQizznBLxtXtxQpSPy6BIDfeA
	XGzUnAFIpOfV4QcZBB/UHDvkqO5fOWR31HsWJCGphllskbQMRrtMVtgT
X-Gm-Gg: AfdE7ckipSDUv7oeTsce83tKQ8QGPtuAUD9b3JPwzDefLP1V+SHUsEBEMXCWqnKDC8P
	lmCfxAN882584YQKSItdyAVkSIOu4t3GZHKL3qdYMUBQvMVyuPA2urnXmfN+A0ZkzkdeK8zxrZN
	XcreT48EFhuq+PjEIeU+3T+gQd+Ff289dZPdsJ5PC4jbpML80QUD+T/zjxzF3J9+vL0Qq2CXRwO
	QshJci5eWdlzrRWC+AehqVNY1n8eCRqM33CP75zomzlxpU+9HKlb8RlO7i/ObvwmlsfVVT7iCy2
	r/fTvj7eXaz0eAlgVNE+K6tmeUyRiGD0zgTZaQV7+3mXw7X4ogckjzU6/otHtd4Vof7FcOaw/Vn
	+t8yyk3PN8Ns9PLfaBGBIFz4FTvSquI2qHw88Kf0f5XOuuPld8Q9V1NLVdGvg7A6HdDATojno9X
	lohQMxcDt4K3wdezGTD2LjNJ6aROxgsZ/bT8aZf8i8l8xpPp3DefnyycfjZClJCiiYUG1vS0Cax
	mjCimqD6X8pHgf8VyGec/Go1/z0/r5zc9Ut9ifBWh6IM/LQQuCFdLsBNFSqRizn
X-Received: by 2002:a05:6a21:6190:b0:3c0:9c18:d5aa with SMTP id adf61e73a8af0-3c1111a84f5mr5649202637.71.1783849454701;
        Sun, 12 Jul 2026 02:44:14 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:20 +1000
Subject: [PATCH 01/12] arm64: dts: apple: t8112: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-1-7763006d57c7@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=664;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sq0oGjxu8DUaLVwSPszvX/dOqwJtPWCsVF3V/zGzKyQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU/cxdwM6t0N38k4zv9fM23D47ntU3dMCHfqMeaKn
 7Ft2vVNHRNZGMS4GCzFFFk2NAl5zDZiu9kvUrkXZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx1jFi4OIUgKk+HM3wV7SNK7otQuGPhYOPrKNpqhFL0r7pddmGMYvVnDI3ytwUYmTY97Jiwv0
 n6xgfppQrTkjdVxHzfWHBxCkSrxuvN274tCOQBQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon subdevice

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 85c47422d4e8..a3241c816c26 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -921,6 +921,10 @@ smc_reboot: reboot {
 					"boot_error_count", "panic_count";
 			};
 
+			smc_hwmon: hwmon {
+				compatible = "apple,smc-hwmon";
+			};
+
 			rtc {
 				compatible = "apple,smc-rtc";
 				nvmem-cells = <&rtc_offset>;

-- 
2.55.0

