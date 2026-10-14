Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0066C47F2FA
	for <asahi@lists.linux.dev>; Wed, 14 Oct 2026 06:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960993; cv=none; b=AVzi8blP4j427LaZsdzln+BLDOOAJwiTeypxIEBhSKKRXYMdulmKEXla9DHnGJMbceO8SyuSCbTE28sKO0i9yng7W0dDnRboYjTW6e0UkULJBORqQEnKLI99EfbOLmPyjUaIizQRpV9CrT3VEqp3sIyAObkijqQRKMLFEiytTlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960993; c=relaxed/simple;
	bh=xz4vDgj93NsNlLoeWwd0xgMgbKuuYUnvg08XI/roDUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2wRPGiihCGa935l/9zTdhq6XqBEWTsYXWb1O5UjCviQVwixadVx2TQBVEaJCTvpoya9wJntE5O/CgzgXpxDufOiNs8S/ZLiaQDoiL/j+MtaP3O3p79GBFnnf8hff/jeXxXyKhz7o4PDdV4M8PyJ8T9Oal+0zgbB5yr+CUwvCCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=YFBEL8lf; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="YFBEL8lf"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791960982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RSU/5zIos1JoD/tFn6BkFqrUZOIf6cM2zH0LKt50WJ4=;
	b=YFBEL8lfnu0HHKsSAM11j7Vc8Rcr7CSK82yMQGL+gDoYB/iQ7mN2vmI6VQR7SwZKOyWX19
	JJO/1WyonTba9OJE0ZNXwqLY2vzYoWLOyvCxjmKZWRmV0N0nNsMSWjmdxImX/jGCX1yAiQ
	Os4Rk924LXUcskUoOTQOXnWkmpI5RYA=
Date: Wed, 14 Oct 2026 08:56:15 +0200
Subject: [PATCH v2 08/10] dt-bindings: i2c: apple,i2c: Add t6041 compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-apple-m4-pro-max-initial-devicetrees-v2-8-961edd8d661b@cyberchaos.dev>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>

The i2c block on the Apple Silicon T604x (M4 Pro/Max) SoCs is compatible
with t8103. Add "apple,t6041-i2c" as SoC specific compatible under
"apple,t8103-i2c".

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index 641f24b0ef4b..56bb07a2ec01 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -26,6 +26,7 @@ properties:
               - apple,t6020-i2c
               - apple,t6030-i2c
               - apple,t6031-i2c
+              - apple,t6041-i2c
               - apple,t8122-i2c
               - apple,t8132-i2c
           - const: apple,t8103-i2c

-- 
2.55.0

