Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EABF490BE4
	for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634460; cv=none; b=FAqen8Hrfr4evUlRSguWexMBbnDnMjshcOqGASXNjgghGpdyHz6zQsWrsn5GGwIDiyBdEHaL8fwOK9YKSsmEm3KnyRFDZ7jYGCLYfnXE9xHBnVJzwj5eaKWnda4/YaEOrZ5cBsNqUkYZA7C1++rWHdMLn6emGRdbhR4oQlIfl/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634460; c=relaxed/simple;
	bh=vcrEBnU6ijzpBzqutisMQ5dC4rYwFPRG9N9wVJH7Cpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CLccn8dAvCtIiRnfVooZEG5PQjDW5Dfo+J6Stx+W4+8coanjU8otNGvwDIS/K3QSALPbR+ORwK/rEZxRwQ62NbDYVgChC0ZTr9VjqzAPBBdoS2rkpUFeqMvArSKmqHx+msP41IhV/etFUPY5KwxS+CmSGde65iUbzdZQJFyu/rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=mxga2DRP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=NTeFiTut; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="mxga2DRP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="NTeFiTut"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id 8F8181D000B0
	for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 08:14:18 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sat, 10 Oct 2026 08:14:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791634458;
	 x=1791720858; bh=8lStNNkLAXUfx0Qk3vJLrMRYLaCj8dnR4qwFp1vdHhU=; b=
	mxga2DRPMNU2+75hBsLUq5sRR2wUb2eJJm0E4WAI9NVv1LoDU8ckhgUzjmjKkbWR
	KVMSGpRtGyzMlHdOJ2all0HzJaCKMhOqco50uJF7mwHKhvl5nlExkySsBuGzC+MQ
	/fRnw4wcYc1bmqgcBcpHLvepUp58rLMUp3zCtcOOoAqTbFSXwe/z3i+dXHb39Kce
	uHOgb9Y1XZaBMsXWXU3r675Zqwy2kftgOtuj2v9E/aRS7vU2EGA9CSOviYYgenpg
	dzv4fcOIoaqdH/nOsk/XH1mtstAmNzcHilcwQCdNhE2Muj2SALS2ZYEsvq2C7ivo
	Q17BXWElH/7/Mlx0vSzt2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791634458; x=
	1791720858; bh=8lStNNkLAXUfx0Qk3vJLrMRYLaCj8dnR4qwFp1vdHhU=; b=N
	TeFiTut/wfJ7HeoSN4tAL4jRKJFo1cyFGKpW8hkNtyug199O/5tns1730MQOXD0E
	EAXWClY8Q9mql3WKVZ0yT9bygMZGq6yRj5KY1NT7qPwpUqQUYCqOBQ/8dHVuUgro
	JjiDBiaepTFk206wTFLkS/+e9kXwd189cvIHOa8c6PnWquhCATRDGxhABIPml29d
	oQKshPGQDOSBdXfugyTIZb60ZDgEagkRU/JwGBE+AaDfAHsy099yIxBCUrDO19XE
	RoQWqhjhkCSAK9uJ19LmI3h4QC27aYBRbPiA+krN8TlRENY9/LURV6S14fa5FY1T
	ruv/3DeHPd/d10MLSJ8Ow==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791634458; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PGFzYWhpQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm3:rsa-sha256:c+MCp+ppFrBbz1MYpNTaRjuOonq//fse7PAYbjbzmpb5V4g
	wWOtUG3loQ5JWrsEjayuPZIWObQltHd+nkEw9GTku3M4rXn4t2Bspf3VmYxD1fzQ
	WyCrYVwJy3WltHL65N/GLqNW0ujusVKlVZuwGBAeik8ALpZDdCVJTH9aUjL+8t7A
	zIa+RBjxu5BsWT74PSIHPic7rmne4BXctJrVxsW8acRzqu5Ue2fhMkYLB4/389bG
	S5fbgkeyvfD+Rn5tcJw/r1bfyayoFYQrdpv9L+k7QCgqEOmY1grG7lSbnz4al4oI
	SlXRNgW/kPCE7A4eTvAMq4aUzPhC55588HB74tA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:awWpgZhrFpBup8cKHeu/HlU2r1A2vvsESuj07BunT5g=:vcrEBnU6ijzpBzqutisMQ5dC4rYwFPRG9N9wVJH7Cpg=;
X-ME-Sender: <xms:GizKaqSLVlYWzraOe1Vd5_TcLYnzEOOv58gZE7AThQ3lCM0_RbbXXw>
    <xme:GizKapzqZ-yQLRKkiuKzLa44eAVVqUxRj8YbaU8WnImKEYK2OL5CyCuuEP2OMfOqB
    4EzDTe77AWbYyTwfeQNno2rFAB9Jk7HLmOtA0LF1h0SqEGcTQW18x4z>
