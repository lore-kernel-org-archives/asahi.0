Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BF929B8C7
	for <asahi@lists.linux.dev>; Thu,  1 Jan 2026 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767258225; cv=none; b=Pj18abv6yRTrr3yUlTo+kEMWT4/C+NyDpcEzxCAy2IR93xy/PK0BQ024OlYquz5uxv6T1LGEagKInzdMLJ8FgEAeVjZkc0ajjgyxjChJvBl6aGLqRh11r06bSxZUhA+c1W6YEYkywFGtq+TtVAvnNa7BPqhJuy47JlKFOQ7r0dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767258225; c=relaxed/simple;
	bh=2e/a3Ds8H9o2DJDRhuOCh9X1vWNSB/53Pgczil0A+/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrmCTr+4YvI4ziUHToifKkpNKHi3yK3YVEz6ch/9JHMSPcnj09ugXixSMDaQNRzCXtHH6rwNpFQM9srsfwZP4IuesxRRLDv4d8OZFut01MKyTHYiIJBnKC/IyXJwpEdQmbPQdnuGDzo08/mbNRaWFE9eRls8T8AfQwaueMaSEL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCz60JZI; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCz60JZI"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso15256057b3a.1
        for <asahi@lists.linux.dev>; Thu, 01 Jan 2026 01:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258223; x=1767863023; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XtdvBMU0gKAhP5ZVoa0pl/xHY6lC0zNp+vmjfClAxY=;
        b=BCz60JZIoCWhKwwekgQovjd3ZUmMMaUT6FLDP0LSitv8bsn3KcF9CFdKDo71f7qShe
         uPFGYIOvPpXMnHfecRFI8lGPItBuNzuLTuG+M6ZE3YKC8JnSUtX+rg6fioXnuhoxXLF3
         CuDaMxpv0Uqy687f8vwuMA1bWwMeoM7CGG98S4Y5Jkor/mI4ExEdn1ay7/Z+jFfNctbT
         VRZ8GyPm++DCv1NVWkjBZMBVFH6ukycLOOEwqjd3l7pijqaxDc0B0/LS1cONqgQhdTbo
         0iLOBNQsagMHKQgtma/nABNEgpZHNiMdL4dcsx4mSkoAjrAUO3OvxlF8GsOwFVK9YK1M
         KFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258223; x=1767863023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9XtdvBMU0gKAhP5ZVoa0pl/xHY6lC0zNp+vmjfClAxY=;
        b=FKXTavxB/GCb6t3fwDC0QUR0yujIicRJ2z7BlfkO/jWcHK/vcrF31oDbpSdEaPo7zb
         iDu3AL9DkZQKj7z1ojO0j6gwbKPKMJAoN6M/hRsaykC5JL2AOP/yH94eG0XNFkpLscrO
         TUQ+pZKAB3TH3OWXS2xL3U4krwzpzrBQo7GqOvbGDF+UqgJN14kU3LBfYCGzCp/YDoIR
         lieWrUY4t+Nw5hSkP8aiwP4UxSMJf7CC1TFNBSBxmr7G2YZOqyWfS6jQeTdto2Fpp80r
         e/cAa6RZj0enLKm9BmDLNjfNDHb7MpG5cNdhuPdtaIPZxUFzDb0j0HQBHc0NWNP8j8TL
         qt+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUx8iWpY4xQ3Xws64RcGmNey1YrtwmPIkKVEZ0C6ApvZjbRC0/CIKM1RFMqwAVRpGU1ctnIUw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywqv9OMklbC8PyAzqo9QeT/KZcvMt6mXn7PnhKpjXP+UUJAJz2V
	ZNGxvzfKxGbot+qE/lETT66gPuPRTBIDZKsx/Z/ZCr9O4GVCWxzXUBD0
