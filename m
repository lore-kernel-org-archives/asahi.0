Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D314E519926
	for <asahi@lists.linux.dev>; Fri, 18 Sep 2026 16:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750064; cv=none; b=nrH/h3hGc73pgbvdmRHi/YhbdNoiQXKEW8QNf5xxAUmHbttz9S43pQMZLbYTlMQuEfqWeo0GOHr59u9nWPP/jcAMCHN/0CvnB5mw2fUJntdJRH0MYOgEOJksgSFKhf9uvs0QNgZV8CTijgcoXf+zMopk9EP6bIT8mdvQhsy20x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750064; c=relaxed/simple;
	bh=Y77Z1J3VIhFnhKwdKSgUSyUOgqiXcpPLGPr9pLwn6OA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=akdEGOGXhR7Cjazlgg1y+7cscj8JaSCqD1vgASudYXKGyOgW2M6VDJwzq8ztFRR3b3hykEP4QSzBvrFanYaVkUC5DdULP5x6ekI6oI9Gq2j35Yggz4f7LbL8eNqBvKna0xegwr3QXuiK3Fsi+4cPhj7oBpMgdAEkcKij9VcsY0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n7X/gq7o; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n7X/gq7o"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469a34908so984433b3a.0
        for <asahi@lists.linux.dev>; Fri, 18 Sep 2026 09:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750062; x=1790354862; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWKD/UjAbfhc4ufwKqglnF54JbL9r5nugGNbeX3aT9w=;
        b=n7X/gq7oAHwqs9EbdCs3Vn1rQK2qgOdWg4HQuSWrYSNi3rf5RYjOw4OIe4k+FW/v4d
         NGHnIOhW8eHFLfBLVpZxEq+iyu9t/aNaHWIihQYiDx6Mc+rqWe9WEO9eOE1MQJG95+A4
         h+JX07WZAJpKcGmXrqKD9cJilVBolXvtAR7dcAUBxg+GEjB3gZH9lNxlPFlUzg3/iZHD
         bl3DpWvLceoaFZWLZCVzt2q3/+Q3gOAxMV3w4VHc5oZ+ZOkt6YYpmL/wVNBQBnUvMs0v
         gUEFLJDRs1v7WwR0OnkdP9KMwJBiE9m3zYl/wa7lbf46VR0KRpJsNC8pArDuxY7k4zrk
         f/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750062; x=1790354862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWKD/UjAbfhc4ufwKqglnF54JbL9r5nugGNbeX3aT9w=;
        b=VXje+hY5b0smvB6CCKnPzuaAAaYwOdaixG5Xrd3C761uDTJnyweAPxWePQi85Wzuaz
         WWJp2/bo4VsTUv2+2h606PpsgFPSIl4rLsTfhbzcijOdQEh0TGTWRBZFaX4lSncSGHPv
         vI69rBQr/s5kxwcqyVe1EFCCWR+fkSxCWABiocI4KKsxM5GVUx4fsGkJ1mVEvnDlLo4j
         Y2QEwoqIe0KmUe1LXCPU0pWIG6KW836NzEGZWaLFPqdb1BB8RcJ0mP7g56+BS7AJK0TQ
         SoZuxfzX8gLNX+WzSrOCopOT1mE7im7gIAzvlB6D0pJQ9T06vDrNJS64h9bvUKH9HMHN
         b9Sg==
X-Gm-Message-State: AFuF++lnQFUWvxXIoeodUY2Z87bLI00/KgYIQLbvgo/fsdqhZZ2lxh+U
	ZMoiZ2nhZrP93/3HTBcbwUUIt6m3Q2HiIUMSioQZCX+3ZWKQm/hnayW8
X-Gm-Gg: AYBFou1y9pZYDzTIRBcOFIWPqqSekHgtFhLtVNK1qNm5+2qsCKZZWFjtIssQEXIRwsP
	b9czi+BQIECwvF09NB23bv0zCCtdf9K2orYyEqxaXyrZmArLdYT2xxiv40pb4hRlo+Kt3pS6Rlp
	DyI338LlEYxa0XZ6eCGFgAc0fNRHYiaxr0w+28T+ty3ZdaLwd56QbbzGbwUwp4ECFEc27g4kAlf
	hgenBuJRuXmREZEogI125kXcPCu41Hw1olDxTXFIxd3aOvg2kgHPqhNjeX8xZ2KV4nkCEMMP4Fs
	NNFIdRWS///7epl736kZ2YntsSr9UQja0FJV7XJRfzL1H1zpWs4QiDc+WP9V6SFhx1QFL2m7vZy
	POM0oS7W9nqVBh3Ziguh22ixsPLcSQXUEjk+NWBFfqu/LFckS16kiyWsbOfAYgoQ8cPJPtR6WC8
	tQ73Kf94skrs5aj9vjKqHCTO16nNdNaOa2ORfPuI18+B6qFWfMgLXH4bGTY/KhN9Wz1Egk9o+L
