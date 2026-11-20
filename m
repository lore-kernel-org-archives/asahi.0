Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200798;
	b=qT7lBhk2rpSykzKW5qAkEeSTqsAx/hymb3xxCddMRm7HR81041tkoMasI/b8Gc/yAEyM
	 4swxaaaHCj5vU7wAcnp6Sqhw54evM3hPbfRofdBaRNr6JzrRuEH9egk6+FYfT+9ojga4q
	 RsIdxEfjalIMkyTdsnSKfCLxBqfpF+dk4tl1ZS/7zUvEHw0NwZiCkOIqX991FA4YR8MLP
	 Ug0JS0txKi12vLHmtG4sDsOYkYnyhu3j8iqeGI2FRNmorcHHJOP7LcYp5OvxvzLu/XUDV
	 Ll3uELIXcoM6HzQzWPpyYFopiw5FpJDl208KPyF0lGc5FRJEYk6F3Gt5pv1gYsrrlGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200798;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=c7MXYX/mxHUkF+A7fd8aVYUOSgbVR1PbA4CeC64Ua6A=;
	b=R25u6Gfr1ielLANnSuEGdXHda6qUFopJpS9GqQJZir/c+Kdqs/yGHqTNvjLONVFA3xyE
	 kMAGCnsN/RKf05D7cnOLAn++G9oPKJITul8S2USPAyvwvoI72IE51LrJHcxgSwg7i5o/d
	 kQzMsgrM3VX7smFARh2HjCNeKChvUpGpyC/pX3mrtfuc0iUsWUfVThZATLH5B47rfbWVi
	 51NuGnlW67/Y//adXBjh1pUJKPeiKa9Bmi0PSDpxAhbXefsMHRCquC0j+uJztI3Kymm3h
	 3Rb5XTE4ujDHXD2AdM2Zru6+v7aB0qKerJjtjfSzKqPdNX0RYB2vCm/Puc0cmjEgFVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=cBcYFL8Q;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=vtVGPYQR;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980DE60A2608
	for <asahi@lists.linux.dev>; Fri, 20 Nov 2026 18:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 980DE60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm2 header.b=cBcYFL8Q;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=vtVGPYQR
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 777247A04B9
	for <asahi@lists.linux.dev>; Fri, 20 Nov 2026 13:53:15 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Fri, 20 Nov 2026 13:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1795200794; x=1795287194; bh=c7
	MXYX/mxHUkF+A7fd8aVYUOSgbVR1PbA4CeC64Ua6A=; b=cBcYFL8QUpc55cqXpQ
	QEM+UOHdu8qx+/svCFTRhvUITTeWc/QmtdJkQOukPOUFFeBHafhyEH9eiyz1O2oo
	FaYqcbEUZu6awxhCd1rkHIcykg7J8WP85r7c5SRpjbAGfauBNh5dpEIPnemDpj46
	wlk7K/dU4KX7vt6j+ATEjkJuz76u1HvMrW8ObZeL96Kdd/2Q58pnDpy+bL6iGgLZ
	Cx6fBNGt9MAjG8vApNzwd5m6YM8vedyAsUE6/qJoG+KUzRFPqucHu9JYRlgR6REb
	VMqhCZH3hHdTjb3ITbwOTELqy1eu9EBX8Epf1ytrsrknMaVaO0CwT4RVCUL1FzN1
	MWTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1795200794; x=1795287194; bh=c7MXYX/mxHUkF+A7fd8aVYUOSgbV
	R1PbA4CeC64Ua6A=; b=vtVGPYQRN7EfbkJy93gWgHOwvO4TL7LpLpdAoUM9RItY
	sxaFHhMd5UX4kbUdwGuz6+KgOFPHWh4Rx3n9SJHo+dhrT8x6vuDvN4z6Bzf+515u
	ZoU1QjQSZndXsBN6zf4HX27cszyUd7uP1MXk4bboWubaFCz11cy6ecN/hnmAlpqX
	/tnhWozb4QVU2vNX+ZkDpagEhuxzBbpTsDq497J0OghmCYx8heM69+HZXwRgIc8k
	0kWHIdmuMEF6J2gZaiGeAJSApGbJqTz630HpHNmDy6GZURX1ywfYRTLwn82ndwHN
	gmJ4p0h61O8+tNR9RgWJqM0eNQK1s6zTPZlhnVHklw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795200794; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PGFzYWhpQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm2:rsa-sha256:KK9VQLIg/NpZlp6I5lSJQe4KrvYcCyWFBubGGUEzRe9gXK6
	jnxa/b7MjMeonGC1rqM4vmDkIDKq3JKpFSnQmtWaW2WtAwbnhf7hiFGxq+Mxf4qI
	rQFhwd9vtCW/+v9QyAKT0fDy1GNKQqs1WYaa/d1hHtWjATd59KRYCB2YSX7XsxSx
	rArJtaDMBxaPmcvyTsTWejhq1kRokX2DYDvNfiPrtUYyDAKkBX3RGLz7aFnH4/6b
	Ygnqdvm06O+oN/G5GYKsIWq2RXWzPhJK/vXi+2g63+bCSLi2KvJFR3fIe5iJ4cN9
	iQoy2LsRKpcrKVKuKY9OGAj+VIUiREYWzYWMx3w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:vXnOE7QOWqU3HxEFpJOaIuYxC7Udu8bxy0fY1zqrvMk=:SrAOnf3zUcAqYzQX8p9kk2386PDOUyZAe0G6ddvwA+s=;
