Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 184A41DA53
	for <asahi@lists.linux.dev>; Sun,  7 Apr 2024 10:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712485216; cv=none; b=kGTvN9X0HKaOQ1muM5W3lJOlQxK974LfxGJ+I0O2iHW6iesvEKPEF4pMQNgqBkaXPvyUggZMQCGpAZnvq/ebVSb05yS6O6kvIIvFXmX5gNEyIkiOI1qqAki8k5zTXtk/1GKDR+WgLQFcYUCF1MA/fOtHcX4e+4l3Zfj0jr4o9OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712485216; c=relaxed/simple;
	bh=0kmWDD3YYQkd6GkpjXB8DvXQjeaBMd22PRWNSrOstXI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LufwLfMGOF4PEDVGWKJpee8Oq0HTcr7EJLQ6UAawRNYZKFgtTtNIUMtEr0IDDaq5lKkbaDJRizGpOphshK8OLsfKt+zJR1CAn/Htb1vEJKUK4MqCcz83dBQJs0DOyIa/LsSKdexZnTDMpC3C8c540hDG+t49ElDAu4vylyAd4es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zmffll/w; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zmffll/w"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d700beb6beso39202441fa.2
        for <asahi@lists.linux.dev>; Sun, 07 Apr 2024 03:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712485211; x=1713090011; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zm0CQFK2zv7ApnNYT3L03j1/+cA4iy8BnGCrLtvzqTo=;
        b=zmffll/wl69wu3e+cEDD2q7tzuS9PCwcD5ouWNR0u3Ni2RWEK2thJJeD2rEpiNN3ya
         lIsHhR0LqQ2p/Nai7EgHtTQzVc25WICSFqtY21oA5CJwlH9ZPL5Q4LFnlGTK38nCBMZP
         MoPdWLQZdmcZJeLK4hULAnaErioCroQpKmk9zvg/VedkvRPc4PiBxxzVYLwSAVJfv1ra
         GnsWpq5DgnL95WgMU4VJGKKSGzeo79AJtHU05wSzh24zpXDgUaHauM1Bh8rzIz8b2k8h
         OOfO2/nfCFbUysBU2U+iiy4RoRYSPydsWu2Ayvlu7MKvEojwEpYFHClP8w/+Ji7EiWOD
         WE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712485211; x=1713090011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zm0CQFK2zv7ApnNYT3L03j1/+cA4iy8BnGCrLtvzqTo=;
        b=edYS0S0XYNy2+d9d55p/JMcUUBq/mEI8u75MKJ8I5+Qb0EPT/8g3dyb0bjlhgwGgG8
         IOCP7eaVndiO8JPJVA7oygjIbbUcmkfrcLPn9i8mYwQlpyZI3wYwVEAH8NNooMppkD2s
         3HJpQNi2MU5CVeMcPPXQUL/meAT6bpec2rxMjuARWA/zZnq4x6h3TdPLhNu/5xHwBQ6p
         QDg/eIsFlrD+ISS2XOiOx0hGSPti3PIfDYFDwlzoBab5y7XZMPKWIVHQl+nTf/4F8DGx
         K0c5Pf8NYWzSnSxY0nGhdkyxr3vJ/WcJWRN7pAdyOXr5AQNMLTlufM52W6AQuVNOa2ms
         9QGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfYCxcNVeCdUQ+5XivR6T1KJXYzIPjYGnHxyvDooHphNa7HQmamkqxTdsOZbOKK2/J+SyLmjj2R8U7FEppEIn+0Q9aZ+k=
X-Gm-Message-State: AOJu0Yxno2JzuV9eyuP91WRdjxR8bSpIduWU0LbqthrqFglZpOhJ6hiW
	o0mXehxa8IyWPxDJC/AyTGB5l7wrKw2oO7NUGTMZ4PnSrTw9U/qpIDFZKmKsSrA=
X-Google-Smtp-Source: AGHT+IEgAjSogfT+sOyuptAU4z+kLewM7d8oyVlExMI6z9adAX4hTN2911WGxmZGRduXlgbWJAsiIQ==
X-Received: by 2002:a2e:9045:0:b0:2d8:681:dc9e with SMTP id n5-20020a2e9045000000b002d80681dc9emr3876638ljg.41.1712485211048;
        Sun, 07 Apr 2024 03:20:11 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f5-20020a5d58e5000000b0033ec9ddc638sm6354395wrd.31.2024.04.07.03.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 03:20:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Tom Joseph <tjoseph@cadence.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] dt-bindings: PCI: mediatek,mt7621: add missing child node reg
Date: Sun,  7 Apr 2024 12:19:59 +0200
Message-Id: <20240407102000.37213-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org>
References: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT7621 PCI host bridge has children which apparently are also PCI host
bridges, at least that's what the binding suggest.  The children have
"reg" property, but do not explicitly define it.  Instead they rely on
pci-bus.yaml schema, but that one has "reg" without any constraints.

Define the "reg" for the children, so the binding will be more specific
and later will allow dropping reference to deprecated pci-bus.yaml
schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/pci/mediatek,mt7621-pcie.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
index e63e6458cea8..61d027239910 100644
--- a/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek,mt7621-pcie.yaml
@@ -36,6 +36,9 @@ patternProperties:
     $ref: /schemas/pci/pci-bus.yaml#
 
     properties:
+      reg:
+        maxItems: 1
+
       resets:
         maxItems: 1
 
-- 
2.34.1

