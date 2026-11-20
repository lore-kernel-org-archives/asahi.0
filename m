Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200817;
	b=3cz6zDEUZ62PL6uZ+7Evye5A7iEgZbK2GpZNGwPErUyoUdbElzEX6S61CLYMQYagN2h8
	 wCaiJ+MhzGJTt04AA268GpH+upuP5XyO/pXG0jAgwoUFj4OIxlwc6Hq5Th8RBW13c0EoF
	 JGDaNszi0UGuEwiFAyFS+R3rBKPbdfRyGLx58Xsn3sdUz5HEqGzWz5oMonHTHt0CVtO6W
	 eExT86z2ASRmOqfZnuX66IFmh6NNWLKM0qRXiGZCfnMBN+bPQ3XczRum7cxq8ORMNYpIR
	 1h4JQI+y3U/uvabR1bJYu3tP0+iuIezHJgREMnTcZl83wEVWT8o/Z3czYijwCKXxubg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200817;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=wnql81BWKHaZHcyh9IFQOOcSIa95vyjDjKvhvlm0QJY=;
	b=L8Nu3TLGwXpifgpXALPYEvKqJvoWSa7qSGRL7BSIslItlx7SJs1AtsQdCTJyzRGk4DyT
	 jDJpRoeof7q/G+xS4AnYdL2oqTP/bbabWEvhUVTpsknUlY+7CFm26hL+cex8pyycOY9Io
	 l7v/WwIG68yUz2IKvoXPxqZES/prXjX7hlw6dxqo0beDKcuHAzN91viHzcgkqs6NKXH1h
	 k/9/FlL4ytXArEPQbVFjI0xPULhF75ZFKkeTZl7YWOYz+zIKHZbsE/gCElfX0iN3aI1dk
	 XCcyOVFgGKjodiKx0ZrfE8r2JPFhg87yZlwjkcqvrDcBdcnrK5h8tmxgYSbaWHNJuPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=eb96sv52;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0hPXg5eh;
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AC360A2604
	for <asahi@lists.linux.dev>; Fri, 20 Nov 2026 18:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2AC360A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=eb96sv52;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0hPXg5eh
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 631021D00493
	for <asahi@lists.linux.dev>; Fri, 20 Nov 2026 13:53:29 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Fri, 20 Nov 2026 13:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795200808;
	 x=1795287208; bh=wnql81BWKHaZHcyh9IFQOOcSIa95vyjDjKvhvlm0QJY=; b=
	eb96sv52yGmNEnPJrxVkUwal3ptx6IKBk0igl2q00U7g7DpnvVgGyQ8m58WSqu6C
	jXXt6epP75CEYsWwo79nDmyPvK9vYmIQzOrIQ7UvSSv1eNI7m7ngtU0HXkkD8ixL
	YQeWiqoFWK2/dmaXyvP99W2JYFD7zBamHkL/aFO3tymo4rhXk+AzaWm9YZKY2sOo
	NbP4pF0de1ZGraW41BGOdVbg1iWHTUfqXN/5XQIi8WaRjPLApjU70zo8xfsqg8c9
	cNzbOmprLZpEETvccBWOBR4BWPMRptLA9vBrF7DeB/gxJ9+LtXLzv3Eag4HPmTEj
	jXZ23EKa3ga3Pws4FdeFrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795200808; x=
	1795287208; bh=wnql81BWKHaZHcyh9IFQOOcSIa95vyjDjKvhvlm0QJY=; b=0
	hPXg5eh5ue8nnGO4aWxzBB1wniMVwbYISMrgLzehjZYZXReQcYTIfmqc0iGLzu/S
	3fiaUCZH3ys00gNuSjDHQr7fp1LKxBgFO7GVpx9oNuq/8KCsoCMC/ulj33WkYtl2
	jDVGsjCxf2r3TnHYCdvMqW5GUEUYewfTLK4q9SxHGrPs2xor5lIFSYDDMZhq2WwO
	ggNXYIwfLjgeJg+6Dhoi1QS55cTW7fiiJdaZFE/pUlGse5sucOvR11RuffbqxsAO
	OkAVJBz93h5x5uEFOirhnPqSNRI7FSepivU1z9VRh+2t7riWfl2hGrC2cbFLuufQ
	toZut3CHQDo4f8OR0yluw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795200808; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PGFzYWhpQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm2:rsa-sha256:iDklF3H4wSpKfy3aDjGHqm/8ujpa8jukjJkUX+kCH2HPBDc
	/kTn6dXj0sVb3WHL4X5cKNWrmrc40H8Ejv85kNxsogUCjXS/TxpQCHYvshPCfD82
	3njZ2OKtYPJGzk6sbjZJDLQgvQPdMh6Bw3xb7aj4hVRBRbHVibOlFaRp/VdrXV4N
	Eqj/wVPpNFrYp5wUWUjtfJkoWHCuG/s2Inlate1NtcWj8iKY1TxcBax1cMnEHrYU
	ckwkt2XmuhSkdc2EkLniwbRjDuiqhHm+0bJsnRQAfZI4m6qECVbD94HqyZaiidsU
	S5LHUrFy1SV+jQeMycdDxOfPsglzE3jjGINbzng==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:oRMn6qXfq/ZTee6WqGbcaYKMPuSx+JQIGZqaeCtzOHM=:uojPMqcnLErYgnIgNExM6qv7er8qhnePLXA1IdvhcN0=;