X-Gm-Gg: AY/fxX6uu+t4dfKKcNFGcMmq2s1psiu6atYLpnm+YAk8w1jMN8/Ooj3jGA9Qw8pVMT8
	OT8psWeRzLYOK8sIA2TTLqpTlCqVGnK05BtWi2+AZ8J6HFnqJNmubpzy5FmSPcogPU9RFnUb4wL
	C1IpQ8cZnxOAD8dVrTGMvm2tYjvtLQ0+gGDMGJJL1BuZxXd9vfHexPR41wyWJGadc8PCgzd9vNP
	8j9O6VHW31hzo8pBBGC3ciqe+SQ8hm47Qtkacty6sLKjAB1033WSdT8YTBXlHykSBHWUQPpH2Vp
	B+q9PpUqLwHgk59mbbJprRvr2NGLSL6YPUg6jpmJ/NBhB9vlksFff7YkjsUO4DOjDkzyn9HWi3c
	IR+MimN9tUPQf+6mhiSbn4YMhlRNlzIgOo7P8sCea79uDfsyk3YcaMQvztIphQmI0H/opnj6hCV
	wCvegisVyb2feM
X-Google-Smtp-Source: AGHT+IFPVSjDn35If4JJdkAPCWUwApX7FF/dix6EAElR4Vim/M3LWWrzlOgnsMJu8g8CeCTO8KTRsQ==
X-Received: by 2002:a05:6a00:ab09:b0:7e8:4433:8fad with SMTP id d2e1a72fcca58-7ff6667b6d5mr37775009b3a.53.1767258222975;
        Thu, 01 Jan 2026 01:03:42 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:03:42 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 01 Jan 2026 17:01:56 +0800
Subject: [PATCH v10 20/21] arm64: dts: apple: t8012: Add CPU PMU nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-apple-cpmu-v10-20-48812c529ffc@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=2e/a3Ds8H9o2DJDRhuOCh9X1vWNSB/53Pgczil0A+/g=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgpmSOXQD6QVHUKQIc9/wmCCvSC78EgImcU0
 Scj4chLGH+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4KQAKCRABygi3psUI
 JKn6EACn3FwPUsnDwR26T9WGHQmSa56fVTYQz4qnaN0v762/bzKhEjyrbRif0DKEHu5nuhSjqD9
 K92s/a5OSvOdIUMek6dSroTK5+w/Fnpe4lYbW3XjOZgVi793XboetGLP9PSkvg+ec5iDvrJ+qJE
 rssKT+JHQH+nDD25xn/wTEbZM4wBmAgZrRbeliA6U44Z8y3pYcRcof9GBGaQhpj47QDJVDm97sB
 nWz4qWxJvBCoxeUJA6xvvbmKdC0CTtVDAh/1/pt0dEpQNvZxmqP5xoZ7LypgZsLUFJvVP6V8FOs
 FLHtg/0PtDkZ+wHehmLxRgBi7Sqw0mGqCpgOE1atAFOWH9f9kmjHSMw8eCAC3C2ZwCWQfWmONQZ
 k7pqZL6xAWI8YMwrAJf3iQrRzQqUjAd9W/EyJRCJiImh/IDywKXboA+rtWH3lVuSH0N1m4iJjld
 nNRTNgDfvcw7yLzawkM1zArnPy3s3IdMou/x93oTtmAKsoqFJt4QOxFw7YjPrSPfdKo/89OFSpM
 zTgfms2XNyxSDYruE9M+bH3mttGKIB6xU6jvd94vdd29KqRKwdScwqRfnuFhpFgKlhAx3G1pEwX
 gUf5HSVnNirL0ysxdAff3Yfy0MkUy7rp9FPDHfZ21MgZYIVqWa6FPWN+ziZBEYZy9rHwSgzh8qW
 E+aytyN6Uc6xWFA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add CPU PMU nodes for Apple T2 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8012.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8012.dtsi b/arch/arm64/boot/dts/apple/t8012.dtsi
index e7923814169bd4060706945561910ed1d5c2e0c8..579560de1aef8c311cbf66c60a2111e2d5ac37c5 100644
--- a/arch/arm64/boot/dts/apple/t8012.dtsi
+++ b/arch/arm64/boot/dts/apple/t8012.dtsi
@@ -297,6 +297,14 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu {
+		compatible = "apple,fusion-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 86 IRQ_TYPE_LEVEL_HIGH>,
+			     <AIC_IRQ 89 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0 &cpu1>;
+	};
 };
 
 #include "t8012-pmgr.dtsi"

-- 
2.52.0

