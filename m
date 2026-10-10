Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2D4490BE4
	for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 12:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634464; cv=none; b=WhisQIwwkB5j5Z7/YPVhZMA2lodTZrqeOrcdV/hOIAOSEU/bnVvUXWiPhPvQ6KpkUmHgx+RIjWmRMoTMQ71ZQvBcRdCTZ6KeBO7t25ZDkcLof7a0mTGhuvO9ba35/58xobpoGkeEA5Kf8xajvA8WinDJ0mzLMfZGVYm9f8KfxmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634464; c=relaxed/simple;
	bh=5Nc5WJQmlbx7bJH+ves53FiV/ys9K1ivWkdije5L/qU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A6hzf3/HY+O7OYnYPWNhv/TCOgaZ2HLsNfqVfXTP1BGN42QHPdB/T19st/XJTg54GHOrpnuDrW28xJjz0Z4zNENCHbHRHuEjwFGL2TG2t4cPVyCyn/2RZcJLznTw7aHAza81O8xn2zgIDninRLupiF2ffkrSjtkTon+lVYzrhPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=BnVcptCY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FuagkL9v; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="BnVcptCY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FuagkL9v"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C87CF7A009D
	for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 08:14:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 10 Oct 2026 08:14:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791634461;
	 x=1791720861; bh=fWQc/ThJPaitBWPHU5h4CIn3xEfHvtjRZYnK1mAPYzY=; b=
	BnVcptCYBoJHzw6L7mLO+BGkmq+apv5vrqhGxRdvgHxVhbXeGxhIR4rp10VERVEd
	Ty9z+5rPWl/AC1xLvqzCt0+USyO+1KoAUbdZnl56KXIuEAb4j/kAlpZT8HVD/EIi
	YJbpovLYFAli0uSrEiLWgr9jULiGmXYM8X7WgyUUyTzmd7wG5Tnl7nJyvfYfHtFa
	3JKFuMwp5786eh5AF78r+phrlY08wlxQplg20SO6XWUJPECKl9oBpMx0mY2i40Ri
	r3ol+DJYmahVa9jdg/Ksub9dxmm9kgqnyY+nQAf9WX7VKXSBMkEGC1+yz/3f9SRJ
	EBjHlfqqWm5Rw7D1LSRZ0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791634461; x=
	1791720861; bh=fWQc/ThJPaitBWPHU5h4CIn3xEfHvtjRZYnK1mAPYzY=; b=F
	uagkL9v+ZeCgsivwKJ24PRwHfT+Re89qd62J+ZBtcQsOmgP5VIwnTYHcApqUVuOn
	1iRaDaZjdhjUlsPo91dINafo6HEMQhXzCRz7J8ZgDIQKZMkWzY6JcayvmrrkljPa
	0Z/9yPmXxrrT4WzkVnFoj1mwZguUma1IO/sXIeH513x44DoDSzKBov1vwYK07eEN
	F2SGXwWXmJEXuOlQecQbXEH4lyfBdqWDkq8wzaSQYcUCJAuLlWCGkyfXP5mqs3qo
	Acbc5OfPreAdD/4t1Re1pjWGyxLkaKIF5hKuEkoRK6qBqJO0L3JS+7CVwhKQzgXu
	IlYubVJfrdDLavoYjszqw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791634461; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PGFzYWhpQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm3:rsa-sha256:Y+8+zzL1pPDD0Os57bnc6nYXB125oTtX6Q6gykV8pgbLNq8
	kNjxDyQ9RVmPARWR4clRZPNTGGPs377WEP09LiDOlXTwNRLHBi7P1KGNv18AJcu8
	VbSxOeTlUviZ7xfu5YNhi749gMYE2fLyPdGpTUo9AbjWC32+QfYNXbp30aBReLPg
	tYMeTmMbibmh9g0wLZOPjNHv3hHEwfxDkRPgH7T2o4VL1OW8HKk/pXf/8Xz2p0Q7
	VVm+H4YUELDrRskOIHUzXDb4hSuFSOPBxdUQyBzRFaH/tXivojd0rGlkIQqe6RO7
	WRmf9f/E13AclKHNis7hLi2v1d7zho4A03O95pQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:8U21TohnkAfpiw0uezkG/H2nS9j82uvYB1AyQajccQM=:5Nc5WJQmlbx7bJH+ves53FiV/ys9K1ivWkdije5L/qU=;
X-ME-Sender: <xms:HSzKaqLeUdA2w0_zuocjWg91FBz_Mt4wS-aXq6nekMAkxwUlDZGCFw>
    <xme:HSzKasJ0Im94lEprHJ5sYTrROSdwKkoLZouZB-bR9iwn5sv4oHqCUARXlHjGnrwKQ
    rNCEFTQgnmNr2MdT_R85dEQz-MqfiWe2MlyXfSXxUuHJmA9UcwrzfRLzw>
