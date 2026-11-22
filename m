Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795350540;
	b=g87bgpwoqDvL7a4gcksRZtmxGwF+3wfp7vlhLcgJkVXoP4p5njB7y/TYtVf+hGpW0H7F
	 DdMl489cbgCDiMPbp72OaA/sKpTxOG/hr+FrpAPPy9rZXYQgVupI4waBJ/2xcMsCoAkCn
	 U5mJK8AKZTwgvnZ+uTIn7vpwei7Tp8X7O5i5PTgkPSkum+icz87RuHkVxv+HQDAl7tn/6
	 4asBEpD9P/HoffbLjbA5KgB2yXjoTFNwTOQfQeiO46W7lAEBnXyqi9545n+36gD5rhWsF
	 vG3wOIG0HZEnXPstFX2te6E6ek3ypo6CRU4NKiZqvLaw2OfIzpk3oghGmjkW+415DrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795350540;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=U3UsFfrbPoQpbauEOSvhwbePzgGzjshZIWa/5gH/TEg=;
	b=0wVmcJz/ODoTjL6FQZNUm4b7eAanexdNzo/tjHj5k13kOpArjfp14oCxdXRIYvEQ/CkT
	 +qb+9ZJJ5dQ22/XLzJ/R7yoBgpGqzZ6gouAU8E6mMB3jnLvVGT7jdiDjh46VTCdm9wHSC
	 o5Ia2+roTpfVwd/Q9HB87978pYG/kDb+CkQq1hzre/BmKgsnqbBdxb3ysPykBYNeVf+X1
	 O0sjWK6jGqGfeCMM2oi4JLMVkngxcLNs+hiq5QST+yiGfa2MdboIZoLsOcWqdMjwMNj04
	 irFIxKIgnaDh+vlsMsqEZfjJGhjdeWhkQtrXhhy9Dj87plEOLQsuKtYgZnEPfQsGUqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=EylOlT12;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1759C606A330
	for <asahi@lists.linux.dev>; Sun, 22 Nov 2026 12:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1759C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=EylOlT12
Received: by chaosmail.tech (Postfix) id 5C0F41C8A05;
	Sun, 22 Nov 2026 12:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795350538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U3UsFfrbPoQpbauEOSvhwbePzgGzjshZIWa/5gH/TEg=;
	b=EylOlT12WmAvZ4cPf7NnLxJRj/HsT1LnCf82Xmybu4aC0kKESO3ms365FHkoXhGfH37n1z
	r2fjmeduefM/jsW44I/HzRaMDcLMPBRI+CaYpRQWmdKP88Dpd+xPbZdcfSpY2hMtlMk8IM
	DGrUvygt9T8JJXDPGFTWTLXvyyZrgZA=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sun, 22 Nov 2026 13:27:57 +0100
Subject: [PATCH v2 1/5] dt-bindings: phy: atcphy: Add M3 series
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
Message-Id: <20261122-t8122-phy-v2-1-8d5c8fdf31ba@chaosmail.tech>
References: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
In-Reply-To: <20261122-t8122-phy-v2-0-8d5c8fdf31ba@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795350536; l=1015;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=ONFv1nLesYHt/1neWh9QB3KZ9yU2CYg8uiOebA2uB2U=;
 b=ZJ/WJ71Nv8MDmKCYRIat6jGyXt6twFV5+MWqEWsZDBS/EsO8EZgANmW2I79I+QbE6WUb1vRCy
 EDd2aLz42R9BnLGAF2Br+vhCIWXxRFCM1ctj2Jur/MQSNpeFyfNA63+
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

M3 series SoCs have new phys that are different enough to need
a new compatible

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/phy/apple,atcphy.yaml | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
index 0acac7e3ee67..4dfb3b68efcf 100644
--- a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
@@ -54,7 +54,14 @@ properties:
               - apple,t6020-atcphy
               - apple,t8112-atcphy
           - const: apple,t8103-atcphy
-      - const: apple,t8103-atcphy
+      - enum:
+          - apple,t8103-atcphy
+          - apple,t8122-atcphy
+      - items:
+          - enum:
+              - apple,t6030-atcphy
+              - apple,t6031-atcphy
+          - const: apple,t8122-atcphy
 
   reg:
     items:

-- 
2.56.1

