Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4575226ED5C
	for <asahi@lists.linux.dev>; Fri, 16 Jan 2026 13:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571092; cv=none; b=l2FKWjgYVdc0D8adJiCXSbMEn1pwI737o32Tx1JwAxgYHgvCIFqSctHCE8lsb/f31grQ6gtNDQr2xPOlTjLCQLbtpKu8LuNhS8f6YRKopQSUkFX3hnavj1/6D91zB/6ZrqtjmvR7pXlYwGgDi/B/V4Sx5UjKqIexRdPwccQFZto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571092; c=relaxed/simple;
	bh=rtIW8f/tcipjLJdXvudP3ku6ex1TG+Kb3nZHdyrIjNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gkQAB8PM2Gsm5W97J+CTDyilQhyClK0lBTrL726KpW9w0ATILRp1ZPMAmrOCMTfYjxIuOfYAKTQjw5efRVmC5jHIya3+irSd9CH1zEwl8322jZBhebDrx8IyqIq8wONMBvSlX7WxCjy1d6zCY8iTxvEdLDfPShtUVylUB7Q9/vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=q5vZSBGX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ZCnf+8tR; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="q5vZSBGX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZCnf+8tR"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 851BA7A0092;
	Fri, 16 Jan 2026 08:44:49 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 16 Jan 2026 08:44:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1768571089; x=1768657489; bh=wN
	+SGFEMd1FrOtrcOYCxtCDcgVelI5LkpAqE16uDGSA=; b=q5vZSBGXAnxckkS4sD
	kTpBm30H/1abqF9VP5PjutmSOQ8huwycOQAS9pjMJTOQu3GqTcal2yrOuZin7AQt
	R8lqArDypq1qgQmO1sEHA9iC5JmScYkwcpTnY9hBZEGL+ZPpQ7kV3JXPr/pN66Kb
	z2amkXZp5N/kPN4GKEU/lx0cnRzf21DHYnti7zZQFJzc5aK2m2S5ObVuQQDdZK19
	qvZgykg96n/4t65b52p4ZsJY3+uXfY7vf2P1Te3Dt40cfnezZmeKVkzzxGUmJnO0
	Phh5pNR2bMMhq3ZqTACShwCZtBUTu0Eue2HKvEpLmWru0e0+OtxNtWA+o7y7LVXM
	dCUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1768571089; x=1768657489; bh=wN+SGFEMd1FrOtrcOYCxtCDcgVel
	I5LkpAqE16uDGSA=; b=ZCnf+8tRk9ZYKhioYxWOB6YKxw4uc637jxsRyc1EvgCZ
	9+bWUrQnRKldDrgfC4wE6P8pR8DWvvQ1XuiAlMNIYulCF0+xs+nWMw9hj5E7aYe1
	TYzPAVZrxB2PyFpeerBpKHGSSqlkFJZ9Xawo8l/DyRWd0VTNxv/cluoZF93TCmvY
	d97NH7tz19Rto3yv9kLIQrrlBJRFkDjWmfaQjpPKyQxN/4rRmmRMvQpJAnOcK9SF
	xRwjAds0UV+a0vGtJnOvegHPVsHOCLtk1vWk3YNsLt5KLjTuTIHvWDvnXJbHI04L
	Dc1skI5pjDjGMBClfs2uES24ytIbYvWaMskO2edY9A==
X-ME-Sender: <xms:0UBqaQAytvQm90kWnx16LOpjcx7wo6RI7EeaojlCggwGtJloBZKBcg>
    <xme:0UBqaUB0IIBulbMoHg-dswOrz52uPZnO4LkDnqswvX5FeZkTwlyNGl9AX75HOHvs7
    9IRGcS_E3oN1r2Xz_Apq7H3QIFzmZs0Gx1R7JdGfczOrIi9IBhyz92g>
X-ME-Received: <xmr:0UBqaTq8WJYzxUyihKevftES0-5Lm2i97i5DueBA7ug3lmZ_86TF8UUhi2aSqvEk-3xIXDTQibZjdNNvDP0LW3IptDIghft3vMulTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeltdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfeehle
    dtheefteejfedvheetuedttdetleegudeuteejveetieefuedvfeffvdeinecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohephedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtg
    hpthhtohepthhrihhniheskhhonhhsuhhlkhhordgtohhmpdhrtghpthhtohepuhdqsgho
    ohhtsehlihhsthhsrdguvghngidruggvpdhrtghpthhtoheprghsrghhiheslhhishhtsh
    drlhhinhhugidruggvvhdprhgtphhtthhopehkvghtthgvnhhishesohhpvghnsghsugdr
    ohhrgh
