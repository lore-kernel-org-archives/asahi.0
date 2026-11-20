Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200806;
	b=VJj46bo1jJcb6om5wcLSfuAro3CHWm+Yio0kNTaUBCrQ++i/FL8DZu8Njvqw/JS4bDTH
	 pHRgXP1p2/NKUArElFTSzG0iqtLtA8Cph225KR69l5w7qgW9cZ6XjHW032clNx66fzgYk
	 XmaVoJzLWkS0RHQYOrSPLOjDum9QEhzf5FV7CKtpf7qAX/lIdWB1iWobsb8l2VFjWhW0D
	 4zrPx55YYHmRJgiEE46ciICJytbdaz1O3aKIJ5TLQC2Yj2O1Y18EER/t+HWb/atOMqwiR
	 oxU+JB9wSPqqmXVdslpARO7N+DHNHyNeilsrMQJ1vqWv1V8GaVOdKyxjuKBmmlX4K/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200806;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=iiJipBn850reirK6+kncrgNMfk2pdS/rDQbCsvsHvmc=;
	b=O2xpc0jV4gSf1AbX58m3PZec5yCooMDY3Dt1736ocf3tAGZb/Ud2hHLHN34N2UENR/TI
	 Foj9LOVu/YwsAFRxyHkR3lOqHCpaRQHbNx8+faPEGejLp3lOAU8MlrPeZSjc60bfAmKY6
	 3lsaer8ViZq4YhnyK52OlRrj9skWe+UX/hjN8tlb+1T+4FHtlpm3SNTIKX/31yr7hEcV9
	 Gtx1ikzTvmxzFPy/eb2K0l8uoYW07FmbDGQhTrG1FBcR214UYyzljwA8jtSVu367aMQsk
	 uiDgt1JadnKy7R3I/48A66LGb37D90Ovy3x0oalJ4LSZcHVn1btpm0+R6ykDkhzeZVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b="p8X/CmP0";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="0J1JY/Je";
	arc=none smtp.remote-ip=202.12.124.151
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FB360A261C
	for <asahi@lists.linux.dev>; Fri, 20 Nov 2026 18:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55FB360A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=p8X/CmP0;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=0J1JY/Je
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 8DBAD1D0047F
	for <asahi@lists.linux.dev>; Fri, 20 Nov 2026 13:53:19 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 20 Nov 2026 13:53:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795200798;
	 x=1795287198; bh=iiJipBn850reirK6+kncrgNMfk2pdS/rDQbCsvsHvmc=; b=
	p8X/CmP0t7n6MHmeSrNySasRr6L/iJNgIZwII3JMo7dIHBz9eu0C5jYzco4y2JFB
	CbVubs69rd0Up6APQ3my/fj8E95tBN2GjleTn47ufUFztfPmwY4o8jyvKa5FjA7L
	zH2uCYfIadDZVdubeJBCYI0yShf84gH6jtVRgc1gRB78AGUmZpaR12sxinQh8zBb
	FRN9RqOtzuUtOzfX4lzLn2cWsxAY4TTqyOr5AalmPE2/po0cJ0n7Nik7oxoAYbxp
	dwbbbAEdOFV7+AmMX06wNLxgcAGaL0OOedGWP3/W2fw9sr9eZKUY0MYQt9giGDpP
	nXJiVHbhDH1/euiU+pPoBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795200798; x=
	1795287198; bh=iiJipBn850reirK6+kncrgNMfk2pdS/rDQbCsvsHvmc=; b=0
	J1JY/JeJrma6I0XA+wjQWjorqIRb7VdMt9UH8nX3KovmULSwWhSO24RdVV3Hpi1E
	QQwbISLHVoNsYNQZiHH1ppD3GE6QbLFl4Vma8osVmHfFvQB6NWbCdjG0xnznflqo
	ciGjeg54HYzvPIurPU8yhSNnMvHfJEbSU5YgsComL1o4h8jfqPAM8m7Q1gb0hG/F
	jZL0I0kAMJTxEuq8rcxLhnd7pJN8tUzzk8Y34azNXnGs6AcAmMnT2p0+ciQOmq8c
	D1JaXydbfahYBupTJ8Nkl/5tdVUw0+WiH3dCIAy6UiCwvlQlLV/rvewT03R+M92e
	ataSxTczj5W/ZVv6ydYzA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795200798; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PGFzYWhpQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm2:rsa-sha256:1sNm6OmD2cN77GAKgAj+9CK9bIKbCroOQseGrBtmkKpBn/b
	UF6D9UZ7SBBScIjCOQB4eBnlhJE2pp1voZ+bo3H8AXRo/mb8rm8ktH+JdM4NhTG/
	Mu1pMytKaXhrkAwibZn86owbO44pKuY4tsJqX87gAp0U4ZQD4eCJOw9EQAeJpiS3
	rJHWCkkEMOkw5c/zCzoUOcOelo23GmqyPghZYVh86JzKVOhIcDnPH8T96yx5YYeN
	1XX8nBmiPKQTgEO9BRbB1Lj17Rn1E80NMG3K5vBhMtubFUJdPALIWP7nENJedptY
	fNjgmvcT/6qpnw5twld0TtmMdzTFsZsx0t944lw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Utu1eENU9ExXd3GViukhIgmpayfwzXHGWkx40Hfft1A=:2m6kMX31ZvVoOQthNIdR686NyQo80Zfgai2Y+9K7r7A=;
