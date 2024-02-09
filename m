Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1E37AE6D
	for <asahi@lists.linux.dev>; Fri,  9 Feb 2024 16:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707496501; cv=none; b=Tc9oxDZRQP2jBVmfB8cNJdee2ImvEA1lLMeu+zXYaz90wPuKsXg/9LtQcvJVjMhimyB0wBN4V8EK/043R0UgNBeD3ZEvO26KhRs7hdz5VBAlBgjgyNh6TTjBTSiXFb5Ja5pBakK2DKLVYBrvSojcrH5XFopRp4zT9N2b7ue/OZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707496501; c=relaxed/simple;
	bh=GT3d5XGcWkiMb3Qfy3MdLpMBKnEs3nWCkb7dD+ADAI4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=pcLRuJ+N/iRydr1Y7sT4lOahZXd/wM1pT3YP2sQWYw77p94DCsgA7bwPO72x/Pcbuk4NmEv3Ubb318mkgA7NNPzVxHkBdK++YFPOX7X3LNoxnntKxtyu0+v3CuX473wFYzRR0P4wJaioWskmXJehYhvQItXTxyzqUGs083IA0NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JVWV5q0Z; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JVWV5q0Z"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56002e7118dso1612059a12.0
        for <asahi@lists.linux.dev>; Fri, 09 Feb 2024 08:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707496497; x=1708101297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2hcO1Laq6zZPmAfJxAD7/PlDw25+j7/RrLike+pBwtg=;
        b=JVWV5q0Z4GQ68zkadFGxluYVMWDuyW/T/MFza7sjyaIehPcs5LIiQTYo7GByD7Bx1U
         Y827mQSeH0KKA6gzURYISSpQSdJJEXmsnSQ+02mmsfu5qxlnb6o8JvNpfWiejRxDOeG0
         ALyWmLkCwmqJAL1J3a/nepMrhblLm3zoub4Z7W9vNFZviJqrjbfkOfTcRjygWyzRhzcA
         4o1KLBOjZgVfCZZkbrPbGZTid9ncck5L37UBjiXeLq1TNhuS2+9f+Lithmf2l9jvkZ/Q
         CUgq5hHsJZqEkWKtEpSwaMmGz5j0tvxYFKonqfXL60GaqIcOZIgzzmHw+LHtLpAYnPh2
         1RBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707496497; x=1708101297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hcO1Laq6zZPmAfJxAD7/PlDw25+j7/RrLike+pBwtg=;
        b=Qa8otz+hNbRlPPZb5VdVU9ZMO0FVKPTbg6CXppUCF0XOhTM1CtF2ocT56s5V9UJJqk
         4ZFiLoPcOBC8UPD4PQJK9ec+h89fpdlv+eeeJddcc+GW9noVfqvHGBcqeuIY3sr1G38V
         BYLtWSQf1t82gvnkP5DnaX+I0CrYg6vFT1faUubLOgtNlCkjVqLAGiG+QlWeHW2EMsH0
         RUiUygv++K7D13X8KEztM6T/cvPH4Kt6IkNhWOIXNMfBtYXTYC3JcVKtN5Y7vi27WWEs
         78B5LI4VlCH9UjjpJlwjfLe1tasr5oWhb3VGe3dvHpyKg13zbOEA9OHrLf5MG5TZCn4T
         /Zjg==
X-Forwarded-Encrypted: i=1; AJvYcCVDXJFTS1SO4BLhmCwy0ueKm6Ypvny2ljxBQrR9SUHmJl6pRbmgMfdl0Q6yoqQy64wSPXtckE5rmwTNRAf3BlcT3HKwQTw=
X-Gm-Message-State: AOJu0YzY2MMvgJl06VQNID4uNSw5deMAqB/LjrmSfwhHI7Fo7laqPn7Z
	1MND1M/LMsZW6SuRM54TRX0jr4gDqwlq30x6lMmo9UJHQcodhowN1pC6OcZf1/U=