X-ME-Received: <xmr:GizKaueaFb2Y6EVCmHIykBAVZrR8DnHbdhbzSJ9d5Hlu0otMohmngq7vX3hTwha5UKFX_w7mehWHshkycpq8P7fcmsl4sLJcuHdNog>
X-ME-Proxy-Cause: dmFkZTFqpbXI6Y3+CoqfhNPZi+DG5Qw8jkDyXnjv8Zl/hcPn3S78Zk6eoCtECVWjb8Y2mP
    PIW0cluxF5Sc6nA8ZXBbZHx8G7ibOOE8hxiBeWn6zFftUvVf/TcCNPG9UjdVl7tkgXlBTM
    LIHFh5/qAXUQUGnZjrmiiLHT6Mhx9NZvwa2FwbUQYPStfkEM5s3u9Gz4n73nwucxxl+Vrk
    0OjGShLCaE1QK0a/CZkhOjweGMDOC/NfzcH4E1RuSEKg9vyf3c3eEfXLFETICuYPbtU3Nm
    g7JoKw89k6iDnZDjcXV42ma1zlizScl/jHbpW4kCJPOna53gfhZsymwqsPRvp8WnWwvddS
    h8s3NavUQnx0e/VpFjzmMfC20uSw3oapD0J5PvkfwvJF9/xguGwNcPldu9btJKh8yU/FmS
    U9X+jkO6jKloxMiV1WMC+kOcHqX+GenLHViPsW39Y3D/2cNj6U020KeLQO+zk+frUXc2Uk
    d4fob9fVYqbkjJrZh5GrxX6f/aBEg6o8iibc5Y/en9zHOzPRcpL8+GaVmUbSCgMT0Yd+kl
    oqdKY5KvjVV5xtkqUGZNHGrnJiD/0gd4MVAwuKxu9aWJxF3aHiIPvwcC2dQqJHn9qIQQZp
    m3wASuHYv/nJy6uKPK897AlO/SUPMFEGz57jEka/8gGOMfmlAb5/TKNXQA8g
X-ME-Proxy: <xmx:GizKakN8Cut1KaBnTd1aovZxalHaQbDDNJZWW_iRTqYlqEtw69dWJQ>
    <xmx:GizKahtroqlrr9TH9o88AFJk7NCsJbPnCqrsmMWOtZL96rMAHGgHEQ>
    <xmx:GizKatC8-X_m8WWklhxyxTNgl90q1CflaLEHTWHRYF6t5NkgMzOJYg>
    <xmx:GizKaoYZ1tP2BLsWhZguQmwbI53y6utNVKF_YUpy0_K9JZVmGRP9_g>
    <xmx:GizKaiDve0j9E7h8GZw2K5xNdxzsRV04iDMsJ5--nEVFplmgtbl3Yf5Q>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Oct 2026 08:14:17 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Sat, 10 Oct 2026 14:13:58 +0200
Subject: [PATCH 2/3] arm: apple: Add Apple M3 Pro and Max (t603[014])
 support
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-apple-t603x-support-v1-2-ca529f301a62@jannau.net>
References: <20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net>
In-Reply-To: <20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net>
To: u-boot@lists.u-boot-project.org
Cc: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Simon Glass <sjg@chromium.org>, asahi@lists.linux.dev, 
 Anshul Dalal <anshuld@ti.com>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4492; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=vcrEBnU6ijzpBzqutisMQ5dC4rYwFPRG9N9wVJH7Cpg=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqxTOgKhMcHnFv8+VW96d8H6tVPFPzJ9++W98pP31DJ+h
 RN3L52W6yhlYRDjYpAVU2RJ0n7ZwbC6RjGm9kEYzBxWJpAhDFycAjCRxTmMDFt2vXvkVJ/zxybf
 /38481ODaJUrr8U/8piLGJ3T62WoeM3wP1pgu51eg/8N68db9Rx13a6uXPhw06b9lrP+ancvKCu
 SYAIA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Apple's M3 Pro (t6030) and Max (t6031 and t6034) SoCs are similar to
their M1 and M2 predecessors. The MMIO blocks have been extended but
M3 Pro and M3 Max still share the same overall layout although they
aren't as similar as M1/M2 Pro and Max.
Most of u-boot's existing drivers are compatible with the hardware and
M3 Pro and Max device trees will carry "apple,t8103-*" as fallback
compatible strings. Only apple-atcphy-reset will use a new compatible
due to USB4 and DisplayPort changes relevant to the Linux driver.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm/mach-apple/board.c | 97 +++++++++++++++++++++++++++++++++++++++++++++
 doc/board/apple/m1.rst      |  6 +++
 2 files changed, 103 insertions(+)

diff --git a/arch/arm/mach-apple/board.c b/arch/arm/mach-apple/board.c
index e74a5a76919a..bd0c69fcb512 100644
--- a/arch/arm/mach-apple/board.c
+++ b/arch/arm/mach-apple/board.c
@@ -750,6 +750,99 @@ static struct mm_region t8122_mem_map[] = {
 	}
 };
 
+/* Apple M3 Pro and Max */
+
+static struct mm_region t6030_mem_map[] = {
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
@@ -799,6 +892,10 @@ void build_mem_map(void)
 		mem_map = t6022_mem_map;
 	else if (of_machine_is_compatible("apple,t8122"))
 		mem_map = t8122_mem_map;
+	else if (of_machine_is_compatible("apple,t6030") ||
+		 of_machine_is_compatible("apple,t6031") ||
+		 of_machine_is_compatible("apple,t6034"))
+		mem_map = t6030_mem_map;
 	else
 		panic("Unsupported SoC\n");
 
diff --git a/doc/board/apple/m1.rst b/doc/board/apple/m1.rst
index 4ed275f7ea8c..002f4926ed5e 100644
--- a/doc/board/apple/m1.rst
+++ b/doc/board/apple/m1.rst
@@ -16,6 +16,8 @@ the following SoCs work:
  - Apple M2 Pro SoC (t6020)
  - Apple M2 Max SoC (t6021)
  - Apple M2 Ultra SoC (t6022)
+ - Apple M3 Pro SoC (t6030)
+ - Apple M3 Max SoC (t6031 and t6034)
 
 On these SoCs the following hardware is supported:
 
@@ -87,3 +89,7 @@ supported SoCs.
      - 0x2a1200000
    * - M1 Pro/Max/Ultra (t6000/t6001/t6002) and M2 Pro/Max/Ultra (t6020/t6021/t6022)
      - 0x39b200000
+   * - M3 Pro (t6030)
+     - 0x289200000
+   * - M3 Max/Ultra (t6031/t6034/t6032)
+     - 0x391200000

-- 
2.55.0

