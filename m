Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.81.229.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794152640;
	b=FkGhRhcgV9CVDeoIXmD4iGn+hBhdNvJc1pBNRYOOpmgYDC7SpUZ3LqQILlMkTeV824Z/
	 hUlfS8MDWqTwqLTJ/tjK9FA4fZwSh5jCv6ApkwmnGvilUtE/1DQujWEfcan9UqvbUT3qZ
	 20pswu4uwdlGddsbDXniRgkwrNkNrQia+JuJOJUoFWDuMtQRiNzsERur6d8ceSVyVcBYT
	 TahYhn5alxC5wyOqpadVICHrOdrCLNWHi+xJ75UlcMkli87W+8QRrgIcigBbNYcX2UMAQ
	 qr1nNGgKkCJzjR2cpzaUuGj0mctpgxh2d7Xd/2cE6m0+f1WoTzK1QWkZ728wyhQL39w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794152640;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Developer-Signature:X-Developer-Key;
	bh=ycEyutGcaWfcePGSp4ZtX4tMaGwRNsUIujtKh0Ebzro=;
	b=RyjiBTyp7AX1c/Ujas1oZHftig3T6j27bTotYaDuF48lbOCwGgTxyu2pT6djgoJ1QemO
	 7rkkGTaN9wXA7ZLdPM16baORcrDfMvaxFt3+ejql8/t72IJ47UjcvNlkOF5yyy5Q4urg5
	 FoXBuy/FQf/DCjmaIxqciHCHeEBR3aXdzmADgM/IEDKEFVP5uVczjQxrLYSuVM9iq3y8k
	 MH1ckmzadCZKU3uwPXAwaCDDx3iQCgZIDnBEb0dszA81VqZhgu+ds/pAN3vbQ32SF7D70
	 J75rzdqctN9S0A7mSOMKo5LaCeYHEUIBcDo+Bxtqv30jBodECdsSdLAxaHHygxbiYRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chaosmail.tech;
	spf=pass smtp.mailfrom=chaosmail.tech;
	dkim=pass header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b="esKxWh/R";
	arc=none smtp.remote-ip=77.81.229.115
Received: from chaosmail.tech (chaosmail.tech [77.81.229.115])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45829606A330
	for <asahi@lists.linux.dev>; Sun,  8 Nov 2026 15:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45829606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chaosmail.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chaosmail.tech header.i=@chaosmail.tech header.a=rsa-sha256 header.s=mail header.b=esKxWh/R
Received: by chaosmail.tech (Postfix) id EB8F21C9627;
	Sun, 08 Nov 2026 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1794152635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ycEyutGcaWfcePGSp4ZtX4tMaGwRNsUIujtKh0Ebzro=;
	b=esKxWh/RjDnLdnybeQnG/Rv/Qm5Xp5goh7EdtUxM2acV6zOmUMB4cP7X6MCij6lRHb2JoF
	3U/v7p7pepWPrDo/0Vh7jDpDqmVDmn7XjEwswBV1mC8ksNYOQSJ25ZmXt2KWjfarKe+Guc
	ajVX2vjBGWRpk6L11ijEXy3RmZV0uwU=
From: Sasha Finkelstein <k@chaosmail.tech>
Date: Sun, 08 Nov 2026 16:43:40 +0100
Subject: [PATCH 1/4] dt-bindings: phy: atcphy: Add M3 series
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
Message-Id: <20261108-t8122-phy-v1-1-c2783b2a53a8@chaosmail.tech>
References: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
In-Reply-To: <20261108-t8122-phy-v1-0-c2783b2a53a8@chaosmail.tech>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <k@chaosmail.tech>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794152633; l=914;
 i=k@chaosmail.tech; s=20241124; h=from:subject:message-id;
 bh=xy+67myrKs8eDZ3F6qs76EUq8jlUQ6nObH44AZwgygU=;
 b=iX7l+i4N3FEm9UwNLLNKh9eSen0Cp8IOOR93mjic1Kw1F46PRlK54oC0q6IWqlcfTFIHnv7DQ
 ffwyi5Yn7+JBq1Wa2fzsyy9YmzFoXAr+sTio9iva+y+gTZQxIWQf+EA
X-Developer-Key: i=k@chaosmail.tech; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=

M3 series SoCs have new phys that are different enough to need
a new compatible

Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
---
 Documentation/devicetree/bindings/phy/apple,atcphy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
index 0acac7e3ee67..39461c5dcf20 100644
--- a/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/apple,atcphy.yaml
@@ -55,6 +55,12 @@ properties:
               - apple,t8112-atcphy
           - const: apple,t8103-atcphy
       - const: apple,t8103-atcphy
+      - const: apple,t8122-atcphy
+      - items:
+          - enum:
+              - apple,t6030-atcphy
+              - apple,t6031-atcphy
+          - const: apple,t8122-atcphy
 
   reg:
     items:

-- 
2.56.0

