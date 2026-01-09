Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B04132A3C3
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 14:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767967641; cv=none; b=SScrROPY8BYv9cG7Oc/xmltt8N6/jy2sg6zr3VIThu/j+F+HxaTx0stHWih8AfHSUCMl5x+6QNYf6sqgFykgMJbCQ/5x+iUeSqLfB/YwsHA9XWkYdnsjhpiQcdzUm2rnW4dwHzFsc4v7Nvg1g5XBHh89j3LMEbFnJ6lzw2Kv79o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767967641; c=relaxed/simple;
	bh=OMKLMbVRFt4Qr8GTkL/6hNcNJ4qbjFUx6QvQPri0SOw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hLrLtnC2WNRqiaPwHNvfygpgNr2G3nDDvlIlLxcpCoAG+TV4dmRYC85lLhaxAyiYleC+aM4ZV/8N1XS8BOkSZUfrXycKE16VTo+1xFk29ddhvcBenflze/KQLCIpOm0y8GTBEISAJJ4yH5H9LqvjXEwuU6iH3VBODjC9Sz4Gm10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=FKlcFBEV; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iL+Wa9hn; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="FKlcFBEV";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iL+Wa9hn"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BBEAE1400176;
	Fri,  9 Jan 2026 09:07:17 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 09 Jan 2026 09:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1767967637; x=1768054037; bh=rX
	Vxx5A/4h4wpz0kXc+LaziK8rqYPZYtn6Vj93QmMpE=; b=FKlcFBEVO3g5AGgLna
	lORhWXg2EvuP3GFUqe192ro61SRUJuR/EzEouTfcC0UsYgQgpvQHCMJKnrERYSUg
	oTwmzCKVRKOm7j3UIQDg+KNRjnwzCTcg6evilAJN3CKW/ZElkL338lKFeOwWfwV5
	fm2G0pFvPjf21csRTqf2xFpDW4jk29PMPgLwKcwl5iSlUSg/FQbJTxP5DJosRcyk
	zbtO98JrgdKZkuq5DU5EfSA/PSAklJSz+SAPxDmL/QzUwxDyxGsHRslrZHa8wRJK
	TxXyEp6Yzdka2ZwjaVOXIxYaobIuK5IS17j+YAnPaa6XVYsz8ZgzSzniu8hu2b+1
	VfWA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767967637; x=1768054037; bh=rXVxx5A/4h4wpz0kXc+LaziK8rqY
	PZYtn6Vj93QmMpE=; b=iL+Wa9hnjAPR70isaT3o3Q66r8o7jWAB87Si9ShCZGQq
	TLpxloQPFOaoGsfS/d6tWuQr0egB+JmoiCFo9h86fssIcOMQ6GlrNkLfvE4gGgaU
	s77jJ8hnSwa7PM/plc016LCAHBBR+nv5+8TrTaUilipqFRB1fy8jTYsqjFNix3WI
	O3DgIn5TwmcdYr3UJxT8TB1elkyEF8aeFQ5Vj0amejydKsR/13BZshsDRQiKoxHi
	6tkL+zS690Qckjw+IzTxGJyFr/osr2M90v0yOcUHNj5MFVYbMMapORycJCj5ZsnW
	s9+KxxOzq+MpPjf0v1I5gSJtHxbCIW057m9Xot6x2g==
X-ME-Sender: <xms:lAthabOdGP40bF7rwSxY5gFp7uTeQ_kfaRD7A8Ah6B3kEZR1vaMA9Q>
    <xme:lAthacV1mDt7SG7Hj8zYYCGuVIRzlEbCKOwGk4lBWjTZ9RxU92DUYeWq1VTf2CF-E
    a8oThJ71oSF7kM2uowclYyEr8kv2WEh_AZnt8fIM8izbXYb-3oybBI>
