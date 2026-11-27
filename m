Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785911;
	b=J3K9wfNg+H2zBldBT0FZslF1qy2EtfSMKdicQTd8aDWSLWvXUILaLtcGpBBkSaY6LoHz
	 WPOREBeM8/FpQRMHV/Aide9XR6EqIb9JntTMD7vrEphnd5B1CiuHEmzZEQJvESb8jJBQe
	 JCj5x4KhzjFq6HcLSwQ1GEttdGRf6Qxzm/8N4xI9BowcdqyO4nyWfVB79dgQ+jzChXv7W
	 ST/mWQLz+Mq5gH0N2lH4dYaEpBWZ0zXU0vSVhb6OpwyuJ5rPd43kns/XAo4udbv/gfK2D
	 Mb/Sbqs78y/XWI0DtkF1+glqYe4T0mR3My377f0GOq9tmcVQEcdDWa8Hl8NFH05OxNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785911;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tfsVJeJwoTJiKqOmwk8wLZHyZsE94at7N5lewUc/Esk=;
	b=K5rgQoa8BJJqk2kne3rGzkhhn61W6SdLIG+Z72iGZ8sfOUd0t/IwdkQoEbMT+1RVc4+r
	 9J4vHH0pJvbM6iv7a5pJ2+rJcI3hnSEteWg1tyY7EpxUFJxgoXAd8zU9GBz6JWmvuWcLe
	 MGuIaxyPNX5fwNkmvpCGSGlKI5FqsEE4DaFiMrLpZU/0DOmeOKh648aJUi7FcsBqB3ZsQ
	 9fJgRlo8EpM0N03IfsDpHykcveRqkL8N51YiIYXbVWCteXZA7D36LQoidzZeff0kfUAUq
	 GcfLquRFIveU/qnACwvkNAQ8CN4YEKJU9tPwdzS//DUQe7BelYw94yu7LuvX7x0zxvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=JwHmXFds;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC87606A329
	for <asahi@lists.linux.dev>; Fri, 27 Nov 2026 13:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DC87606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=JwHmXFds
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795785908;
	bh=p0cocobOgw98O0lkAGSK3F5IMjPJ/CuN79FKcDuz6d4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JwHmXFds2j7Y+B55qCcGYxj5tU3Z1umtwucK28yxLCln+iBEWphP+kdZsZPXx5x1o
	 ONt01ou++sU+dddBXlLinRp6KVIF/NlK6Xu/x9rjZlIoCzksnT5P6rzFXnVtI01o4E
	 C4RQlzfZaiQ2CxXCnFctSEln6/ouNypiTD2BDRvxzmDKPu6a6O8j4v4NeGPjm26+cY
	 VM20v2c1oYbi5hA/l1b4UA/UB2JG2Ktqzf5bTHX5GhDUIDNcNiflMGr7iSNih+nXh8
	 2fw7BVjDy4grFq0SWlL6zYjT41x6ORYfZ9lf9Y44VwZsf82pJZ1+kb9YsZbBhdSIdV
	 NSERuhk57tUXQ==
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
Subject: [PATCH v3 1/3] Bluetooth: hci_bcm4377: check hci_register_dev() for a negative return
Date: Fri, 27 Nov 2026 14:24:59 +0100
Message-ID: <20261127132501.262651-2-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127132501.262651-1-dev@deq.rocks>
References: <20261127132501.262651-1-dev@deq.rocks>
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
Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/bluetooth/hci_bcm4377.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 72a9f269e8b..8c9833d625e 100644
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
