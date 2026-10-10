Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74933546F0
	for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 12:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791634455; cv=none; b=mVoUTX5G6VN2T+hkIZBUc5QmEXqrz5zElpuunFI1wUWKXp6Ol4WBblY/TDlEisT27GBmURoK3kIf0idLbJRV07UIkwiewTKcId7JVXR8Zf6/gLsyWfuyZaR3UYbiNFI1fApMrO7FQqcFQf8jU/CSjCHXTk/skrIv/t19f9ScnCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791634455; c=relaxed/simple;
	bh=9uoNm3loMti+a1kl9gOqZSP8Y1r91wz7x2gxRJI8IXA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sejs4Nm39tP5iyS0gwwpL8l4+WPTL1AVttDka/elWKMeaK3nHmSFIPQ4IPAJJNnMeWUkkYZateaSnoTqjVT9dR8VEOSK87OSXqnfxA0sP4IRfhIngUYD72EY0i/6yKZm7iWW6mfh6gLsSljYukOi4o9vd6l907ezqgG4NSg5j3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=QIfzrkoe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=q4AYigQI; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="QIfzrkoe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="q4AYigQI"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.stl.internal (Postfix) with ESMTP id E30431D0008E
	for <asahi@lists.linux.dev>; Sat, 10 Oct 2026 08:14:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 10 Oct 2026 08:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1791634451; x=1791720851; bh=na
	/BOmLKDniLwyc8Q8jmYwNKwSfft9HwW6LZwntSZ60=; b=QIfzrkoeM7VILVFsyR
	fY8JFRBPgYEAaIrA7ntK8Zg/QHZqFxjMOrEmh5MQIOiDh1UrxXwV58YW5qSquHDF
	SsPDw8X+7WdPt1ez3fHY3JdMZUq3k0uvifjRHOVcD7AjQwJNjICkEL8PsRl5Xja9
	IA8lhHefZMWK0DuCWBS527gXGlkf4XdzuynnXSVufr/V0sN0VIXRHFBIffSQlnCD
	UKUEh0stJfJsP2GbxLeYuC0mm1gW3ghq98I92khHAufoOpKriDxVSXp4A1mhRiFG
	F08VZjI66Ec6w0QnNb2MmY4Ko5vFTz2wyxQQx4Xg4p57PAZPE84Xcaq+2K/W5z+1
	4KFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1791634451; x=1791720851; bh=na/BOmLKDniLwyc8Q8jmYwNKwSff
	t9HwW6LZwntSZ60=; b=q4AYigQIyyTggFdlzrTEwQTMP1wYxneqsMK1Wg/biaXd
	8ycqvNtiWxUDDPQ74mPuOyc0xcrtroKgqh2mEccajxG/Ascbfb8OAqNMrawfbOsb
	Xlp+XQkJbb/fxd0W6AoUXdSGDHGwuYZGxCr6Fkd75B/Gjc6m+I0ZVTgdtFZz81O/
	6PWmBfZA0fKHx9AsOHTpmxIqN4573EiofhgNwvIZ1JhK++x+nfViUG2DA3ICTCdc
	KXUVRObRSgpm4ljBbDT2zLeOL5PcWyPUMwiSxaDlyZ0NzDjFnN2z1aRnd2ZWX0E/
	kyZfirtp+FfW5LlZO4dJwUErQIgidU5XqcYa41sLSA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791634451; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PGFzYWhpQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm3:rsa-sha256:T1VRqrl4bXH31yDLLlRfXxTuVuzJCLUPruifG1g6NAKSGnt
	gOWeeUJXiL3nrM8Npn7HlqtTke7Oo3YXGk373Rwa9wI8eNJk23udCjp7cozAOHio
	mLy2KpqjwS0fabRZjj0aE2CNv6ktaVMtKgOpeIE47pRz6qopXZTYxfVp8b/6h80U
	2eUUGDGt67fHbEBuIoWu1xNa4LhZHupWT1LnKomxytIGE2/y7avRyNKuUEHZCAOS
	Ldd+DsRS9rdUxAl9M9sKql7LKOjPs9MLDSDjF7gDKIupiiAjPRg7D2uEpu20WZ2a
	d3QkAN+9upDMKnXi39X8v5hPlTWLmgnWpUwCALg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:14RfFmW7QchgVoNqEA1i5FIA/oKLPd3AnV629dFr6lc=:9uoNm3loMti+a1kl9gOqZSP8Y1r91wz7x2gxRJI8IXA=;
X-ME-Sender: <xms:EyzKahOFuf2vqtH-oK99IeQIviMIWCyPM7BlpV-vIRvIal3hkvm88w>
    <xme:EyzKat_Y-VFrQwLUXwanQY2zMdYC0IStO8W873XzN-bD1ahujGS1hgQluV8O9CcCC
    D3mtXgpF3pmFIPm3eqGVzh-LdvgR7ddV08vOah8qqv2gnD7DggkkHM7>