X-ME-Sender: <xms:GpcAa0f0pqWSiYMuOHOUlCGjoHXgyjOYTp7MaluhiHia-KrLsrlesQ>
    <xme:GpcAawPq6r9071B36PJhDmYnPGrn75wpl0nau1McNYt8GMPCaWcyKDAHxgREnSRJW
    HYvUillwJ7xqpTEWA5ONwa5S7iGpskIV4XBRDP_aUUKjan8X_0MlA>
X-ME-Received: <xmr:GpcAa8LjRkJJJ_SP5MeZLU2tDn2LjTAotOsSJrar7lOO_vsp_y3mc-7qesxfGGKEWqRzgTetYqNhxOVvAZw1xZFj4J9TGf89MabX8g>
X-ME-Proxy-Cause: dmFkZTGrfKs4933TELuKPEEcn3ugko7dey0uQIaIu56XUXRsjlxi6QHfZzr5kMj2pol8ku
    ccxfyfbXgmURc0X9XDzsifrY9bnx6vrm9o0xMXiWK4LqvkJNFnCsaPuEW3ePg0se+3Nyn8
    cYD0Lk/s0rmFN+n4du/fb68TazZZamFUqVyMaN1jvvDUwj/CcHeNDdavBLpCSqDERODA5n
    DGKTtdPGbG3bMtUSuFDx7diC5PEpc+TlrzXNNExaqH/oYdL5sOQPV4Xcy8hPBZmgFllFrA
    49JfZuKwjCVDni91yJmKk//txAv0JqO3esXQyidePCiVR5f0SORdqgpftrQ56gjYy/Rujb
    /BcyLv7jMj4L92mOkVVml0yKqJV42Ywg8TUs9YrscGTafcT5DKCfvTpWZg8IJgFgqEYEkU
    38JR9rhKzXZfByzY2nUJeCJkOjM5bZR+31o4Ij+Yn2YwRN+Qqz9RWPhaUoT76IAsKgalE6
    kAqY9hBq8mhQKPpMDKwJfVBSI2c0B/QTxUcpnB2XZe+eMA48iy+GsYQeY7ByM8KdAlvY7u
    h+FEEdSFM3bK6BHfFKuuVC9/mRtJ3GevodIL7wv63+aXhMGRLGa4Kfo4zsJMiNew4kKH6H
    w4O6OXnxKjvOvatX1iO73btNthTe2fdvI3zjurTa3OVn1uAK1gQ6ZIliFA5w
