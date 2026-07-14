Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22BB13DAC13
	for <asahi@lists.linux.dev>; Tue, 14 Jul 2026 06:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784010508; cv=none; b=IrOeYe2tXnUq8okCLeiKMglcVwoe1P+E/TlpTEqjXY7EBJGdEs2nBO6tO7qKa33j/R+8MIfK/hJ1FsqVvL8c5PHeQ6D1qlNKKhOAg/nrHPI8GTNZpbA4jV/mXmODaxhc2y5hk6E/cCuOwjUA+5//q3qFRXJIKBlUZaKuKHFfUtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784010508; c=relaxed/simple;
	bh=sq0oGjxu8DUaLVwSPszvX/dOqwJtPWCsVF3V/zGzKyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tK/5xtLcmF2FKwoOjTUA8X/gQUfzZaOhQvEUwFuCWeZpXgfnVg2O7oEQ/RYWvROc1l0N/OKLDjYqY98vsGP4uIbNwkf57xKPo4imi5sj4idVLhkL9iUzm0Kp2KAqRQg30LtXa8onb9Y9wHcukHnfCBHNf8HrNZa8s6ZaO/qT6qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndtt0rkx; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndtt0rkx"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cedda2ce6fso10470935ad.1
        for <asahi@lists.linux.dev>; Mon, 13 Jul 2026 23:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784010506; x=1784615306; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gfyfU+/y0VxhZvR8biEYcxwDSiNQWNWT41U3UuYJlHo=;
        b=ndtt0rkxdVyLviUFtOre3LGuAJjMrtu+3hoBlEvuVahdz/c7pUJFZXp3xzuWKV9UI+
         3Sbrjexhq4I4VwwccMZd1t0GsrdxkOklImLILRl3UwEiB+Or3Cz8zOOF1Kg9dOyw1cp+
         p0ICb+MR1RiawfFLol9m/7N8qd0cm2LX3bm/A4KGuGeb1gO3o4qLmJubAN0IlrWBHNVH
         TUD5Oxczg7HNtSkKZ239SJon4tWf5xZfLgXKl6GCjBZ+aVhVqkEtlytMVhir5nyOJPjZ
         EGjpUzGuG69n0QH89hHXvBEiIIlci1t159QhQ/XOoRdVZKfQMopyE0grQlR5YTjNnzOF
         Uu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784010506; x=1784615306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gfyfU+/y0VxhZvR8biEYcxwDSiNQWNWT41U3UuYJlHo=;
        b=HTKxkgqr2eIcTtrEU8Dfqo6AwIluBUcJOysvag8QaPM5quU49vZfoD07p9innIYp6S
         L12pvccA/+LqEjpKerNzXiOtujtj9OxjGPtuy7k33rRcFEeJ2cVdqDLWaGlckogYe04T
         3r9BlSRh3X5k9AvnaGtANplfYus6XzWo0nYmIebj/LH/i68rlWWqgL8Yr2I0MPPMoXo1
         7BgAyheZwAaBpRKE3S6h9nCF+dcYsTpfEJ/bm82+BdDF+RT2ZZcQq6rmJ0Id5h5rHFWC
         wZ+kCQzZ1giFpuR0jJgjuKnmXPQn22X8IfLjKbkFczzOMXmDY87nBz1g+WE8DrOC0qi4
         kndg==
X-Gm-Message-State: AOJu0YxtkP6TgMo8GFIWH3pUy7Xct+oQXdgRaeeuwewvpwSJPyH9t+eU
	cpdQetg65NEkk2H3ekb1i2f+n1OXnA9pE0QSLUtZZCE19JMyJuu68ltF
X-Gm-Gg: AfdE7ckW8aSR9FEzAg8fb6bqom4S9x/uu8y3VTsNmYn+woHWClmrwYjl5O/d8KmVOha
	stjxBAKz8uo5Ze0w+RkFS128Engr9Nw+bWFN/c0oF74ApBlfpWdqvyIZNPt1hPGPDdAIq/zZjH0
	G3KyVGEcUdcDpw8oP8GnCCr/Ho+r7ZqTWP4ibo05SDLR0vZDjUrsnrjHSig8n1nHxx7wo8qp/1H
	jpifwZags6GsxkNRkdGnoq8IAW214srXoQeMBpRNTsQicov88TWnfC8obmUbMTtg5/01+1+kh0o
	CvbPdvj/nIpgH5xIF8rk2BpfErawYLSpLh9qrR0C3n9uhAxjlO9UrU2ZyH0RroHR51QrJVdOpeO
	FfASSxVW/rQdNqt3szaW/56sNzB4/jZkqijTesnMcEKDXGcSce8i5vbYVb0SVaguED4xVTJmvif
	rUclFIXLBYyIdKzV3Kp2MqMxzA3wuy7VDgqzZrKgt2AnbPDk9k4USL8MhIahUOcBnRKngxZltrg
	Vq8IQD0dwsZQQE5LC8nlsIJWkizZD9cpyFMOeX4oOOY0oU9cgZkTF8ydDN9Qv2f
X-Received: by 2002:a17:903:19c8:b0:2ca:feb:303b with SMTP id d9443c01a7336-2cef143a620mr16315085ad.25.1784010506454;
        Mon, 13 Jul 2026 23:28:26 -0700 (PDT)
Received: from [10.160.5.76] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc99cc5aasm110915985ad.0.2026.07.13.23.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 23:28:26 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 14 Jul 2026 16:28:08 +1000
Subject: [PATCH v2 01/12] arm64: dts: apple: t8112: Add SMC hwmon node
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-smc-subdev-dt-v2-1-13fa78873121@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=664;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=sq0oGjxu8DUaLVwSPszvX/dOqwJtPWCsVF3V/zGzKyQ=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmh1xkutbk/FTnXe+Tgng1itbe3P5t1Y8/BwC8b2qqtD
 vAvaw7a2jGRhUGMi8FSTJFlQ5OQx2wjtpv9IpV7YeawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyMdYx0jBi5OAZhqXglGhuMhX8uW+zLN2dF8VGnDs9yCx9/LjRXXaFydLneQe9KqS+qMDJeXTRT
 9o5fgYH68pe24scHiyhvcxYdzd249UzrfjaNcnxUA
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

