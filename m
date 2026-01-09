Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40E7363C71
	for <asahi@lists.linux.dev>; Fri,  9 Jan 2026 15:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972354; cv=none; b=RZBIL4AKAb+NtCQDtG8JDBGmONu5nnhZw4JmsQrL7ibW5wILxy7w/Xy2U/88hSinwaY3mzMJPkCek7HOxiOUgvkEg6rU5+0cEVqaTRx+cVT2XBc+oi0FVlDaYAKnnFktABvj7YgcBtcCrwwKQmTsgWz5U1pLjMdMPztNt7RTJlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972354; c=relaxed/simple;
	bh=shJn6zXhU83Gvr/ziMV87HAm/8EnCEYSHfJ6fBqlmGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jlze7vAraGjUzhtql+aSCwtXMHwwT8BdbkrZGQA2mFua4JEzy778hisu+NSKT8EChP6bH5/7ENLUrpnfA7kQjNjmwTk/gs+dGF6IfQhtMYQB8bu6NeOEzVoTxK/cpt1tsu1oG8NOycKV17syURqxDyY8pi6McJvz9it+qI3a9NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=f4nIlget; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oeXm5HWm; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="f4nIlget";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oeXm5HWm"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 1455FEC01C2;
	Fri,  9 Jan 2026 10:25:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 09 Jan 2026 10:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1767972352;
	 x=1768058752; bh=5CCQ+W32XP4VZ1zZFnVTs2k6r5HvqKV38SEShSLJh64=; b=
	f4nIlgetXdbjgIYCSclKpXReDj1mjNLEfAxQm5j8EOziy1+ScLB+g4gVXt6Nuw2R
	WuvsRvIFU84opaNt+Bsp/Oz0/zZ0iboO2Z3iIxczQ7RYaloLMnIM6ONNzPYKhWxD
	+/XLuRv4G3xq6fHSrtVjL9qlKbm805Mi3ChMCwq5uCs47EyDEJIYiFDUsDpr5N0F
	LK/TjWJ2KEk6g6Ii+NY0/nAyqbi3K9LER6jJ1UC+4RZOMRSNcIvpmY0vRlR5y7VA
	JMp28YMWXXgOlV1r90JnmLBlkjsLk81Wievk/d64w4eO72mi4Yy/b4IfWfWGZLxK
	MhC7FGUNUjAGUwuMU97D5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1767972352; x=
	1768058752; bh=5CCQ+W32XP4VZ1zZFnVTs2k6r5HvqKV38SEShSLJh64=; b=o
	eXm5HWmgNpaoaKfXTTQF0VIPeyyk80+dMW6XFmPWWgmBAX1OZ9J3XCAlDz0VDwOP
	+xxN/YJ+W5fMrHb8jpYRwmomjF6Zp0N5/+lRBI8nplB30aMDM+26iJFCjC7Yh6eK
	yflfF8RKKR+KAijfZZQtXyhMw8HvUkublFF+VjUqEX+hqIlwtkBe6CzzvQbzFptm
	rARvpJHZZGZwVBEZR90SjmLCA/4qEoJPSs9dGgm2zMBLDn+3z+/iL3LAaQ45Peio
	vQXrKagE7BVcjTAQGS0y8ab6eQsHG7T/nSZzBCXU5AtsR8HT1h76tXYGJrKPcHOv
	217V+ZdnFiuvAZA5O+QwA==
X-ME-Sender: <xms:_x1haTg-Q6pShgtEvgnLlbkTVvCAssGoNe70hXQ_VteHhGNzWPWxlA>
    <xme:_x1haYPemZbEwYsD3CQviJ8kIHagK3f9cDEFNkauAnv7qUlcFIMQgUNDyI6nDc6ck
    _84-Pe8rQQjuc7vPI2yIJvIQWvB77HlfGHI2obrtGL_6KkpmCg8VA>
X-ME-Received: <xmr:_x1haeoxrKFNHXreaiCcvtFj0rCz36766iqmG9JuKBIBiiSSLBKW5enJ1XAL7bxPlm6a3XIKvUOIpSJfgz3Hj97ienI3OGxrY09S4A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeludejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:_x1haa4CWt11q8kH_qkywCa-jtzE3sHvra38WPM5CrTiZaHtX5mdYQ>
    <xmx:_x1haci7cXGeReBVZhYq2lRv9fyFKCVrxv19qAzBKATnMaAaZbE2Rg>
    <xmx:_x1haQ53Z__KlsMec_OtaduynjcJzHUMZuRvnU4g6UPR4LBAaF0LVQ>
    <xmx:_x1haRFgt2gkir1CDrDQkNYsbsu5V8f-1ZmguKLfVqrdC3qkwFfiZQ>
    <xmx:AB5haXKYt0eC-vGDdS59TjeaX4aYhu-bTFgL8kncBLUu7MfL4BEamghg>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 9 Jan 2026 10:25:51 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Fri, 09 Jan 2026 16:25:43 +0100
