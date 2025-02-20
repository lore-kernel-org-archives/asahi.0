Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678B01F9F7A
	for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740054164; cv=none; b=TUfRdh+NmdisbN2JDRPUdMtD6HD3nq+Iya/ttTuN+h/we67HTt5UkXQVkw7nr4aXtfu+9NX+6fbU0NrHSkmoM7tGRbyNamIpyqtqUtPm4DU6sEYxk3jWQxDDO5B9fT9YBYiZBttwXyjyRT48GdcOcXpFeWvjoSjGvG/IEelVYiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740054164; c=relaxed/simple;
	bh=Dfmhksd4L1Rm6h/PJVjQgqmA7UT/Za+zMY19qrFBfHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TWC2oXGcN+Q3URaF/dbc3yqgJim7JQ0EwKWEqozBHcVfAzi9u+WAOF4AyqBVPyjT574aYEXZbatyoffSzwjK07EeX+JrH/au/UNvQiyVFlEcZgxYyFsZMFVh/suBuKzTILVAnfPYVRfxJ2kF3jwjCytY1r7b1DUCOea60bNuCW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JN1SKp73; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JN1SKp73"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22128b7d587so14387975ad.3
        for <asahi@lists.linux.dev>; Thu, 20 Feb 2025 04:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740054163; x=1740658963; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9SN5Eoig0xDKhvB9KRORQRZL5RX1Z+GyDwaupX8zwI=;
        b=JN1SKp73stiNuquL5KR1bb9cnicxHsx48IqUKyrP3r7jsKd3tGmUE0NxcuwumQ4g1w
         qfwD/uVTAdawdK9Lwk/h6i0d+60byTZb3JoSXnlhKXSv/VssLMsUK5eF0VK9kTwX4Ing
         mIIKIpKotI10xJHIYg75eRX6MN979YgnEgp7Pvd+NkLgNyKFSfhZ3hrfitPTNK4RZqqb
         hP2ajjNnLlD8H2BOYGhfh41DjETxTmCQ0xrKf3LzwSecQowa5R+d0I71Ni53VNmqjxKV
         9F1bPS9IwhR4sI3ekHQ1RbBSASH6DOhtgxMP0hkEFZZV5xN7eKMX0Pla2fr2uXh8Edy7
         j0ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740054163; x=1740658963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9SN5Eoig0xDKhvB9KRORQRZL5RX1Z+GyDwaupX8zwI=;
        b=dcWYatsUdlPdK2c8lNg1wSaWQKOynjJY0wP9/J9dhxLWT+w2xW9oMtwBC2LfA24AMJ
         AlbGOjfEyync7Pgn/4iKa1D8ewK+gZfX8a3EELG5YKxBoPtm4x2OoaZ8JxdMW4FGo55N
         81H7jJ7wtWN1BHQa3x0svytzWhgv4ljDojfqM+4i9oY2e9H5cP1nXovyn5oFHfFb2BAm
         5vy7JJ1a0c3XVlj2ihAen1/cph6BQmwj1cYhvKhkZhQYaF8eKAQC5QWtZtkcODN2VckH
         rXcItM6NstPmXmHm4f3IJa7wnYPhtZdlnhl8l561M+HGSdN0DiIndMISn9P5g8tlfyap
         bCbw==
X-Gm-Message-State: AOJu0Ywu/6aUKdKyDGa4KlRnx4SQ4wOuxM33Pbd5cvWdNkwoiur2yg8C
	D2X5j025pj4i2jDSZmzGwKsp46mENDgrl4xJUmVUMrrkIom0RQOz
X-Gm-Gg: ASbGncuzeNjNYAWkXWGnZw9ZByKO2vPKphsWGBLilZinc+k/JXeLWknmdFs4BMduVYO
	RTxigW1PHsvJ+zs9ZxIfVnzftYmWhIhtfv4QJy7aUgMfur9SmIJfNfK3EpDY/1qr5e/yEWTPX3L
	wCiPWxO3b8pebfMBxIByxKuwEmWsIt0YQt2CsmfP4hrjPyMypxT3z5uesquPNHNSMqQZoV8fHp2
	6RWU44OVqtIItWIQM46UHbFnTJ6Yn62faFNgPe2UD4+Wt9TrM9nAxb6ptPkaZAkjcXXl0NEfIq6
	QjTR8r5045dSDos4xw==
