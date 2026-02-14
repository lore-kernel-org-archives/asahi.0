Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41467262E
	for <asahi@lists.linux.dev>; Sat, 14 Feb 2026 00:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771029821; cv=none; b=H/DuBsqVWte2+9lXIPHm8rnQNHrfJLJLL23KMOKDXJYvrL7Th+R9FolK3mWkQKG5SIzkqd+ier8fqQWJ8XThpPPJPA5s+Vu/CLdXphbOMenf+NDQ6qYMH4/nek45t8EhV/rVyMKsAKdjZUpaAcFjF0juQQxltGl1MCjz7VoUG3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771029821; c=relaxed/simple;
	bh=0waAntkINh0HJbY52IWO/+UCUnXlCGmlARVanym+CF8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q5e/uKv/eIb0eoC2LSoDC51XiP1iSJbe/0gxU6g8kYkGhulGLQTI2KIv9W1QNGgOfvaOTkS+OO144zGZ1B3WiF0hshpdpZd58r+rloyTx8MxEvleN8vZjHpWLnjPZIfi/0JZrZL+gUG7on7R5sNjVu2mWgBMxKfvTaPmwyIW1Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Received: from eig-obgw-6003b.ext.cloudfilter.net ([10.0.30.175])
	by cmsmtp with ESMTPS
	id r0QSvdCEGaPqLr3kyvS00v; Sat, 14 Feb 2026 00:43:32 +0000
Received: from host2044.hostmonster.com ([67.20.76.238])
	by cmsmtp with ESMTPS
	id r3kxvztz1hoT4r3kxvtERF; Sat, 14 Feb 2026 00:43:32 +0000
X-Authority-Analysis: v=2.4 cv=XZyJzJ55 c=1 sm=1 tr=0 ts=698fc534
 a=O1AQXT3IpLm5MaED65xONQ==:117 a=uc9KWs4yn0V/JYYSH7YHpg==:17
 a=HzLeVaNsDn8A:10 a=z6gsHLkEAAAA:8 a=6ohNodAXAAAA:8 a=pGLkceISAAAA:8
 a=jIQo8A4GAAAA:8 a=8b9GpE9nAAAA:8 a=QyXUC8HyAAAA:8 a=4nyrerzH5YTAYOrcb2sA:9
 a=0gLUg1G2xj6MhZ7RLP3J:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=iekntanDnrheIxGr1pkv:22
Received: from [66.118.46.62] (port=52000 helo=timdesk..)
	by host2044.hostmonster.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <tim.bird@sony.com>)
	id 1vr3kq-00000004J0n-2NCA;
	Fri, 13 Feb 2026 17:43:24 -0700
From: Tim Bird <tim.bird@sony.com>
To: perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	povik+lin@cutebit.org,
	david.rhodes@cirrus.com,
	rf@opensource.cirrus.com,
	cezary.rojewski@intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com
Cc: linux-spdx@vger.kernel.org,
	asahi@lists.linux.dev,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tim Bird <tim.bird@sony.com>
Subject: [PATCH] sound: soc: Add SPDX ids to many soc files
Date: Fri, 13 Feb 2026 17:43:14 -0700
Message-ID: <20260214004314.3787727-1-tim.bird@sony.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2044.hostmonster.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - sony.com
X-BWhitelist: no
X-Source-IP: 66.118.46.62
X-Source-L: No
X-Exim-ID: 1vr3kq-00000004J0n-2NCA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (timdesk..) [66.118.46.62]:52000
X-Source-Auth: tim@bird.org
X-Email-Count: 5
X-Org: HG=bhshared_hm;ORG=bluehost;
X-Source-Cap: YmlyZG9yZztiaXJkb3JnO2hvc3QyMDQ0Lmhvc3Rtb25zdGVyLmNvbQ==
X-Local-Domain: no
X-CMAE-Envelope: MS4xfPpizfWptUxbg9u17cMGxDyefWYRviO1SfS+ezIooOxYIYI3RVbI68NMypaSoPzn1UDY3OEGVNXKxVXn+ssaNg+xaAGAvoIaQoHdSuUFs2l0av4zKbuE
 KK0EyyH1NrPczC7tH79AQYV8DH1tSissOJoq+RTH85Cle74FHHJSoE40fm+m5TUV9CCQsjIwCGBNCISY8PPfb8COfutDKqE14CE=

Add appropriate SPDX-License-Identifier lines to the
the remaining files that are missing such lines in the
sound/soc directory, and in a few other miscelaneous files.
Remove boilerplate license text.

