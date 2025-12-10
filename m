Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5389931ED65
	for <asahi@lists.linux.dev>; Wed, 10 Dec 2025 23:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765408890; cv=none; b=fiySx9yiHyjILNfRiOj1NbRDCfZdT7wbZG8USiKQNJUE/j4IJmkwrA9MRCOvRrIfSRo49O5QitcCMHU617tc3hwgtHm09dfqCb7YlYPFDwSrmFDuRt0mWe/WGPpqxJa1u2HRAhLi/cYF0es5y04l5LtGhEX9uPQOSZwJBfq4r0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765408890; c=relaxed/simple;
	bh=7U6Hf0CN4Pzn/d+Dmrxb012ZiCGtKjQudcOEFKhWfgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sqHGNqJMlgjndvGxsEM8ASntnShnDM8e5vqJrYMPfq384aqcZMeIk/oWMlpxeaER102dc8W0vo1HrhRcoY9cdJ9t4M8Zj9B8GSN+YMIPf8BiSqq7JXCSSUvIS+0ay1WC4W0ryW4RPhgg/jVmsdQrZDcbGW6H17lZAlIXaBP8haw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lq4Btx+1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lq4Btx+1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477b1cc8fb4so1947435e9.1
        for <asahi@lists.linux.dev>; Wed, 10 Dec 2025 15:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765408885; x=1766013685; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L08jHXpXjen58cg14Adrr2f98WJp67FFgA9qD2YXBHU=;
        b=Lq4Btx+1hWwOPjCDk//9vw545ayNfHX8EV/PRhjtWFjMdslUKR6rohiWxzMGVf5wpL
         tEq4GYVTnzU/ScD1zGNC69DuQ0FsYghmTrBbT7set5Jt51i9cqYEkTMW/1ocTdBluXy0
         sqa9S/KqdMfEcoUBimz5OywMms0Ulhv1xKQ7t5cqvH9qdm7N5gbbcsw4HL1u9QxNv2S+
         4NhLIzgZE1twAZTMjAJYTl2MTNwHpkOb3W5XSRQMLVuFs/UEurgq27f3FRx+8NwAYfGh
         q959BKigyW6UeTU51c4gwHSE/Cie2jK4zz56vTktiNoR5YIUCeeJsmgce0pus6Fpoduz
         5uzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765408885; x=1766013685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L08jHXpXjen58cg14Adrr2f98WJp67FFgA9qD2YXBHU=;
        b=MXm0IBATv0JPzdkePfcTpDu8Knh40nl3AEIZSTrvTiEZTjXatlqohto3cc9TjYZk2y
         G1hHiACBAaMZhV6pv4Tyy/lSqnsdvyQc53/gjaokR4bON1sqlDhqmFdZ2iSJVJDr4BK/
         ryqcrocsos+QpD8eFJ0tocJyaxytc4htEHUP8iFUI0g6Q4dVX00rOi5LDxEtqucJ1kPc
         fuyGPMIIP2tZfaWX9rKfWw2PcsyjvO66vBaBYqwVMytzp8MOM/m3m44x8obZLZBp35tr
         wiE//jmmhZr1RYiD3EvNnVFSgEuRkRwdu+x7Gxlm2AXdPSkFRdtTxFaGNHBbNZIJu38b
         ehUA==
X-Forwarded-Encrypted: i=1; AJvYcCUjejwmx4y67Nj79qBFuWGNWR4hUNqD6WCvyUDSoLERxaK6VXOTv9NSizAasuKQKVn2rCVuQw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzivpuomTGKuirh/l0EjhD9ouTvrQQ66RM02D7ejgK4osxm1P15
	1ww4KVudcHXJyO3IvCeGGC1qrtC7PS6dGuwT2drtlHZ3giyvF1WiXeuF
