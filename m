Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2447F27E7EC
	for <asahi@lists.linux.dev>; Wed, 31 Dec 2025 15:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767195771; cv=none; b=DL+SCnHctps7g2M7pou/vxtLEn9p5CsOD9wpKAG2TzERhAR010s5VB0IrHXps6tu6LqlAr5unjj892CY2hzetfI5BswY/b8P/T7v9hR8pO3EK/qd7ubukR6Q0XCyIHC9YEv0HnagaLAcWtKGZDMyfh8gCNWI/ca508QmwD/xPuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767195771; c=relaxed/simple;
	bh=1XKRB48m7TEkKa7WKHtXAYh9aqUPKSVhyVmno5z7WgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T6Hk5PWfRwm+KOeB8NnAQvT2sPmcgU4RFSBxwbwS1+Zok+pqOvvDSGDcdZD7jBy9xGGqrrYqC1aOKjLeSmwZqOzZqZx7vSyOskayrLyY5cUaxp4Z5abZzfhPby4yJmMlolJcHfwbR2sFKUYcsfMRu0Q+EDCOPATesMD2D/G4uAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=iZPy3Pg1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GBNtioGD; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="iZPy3Pg1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GBNtioGD"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7DB4D7A0147;
	Wed, 31 Dec 2025 10:42:48 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 31 Dec 2025 10:42:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1767195768;
	 x=1767282168; bh=AMxvHUMsqVbSRVG/uYZomr36C4tpqxAhlCsTplXYgtQ=; b=
	iZPy3Pg1By71x8Zceftfu7pc7VtrEyVxgK4p+RtB7wSnrZxot0DzAhRX/Sk8kdBH
	nCnIhZnLIHYtak6yhxjfTzUG3HgzRxixXNvkZsCkC5E2II3a459maztq/XQPovMR
	zi8/b2zP8V2S2HfTMF1UXtLtYCj47yYthLNQVEHBuEiNGDXQbpstjyOu7m+VyV4m
	ECqMqWFwKAqsM1BX9z+dMe78CPW06cQrrMAYFWuz3L/+EMZLOG3UfEfbyhoJgh9F
	X1ruS+Nidc5NwjomNyeLn94GkcJyaq24JqsUXaw7vr311t4zQN79s1g7faHx8P76
	tlPYegEFSIXDLxzJCwXWsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767195768; x=
	1767282168; bh=AMxvHUMsqVbSRVG/uYZomr36C4tpqxAhlCsTplXYgtQ=; b=G
	BNtioGDf6nwtMSnce56NvJezVQQTRPsbMXqf9NJK01/349SZM8Gbj6XPcsR7VOci
	yJb/WFeYJM0WDfhqxUiTYzS4W8c8FdqHNgo9BOAVjVrisV4399yLMTaf0UmBExOm
	5QMX3kiRjCMaaFTC/ZO1PftIHpg60fpr4rkpACEDyal1BjIA0EQFu8/ZEFhXvdPs
	G4dKESZdNWeKHBbublEDgmM9Dmb8wr2owtI/RJSTK5Dd1R91Rjlv4KDBidOnqS8t
	f3gzYQe74xOsy8egK4Sj1A0T+hcDhRJyPJ/EDJL3ghrBj4mI+5lCsrnM36IPHzZN
	qDqEFTirAeBL9tNMJMOjQ==
X-ME-Sender: <xms:eERVacMGWZl9F8M9aVeHODt9cEf0u6j3fB5adDnHZGfvJX2lh7eEeQ>
    <xme:eERVae8Qd32KpAh224H3zkrevz0XX7QQRLRwBTzbmoQbCfASn2uCWP5j6OJcQqYbl
    lyYBUrTldY4OrNWGdPcrrPvzmzUN3A760e4TKc_s1H4p6YCQ1RjCug>