X-ME-Sender: <xms:HpcAa3hYCE63nGsYqYupueRCBMV1YUFIFbLkms0Vu4OsKqirunNnFQ>
    <xme:HpcAa-CYksz6P7jRtUshtBTVfB9iggvW2EyVkeJLTWRmGeZZ3Puuem7FKVzRk-u_k
    U-_ocYRYaiFkdUUEgrAy45tLZFAeMacP0JbpOkUh5u-04vCywNuIv5w>
X-ME-Received: <xmr:HpcAa9vlgibDjg0LY_VLMCb_jZTruG2yIy1jm9L0TD480e22YxueWW-2W3Flod_RCHv7aUtqBbXW7A2gxJvpY-TxvfkZ44-RZ_M9ww>
X-ME-Proxy-Cause: dmFkZTF40NY3j+ynN54GON3MNlAVzxJLtPAx2Hedsg+UjTHj4zhL7JTRhAJpFoXsLtvn+d
    lqP28eeB/BzEKpHqS1aE0+eMkKY3CaL4Kd1ab7pTKj71pDm6Q2932xedD8+/6RWYLt1Czy
    se4sW5hWg3zR4ZwAPtaB4BBpz3CUPGBBKncmjcZVDZeuALhJjD010wD8WQDSVMVovLzHpd
    eX6y5K5z3VcfqK/1d8wCfoxHFm7g39w/fJGF/1QrK6LIeZvtqkFpz4Xv5ssVbGumUJwN71
    AOtPCYYcwZGGBR8w+SJVJHQmuAE4PQ82dv2/TzBiysxC0z9kpgUlKX564Oj2+rPjlig4Cd
    FcVqqrLmAOEHKs18hAA2HHT6vyUSvzjr09dZAM5uppYHdhbYKEw5Jl4LuVqPV0sYVJCG8j
    WD4tzZcX+G8gvx5D8PZo5wodzbsBCRr6v0BC9IcGEt4xV+S/skJAkQcCjHzNN4XbklCW8W
    jv9Gr8+O6yhDfqOtkECeNHRHZtyIlFPR+KmezbPEefx6ElSE2m0ZuRfWHqV9Pu0UJDA0nI
    NTJ5G8GbknaIiT6QJayn0TyWbksjRq8iUEDBlTrTnrEh3wo/hLasbGDXjMSYXgHaUDb8sm
    r5UQ/VbE7n27ymoc6mdhJF9QeDNhSZWTK0R96+u3vpVBBcFtPc2xBykPf2Aw
X-ME-Proxy: <xmx:HpcAayee2rALDli1TLE3i6zc-cIN-Gg9J5oka3yoKHQ3XI1mfBUfBQ>
    <xmx:HpcAay-x49dIOZxssUTCsqFpjB-kVKD0djqetODe7nsJ5_4mHJ6UjA>
    <xmx:HpcAa1SLKslCKWpBRYKS1nK3182nt6b_KK3AJpjY_RLbFmc8BhbBDw>
    <xmx:HpcAa7qf2LBmCxT5skbRJL-_SiPhoDfvkTR1NWtCWNuT7bGyhSGVxw>
    <xmx:HpcAawj_yjAFTwcZLOEe5viVbol7GdryvoBboKUn3KLPocU_gM3PHVte>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 13:53:17 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Fri, 20 Nov 2026 19:53:07 +0100
Subject: [PATCH v2 1/4] doc: apple: Add Apple M3 as supported SoC
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
Message-Id: <20261120-apple-t603x-support-v2-1-606b4f5fadc5@jannau.net>
References: <20261120-apple-t603x-support-v2-0-606b4f5fadc5@jannau.net>
In-Reply-To: <20261120-apple-t603x-support-v2-0-606b4f5fadc5@jannau.net>
To: u-boot@lists.u-boot-project.org
Cc: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Simon Glass <sjg@chromium.org>, asahi@lists.linux.dev, 
 Anshul Dalal <anshuld@ti.com>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=2m6kMX31ZvVoOQthNIdR686NyQo80Zfgai2Y+9K7r7A=;
 b=kA0DAAoWoRs8240vZWYByyZiAGsAlxeh8R+y+Ja44Nq6UEWVTcAwtpsxvgkVhoa061x4IfALt
 oh1BAAWCgAdFiEEYivpiACrfCFcfeBWoRs8240vZWYFAmsAlxcACgkQoRs8240vZWY5+wEA+tQt
 2bWvAAISCks35wzzsU5o9UBWEbLp8kdNIKF4c8ABAK/wSzAtRkH9290qpyhYGWLXSkmjdUwFUUO
 /ZzHklqwC
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
index 900c5e6d91ea..66ed247eca26 100644
--- a/doc/board/apple/m1.rst
+++ b/doc/board/apple/m1.rst
@@ -9,6 +9,7 @@ the following SoCs work:
 
  - Apple M1 SoC (t8103)
  - Apple M2 SoC (t8112)
+ - Apple M3 SoC (t8122)
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
2.56.1

