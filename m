Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D818A32E13A
	for <asahi@lists.linux.dev>; Wed, 10 Dec 2025 21:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765401458; cv=none; b=dPI+JkT7sZzhGgC4M/Kwxkby7QWO1N2fIz0KFtR9SRVEImz5YLICn2+w0Z4n+kIfbu3XwtxCbs1p0sxfS4hzldrCGdorLJplIEGQjnyUaixXXlY/qvYkwEjje9ERiIm4YZWcFEptl1F7tkhLOFXtIizg3IAu2B/0+6z1Fx+1HEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765401458; c=relaxed/simple;
	bh=TGnIFeubVY7VeY994lX8aOuQktK904Czk8dQrCal58c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U/flBypXx+uBOhtUCI8o1d2vo+xgU+ZA9EZFtwm7eysKxmBsRckmgtwNIJC0ZI6xctM9hlr/Qp3rd1UFhjCIS94Mkam2SyIrGcg+qjAVgPnsFmpcUJLylo3gtc2OQ/kGFF4yYZYChAsBYgyuNaSFO4RS10lxwwDiL6y16yMdHKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/0LVVDu; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/0LVVDu"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4775ae77516so2756185e9.1
        for <asahi@lists.linux.dev>; Wed, 10 Dec 2025 13:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765401455; x=1766006255; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tOfFY77gZCltiZjkrHeQ4oE/3Skq9gP62li7AIVP3wU=;
        b=E/0LVVDuYozh09rhLLRok/DIOwmACcx4zpmP86qOsiDcai0HggH+sLEbjE6e1sMMXL
         jFZDOHlsBGCeTu9edzeNgqbX9Q0H0+RrOJVgafpwbir/bXbXHG5n+LNJwmkK5jDQJnK7
         KgUcLDwk95zKvdOajAsp4hIaDNmuVWYc34ApIzAjYFglvRdJKb9Pu4zyw7xdtizkYh+x
         eZiTso4dBa8BOb4jHYY3wkQqZFLQ2vVJdjV3OAy9ODRNDUuZenVHzg0GnjNLcSMkmKUq
         FzDXXUMkKuLsqxxvx+XZvvArahKeN80z3O82gQGo+XjxFeDnvQtVF78+v4sUC6Snjq1T
         NN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765401455; x=1766006255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOfFY77gZCltiZjkrHeQ4oE/3Skq9gP62li7AIVP3wU=;
        b=Bd7OOejBbbdenYOwoOAHbRiBthgTeQ1sHVC7trUvpp/IzUn2SdvJ6kSuTx4beEE7AI
         +x3PJ/Kok+dIQnEjsV+toNdTbkzOikhhpU5QGR7Yz+O5Jm2Tb1+occbMfaYv2NdxWI5N
         sU+BG5bVi1Hy8P0WK0VYzJe39tjhqj8f1gSQRjQI/UhSqVH2mGyiLp1r78zdQGLdOFJD
         fhWBE1e2m4VAwRlvU8N2Bw7R0ktIyGvE9cWqE6CZu20sepyJriPhUv4hRz9xKTklvdGR
         AT7z3FJWvI8J+TagmAaT60DQVgptv1d6BU6pe7GO/SzySx8iP/s/5NvJNx1pAXoHjbaH
         ivcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE0rzRV0OiD8SllwIrVj02pFVm+pF6FDrdFGNmZ3imGoGUGst8gAFQ8l9bMV6+pZjXlwlvQA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzWHk/tUEG/dmolibIqmOPU5h/Wnnqyn9GQNEU+YihtbvchKdZ9
	9ge6TZoZ5svIWTU+w5BTr4CrU9WMJeQmc88UmmQqUoL0SLdFPCEqD2/A
X-Gm-Gg: ASbGncs9OqGutIaz12h4wwQqVSAdRVRcAGeiYHDvQMyI0hyGalkHmkbkU/5AI1eGImz
	JssDEXRIv7e80jMshANCP86P0elKP6NkvS3nsbVY/T6FhtI1aKcRTBGiWmyX9wqzn+mZBqbO7t9
	gl+k0pXqzUhU7wZKIQrOfDPiR9sVf7x/Qo+Ydv+R3TPF9zHOML1YQuZ17VHAy7TyvKN2Hcj9yqo
	8wCnuY0WoBM83LdsJ2jmrv7lOHK0GyWqbnw0sPR0QlSI3QspWmZLbzE/yh5BwEOU2S1pnD1k6Uc
	ivxU+rKfnAFZxpiSEYs/QgZkO83ScyKH6qeE76uHng8oJ0oj2ZQyA+5m71eAmGQDgOdNb/ZWMpX
	1zLdjPz1HTl1Iuz4UlPT9vGCEHxsVSIKQ146AocxHCu+X/C2Oa/b7Kub5KyXLhcyoVD/4Xj0ukI
	lUg0fp2hjN6lMG2UofIFZJeWfKSEaiWOFcP1DWIzxjv6o=
X-Google-Smtp-Source: AGHT+IEllRKC6NDjpHfpSYxwBWFGd/XV/21Iks7SFysobBhsAwJQ/2swNyMn8d0YVqdg6M9x4r2d4A==
X-Received: by 2002:a05:600c:8b16:b0:471:131f:85b7 with SMTP id 5b1f17b1804b1-47a8375ab5fmr38139825e9.15.1765401455052;
        Wed, 10 Dec 2025 13:17:35 -0800 (PST)
Received: from dev-linux.homserver.local ([51.154.248.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a66614sm1113198f8f.5.2025.12.10.13.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 13:17:34 -0800 (PST)
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
Subject: [PATCH v1 1/2] Bluetooth: hci_bcm4377: Use generic power management
Date: Wed, 10 Dec 2025 21:17:25 +0000
Message-ID: <20251210211728.544677-1-vaibhavgupta40@gmail.com>
X-Mailer: git-send-email 2.51.0
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

