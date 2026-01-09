Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BD3363C6D
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972356; cv=none; b=V8Q87EvPYyFm1syNN/gg5D6jPr5Lh3W5/7y03b2bsHCKN/luQVPx/FPgcCef7GHIrV+F6NIbtbkFIydroliBVdjMS46rHb0+BztBA8H/xidaYRkZ2YEgWxddy1uCNzHaxg3kl9DWsrtCjr8fm45vSgR+H16MkRHEX0e1OA+Jejk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972356; c=relaxed/simple;
	bh=SOK5Eyemmpz03VsX+x7LfeUtfqaOqL/374p1fPhcRpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FLYG7lPamEY7aRdhX+6gVud+Xv03Ci1UTbWZR0L164V5qD3WJYEdKPFBR+XNMv6k5IFE0e08MJqGxuPB5Kn6IPlUDMpE3SWcgtmfgMD1+1En1TDK1t3p9+PaFxW3UtMFy0OojPonoP1cmLevwfOLV8y1YeQSHMIQnadyasghxCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=dYg8IdrZ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=J18tgSKF; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="dYg8IdrZ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="J18tgSKF"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id C7E59EC018C;
	Fri,  9 Jan 2026 10:25:53 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 09 Jan 2026 10:25:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767972353;
	 x=1768058753; bh=BKby8XEY0gog5d92JfJPvtX+nrRYxzECZ+aWCrF6A+E=; b=
	dYg8IdrZTKvBhGl/n6m12RgLeIFO+xYIVdPEqdM5Jp6LbSOTLmGsiNxD83rGDOcK
	PIMtUdlR+9HRa2AtoLkmYr5wdLoivFpY0MLyOo24pRo3MvMstOLHXm4Ifs3yXg/v
	OWzhgYmgQnY0k3ihkK3klYgDf0H8iZu5gWE8lEhaU58fprZUQmQjiNL7XHIf7WwV
	NUihWwU6n5EGaidlFNzzulHGgyEXPyGB7G9/3PhQFdMSueNXxq2+sAJKhGqnRx1h
	Zmda20fNKN9H01jXGg7oo3sy8y8DXb6Cf2k9qD9b12FdTUyjya+3/zKAjGNN5Kua
	2cRaUEfRD5mcmH/ai0MWuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767972353; x=
	1768058753; bh=BKby8XEY0gog5d92JfJPvtX+nrRYxzECZ+aWCrF6A+E=; b=J
	18tgSKFsSMAiPSEG04n68DyaOSz38OLxPkpxragcCEdWy4GIaH13Lf1NLX4zSqSw
	DgmOXB7P10hzFKeEh1cRfEYNeR15TY1UoCq64x/43YO2fqvf59IhLR2fBo0BJdGS
	upAXxNHqb/WS/iltKzIwoO8UNcVWsin8hm5V33uQ34gSgnVqOmACU+cqrVob6idN
	8cYtSQQwGGxyZhf4tauCywf57pnwq9Vpujvv1TtC1olicQ6OvW1m9oPXF90tXEIv
	Hb8XWnO7qNF+VG5zKYDgdHdJT+nhNbqyRSWHrxPwNK0r1LL/qxSw7uNspFUkik28
	4FjVLhF643XGMJO2eGxnA==
X-ME-Sender: <xms:AR5haXrKPOUFEqjyq8RvAJfRFeHudus9MUR1W3aVowpzt-XcE9ksyA>
    <xme:AR5haZ3itW8KuiqpDyLPG2HKB0tE3cpDCfd6J8vxeFm28TlDf5vLRR3Hv6Motu4x3
    lkQ2CMwVAvm05X9pA1f7_zIAsZEDCyMG5hw5q40Shq9g4lhb016_ZM>
X-ME-Received: <xmr:AR5hafxMQZJiq09T5nWK6CnAa-aVd27by7XLf1EPg-4uZfiGmPwx4GXxDHYkyWVM7v9kqVeqQmiLALz4l4u6Y29YeROmfrBF-OZ5kQ>
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
X-ME-Proxy: <xmx:AR5haVi1wNMRStuCbhl33jIAoAtW1oLSyLAUbIohRMG5ZPPfTOU_gA>
    <xmx:AR5haSqKaMAGOv_yKbwQnFwx9-e9P6BnDfpH406qotZRoTloFWn_EA>
    <xmx:AR5hachiQZrgUQUKwhDGi63V-ItH0wf26l1Q2jCn25alQAaWGAIz3w>
    <xmx:AR5haUPawbxtSyg36smwzX7RkxHrRO0n2PnralXfWtjhhcwvts5H9g>
    <xmx:AR5haUJ-ixxUtNOHYJ9H9_x_GhjytjO3PsOtSUWP2JfLrfsZ_mqqNd7s>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 10:25:53 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Fri, 09 Jan 2026 16:25:44 +0100
Subject: [PATCH 2/4] arm64: dts: apple: Add chassis-type property for Apple
 desktop devices
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-apple-dt-chassis-type-v1-2-c215503734c5@jannau.net>
References: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
In-Reply-To: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1927; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=SOK5Eyemmpz03VsX+x7LfeUtfqaOqL/374p1fPhcRpc=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxE2d82Nzjmctf95j167yVD3cfUd2Jh86wXKAqbHw+7v
 vW/nGtzRykLgxgXg6yYIkuS9ssOhtU1ijG1D8Jg5rAygQxh4OIUgIk0pjEyXFB71Le780qm//6T
 jaUTGP7X8lqlBIbnBzXFOrMt2/97OyPDxiM204QcrjIIKt/f80wm6UnWUe1Ldov/MEv+ZGqY79T
 KDwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Apple's Mac mini and Studio are desktop devices. The SMBIOS has chassis
types which might be more accurate like "low profile desktop" or "mini
pc" but without clear definition what those are use plain "desktop" as
chassis-type in the root node.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t600x-j375.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t8103-j274.dts  | 1 +
 arch/arm64/boot/dts/apple/t8112-j473.dts  | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index c0fb93ae72f4d4fcb254a36dc408d55ab1bca0e9..5bba233b5383f227621bf0a648e9de43597b38ed 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -10,6 +10,8 @@
  */
 
 / {
+	chassis-type = "desktop";
+
 	aliases {
 		bluetooth0 = &bluetooth0;
 		ethernet0 = &ethernet0;
diff --git a/arch/arm64/boot/dts/apple/t8103-j274.dts b/arch/arm64/boot/dts/apple/t8103-j274.dts
index 1c3e37f86d46d7b5d733717b47c4b57dc55e1201..b379ca25b1b7011c0e24f0ef97a6b6bd469342f0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j274.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j274.dts
@@ -15,6 +15,7 @@
 / {
 	compatible = "apple,j274", "apple,t8103", "apple,arm-platform";
 	model = "Apple Mac mini (M1, 2020)";
+	chassis-type = "desktop";
 
 	aliases {
 		ethernet0 = &ethernet0;
diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index 06fe257f08be498ace6906b936012e01084da702..a05951e91a022c9b08a1b7897832ae9553201340 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -15,6 +15,7 @@
 / {
 	compatible = "apple,j473", "apple,t8112", "apple,arm-platform";
 	model = "Apple Mac mini (M2, 2023)";
+	chassis-type = "desktop";
 
 	aliases {
 		ethernet0 = &ethernet0;

-- 
2.52.0