X-ME-Received: <xmr:lAthaWhERT7SQji7RUneNkS0I2ZfaEuKgNS6BL3R4BXbJ3PoGaTTYjwTUSiZx_lEfqkaNdKkZa-Nqk9Fd8jZ1hqASAT2h0wHvgu6Jg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeltddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepueelgf
    fhfedvgeelfeduuefhfefhjeeihfffueefjeeihffhheeuteeuvdeuhffhnecuffhomhgr
    ihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgvthdpnhgspghrtghpthhtohepuddv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnh
    gvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsvhgvnhes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshhtpd
    hrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggv
    vhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinh
    hugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgv
    rghlsehgohhmphgrrdguvghvpdhrtghpthhtoheprhhqohhusegsvghrkhgvlhgvhidrvg
    guuhdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvth
X-ME-Proxy: <xmx:lAthadgvQWT8y6EtIDn4nmGiIqljj0j8DSbuv5Fu3pawXzA7tgWjwg>
    <xmx:lAthacF5x0Rf2S9Slmj1zpuLVKSfyUEx7wAy6D6GyEzMKlDbEVzH7g>
    <xmx:lAthaSCJ6ClhzUKeUKQrJXGSJoC5XANp1J5BY4I5aKd3dB-s3Ct4Kw>
    <xmx:lAthaaAFo2YLnQCv5Y9VAwqRpS-SQrNHj6aV2Htz00k6MUYAXMVUwA>
    <xmx:lQthaT_RvKslz3msfhGrpjnvcn6iur34xmaUUOcxUlESOBo8PtPThAs8>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 09:07:16 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/3] arm64: dts: apple: Add integrated USB Type-C ports
Date: Fri, 09 Jan 2026 15:07:03 +0100
Message-Id: <20260109-apple-dt-usb-c-atc-dwc3-v1-0-ce0e92c1a016@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIcLYWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQwNL3cSCgpxU3ZQS3dLiJN1k3cSSZN2U8mRj3WSTNHMLU+NkC9NUIyW
 g7oKi1LTMCrDJ0bG1tQBpLyAQaQAAAA==
X-Change-ID: 20260109-apple-dt-usb-c-atc-dwc3-c4f7853c85e2
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>, Hector Martin <marcan@marcan.st>, 
 R <rqou@berkeley.edu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4381; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=OMKLMbVRFt4Qr8GTkL/6hNcNJ4qbjFUx6QvQPri0SOw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxE7knJwXeWqzN/WPNy5ukn3rbp4V1GAlnpxhU1Vc+Kj
 E4cfinZUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCLLdjP895ax/lXzimPJVtPL
 NSX1U1li2kp3H0t37s/TyBeMtT1VyvCLWf503pGZx+1DJhy+cbtzxurVt04sWXja8tLv1zXfbBV
 6OAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Now that all dependencies for USB 2.0 and 3.x support are either merged
(tipd changes in v6.18, dwc3-apple in v6.19-rc1) or in linux-next (Apple
Type-C PHY) prepare device tree changes to expose the ports.

Each port on Apple silicon devices is driven by a separate collection of
hardware blocks. For USB 2.0 and 3.x the collection consists of:
- Apple Type-C PHY, combo PHY for USB 2.0, USB 3.x, USB4/Thunderbolt and
  DisplayPort
