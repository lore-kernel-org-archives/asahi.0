Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CED7156FC
	for <asahi@lists.linux.dev>; Fri,  2 Jun 2023 11:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685706516; x=1717242516;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9QPnZYdorgxm2tG/6TS44yuCtoro1PqrgtUx93Xiu78=;
  b=I40eR2B7WS00Qn1kFaQvwVZM1zkfbx3Z8abV706xgpY4sPmwj0zT5BFN
   9HMzJK9rgfbgdKlVpB2di5MsK7JoeZrqiCRmYl5huPQkPTDutF4wCDed3
   La5c/ve7Ktqwa5ORZPWjewwv1p1adl1WJm6fQdetLnqRZg8Z5Pw5xyk4x
   0iRHQNjWj0DSQ0fpTsvTDaodl/sUnQQ+Vo2jXvyXVHG87RFSv9JBtoz2B
   Cs5LWtQ+rsC/5Nd1YUrqBSsGPyzuHAIiBxsXg62zStUJhYU8VgF8x3oQ5
   WL2ozHeFf1k3DjVRll8H9WcCjZZw0//qoTo+SvBn8IeUuTfcfN3Bnqvot
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358279679"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="358279679"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 04:48:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="707819452"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="707819452"
Received: from rspatil-mobl3.gar.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.251.208.112])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 04:48:29 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [RFC PATCH v1 06/13] Bluetooth: hci_bcm4377: Convert aspm disable to quirk
Date: Fri,  2 Jun 2023 14:47:43 +0300
Message-Id: <20230602114751.19671-7-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230602114751.19671-1-ilpo.jarvinen@linux.intel.com>
References: <20230602114751.19671-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pci_disable_link_state() was made reliable regardless of ASPM CONFIG
and OS being disallowed to change ASPM states to allow drivers to rely
on pci_disable_link_state() working.

Remove driver working around unreliable pci_disable_link_state() from
hci_bcm4377 driver and add a PCI quirk to disable ASPM.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/bluetooth/hci_bcm4377.c | 20 --------------------
 drivers/pci/quirks.c            |  3 +++
 2 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 19ad0e788646..2348ee2380db 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -490,7 +490,6 @@ struct bcm4377_data;
  * clear_pciecfg_subsystem_ctrl_bit19: Set to true if bit 19 in the
  *                                     vendor-specific subsystem control
  *                                     register has to be cleared
- * disable_aspm: Set to true if ASPM must be disabled due to hardware errata
  * broken_ext_scan: Set to true if the chip erroneously claims to support
  *                  extended scanning
  * broken_mws_transport_config: Set to true if the chip erroneously claims to
@@ -509,7 +508,6 @@ struct bcm4377_hw {
 
 	unsigned long has_bar0_core2_window2 : 1;
 	unsigned long clear_pciecfg_subsystem_ctrl_bit19 : 1;
-	unsigned long disable_aspm : 1;
 	unsigned long broken_ext_scan : 1;
 	unsigned long broken_mws_transport_config : 1;
 
@@ -2222,20 +2220,6 @@ static int bcm4377_probe_of(struct bcm4377_data *bcm4377)
 	return 0;
 }
 
-static void bcm4377_disable_aspm(struct bcm4377_data *bcm4377)
-{
-	pci_disable_link_state(bcm4377->pdev,
-			       PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
-
-	/*
-	 * pci_disable_link_state can fail if either CONFIG_PCIEASPM is disabled
-	 * or if the BIOS hasn't handed over control to us. We must *always*
-	 * disable ASPM for this device due to hardware errata though.
-	 */
-	pcie_capability_clear_word(bcm4377->pdev, PCI_EXP_LNKCTL,
-				   PCI_EXP_LNKCTL_ASPMC);
-}
-
 static void bcm4377_pci_free_irq_vectors(void *data)
 {
 	pci_free_irq_vectors(data);
@@ -2288,9 +2272,6 @@ static int bcm4377_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return -ENODEV;
 	}
 
-	if (bcm4377->hw->disable_aspm)
-		bcm4377_disable_aspm(bcm4377);
-
 	ret = pci_reset_function_locked(pdev);
 	if (ret)
 		dev_warn(
@@ -2448,7 +2429,6 @@ static const struct bcm4377_hw bcm4377_hw_variants[] = {
 		.otp_offset = 0x4120,
 		.bar0_window1 = 0x1800b000,
 		.bar0_window2 = 0x1810c000,
-		.disable_aspm = true,
 		.broken_ext_scan = true,
 		.send_ptb = bcm4377_send_ptb,
 	},
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index f4e2a88729fd..25b7d7bcb279 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2407,6 +2407,9 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
  */
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
 
+/* BCM4377 must always disable ASPM due to hardware errata. */
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_BROADCOM, 0x5fa0, quirk_disable_aspm_l0s_l1);
+
 /*
  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
  * Link bit cleared after starting the link retrain process to allow this
-- 
2.30.2

