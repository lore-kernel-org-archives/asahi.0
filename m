Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60781231A57
	for <asahi@lists.linux.dev>; Tue,  3 Jun 2025 11:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748951858; cv=none; b=KQqTL5BOjLtu88RK8DPQqjKNFTWaENowis2w9EoSl4iHWaJJT4iP+Cfn7K8vXMtGrZa+mxGQ9pGtwJuOe/yyUSmKbInazu+R+7+qk6PXM473c+WSllf4YP/JA64q2vqPqPbzUgRP0vWB2ZzsyQ1SnfRfoYtt66MdOk4vCCQoE2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748951858; c=relaxed/simple;
	bh=In9ZWwzHdKPobwGSTNurFlsX8+WfCzcf4pnpnURGnOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEsj4Apo0w7VWN3LqW0nMVqJHJHNxC0Le0AB3SFG2lMSNzIYWre34VjPKV98gbgPvcfeYiVnOGvDvbfzGgzbXElcj8H5njuW/8YyUuLM+Qwzz5Uuq3Fk/lQNGJVfNTf9ZicJ6xlo0mF4JIpIMe20F4fh2rJYSnQLLGVByZgqXjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ThDcDcy+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ThDcDcy+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450828af36aso2348845e9.1
        for <asahi@lists.linux.dev>; Tue, 03 Jun 2025 04:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748951855; x=1749556655; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vXr8fPf00egmatGOKDz34aDKcgEmfMhnXVj1rBpajmU=;
        b=ThDcDcy+WoEruklHSeMK2rVvTtE2ZRNa7Axjl6jjq6cLTCZVm+/UuxRc7xE0md/iIB
         8NkY0slJiEwInT9syhVwBHMaIu7OZtPExa0OaYuMEB28bzlP7u5+x3pkGGFWBcolevPA
         JLeHSwhmM/Ym11HSpWlfILNJSlV7E11N62g9rGvMUvgoBDLyBvO11KN+FUvUmgHGWIUI
         V53+xOTRLPTHm1EguKMKAYvO/HOa3mRJRPfq/JVfSc71V+gHUAtM0vzCLFVGVlQhBnvE
         YRJkBL1IOqpGTyh3+S5ptfPLs6D5oFSnE11hVE2aOFpXAaQdts996FXtn5XZKDyC+egb
         N4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748951855; x=1749556655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXr8fPf00egmatGOKDz34aDKcgEmfMhnXVj1rBpajmU=;
        b=t1XUNmwyzjdjynnZtCx1VNgZlShgekruie6IsaTnCRFwowHXM4sybydEtswhxldp7o
         kD9st3wSYsEv9qoN534rJAcPS2tvPXhSZ1bLVQrW0wz3dzKnDyaYfDDbUVmN5VLvYZuO
         76j2qOwf5xNFKN4eHZlzy40Dm2N3WwZq+FZnSnqLYP5mT1jS2GoTWGGhnxj1hLoVQcIU
         Jli13nIEoLMFEGQRnRoX2czrwk2OVD5dK745MiPHG1IVHY+SZrENw9/WDl6ub3+7AHRQ
         y7aGodAa+K/SHB54eSBKBiZ5VcybcxmzfmSR9jU6nNcPN4CoKOLBEX7vAHR4B1lB1jmz
         ChuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkEy6NAkCHs1Uaf3DQpsPcym+R+5AxeOwtSvp7/p05BImxwMJcemBu4C54kLOiFOD3LVBO5w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs1eDeZZhpI/hb2EPpfkBixBSVD9NoSBUEdECNq1MqKIEh+9mK
	4AD6Jj/RRkTfeIj5azLz9+cdmJGEav0NpIZKyQMpEw9WEw2HkX0C4nkZEmclOTfo8/g=
X-Gm-Gg: ASbGncsK2oDbUCZAloeKV+yanVZBUEps7XicDb92SDNtwVBBv2obDP+mRUfYnuGhFEp
	kZFiL2OH5o3C2NO3/GSeQTCCuYSV7LZhq613PWML+tcpC0ayi0xFO3LTMXCIOBJD8iZM7hF0Kgj
	TJ1ddFF7B6Jj0SnOfHWQNAJyIVm+8YcGilXyuYynIFOaPRcMLE7asubykB/7sqHOzyNrwK15g+n
	C30RBGCQud6GSW5hIB/GUdA7xcE+j7+m2QFBA7Qu/94rDH13f3gPc9/1AT0f+MkfNkWATJFkB7h
	IycZZ9AUr3HXQn3R55tSvSFPZL76P/C8/ti8hUayc/WsU4LRGHoLy3u81Wuxnyt1aEc7mhch7qs
	NPCHxtwkoXxWFPf3ns1BoFRoJsMf6VPk5
X-Google-Smtp-Source: AGHT+IHc7vfZ9Jls7pqd4J6k0aCDh+rQJvsx6pfapU4HqG5Fs2nmsdWERExeMcxNl0cV1Ifa/yfWyA==
X-Received: by 2002:a05:600c:3555:b0:450:d4b4:92d0 with SMTP id 5b1f17b1804b1-451e3132b4amr12478215e9.3.1748951854649;
        Tue, 03 Jun 2025 04:57:34 -0700 (PDT)
