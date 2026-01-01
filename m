Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F17286D63
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258211; cv=none; b=CLBJUbPlP+Z7dFrwgMijlbOg6gwloNtn/3EQIf3tMyB3WyfPlWerq6C+3mZpC8RvPLsmNyECE7TQqH9usCMfWbawr1d6OLIYbSR5z0U6dzvKAi8kuQW0hVAtDc7I3kTVNJttYDkZK49XZs0gvTIpj6xVacbas83Ry2ObQ+Q4H9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258211; c=relaxed/simple;
	bh=3omd0YVrSktNDZ3RXrP0xc/+wVtkaIIz0927w9SxlCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sD9WNwHJw8Tig9pbTRVCeLM7GoSRRYSHrP6oidDeyfF+/mH0DcXYDwA02NrOn7SoxuPJ74LbXX3hSSWSlwr5hso1j5UZwSmPfpEuSZMsDb+h0e6B6JVgOpTrvWn7q2OVLieit8yabROh1CmY01LgABWrXHBX8B6OHmpQOGCLaPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GgBo4Mp+; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GgBo4Mp+"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso18067366b3a.2
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258209; x=1767863009; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VOOkO0Y8d9P2yswmxe69xUL0YHF0SsjJE29vdXLnWdM=;
        b=GgBo4Mp+v3AAfK5sM3x8PBq5QGtk/KGPxECn+uUhcdpQW7X4GXUTL//d1vfltMYoWb
         z5cv+HINM7RtN+4Sp4tC3gA/wtsBJoQOSUx6YkmIaB6nT9RRxata6GBdukKLTvSF/+v1
         YfEQrqU1Ddyp0ospnRelOjdSLzgt6vZpSI5CdAJlaq5XUb7YCAPIWQlLY6kSDyfMAB08
         r5cn+e24diakfCRKB/KX1Qrp4cVC/U+Zw6O3W4h7IgvABrWBD5PbhEMqnbftICd7BHoh
         CfTYhKElVduhZVl5vNH6s0FyIQJbXepdyNuCI026ZIjuF+rHeID8TUxyqfatITWC74AQ
         rr2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258209; x=1767863009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VOOkO0Y8d9P2yswmxe69xUL0YHF0SsjJE29vdXLnWdM=;
        b=b0IwWH7zLl9IxKhIqd8N3rcqs/5jAQbCyXjGmMiaolpehZuAvQ52eo8/LYJIUirOhX
         HY3pwWDIkLk5xf1mVZ9/U1SZfQ1l05irUS1AEwc6Xv+2UXICwEOB4rdaaMkEui9MXXcc
         Jy/VCIA8sRbKGqZAX1UctUmdY1VAtRutN5GWzi1oo0BVfYwm0a69CuyyoE1R+dVLq4BR
         VKNYtiBNKKaiyqigvKNF7rlAFju/vPvHRmW7mwFFOiL53w4QSwftlUOqJKmhvsf7+e2N
         hvAXbkhLnC9Ywal21bPAYHd7EC4G+f2GI2D69byfo2pPWhxmNUBKy/N3XoiC7EmYyEzP
         E5Yg==
X-Forwarded-Encrypted: i=1; AJvYcCXG+MVYCqMm/09qsI0tPFAVpXHEni3+mITAi/nFozp/lbZ2dLJB9kZdcBom8qzq7PhU6fSXEA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1azp0MowzPp+QtYGYlBYMwGaQbINSPJu65kedrVw7+loaeF1P
	f/RL7ujnx2skzXOBqV9i7ZgkVABkhyF65n0rPnrCbYNLcT2FB0yb6/ue