X-ME-Proxy: <xmx:GpcAa4JDX_y0MNhJAwqi6dSLr2w0J1hYOouJK2m4H0a0LCAfF7e0Fw>
    <xmx:GpcAa-7a0YVcJWevcI180ohi2RusFxt3qX5WU7AudfjNqWLX4ag_vg>
    <xmx:GpcAa6frJ-8uiPPhTlmLnBbfef6sx6hrlPW7rE-bc3sHAu1avV09Aw>
    <xmx:GpcAaxE1yUiuGBGlzMchWieuxh8aR3iQXV8wlFEeKeOuMIi83u6Jww>
    <xmx:GpcAa4untwZjSpcQqhzSgsTZ1JBhnwzZqGZHVWvN-81yDozn5der9Krk>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 Nov 2026 13:53:13 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH v2 0/4] Apple M3 Pro, Max and Ultra support
Date: Fri, 20 Nov 2026 19:53:06 +0100
Message-Id: <20261120-apple-t603x-support-v2-0-606b4f5fadc5@jannau.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/23NQQ6CMBBA0as0s2bMtAQQVt7DsBhwkBpTmrYQD
 Ondjazd/sX7B0QJViJ06oAgm412cdApUygYZ3ZPQfuAToEhU1NLDbL3b8FUU7ljXL1fQsJWmmZ
 gGqZrVUGhwAeZ7H6q975QMNuYlvA5J5v+1dPTpOmvt2kkHLky7VSS5trcXuwcrxcnCfqc8xela
 lImtwAAAA==
X-Change-ID: 20260907-apple-t603x-support-9e77ba0bf855
To: u-boot@lists.u-boot-project.org
Cc: Mark Kettenis <kettenis@openbsd.org>, Tom Rini <trini@konsulko.com>, 
 Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
 Simon Glass <sjg@chromium.org>, asahi@lists.linux.dev, 
 Anshul Dalal <anshuld@ti.com>, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=SrAOnf3zUcAqYzQX8p9kk2386PDOUyZAe0G6ddvwA+s=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhmyG6eJzvWxXZpzPvzzpvfSFFsVcUeuIo1b3vfUvnHa7w
 vNHTPZPRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIl82MXw3yl/fm/U5v9v9j+d
 8Z4lSGfisqP7V5Y65IS1qZiHLtqwqJqR4V+Q8BrfNs+SM28eqq8JDl4r6/Kee5HK05vqkRX3p6x
 g4wEA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Hej,

this series adds memory maps of M3 Pro (T6030), M3 Max (T6032 and T6034)
and M3 Ultra (T6032) and lists the SoCs as supported. As proposed in v1
and supported by Mark move the memory maps to their own file

Add the missing documentation of M3 (T8122) support.

based on v2026.10 but applies without conflicts on next.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Changes in v2:
- fixed t8112 vs. t8122 typo in documentation
- moved mem maps to separate header files in arch/arm/mach-apple/memmap
- added Mark's Acked-by
- Link to v1: https://patch.msgid.link/20261010-apple-t603x-support-v1-0-ca529f301a62@jannau.net

---
Janne Grunau (4):
      doc: apple: Add Apple M3 as supported SoC
      arm: apple: Move memory maps to separate files
      arm: apple: Add Apple M3 Pro and Max (t603[014]) support
      arm: apple: Add Apple M3 Ultra (t6032) support

 arch/arm/mach-apple/board.c        | 747 +------------------------------------
 arch/arm/mach-apple/memmap/t6000.h | 104 ++++++
 arch/arm/mach-apple/memmap/t6002.h | 177 +++++++++
 arch/arm/mach-apple/memmap/t6020.h | 128 +++++++
 arch/arm/mach-apple/memmap/t6022.h | 225 +++++++++++
 arch/arm/mach-apple/memmap/t6030.h | 104 ++++++
 arch/arm/mach-apple/memmap/t6032.h | 136 +++++++
 arch/arm/mach-apple/memmap/t8103.h |  80 ++++
 arch/arm/mach-apple/memmap/t8122.h |  88 +++++
 doc/board/apple/m1.rst             |  14 +-
 10 files changed, 1068 insertions(+), 735 deletions(-)
---
base-commit: 5508406582f6f7120dce0c4b3059819a41788db2
change-id: 20260907-apple-t603x-support-9e77ba0bf855

Best regards,
-- 
Janne Grunau <j@jannau.net>