X-Google-Smtp-Source: AGHT+IFxQ4Ivq08K8LrxIkk5hOu/VGJU5dDZWvlSYladnojjeQ5WKVi4wfPpJBQPRW5j1JaNBUrmfw==
X-Received: by 2002:a05:6a00:1405:b0:72f:590f:2859 with SMTP id d2e1a72fcca58-7329de89652mr10240013b3a.13.1740054162588;
        Thu, 20 Feb 2025 04:22:42 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73242568146sm13653149b3a.47.2025.02.20.04.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 04:22:42 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 20 Feb 2025 20:21:47 +0800
Subject: [PATCH 6/9] arm64: dts: apple: t8010: Add CPU caches
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-caches-v1-6-2c7011097768@gmail.com>
References: <20250220-caches-v1-0-2c7011097768@gmail.com>
In-Reply-To: <20250220-caches-v1-0-2c7011097768@gmail.com>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1352; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=Dfmhksd4L1Rm6h/PJVjQgqmA7UT/Za+zMY19qrFBfHE=;
 b=owEBbQKS/ZANAwAIAQHKCLemxQgkAcsmYgBntx5+wn0P0SXuQNu2JS2xVr8rjG8vCoLlcQzwi
 opsrQdgCAWJAjMEAAEIAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCZ7cefgAKCRABygi3psUI
 JEL4EACAPtlVi56MJnkSWjiiuqtsp4bsgyC2CktAZL/zOwsaKSd2Dn90xh3+V1FfNcE5TYiQAQF
 yiA+2GxSaYsRXwLtppeOcOy7c4kRz786SjO0P0IVCCvZdSH2M5v1p5E0qV2i/FYCjUFrKoEdu6p
 VqHZ7kyEkGYsP/kC3k8IjyTX/qGkbY9rADnqCTkbhsVXIPXxqh5g2H62JHzGBzre6Z+K4A2HwWX
 oDNeff1Ii1L/VKU6OUrWw3v0K7TLsTM5Y/4oEumBJIhQ52csRqK1RJRBVCQgOga1sU392gi8gJr
 CbqEOhJn6lJwWPEvfktgbcJZ0Gjl/CqokvZS5/1R2b6Q3MqWV8A26pX6L8sB0WqePolyLE10f+f
 brZvtDdDkpKWZjP5UiksQarH+u1XHUlOn0QHVsviZss08665e6Jro5RNqzwOJTgVKpbwcpGoJdu
 GEEJ4zH/MUWOWf6wt/iTN4aHb8Ut6T2cBwFA1ZB1JAxut6guaBAOou+KcjcB8FHw54ho9XvkPUQ
 a3WKAzu5ZuzLRu6kc8wOny/DtET/ytishoRxnhn9QuHqh1SRHkLWyTeJZAL6jgaSlQXCFr0xh9O
 6H7FrEKfXjcOVUbq+aKNPitMObxHRsG9GIIwnfpM50orSS7+WptaB6olYcmA+J5Pxn8YBofQY6h
 KMQ044wHohMUA/w==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add information about CPU caches in the P-cluster of Apple A10 SoC. Due to
"Apple Fusion Architecture" big.LITTLE switcher, only caches from one of
the clusters can be used at any given moment.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8010.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8010.dtsi b/arch/arm64/boot/dts/apple/t8010.dtsi
index b355d443ee476e7c98b352470e3b1b5d0fae7652..5d24da52cf255b6ad211d2ac40aad75a6194d595 100644
--- a/arch/arm64/boot/dts/apple/t8010.dtsi
+++ b/arch/arm64/boot/dts/apple/t8010.dtsi
@@ -36,6 +36,9 @@ cpu0: cpu@0 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>; /* P-core */
+			d-cache-size = <0x10000>; /* P-core */
 		};
 
 		cpu1: cpu@1 {
@@ -46,6 +49,16 @@ cpu1: cpu@1 {
 			performance-domains = <&cpufreq>;
 			enable-method = "spin-table";
 			device_type = "cpu";
+			next-level-cache = <&l2_cache>;
+			i-cache-size = <0x10000>; /* P-core */
+			d-cache-size = <0x10000>; /* P-core */
+		};
+
+		l2_cache: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x300000>; /* P-cluster */
 		};
 	};
 

-- 
2.48.1

