Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066527;
	b=eexAJwy2IhGnHJFE6O4JoZYbyOaUEdnkC/0gBIiMu3vxZ2JU74UtHdYXhY58DslFTESG
	 X8h/MB2lfz/CZVTHbJyHMZQGfI4hKYK5Sy4q2CQxJw5Uk/ITmSPQ4+AkPEomcnzXpN1vh
	 BIoBpgb0DJvelrLjcJAggvW/FxyvHGq67qqK8/xfGcbMPafc4NaSc8wrx4LvROFRempv3
	 XxugzS7k88mmCGLlGz6jDDsjs8WNuJtzZflXwsg9PUYerTnwLlw1WwNmtMrOk/ESBRxQ4
	 0Vb295JPBnNZ1q2IV3apaB32YExYMikECyogiDA29zYfCjpq/0kg35Juiwmm4DiDNKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066527;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GU1rR6DOyFxE66mLliEw1hVk/Ddk8r/dNCEfmv4kUDw=;
	b=q7p/BbBu2wO04kFYivy5wkLqxFUyJUQDE75mSyq8gJRunswDNO9uOG+3coGZBzg1W1+w
	 q8qJ6MmOWEESunDZqEoenKL2GvOh0FOf9SHK+owDsqxbawYA/CHzDnIGr7+0ps1CX3o4v
	 SGwAMrEe+c6cUago0wh0QT2kqnyJbMq8BKd54nHrqafZNe2SJBffc+ncRClZuqjuMwr0e
	 b1Dn9c4qMYl2zGiHhm1C+ueHYa8LUT8NwuAza7u2TT8RA4Pg615g9sO3oFfTr1+qOpyWS
	 /ZwbUytbSgFQBQ61+nf6UmU1dTUZeuHnZrXlttkqrHZITlxRJ+Gqj7rT5tyAuYrO+5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=io3J3QGV;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C54296083635
	for <asahi@lists.linux.dev>; Sat,  7 Nov 2026 15:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C54296083635
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=io3J3QGV
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 8ae99b4b-17f8-4abd-a4bf-a9849e4dc355
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794066524;
	bh=yawQ4E02fUTwAlaYm0llbngJGLthGeeE2ZDGDd72jJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=io3J3QGVTIYcd5iHTXWWiotKzNwqsPL7uYyu7D1IMdBYJJAMV+EhCztkYdYGe7QWH
	 catJ/qhuTC8qWdOg0YlWVNMmDVL3MZRZXBBiTWcqcn70WuqICYYj2sA/18uoV/DRaJ
	 j2jMqznTaiGbSUL+VQx+9m6YZi0hcm+1u+l7Z6C4GIY8QIArMdVo8WW581UpoYb/eD
	 9zwdWGjBQkB7YJ3ca+25zqtf/3mPJfErPiOKopfkkN3lG7VxX89Dlfhc5yr3c8Ckq1
	 Sg0HA5pir6MWFOAoki8/hcQP62Hi+qNPVwnC+kNb5bznRbvGo5wyh2gmf2K0ijEW3L
	 OJI1Ut6QnhWSg==
To: Sven Peter <sven@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] Bluetooth: hci_bcm4377: treat only negative hci_register_dev() returns as errors
Date: Sat,  7 Nov 2026 16:48:38 +0100
Message-ID: <20261107154839.89941-2-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107154839.89941-1-dev@deq.rocks>
References: <20261107154839.89941-1-dev@deq.rocks>
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

If another controller already holds hci0, a USB Bluetooth dongle for
example, the BCM4377 is registered as hci1 and probe returns 1. The PCI
core takes that as success, but the devm action that unregisters the
controller is never added, so it stays registered after unbind while
its driver data is freed.

hci_register_dev() returns the index of the new controller on success.
Check for a negative return, as the other drivers do.

Fixes: 8a06127602de ("Bluetooth: hci_bcm4377: Add new driver for BCM4377 PCIe boards")
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/bluetooth/hci_bcm4377.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 66d49b47154..da0a48c2be3 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -2410,7 +2410,7 @@ static int bcm4377_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return ret;
 
 	ret = hci_register_dev(hdev);
-	if (ret)
+	if (ret < 0)
 		return ret;
 	return devm_add_action_or_reset(&pdev->dev, bcm4377_hci_unregister_dev,
 					hdev);