Signed-off-by: Tim Bird <tim.bird@sony.com>
---
 sound/hda/codecs/side-codecs/Kconfig    |  1 +
 sound/soc/amd/acp-rt5645.c              | 21 +--------------------
 sound/soc/amd/include/acp_2_2_d.h       | 18 +-----------------
 sound/soc/amd/include/acp_2_2_enum.h    | 18 +-----------------
 sound/soc/amd/include/acp_2_2_sh_mask.h | 18 +-----------------
 sound/soc/apple/Kconfig                 |  1 +
 sound/soc/apple/Makefile                |  1 +
 sound/soc/codecs/cs4270.c               |  6 ++----
 sound/soc/codecs/cs42xx8-i2c.c          |  5 +----
 sound/soc/codecs/cs42xx8.c              |  5 +----
 sound/soc/codecs/cs42xx8.h              |  5 +----
 sound/soc/codecs/sta529.c               |  5 +----
 sound/soc/dwc/dwc-i2s.c                 |  5 +----
 sound/soc/dwc/dwc-pcm.c                 |  5 +----
 sound/soc/dwc/local.h                   |  5 +----
 sound/soc/fsl/efika-audio-fabric.c      |  5 +----
 sound/soc/intel/catpt/Makefile          |  1 +
 sound/soc/intel/keembay/Makefile        |  1 +
 sound/soc/spear/spdif_in.c              |  5 +----
 sound/soc/spear/spdif_out.c             |  5 +----
 sound/soc/spear/spear_pcm.c             |  5 +----
 sound/soc/starfive/Makefile             |  1 +
 sound/usb/qcom/Makefile                 |  1 +
 sound/x86/intel_hdmi_audio.h            | 22 +---------------------
 24 files changed, 25 insertions(+), 140 deletions(-)

diff --git a/sound/hda/codecs/side-codecs/Kconfig b/sound/hda/codecs/side-codecs/Kconfig
index f674e9a9c7d7..fc5651e555e3 100644
--- a/sound/hda/codecs/side-codecs/Kconfig
+++ b/sound/hda/codecs/side-codecs/Kconfig
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
 config SND_HDA_CIRRUS_SCODEC
 	tristate
 
diff --git a/sound/soc/amd/acp-rt5645.c b/sound/soc/amd/acp-rt5645.c
index 11d373169380..d545516760b9 100644
--- a/sound/soc/amd/acp-rt5645.c
+++ b/sound/soc/amd/acp-rt5645.c
@@ -1,29 +1,10 @@
+// SPDX-License-Identifier: MIT
 /*
  * Machine driver for AMD ACP Audio engine using Realtek RT5645 codec
  *
  * Copyright 2017 Advanced Micro Devices, Inc.
  *
  * This file is modified from rt288 machine driver
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- *
  */
 
 #include <sound/core.h>
diff --git a/sound/soc/amd/include/acp_2_2_d.h b/sound/soc/amd/include/acp_2_2_d.h
index 0118fe9e6a87..d07ec8646ee8 100644
--- a/sound/soc/amd/include/acp_2_2_d.h
+++ b/sound/soc/amd/include/acp_2_2_d.h
@@ -1,24 +1,8 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * ACP_2_2 Register documentation
  *
  * Copyright (C) 2014  Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included
- * in all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
- * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
 #ifndef ACP_2_2_D_H
diff --git a/sound/soc/amd/include/acp_2_2_enum.h b/sound/soc/amd/include/acp_2_2_enum.h
index f3577c851086..26c7993ac395 100644
--- a/sound/soc/amd/include/acp_2_2_enum.h
+++ b/sound/soc/amd/include/acp_2_2_enum.h
@@ -1,24 +1,8 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * ACP_2_2 Register documentation
  *
  * Copyright (C) 2014  Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included
- * in all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
- * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
 #ifndef ACP_2_2_ENUM_H
diff --git a/sound/soc/amd/include/acp_2_2_sh_mask.h b/sound/soc/amd/include/acp_2_2_sh_mask.h
index 32d2d4104309..9749c11e733f 100644
--- a/sound/soc/amd/include/acp_2_2_sh_mask.h
+++ b/sound/soc/amd/include/acp_2_2_sh_mask.h
@@ -1,24 +1,8 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * ACP_2_2 Register documentation
  *
  * Copyright (C) 2014  Advanced Micro Devices, Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included
- * in all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
- * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
- * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
 #ifndef ACP_2_2_SH_MASK_H
diff --git a/sound/soc/apple/Kconfig b/sound/soc/apple/Kconfig
index d8dc2f1ccc83..f1d071a99fbf 100644
--- a/sound/soc/apple/Kconfig
+++ b/sound/soc/apple/Kconfig
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
 menu "Apple"
 
 config SND_SOC_APPLE_MCA
diff --git a/sound/soc/apple/Makefile b/sound/soc/apple/Makefile
index 1eb8fbef60c6..d727d0c63181 100644
--- a/sound/soc/apple/Makefile
+++ b/sound/soc/apple/Makefile
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
 snd-soc-apple-mca-y	:= mca.o
 
 obj-$(CONFIG_SND_SOC_APPLE_MCA)	+= snd-soc-apple-mca.o
diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index 3139f03cd42b..a48980e746ff 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -1,12 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * CS4270 ALSA SoC (ASoC) codec driver
  *
  * Author: Timur Tabi <timur@freescale.com>
  *
- * Copyright 2007-2009 Freescale Semiconductor, Inc.  This file is licensed
- * under the terms of the GNU General Public License version 2.  This
- * program is licensed "as is" without any warranty of any kind, whether
- * express or implied.
+ * Copyright 2007-2009 Freescale Semiconductor, Inc.
  *
  * This is an ASoC device driver for the Cirrus Logic CS4270 codec.
  *
diff --git a/sound/soc/codecs/cs42xx8-i2c.c b/sound/soc/codecs/cs42xx8-i2c.c
index 039b3ecb3b9b..0faca384073a 100644
--- a/sound/soc/codecs/cs42xx8-i2c.c
+++ b/sound/soc/codecs/cs42xx8-i2c.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Cirrus Logic CS42448/CS42888 Audio CODEC DAI I2C driver
  *
  * Copyright (C) 2014 Freescale Semiconductor, Inc.
  *
  * Author: Nicolin Chen <Guangyu.Chen@freescale.com>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <linux/i2c.h>
diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index d14538c49b97..f6b8fe7d53e2 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Cirrus Logic CS42448/CS42888 Audio CODEC Digital Audio Interface (DAI) driver
  *
  * Copyright (C) 2014 Freescale Semiconductor, Inc.
  *
  * Author: Nicolin Chen <Guangyu.Chen@freescale.com>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <linux/clk.h>
diff --git a/sound/soc/codecs/cs42xx8.h b/sound/soc/codecs/cs42xx8.h
index 342389e8b1a8..4087c91471d1 100644
--- a/sound/soc/codecs/cs42xx8.h
+++ b/sound/soc/codecs/cs42xx8.h
@@ -1,13 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * cs42xx8.h - Cirrus Logic CS42448/CS42888 Audio CODEC driver header file
  *
  * Copyright (C) 2014 Freescale Semiconductor, Inc.
  *
  * Author: Nicolin Chen <Guangyu.Chen@freescale.com>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #ifndef _CS42XX8_H
diff --git a/sound/soc/codecs/sta529.c b/sound/soc/codecs/sta529.c
index 8c3b2652b02e..946aa6a4e57c 100644
--- a/sound/soc/codecs/sta529.c
+++ b/sound/soc/codecs/sta529.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * ASoC codec driver for spear platform
  *
@@ -5,10 +6,6 @@
  *
  * Copyright (C) 2012 ST Microelectronics
  * Rajeev Kumar <rajeevkumar.linux@gmail.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/clk.h>
diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 28001e9857d9..74dfd39fd604 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * ALSA SoC Synopsys I2S Audio Layer
  *
@@ -5,10 +6,6 @@
  *
  * Copyright (C) 2010 ST Microelectronics
  * Rajeev Kumar <rajeevkumar.linux@gmail.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/clk.h>
diff --git a/sound/soc/dwc/dwc-pcm.c b/sound/soc/dwc/dwc-pcm.c
index a418265c030a..15ff39b1a509 100644
--- a/sound/soc/dwc/dwc-pcm.c
+++ b/sound/soc/dwc/dwc-pcm.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * ALSA SoC Synopsys PIO PCM for I2S driver
  *
@@ -5,10 +6,6 @@
  *
  * Copyright (C) 2016 Synopsys
  * Jose Abreu <joabreu@synopsys.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/io.h>
diff --git a/sound/soc/dwc/local.h b/sound/soc/dwc/local.h
index dce88c9ad5f3..6510b3496371 100644
--- a/sound/soc/dwc/local.h
+++ b/sound/soc/dwc/local.h
@@ -1,9 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Copyright (ST) 2012 Rajeev Kumar (rajeevkumar.linux@gmail.com)
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #ifndef __DESIGNWARE_LOCAL_H
diff --git a/sound/soc/fsl/efika-audio-fabric.c b/sound/soc/fsl/efika-audio-fabric.c
index de17b103a4cf..4d3266d9cbb7 100644
--- a/sound/soc/fsl/efika-audio-fabric.c
+++ b/sound/soc/fsl/efika-audio-fabric.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Efika driver for the PSC of the Freescale MPC52xx
  * configured as AC97 interface
  *
  * Copyright 2008 Jon Smirl, Digispeaker
  * Author: Jon Smirl <jonsmirl@gmail.com>
- *
- * This file is licensed under the terms of the GNU General Public License
- * version 2. This program is licensed "as is" without any warranty of any
- * kind, whether express or implied.
  */
 
 #include <linux/init.h>
