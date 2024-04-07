Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0341DA3A
	for <asahi@lists.linux.dev>; Sun,  7 Apr 2024 10:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712485210; cv=none; b=AFGyf+RoVYxP2LM7nF5e6N7gGaMYi2iMqPXme5rYrCGgbvx1qq3Ra42lXZg4Ftm6zNQZYS5ya13CM/lJLQdJrKvOB5JSkeBbc/zfgHkjHuoGhP/l9WlZVb4ZbY2IVbkxuRPdwkFPrira72tILsPk3NXKbQJfm6WeQL0/HGJduOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712485210; c=relaxed/simple;
	bh=/TaGs6H1tkMFweGzNMhmjEITEPdM49ew19dZoyqN58U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DpxXjhuBgd0qhjL6SEOuq5XHsCdhi9ANfLxk9AGCJOt6pU5zAGwbxBDqcUJ9S6J447zqKza6GNF2e6iQYWrosBbWbWEK+srsMsyql2MU3cUKQSGQ3ZBQX7lJSFEA8p+vsfVdNyJCBszQ+aIWvB28dI+5NC6WorW5DQAD8hpZhtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EmT6gBsy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EmT6gBsy"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4162b8cb3e9so30403675e9.0
        for <asahi@lists.linux.dev>; Sun, 07 Apr 2024 03:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712485207; x=1713090007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11Tiq4ypNUErXvEpc5K8WLl8hiInc4dHhElWuTzssUM=;
        b=EmT6gBsyAmZCOMyVKEEdMRqEr/0YSRiR7HH4rovx8kfm2oBYdBrnjdMacx2on1Y2Tp
         nMwU2leUFfphQ2MXpPIkaS5moYqqnLY7+6rN0jBdDwPyXtr/H99tJju5pD6i1ufdSUVj
         gOlJH66yVAeUCKR8RaMtdaKqQT1P/weBxp49/BYl7v3swzfJPo/nhJChoE35bXwZLnOH
         28oEFkO4/Lu9skTqeK6c4ahDrBkOqnVadDtBdQrYbaYZ08YjzA1mf7RRyhC3a13RlNfy
         HoH1VILKm1gBIpXubg+siORL08E/XEPyQ0R9fDA35CfaldsbWgLwQHkkZSJvWpj0fCnO
         kJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712485207; x=1713090007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11Tiq4ypNUErXvEpc5K8WLl8hiInc4dHhElWuTzssUM=;
        b=ukCmWSS/t/4bUsQA4aPy8UipcHQkBCxm9diw8tZySlPWhOM7MsFjeL7HTaHw9VN0Y0
         xcKtOrRqf11OSkexqHlXU7+zKIdxJ/4NYcU9v6tPs10Ceucaga+0ov+tZ/AZzaV51Jow
         wVUo1t8PHnBkf+l3ySatTU0xNWOKI+f5BhpwXHjXjLvleesw+k/gMAsJfJxtexYUlAc+
         lLIum84A1xJ7oC8xne29r4iBH04XNgjMYbJbqCw8DLZNBeG1H1JD07pPRUfX971ApAtf
         ePRXOEzLSv/0pB/0g4o8RLV5+C+wmubCiePfygQgecKpw0zqb0RoLzpsoJCNTtc0upqr
         xnoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhvLWyzBMX2RvZ4Nu02S2Drj/e0E4GcJU4R0p9naDNLKT/+jBNekjOeyctbeSPJcD5sbbt/CLtCeXb5F78VBP9NtSosFM=
X-Gm-Message-State: AOJu0YyEwFJiYzr/oR8SPVihT8PZkAu4F3yIvyUatBYU0SdRoecQGXAH
	Y0dUJfRxe6N5Dv5jney2MdyeliP+fjyECnppHmdwRiIptcco1GHVcDk7MrNnlLU=
X-Google-Smtp-Source: AGHT+IFIU1jOBpcjYd9g1ytjU4Sh0w9UXvYPRaXVoXA0dFkiv+NuQmTaiBxAo39r6aQx6O2BMQCGZw==
X-Received: by 2002:a05:600c:c0e:b0:416:5327:ced with SMTP id fm14-20020a05600c0c0e00b0041653270cedmr1409027wmb.33.1712485207320;
        Sun, 07 Apr 2024 03:20:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f5-20020a5d58e5000000b0033ec9ddc638sm6354395wrd.31.2024.04.07.03.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 03:20:06 -0700 (PDT)
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
Subject: [PATCH 1/3] dt-bindings: PCI: cdns,cdns-pcie-host: drop redundant msi-parent and pci-bus.yaml
Date: Sun,  7 Apr 2024 12:19:58 +0200
Message-Id: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org>
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