X-Google-Smtp-Source: AGHT+IEuzGvqOx+CJn8+ngQ6wq+yNcOQ5SwMgj65i/w5xebwMp/JUWhvk16to16y5nw6Ab/qtlNpZw==
X-Received: by 2002:a17:906:a846:b0:a3c:6ef:70d5 with SMTP id dx6-20020a170906a84600b00a3c06ef70d5mr815662ejb.7.1707496497544;
        Fri, 09 Feb 2024 08:34:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWNR1Wu0AH7TwRM1cyf+4y6hmwU09apaGNrtSLxqPAf+cLkcsVRhyWgIvi4vpxxzu0QNlNPayZ3VTfMG6RCijGEgQCB0rkEJgIpnfkDiGFqbdjd0nZUm6vTVgy8I5CnzW7STTAANw1qbybuLddOv2wgh+6/VwxRZ+zfU5kO/MmoNrk+NLyu+BhD33XPcH0cQM4rke24hmm4e+yAryncn6neGe/PYayf/AmCLbPv28rqdL5w3Lcf8hfNEJBDaA5p604pPETmyMsbv0kBPgOdFKOPdaif1nLenjXfrMRdmCLxlWJ1j7yJcg==
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id wt11-20020a170906ee8b00b00a389d911606sm911203ejb.88.2024.02.09.08.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 08:34:56 -0800 (PST)
From: srinivas.kandagatla@linaro.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	regressions@lists.linux.dev,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	asahi@lists.linux.dev,
	Sven Peter <sven@svenpeter.dev>
Subject: [PATCH] nvmem: include bit index in cell sysfs file name
Date: Fri,  9 Feb 2024 16:34:54 +0000
Message-Id: <20240209163454.98051-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4621; i=srinivas.kandagatla@linaro.org; h=from:subject; bh=f5Yj5EdsIahQdYEwLhKw5sXoADI6Fd5YUQv5rR1Hhoc=; b=owEBbQGS/pANAwAKAXqh/VnHNFU3AcsmYgBlxlQuDY7GMTl1T49CKqNQ63pn3xdIimhBS5Od0 aKoOl/PBMWJATMEAAEKAB0WIQQi509axvzi9vce3Y16of1ZxzRVNwUCZcZULgAKCRB6of1ZxzRV N97HCACSwnmn4enb2qu29UKONCkfhIhpIoD9WfAgFcjle9dvo+P0ecCCcnljzrVOcA/CXT8OoXz +lXNUhjaTsvy3io6HKTj7GvnBrb6aYhnRHcYGOXp7o/SQaagtSQt02RBwCHiR82N+lZ7F58t1LB pS9iwEGhmRs+tAbpTMKuufERPmX+XaFJgU6tfLfRCPrQhV8Z/RbRy6dIcJkOev5oq1ZK7XUSy8V LBsib3t6ayY2R8y68JLfI62/VsFrr+jMQNj5KyX8EHudTjxNzXAbU6+iqEE6bTWT0HeHyVikcOX FbjG/ghUU0zcdYEE1LHKyAvYAqqIkE4yRz3HOaE6J+ysfaQH
X-Developer-Key: i=srinivas.kandagatla@linaro.org; a=openpgp; fpr=ED6472765AB36EC43B3EF97AD77E3FC0562560D6
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Creating sysfs files for all Cells caused a boot failure for linux-6.8-rc1 on
Apple M1, which (in downstream dts files) has multiple nvmem cells that use the
same byte address. This causes the device probe to fail with

