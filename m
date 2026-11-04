Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793805378;
	b=Bg10OZJVIsL9XbIJPZkKQENTdhpZz3fkXhV7PSgVmqU2DhmkFCZVNy414Cd3FRu9r2Xq
	 QEtNrYIc454kcF3jI9JYc18sWham4+vnxDizRhz/2IMmJJR/Nx+WP7F5AzJJdcCu534q4
	 +yn6Ox0dN2PxGej7SVhHAAbhE08YQ50e2A7BfF96kF0yCvDf3X2teWuQE+1i6XRpD+nF8
	 xYNXxTOS1Z6VuFMeXpHQhdd0IyA8cZW6ZhWdMFkFSTPKuiXlmM7A+1zyd9hdj4u2AfIA2
	 6feO/4UQ+r6QG1+J62Z69euWENUVFvydZXK6ecK/ihfGngX74pj7Rl0G8OfdIJsIFmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793805378;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OqDo8ZjWnldpjQLZtviwEAKFTnnvBemRbk1Ky+Mok18=;
	b=UZD0Qg1bjWkWo18MMe0ubeNjgV4nYfRJGuJb4nx3akkYXs8uUCRz9dGoV/C1XLFDJRkU
	 4oJq7ugSUrcJdAte9HPxsAgsxMr84Prq6AL4YYzhd02nh/+bH12A3eS81coZ0XOO78PFe
	 a/aPbD+D3LLc4MUMFAUABbn4LTRvpmLhVeBV7y6f6ecbkeLigIX61ETEBcdzZYjMBU+om
	 K9UFfw+vR/LQLWb6mzwrtZAvuoUepu8Hr3vHniiYY03gBa1Q3iTaW+jn7sBAMY5ZwbfA8
	 +y1TDreRjlWcPG2UW/v8G9WmT5PWSlOmSqskth36aq7FNP/JpjyDVEbecwM5J+DRaNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=ebBIYhlM;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F2C6083636
	for <asahi@lists.linux.dev>; Wed,  4 Nov 2026 15:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22F2C6083636
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=ebBIYhlM
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793805376;
	bh=JfQzV030AVQ0gGFAqN90Ocdak/ZrdoDwpXmDpK8ZLe0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ebBIYhlMVX8RH7xQ6B++3qwd5Lv5lPTWN8GoEJOK4SqgVgb3H6FK2eOH04V+qeMob
	 eJMG7K7RHrV9qvaDSkVwHEwnwJxVN0DYMWnbsRarCzoqyDI9OWT3ny3VpixW3l+6Zq
	 kOm0dztD0n1UO+vu2xXOMFfRCSQmoh/aiDRW5iX3ffbCZFIIeTux7f/SOFsTr9kvxG
	 5/Z1Kvr+sJzPgzyZCaiQq+KMKcvCYHMmXY5QNv++Qcu+6XKr3e3J8sDgVyDYxxR8+c
	 IDgyOL/JXne/SsqdOgSeUC5vc/Hz4br51u8XxVVCTpj9Lh54ENj2bm1UShojJ6rbpS
	 exvvHQ2iDJI3w==
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	66ton99@gmail.com,
	josemiguelo.ochoa@gmail.com,
	aditya.garg@linux.dev,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: [PATCH 4/4] Bluetooth: set the strict duplicate filter quirk on Apple Broadcom controllers
Date: Wed,  4 Nov 2026 16:16:01 +0100
Message-ID: <20261104151601.70493-5-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104151601.70493-1-dev@deq.rocks>
References: <20261104151601.70493-1-dev@deq.rocks>
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

btbcm_finalize() sets HCI_QUIRK_STRICT_DUPLICATE_FILTER, but bcm_setup()
returns before it when no patch file was loaded. The MacBookPro15,1 has
none for its BCM4364B0 ("BCM: firmware Patch file not found").
hci_bcm4377 does not use btbcm_finalize() and never sets the quirk. A
service discovery then scans with "Filter duplicates: Enabled", and the
controller reports an address once per discovery cycle of about 10.7 s.
A Mac that changed its advertisement data on the same address was
reported 6 s after the change, at the next cycle.

Set the quirk in hci_bcm on that path and in hci_bcm4377.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/bluetooth/hci_bcm.c     | 5 ++++-
 drivers/bluetooth/hci_bcm4377.c | 5 +++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 1ae9619ee1e..ee077c8502d 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -597,8 +597,11 @@ static int bcm_setup(struct hci_uart *hu)
 	if (err)
 		return err;
 
-	if (!fw_load_done)
+	if (!fw_load_done) {
+		/* btbcm_finalize() sets this after loading a patch file */
+		hci_set_quirk(hu->hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER);
 		return 0;
+	}
 
 	/* Init speed if any */
 	if (bcm->dev && bcm->dev->init_speed)
diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 8d99a7a8f76..7105372898d 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -2392,6 +2392,11 @@ static int bcm4377_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	hdev->set_bdaddr = bcm4377_hci_set_bdaddr;
 	hdev->setup = bcm4377_hci_setup;
 
+	/* The controller reports an address once per scan with duplicate
+	 * filtering, also after its advertisement data changed.
+	 */
+	hci_set_quirk(hdev, HCI_QUIRK_STRICT_DUPLICATE_FILTER);
+
 	if (bcm4377->hw->broken_mws_transport_config)
 		hci_set_quirk(hdev, HCI_QUIRK_BROKEN_MWS_TRANSPORT_CONFIG);
 	if (bcm4377->hw->broken_ext_scan)