- Synopsys Designware dwc3 USB controller
- two DART iommu instances for dwc3
- CD321x USB PD controller (similar to Ti's TPS6598x series)

The CD321x nodes are already present so this series add the remaining
devices nodes, typec connector nodes and connections between all
components.

The devices expose except for a few exceptions noted below all ports. M1
and M2 have two ports, M1 and M2 Pro and Max have four ports and
M1 and M2 Ultra have eight ports.
The Pro and Max based Macbook Pros use only three ports. The fourth port
is used as DisplayPort PHY to drive a HDMI output via an integrated
DP to HDMI converter.
The Ultra based Mac studio devices only use six ports. The third and
fourth port on the second die is completely fused off.

The changes for t600x and t602x are in a single commit since the devices
share .dtsi files across SoC generations due to their similarity.

Depends on commit c1538b87caef ("dt-bindings: phy: Add Apple Type-C
PHY") in linux-phy's [1] next branch for `make dtbs_check` to pass.
checkpatch warns about the undocumented DT compatible strings
"apple,t8112-atcphy", "apple,t6000-atcphy" and "apple,t6020-atcphy" but
not about "apple,t8103-atcphy". I don't under why it doesn't warn about
the last. "apple,t8103-atcphy" is only found in the added devicetree
files and nowhere else in v6.19-rc1.

Tested on top of next-20260106 on M1, M2, M1 Max and M2 Pro Mac mini /
Mac studio and a few fixes for dwc3-apple and atc [2, 3, 4, 5].

Link: https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git/ [1]
Link: https://lore.kernel.org/asahi/20260104-atcphy-tunable-fix-v2-1-84e5c2a57aaa@kernel.org/ [2]
Link: https://lore.kernel.org/asahi/20260108-atcphy-coldboot-fix-v1-1-01c41c6e84f2@kernel.org/ [3]
Link: https://lore.kernel.org/asahi/20260108-dwc3-apple-usb2phy-fix-v1-1-5dd7bc642040@kernel.org/ [4]
Link: https://lore.kernel.org/asahi/20260109-apple-dwc3-role-switch-v1-1-11623b0f6222@jannau.net/ [5]
Signed-off-by: Janne Grunau <j@jannau.net>
---
Hector Martin (2):
      arm64: dts: apple: t8103: Add nodes for integrated USB Type-C ports
      arm64: dts: apple: t8112: Add nodes for integrated USB Type-C ports

Janne Grunau (1):
      arm64: dts: apple: t60xx: Add nodes for integrated USB Type-C ports

 arch/arm64/boot/dts/apple/t6001.dtsi           |   1 +
 arch/arm64/boot/dts/apple/t6002-j375d.dts      | 150 +++++++++
 arch/arm64/boot/dts/apple/t6002.dtsi           |   1 +
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi      | 212 +++++++++++++
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 234 ++++++++++++++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 270 ++++++++++++++++
 arch/arm64/boot/dts/apple/t6022-j180d.dts      | 415 +++++++++++++++++++++++++
 arch/arm64/boot/dts/apple/t6022-j475d.dts      |  31 ++
 arch/arm64/boot/dts/apple/t6022-jxxxd.dtsi     | 133 ++++++++
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi      | 212 +++++++++++++
 arch/arm64/boot/dts/apple/t8103-j274.dts       |  12 +
 arch/arm64/boot/dts/apple/t8103-j293.dts       |  12 +
 arch/arm64/boot/dts/apple/t8103-j313.dts       |  12 +
 arch/arm64/boot/dts/apple/t8103-j456.dts       |  12 +
 arch/arm64/boot/dts/apple/t8103-j457.dts       |  12 +
 arch/arm64/boot/dts/apple/t8103-jxxx.dtsi      | 134 ++++++++
 arch/arm64/boot/dts/apple/t8103.dtsi           | 105 +++++++
 arch/arm64/boot/dts/apple/t8112-j413.dts       |  12 +
 arch/arm64/boot/dts/apple/t8112-j415.dts       |  12 +
 arch/arm64/boot/dts/apple/t8112-j473.dts       |  12 +
 arch/arm64/boot/dts/apple/t8112-j493.dts       |  12 +
 arch/arm64/boot/dts/apple/t8112-jxxx.dtsi      | 134 ++++++++
 arch/arm64/boot/dts/apple/t8112.dtsi           | 105 +++++++
 23 files changed, 2245 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260109-apple-dt-usb-c-atc-dwc3-c4f7853c85e2

Best regards,
-- 
Janne Grunau <j@jannau.net>

