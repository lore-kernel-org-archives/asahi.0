Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398587;
	b=ztIYG+id82z24C+736A1layJkp8PMjSm7CAj7KJO1H0OARTxVByP+yBzlizkl1PubGQj
	 FAARXUKvcnE90exTQd+2/xfyz7pIUAlHUYPNiWbDgr4HXocp283BM4+lcQwlv0q1mgaUZ
	 Nb1IS4AIhhwedk5N7nwhatE64tz/J2U5ucxKc7lrR2tf1+i15CGJyKLgz8okELtIXrev+
	 zsNWxxNDictF/+zweGOUCS228cQrA4qETHckd3v9IrxlJoaSXHoSvDv9bWCVdHmDsH3XZ
	 XgTSMsw1o8BJVkAuEya2jMzCepnFPqoCyvsIUS0hNPe3rUjoc3lFox8OSQ7aT4HWGOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398587;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T7WXBDAH2fUx4nJrxNoYAO2bnzUVegPGfcbrAyJ9e80=;
	b=XB8nqrhIfpAyR2QsO19L8mOaiwaCzDA7sT+zgg8wrC0llOnHnzwbqLzAaA/t/itYr8vk
	 uEx23DWlUs4s8DqT46ry8DIo2jLWtOZcyz8IYqpvW+RkjOVgTSAIkMmDe/1+XQhndxUYg
	 uCL/DTZlz92lWLloGNQ8QFq0ygJLCH05+ilMEZgeCZzoIt+DrsEA12sZbJEJOZeXxKMJB
	 q0/wGbQEkAkUPguVpaySodYDugKB5mRAwxW9oz5wiS22GcxZfhdBnmFcXB0FRHL6HEjNX
	 17EB6oAfPOvbWvnffVGXdHlFjuQfUwaPw5h73o9SB65zThLVIZMEfXOCL8XzmZfYKOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=JP0bobUK;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34253606B635
	for <asahi@lists.linux.dev>; Wed, 11 Nov 2026 12:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34253606B635
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=JP0bobUK
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794398577;
	bh=TvVgj1zdQCrisXNDq2ObvYC27hGriB3NRJwIIF7WrdQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JP0bobUKG5WfYIHovH70OWguue48x9bN9+1MXbELdgGehV85wlJv1dQ5sAGskbzmN
	 ix0rOKmZW25T0pdtHuER7Te/9UhMvE8LDo1INqVK70v/UXHB3pLB4IZB7FDhp+Z6rC
	 RDFtph2QN+dD3CG9lapculM1GEchyI6+6CEBJyjV/TQxFaRybYYZQ6a4DqGrmIKwLt
	 adePO1dPmmIUOnbbxy2GUgxLHKy0OVpF/buVJI6ySYYWhbM6ywOkLslUnQi4fjhUMm
	 5CQdGTmgGDRY65nboalVt03YYV6scV04VbHXcg5q2pkJYmYbCdlIPpkW0k4W7MDhCE
	 1owmnGln/Sy+A==
To: sven@kernel.org,
	marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: j@jannau.net,
	neal@gompa.dev,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH v2 2/3] Bluetooth: hci_bcm4377: probe again after a resume through firmware
Date: Wed, 11 Nov 2026 13:02:47 +0100
Message-ID: <20261111120248.21062-3-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111120248.21062-1-dev@deq.rocks>
References: <20261111120248.21062-1-dev@deq.rocks>
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

The BCM4377 is powered off during ACPI S3 and loses its firmware. On
resume the driver only unquiesces it, so every command times out.

When the platform firmware handled the resume, probe the controller
again from a work item and skip the ring teardown messages to the lost
firmware. Suspend to idle keeps the quiesce path.

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/bluetooth/hci_bcm4377.c | 59 +++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index da0a48c2be3..4e3630774c0 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -16,6 +16,9 @@
 #include <linux/of.h>
 #include <linux/pci.h>
 #include <linux/printk.h>
+#include <linux/slab.h>
+#include <linux/suspend.h>
+#include <linux/workqueue.h>
 
 #include <linux/unaligned.h>
 
@@ -566,6 +569,9 @@ struct bcm4377_data {
 	struct pci_dev *pdev;
 	struct hci_dev *hdev;
 
+	/* set when the controller lost its firmware during system sleep */
+	bool fw_lost;
+
 	void __iomem *bar0;
 	void __iomem *bar2;
 
@@ -1017,6 +1023,11 @@ static int bcm4377_destroy_completion_ring(struct bcm4377_data *bcm4377,
 	struct bcm4377_destroy_completion_ring_msg msg;
 	int ret;
 
+	if (bcm4377->fw_lost) {
+		ring->enabled = false;
+		return 0;
+	}
+
 	memset(&msg, 0, sizeof(msg));
 	msg.msg_type = BCM4377_CONTROL_MSG_DESTROY_COMPLETION_RING;
 	msg.ring_id = cpu_to_le16(ring->ring_id);
@@ -1107,6 +1118,11 @@ static int bcm4377_destroy_transfer_ring(struct bcm4377_data *bcm4377,
 	struct bcm4377_destroy_transfer_ring_msg msg;
 	int ret;
 
+	if (bcm4377->fw_lost) {
+		ring->enabled = false;
+		return 0;
+	}
+
 	memset(&msg, 0, sizeof(msg));
 	msg.msg_type = BCM4377_CONTROL_MSG_DESTROY_XFER_RING;
 	msg.ring_id = cpu_to_le16(ring->ring_id);
@@ -2432,11 +2448,54 @@ static int bcm4377_suspend(struct device *dev)
 	return 0;
 }
 
+struct bcm4377_reprobe {
+	struct work_struct work;
+	struct pci_dev *pdev;
+};
+
+static void bcm4377_reprobe_work(struct work_struct *work)
+{
+	struct bcm4377_reprobe *reprobe =
+		container_of(work, struct bcm4377_reprobe, work);
+	int ret;
+
+	/*
+	 * Probing stays blocked until the system resume completes, the driver
+	 * core then retries the deferred probe.
+	 */
+	ret = device_reprobe(&reprobe->pdev->dev);
+	if (ret && ret != -EPROBE_DEFER)
+		dev_err(&reprobe->pdev->dev, "re-probe after resume failed (%d)\n",
+			ret);
+
+	pci_dev_put(reprobe->pdev);
+	kfree(reprobe);
+}
+
 static int bcm4377_resume(struct device *dev)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct bcm4377_data *bcm4377 = pci_get_drvdata(pdev);
 
+	/*
+	 * The controller is powered off when the platform firmware handles
+	 * the system sleep, as with ACPI S3 on x86 Macs, and comes back
+	 * without its firmware. Probe it again.
+	 */
+	if (pm_resume_via_firmware()) {
+		struct bcm4377_reprobe *reprobe;
+
+		reprobe = kzalloc_obj(*reprobe);
+		if (!reprobe)
+			return -ENOMEM;
+
+		bcm4377->fw_lost = true;
+		reprobe->pdev = pci_dev_get(pdev);
+		INIT_WORK(&reprobe->work, bcm4377_reprobe_work);
+		schedule_work(&reprobe->work);
+		return 0;
+	}
+
 	iowrite32(BCM4377_BAR0_SLEEP_CONTROL_UNQUIESCE,
 		  bcm4377->bar0 + BCM4377_BAR0_SLEEP_CONTROL);
 