diff --git a/sound/soc/intel/catpt/Makefile b/sound/soc/intel/catpt/Makefile
index f5f6a7e956ce..e8316e33b820 100644
--- a/sound/soc/intel/catpt/Makefile
+++ b/sound/soc/intel/catpt/Makefile
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
 snd-soc-catpt-y := device.o dsp.o loader.o ipc.o messages.o pcm.o sysfs.o
 
 # tell define_trace.h where to find the trace header
diff --git a/sound/soc/intel/keembay/Makefile b/sound/soc/intel/keembay/Makefile
index 3da9a6f9ba2a..fe3d761743d9 100644
--- a/sound/soc/intel/keembay/Makefile
+++ b/sound/soc/intel/keembay/Makefile
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
 snd-soc-kmb_platform-y := \
 	        kmb_platform.o
 
diff --git a/sound/soc/spear/spdif_in.c b/sound/soc/spear/spdif_in.c
index 4ad8b1fc713a..b31b120a85de 100644
--- a/sound/soc/spear/spdif_in.c
+++ b/sound/soc/spear/spdif_in.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * ALSA SoC SPDIF In Audio Layer for spear processors
  *
  * Copyright (C) 2012 ST Microelectronics
  * Vipin Kumar <vipin.kumar@st.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/clk.h>
diff --git a/sound/soc/spear/spdif_out.c b/sound/soc/spear/spdif_out.c
index 469373d1bb41..c06f09c646a8 100644
--- a/sound/soc/spear/spdif_out.c
+++ b/sound/soc/spear/spdif_out.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * ALSA SoC SPDIF Out Audio Layer for spear processors
  *
  * Copyright (C) 2012 ST Microelectronics
  * Vipin Kumar <vipin.kumar@st.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/clk.h>
diff --git a/sound/soc/spear/spear_pcm.c b/sound/soc/spear/spear_pcm.c
index e8476da157cd..f222956e857c 100644
--- a/sound/soc/spear/spear_pcm.c
+++ b/sound/soc/spear/spear_pcm.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * ALSA PCM interface for ST SPEAr Processors
  *
@@ -5,10 +6,6 @@
  *
  * Copyright (C) 2012 ST Microelectronics
  * Rajeev Kumar<rajeevkumar.linux@gmail.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2. This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/starfive/Makefile b/sound/soc/starfive/Makefile
index 9e958f70ef51..cfe03c83d5f7 100644
--- a/sound/soc/starfive/Makefile
+++ b/sound/soc/starfive/Makefile
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
 # StarFive Platform Support
 obj-$(CONFIG_SND_SOC_JH7110_PWMDAC) += jh7110_pwmdac.o
 obj-$(CONFIG_SND_SOC_JH7110_TDM) += jh7110_tdm.o
diff --git a/sound/usb/qcom/Makefile b/sound/usb/qcom/Makefile
index 6567727b66f0..aa8fcf8d2458 100644
--- a/sound/usb/qcom/Makefile
+++ b/sound/usb/qcom/Makefile
@@ -1,3 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
 snd-usb-audio-qmi-y := usb_audio_qmi_v01.o qc_audio_offload.o
 snd-usb-audio-qmi-y += mixer_usb_offload.o
 obj-$(CONFIG_SND_USB_AUDIO_QMI) += snd-usb-audio-qmi.o
diff --git a/sound/x86/intel_hdmi_audio.h b/sound/x86/intel_hdmi_audio.h
index 7ce8c2a7d714..88bf9ef2c491 100644
--- a/sound/x86/intel_hdmi_audio.h
+++ b/sound/x86/intel_hdmi_audio.h
@@ -1,30 +1,10 @@
+/* SPDX-License-Identifier: MIT */
 /*
  * Copyright (C) 2016 Intel Corporation
  *  Authors:	Sailaja Bandarupalli <sailaja.bandarupalli@intel.com>
  *		Ramesh Babu K V	<ramesh.babu@intel.com>
  *		Vaibhav Agarwal <vaibhav.agarwal@intel.com>
  *		Jerome Anand <jerome.anand@intel.com>
- *
- * Permission is hereby granted, free of charge, to any person obtaining
- * a copy of this software and associated documentation files
- * (the "Software"), to deal in the Software without restriction,
- * including without limitation the rights to use, copy, modify, merge,
- * publish, distribute, sublicense, and/or sell copies of the Software,
- * and to permit persons to whom the Software is furnished to do so,
- * subject to the following conditions:
- *
- * The above copyright notice and this permission notice (including the
- * next paragraph) shall be included in all copies or substantial
- * portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NONINFRINGEMENT.  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
- * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
  */
 
 #ifndef _INTEL_HDMI_AUDIO_H_
-- 
2.43.0

