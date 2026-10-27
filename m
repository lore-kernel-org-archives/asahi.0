Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088219;
	b=HdegN01wQnbTd55kfpn05HW3+xG2jIEUZh0vUZCqKj3ThDYqffG2tycq/fZwYAGiRhMY
	 j9mOt3zkXa1Eb+ixwkWtczb6uvv3B5/m+82h1iIVCYo7FnVHWpwvLdfbMpkHwunDY1yRS
	 xqyGiGKaD4p3C65czhTZH9PfM7iWasp7ZLTPP2sYZBJtV4LQa8t4vb/2cfD7hZbOwYawY
	 KvJ7zuzoFMz2pQjzIG8ckT5PIAhlM8o3q6va+HzFyTlbKepCAlJ39LdoaTPby8z1zhSlC
	 EDpn+4hUUoKk+Ibm7Lne+fCCud43iridbZzo4Th3+UC5py5MdQhCwT5cJKRRO+J4m+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088219;
	h=DMARC-Filter:From:DKIM-Signature:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc;
	bh=OvRAW5jWXAqOgYFFCKh4yUQJFXVArQqv2tM8QSxA/7E=;
	b=V+8eExcd0pYNEnzRPxj2KYOBE+/uqAww0Q6Labm9pQjK455Keinqe+Mlp2vdOvOBHwax
	 nqTR6YHdGgdpPYQ0WYbzqgZ75CjeKJLtm4MEiAlxXSogQtSm6ZgVM31LIkmyWlopHVUj8
	 4uXXBFZOjIkG79fsYrpdo2IwqmSSsHdvFffD4HcopXLO6iMUMTd/PgCweko17mlw8WaHU
	 uWUVDC4nVqZpM71G4adSXU6v69juPJdTtOMxTZLEm0qQiQPlY1OMskoB6NnBR1zWrjG2F
	 KDGHjEZaigKKC9stcGTimUWVrXjzixV4DuBWQkM8WZ38mbzcHENDwrUn/O2kudqGbfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=hU7Wm6go;
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E9F606A333
	for <asahi@lists.linux.dev>; Tue, 27 Oct 2026 08:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E9F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=hU7Wm6go
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793088211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OvRAW5jWXAqOgYFFCKh4yUQJFXVArQqv2tM8QSxA/7E=;
	b=hU7Wm6goihcwaiFPvNDQmNagCPPBiB2424huaCjAhpUn75tb8dKyR9+vZYkVk2rzesedAN
	ljLKAqepiU3P19/MyzSF8sLlWCy6C+eVBZ34yw0UNlSoAMnHiDz0N0FDiJ92+zT6rTRhh9
	IN73x+o5FEmXrS6259UH/eTpqd22rNg=
Date: Tue, 27 Oct 2026 09:03:24 +0100
Subject: [PATCH 04/10] dt-bindings: arm: power: apple,pmgr-pwrstate: Add
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
Message-Id: <20261027-apple-m5-initial-devicetrees-v1-4-1356181bc50d@cyberchaos.dev>
References: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
In-Reply-To: <20261027-apple-m5-initial-devicetrees-v1-0-1356181bc50d@cyberchaos.dev>
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

The device power state management of the PMGR blocks on the Apple
silicon M5 SoC (t8142) is compatible with the M1-M4 SoCs.
Add "apple,t8142-pmgr-pwrstate" as M5 specific compatible.

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

