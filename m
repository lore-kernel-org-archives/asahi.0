Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B0E3328FB
	for <asahi@lists.linux.dev>; Thu,  8 Jan 2026 21:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767906292; cv=none; b=eMCT4yplLm1pK9Xu5JB54LJb3ZOUL8VaClvpp+rxYS/FqgBu4kWJadTx4jlVr/MbTcBX8yI1HL3I31OJ3on8m7QHfuKBqKVvx+I6wHK9Qtdh6Yz6AIunv1H0j1WUuQdbjvMg7jUIsmzGDGXiU7egefZWbCvHy8kVEZ9tsAuWmi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767906292; c=relaxed/simple;
	bh=11AMcjryIBqasark3A35Cj68+orOKw83gXx0NA7gkZM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jUa+dXg4jJ6ZACgoPWyDkv71AypJAak0dZo4PEn9f353oTtxbQFEcSlXP83HCyiKEhe43I9TV7BpQYbq2dw40G82PDGUa2nFPexlnxRvcCSZGOn8GDAtwOXo3bmIegejW8aFK1EUGJ7TAr5xMQR2T96YJhjC89B3zcBiLA7z1TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=KIb0ydk3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mYOPz8KQ; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="KIb0ydk3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mYOPz8KQ"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B0D047A0083;
	Thu,  8 Jan 2026 16:04:43 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 08 Jan 2026 16:04:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767906283;
	 x=1767992683; bh=4JrUdCLCllaRPN3JYqb8eFCos4vhC/0NreYSyVI4EHI=; b=
	KIb0ydk3+5xc7DVnM/N+hI5Y/mKch2bI5ld0BYWSO9/6jTSf/7w/ZkX5HunbkjXL
	eMXZ2LWGdxhpLcmFmNRE7yIrZ14PwuMPDqwZy/LhHlXRmGQ8Hy+L8iWS67XQZDO4
	czH6XN2pxVgIx7TkLGp3jOf5605wCgqvM+eThI9dnGegfks3jZdn9bB3PEZOpVGv
	4MoZ7F8rZjKW2RyQYgjKV4uMQpwFN6lGI0amWY2uR4Fx3t+2hJ5Tok90zBnj9NM0
	bm9j2wL9TWCmxkW5xPCgSsmMGmKCZzfqUwyNofNH0Hb34UPuNuvQQvTpWMi1gnfF
	k/1fl3rclAkmQVT5+Gf8aA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767906283; x=
	1767992683; bh=4JrUdCLCllaRPN3JYqb8eFCos4vhC/0NreYSyVI4EHI=; b=m
	YOPz8KQYKVXfJ9ohQHzICnYaDB0q/1n5l4kOWFqEw3s5Nb11C3QH9F7yUeiXlpvY
	Mz9s/wpxVuoVsMaKXsid6NSK4qnT/k8kOaviO0uDtzjTVVbSowTW8oByLrgELay+
	PMmnMMRmux24DyAI7qN1YprccVNzc8Kvsd4OXPq7ZbpdArtmyGcgMd4JON9BaVoK
	uqPcZO6ALZzVaEnKeweL0kiKurbkYp8nAvfEGhudXFDvai4KqyRgcTiCadwzy5KN
	zfn9vo0sEU29LQSfWGMtLNnytOsz6mn7eoSM/+y4DuS8ETEPR3t9TiOzV+7cRnWO
	ZoxRc1yJg9pcnwbWgC6lg==
X-ME-Sender: <xms:6xtgadU5P8MgvY3Y1UsaUDzMjMWXXkBVvD939Pe_hFoQLJk58r8uIw>
    <xme:6xtgadS_t3_7FABQ3Efaj-y1Ez2Byzf2A6GJs0kIWwc9wTRiKMaqm483N3znUBeZB
    LGO5JOJrgxavphtQX8ff0z8JFFGTjThoacyNWKCWAbLHhMAbn8SQnY>
X-ME-Received: <xmr:6xtgaVCrfYmI5A3jjAJPsbsv8IO_9ToKLKxEunDZXK_P2cO4SGb9ef3k71jbAfzntsFQ2DXiIadjQRBn0U1oLZo3VFL2aklXOoI1bA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeileekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhih
    eslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehsvhgvnheskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoheplh
    hinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6xtgacIUerewObi61QWufnWq_794MYhOzxy0-5a880GVrhZhOlmvYw>
    <xmx:6xtgaYD1XSOeSmVLS1uvzOBhcMxfSOf4AQQ_iOymkZ6yCiCmWr4N-g>
    <xmx:6xtgaZuiXZtJJldYMGgPBovsJc_wWiZqy4XQ-YIZ-b3A1xGywPX_fg>
    <xmx:6xtgaeToClXqonVdSVO-0WVPstQKkJLSEF303XFZQwobf2_JSZgn9g>
    <xmx:6xtgaVS-O3bI7_fJZuDjSIY4gn3_gxnZSxyeuBtkEFCeB24A7rQUF6ua>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 16:04:42 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Thu, 08 Jan 2026 22:04:03 +0100
Subject: [PATCH 3/3] arm64: dts: apple: t8103: Add ps_pmp dependency to
 ps_gfx
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-apple-dt-pmgr-fixes-v1-3-cfdce629c0a8@jannau.net>
References: <20260108-apple-dt-pmgr-fixes-v1-0-cfdce629c0a8@jannau.net>
In-Reply-To: <20260108-apple-dt-pmgr-fixes-v1-0-cfdce629c0a8@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=11AMcjryIBqasark3A35Cj68+orOKw83gXx0NA7gkZM=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhswE6bu9W92P8dVtvz678tchX1OGOBHHS/2+GnNCHmxrC
 P1xq+5IRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIkUbmP4H5Re5nT1+bdELTNv
 VnWVBweesb8PvjZxQ6uE18+Ty9t/JTEyzJQXfuVZa8B+xLY2IEczf2fiutrzZ/jqz7HUfJ7tecS
 NEwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

AGX appears to have a hidden communication channel to pmp, a power
management related co-processor already brought up by Apple's
bootloader. As there is not driver for this co-processor its
power-domain gets shut down after the initial boot.
This crashes the firmware running on AGX immediately.
Until there is a pmp driver and the dependency between AGX and pmp is
understood keep "ps_pmp" as dependency of "ps_gfx".

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
index 4bfe0d2de30ad6f975b31d443b62ef0e74b14324..fef8a4058f14159d953fdc1d47ed83950e30a37e 100644
--- a/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
@@ -733,6 +733,7 @@ ps_gfx: power-controller@3f8 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = "gfx";
+		power-domains = <&ps_pmp>;
 	};
 
 	ps_dcs4: power-controller@320 {

-- 
2.52.0