Subject: [PATCH 1/4] arm64: dts: apple: Add chassis-type property for all
 Macbooks
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-apple-dt-chassis-type-v1-1-c215503734c5@jannau.net>
References: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
In-Reply-To: <20260109-apple-dt-chassis-type-v1-0-c215503734c5@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3610; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=shJn6zXhU83Gvr/ziMV87HAm/8EnCEYSHfJ6fBqlmGg=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsxE2d+NBhbnoj/w9Je23nrkcfn1kb3hhzkz5atKL62+9
 PKJzo+IjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABOZGcLwv5bl4/EzqesCZj+t
 UHVOrszznNN+d3LrkoSND/kPH4i+28rwP/7y3qWzyqpWrGet89jUzlOnbcJjPs3NVvOdjMFPEWl
 dRgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

All Macbook Air and Pro devices are laptops so annotate this as
chassis-tpe in the root node.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi | 2 ++
 arch/arm64/boot/dts/apple/t8103-j293.dts       | 1 +
 arch/arm64/boot/dts/apple/t8103-j313.dts       | 1 +
 arch/arm64/boot/dts/apple/t8112-j413.dts       | 1 +
 arch/arm64/boot/dts/apple/t8112-j415.dts       | 1 +
 arch/arm64/boot/dts/apple/t8112-j493.dts       | 1 +
 6 files changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
index c0aac59a6fae4f6f4b387483665349a8e2521c1e..15bd157a486c0d6f8fa23e628a87dc3cf4cac731 100644
--- a/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi
@@ -12,6 +12,8 @@
 #include <dt-bindings/leds/common.h>
 
 / {
+	chassis-type = "laptop";
+
 	aliases {
 		bluetooth0 = &bluetooth0;
 		serial0 = &serial0;
diff --git a/arch/arm64/boot/dts/apple/t8103-j293.dts b/arch/arm64/boot/dts/apple/t8103-j293.dts
index 5b3c42e9f0e6776241bf746d3458766e44e3639a..91cca3000abc10c302ff59c148c0895de70415e0 100644
--- a/arch/arm64/boot/dts/apple/t8103-j293.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j293.dts
@@ -16,6 +16,7 @@
 / {
 	compatible = "apple,j293", "apple,t8103", "apple,arm-platform";
 	model = "Apple MacBook Pro (13-inch, M1, 2020)";
+	chassis-type = "laptop";
 
 	/*
 	 * All of those are used by the bootloader to pass calibration
diff --git a/arch/arm64/boot/dts/apple/t8103-j313.dts b/arch/arm64/boot/dts/apple/t8103-j313.dts
index 97a4344d8dca685708aff136af92a1b316f3c3dd..778e482a6fb67071b13a30bb31cac8d65afd5666 100644
--- a/arch/arm64/boot/dts/apple/t8103-j313.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j313.dts
@@ -16,6 +16,7 @@
 / {
 	compatible = "apple,j313", "apple,t8103", "apple,arm-platform";
 	model = "Apple MacBook Air (M1, 2020)";
+	chassis-type = "laptop";
 
 	led-controller {
 		compatible = "pwm-leds";
diff --git a/arch/arm64/boot/dts/apple/t8112-j413.dts b/arch/arm64/boot/dts/apple/t8112-j413.dts
index 6f69658623bf89ce73e3486bce504f1f5f8003f3..bb9f34e8dc90e55ac2817ce70f17ee4867919fc9 100644
--- a/arch/arm64/boot/dts/apple/t8112-j413.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j413.dts
@@ -16,6 +16,7 @@
 / {
 	compatible = "apple,j413", "apple,t8112", "apple,arm-platform";
 	model = "Apple MacBook Air (13-inch, M2, 2022)";
+	chassis-type = "laptop";
 
 	aliases {
 		bluetooth0 = &bluetooth0;
diff --git a/arch/arm64/boot/dts/apple/t8112-j415.dts b/arch/arm64/boot/dts/apple/t8112-j415.dts
index b54e218e5384ca89155e4350d6680a28a531f408..061629e153eaaa8f96d351feccae2d9152aefb6f 100644
--- a/arch/arm64/boot/dts/apple/t8112-j415.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j415.dts
@@ -16,6 +16,7 @@
 / {
 	compatible = "apple,j415", "apple,t8112", "apple,arm-platform";
 	model = "Apple MacBook Air (15-inch, M2, 2023)";
+	chassis-type = "laptop";
 
 	aliases {
 		bluetooth0 = &bluetooth0;
diff --git a/arch/arm64/boot/dts/apple/t8112-j493.dts b/arch/arm64/boot/dts/apple/t8112-j493.dts
index fb8ad7d4c65a8fe7966f5541f24f03a379143cfb..1f98ab70d7c3ab4f178d78ce3732661401ba77eb 100644
--- a/arch/arm64/boot/dts/apple/t8112-j493.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j493.dts
@@ -16,6 +16,7 @@
 / {
 	compatible = "apple,j493", "apple,t8112", "apple,arm-platform";
 	model = "Apple MacBook Pro (13-inch, M2, 2022)";
+	chassis-type = "laptop";
 
 	/*
 	 * All of those are used by the bootloader to pass calibration

-- 
2.52.0

