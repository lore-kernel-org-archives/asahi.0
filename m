Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D913546F0
	for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 12:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634457; cv=none; b=ojnrvW0Igb2MKmdLa6VKsAYyGD0q9AUKeBYlf3VWlDOuwFvy0jvRwD4peu93wbMQP46ZUQEkOlEd5zRa9ofKVtxrw1klQFVOIOJjWg4ON+Ba9PlfPWSA5ilvGgjwuT7WgrSVYfFkMugChtj3+9WUy03oRFnBCpXVZ64sQQguzBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634457; c=relaxed/simple;
	bh=UMoiybBG3EjMyc1B7IMzWmINUh/I4jezQPJ2/PB11ec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cz72vHYbCxf3Q8I7DITs0XErzyyMJSJK5mJct9KflyHkD1gh1i8PorhR6mlIOFcKmXNa83qeW2jBSRX5PJE4k3GBKNxP834TwP49e3CxagmJ7VtaNxMqJS36qWTj3m2wdOpqAC+AZisum/j6kR48QUDjZEdB+G754En0duwDjPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=Tr8UcHOW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Sms/TZRN; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="Tr8UcHOW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Sms/TZRN"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 7122D1D000B0
	for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 08:14:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sat, 10 Oct 2026 08:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791634455;
	 x=1791720855; bh=pH2ZSSrEkbK8zvPbZi3q/ueD1GzZZWWoJ2/oevJmUr8=; b=
	Tr8UcHOWh0so5TB+BrZf4TtL+WM25bmf5UxUy43uuFQLPJjRzuYJsci/NCiEwLdO
	EMb54XHylGq1qIZ88h6YodM6cdPzdTahQ9b6AljxN6+ie63AQ49HmBuOPVoBOBNm
	//z3tvcF/qF+8vDkyh/7CUfAHfb3wl9LxD1HCqxG9UoqU4pob6fXAGM7YlDuyaRn
	jaCXIESfOQHYNoHIW5SZtDwhKwqSO6QOtMP0vMz+HmK03qaS4cbHS4KIW17j0D0R
	/cRiZAYaf+/US4wCMJO7KPryKmm/08V21uQ2H/HWDnUPxsuc9Pg6sdt5gqKCF6AR
	CtJyxRz6JNXWDtNINH+U4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791634455; x=
	1791720855; bh=pH2ZSSrEkbK8zvPbZi3q/ueD1GzZZWWoJ2/oevJmUr8=; b=S
	ms/TZRN6sx8T6O8PRCZZyYLII6BVgzH/PCPRShpjqlhhvmGtEULV8rULjvA7Np4r
	Od6fvjKthbY6ueFMXU+Vr8iCgrE+mY6S1iEgD4dZRrLd0HWBJtxE3BXiSuwK9arN
	KM4RUZuo5OviT8/YuXr5bT6LaDcLRYsqQL2u/kMsm7/XUJLI2GlnvXFZYrZYL3xm
	ltuvw/KUhGlIuPTyqfL6aL24ec177qXVaW+ei3IbbgEoPC2YSKeG09ZYHrwBoe3G
	bmBGqPgHlCG72C9wt8+0nAA0MxFgEcBntGBTm2i1Howq6Zw0A7dC5bEg/0iNmuEg
	OHeAYXuPIp0v9r8mjILZQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791634455; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PGFzYWhpQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm3:rsa-sha256:FCHAz7qtbj10X806fX5yAdytLyyehNTJ/ctNnuRuEDiitau
	vKTUnY08YLc5Dod640FciUjr3mlIzvhcGe+IEPllXjyhw+52J/Jy4pU4c5rE5zRN
	c7kUB50fdWcu75EdU6FgaKVF+Lzqat80PeI1HZqAjUsSfNN0cBtSsNwRmEwR3mAJ
	YhW2e5unRo92qEfsCiG/nHB15mw4FqhGzI++SfTdJq/Bmgnb/8mQ3ZVC/UQBUoLp
	r6JAbxSdmyGlW5RnAbZ0WfNu8hKcqohWDZthzDZ4gnE9Lk/vtiNfOkA1muB0kkf8
	TcCB3JMZrtsE6LzyrwqlB44GCQ7ZONAvBHfpD7Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Ch+0ZGnLGNjuSLMEbnyZbEFC/apbCN9ElNqhpie1PfE=:UMoiybBG3EjMyc1B7IMzWmINUh/I4jezQPJ2/PB11ec=;
X-ME-Sender: <xms:FyzKakPtCTt2Go-UqAC-za3FKN2El4jWdaH_cr3B-DXJlMx9WP_YRA>
    <xme:FyzKak9VEVcpVVY3kaLDJEVhZaIh-CpOWSdhL9O9cZF0CRlEMnwcaQcaQys8vuwHt
    3gMjdTCtknyySoKpHp6DTkv3-V9OjTO7bxJOE-trElWRv0-1hGGwwI>
