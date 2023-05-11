Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7687117725
	for <asahi@lists.linux.dev>; Thu, 11 May 2023 13:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683810940; x=1715346940;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8XQL7bYEaCNAsPYfNtNmF5YMRERIojn4B8v+BqlhGOQ=;
  b=LYakeTPoNl1T47aBjSUnD+7lZPvXWyN4gTI5NpJIaxz0q4r5UzKEx6jZ
   n5gccSpRXUi8Rbyo3jxR7xJcZHcSYtXPgiEa4XerKZb+ccTs+qJTsQGGX
   ZghIOTQUBVTWnlFHRjjLvKKTdQKOWikAQOLgj15LR1iWAe19qCzrGpvnQ
   ftbt7oM8s3EReRFYgIZ7NeIlgvREwFXu+Cn6atbLsjKxmWjGhtk8cWNPk
   sJQLVOiNZfBMsqdYyeUvIgO5f2TWI6piTTXAa8LBjXWtRlWm5LbQmZrc6
   EFEZkOp5Ps45zHr0CPQQN19cym3HJ2/Uc9MrWhQMsiQn9s28VNO5y1vNW
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="378619610"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="378619610"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 06:15:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="650169921"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="650169921"
Received: from jsanche3-mobl1.ger.corp.intel.com (HELO ijarvine-MOBL2.ger.corp.intel.com) ([10.252.39.112])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 06:15:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 11/17] Bluetooth: hci_bcm4377: Use pcie_lnkctl_clear_and_set() for changing LNKCTL
Date: Thu, 11 May 2023 16:14:35 +0300
Message-Id: <20230511131441.45704-12-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230511131441.45704-1-ilpo.jarvinen@linux.intel.com>
References: <20230511131441.45704-1-ilpo.jarvinen@linux.intel.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Don't assume that only the driver would be accessing LNKCTL. ASPM
policy changes can trigger write to LNKCTL outside of driver's control.

Use pcie_lnkctl_clear_and_set() which does proper locking to avoid
losing concurrent updates to the register value.

Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/bluetooth/hci_bcm4377.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 19ad0e788646..e2b489f678d9 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -2232,8 +2232,7 @@ static void bcm4377_disable_aspm(struct bcm4377_data *bcm4377)
 	 * or if the BIOS hasn't handed over control to us. We must *always*
 	 * disable ASPM for this device due to hardware errata though.
 	 */
-	pcie_capability_clear_word(bcm4377->pdev, PCI_EXP_LNKCTL,
-				   PCI_EXP_LNKCTL_ASPMC);
+	pcie_lnkctl_clear_and_set(bcm4377->pdev, PCI_EXP_LNKCTL_ASPMC, 0);
 }
 
 static void bcm4377_pci_free_irq_vectors(void *data)
-- 
2.30.2

