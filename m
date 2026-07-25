Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783C72D249B
	for <asahi@lists.linux.dev>; Sat, 25 Jul 2026 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.81.229.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784987294; cv=none; b=CkRaNvye5Pa0UwJtHy5/tusrs8CfgBY1+I2OYE6GGWd2kH1xR561vgwOkdkOtgmaDLTRzFr3EKPPv6cAoUaxYcWQeeKrAL4GPHKAlbI0K65a8+PdU92v6g4I58WZA7zgGmwkNZduU9Ao43y3/mPWmHD5bCS+WAIeW+baqtD+DxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784987294; c=relaxed/simple;
	bh=wqm7+TUC34pSmi/zpOaYMoWGiag20QOgkChGwgMHchI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oAq+6aQZ/wg9LpfGVGGNpuzG5a2qaNqms5MLXvv7nGedWjRMbCdkplFpKZFLyT+HLI9//GVwxsQYa81mllQ8ZDJVh7RFwEVHMTbch646eeJvzRqGcImV3M7VSmRRSoQ09D6tvbNI43U7B7uxRYXugxWhXw8vhPJUz2Wr70cgBGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech; spf=pass smtp.mailfrom=chaosmail.tech; dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b=vcG7XnN8; arc=none smtp.client-ip=77.81.229.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.b="vcG7XnN8"
Received: by chaosmail.tech (Postfix) id 633891C8684;
	Sat, 25 Jul 2026 13:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1784987290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H86t3gf/zmT834UnYberSZX5pHmm8loG9uhscxnY3uM=;
	b=vcG7XnN8GCLBHY7JTLMMcIAx6D7SdKRWHgtPYeWr5qzKYtZs6zUOwdg1q/nnbqMdciL3iv
	iHRwZeqt+oEaZh59b88RS9UOVp9gQXfzMxbdQ1GEMTB+5e77tHmjCvm8OWRl7vCt2jXJGe
	2ks96ERFQF+BDgnJqCd7ZxfGequU02s=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sat, 25 Jul 2026 15:47:58 +0200
Subject: [PATCH 1/7] dt-bindings: spmi: apple,spmi: Add t603x
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260725-t603x-spmi-v1-1-e1a29fcd2d38@chaosmail.tech>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
In-Reply-To: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784987288; l=1183;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=wqm7+TUC34pSmi/zpOaYMoWGiag20QOgkChGwgMHchI=;
 b=GYNQYwGqsfIDojVYIcLBsknBtdJECDpVEFwrgGgfI8vD4HIQS5gLW6KUw46QNkw0pr0xvHpnm
 0FpT9FSgeykAElDNeEuXMvb0mRLnc6gdo8SBPOAcl3OsgVSAigt68GS
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

Add t603x compatibles, interrupt support, and support for SPMI
controllers that are not always-on

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