X-ME-Sender: <xms:KJcAazPzV_XjXe-MFxlYVOPVvjORJJZBuua38WNdPyuHZatQT_rjsw>
    <xme:KJcAa39831zivdkUsXOCp2k0BuoGPn61brsNb8IhP-HKJyWpMXEp4UTGVvKHWZL66
    ZCrAAwCCoSswayl9g_XzmwjY3059MxHgsDhS65oj_GJOGLp0_trSLA>
X-ME-Received: <xmr:KJcAa46qVGR94jqXlLWNt1ACLrMuZoE6DHgEQCTgPTfkPV-K1EC4ZmB-VrO9ATkiEI0rUq4-coUQtL5TJ8R5uiXGNYkYwyoQym3OFQ>
X-ME-Proxy-Cause: dmFkZTF40NY3j+ynN54GON3MNlAVzxJLtPAx2Hedsg+UjTHj4zhL7JTRhAJpFoXsLtvn+d
    lqP28eeB/BzEKpHqS1aE0+eMkKY3CaL4Kd1ab7pTKj71pDm6Q2932xedD8+/6RWYLt1Czy
    se4sW5hWg3zR4ZwAPtaB4BBpz3CUPGBBKncmjcZVDZeuALhJjD010wD8WQDSVMVovLzHpd
    eX6y5K5z3VcfqK/1d8wCfoxHFm7g39w/fJGF/1QrK6LIeZvtqkFpz4Xv5ssVbGumUJwN71
    AOtPCYYcwZGGBR8w+SJVJHQmuAE4PQ82dv2/TzBiysxC0z9kpgUlKX564Oj2+rPjlig4hY
    /HHnrXgeBt3jyW5M4RHUQsjhR9YM8R1y0yBKOkqoKj7PhB1tg5Z65dalBfzSDgjrqtS7EQ
    W+bOxM3gmiRPsn4xU2VGiu8i87K+Lo0Nh5G69PPa2VxdCeE8gHX2e9/gMANyuwqgjP1VQS
    Lz3nMiBOFAU62DroZJAtzmj5QcVrERAjXMiK9eNzm+AIAbBo+ud9ihYq18s6ac1DCBUPeh
    FzCTU8lKthDAcHemy1tHl9RBnA+Is+jMuA/PBq73mtbP+59BY1u6ZlBsZhy3A9fthWBK5O
    45xJD1M60+N7hlBeLxxUAX6rk1PrcdQWaG7At1y3kd7L3/BSYPjuCTJASnsA
