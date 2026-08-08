Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E91131E837
	for <asahi@lists.linux.dev>; Sat,  8 Aug 2026 11:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786188690; cv=none; b=ta4mUX0OC9ZBy0ydFCgi3wCkjJ2thF6nvbkLoAtsr2OPx/GE12mDd6gIeJQ4cA3u/yar0Qy8omY+lf/CTQKRuZnmNQm5gwmUpSeUNreVwVOhA0sffdKPINpEceu5FyLPtse5yLJ3cuAH6EmHxS6okqa0OiX7gv64SpqGYKhUaj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786188690; c=relaxed/simple;
	bh=XC8UjN7V7OAUYnYp8DhiPaqOWzgm6qjWeGjtme4Eml4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=odeZDXNOt5N4/MmyXkx/VdzrsgylEkvj3DfV/GoPxEK8HHk55fUa+zwlQm7tX5IQ1u+miJ2tz+ABZOg96wgEAamw91G4T81k6DepC+kOmxsfPVyCXteIRKWFviDKxOH/yyhGEGdihOtQnt4seF2pdmFYdo+iwPu53zy/S8Cfgkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=Xk1Cv3LI; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="Xk1Cv3LI"
Received: by chaosmail.tech (Postfix) id 32F3D1C87E8;
	Sat, 08 Aug 2026 11:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1786188679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4eceDsqSjj99vq4YSGbw8Dy4bNzTm+W6fU1EurOD8rs=;
	b=Xk1Cv3LIqrJ9ydc4gnZ2XBAAwkQCZ4vaXaaKymQt9p6cOmtPBN8xsxMBaakNlEkyJvFEI/
	dHBHLmEjw/WHCm/Z+jlFoY6eedZFWeq1isuEot17Z0yXuWbqmlViORckHniocxc040dczk
	E5UA5z7kzPE6k8bFSL0r07S1WZ2vjR8=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 08 Aug 2026 13:31:17 +0200
Subject: [PATCH v5 1/6] dt-bindings: spmi: apple,spmi: Add t603x and t8122
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260808-t603x-spmi-v5-1-553c5ac2f137@chaosmail.tech>
References: <20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech>
In-Reply-To: <20260808-t603x-spmi-v5-0-553c5ac2f137@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786188678; l=1492;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=XC8UjN7V7OAUYnYp8DhiPaqOWzgm6qjWeGjtme4Eml4=;
 b=wYf/1MEsoBiXvVJm6FHAGLi/4IV2Ur+kD8PH0v6lMIn7ikl4DGwUpv0em4MSWrFTYgt92JMGf
 FAb2LVENjCXC3QsJMEAurHDCB9isnULh+HAfzAJrxMHygk9413VX9PV
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