[    0.605336] sysfs: cannot create duplicate filename '/devices/platform/soc@200000000/2922bc000.efuse/apple_efuses_nvmem0/cells/efuse@a10'
[    0.605347] CPU: 7 PID: 1 Comm: swapper/0 Tainted: G S                 6.8.0-rc1-arnd-5+ #133
[    0.605355] Hardware name: Apple Mac Studio (M1 Ultra, 2022) (DT)
[    0.605362] Call trace:
[    0.605365]  show_stack+0x18/0x2c
[    0.605374]  dump_stack_lvl+0x60/0x80
[    0.605383]  dump_stack+0x18/0x24
[    0.605388]  sysfs_warn_dup+0x64/0x80
[    0.605395]  sysfs_add_bin_file_mode_ns+0xb0/0xd4
[    0.605402]  internal_create_group+0x268/0x404
[    0.605409]  sysfs_create_groups+0x38/0x94
[    0.605415]  devm_device_add_groups+0x50/0x94
[    0.605572]  nvmem_populate_sysfs_cells+0x180/0x1b0
[    0.605682]  nvmem_register+0x38c/0x470
[    0.605789]  devm_nvmem_register+0x1c/0x6c
[    0.605895]  apple_efuses_probe+0xe4/0x120
[    0.606000]  platform_probe+0xa8/0xd0

As far as I can tell, this is a problem for any device with multiple cells on
different bits of the same address. Avoid the issue by changing the file name
to include the first bit number.

Fixes: 0331c611949f ("nvmem: core: Expose cells through sysfs")
Link: https://github.com/AsahiLinux/linux/blob/bd0a1a7d4/arch/arm64/boot/dts/apple/t600x-dieX.dtsi#L156
Cc: regressions@lists.linux.dev
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Rafał Miłecki <rafal@milecki.pl>
Cc: Chen-Yu Tsai <wenst@chromium.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: asahi@lists.linux.dev
Cc: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Hi Greg, 

Here is a fix in nvmem for 6.8, could you queue these for next possible rc.

Did not cc Stable as this is only targeted for 6.8 and no backporting is
required.

Thanks,
Srini

 Documentation/ABI/testing/sysfs-nvmem-cells | 16 ++++++++--------
 drivers/nvmem/core.c                        |  5 +++--
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-nvmem-cells b/Documentation/ABI/testing/sysfs-nvmem-cells
index 7af70adf3690..c7c9444f92a8 100644
--- a/Documentation/ABI/testing/sysfs-nvmem-cells
+++ b/Documentation/ABI/testing/sysfs-nvmem-cells
@@ -4,18 +4,18 @@ KernelVersion:	6.5
 Contact:	Miquel Raynal <miquel.raynal@bootlin.com>
 Description:
 		The "cells" folder contains one file per cell exposed by the
-		NVMEM device. The name of the file is: <name>@<where>, with
-		<name> being the cell name and <where> its location in the NVMEM
-		device, in hexadecimal (without the '0x' prefix, to mimic device
-		tree node names). The length of the file is the size of the cell
-		(when known). The content of the file is the binary content of
-		the cell (may sometimes be ASCII, likely without trailing
-		character).
+		NVMEM device. The name of the file is: "<name>@<byte>,<bit>",
+		with <name> being the cell name and <where> its location in
+		the NVMEM device, in hexadecimal bytes and bits (without the
+		'0x' prefix, to mimic device tree node names). The length of
+		the file is the size of the cell (when known). The content of
+		the file is the binary content of the cell (may sometimes be
+		ASCII, likely without trailing character).
 		Note: This file is only present if CONFIG_NVMEM_SYSFS
 		is enabled.
 
 		Example::
 
-		  hexdump -C /sys/bus/nvmem/devices/1-00563/cells/product-name@d
+		  hexdump -C /sys/bus/nvmem/devices/1-00563/cells/product-name@d,0
 		  00000000  54 4e 34 38 4d 2d 50 2d  44 4e         |TN48M-P-DN|
 		  0000000a
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 980123fb4dde..eb357ac2e54a 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -460,8 +460,9 @@ static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
 	list_for_each_entry(entry, &nvmem->cells, node) {
 		sysfs_bin_attr_init(&attrs[i]);
 		attrs[i].attr.name = devm_kasprintf(&nvmem->dev, GFP_KERNEL,
-						    "%s@%x", entry->name,
-						    entry->offset);
+						    "%s@%x,%x", entry->name,
+						    entry->offset,
+						    entry->bit_offset);
 		attrs[i].attr.mode = 0444;
 		attrs[i].size = entry->bytes;
 		attrs[i].read = &nvmem_cell_attr_read;
-- 
2.25.1