Received: from [172.16.23.13] (adsl-84-227-104-5.adslplus.ch. [84.227.104.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c7adsm17671666f8f.26.2025.06.03.04.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:57:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 03 Jun 2025 13:57:12 +0200
Subject: [PATCH 5/5] dt-bindings: mailbox: Drop consumers example DTS
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-dt-bindings-mailbox-cleanup-v1-5-724407563997@linaro.org>
References: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
In-Reply-To: <20250603-dt-bindings-mailbox-cleanup-v1-0-724407563997@linaro.org>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nishanth Menon <nm@ti.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Suman Anna <s-anna@ti.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3817;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=In9ZWwzHdKPobwGSTNurFlsX8+WfCzcf4pnpnURGnOI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoPuMfcaFZwH9bb0S9dNAm40CuljsCWcpE+w7CS
 Rz+2L02tMSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaD7jHwAKCRDBN2bmhouD
 124kD/9QeML755TJwa+q6NyJCG2/dFgpT6gEYosjiRxkkcvC5kezgKst0oA8mPhfT7+68lSwqel
 wwVtZABbKsDQn/IZi1acleKCkZjAf2mI6XZNNhjl5bwSR4Sz+Vi9/NADv6xDv+mN8jZ+ICjwu9y
 tdpxGOFN791CYC4LlqwPfrxkCTXCQ7KamSyPduvwkULCeM8ELDa1xNwoHXBbgH7vObF/mJbMonF
 4hGz19dD0HFoCZ3cIf1YhezaYF2U+1Eej9MW5x1Zu/ErlISqCOlyEXiHIuhtM4JgxMTqQu62oKD
 gxaCDQ9ddIICmpY5a/OHZj5Z94FAroXzhsLc5v0j/qyopvezq47jKqztcpGsvbqY4bXBMKVnqP3
 i1wiFEQrhf1PGnJM0ZYmlPUgMXp2E8X58tgqkhBIiVxmczsp+qMpTyqSMRWJQEE203EHJ2KctRL
 CUSj+k91UZbE1qzLtVzBucvP70Yz5wh3JNr85Kjj/gg8hvDuWnn20lukNzd1xEr33C0Ar++BEgX
 n/JtchllxwY7IFYq5+5I09kqV+uLPaMgWR+h6YcYQIJXGmCn2f5ODOS2XeW5MQ4lQEafpUwpfGM
 e6A6q/4CpvTsXYxz10mwer+CW8mornr2kBt6RLRQE6QmE/+wxLyk3ilI/RzAMnM51geNFpIQnjG
 7k8TFFyHFeUL+hw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Providers DTS examples should not contain consumer nodes, because they
are completely redundant, obvious (defined in common schema) and add
unnecessary bloat.  Drop consumer examples and unneeded node labels.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml       |  6 +-----
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml     |  9 +--------
 Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml | 10 +++-------
 3 files changed, 5 insertions(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
index e1a44e4ae6f91eaa1cd81b357e9e5caeaaf0f5bb..3a387d5e4f065e6fe1bed7e402cb236f4e13ef56 100644
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -108,14 +108,10 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
     #include <dt-bindings/mailbox/tegra186-hsp.h>
 
-    hsp_top0: mailbox@3c00000 {
+    mailbox@3c00000 {
         compatible = "nvidia,tegra186-hsp";
         reg = <0x03c00000 0xa0000>;
         interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_HIGH>;
         interrupt-names = "doorbell";
         #mbox-cells = <2>;
     };
-
-    client {
-        mboxes = <&hsp_top0 TEGRA_HSP_MBOX_TYPE_DB TEGRA_HSP_DB_MASTER_CCPLEX>;
-    };
diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index a58a018f3f7b9f8edd70d7c1bd137844ff2549df..ae28ba44855f75e83ea70ce3c670465ae145178e 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -200,7 +200,7 @@ examples:
   # Example apcs with msm8996
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    apcs_glb: mailbox@9820000 {
+    mailbox@9820000 {
         compatible = "qcom,msm8996-apcs-hmss-global";
         reg = <0x9820000 0x1000>;
 
@@ -208,13 +208,6 @@ examples:
         #clock-cells = <0>;
     };
 
-    rpm-glink {
-        compatible = "qcom,glink-rpm";
-        interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
-        qcom,rpm-msg-ram = <&rpm_msg_ram>;
-        mboxes = <&apcs_glb 0>;
-    };
-
   # Example apcs with qcs404
   - |
     #define GCC_APSS_AHB_CLK_SRC  1
diff --git a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
index 1a2001e58880d2fc26954b26cff8ed53e7667f33..8504ceb64806bc7e25468597acdff99624571e9f 100644
--- a/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/ti,omap-mailbox.yaml
@@ -242,7 +242,7 @@ examples:
   - |
     /* OMAP4 */
     #include <dt-bindings/interrupt-controller/arm-gic.h>
-    mailbox: mailbox@4a0f4000 {
+    mailbox@4a0f4000 {
         compatible = "ti,omap4-mailbox";
         reg = <0x4a0f4000 0x200>;
         interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
@@ -260,13 +260,9 @@ examples:
         };
     };
 
-    dsp {
-        mboxes = <&mailbox &mbox_dsp>;
-    };
-
   - |
     /* AM33xx */
-    mailbox1: mailbox@480c8000 {
+    mailbox@480c8000 {
         compatible = "ti,omap4-mailbox";
         reg = <0x480c8000 0x200>;
         interrupts = <77>;
@@ -283,7 +279,7 @@ examples:
 
   - |
     /* AM65x */
-    mailbox0_cluster0: mailbox@31f80000 {
+    mailbox@31f80000 {
         compatible = "ti,am654-mailbox";
         reg = <0x31f80000 0x200>;
         #mbox-cells = <1>;

-- 
2.45.2