X-Gm-Gg: AY/fxX5TXNNmsYHxF6oX50UFxTh7Jj0NCMA1JfAVTuGU39PU5A67t7e4+9uMZl818ah
	xEc3s06IsPudNaB2IIBKAidDbxGGEF99X88K/23bV77XdOAS/BNZDyZuaJASfuiJ4fPjP7voxyD
	w0VOadxteNMRZwYDB8jW8EkGVRxrbvrr6I55LR5vWVRfdPYzNuO0E79x4bkSeU5gKBzT+EpGCms
	/T0llYpjsg/2EGQTZQmnd7qglrfNejZ8uU17TwvxKZaNr98dhvD8ZT1sxm7ZTuOI0DmwwANsR5o
	J0vMT7G3Wa02cFjcbL9oYNpnCLOFoWIgrhtkDw1AaGrwpbn2klOd/Jbxl/ghpfJ95rV+JIEUfAN
	3ltLcWS0t7yZHfg/msx/8N1JIOrK2RTMfF9PPGxEG2CMHNOW3JkXtfqs9N02T/N6uMzQwFaIQv5
	UqaTnAFbAY+ymqAH0XIodXmpA=
X-Google-Smtp-Source: AGHT+IFJBtSUfejTWgpNgQSoCDlIJLnAMjrQe0TebRz/JH0wlhP4fBgImgpnBrH6nBpvWNt011OSOg==
X-Received: by 2002:a05:6a00:ab0d:b0:7e8:450c:6195 with SMTP id d2e1a72fcca58-7ff66479a6bmr31930739b3a.44.1767258209581;
        Thu, 01 Jan 2026 01:03:29 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:29 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:52 +0800
Subject: [PATCH v10 16/21] arm64: dts: apple: s800-0-3: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-16-48812c529ffc@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=3omd0YVrSktNDZ3RXrP0xc/+wVtkaIIz0927w9SxlCU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgo4L8d5gWvdBUOBCVVb6ebQ4I+hDv/E1SUb
 kvSMq5z9Z+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KAAKCRABygi3psUI
 JOOpD/9oAMq0s34OmmAP01oVZU/WNedqAtueSymjOF5mohXEQuodSPtHLp4na/8PBkTnsdMaBk5
 qYq22cNUmGaW0tNNKzXYdJ5CHX3frqpUae8fhwpg2obo9CbMNAlxz0PbtaPxsJP/ZYmdb5EZnEV
 etlvvIBY9R6eWxQGZTZrH3TPf5gG724fi4G2AhurxVHs9c+O7M0NC51r7ElhxVuqEosrOERL8Gc
 s9DW7iZplLGl6hwLnS9hc/rJnoHP74o+IzBGy+1lQYWh99+8ReDPnFqJChy6+HkE7XyIVi6Wupv
 J7qy43MqWnYX0ZIPBrC29fru1OVTw3N00lcG8Zd72IkY5Rbjqtv9HFrF199MFT5UpK69u+8Ztul
 qghCVlwmGf5eH6uoI4A1O+K0u4RGx402evKOyJo8Ufdog+1cHk5ynjqX1GlQ7hxccCpmngmh4nv
 srzdvYX1pJ+LENySSHC506nt65L6cmeXIISvgVCBIzqpuz3boXCFsJrA3dVJb+uar1KQtimpf9F
 5HbO1vGr2G0kZFSjSchXVQkhoSgRG1TDLYRvcpMo44X0qpJ6peXtVlVaHJtNAP5I3Jq0OPuBPGf
 sKm8N0K3G1DhDcQHIX0DtjumbJPoo3NCybrEF25MHdxgw+f/vjL49Bp8/DesqujNDl882sNYrC/
 yo4itq/blz0kR1A==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A9 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/s800-0-3.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/s800-0-3.dtsi b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
index bb38662b7d2e0b70e18b6870b706789b1cb242af..aa372aefc995334b1489953c16251c8ff9b94d98 100644
--- a/arch/arm64/boot/dts/apple/s800-0-3.dtsi
+++ b/arch/arm64/boot/dts/apple/s800-0-3.dtsi
@@ -237,6 +237,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,twister-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 76 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 79 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "s800-0-3-pmgr.dtsi"

-- 
2.52.0

