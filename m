Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588543644A7
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972357; cv=none; b=YWrzLmOH6wLUpTcl/kIL4Jy8uRbzrVQtEpIPIn2qRSaJcfvQk/9oICUTtMpvfR8zOTROlzumQsLYwwk35RRte0YVzmyLuY5HbBtVloRpiOCSFD/WtJ7utxbK5CQxqAOb00dnF/3sIfGpOUiroNy244tPmCSvZIn/5ItuCq37X4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972357; c=relaxed/simple;
	bh=OXYyDfjk9m00xxS6i7o24ICfm/by9oPBNKNMiBasHRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=szeKOCeyqd08Hh19mT2Zg2Z5QjgaljXa/2VhlkTMDRzRfcVQ6blUMBMZkkEQC8ffObiyIE6LwHWPQWkxXX7RiWS+6O2TwOmnpvuY1t+MI9Daba0obF6jZ2lECiT+b7jOq6WPYIOtiD5Kl+R3WpWXc4oBSGxO2F9Z8eNdRb48bXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=ZeUOUcZv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vV21eRd4; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="ZeUOUcZv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vV21eRd4"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id A0DBBEC01BC;
	Fri,  9 Jan 2026 10:25:55 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Fri, 09 Jan 2026 10:25:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767972355;
	 x=1768058755; bh=+fYZgV2ZOEBb7iApgMZ6j6mqb8NNvqjWXdhkLrFN1AI=; b=
	ZeUOUcZvJwgC1z7ABSV08EXwcGIoepSX6+5S9BGZByxzEyf9ckDxxf2vPNEh3xzx
	3nMJ+gcQNR/wWTydsfbjams5pZ4IoF1jCZoLWRiha7n4ixIYll++Woe8syr+dk46
	LiPRv4ZTVhqhiXXxyY94lS4ejsbRmY8UukGVTiORGTlTnjJmTWdOs6mcY5RYCmMc
	zhaPxyyiAwUt7rvisw5zLPyAETRvpS5wdR30dfVvQJW4I2JV7H6crEQp15m/KPbz
	HDXQMCBiayvjWazaAOCBQC2yCq2x1GWCF7+us97FLoQoRp0dGQQ7dxwetL6uR7zg
	7bMloC/YqYKPX9Cjf+N8kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767972355; x=
	1768058755; bh=+fYZgV2ZOEBb7iApgMZ6j6mqb8NNvqjWXdhkLrFN1AI=; b=v
	V21eRd4ne7rN5dmwXuQ02LBzUPdXpsgfXEUfUnHpK4tM5g4BrzjIE+OjRa23aQf5
	uU3LJ8tto+FZNFt9JplbNJEwRMaQ0j7Ke4eLxdcIk4tncnNWTXfOialvh+7HK7hy
	9PGb3lLS+Y0WAox3fnlQbbZZBJFO2WdvnoI65qJ9mqR0LvoAiHX6I35u5kHv++Ii
	hKamXdG5xgaGHphIIfSWTRQxv0OcLCAv+0c6cmV5CTBpS26FW2ViOBvRKn9Fy9Py
	zsI7z9XV4Z/1n+oyvaJXoHaYfvB43eOhnX7gydXedxNTfTxItD6e/9KWWjqeb3nf
	PVEU3EH218Xg8qJlRne7A==
X-ME-Sender: <xms:Ax5haVxq9ZRoSvQgoctesHYMatJHTs2DoUyVHrTD-Q-bySA_HE5x3w>
    <xme:Ax5hadcBT4FwYnj3eKH-BiJM6qqRUJsT0FssSEZjENElz5heDIBD75fYwR52-agao
    wYB_g9978cnBytrtRr5VluJPIXYDLwS88mN1aXqM7OVsBlS3ucaBLlM>
X-ME-Received: <xmr:Ax5haa60-beci6djZ-k6Xs35s1ws_daF1ZLlJX1tCq0dKLOXAEOJ_gZH2mHpW5ErMc5RDFAq7sDotaq0_p_okVjrCKSrKSfQsV-O6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeludeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgv
    ucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepfe
    ehheeileduffehteeihfdvtdelffdutdeludduiedutedvfeffheekhefgtedtnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrg
    hurdhnvghtpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepshhvvghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjsehjrghnnhgruh
    drnhgvthdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghsrghhih
    eslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhk
    vghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlih
    hnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehn
    vggrlhesghhomhhprgdruggvvhdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:Ax5haSLIhoTIO2QtrlmY2rZqisRB1bGA-uUc9lsgQVuziPE6e9CF0Q>
    <xmx:Ax5haSwG2Hdd1C2dZoiPXj0btiuN5teX_bvP_FS3FN8H6JyeF9BMHA>
    <xmx:Ax5haaL7-usgZetYGQjD2VtNCJS3Rqx8n8exh90jFw_A4o0L0IcLUQ>
    <xmx:Ax5haRXLEz0a5ekkgcUBz8jaLp_yMgWh6KStzoguZH7Cq8AJ63nodQ>
    <xmx:Ax5haTSNjFW-Qd-0jjoPjXKpBWeQPhez3WOzG0fH90lkdaI0ig4CTEuk>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 10:25:55 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Fri, 09 Jan 2026 16:25:45 +0100
Subject: [PATCH 3/4] arm64: dts: apple: Add chassis-type property for Mac
 Pro
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-apple-dt-chassis-type-v1-3-c215503734c5@jannau.net>
References: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
In-Reply-To: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=970; i=j@jannau.net; s=yk2025;
 h=from:subject:message-id; bh=OXYyDfjk9m00xxS6i7o24ICfm/by9oPBNKNMiBasHRg=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxE2d/Pz1q1ZF9ZPDVK+Hxm16T++RE2W4+bFzTFndPWa
 Jl/T2pjRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIlczGL4H3lo25HtfFcK2s4f
 Wv3t8+cUEcONB1Pi+p9Z7P31ftnMpzEM/wvWb4vrTg0IPOo2qeKEeseGHWoTJxn53mv8uJX7eeA
 8OSYA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The tower and rack mount Mac Pro variants share the same .dts file and
are identical except for the chassis. There doesn't appear to be a
property in Apple's device tree to distinguish these two devices so use
"server" as chassis type which describes both if one doesn't look too
carefully.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6022-j180d.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6022-j180d.dts b/arch/arm64/boot/dts/apple/t6022-j180d.dts
index dca6bd167c225aa23e78e1c644bf6c97f42d46b5..55a5e19563894c576dfe1bda9d48c5b69262bc02 100644
--- a/arch/arm64/boot/dts/apple/t6022-j180d.dts
+++ b/arch/arm64/boot/dts/apple/t6022-j180d.dts
@@ -15,6 +15,8 @@
 / {
 	compatible = "apple,j180d", "apple,t6022", "apple,arm-platform";
 	model = "Apple Mac Pro (M2 Ultra, 2023)";
+	chassis-type = "server";
+
 	aliases {
 		nvram = &nvram;
 		serial0 = &serial0;

-- 
2.52.0

