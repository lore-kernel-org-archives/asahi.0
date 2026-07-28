Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29B541DDE0
	for <asahi@lists.linux.dev>; Tue, 28 Jul 2026 09:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230902; cv=none; b=hzNhr6FU+4uH6Oc0+LDlz7LZOvpuge2dTed/UWO33HJ9G4r4sNDBvKRTCwbVijNED8UOizRsvngExlIII1LWWI9gr9O2E1P/f7jVV0ejST+Q19yV28EdrwdwprCvfhhMoQ43XUYrMSB3PUEvmfsK/bv67nYkDe1Sf/abSnV8c2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230902; c=relaxed/simple;
	bh=SSqELiGIheZUAC6pRoc9/Zh0HI3umFoPJqIqs6RN2fY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/F0Q2UgifoYxFvOdPoazq4sJWToBRKYKW/cI1CpsTK6tqfapauW4dxgrxHgb2kHyceX7mLUcCqRyNV7O3WYaK2eIb3Sl+cD6vm+ZmITZEe5N3WqOTzPMnO2OyTeEIXRUJVZJJMvfLHAqtNq/JwUOonBZ5KZ+6lqqg1MOkcPHSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=rtmz2AY+; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="rtmz2AY+"
Received: by chaosmail.tech (Postfix) id 199341C975B;
	Tue, 28 Jul 2026 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785230897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4efewOwOQSfoE2iJKEquU+SnNeVRr2+GI3bic4fnfx0=;
	b=rtmz2AY+1UHXzmvBdcmDB9GmwWxGKvTJt3dGynvzlzmOsGK4gFzxUmLzichSbwjLBowBYF
	baQX9mpxVtFYOtCLPAlNUVz5r8rAESZNIaGS5rR93XVi0uQEiFRbslTYNn4eE6SKEaYWhb
	3HeagdJlIHpgoGa2ZhxvMqv20ENml8I=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Tue, 28 Jul 2026 11:28:07 +0200
Subject: [PATCH v2 1/7] dt-bindings: spmi: apple,spmi: Add t603x
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-t603x-spmi-v2-1-f43e5f10e583@chaosmail.tech>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
In-Reply-To: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785230896; l=1366;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=SSqELiGIheZUAC6pRoc9/Zh0HI3umFoPJqIqs6RN2fY=;
 b=8LrG0MuRdrezDeJHHgdfaRe+SeAvMYEj5KLQdiB0+hvaivHEbB4FqDlsuWwdkaXPdkWNtCduI
 84z3dbQxsyfDU+gn0KlypnG6tKNOSweDsulpPxOA/5rTKqWmNveKh+z
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add t603x compatibles, interrupt support, and support for SPMI
controllers that are not always-on.

Keeping the "interrupt-controller" property as optional, as taking the
j514c as an example, we only need this functionality on 3 out of 10
SPMI controllers present on this SoC.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 3e5b14bc8c31..9fc511bb0cb8 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -20,6 +20,8 @@ properties:
       - items:
           - enum:
               - apple,t6020-spmi
+              - apple,t6030-spmi
+              - apple,t6031-spmi
               - apple,t8012-spmi
               - apple,t8015-spmi
           - const: apple,t8103-spmi
@@ -34,6 +36,18 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+    description: Optional, operates in polled mode if not present
+
+  interrupt-controller: true
+
+  "#interrupt-cells":
+    const: 2
+
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg

-- 
2.55.0

