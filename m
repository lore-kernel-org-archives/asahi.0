Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B65528641E
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258208; cv=none; b=CSkeWy7qDDxkyv0M4TdKMR8Vqo82b+2a/SwAxriASneRWF8VOPYCt0n1jUk+ICXSY4baLuEZRwO7iAB5y57Hv9Sfx8zSB0qEGX8/NH8H/8VTqd4yoQ5F4fWiwpVCVQCbAzWOr2ij3tUw8JI0iPLUr9xt0yp3m1qrvdPJUlVR0Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258208; c=relaxed/simple;
	bh=8i2WC0AFNRoAyJx9LwHHLdlMc3fQP5/vwmujapLLxro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XTbSrtYhkFdmiIV2IwmFZ13oKKm+yEWuX0Sg3jiGep96atjGFwkJOhfq2lZaw11AvLVQ67dfIOmrNQJx91jg4KE8EKVd32bhLmlYc+5V39W0pnb33Hr2BvJacCOQpedc5jCxQLrm4pdKPZwNijQgACmPizN09sapAnZFAMOLKGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnpmkLDB; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnpmkLDB"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso15255911b3a.1
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258206; x=1767863006; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgzrS6iAvFIUlLKBejM9CRNPYbscxZNKJWP8/12+9Yg=;
        b=JnpmkLDBV12Y/dG+z9etIRY9WFGkwKKLdsUzSKuD93OSwsvdOhjDKVMqbgkUdqEGfe
         z8igYUA8wr227hD2TQPkkmjpJs7v7DgTHJKRQ0CCclhMZocbmSPqBWeGrPyN/IIdVMhL
         +HlQaKrGcBN5vBv5Cejycw5VhWTstuvF/iJft31iBTrsnQvQtLvNg+qK4kupfrAfXizk
         t6qDntSUvdG8OJstsrTnPm3a/ypw0OYVM0W1EMY/Pvfg5nyBfqDMRDOkEnuQnRDjXCD/
         IdXc/lqenv1lcQAsl3AWwbZ0fxFSdijRZf9LTaMSN4KZK9HUIFbvKlTBQDc44wmOiKsw
         HSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258206; x=1767863006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vgzrS6iAvFIUlLKBejM9CRNPYbscxZNKJWP8/12+9Yg=;
        b=of4pq7FjuFPw7SJ5KeYbS/VALCndvKsU8QY3PiuK1r+ve9gV9CnAWGS7eCN5tP80RE
         7ENAyptY9rDHoCRXF5LwBiCuAEv443g79DU7J3KQ4GkRXnb4V84KUZxHHuzj7FzQ/2Lr
         oz2mB0jJ2rotkjzoxeamwEhkiYOVHlO6fRFU9kLlSkAmWWTpkAdOST+YXWKYYozbZILT
         XGUob7k4XY2ZeQFt3XHJYNC93lvbm/4Las9GzNGx0d6MAoLUbhvipW3JOQKBRX0sT84v
         ghB2pOOawfCZysVHvQEc/lLhPxwfJLICuCg7btzH0Ii0Wx1jozj73+DczhnWh4d4IURO
         AZQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ6Taah+ffJoTo7FWbQn7Jddaq1vF2c2VP/uzIxc3RYen/uSmxJ5p2eWQRgWlRzyvx3kLItQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YybwbA9a4+eW+iF/+iaBwLfgvq5gXIIXhgtzlRlvhkRHyWAiK+2
	HrJya7nN6WPkipi5vu34UHRqk1nxIGI2fFT1A6V0RSyaH8Uy+qa1n8yD