X-ME-Received: <xmr:eERVaVdAAMYIa0VEtQKRoR7JgtcPcNWV6eOCL4nJcXHjH8vtOyasdnV5e88oBlwFOq83PpnKnQOmEZPJ_hs-XORdocbYOhA0BdUEdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdekfedvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeevke
    ekgfejtedtudeujeegueetudfffeetjedugeeiveeuvdeiffetleejlefgkeenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprh
    gtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegrshgrhhhisehlihhsthhsrdhlihhnuhigrdguvghvpdhrtghpthhtoh
    epfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtrghtrghlihhnrdhmrghr
    ihhnrghssegrrhhmrdgtohhmpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrh
    hmrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhs
    rdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhvvghnsehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:eERVaVxv0Xzyl0GDmmiQFgWGJy2NlTaxnJd6ZOm0mlYIxPFtqaIoVw>
    <xmx:eERVaSLnJkffXAFWW4WNMKhljlIuBpK6kQfQ5QFjIzGVXqsOEjUAYg>
    <xmx:eERVafGqHdzBntDFf8Zv09fT1r7VAuAHI6qb7uQ3sNFo_qbxNH265A>
    <xmx:eERVaW9-4nWYvsErIYlprxhbFZEc7R1CZ0033Gxzn3EiD8pdyByTkw>
    <xmx:eERVaTfP6CoBBIqeJ-KGZOMN9zRt7CQPzHW8u_-vFtEe3mAJzNaWP286>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 31 Dec 2025 10:42:47 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Wed, 31 Dec 2025 16:42:39 +0100
Subject: [PATCH 2/2] arm64: defconfig: Enable Apple Silicon drivers
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-arch-arm64-apple-defconfig-v1-2-4ff19805ba39@jannau.net>
References: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net>
In-Reply-To: <20251231-arch-arm64-apple-defconfig-v1-0-4ff19805ba39@jannau.net>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Sven Peter <sven@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6343; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=s/FDqe6QkWR4jSje4AbbjqteGhzNfkUn8rzjoiejMRo=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxQl8L5SXaP9ns91F15VYFLaoZSlvBur4nPVdrrFf40t
 VbMb7HqKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMBGBLEaGmW4HPPR/31h3/FzW
 govNH1K8Tnsyvt4SeYfN8YfAjbDvhQz/S3c6muSeKZ1ys/Re4y+V9KRn0afeWzVz3P7AbbX20pS
 3bAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

From: Sven Peter <sven@kernel.org>

Enable drivers for hardware present on Apple Silicon machines. None of
these drivers are critical so build them as modules. The reset and RTC
macsmc drivers would be useful as built-in drivers but they have large
dependencies so keep them as modules.

The size increases are minor and are offsetted by already merged
"default ARCH_APPLE" removals from the linked original submission.

vmlinux 157782640 -> 157902032 (+119392)
Image    41007616 ->  41073152 (+ 65536)

Link: https://lore.kernel.org/asahi/20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org/
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: Janne Grunau <j@jannau.net>

---
Changes compared to the original submission:
- Remove AIC and APPLE_PMGR_PWRSTATE as those are selected by ARCH_APPLE
- Add new macsmc drivers (mfd, reset, hwmon, rtc and gpio)
- Add BACKLIGHT_APPLE_DWI, DRM_PANEL_SUMMIT and NVMEM_APPLE_SPMI
  (suggested by Nick Chan)
- Add PWM_APPLE and APPLE_M1_CPU_PMU
---
 arch/arm64/configs/defconfig | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7365427d98195c48e2f8065a8bb1b..7370e56196cb65257ea6ee42b2872a4ed5dc0964 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -100,6 +100,7 @@ CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
 CONFIG_CPUFREQ_DT=y
 CONFIG_ACPI_CPPC_CPUFREQ=m
 CONFIG_ARM_ALLWINNER_SUN50I_CPUFREQ_NVMEM=m
+CONFIG_ARM_APPLE_SOC_CPUFREQ=m
 CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
 CONFIG_ARM_SCPI_CPUFREQ=y
 CONFIG_ARM_IMX_CPUFREQ_DT=m
@@ -223,6 +224,7 @@ CONFIG_HOTPLUG_PCI_ACPI=y
 CONFIG_PCI_AARDVARK=y
 CONFIG_PCIE_ALTERA=y
 CONFIG_PCIE_ALTERA_MSI=y
+CONFIG_PCIE_APPLE=m
 CONFIG_PCIE_BRCMSTB=m
 CONFIG_PCI_HOST_THUNDER_PEM=y
 CONFIG_PCI_HOST_THUNDER_ECAM=y
@@ -301,6 +303,7 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=m
 CONFIG_VIRTIO_BLK=y
 CONFIG_BLK_DEV_NVME=m
