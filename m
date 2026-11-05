Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.212
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869082;
	b=l8T/oIkDAmeGNJie90VNPgayN8hUE6ed1y4v/B/GsRutnKJn1ot7Vk5P83h9rKyk5oMd
	 dt7rdIADZkZzdBj6ksH04Mz6feHP48xz3Tzwrh3da30ZSCtMY0oAVvEVRXNeB39nPNqyZ
	 SmvyIeouyn36UOWEx6fI1KRTNI1aFC4KHaY6PciEP1FlZXZ3beg/zV20Wf/8J14ZF7efr
	 eIJVh7ayzW7Uz0fHbAHZQnjO9Pus2wqHm2mEx6AFI1mTlAGF9Peu2AQ3Hr359ZZTuudIS
	 qqUeD1HVdkD0PcuMD58ggwkEp6SlqTpfj8ftAkPxeEiqe5SR16HBCOX7azQx+l28g7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869082;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6UOkymQhnfOrj2yAZv17rmW+xuQ+0zZXE06/CQLTSww=;
	b=1m+aq+DrHlP5QzUZ5ygx7TKwdkMo70Ey2OAfbZ9lJKZJDvtydLQ6LVee++onQlBIK12w
	 U9lPw+kbQcJLA69/MGq/39gFxrnro8Yrjrx0QGQuHAsVNItJttW0siNwjVFehQQAuGO6E
	 UorgCRR7JAFjEIBnBP3KSMAW1U0vQiOyocM/8IZYW6CB3NZglS0yczNOVc3eM7gEGGwoY
	 +EVNTXUFVlcJFhoOQpSs7Q3L82UnMUwR120d1AFTj9KWtYTxLg+qCuHk0lCCt92XhEcY/
	 LUxUdBNefIjIj7Z64MNgD5zV6rw4OSiuKqfzeRFIHC1vhinMjqdvtiFeqd8G5SWxfZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=cbGVGSKj;
	arc=none smtp.remote-ip=91.216.248.212
Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751E7606A333
	for <asahi@lists.linux.dev>; Thu,  5 Nov 2026 08:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 751E7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=cbGVGSKj
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793869079;
	bh=AlntEjGZGdpJydOR7xazAe3mieEGTxbT1NLXNTsDkjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cbGVGSKjSlLWifvxO0qrhgHm2nn1svRBdsFavoAUjaVD7q5UqCRG4z/V75mVI/6a4
	 jlyqAKYQAY+rZqxFunTLXcylQ3O0rSxOPXT6UrU4GdqoMtzEQNLD+maF5j1tawaB/U
	 fS6LtVJ8jrUDq6UfE6hqnIKuRPY9kmDk1Pm4xZw+wb3yNuNAgJNurn0YDarmiihN8U
	 4Lsz9/dzZp7SLvZs0xDfqueoCDOvVx8H2ZiJ1niRiqSG3ahJ2aTLMDCreGu3OJVC0F
	 1pv1SpPCWUIOiI6gmb4okeTXIRiuY33yZetuU2NZ4C1sPufQBGlC83lsrtKglvf0AK
	 15Fn9UO9skexQ==
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sven@kernel.org,
	j@jannau.net,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: [PATCH v2 2/2] Bluetooth: set the strict duplicate filter quirk on Apple Broadcom controllers
Date: Thu,  5 Nov 2026 09:57:50 +0100
Message-ID: <20261105085750.120392-3-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105085750.120392-1-dev@deq.rocks>
References: <20261105085750.120392-1-dev@deq.rocks>
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
index cf4f1455cf9..9eeeaf5d6b0 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -596,8 +596,11 @@ static int bcm_setup(struct hci_uart *hu)
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
index 30fcadfae3f..66cdd896c95 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -2391,6 +2391,11 @@ static int bcm4377_probe(struct pci_dev *pdev, const struct pci_device_id *id)
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