X-ME-Proxy: <xmx:0UBqaWmaWJLXB3PxmsPgMGF5vtEHuyskcm_Zv67MB1Uzrd_rU_NSvQ>
    <xmx:0UBqabxceaeAnXfPjU95FurDtInhNrCXFrKq1K1BJUGz2-H8luVLTA>
    <xmx:0UBqaW-lvtQAfvx80phZ05yc9X9uPPFN5tA6a7hMYplA2MP-11L_EQ>
    <xmx:0UBqafKE5ep4wg9nNtT-rDCZiRjeNKX9Dt0bfQ1QjSap_X7cKYgbtw>
    <xmx:0UBqaXSmguCYUxveF9_8Ck2GRP5bxFgf7PqgaIOJmuxVj-1hOK3gmmSP>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Jan 2026 08:44:48 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Fri, 16 Jan 2026 14:44:46 +0100
Subject: [PATCH v2] configs: apple: Enable SMBIOS / sysinfo
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-apple-defconfig-smbios-v2-1-861d707b466a@jannau.net>
X-B4-Tracking: v=1; b=H4sIAM1AamkC/4WNTQ6CMBCFr0Jmbc20VBBW3sOwqDCFMdqSFhsN4
 e5WLmDe6nt5PytECkwR2mKFQIkje5dBHQroJ+NGEjxkBoWqQomNMPP8IDGQ7b2zPIr4vLGPwpT
 1GXNI6pOCXJ4DWX7vw9cu88Rx8eGz/yT5c/9OJimyKl3XiE2Ppb7cjXPmdXS0QLdt2xd03bs7v
 QAAAA==
X-Change-ID: 20260109-apple-defconfig-smbios-a37802021452
To: u-boot@lists.denx.de
Cc: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>, 
 asahi@lists.linux.dev, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2305; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=rtIW8f/tcipjLJdXvudP3ku6ex1TG+Kb3nZHdyrIjNU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhswsh/MB2U4nJwusqmSVO9CxKbW6701Btb7/gh1HjF2z/
 EL+5N3vKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMJF7rowM39c9XysfsfXKk9LQ
 oH9TTVobom++/aGhevTTKkXFK7JpDYwMd4pXflTZMOORombCt7kvwtiDv753Nbea5PtnnueViRF
 VjAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Enable verbose SMBIOS table generation so that user space applications
can use the SMBIOS table to provide details about the system. The
desired information is chassis-type to determine whether the system is
laptop.
Adding the chassis-type property is proposed for the upstream device
trees in the Linux kernel in [1].
Enable CMD_SMBIOS as debugging aid as the platform can easily deal with
large u-boot binaries.

Link: https://lore.kernel.org/asahi/20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net/ [1]
Reviewed-by: Tom Rini <trini@konsulko.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v2:
- Added CMD_SMBIOS as suggested by Mark
- Added Tom's Reviewed-by: trailer
- Link to v1: https://lore.kernel.org/r/20260109-apple-defconfig-smbios-v1-1-16477009c034@jannau.net
---
I do not plan to update u-boot's in-tree device trees. The Linux device
trees have almost reached feature parity. The main missing features are
the USB Type-C ports (on track for next merge window) and the laptop
keyboards. I think it makes more sense to close the feature gap and
switch to upstream device trees instead of adding to the in-tree device
trees.
---
 configs/apple_m1_defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/configs/apple_m1_defconfig b/configs/apple_m1_defconfig
index 2d685da8c9eee2084b0144050e12c03c77e5184e..1ce69f2882a1baf8d3713c18f8fe6b3fe5e2ae57 100644
--- a/configs/apple_m1_defconfig
+++ b/configs/apple_m1_defconfig
@@ -10,12 +10,15 @@ CONFIG_SYS_PBSIZE=276
 # CONFIG_DISPLAY_CPUINFO is not set
 CONFIG_DISPLAY_BOARDINFO_LATE=y
 CONFIG_BOARD_LATE_INIT=y
+CONFIG_CMD_SMBIOS=y
 CONFIG_CMD_SELECT_FONT=y
 CONFIG_NO_NET=y
 CONFIG_SYS_64BIT_LBA=y
 CONFIG_APPLE_SPI_KEYB=y
 # CONFIG_MMC is not set
 CONFIG_NVME_APPLE=y
+CONFIG_SYSINFO=y
+CONFIG_SYSINFO_SMBIOS=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_DWC3=y
 CONFIG_USB_XHCI_PCI=y
@@ -25,4 +28,4 @@ CONFIG_VIDEO_FONT_16X32=y
 CONFIG_SYS_WHITE_ON_BLACK=y
 CONFIG_NO_FB_CLEAR=y
 CONFIG_VIDEO_SIMPLE=y
-# CONFIG_SMBIOS is not set
+CONFIG_GENERATE_SMBIOS_TABLE_VERBOSE=y

---
base-commit: 127a42c7257a6ffbbd1575ed1cbaa8f5408a44b3
change-id: 20260109-apple-defconfig-smbios-a37802021452

Best regards,
-- 
Janne Grunau <j@jannau.net>

