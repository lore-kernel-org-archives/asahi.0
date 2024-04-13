Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3C645BE1
	for <asahi@lists.linux.dev>; Sat, 13 Apr 2024 15:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713021407; cv=none; b=a7uEm6IoXS5r0cjtqrokH0BfjOqpARw5iQg+cief0NllnxRFo+w9rF0RiRUcuIYskbUyLkc892AO9HbPJ1jQxlwim+DDCYJFLEgZq+zpL6pTiiV1bFvYrF5QoD17C3pnuxvs3IGCOsboTlvOPqxeKCgmoVbBksdjdSD9cx6YB2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713021407; c=relaxed/simple;
	bh=IHhPqznUG4voks9nHUIjXaqoLqCX+AXGap9zXBqCFRs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ebo6RlNNMpBWq8de4/Dp+WDNl7nAiW8yIxZ4oRrG79E83XRM13agVxNMI2p1+Fmtfk5EqYh0DENtF3ND/akF3+xFxUTtHAtTf5NZ1Gw5+KD5U4gcHg9j6KMu4+ogTi/r7znIy4hD9LFD3VUOWfXSnH1Qu/z7MBdO7lb3Tyn1b5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yDA9qZ/V; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yDA9qZ/V"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e2c1650d8so1699739a12.0
        for <asahi@lists.linux.dev>; Sat, 13 Apr 2024 08:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713021403; x=1713626203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5A7g7qS50UKBu2Vs5SDgCbvvncurtSr/U44kFCGPI8Y=;
        b=yDA9qZ/VJ/08FxBtob6q2xfKVaPUcbw3VKYCsDNJeTxZvZjkMxaQWfCaAOJImDn8GG
         6W3uSxAfRPZRvz1g8CuhaghrA8MSMKz6zAnxE/GDJtnjk6b0rUXF+ZskQE2vIXJdYOxd
         zJA3D8Qo8O2bwE9cNXB7IK5CSC1WqgUebAl5arlGF1gEc6cRJcKBgr7N370SiMUw1sbL
         4dEAW5VOzbunzRz87jvXZ2yPXlhiISn+nEnD+3bzo85Ej65ceed5SMR088jdPmiviQjq
         5B81y6dJVtJdtATohkKMduzBfDAQkFB0KQupQJMlbMGPM5XYZiyei5jsxDH8Upnm0+H3
         wrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713021403; x=1713626203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5A7g7qS50UKBu2Vs5SDgCbvvncurtSr/U44kFCGPI8Y=;
        b=XgvRneEHF7hUnyjF4qUJk/KiFQlcIjc/gj6Y0BFSDUnwJbYNuia3z7J5VIEOLiI2l9
         SndfLGSwCRYtCMmVhGSyTsF76KjMnKlXyg0uKUs78DdzxfL4hyTsxAmcdcIKbzOQgvY3
         zl4YfF7FiUHeq1m3VuKv8ArV1TlBSJUsUHoCO5aF5CRWl1G0hlnHd+WFzENjflGuIP7B
         y8ZDrATG4zLUgDl0A1jZjPL8BDQRf/I4m1yG+lpspA15V5fKQHoSpIpbVC6kXF6Ccczu
         iZvOpEyjd1oiQKaTdJjxOi1qNY5+qWmVlO55fphFPa6+gEeTOMe2sxTSrViKsP8+iMQS
         K6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCU3W/YcQqmFjwU9GXx2ehZr4cFQGN2GQVs7qqmZv2NnLTbaUCMW1dXYw2hDEteRNUCV6Zcs1L/EEWzVG1AcBBRv7kgD4D4=
X-Gm-Message-State: AOJu0Yxz6sMJdTVcujLSHSMoBaKgY+RD7VaDhpVrffjUBQIZggw/l9l8
	eNFHbtO72p1epESlFG5RLN/VBcJBhU3UN1GHxyTmUUhHN8Tc8wbwozIHIwLfTUM=
X-Google-Smtp-Source: AGHT+IEmo2EuLsiQvKf6UbS7ue4IQL/YRmJZHSgoqwKXTxi3PpsLAoyXQzBVJzA9zQct8EPeoVHm3g==
X-Received: by 2002:a17:906:36d6:b0:a51:d7f3:324b with SMTP id b22-20020a17090636d600b00a51d7f3324bmr3318859ejc.66.1713021403232;
        Sat, 13 Apr 2024 08:16:43 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id kj15-20020a170907764f00b00a51a60bf400sm3104956ejc.76.2024.04.13.08.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 08:16:42 -0700 (PDT)
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
Subject: [PATCH v3 2/4] dt-bindings: PCI: mediatek,mt7621: add missing child node reg
Date: Sat, 13 Apr 2024 17:16:15 +0200
Message-Id: <20240413151617.35630-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240413151617.35630-1-krzysztof.kozlowski@linaro.org>
References: <20240413151617.35630-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MT7621 PCI host bridge has children which are PCI root ports.  The
children have "reg" property, but do not explicitly define it.  Instead
they rely on pci-bus.yaml schema, but that one has "reg" without any
constraints.

Define the "reg" for the children, so the binding will be more specific
and later will allow dropping reference to deprecated pci-bus.yaml
schema.

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. Correct commit msg (root port).

Changes in v2:
1. Add tags.
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

