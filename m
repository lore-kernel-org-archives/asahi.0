Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0613624DB
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 15:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972353; cv=none; b=feVWLRfH+sOQPAMHe0qPGyfNKlHK76Yx9sOCtJjIK0YNvNXATkY2aZYLnmnWWn0JqVLU1v7AfEHPu1ZAfeg8LqSudmk1czyh2tyS/lMDqNIDm+fd3u/aHZ6lRLoZczAL06eo7+Ah4VYSXkvCQddk5BL9jGQT/ygQ3h+68co3dbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972353; c=relaxed/simple;
	bh=lW4m4RnXR/rqNsCu9D9OsNfRk839aXE8VkEWAegepkU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EMSGCgu8ZqE6In22/b2V38iXk26Cb1QJG/EMA8h6ArurY6kEvKi9qc/Ms+NSLJ6YzkwVe8QO1X00c94MDM0D6JqRkVxKwQnycJmN9RtK37bY8RHV/0q8rEyZgYx4TAwgU9/19Okx0tQaZ4hlPaLKCxRsJwLLQs1qbrakIXcRodQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=bv8dSm9i; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UmGCGrrF; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="bv8dSm9i";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UmGCGrrF"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 470651400191;
	Fri,  9 Jan 2026 10:25:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Fri, 09 Jan 2026 10:25:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1767972350; x=1768058750; bh=JK
	95k+/eptcrGjwo7pfn+9GJ7UZIOpAN/qF7YVUg7vw=; b=bv8dSm9iq7GxcP27MT
	iJP7JiwIv5wRl17lusH5SH+guFZmiPTxqbOhoqE8VdJfIsn8ZsAF7ffKpOcaKAG7
	6Y7oAQHbWOu3jukD04NGptJNxDwZ9ZRXZtRHr9UUTfNmj6CVbSLxtElJYtdzSx9i
	BijG2sO0+Zdd+PqXXajtvq1PHOi9n+jbt3s8R2p40a8HdACs6lGbe9r2yvz7NGy8
	vG6XysiHq7SWQz/3A1Pf6hV+KYu3bHHY/PvwrDjedAiNkMYon+pELOurt84qx0AJ
	uWgnY9b+EDV+7SxyHdqOxoIrmoszsrtWyo46vHtvEDZEtOe6xDwGVUGZGHMA/Eke
	qrIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1767972350; x=1768058750; bh=JK95k+/eptcrGjwo7pfn+9GJ7UZI
	OpAN/qF7YVUg7vw=; b=UmGCGrrFWFBT38wbERLZPG2a0iYAeZVkilzJ6pB08qax
	2dJpdFLn6WwmQlRADjmmBk5GYdgZnJz20mEmZ4wRTeS1B9urZ6z/hyGIOcuB+qj1
	sWm+DiVMOB0Vxd+W1ZyakOwnPghO4Y1lGhZzXyk6jMJMvtK77iRwIR+PklUoT+Ph
	pVpvXnParcxQjZjWpZLqCzQLMBDZ0eCI/IN54RugE+8kOhGCxSnthZjwriVYlqeF
	EMQ2Q+gVr/SMXVDk0HSIkNhWQPzFCgrgrF+QAGJI6dyOkAaZo5gSQEQs57rMvlZe
	t8a79UJpvNWe6K7pxipdG5Y4DHDlPQsi+PXQ0JeMJw==
X-ME-Sender: <xms:_R1haSpTGdkI06D5xIii5pPZzEFvzRR0yuggEkLHiUKRwvDZpx0sBw>
    <xme:_R1haY01qgmcHqvc83yTwE0KFzFPdJBltSUVOpkR3EPXZ3zOiBIic8GvtL3VTeoWA
    d2c6--eUY_YokblSKr_sHoVdehpIkmHq26_asF0hfnYmZypXyS6dEP4>