X-ME-Proxy: <xmx:KJcAa14w6AgwSbs7jLlOlviyOVS0aHsxyo4tmHm9D5AP0QZDvXKnag>
    <xmx:KJcAa5pcvAPeKJohXIC8BjpLt_2LDrewJKjyQxH5Dt5NjVqVrMCykw>
    <xmx:KJcAa-OpEe_5OsN2BeL3-gJEyQixizKRO_RJhacX49MhqPC-3DKf_Q>
    <xmx:KJcAa50ciackflmNaysmWGp-UWeCr2zGyl_q6Q2kHdo6i7Rym64RCQ>
    <xmx:KJcAa48nGWBmFFLdIqobBVb7PhidQmydr9gv0KzSMvB13-ni0EfoKMMQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 13:53:27 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Fri, 20 Nov 2026 19:53:10 +0100
Subject: [PATCH v2 4/4] arm: apple: Add Apple M3 Ultra (t6032) support
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-apple-t603x-support-v2-4-606b4f5fadc5@jannau.net>
References: <20261120-apple-t603x-support-v2-0-606b4f5fadc5@jannau.net>
In-Reply-To: <20261120-apple-t603x-support-v2-0-606b4f5fadc5@jannau.net>
To: u-boot@lists.u-boot-project.org
Cc: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Simon Glass <sjg@chromium.org>, asahi@lists.linux.dev, 
 Anshul Dalal <anshuld@ti.com>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5805; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=uojPMqcnLErYgnIgNExM6qv7er8qhnePLXA1IdvhcN0=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhmyG6eIFoiYrVqZMeLJ2RnPt1gvW4qy57VH3fB6c6l9o9
 uVRxpkzHaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACZy4TUjw0bhwxXnghwCNNve
 rsuLT3+/VejVj7a/tS/LT164sGs/41dGhpcqMW2sDfa57kGqzK3qfQ27L6bcMpXT9b73ujN72TQ
 2HgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Apple's M3 Ultra (t6032) SoC consists like its M1 and M2 predecessors of
two M3 Max dies with an "UltraFusion" interconnect. Since it is only
used in the Mac Studio the mem map does not need to duplicate all
entries. Two of the USB4 / Thunderbolt complexes on the second die are
unused. Only PCIe host controller on the first die is used directly. The
PCIe IO on the second die is used internally to connect the NVMe
controller with the NAND flash.
Most of u-boot's existing drivers are compatible with the hardware and
M3 Ultra device trees will carry "apple,t8103-*" as fallback compatible
strings. Only apple-atcphy-reset will use a new compatible as M3 Ultra
has ThunderBolt 5 / USB4v2 USB-C ports.

Acked-by: Mark Kettenis <kettenis@openbsd.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm/mach-apple/board.c        |   3 +
 arch/arm/mach-apple/memmap/t6032.h | 136 +++++++++++++++++++++++++++++++++++++
 doc/board/apple/m1.rst             |   1 +
 3 files changed, 140 insertions(+)

diff --git a/arch/arm/mach-apple/board.c b/arch/arm/mach-apple/board.c
index c93c3bd56aa9..ae1b1a7b8a43 100644
--- a/arch/arm/mach-apple/board.c
+++ b/arch/arm/mach-apple/board.c
@@ -21,6 +21,7 @@ DECLARE_GLOBAL_DATA_PTR;
 #include "memmap/t6020.h"
 #include "memmap/t6022.h"
 #include "memmap/t6030.h"
+#include "memmap/t6032.h"
 #include "memmap/t8103.h"
 #include "memmap/t8122.h"
 
@@ -77,6 +78,8 @@ void build_mem_map(void)
 		 of_machine_is_compatible("apple,t6031") ||
 		 of_machine_is_compatible("apple,t6034"))
 		mem_map = t6030_mem_map;