+CONFIG_NVME_APPLE=m
 CONFIG_QCOM_COINCELL=m
 CONFIG_QCOM_FASTRPC=m
 CONFIG_SRAM=y
@@ -464,6 +467,7 @@ CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_KEYBOARD_MTK_PMIC=m
 CONFIG_MOUSE_ELAN_I2C=m
 CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_APPLE_Z2=m
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_TOUCHSCREEN_GOODIX=m
 CONFIG_TOUCHSCREEN_GOODIX_BERLIN_SPI=m
@@ -551,6 +555,7 @@ CONFIG_I2C_MT65XX=y
 CONFIG_I2C_MV64XXX=y
 CONFIG_I2C_OMAP=y
 CONFIG_I2C_OWL=y
+CONFIG_I2C_APPLE=m
 CONFIG_I2C_PXA=y
 CONFIG_I2C_QCOM_CCI=m
 CONFIG_I2C_QCOM_GENI=m
@@ -565,6 +570,7 @@ CONFIG_I2C_UNIPHIER_F=y
 CONFIG_I2C_RCAR=y
 CONFIG_I2C_CROS_EC_TUNNEL=y
 CONFIG_SPI=y
+CONFIG_SPI_APPLE=m
 CONFIG_SPI_ARMADA_3700=y
 CONFIG_SPI_BCM2835=m
 CONFIG_SPI_BCM2835AUX=m
@@ -601,7 +607,9 @@ CONFIG_SPI_TEGRA210_QUAD=m
 CONFIG_SPI_TEGRA114=m
 CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
+CONFIG_SPMI_APPLE=m
 CONFIG_SPMI_MTK_PMIF=m
+CONFIG_PINCTRL_APPLE_GPIO=m
 CONFIG_PINCTRL_BRCMSTB=y
 CONFIG_PINCTRL_BCM2712=y
 CONFIG_PINCTRL_DA9062=m
@@ -698,9 +706,11 @@ CONFIG_GPIO_ADP5585=m
 CONFIG_GPIO_PCF857X=m
 CONFIG_GPIO_TPIC2810=m
 CONFIG_GPIO_BD9571MWV=m
+CONFIG_GPIO_MACSMC=m
 CONFIG_GPIO_MAX77620=y
 CONFIG_GPIO_SL28CPLD=m
 CONFIG_GPIO_AGGREGATOR=m
+CONFIG_POWER_RESET_MACSMC=m
 CONFIG_POWER_RESET_MSM=y
 CONFIG_POWER_RESET_QCOM_PON=m
 CONFIG_POWER_RESET_TORADEX_EC=m
@@ -721,6 +731,7 @@ CONFIG_SENSORS_ARM_SCMI=y
 CONFIG_SENSORS_ARM_SCPI=y
 CONFIG_SENSORS_GPIO_FAN=m
 CONFIG_SENSORS_JC42=m
+CONFIG_SENSORS_MACSMC_HWMON=m
 CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_PWM_FAN=m
@@ -782,6 +793,7 @@ CONFIG_RENESAS_RZG2LWDT=y
 CONFIG_RENESAS_RZV2HWDT=y
 CONFIG_UNIPHIER_WATCHDOG=y
 CONFIG_PM8916_WATCHDOG=m
+CONFIG_APPLE_WATCHDOG=m
 CONFIG_BCM2835_WDT=y
 CONFIG_BCM7038_WDT=m
 CONFIG_MFD_ADP5585=m
@@ -789,6 +801,7 @@ CONFIG_MFD_ALTERA_SYSMGR=y
 CONFIG_MFD_BD9571MWV=y
 CONFIG_MFD_AXP20X_I2C=y
 CONFIG_MFD_AXP20X_RSB=y
+CONFIG_MFD_MACSMC=m
 CONFIG_MFD_DA9062=m
 CONFIG_MFD_EXYNOS_LPASS=m
 CONFIG_MFD_HI6421_PMIC=y
@@ -946,6 +959,7 @@ CONFIG_DRM_TEGRA=m
 CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
 CONFIG_DRM_PANEL_LVDS=m
 CONFIG_DRM_PANEL_SIMPLE=m
+CONFIG_DRM_PANEL_SUMMIT=m
 CONFIG_DRM_PANEL_EDP=m
 CONFIG_DRM_PANEL_HIMAX_HX8279=m
 CONFIG_DRM_PANEL_HIMAX_HX83112A=m