X-Gm-Gg: ASbGncs+qMhDjWmxIjFlatrxyYx8IVcCYocU5LVO0x6YO8T56U/yM0/jtn0pFHHNzck
	SpHditKvd2rbjwmz9D3c6f3o/UNwsjIOqCr8pBiWN6QjEsx+6NwYbQ/ebxOiFyj53323yZV4wSf
	GUTBZ2r6hQUgmb5EfA9HYfqfqMQqijkB8e0psCGg10Bar/oDv+MAFzYlRMQA1XaeRJqZBMLKMB2
	iKr2MDdM7KWw0e04qlmCJfYZ5skaAFLukhyEBCMZkmOEK18uvYkKejGpb3dsot9eWO2sfhaWsew
	+4ZJwf59yr4L2LJ0b3Y1uUeTfggXq6V/tHk2tHamA99jMui1pB9Gq/WVjjrfnCFXGPb/YHncnHS
	c9RzOz871uTYJgp1BwJ4wFPH1myX+eOooTO9RKd33niX+iIZiR61F0S1+qM/Kmy8Bq7oHxdFewG
	VyaVeCp+c03QJAsXvSdeog1Eg+N3jQBwi3NQ==
X-Google-Smtp-Source: AGHT+IGHScSlL9cu47vMGSsn/jos8nO6lMKdreWx01YeiMB6yIIL90yCPe3N5A1FoFFavDktLuDS7g==
X-Received: by 2002:a05:600c:1c93:b0:471:d2f:7987 with SMTP id 5b1f17b1804b1-47a837b9a4cmr42271815e9.26.1765408885028;
        Wed, 10 Dec 2025 15:21:25 -0800 (PST)
Received: from dev-linux.homserver.local ([51.154.248.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a89f742a4sm654425e9.10.2025.12.10.15.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 15:21:24 -0800 (PST)
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Neal Gompa <neal@gompa.dev>
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Bluetooth: hci_bcm4377: Use generic power management
Date: Wed, 10 Dec 2025 23:21:09 +0000
Message-ID: <20251210232115.547729-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251210211728.544677-1-vaibhavgupta40@gmail.com>
References: <20251210211728.544677-1-vaibhavgupta40@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to the generic PCI power management framework and remove legacy
callbacks like .suspend() and .resume(). With the generic framework, the
standard PCI related work like:
        - pci_save/restore_state()
        - pci_enable/disable_device()
        - pci_set_power_state()
is handled by the PCI core and this driver should implement only
hci_bcm4377 specific operations in its respective callback functions.

Signed-off-by: Vaibhav Gupta <vaibhavgupta40@gmail.com>
---
v2: v1 has a typo in its subject. This patch is not part of a series. So
there should be no '[.... 1/2]'.
---
 drivers/bluetooth/hci_bcm4377.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 45e6d84224ee..925d0a635945 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -2416,8 +2416,9 @@ static int bcm4377_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 					hdev);
 }
 
-static int bcm4377_suspend(struct pci_dev *pdev, pm_message_t state)
+static int bcm4377_suspend(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct bcm4377_data *bcm4377 = pci_get_drvdata(pdev);
 	int ret;
 
@@ -2431,8 +2432,9 @@ static int bcm4377_suspend(struct pci_dev *pdev, pm_message_t state)
 	return 0;
 }
 
-static int bcm4377_resume(struct pci_dev *pdev)
+static int bcm4377_resume(struct device *dev)
 {
+	struct pci_dev *pdev = to_pci_dev(dev);
 	struct bcm4377_data *bcm4377 = pci_get_drvdata(pdev);
 
 	iowrite32(BCM4377_BAR0_SLEEP_CONTROL_UNQUIESCE,
@@ -2441,6 +2443,8 @@ static int bcm4377_resume(struct pci_dev *pdev)
 	return hci_resume_dev(bcm4377->hdev);
 }
 
+static DEFINE_SIMPLE_DEV_PM_OPS(bcm4377_ops, bcm4377_suspend, bcm4377_resume);
+
 static const struct dmi_system_id bcm4377_dmi_board_table[] = {
 	{
 		.matches = {
@@ -2541,8 +2545,7 @@ static struct pci_driver bcm4377_pci_driver = {
 	.name = "hci_bcm4377",
 	.id_table = bcm4377_devid_table,
 	.probe = bcm4377_probe,
-	.suspend = bcm4377_suspend,
-	.resume = bcm4377_resume,
+	.driver.pm = &bcm4377_ops,
 };
 module_pci_driver(bcm4377_pci_driver);
 
-- 
2.51.0

