Received: from fhigh-a7-smtp.messagingengine.com (fhigh-a7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D20364EBD
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972359; cv=none; b=I+vghc9PKPcTS4xXHPtl/h7Me5SW6iddND/OcBuX9ZN9l++1tEoAQAk3nsXGQM6g1nUlpQAqOJYNgvQKpjUs/rdTOsGw4LnDnM/QnkugNsVmRgg7g3nU2wXffCVwcE073OhfjPcT2+c5n0jYHW/+ZT1xTmk5cye/wxXMcQkt8N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972359; c=relaxed/simple;
	bh=AJPBLOhsNE6NUX/mnfmMo8DI9FwN/AXyZUWmv+NCEFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OghQ4MpqWjeY3bWgYjupdg4gei8Tajow+wr39Pw5jJAlc71OcQLeWRAFqmW2wIqVEADKtlZDk0fNbjd60nhwLdxGcAv9w+aWAsm7ROBGSmRYG/fY9Y6Q6bgA4R5r34cpGTAJVhQVIeQlBNR+0gHqWx9rRM15nUa1o3lrIrbSs6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=myMHnwnW; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UR/uh8+x; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="myMHnwnW";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UR/uh8+x"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4BCF5140018E;
	Fri,  9 Jan 2026 10:25:57 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 09 Jan 2026 10:25:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767972357;
	 x=1768058757; bh=D+K8EMEof++7D26DPSvnPgtOOvNH7OpYLlMmU+m2xgU=; b=
	myMHnwnW9Exy3yuvt+PVVToXINmMnYWytoOLL3YHSViYbthzpI+rtXo+ArEbXLf8
	w/CVEthMJFM/03mLliSDsqOT/Uj1RpTv0AoCb5hmW1zXubxmaeUd0247QX+B5nZS
	Z1ith5qU957GErzFzh5U5YTckdEOsD/AAtUctHAQMAwxpHQFotNllcI1++itFrMO
	sIuBtxpMoAmK58ZNe/gXmr36CA2nsZwl0XopcgPJWWSOpmAgcU6c0hTmopCRDVqJ
	S84p6zU56ZfDulUxup8UAh4zlLgznTzYLSKINF48etH8o8TIKbV+miEbCZHGPWqJ
	/H6Mv38c6gATcldQ6sMXnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767972357; x=
	1768058757; bh=D+K8EMEof++7D26DPSvnPgtOOvNH7OpYLlMmU+m2xgU=; b=U
	R/uh8+xzUQY6hS8oKea4t/8BzYVm9nyB39N4FNy7WpY+96GN1RPRHS+Bg9athSEl
	quNXCArUmWi43dpfOP4NsdLqAOl2jBb9j8G2+3iyX+Bn8GUmBuHSAall7haVBUne
	T+lnRmBnGc/Nk36dChVErN1+PmF9lh38crGkn9tfJqm47gkDesOKIQpW2/a+bCCP
	1uCc4RP1f3Q/72b+wKijP+MY9rqdjr5ROH/3DSR2dcE0QnJuXxDZsV5eouMGOReD
	w3lS4g9n4zhs+vJTHMunIQGQZQ0xFJhk3Xu+hsJ97Fgm0jIMTuuf+OEZHZjhBaju
	zInu3Qx4GCvFhMmGxD5aw==
X-ME-Sender: <xms:BR5haehb2JusAnjBJ6LLmp12mc3Mr4VisAsUK_ij7Ek2fh83WkIFuQ>
    <xme:BR5haXOiA2rQaqjIcWkHTpk7HKURYVmX5yEdt5sgmFS2Bs3_tA-n1LbhpcjhxIJjC
    dI7JeCCAme6Tf-QMS_kN88Nwj_6QCl-ROg7-WqsdgLgr5etzrUSSRE>
X-ME-Received: <xmr:BR5haRo__mwW7lVZtkAYlPd1VSrGJFV3DCe44lyGaprMoWtzZotoM-NApB9fU3T1Hbd9FKIfFt8vdpF49przMCOfTKHiaFMMy5nJmg>
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
X-ME-Proxy: <xmx:BR5haR7AYu_Ca-Z5Bh24RS9BZ_1qVaBAx0SLpoADEwEX99rLLLjtvQ>
    <xmx:BR5haXgEnbzMO0GcutJr0wX94mwxt1K0UPXC42nQemJFm-XXE4NYuw>
    <xmx:BR5haf6JY4aZqMOaMV8UxZdtCpNSIMDvtzGDmx4KcV18W38uL3ECbA>
    <xmx:BR5haUEQT_C5F_EYnMwCdGw62nnmuPCYaq9GazwtkKlyBrt3JkEhZQ>
    <xmx:BR5haeL7-xPjXM-J1esXgfCPkiBwfHDDaxKChHjn5m8t-eng14qdykLQ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 10:25:56 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Fri, 09 Jan 2026 16:25:46 +0100
Subject: [PATCH 4/4] arm64: dts: apple: Add chassis-type property for Apple
 iMacs
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-apple-dt-chassis-type-v1-4-c215503734c5@jannau.net>
References: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
In-Reply-To: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=AJPBLOhsNE6NUX/mnfmMo8DI9FwN/AXyZUWmv+NCEFM=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxE2T8tm7w/Plt8jCWAZ3ph8Px8xed5zOf2l+iviRJSC
 xHZdreto5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwESm9TAyrD3+5dI3jxe6tdIr
 1z+aLnVEbFuP9Z+eWaY8hn1nryw2yGVkWCndlLN7Q9Rv6Zrvi/XFFyRWO+ds2Hra7fgGryrLZHZ
 XLgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Apple iMac (M1, 2021) are all-in-one devices with an integrated display.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8103-j456.dts | 1 +
 arch/arm64/boot/dts/apple/t8103-j457.dts | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 58c8e43789b4861544e20c717124ede3327be010..2436f0e692e36ba19b99e00dcc1a9f09a26e246a 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -15,6 +15,7 @@
 / {
 	compatible = "apple,j456", "apple,t8103", "apple,arm-platform";
 	model = "Apple iMac (24-inch, 4x USB-C, M1, 2021)";
+	chassis-type = "all-in-one";
 
 	aliases {
 		ethernet0 = &ethernet0;
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index 7089ccf3ce55661f3f83810496daed40c8199189..208171adde129ac0f16b7a891704308bc2aa20cd 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -15,6 +15,7 @@
 / {
 	compatible = "apple,j457", "apple,t8103", "apple,arm-platform";
 	model = "Apple iMac (24-inch, 2x USB-C, M1, 2021)";
+	chassis-type = "all-in-one";
 
 	aliases {
 		ethernet0 = &ethernet0;

-- 
2.52.0

