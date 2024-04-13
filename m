Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93FD32C85
	for <asahi@lists.linux.dev>; Sat, 13 Apr 2024 15:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713021404; cv=none; b=HoEGhr6PdtqRF1KHmFPtCZSaKGo0bmWrFnQzYSUHoQmvIId3z93CCyIXwn1GihUCZBc5aIfG+ssuIxye5DHC9yeZM9UTpDvQY8u8ZeGF2q5LDxH2JKLKi3mlB1qQzWRQ/xoIwzyPmUydJ9Bgj7Mpp6D5jdM3kz8dCMEos6zUDFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713021404; c=relaxed/simple;
	bh=hH/i56/VVMXc5h7IY9kB8GOOP4BZo9JkA0T8zeB0y1M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FMmumFcfGt7eHR5zfstXreNFyoAFEEQ1jfLHX6vNC1RJ4Ct+jlD6V+jzf6AxHBhqHLsic8dkgF8XYoUd2w6KrRsInLIDqt33mfXbiCwP36e/v9QY+MwnyT2a6dNKDMX1O31Cgdd6mZLDZw6OptIizbr6b+EOzUtIIFyIygU70DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hbyo6LWc; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hbyo6LWc"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d82713f473so30726321fa.3
        for <asahi@lists.linux.dev>; Sat, 13 Apr 2024 08:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713021400; x=1713626200; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3KLUzTPW+KpN4IRI1ic6uWm66ErzBdD1Xi0Bbn1RRvE=;
        b=hbyo6LWcS4pag1inhZnQb4A4vtVuqHHaR9RYHcnx6n9r8BjPo+mb18ZTJqagqiQRpf
         kias0RlHvxG0ZxO1GiAEP+NyFmNB+nDSMTbey+XEz0ZSdUKZzlzg30UWT5P5pyPoHBcP
         jMmPHjGX9gORXnufUyLR6npDVV0FyQFN4iZ5WxIY5LLtIUm+tahXeKswZbkQjuu5mc17
         Mn50x/X5XXc5sNRML3SJ2cq450f31T1G2bOi08b+6rdSNp3I+Ycwx2KZv6+pOzc3uMOS
         1WxVi1IV6lscNccJ7SDwmhlU3bjpbIaDvpAVWKioAg9YoKIw9N6GFONuTSI0USD1HGse
         L6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713021400; x=1713626200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KLUzTPW+KpN4IRI1ic6uWm66ErzBdD1Xi0Bbn1RRvE=;
        b=DlOtl4cz4v47FsBQSh29x8teo5QyYiAg7EZalwjLZiF0w7YoNxwJAkLhMFh0tDJZ8A
         ZIBnRsgIxXChEGwoNmP0UoJJZ/A98KF5dWOSFJroSDlS/vHBsu59iotEGn/egMtC+ceb
         TAdwgsMFzNpgJGq/V5U2W6NBPOdjMTTGS/kuPKZzZ0TBTkMaehbi3pwvgaPhno4oag8o
         4RF4kjSbQt2bXoPoPPbQNg2rf83AuyOp0i2gi3OIVFORIwoeSceyypxb+YqDBP72EIGv
         iNTcmYwZMsapPDoebfIONCaLvGm4bFlaDHFoNjCtwUD7noj9JCvGPkhowQAzA4FJKQdL
         UcHA==
X-Forwarded-Encrypted: i=1; AJvYcCXGxQ+bpGSCEJnk0Gdb9Dr4lVlyhcFYwlF82hA+5c+z7GRtIWP9Ct7DRtGso0gkl2Wop0mQi36w4vTiZ4r0Pn9izreXfd0=
X-Gm-Message-State: AOJu0Yz130feoI36aBnQy9VqoOaA/0P9Oo3+6jD0yRtkNKlczg/lkQrq
	50rmZLrB2H7rCCL1KkcAiX8CxVgDPaaNEf/F0pkcOZZwu90YZQRXgZVWFX65CHE=
X-Google-Smtp-Source: AGHT+IG1tNnKVrVnl2J/+j+UL2Wl4h4NMws2XRL9Lu8vXwFs1VUku2GIOwL+IkYjq0NdIfadi6221Q==
X-Received: by 2002:a2e:9ed4:0:b0:2d9:fd90:af57 with SMTP id h20-20020a2e9ed4000000b002d9fd90af57mr3723839ljk.51.1713021399920;
        Sat, 13 Apr 2024 08:16:39 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id kj15-20020a170907764f00b00a51a60bf400sm3104956ejc.76.2024.04.13.08.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Apr 2024 08:16:39 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: PCI: cdns,cdns-pcie-host: drop redundant msi-parent and pci-bus.yaml
Date: Sat, 13 Apr 2024 17:16:14 +0200
Message-Id: <20240413151617.35630-1-krzysztof.kozlowski@linaro.org>
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

Changes in v3:
1. None

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

