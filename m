Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794000304;
	b=VyjQMJ2IMP7JTOVkvE0uDhTgx1tXrk8yETrEDb6hUs6M9ucQcJOYIyaNRiYbl0YgFAUn
	 tn6INDxlrFswc2tjjmdrF9Q+wDZ5geBSasadbGhcV8xFn5zL2p1HEfW8rQEOdlHQ8w42P
	 OCVK6yLJwnN+xfwHCsJKiFloBcFnqPcX8ISniwadzUHcUHIiN6a6ahtNEr9AKMVEt+iTr
	 1XcvXB+CL+fz0yjUPJ6ZmvbLkKeyeA2da7sm8TCbcp3UBI/XOaJhiWisBQ625hep/6iri
	 P26QPz6Llip8inmIeavLhVC2iuS8yo2TzkN7TruIp6urgWlATZm5vF6dk8J95KGc+wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794000304;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=bIVg0foxmqTG/8sVU2ZcbJWE1ifg0bPsxbq01Yjc28s=;
	b=XfJtZ/pnnTVw0GjZa3EqMsvvOuSPQYNV8mg+kbcvQtnC6v5IBNtsKSzqLzGTk7Jm8Byg
	 sBNS7JHXNqZ5gQyxfIhu63wLU/tNmLIpfwNyTkM6sjrxx3gcDJGKrS3guAHdM4jlYluG3
	 u4Mr4SLlXDlopE1t6J1hVLCZr/mtqZF4VXqM5HFRpX0yzDe01NArbbMd7PKNaPqRZ97gP
	 pUEwdJ/WrpF0JZT+e3wgukw7+osnf5pJTvRiIXq+IBxX6dBGGumMSimqNtyrUnJ+7eArg
	 B9Edf1kOtzgILf2m2hSPp/BuvE/JUIVhwESj7xgpkZrdyGlzMQ5uq4hu4g8nc/lGffQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=3e+kc3ag;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E393606D804
	for <asahi@lists.linux.dev>; Fri,  6 Nov 2026 21:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E393606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=3e+kc3ag
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1794000302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bIVg0foxmqTG/8sVU2ZcbJWE1ifg0bPsxbq01Yjc28s=;
	b=3e+kc3ag/Rpn+K1bgd8vuzh0pyJIrhpqlte6vq2e8bzai4HenVpv6KqNHMQ9R9XM9BJQys
	sIk30jzy4345bja2YgXbWBGS0Fu36KBE0OV3yVqfR00m5U1L3aOxTefm7kVbQI9Zy/uFjh
	Xegoc7k0Wc7GmNp5zp9dyfEaS3Im4+A=
Date: Fri, 06 Nov 2026 22:24:52 +0100
Subject: [PATCH v3 3/9] dt-bindings: arm: power: apple,pmgr-pwrstate: Add
 t8142 compatible
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-apple-m5-initial-devicetrees-v3-3-cee55de54b2f@cyberchaos.dev>
References: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
In-Reply-To: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>, Linus Walleij <linusw@kernel.org>, 
 Mark Kettenis <kettenis@openbsd.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Yureka Lilian <yureka@cyberchaos.dev>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

The device power state management of the PMGR blocks on the Apple
silicon M5 SoC (t8142) is compatible with the M1-M4 SoCs.
Add "apple,t8142-pmgr-pwrstate" as M5 specific compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index a37a837a4eac..451f2a80f844 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -51,6 +51,7 @@ properties:
               - apple,t8122-pmgr-pwrstate
               - apple,t8132-pmgr-pwrstate
               - apple,t8140-pmgr-pwrstate
+              - apple,t8142-pmgr-pwrstate
           - const: apple,t8103-pmgr-pwrstate
 
   reg:

-- 
2.56.0