X-Received: by 2002:a05:6a00:f87:b0:86d:7462:414a with SMTP id d2e1a72fcca58-874db8eb145mr6579181b3a.7.1789750061944;
        Fri, 18 Sep 2026 09:47:41 -0700 (PDT)
Received: from [127.0.1.1] ([223.122.38.120])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-877a8dfe201sm50514b3a.18.2026.09.18.09.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:47:41 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Sat, 19 Sep 2026 00:47:04 +0800
Subject: [PATCH 2/2] soc: apple: rtkit-crashlog: Add support for AArch32
 state 'CrgA' section
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-rtkit-armv7-crashlog-v1-2-f4a671ea453c@gmail.com>
References: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
In-Reply-To: <20260919-rtkit-armv7-crashlog-v1-0-f4a671ea453c@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4198; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=Y77Z1J3VIhFnhKwdKSgUSyUOgqiXcpPLGPr9pLwn6OA=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBqrWsk7omeMzvdcitvH2/8gz8Yi+jaRw/Tk4IgI
 5534I+qe7qJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaq1rJAAKCRABygi3psUI
 JEK0D/9Kfa7Epjlhe9qqYxU2jBhD/ZecorVNyE0jqtyJshS01kR+G55qbyUSKIagHwbniwuAsl+
 odn+CsCvydbje8Oso042k1X1wlgngDBwMFL202WWl8rw9yXmnp7YqO68OYZMy4Hx7Yb3AkiaK5O
 +q7Wl5CF/GgG8kmlg5DuC2pNCyVTi5tKESXoz6UoVhZqrUkP7nFZs63/9oxBFnYbabY0flUvXJf
 ZoNzQX2LTk0jp44E+n2F0xVngzMZzU/J6hDh8aUUFav91BxuOTBqt9uT6Fs1tOAlSH9W6Z6IEWP
 KOPP/oxlZWVpsq0+8wXzmbIDaCMR7axhCIm6/SE6HUhdW2hyeFWuMBfhNrBOaAXwf7L5o0yYX4l
 wOiMLNo+StR9SlSBobAbPwkFWYi2ccI8VApQnkjoy7WDS0HmJq5VzUgltq8gBu5s27HFLePjzAx
 7MRr2a2z6SJmuk0PjoJNf8WkNI/W84fA9cA1gsJUsBEPOQF8sd4O0td6uKOgnULPGBXtE8XsMN/
 ZKwV3D2AvsZoKjVvzPNlGu1Ug/p5Qkd1MWXkf0tnCRHAngZYRQ+lFeJ2w5ppMym3kAHLhHvP7zS
 qqmqkFv15Pv0EDpROnVPfQi+lyt6Pn4KS0gHNZ5nvYZO9f4ghN7j1vgcGbObDr0FmA5403IrkwV
 mcbuhp+SNze+7Bg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add support for CrgA section containing the AArch32 IOP CPU state, which
may appear when an AArch32 RTKit IOP crashes.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/soc/apple/rtkit-crashlog.c | 96 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/drivers/soc/apple/rtkit-crashlog.c b/drivers/soc/apple/rtkit-crashlog.c
index 6a8273e81e61..195b7869ce58 100644
--- a/drivers/soc/apple/rtkit-crashlog.c
+++ b/drivers/soc/apple/rtkit-crashlog.c
@@ -13,6 +13,7 @@
 #define APPLE_RTKIT_CRASHLOG_VERSION FOURCC('C', 'v', 'e', 'r')
 #define APPLE_RTKIT_CRASHLOG_MBOX FOURCC('C', 'm', 'b', 'x')
 #define APPLE_RTKIT_CRASHLOG_TIME FOURCC('C', 't', 'i', 'm')
+#define APPLE_RTKIT_CRASHLOG_AARCH32 FOURCC('C', 'r', 'g', 'A')
 #define APPLE_RTKIT_CRASHLOG_AARCH64 FOURCC('C', 'r', 'g', '8')
 
 /* For COMPILE_TEST on non-ARM64 architectures */
@@ -25,6 +26,21 @@
 #define PSR_MODE_MASK	0x0000000f
 #endif
 