X-ME-Received: <xmr:_R1haSw9DDcWNc2pKweHBbaLC7kMj9DmYKS6jmJ7527o3Ge_kGuMI9KNhjdQdCpTssCskzzGVqjdgTMEJ4IPQW8_aBzCI0TWAyiHqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeludeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhephfdtue
    duleejffduvdehkeeutdefhfdtvdeiieegheffleefvedvhfeggeegffefnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsehjrghnnhgruhdrnh
    gvthdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhiheslh
    hishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghr
    nhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehnvggr
    lhesghhomhhprgdruggvvhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:_R1hacgZNF7thfNtG8tQf2JydWf2WbmpciDSRw4llsbk_gKIS6q8zA>
    <xmx:_R1hadrtBhfdO6PzARFSKjyPQ6dBlEvgPPitle7wB1ZI5rELNlhTRw>
    <xmx:_R1habj0gU9CYxx8A1J-zrRYitgipoznzSzU2XcY2pqg84vP9NJXvw>
    <xmx:_R1haXOdnZWdpsx_a4xHybb_is7aCgEnRC6IVc9Jr8u6vLbs-Nq8Eg>
    <xmx:_h1haXLMomtAhwH2L_NDVdlBB9F-lLcUimsIZy-VZDU2UAlBM1OKjWCz>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 10:25:49 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Subject: [PATCH 0/4] arm64: dts: apple: Add chassis-type properties
Date: Fri, 09 Jan 2026 16:25:42 +0100
Message-Id: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPYdYWkC/x2MQQqAMAzAviI9W1g3FPUr4mFopwXRsYoo4t8dH
 kNIHlBOwgpd8UDiU1T2LQOVBYyL32ZGmTKDNbY2ZFr0Ma6M04FZq4ricUfG4KiyzlOoG4LcxsR
 Brv/bD+/7ATHZd4FnAAAA
X-Change-ID: 20260109-apple-dt-chassis-type-f31523a1f681
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1913; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=lW4m4RnXR/rqNsCu9D9OsNfRk839aXE8VkEWAegepkU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxE2d++30UKrjoJ5Quem+Cwa6bCPPP1jq5yFXcXts30O
 BC+qe1IRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIlsvM/I8D7FfCOX45PrDQtP
 vftotcDwIHfDycLm6ptNE2Y2ZtVJsjAyHPu7R/DmsfRfd8TfHT597M+LO01TS2bP2nZefke7Ak/
 3Sk4A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Add chassis-type properties for all Apple silicon Macs. "chassis-type"
is used by u-boot to fill the SMBIOS "System Enclosure or Chassis Type"
field. User space software uses this field to to determine if a device
is an laptop. The exact use case eludes me unfortunately.

The Mac Pro uses "server" as chassis-type which is not entirely
accurate. The tower and rack mount Mac Pro versions share the same .dts
file and are identical except for the enclosure. I haven't found an
obvious property in Apple's device tree to distinguish between those so
both use "server" instead of the more accurate "tower" and "rack mount
chassis". The latter chassis-types are not in dt-schema anyway.

Signed-off-by: Janne Grunau <j@jannau.net>
---
Janne Grunau (4):
      arm64: dts: apple: Add chassis-type property for all Macbooks
      arm64: dts: apple: Add chassis-type property for Apple desktop devices
      arm64: dts: apple: Add chassis-type property for Mac Pro
      arm64: dts: apple: Add chassis-type property for Apple iMacs

 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t600x-j375.dtsi      | 2 ++
 arch/arm64/boot/dts/apple/t6022-j180d.dts      | 2 ++
 arch/arm64/boot/dts/apple/t8103-j274.dts       | 1 +
 arch/arm64/boot/dts/apple/t8103-j293.dts       | 1 +
 arch/arm64/boot/dts/apple/t8103-j313.dts       | 1 +
 arch/arm64/boot/dts/apple/t8103-j456.dts       | 1 +
 arch/arm64/boot/dts/apple/t8103-j457.dts       | 1 +
 arch/arm64/boot/dts/apple/t8112-j413.dts       | 1 +
 arch/arm64/boot/dts/apple/t8112-j415.dts       | 1 +
 arch/arm64/boot/dts/apple/t8112-j473.dts       | 1 +
 arch/arm64/boot/dts/apple/t8112-j493.dts       | 1 +
 12 files changed, 15 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260109-apple-dt-chassis-type-f31523a1f681

Best regards,
-- 
Janne Grunau <j@jannau.net>

