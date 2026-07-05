Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD29E1D8E01
	for <asahi@lists.linux.dev>; Sun,  5 Jul 2026 13:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783257455; cv=none; b=flMFOZoYxExbxJSh0LluJfZz6pNlV+zEebQtYNG2kh3a4irgNYL5k4a+HStRzG2fENTQygu163PG4TWqWhXnwMbc5grG6/ADSdC1DXL8twVyNOUtSO3y9vGMjp9MmuImHhsW4E7rPDII49pBHny4lR8WUCYQuKx4rYVKMri1qzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783257455; c=relaxed/simple;
	bh=AtN45WrQIxOZVuI/t0cBjAnhziQKLGkfM4y61MbTz2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hdK9Hi82PIb8DEC6Vq8xlqP9IjbwIltm9dHEgAW9/FnSb4ZhV/QtvbaU/a5R6w7d7Hm5c8s/zuuJuOeA3bdZtkbldYmFSDrsDMQAisIpmdC05g82MK8wn77TDnX+gSgrkLyAaQYwgLWqeIbaPSfJSoXUfa24nSdEfMxWkst02+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=PZEQH3Ca; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="PZEQH3Ca"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1783257452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=afujMTjkfrhrqR4IW5B2/0jxn/KKnGOyRGVGs6O2+64=;
	b=PZEQH3Cal76bdn7R/jQ0IWk4GC+zjq/qDVpzX2XlsXZES3c8PcgQOi2U0g2sTzF3OuAuxA
	tB+VWJWcO90+2NEpdstTQWch0f/H4ZQsdrX4bUjSg1r6K+iHuGzYuW0Yas8B+kKI0t5ga2
	nJuvjfJ1iw6ig7RlT3LUQPLqXWvQx94=
Date: Sun, 05 Jul 2026 15:17:20 +0200
Subject: [PATCH 01/10] dt-bindings: arm: cpus: Add Apple M4 CPU core
 compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-apple-m4-initial-devicetrees-v1-1-e5655ee56523@cyberchaos.dev>
References: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
In-Reply-To: <20260705-apple-m4-initial-devicetrees-v1-0-e5655ee56523@cyberchaos.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Hector Martin <marcan@marcan.st>, 
 Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-pwm@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>

The core types of the M4 SoC no longer carry individual codenames.
Apple's device trees re-use the 'everest' and 'sawtooth' codenames from
the M3 generation for all later cores.

Instead, we use a combination of the SoC's codename ('Donan') and the
type of core ('e' and 'p' for the efficiency and performance cores
respectively) as compatible for these cores.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584026..c328e9fb9843 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -86,6 +86,8 @@ properties:
           - apple,avalanche
           - apple,blizzard
           - apple,cyclone
+          - apple,donan-e
+          - apple,donan-p
           - apple,everest
           - apple,firestorm
           - apple,hurricane-zephyr

-- 
2.54.0

