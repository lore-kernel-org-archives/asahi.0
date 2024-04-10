Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D7517F385
	for <asahi@lists.linux.dev>; Wed, 10 Apr 2024 18:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712772933; cv=none; b=aMU5q/k+FZRGeHZtpVemDX6x4tkGHl0n9AzwHxnUovBq/XKEN666Gublj6KQ2zTZpSs7d4Hswr9YFmqkdAK54yij7dOqWa8nsgbsLyC0AXtDZPNia7W5p8KWyvTng2argTxOtuNkHph6x5EQ6hXWcNLPKY+8Iky46nTIOW03Lck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712772933; c=relaxed/simple;
	bh=tWhKR1dsQM1YC79zbmlvLikHvew+c5F6LJQDwMAE2cg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ubh53TJ/66lHVHsJLsUmrqCwLXIwcWwGeWpfawTMy72h5V9MQ8Bq9OCOLbxNvm6nhcI/Jcdc+LLKdw+rcJfythGGdviMiJ7EmwJdoa10Qi5p1lD5X5NZrazKEq1TIZZLvRqath7ezmAdBkEbEPY+2/OzHUt04QBp9x8dOeS4Lug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D+OmZOZ9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D+OmZOZ9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-416a8ec0239so696345e9.0
        for <asahi@lists.linux.dev>; Wed, 10 Apr 2024 11:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712772930; x=1713377730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wIIgCwWsXgtg5bruLAQKszp23oXas8PwjnbukW1ABVE=;
        b=D+OmZOZ9n+dY26GICpVVbG6Mm2bv0h94+2BzFV2v7zWiGPZsKayrAm8D03DyEeQ6/f
         ju3T+jq30unIJ7C4HCa2cJgqSZmaZdhCOyvCTeam+NKWUKjqDTIJJAXmW0szL7fjvDiV
         53KsXFj8AaFqrvRCl45vxScfrUByP19WwqJgl89knEPnQIk0qOnnCA+1/Z0yGDF2mSxd
         cevYFnoVpnN6/pdNVvkRFQFJnwTn8usJGKdCvGnLHP/joSY+roShT1zIWtZklmuO0Xyp
         T/3ivLNCb8M5I6nFvczJfZC71Hz8F/8F0MFTvouvrE9Tqqsoar0hLz0knmxRG2lKy2dU
         dNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712772930; x=1713377730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIIgCwWsXgtg5bruLAQKszp23oXas8PwjnbukW1ABVE=;
        b=APIkznoKr0wsjkxpH1ZXHIA9zYXBu9s4m3rqDbTksnuopxl756tMRB3Yu2Q3vSuQDa
         oPhWGifNHDsG0GDS6iI4yeRGucHyYSGCzWQykNY3a9weQ+kP8dgloANtBeruJGs3PZKH
         J8FybD0vTJUwWzoQ3IIH89COiJBukeNCysvLmHGI8TTkRr+BpWLnoSHkgwdxQ4I5hnlN
         PFWRIGPWoB7lAOiAd+8JemXx0NSS63i947y7Ssh3CFAVLMF8j/4eArzOeGVfu4OkRXVg
         sVahyhvBjwVtCNb702RK3j379cMqlBGn1w+4iXq26xFP+OSqtu1B0A9q8p/MizXykje/
         kKQg==
X-Forwarded-Encrypted: i=1; AJvYcCWU6zAf7fSKLuoZ0341Qdgm7c67/fzrYfAD2FgYsbYDZPkfej7EdydEtM3j3QzrtBbZw9K26jhc0+9KjWEJXArcwMFzy0s=
X-Gm-Message-State: AOJu0YwSzgYclEYeE57LjhjEs8kao3WFPpBiZP7mmrqE1fghxBc9Z5bM
	jv02H31NZ3o3GdsH4YrDqJwSvmOQYv8laoOV/thRkME62asFZb0mVwcJ5B75F3I=
X-Google-Smtp-Source: AGHT+IHa3VzJvP4OihmkofwN3t83NfQ7iiOhP0nYKsaImp6PQcjJKVMYMSyyVk8er1agY3VX8l3E6g==
X-Received: by 2002:a05:600c:4e93:b0:415:431d:7747 with SMTP id f19-20020a05600c4e9300b00415431d7747mr358784wmq.7.1712772929771;
        Wed, 10 Apr 2024 11:15:29 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id d13-20020a05600c3acd00b004161bffa48csm3026487wms.40.2024.04.10.11.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 11:15:29 -0700 (PDT)
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
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
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
Subject: [PATCH v2 1/4] dt-bindings: PCI: cdns,cdns-pcie-host: drop redundant msi-parent and pci-bus.yaml
Date: Wed, 10 Apr 2024 20:15:18 +0200
Message-Id: <20240410181521.269431-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding reference common cdns-pcie-host.yaml, which already defines
msi-parent and has a reference to pci-bus.yaml schema.  Drop redundant
pieces here to make it a bit smaller.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Add tags.
---
 Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
index bc3c48f60fff..a8190d9b100f 100644
--- a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
@@ -10,7 +10,6 @@ maintainers:
   - Tom Joseph <tjoseph@cadence.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
   - $ref: cdns-pcie-host.yaml#
 
 properties:
@@ -25,8 +24,6 @@ properties:
       - const: reg
       - const: cfg
 
-  msi-parent: true
-
 required:
   - reg
   - reg-names
-- 
2.34.1

