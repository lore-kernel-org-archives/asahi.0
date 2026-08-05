Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4463F9294
	for <asahi@lists.linux.dev>; Wed,  5 Aug 2026 10:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785924686; cv=none; b=VRPbF9ASZcPAAOaGmGVan7flmPbTBog4O7eenVN9k8IZZWjoXqNvxMXAgDsHCPqgBBM+flRxKn7rKnjEh3xwTaIIzykCZtqc3Q3qh6NKE9hanAxHPp7HyLrr06lknviAoQxiC8j0PG3iFVoi36XE/9BlfNds3IyKLL6n7PkjprY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785924686; c=relaxed/simple;
	bh=aEu4DhLKCZR+9M5iOh+LW5VoY6WvL4eLkjfDVZ+NFaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fouc49sYr7a34uttN9Oc9OGg3E7w4sIxP0FJGOARqwN9CErKhvDEDYTRer+oX21UrdT/yZu0KgFaC8DxZPX8g55f90K/NX62WIDT0qDSHBOcJvaxx3oMdukU1DdwlYm6A3BaDgTiiL0v/iMqes22n+dsD2fbMwybJd9sRU10lO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=dmBf+axX; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="dmBf+axX"
Received: by chaosmail.tech (Postfix) id 4C5A21C878A;
	Wed, 05 Aug 2026 10:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1785924675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YlXyLAprOBxybUF+7IFtOCRxZM/TnVWUvC6NWyiKbnU=;
	b=dmBf+axXubrHmcXBLhz3E1kuv8F9eG7DUtAgF+6kptd1Arn+0snEj3P3YYZ65Dnf8mHUOj
	mnLv/ekCV5G+xZO5k+16sYpybwPa06hvMCOS6e7VGMs9aoiM+WgLkH6pwJ7XR8EoJm7SNF
	WJbqBfNpEjWCpBukSWQTgyTMpS2Bq20=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Wed, 05 Aug 2026 12:11:11 +0200
Subject: [PATCH v4 1/6] dt-bindings: spmi: apple,spmi: Add t603x
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-t603x-spmi-v4-1-c15a12d9a7d1@chaosmail.tech>
References: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
In-Reply-To: <20260805-t603x-spmi-v4-0-c15a12d9a7d1@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785924674; l=1440;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=aEu4DhLKCZR+9M5iOh+LW5VoY6WvL4eLkjfDVZ+NFaY=;
 b=JPuc2eWE9jDFzYThYBIqgpVQvdz5cdUO1lY0Wt+W/Z6eld3E6dWnCJNC63oauuimg79YNdzxo
 zOwNLbHIlgvA1cSi8u2vPPVKedziDjRdKcOrKZzOCt4ekVf70LfpRVb
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add t603x compatibles, interrupt support, and support for SPMI
controllers that are not always-on.

Keeping the "interrupt-controller" property as optional, as taking the
j514c as an example, we only need this functionality on 3 out of 10
SPMI controllers present on this SoC.

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 3e5b14bc8c31..fceed47b2cd1 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -20,8 +20,11 @@ properties:
       - items:
           - enum:
               - apple,t6020-spmi
+              - apple,t6030-spmi
+              - apple,t6031-spmi
               - apple,t8012-spmi
               - apple,t8015-spmi
+              - apple,t8122-spmi
           - const: apple,t8103-spmi
       - items:
           - enum:
@@ -34,6 +37,18 @@ properties:
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