X-Gm-Gg: AY/fxX5PfNdGFkMksXPOd9YpWq/nYH0n2QRawEvD6nB+kNrD+4s+mR7CqHuK4ydcpS/
	oaIYHnrWskNZ+hakls6WzxW295uxJgx79+FXvNdEso7zZYCA7BXB72mhaKiaVetD7poL/v7PsdP
	xoTZa9Kz6WgOmzymRKdOK9F0JF1laRDfctkNlKqVrBzhole8/Nwr/6ld7rOvVRyT3SgeL+T5A6+
	gtFhsqZvYQVcARWgN9y98Uro3uvRHBMoAtu9pBeprE7Widst9eI0oHzQnC/m/g8gAWC/8EWivEe
	j07Y2BseLdzdvLRKWYZ1nKTZOYzkhXpzZ9+WEXohRG8BsYnOuGe7eBPEvKpUAJkyIDtZd0V7D++
	Gx9ciia5bPKWLjIPv2Jb1ZLc1AhuZYcJ3xHvIbElfgAZynu4PE/F6MqD5UQdipD4blxGHDHW0C7
	HGgJ6XV4KvtX4y
X-Google-Smtp-Source: AGHT+IEA8A3zig71SDu0G7W/IVJ2/rh1z0era57GcwjPTkXa9sJlf6YO/DffuIhThSfawYNdiguECw==
X-Received: by 2002:a05:6a00:ab09:b0:7e8:4433:8fad with SMTP id d2e1a72fcca58-7ff6667b6d5mr37774388b3a.53.1767258206449;
        Thu, 01 Jan 2026 01:03:26 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:25 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:51 +0800
Subject: [PATCH v10 15/21] arm64: dts: apple: t7001: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-15-48812c529ffc@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=946; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=8i2WC0AFNRoAyJx9LwHHLdlMc3fQP5/vwmujapLLxro=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgoOPfHtMsOAsiJKy2RAlYxRutc4/IfGlOpr
 6nSyF0xe9iJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KAAKCRABygi3psUI
 JB3PD/9pfTa8LS1pIxQ2OvHZ5LKbz813YPJzHm97C5F2nFhIHy9H2UmYu4wBfnwSR60fyjGNfvn
 Ck0ncncFeFSNCllr+Tr1e/s2b6/BzhncgdjrCxuRfe1ip8rs4gbv3GICpHKa7JgFrfaoUvbjoLY
 X8nMbiOnVEqVsQ1oIMAdB8aiT6On61YHrRZNdt9Vp3JBw4fVZfn0G48JyyCsaNdeX7+zszZImoW
 +e49+fwpaoLD0XEvwK50ej3LScCvFzeC35qf1/THnDtt/Cb4oxenYY0ewKKOmvI3EHUikOb5fgl
 JmF6OBsESH0/lwe4Bqc7cvvPb6IC678xurUSaQN147BDPcIp/2W4iYSLJGkmzRiUnTZsyksfW/9
 Dv8B+r/cgzkvukbptzOpAUrpQ8K5ze4H+nk9Cy7p01PnJwdamIgsL2hoKZQuDlPvCly/1MVy0SJ
 Ths0xtEiSMgbfiEz4I+9sfExwgILd3uN7IGq3+TihpjMzlwaolYTc6SG3oY9w0JA759dqDFn+0u
 TRf4yRqLfyKN6lyWiQNnix9YtHmgsdg2KoVwr3jbDBCwjaoga7mvUg9A/ecJWzI/WG2Nj0vpho+
 tw+PLoDNWPpBGibqADGwQk/nhVICclVHqfRanZEXI38v3D+Fo+tZdvHSBdCxbc9qyliv5IL7VLJ
 35egjrAeqTTyliQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple A8X SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t7001.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t7001.dtsi b/arch/arm64/boot/dts/apple/t7001.dtsi
index e1afb05423698223ebc15f2ae347e73fb46c7c24..b62122ea40f00a54ae42dc3cd0f864f25888489c 100644
--- a/arch/arm64/boot/dts/apple/t7001.dtsi
+++ b/arch/arm64/boot/dts/apple/t7001.dtsi
@@ -275,6 +275,15 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,typhoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 75 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 78 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 81 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1 &cpu2>;
+	};
 };
 
 #include "t7001-pmgr.dtsi"

-- 
2.52.0