+/*
+ * AArch32 mode definitions: APPLE_RTKIT depends on APPLE_MAILBOX, which
+ * depends on 64BIT, so there is no need to care about COMPILE_TEST on ARM.
+ */
+#define USR_MODE        0x00000010
+#define FIQ_MODE        0x00000011
+#define IRQ_MODE        0x00000012
+#define SVC_MODE        0x00000013
+#define MON_MODE        0x00000016
+#define ABT_MODE        0x00000017
+#define HYP_MODE        0x0000001a
+#define UND_MODE        0x0000001b
+#define SYSTEM_MODE     0x0000001f
+#define MODE_MASK_32    0x0000001f
+
 struct apple_rtkit_crashlog_header {
 	u32 fourcc;
 	u32 version;
@@ -60,6 +76,20 @@ struct apple_rtkit_crashlog_aarch64 {
 } __packed;
 static_assert(sizeof(struct apple_rtkit_crashlog_aarch64) == 0x350);
 
+struct apple_rtkit_crashlog_aarch32 {
+	u32 unk_0;
+	u32 unk_4;
+	u32 regs[16];
+	u32 psr;
+	u32 unk_x1;
+	u8 stack[0x100];
+	u32 unk_x2;
+	u32 unk_x3;
+	u32 unk_x4;
+	u32 unk_x5;
+} __packed;
+static_assert(sizeof(struct apple_rtkit_crashlog_aarch32) == 0x160);
+
 static void apple_rtkit_crashlog_dump_str(struct apple_rtkit *rtk, u8 *bfr,
 					  size_t size)
 {
@@ -123,6 +153,68 @@ static void apple_rtkit_crashlog_dump_mailbox(struct apple_rtkit *rtk, u8 *bfr,
 	}
 }
 
+static void apple_rtkit_crashlog_dump_aarch32(struct apple_rtkit *rtk, u8 *bfr,
+					      size_t size)
+{
+	struct apple_rtkit_crashlog_aarch32 *state;
+	const char *mode;
+	int i;
+
+	if (size < sizeof(*state)) {
+		dev_warn(rtk->dev, "RTKit: AArch32 section too small: 0x%zx", size);
+		return;
+	}
+
+	state = (struct apple_rtkit_crashlog_aarch32 *)bfr;
+
+	switch (state->psr & MODE_MASK_32) {
+	case USR_MODE:
+		mode = "User";
+		break;
+	case FIQ_MODE:
+		mode = "FIQ";
+		break;
+	case IRQ_MODE:
+		mode = "IRQ";
+		break;
+	case SVC_MODE:
+		mode = "Supervisor";
+		break;
+	case MON_MODE:
+		mode = "Monitor";
+		break;
+	case ABT_MODE:
+		mode = "Abort";
+		break;
+	case HYP_MODE:
+		mode = "Hypervisor";
+		break;
+	case UND_MODE:
+		mode = "Undefined";
+		break;
+	case SYSTEM_MODE:
+		mode = "System";
+		break;
+	default:
+		mode = "Unknown";
+		break;
+	}
+
+	dev_warn(rtk->dev, "RTKit: Exception dump:");
+	dev_warn(rtk->dev, "  == Exception taken from %s mode ==", mode);
+	dev_warn(rtk->dev, "  PSR    = 0x%x", state->psr);
+	dev_warn(rtk->dev, "\n");
+
+	for (i = 0; i < 16; i += 4)
+		dev_warn(rtk->dev,
+				 "  r%02d-r%02d = %08x %08x %08x %08x\n",
+				 i, i + 3,
+				 state->regs[i], state->regs[i + 1],
+				 state->regs[i + 2], state->regs[i + 3]);
+
+	dev_warn(rtk->dev, "\n");
+}
+
 static void apple_rtkit_crashlog_dump_aarch64(struct apple_rtkit *rtk, u8 *bfr,
 					      size_t size)
 {
@@ -230,6 +322,10 @@ void apple_rtkit_crashlog_dump(struct apple_rtkit *rtk, u8 *bfr, size_t size)
 			apple_rtkit_crashlog_dump_time(rtk, bfr + offset + 16,
 						       section_size);
 			break;
+		case APPLE_RTKIT_CRASHLOG_AARCH32:
+			apple_rtkit_crashlog_dump_aarch32(rtk, bfr + offset + 16,
+							  section_size);
+			break;
 		case APPLE_RTKIT_CRASHLOG_AARCH64:
 			apple_rtkit_crashlog_dump_aarch64(rtk, bfr + offset + 16,
 							  section_size);

-- 
2.55.0