+	else if (of_machine_is_compatible("apple,t6032"))
+		mem_map = t6032_mem_map;
 	else
 		panic("Unsupported SoC\n");
 
diff --git a/arch/arm/mach-apple/memmap/t6032.h b/arch/arm/mach-apple/memmap/t6032.h
new file mode 100644
index 000000000000..5616d7f32285
--- /dev/null
+++ b/arch/arm/mach-apple/memmap/t6032.h
@@ -0,0 +1,136 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * (C) Copyright 2026 Janne Grunau <j@jannau.net>
+ */
+
+#ifndef APPLE_MEM_MAP_T6032_H
+#define APPLE_MEM_MAP_T6032_H
+
+#include <asm/armv8/mmu.h>
+#include <linux/sizes.h>
+
+/* Apple M3 Ultra */
+static struct mm_region t6032_mem_map[] = {
+	{
+		/* I/O */
+		.virt = 0x280000000,
+		.phys = 0x280000000,
+		.size = 2UL * SZ_1G,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* I/O */
+		.virt = 0x300000000,
+		.phys = 0x300000000,
+		.size = 3UL * SZ_1G,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* PCIE */
+		.virt = 0x580000000,
+		.phys = 0x580000000,
+		.size = SZ_512M,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* PCIE */
+		.virt = 0x5a0000000,
+		.phys = 0x5a0000000,
+		.size = SZ_512M,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRE) |
+			 PTE_BLOCK_INNER_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* PCIE */
+		.virt = 0x5c0000000,
+		.phys = 0x5c0000000,
+		.size = SZ_1G,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRE) |
+			 PTE_BLOCK_INNER_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* I/O ATC0 */
+		.virt = 0x700000000,
+		.phys = 0x700000000,
+		.size = SZ_1G,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* I/O ATC1 */
+		.virt = 0xb00000000,
+		.phys = 0xb00000000,
+		.size = SZ_1G,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* I/O ATC2 */
+		.virt = 0xf00000000,
+		.phys = 0xf00000000,
+		.size = SZ_1G,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* I/O ATC3 */
+		.virt = 0x1300000000,
+		.phys = 0x1300000000,
+		.size = SZ_1G,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* I/O */
+		.virt = 0x2280000000,
+		.phys = 0x2280000000,
+		.size = 2UL * SZ_1G,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* I/O */
+		.virt = 0x2300000000,
+		.phys = 0x2300000000,
+		.size = 3UL * SZ_1G,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* I/O ATC4 */
+		.virt = 0x2700000000,
+		.phys = 0x2700000000,
+		.size = SZ_1G,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* I/O ATC5 */
+		.virt = 0x2b00000000,
+		.phys = 0x2b00000000,
+		.size = SZ_1G,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
+			 PTE_BLOCK_NON_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* RAM */
+		.virt = 0x10000000000,
+		.phys = 0x10000000000,
+		.size = 16UL * SZ_1G,
+		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
+			 PTE_BLOCK_INNER_SHARE
+	}, {
+		/* Framebuffer */
+		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL_NC) |
+			 PTE_BLOCK_INNER_SHARE |
+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
+	}, {
+		/* List terminator */
+		0,
+	}
+};
+
+#endif /* APPLE_MEM_MAP_T6032_H */
diff --git a/doc/board/apple/m1.rst b/doc/board/apple/m1.rst
index 3b4fb2913981..8637e29b9498 100644
--- a/doc/board/apple/m1.rst
+++ b/doc/board/apple/m1.rst
@@ -18,6 +18,7 @@ the following SoCs work:
  - Apple M2 Ultra SoC (t6022)
  - Apple M3 Pro SoC (t6030)
  - Apple M3 Max SoC (t6031 and t6034)
+ - Apple M3 Ultra SoC (t6032)
 
 On these SoCs the following hardware is supported:
 

-- 
2.56.1

