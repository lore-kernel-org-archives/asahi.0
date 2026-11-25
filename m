Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612326;
	b=WwjH4KG4zGhyFIfAT/tjisg3/zYth8r3ziUzrYO77QNTtEsL9trdWYpm5+DLaPVRTMkc
	 oJZtXNQ+wulXIi/Nk2oFn4pvI3M2FpiDUCwmP6dc0EhiGzxH7MeKhmEdcxmttak++0wR/
	 Z3XmLiCK91gYYE7GjBdZn4qsIx6KulYGoZly9rI4l1P7x+VEJ3C4kxK3X94/tmJDWJRZ0
	 eBTZgsBayudcjHJBd0uuWIeWZEr7wlUx+U5ZCx2cQrB0Iwji4ehk4zIYt5TzLEJ+l0GR5
	 qWxPe/WA0CirXaQ+l2GzcuR4S8G/+Nn+TsV7EYdbSVa0ZFvavB6Te7IcdaChvMu0Brg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612326;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=U3UsFfrbPoQpbauEOSvhwbePzgGzjshZIWa/5gH/TEg=;
	b=Uv8e/47fz/BvlkrDF15BW20cRfyxxbnzqDwAXIU7N/OFqWhicHosqB5bAYWz7fQ6csoP
	 F27Zuq2l0gR3myCoIVBIbc+nq+NJGCNK6xd3SUoz9Rk1cGi5MfaeV4GwlPrShsEXl7ddI
	 L8jS9R0U+8q9x/yrEZ504ZhtWkekM8iW8dHXy9vaEzA8DzU48kCPkVlikxRA/jKFU+V11
	 ac1RmStrdUIloPTelMzmTTgb6qvuWLcMGk4lq85W4vnEilQyHp2Ics6JVz/OpztJMDuIG
	 k5UzI/6K2ErbA4h8Worr+Xu1yCFGdFqPcCHzD+idGMEiPiJz4mIFK+Ebcnruubw2/4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=Z98iVdTS;
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD2C606A32A
	for <asahi@lists.linux.dev>; Wed, 25 Nov 2026 13:12:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AD2C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=Z98iVdTS
Received: by chaosmail.tech (Postfix) id 445C91C9FD5;
	Wed, 25 Nov 2026 13:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1795612316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U3UsFfrbPoQpbauEOSvhwbePzgGzjshZIWa/5gH/TEg=;
	b=Z98iVdTS5WRvrWz9ZPOuHxfn2tE5XcC+8Hol5U/XOj9IK8CBTQJ+opKFHSy7s4b0h5LU6o
	lsf/ztPIDrkptBB16/76/eJkHFOlgFuj+JrOd453CBkUQFBt9YgLuusHqzIR9ez1V5silX
	8lXjnn0d8YO4mMu58dQfUlOgIq7dvQw=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 25 Nov 2026 14:11:45 +0100
Subject: [PATCH v3 1/5] dt-bindings: phy: atcphy: Add M3 series
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
Message-Id: <20261125-t8122-phy-v3-1-196e20b3537e@chaosmail.tech>
References: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
In-Reply-To: <20261125-t8122-phy-v3-0-196e20b3537e@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795612315; l=1015;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=ONFv1nLesYHt/1neWh9QB3KZ9yU2CYg8uiOebA2uB2U=;
 b=obT1ffHoLdw4gfPXIUZg59t6IifZzBzT03Ur6DJpCI+cGDKIoznCWVdfh+X+EFjX/0KIEwGQM
 ZV8j/ONVeZUAzxPD3tjN5q7lyk4om5IPkzN1CkhzP5BdYn3FbYEXq7i
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