@@ -1012,6 +1026,7 @@ CONFIG_FB=y
 CONFIG_FB_EFI=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_BACKLIGHT_PWM=m
+CONFIG_BACKLIGHT_APPLE_DWI=m
 CONFIG_BACKLIGHT_QCOM_WLED=m
 CONFIG_BACKLIGHT_LP855X=m
 CONFIG_LOGO=y
@@ -1026,6 +1041,7 @@ CONFIG_SND_USB_AUDIO=m
 CONFIG_SND_USB_AUDIO_QMI=m
 CONFIG_SND_SOC=m
 CONFIG_SND_SOC_USB=m
+CONFIG_SND_SOC_APPLE_MCA=m
 CONFIG_SND_BCM2835_SOC_I2S=m
 CONFIG_SND_SOC_FSL_ASRC=m
 CONFIG_SND_SOC_FSL_MICFIL=m
@@ -1316,7 +1332,9 @@ CONFIG_RTC_DRV_XGENE=y
 CONFIG_RTC_DRV_TI_K3=m
 CONFIG_RTC_DRV_RENESAS_RTCA3=m
 CONFIG_RTC_DRV_NVIDIA_VRS10=m
+CONFIG_RTC_DRV_MACSMC=m
 CONFIG_DMADEVICES=y
+CONFIG_APPLE_ADMAC=m
 CONFIG_DMA_BCM2835=y
 CONFIG_DMA_SUN6I=m
 CONFIG_FSL_EDMA=y
@@ -1362,6 +1380,7 @@ CONFIG_CROS_EC_RPMSG=m
 CONFIG_CROS_EC_SPI=y
 CONFIG_CROS_KBD_LED_BACKLIGHT=m
 CONFIG_CROS_EC_CHARDEV=m
+CONFIG_COMMON_CLK_APPLE_NCO=m
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCMI=y
 CONFIG_COMMON_CLK_SCPI=y
@@ -1525,6 +1544,7 @@ CONFIG_ARM_SMMU=y
 CONFIG_ARM_SMMU_V3=y
 CONFIG_MTK_IOMMU=y
 CONFIG_QCOM_IOMMU=y
+CONFIG_APPLE_DART=m
 CONFIG_REMOTEPROC=y
 CONFIG_IMX_REMOTEPROC=y
 CONFIG_MTK_SCP=m
@@ -1544,6 +1564,9 @@ CONFIG_RPMSG_QCOM_SMD=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_SOUNDWIRE=m
 CONFIG_SOUNDWIRE_QCOM=m
+CONFIG_APPLE_MAILBOX=m
+CONFIG_APPLE_RTKIT=m
+CONFIG_APPLE_SART=m
 CONFIG_FSL_DPAA=y
 CONFIG_FSL_MC_DPIO=y
 CONFIG_FSL_RCPM=y
@@ -1625,6 +1648,7 @@ CONFIG_IIO_CROS_EC_BARO=m
 CONFIG_MPL3115=m
 CONFIG_PWM=y
 CONFIG_PWM_ADP5585=m
+CONFIG_PWM_APPLE=m
 CONFIG_PWM_BCM2835=m
 CONFIG_PWM_BRCMSTB=m
 CONFIG_PWM_CROS_EC=m
@@ -1720,11 +1744,14 @@ CONFIG_QCOM_L2_PMU=y
 CONFIG_QCOM_L3_PMU=y
 CONFIG_ARM_SPE_PMU=m
 CONFIG_ARM_DMC620_PMU=m
+CONFIG_APPLE_M1_CPU_PMU=y
 CONFIG_HISI_PMU=y
 CONFIG_ARM_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_NVIDIA_CORESIGHT_PMU_ARCH_SYSTEM_PMU=m
 CONFIG_MESON_DDR_PMU=m
 CONFIG_NVMEM_LAYOUT_SL28_VPD=m
+CONFIG_NVMEM_APPLE_EFUSES=m
+CONFIG_NVMEM_APPLE_SPMI=m
 CONFIG_NVMEM_IMX_OCOTP=y
 CONFIG_NVMEM_IMX_OCOTP_ELE=m
 CONFIG_NVMEM_IMX_OCOTP_SCU=y

-- 
2.52.0

