Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD703F86EA
	for <asahi@lists.linux.dev>; Tue, 11 Aug 2026 20:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786479463; cv=none; b=hpR5eCgA75YIZdFHBTL/RpJFKZMr87vvRVUfOjuZzWiruBA76kg4XtaM5iMurAI7XZIvWfNBdduG5zdCdnXVfcHWxII6IXCHoEzDwK3F3f+LXwdnCb40CtzT79m7pOpNYuz1s7TgWoIjTh7Kw6HVgHAC+nKRI6MQriTU3ztft+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786479463; c=relaxed/simple;
	bh=gSjBIMWHca5U46ZxsrGHxju0cEEsz9xxV4nSDxxb9do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rz2BBp2rNsH8DvN6skWZcbKNSnIdK0xbJqN9u1HIoVQr5n4dYC54wxPJYIhEjeZmta2DVOt5LI0VE8M7dKX+IARCrR8uWaB6wgZo5hNVq9I9w71jqSBA9lXkB438xCIGVm2xr5YLqfPaz59TE/xyNSP7IiLm2uNFXsyIQ4hfioQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=QpOiOYAK; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="QpOiOYAK"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1786479459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OvNAr9Lgf36KCWSOvkbkg/HFww2daCBUTIh+sBR2P4U=;
	b=QpOiOYAK93eoX1joUGvSC/oFNENqYkEePKK9HJoho93XKmWa2u4StufcOkb/bc1z7dxnaN
	6V0t4X+zAVrRzyKhllZXS6y88QVWeDBsfgQUUexnPDRMMOpgRsYiklgPVekIXFvZMWm9pu
	qKpLQ1JmXEQBTIglVc/IBEQgxrFgD/E=
Date: Tue, 11 Aug 2026 22:17:35 +0200
Subject: [PATCH] arm64: Add override for WFxT
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-idreg-override-wfxt-v1-1-1c71228d0719@cyberchaos.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5FMBRG4VeRPT5N2hIRryIGh/5lGyC7bol4d
 8XwG6x1UoAwApXJSYKNA09jhPkl1Pb/sYNiF01W21wXxkQKOjVtEGEHtftjUY3N09S7zOnMUyx
 ngefjvVb157A2A9rlWdF13R8QyA93AAAA
X-Change-ID: 20260811-idreg-override-wfxt-b2633fd4d04f
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, asahi@lists.linux.dev, 
 Yureka Lilian <yureka@cyberchaos.dev>

Add an override for WFxT support within ID_AA64ISAR2_EL1 to allow
it to be disabled using the new arm64.nowfxt command line parameter.

This accompanies the idle=nop param introduced in a previous patch
series [1] in dealing with misbehaving WFI and WFIT instructions on
Apple Silicon SoCs, and eases debugging of other quirky WFxT
implementations.

Link[1]: https://lore.kernel.org/all/20260804-arm64-idle-param-v3-1-d10f8159062b@cyberchaos.dev/
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/kernel/pi/idreg-override.c           | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index cb5251242311..6a35623e4a17 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -587,6 +587,9 @@ Kernel parameters
 	arm64.nosve	[ARM64] Unconditionally disable Scalable Vector
 			Extension support
 
+	arm64.nowfxt    [ARM64] Unconditionally disable Wait For Event with
+			Timeout and Wait For Interrupt with Timeout support
+
 	ataflop=	[HW,M68k]
 
 	atarimouse=	[HW,MOUSE] Atari Mouse
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index 274bc72ba98d..acaf56234973 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -186,6 +186,7 @@ static const struct ftr_set_desc isar2 __prel64_initconst = {
 	.name		= "id_aa64isar2",
 	.override	= &id_aa64isar2_override,
 	.fields		= {
+		FIELD("wfxt", ID_AA64ISAR2_EL1_WFxT_SHIFT, NULL),
 		FIELD("gpa3", ID_AA64ISAR2_EL1_GPA3_SHIFT, NULL),
 		FIELD("apa3", ID_AA64ISAR2_EL1_APA3_SHIFT, NULL),
 		FIELD("mops", ID_AA64ISAR2_EL1_MOPS_SHIFT, NULL),
@@ -254,6 +255,7 @@ static const struct {
 	  "id_aa64isar1.api=0 id_aa64isar1.apa=0 "
 	  "id_aa64isar2.gpa3=0 id_aa64isar2.apa3=0"	   },
 	{ "arm64.nomops",		"id_aa64isar2.mops=0" },
+	{ "arm64.nowfxt",		"id_aa64isar2.wfxt=0" },
 	{ "arm64.nomte",		"id_aa64pfr1.mte=0" },
 	{ "nokaslr",			"arm64_sw.nokaslr=1" },
 	{ "rodata=off",			"arm64_sw.rodataoff=1" },

---
base-commit: 5e6de6a2b522f659defacb1551d0465ba6ce13cf
change-id: 20260811-idreg-override-wfxt-b2633fd4d04f

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>