X-ME-Received: <xmr:EyzKam4_DNhSUle9QzWfV9as0NKycafBSWPjhDoP-uzwwZR0V8wCY99xXQLPaeCt7lsruITb6XXx2oFy2Tw1H3RtS_4Q6nv-IRsRHg>
X-ME-Proxy-Cause: dmFkZTGOlfd9lxVbZAbksuK2c3UdHBuGHviZPozcrkd7LYgtcn/b2BciY8cQiL/N+8ygvS
    M57BxIQ5TLDJcfOGkiJCDKQGyKps5QcATwThgBWYdbHGrne9gVnHVZSZWsX7C9w5XojJFP
    cJYRibGt65K8YAJpAyjGW5Czz7r59O0e7YK4VNbIcXolmHUorgFyZ6wTU7lPDn/pa5ReWL
    bdNE0XzHukPP05YkRuuB/yplItnAiNZGrrgREZpqMkIYqIKszNv1Z1oup4jxEEGIEpsGmw
    h3mIu1u7+uA0psXqfSsQwubOHxi61mKef5oqizd3qJF23CteO5Br1NOT/n3H70ZnsTr7PL
    vDK/p4XSXyrlP4ni0AucgigCAgkQ8ct0GfPx2eP6QT7QRaG76bYmTxsB3YVO+ywqZMIe/a
    M9ADEJGArnxIinsfEBBzbbbvSXX5J0myYzKKFWiqGC0MqGTMhPSenz5GxPQSC/Wti6cwmV
    RDua6tyTs/hpdwWlaNiSaPqADX+y6ukMGLJ5EGy9AetTKJswWr0RCbVe//LEej8vdoy8gR
    GJsUGGkHz3PsMSHqouAvuh6pU3Xe9PQRbIpTsRM5xiBLACryusUliJVLQV7R52ph8/5Byf
    vN2EYW+/PMfgnvsXMPBJW4AYsAwZpz69MhAdBfIQnD5DT/Rxj44ze6zuFAGQ
X-ME-Proxy: <xmx:EyzKar7TU7zDGT4Wt3F0VIkO0XntAZynvVsAfmKwwmcVRD_441Bk-w>
    <xmx:EyzKanos2fm7N6Z3DnNE2h4ejj3zGzWKj-Sstjxoh7BW9aTSw0RySQ>
    <xmx:EyzKakNsmX7NUpw1lC9behILJlbrozseno18iAdA9FR_1fJy97ayMA>
    <xmx:EyzKan0feS3XLCC-jFj8oIoEj-4eWKT8XLgycwN1kfrLyBa6D8Eu9Q>
    <xmx:EyzKam_VKMUG-orFlurEv82l3dwrovfDMYkA34TDuvzB1wjTsMlO6Xzg>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 10 Oct 2026 08:14:10 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/3] Apple M3 Pro, Max and Ultra support
Date: Sat, 10 Oct 2026 14:13:56 +0200
Message-Id: <20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MwQpAQBCA4VfRnE0NYvEqclgMpsS0u6Tk3W2O3
 +H/H/DshD20yQOOL/Fy7BFZmsC42n1hlCkacsorasigVd0YQ0XFjf5UPVzAho0ZLA1zXZYQS3U
 8y/1fu/59Pwd1Kk5lAAAA
X-Change-ID: 20260907-apple-t603x-support-9e77ba0bf855
To: u-boot@lists.u-boot-project.org
Cc: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Simon Glass <sjg@chromium.org>, asahi@lists.linux.dev, 
 Anshul Dalal <anshuld@ti.com>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1150; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=9uoNm3loMti+a1kl9gOqZSP8Y1r91wz7x2gxRJI8IXA=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqxTOgLeVxIY1FMvnj3Wa10yO+1iuIjy9h05cQrlqd5ev
 oZbPE52lLIwiHExyIopsiRpv+xgWF2jGFP7IAxmDisTyBAGLk4BmIj6fUaGNplZb/20Px/Pi397
 0jz4vkGX+8nZ834HshRUKc8t3mHVzcgwxfNvg8p05QWPbplafhJ+Ntl1hoCQj7+U88obXHcmnb7
 OCQA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Hej,

this series adds memory maps of M3 Pro (T6030), M3 Max (T6032 and T6034)
and M3 Ultra (T6032) to arch/arm/mach-apple/board.c and lists the SoCs
as supported. It contains a missed documentation update for M3 (T8122).

The memory maps for the SoCs are becoming long (alomst 1000 lines) and
Apple releases multiple new SoCs each year. I'd propose to move the
arrays to headers (one per generation, i.e. "mem_map_m1.h", ...) meant
to included only from mach-apple/board.c.
I Can do that either as v2 of this patchset or when starting with the
M4 generation.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Janne Grunau (3):
      doc: apple: Add Apple M3 as supported SoC
      arm: apple: Add Apple M3 Pro and Max (t603[014]) support
      arm: apple: Add Apple M3 Ultra (t6032) support

 arch/arm/mach-apple/board.c | 224 ++++++++++++++++++++++++++++++++++++++++++++
 doc/board/apple/m1.rst      |  14 ++-
 2 files changed, 236 insertions(+), 2 deletions(-)
---
base-commit: 5508406582f6f7120dce0c4b3059819a41788db2
change-id: 20260907-apple-t603x-support-9e77ba0bf855

Best regards,
-- 
Janne Grunau <j@jannau.net>

