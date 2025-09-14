Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFE02E1C7B
	for <asahi@lists.linux.dev>; Sun, 14 Sep 2025 19:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757878740; cv=none; b=s79Sb2/TxR/O3qqERi748GiEPdTU5RU2YUP9Qpw28YadHINUSzCbvxXpKXMyrRq/QUNz2nIPj/9u2iEKUx1kLPZXg8QmK2GEgO/Qv3wL6AXQS/xbVg0amQwBt+Y2CsOV3l/RAVBBXoeFxSV0yv4HblRW5axwYEJQuHbiRcd9GqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757878740; c=relaxed/simple;
	bh=W0OKDz1j+KjVHP3zG7O8HDQskqjMR1ZP/OoML7KXvAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VM7jPOeXf25ZBAmT3pg5KM5IhHjlSDWmQlw1lutn5fa0vpQqMd+x5D1fZNwQTB7UCwBO7NsGUQSGnyXfsRO4swM6sB+cGfkZ9BjGfhRM6PGO88f0ECFI1jCeKG2xH2Y7SuP6n98dcs/avXUXzl21uZkyA55k0/0Adn81TYfQoBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=mwkPIpoh; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CB0Z69C6; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="mwkPIpoh";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CB0Z69C6"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3DA107A0123;
	Sun, 14 Sep 2025 15:38:58 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Sun, 14 Sep 2025 15:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757878738;
	 x=1757965138; bh=gzCJFtXYRyJroeLFXYB/us06vnoQums11eW20jk6YCE=; b=
	mwkPIpohZEhwqI/IwhfqkGTZsjuM2JNlvIeiphXFrUXYUiU2UMQ8Zl+1N71ETRMp
	mvj4n/WWKuaX6HUA0cwh7EWdiqLsMEmMl0RtxLH3YIqN9NSvlVve6j6p0HfWUYY9
	nbZ0O6kNkwaflL8XqWVlhSVd4S35DN7Ck5wk4yc4mKvPPirzexTqhXt9x0Z/Qeqr
	Ljl7DK55UdouDTDE650JbziP2P7yZ7JsbSVmjO2YyIHJw+8JsQs8oJm+B5Ep3F8Z
	jGlsulkARvxT/2Qs2PNdUOXcPVNa63J9CMzaiCZMhS4SBQAeosEGAHNquGlGzovk
	WZJtrJ7SwsPCQBTzo41mLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757878738; x=
	1757965138; bh=gzCJFtXYRyJroeLFXYB/us06vnoQums11eW20jk6YCE=; b=C
	B0Z69C6bJUj+e288TUML+f83a1KSjhZ8NqlbXBZPhgkE1Ja2aq9WU5q2bw8TYa0W
	AceMMk6KRLyuvfKXudhE4FSR+cdc8w+ioVsThTFg1QaiGJFjCFcH9WQ/BaetqrLw
	bPpTOoTcnGreYbJ5rGyRJVdGZf5nMwgLrEGLLMV6QRklGDjoZdjga+GfY1eNu4cA
	ussW4QoqX+21fZ+5fzOqgD4EqzTEWPWh1Ro3jB2tIJocWeUA3jY/EXbEnaBVb99/
	G5fQmC4y6iJL0dv2JOQj9t+MrXQW7RuBxYGwPy3TiH/gY4IMM7gFI6KG3tHznHuy
	eAmWrgQ6ek/uYrcT1YNSQ==
X-ME-Sender: <xms:0RnHaC2Xljp3iwt1DT_FIw4zAMwm-GFn-HfDTnBvT2ncv5GAKeDteA>
    <xme:0RnHaMUZ5GjcBDlVze7_g6SifHh9biwnOnkvsgDzhPHg52jCcxd6qonI8JRASb9CN
    RYdkze76BLLPqTDBuE>
X-ME-Received: <xmr:0RnHaFw-YmCxdUZ3srnpsX9BWVxk_HFwmGt8JVmTMQQFltsW6Zr5BzY22BtC_wb1oL42wrqfP0iClFgqSx8_tHDjyu-ikoixZnYaAA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefheeijecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpeefhe
    ehieeludffheetiefhvddtleffuddtleduudeiudetvdefffehkeehgfettdenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvrghlsehgohhmph
    grrdguvghvpdhrtghpthhtohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtoheprghs
    rghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdgrrh
    hmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthho
    pehmrgiisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvghighdrihho
X-ME-Proxy: <xmx:0RnHaDy9FbKT7J-iCQ9IPTsKyBZodP9yoDl91f2ikR6qbBp1CD5z4Q>
    <xmx:0RnHaK25s3Q9eePhupYu0QpHuaR6pngwVa02FchMe2nONa1vSTBiwA>
    <xmx:0RnHaBoQTz2-JBJXlTPQLEeR9KGpBMKPc8QVJ7hLQvRuRav2ohwmUw>
    <xmx:0RnHaAC3-cd5xE797989RGJHJq9ip1d9LNKlnO_L_zYZsE9RU3HRSQ>
    <xmx:0hnHaKnasb0TRCXW2cEp6bv3DTB3CWmJk35Z3UltyrcuA-rVmMeMdOo_>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Sep 2025 15:38:57 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Sun, 14 Sep 2025 21:38:45 +0200
Subject: [PATCH v2 2/6] arm64: dts: apple: Add ethernet0 alias for J375
 template
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-dt-apple-t6020-v2-2-1a738a98bb43@jannau.net>
References: <20250914-dt-apple-t6020-v2-0-1a738a98bb43@jannau.net>
In-Reply-To: <20250914-dt-apple-t6020-v2-0-1a738a98bb43@jannau.net>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hector Martin <marcan@marcan.st>, 
 Marc Zyngier <maz@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=762; i=j@jannau.net; s=yk2025;
 h=from:subject:message-id; bh=W0OKDz1j+KjVHP3zG7O8HDQskqjMR1ZP/OoML7KXvAw=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhozjkicjsxcYfzJhyixt5OcWjajdME1gxU2nUOkDmddNF
 KvPrMvsKGVhEONikBVTZEnSftnBsLpGMab2QRjMHFYmkCEMXJwCMBHzo4wMT0TLG0ru7ZZSapt6
 7cuEx7NubjwaFfAo5+iOAo5n33Ob5jH8j/VSYHlx72vu47lh9QXLWeZ2KcQrW9/+qP3g4NtE3Vn
 O7AA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The alias is used by the boot loader to fill the MAC address.

Fixes: aaa1d42a4ce3 ("arm64: dts: apple: Add J375 devicetrees")
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t600x-j375.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-j375.dtsi b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
index ed38acc0dfc36a1e30b1d44f1a8dcee089e87232..c0fb93ae72f4d4fcb254a36dc408d55ab1bca0e9 100644
--- a/arch/arm64/boot/dts/apple/t600x-j375.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-j375.dtsi
@@ -12,6 +12,7 @@
 / {
 	aliases {
 		bluetooth0 = &bluetooth0;
+		ethernet0 = &ethernet0;
 		serial0 = &serial0;
 		wifi0 = &wifi0;
 	};

-- 
2.51.0