X-ME-Received: <xmr:FyzKah7bGPTtP27s5iBJzrzDqOxdKPA8JhCCVUaXMwKvy4PSc4ujmzPSXyJnc-qi8D0G0M_mgz-cQz7GhackCL0bnVGf_9D5TYHW_A>
X-ME-Proxy-Cause: dmFkZTFqpbXI6Y3+CoqfhNPZi+DG5Qw8jkDyXnjv8Zl/hcPn3S78Zk6eoCtECVWjb8Y2mP
    PIW0cluxF5Sc6nA8ZXBbZHx8G7ibOOE8hxiBeWn6zFftUvVf/TcCNPG9UjdVl7tkgXlBTM
    LIHFh5/qAXUQUGnZjrmiiLHT6Mhx9NZvwa2FwbUQYPStfkEM5s3u9Gz4n73nwucxxl+Vrk
    0OjGShLCaE1QK0a/CZkhOjweGMDOC/NfzcH4E1RuSEKg9vyf3c3eEfXLFETICuYPbtU3Nm
    g7JoKw89k6iDnZDjcXV42ma1zlizScl/jHbpW4kCJPOna53gfhZsymwqsPRvp8WnWwvdF3
    bbQNlwDZO6SmBoxq02G37YEcBn8LRuEyIMFQK4uZ3cl5hRw4iib6ceKweuQTa8inIknqmA
    SdR1c7z2Jikm3fbDGUIgY0xg3t0TjkRYLdKK87l8zESOq586v56uYAG3TPluxkrlyiddDk
    R00iqbFYM4lEhx2EUsHgYrVpo0SaRNqFf35uRG6sAuD+P/XPKaSEJMgF2j/9ljMLhMgAK8
    XGuijlR2N3MT62lbsXSOSw0fbuWWUVsCAxty6brHlmull2YYrWpobQRCyXEdiBCrQUp11Y
    QoUjckR0asNShN6TOW5H3EkObMAPe57HsBWIJbwvXLR0Z8cAxPoiBRSvPA+g
X-ME-Proxy: <xmx:FyzKaq490if3zmWymlUAS5sb9oKKvLu9IGwJ2-mGvuUCVQC8xB5huQ>
    <xmx:FyzKaqrnGRtR2LGk3pWLZtUy_UP-uYa71JltLF1qj83VGmC8wJ1Ozg>
    <xmx:FyzKarM_lv-8QPx89gX2HBBb8s1kGA6RQE8j0TD4dLzLni1sAUCSsA>
    <xmx:FyzKai3GVUr64qvTlXehO_1LIJqwdpFMJzT3qZBOCYCBri_Hgf6h7A>
    <xmx:FyzKap9zn01jGmRl6kbkd4FdkDcNNXz9OXqMuqCOaTjsUUfIT4hbV1x2>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Oct 2026 08:14:14 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Sat, 10 Oct 2026 14:13:57 +0200
Subject: [PATCH 1/3] doc: apple: Add Apple M3 as supported SoC
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-apple-t603x-support-v1-1-ca529f301a62@jannau.net>
References: <20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net>
In-Reply-To: <20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net>
To: u-boot@lists.u-boot-project.org
Cc: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Simon Glass <sjg@chromium.org>, asahi@lists.linux.dev, 
 Anshul Dalal <anshuld@ti.com>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=UMoiybBG3EjMyc1B7IMzWmINUh/I4jezQPJ2/PB11ec=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqxTOgKilvYaIjcYziY+udr9UePjwV3z7+7jeLkmXSj0w
 zLrN1U7OkpZGMS4GGTFFFmStF92MKyuUYypfRAGM4eVCWQIAxenAExE8xojw5qDd3N2WvpYS19I
 fsm0xllNrs9kjews949GCQcvFS+b9ZiR4Y+i7z7vp9XpW69dzA94el+iyiFv0pFPXpmCwk4N8e6
 7OQE=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Adding M3 (t8122) to the documentation was missed in commit a1a47eee6763
("arm: apple: Add Apple M3 (t8122) support").
Since Apple silicon SoCs have switched to upstream DTS stop listing SoCs
with device trees. The expectation is that u-boot support is added
together with Linux support. So the device trees might lag a little
behind. Since u-boot's dtbs are usually not used on Apple SoCs this is
not an issue.

Fixes: a1a47eee6763 ("arm: apple: Add Apple M3 (t8122) support")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 doc/board/apple/m1.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/doc/board/apple/m1.rst b/doc/board/apple/m1.rst
index 900c5e6d91ea..4ed275f7ea8c 100644
--- a/doc/board/apple/m1.rst
+++ b/doc/board/apple/m1.rst
@@ -9,6 +9,7 @@ the following SoCs work:
 
  - Apple M1 SoC (t8103)
  - Apple M2 SoC (t8112)
+ - Apple M3 SoC (t8112)
  - Apple M1 Pro SoC (t6000)
  - Apple M1 Max SoC (t6001)
  - Apple M1 Ultra SoC (t6002)
@@ -24,8 +25,8 @@ On these SoCs the following hardware is supported:
  - NVMe storage
  - USB 3.1 Type-C ports
 
-Device trees are provided in dts/upstream/src/arm64/apple/ and available
-for all M1 and M2 (t8103, t8112, t600x and t602x) devices.
+Device trees are provided in dts/upstream/src/arm64/apple/ and available once
+they are merged in the Linux kernel tree.
 
 Building U-Boot
 ---------------
@@ -82,5 +83,7 @@ supported SoCs.
      - Base Address
    * - M1 (t8103) and M2 (t8112)
      - 0x235200000
+   * - M3 (t8122)
+     - 0x2a1200000
    * - M1 Pro/Max/Ultra (t6000/t6001/t6002) and M2 Pro/Max/Ultra (t6020/t6021/t6022)
      - 0x39b200000

-- 
2.55.0

