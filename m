Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC123DDB19
	for <asahi@lists.linux.dev>; Sun, 16 Aug 2026 10:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786876004; cv=none; b=KUdlFH6Kn8+IGEpFyCaYfG0rEYFtHugu4rBv+DA9RbpsdIYYqYPfu1yx04U93F9fojof61G1WralDwLqNrKjQSLd/F5f+y87xXNmh4mf6H6Ldq0DNTlRMwW7tKsQu/4fqUXBeIhRk2OTqLVikau8bfgpLSiRlAvFamrJKw0jUKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786876004; c=relaxed/simple;
	bh=XC8UjN7V7OAUYnYp8DhiPaqOWzgm6qjWeGjtme4Eml4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rv2JUJKXSPemYcvmMV0rrhnCuX9wdhVDMT7xNmj1P5xs+f0Dp+Iq4pILHCikneW8mNn70LAtphEPlBaTBFxVrEf49KM7FT07jzer3bMOKJy10uCUClr6d1JpboZjiNvtIe/NTUllGDTrgeN9zLDIpyJPvzoJ8S8npo88RHQOH1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=SC+32rN5; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="SC+32rN5"
Received: by chaosmail.tech (Postfix) id D51151C889D;
	Sun, 16 Aug 2026 10:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786875994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4eceDsqSjj99vq4YSGbw8Dy4bNzTm+W6fU1EurOD8rs=;
	b=SC+32rN5GKvVb687Fu9WV3MQctxPvciRGURnGtHdm9LsaiuNtWpHNykGvxW8ET0y4510o2
	Luxjd3XwTTJrxNqwfn0TynJDDwG/OEcdAVofmbrX1iupAUrsDaQhVlS7dscECr0tT35bvw
	AUWI8SJGubX4fpZgVjwL0vaEghGENWQ=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sun, 16 Aug 2026 12:26:21 +0200
Subject: [PATCH v6 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-t603x-spmi-v6-1-c5ab87aa447b@chaosmail.tech>
References: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
In-Reply-To: <20260816-t603x-spmi-v6-0-c5ab87aa447b@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786875992; l=1492;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=XC8UjN7V7OAUYnYp8DhiPaqOWzgm6qjWeGjtme4Eml4=;
 b=gMN83pbQJwN7jI0NDIGxDCW9Xk4nBpZ12mn9btMD1WHRTBVK8iEfVvAgUQBmoRF8tlwfKNBlp
 NLODqqll2EWC506huD72WYI2zuQWUE1/Ml9Og3EDrqR0ZIeGK+Ciz67
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add t603x and t8122 compatibles, interrupt support, and support for
SPMI controllers that are not always-on.

Keeping the "interrupt-controller" property as optional, as taking the
j514c as an example, we only need this functionality on 3 out of 10
SPMI controllers present on this SoC.

Reviewed-by: Janne Grunau <j@jannau.net>
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