X-ME-Received: <xmr:HSzKahWRqE2RykYIHKHHZk5C47EQeW77gab4XvTuWWS6ZYJhwVMGM376Lv90a3VME0d0s90VL_tRmML8I4wQVB4CMtTQXOpEP8VGAw>
X-ME-Proxy-Cause: dmFkZTFqpbXI6Y3+CoqfhNPZi+DG5Qw8jkDyXnjv8Zl/hcPn3S78Zk6eoCtECVWjb8Y2mP
    PIW0cluxF5Sc6nA8ZXBbZHx8G7ibOOE8hxiBeWn6zFftUvVf/TcCNPG9UjdVl7tkgXlBTM
    LIHFh5/qAXUQUGnZjrmiiLHT6Mhx9NZvwa2FwbUQYPStfkEM5s3u9Gz4n73nwucxxl+Vrk
    0OjGShLCaE1QK0a/CZkhOjweGMDOC/NfzcH4E1RuSEKg9vyf3c3eEfXLFETICuYPbtU3Nm
    g7JoKw89k6iDnZDjcXV42ma1zlizScl/jHbpW4kCJPOna53gfhZsymwqsPRvp8WnWwvdDR
    XWhkumaZI/mI8Z6ZiTb5zyirRuiOnDy9YhoG1Y43/u8c9PSOyBk9HyURTM7BPSpkW2RuFL
    UBM7s78ibxETiVgK0+o4/g4rHohAFBRSFA3PNJOkEZNOM0uIIOszs7e/qsIrj6oKrJ8okA
    tW/BWPINliT5sv2B2zOJVcDpB7bohgXqLLrKn8pkixCqmwsWZHSSJGbsqyLrCU9Nmwljph
    ONRswWKmXc1R5dyQzkEIuKS/q8qxg1l6LLlakRKZCDC+Ok6y65Fxzwps3S6ZvOShFQLKpE
    z6dxpzfqzqIwtzLBicUGPhewug0E2WKj8p+t+ie+7uAgYIFWcOkrCm0vHkww
X-ME-Proxy: <xmx:HSzKatmhMlnS8mGGTv73JT7piOZtk7Hi8Gac3hgxU1Nvaan3U2eSTQ>
    <xmx:HSzKavkvx1zRtkZ6-jCV7YPPTcEkPJyPXEXCAVNx66apxgTQ8Z2O6g>
    <xmx:HSzKalYDKdDw7j6Bj2T99Z9pO6pKAv14KrixkqTFOaVLmF7_ACK6kw>
    <xmx:HSzKapSE26iIp_LGJVEKGu6o8pfw7Omwj3YUQrj0Eze_z3LLOJaXIg>
    <xmx:HSzKaiqZsyWK3QVER7uJ7oLFUtt3ZfOD-BBusZQSVd0f-AgjXk7dLUdG>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Oct 2026 08:14:20 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Sat, 10 Oct 2026 14:13:59 +0200
Subject: [PATCH 3/3] arm: apple: Add Apple M3 Ultra (t6032) support
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-apple-t603x-support-v1-3-ca529f301a62@jannau.net>
References: <20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net>
In-Reply-To: <20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net>
To: u-boot@lists.u-boot-project.org
Cc: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Simon Glass <sjg@chromium.org>, asahi@lists.linux.dev, 
 Anshul Dalal <anshuld@ti.com>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5142; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=5Nc5WJQmlbx7bJH+ves53FiV/ys9K1ivWkdije5L/qU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqxTOgLLLhy5EP/6VVHdo+UlqpxOuxdZPIs+5FWw/Q77j
 87tiz5HdpSyMIhxMciKKbIkab/sYFhdoxhT+yAMZg4rE8gQBi5OAZiIyCeG/+Wt3UL/ZWtb+D92
 d8jk3PzEZL5iyqZPq06kJkz0c8/Zsofhv3Ou7d8fWav+LLae5cBj2zfTwH+Rqci10DNvbWY5qr4
 u5gEA
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

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm/mach-apple/board.c | 127 ++++++++++++++++++++++++++++++++++++++++++++
 doc/board/apple/m1.rst      |   1 +
 2 files changed, 128 insertions(+)

diff --git a/arch/arm/mach-apple/board.c b/arch/arm/mach-apple/board.c
index bd0c69fcb512..d8ad925a00e6 100644
--- a/arch/arm/mach-apple/board.c
+++ b/arch/arm/mach-apple/board.c
@@ -843,6 +843,131 @@ static struct mm_region t6030_mem_map[] = {
 	}
 };
 
+/* Apple M3 Ultra */
+
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
 struct mm_region *mem_map;
 
 int board_init(void)
@@ -896,6 +1021,8 @@ void build_mem_map(void)
 		 of_machine_is_compatible("apple,t6031") ||
 		 of_machine_is_compatible("apple,t6034"))
 		mem_map = t6030_mem_map;
+	else if (of_machine_is_compatible("apple,t6032"))
+		mem_map = t6032_mem_map;
 	else
 		panic("Unsupported SoC\n");
 
diff --git a/doc/board/apple/m1.rst b/doc/board/apple/m1.rst
index 002f4926ed5e..f1be55996b95 100644
--- a/doc/board/apple/m1.rst
+++ b/doc/board/apple/m1.rst
@@ -18,6 +18,7 @@ the following SoCs work:
  - Apple M2 Ultra SoC (t6022)
  - Apple M3 Pro SoC (t6030)
  - Apple M3 Max SoC (t6031 and t6034)
+ - Apple M3 Ultra SoC (t6032)
 
 On these SoCs the following hardware is supported:
 

-- 
2.55.0

