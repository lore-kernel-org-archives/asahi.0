Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706703DD51A
	for <asahi@lists.linux.dev>; Thu, 19 Mar 2026 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773932289; cv=none; b=CpkPLmuDGmQgmUS199HYlJuIAfdYZte6/LMj43amFZBoFVYn7TgSOUwc0jBWBl8SOfg2onstn88EDQDfghjE1VxaYIDI8vKr4nzRsJz2JWb2gP/lbTFqY+j8widSOeFbHaTtbANk6pBQ178uBrctR1kehgZ5O7HbiHnj8+SpwR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773932289; c=relaxed/simple;
	bh=pgxNV0NukCTQwDip0+2Xj8IDia+pUtXJoQL4YDXa/cU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u1Ntcgcwm769yy30u6MROuxrp+TBT+7bu8jRige8kJyl6yclNV6qbPwt8LURqKzJ1pCeLWGwO+iqNSmXX9PDy6fy72GjimIvoqn7Gds5FQGKBKj+BxILR+K8h7sbYx/RMCv7WV7IQHwVtMPNtPUHbNamvp4vWd72DQ7xlmApE0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=DjPKuzP8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rPKRDR6a; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="DjPKuzP8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rPKRDR6a"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id 27D9DEC00FD;
	Thu, 19 Mar 2026 10:58:04 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 19 Mar 2026 10:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1773932284; x=1774018684; bh=3m
	nTyAhpYWz2zaDPLvJ2kJeO/ztsRtlNN1dUSgeAJpw=; b=DjPKuzP8SUF8zr9Zs4
	tpLPVQnLeQ9Il+n7GTO111AOmoZHSV5Xk5ZLzAWYlBJSCJE6LsNTG27G0p5U2Vd8
	MddQJOkWuAEo6s4tioBvc2jmNtwpFSGViTZ2aAjOs1mX6slIB4HGnrEw3myoglLy
	bn3pPWAuNSUeLuQTWSMeVpoeJkk0fKwK3ahH/N7PhWY7V3bVRUKgXyjPjLDsgPfV
	ML0dhJcKNKbvzYQ83y99sJ7n5Gm+kD4csG9rtr9+sZDysNUcLXMw0nuLww1vRB29
	WVZvUfBmq9++q9zGZgi4/LoXasSVQG5WnzxUogubCWQTbNUYFDkH3jGT5POUDBx7
	x4yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1773932284; x=1774018684; bh=3mnTyAhpYWz2zaDPLvJ2kJeO/zts
	RtlNN1dUSgeAJpw=; b=rPKRDR6a96r2lY/dGZZXcA/lhDv1A7Z0Smvi/HGcnIf6
	1St04c77cxzWulpsScPAP6S5F8zi3xsmpqFFBxUtxHXMqYX2d/LF2o1rv6X7yOrA
	whBCXcQd23aE+A+yz72Tn2NnkIBv4IB1RLhFthl0JlwKl6cAoJe8CArpAN938myG
	z4XVl/AXGVbgZLBNdSvpCkbklK+yoRW93mYd1HkzSfs4rWpBsOX6CZzqUpqmC2xd
	8iwTWrvDOfu2M1qDDymWP2GoDJLkzrOoo/B2No8jXsULom/JyoYSIS2/qAdcdVON
	HIp/v4R2Hh008GnZi1rps98C45RvVVK8EupDnOxMvw==
X-ME-Sender: <xms:-w68ab77C32kNdd-CowSo6Mw3vzXRwZ1SoxppdkffthdJDPg6hiXsQ>
    <xme:-w68aZH04Jv7dm4aejy0xAh_U9IcfNpl19cfN0tXXXWPFJ70JiCcQfxHbBME4OkaV
    m_OK-P7aG9idoOjU8h8AL-JXkFnflMDhAMrsms7eQQJh51yxhJl_-4>
X-ME-Received: <xmr:-w68aeApqTetZrojFw1I-TVb2NmBaG6kKah-eelCJoT8uJ_NZdkb8I5h04OECnJVKkDFnhjN1zTjbNQ4SfHPzcGJ6PgfLhR_ka-TBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeftdejfeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephfffufggtgfgkffvvefosehtjeertdertdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfffie
    ffteeuffetuefggefhgfehtdfhkefgtdejueeuvdevkeetveevvdffkeehnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepjhesjhgrnhhnrghurdhnvghtpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrh
    hnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghonhho
    rhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvhgvnheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpth
    htoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrshgrhhhisehlihhs
    thhsrdhlihhnuhigrdguvghvpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:-w68aWyanuuoSzEXCOILLw5Xauao5bdie_X8jadmvin2U1goGfCtgw>
    <xmx:-w68aa4LI8x0tAr8qZO8AYebamf782YayI6yyFhqGqtD8CiYgl98mQ>
    <xmx:-w68afwftwbNruos5KToLy6ScGOd314v4q09wep5cN9H8nVqKLt7Vw>
    <xmx:-w68aWch0DYfK8TgB_pNkiTbkmS_LnAEJcOA5FvovPvF0EDYfr9TCA>
    <xmx:_A68aaYZLyYCUw22XfOmOHt_6tZgQoJdWRqefD4NWWQN8ds6fN4jLNok>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Mar 2026 10:58:03 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Thu, 19 Mar 2026 15:57:52 +0100
Subject: [PATCH] dt-bindings: arm: apple: Add M3 (t8112 and t603x) devices
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-apple-m3-devices-dt-binding-v1-1-12052e195d6f@jannau.net>
X-B4-Tracking: v=1; b=H4sIAO8OvGkC/x3M0QqEIBBA0V+Jed6B0gjbX4l9MGesgdZEIwLp3
 5MeD1xugcxJOMO3KZD4lCx7qOg+DbjVhoVRqBpUq4ZWdxptjBvjXyPV2nFGOnCWQBIWNMZ5Ywd
 PvRqhHmJiL9d7n373/QDNx0uZbQAAAA==
X-Change-ID: 20260313-apple-m3-devices-dt-binding-88cf8a6fd429
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3987; i=j@jannau.net;
 s=yk2025; h=from:subject:message-id;
 bh=pgxNV0NukCTQwDip0+2Xj8IDia+pUtXJoQL4YDXa/cU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhsw9fD9X3pjJtI3JS0P2SPXd4lBN1cYjD3OvrVv8e3FMI
 b9DQvLzjlIWBjEuBlkxRZYk7ZcdDKtrFGNqH4TBzGFlAhnCwMUpABM5/ojhr4jK72J7/wt21y5w
 ZBatY0yZxju9atKaqxt/RzF7eW5238TIMPvG7qxde5Z3/9vWvumt0kWR6HrV/89vtyYxa+26z35
 kJj8A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The Apple M3 based devices follow the pattern of their M1 and M2
predecessors. One notable difference is that the M3 Max SoC has two
variants: t6031 and t6034.
t6034 has 14 CPU cores, 30 GPU cores and a combined 384-bit LPPDR5
memory bus while t6031 comes with 16 CPU cores, 40 GPU cores and a
512-bit wide LPPDR5 interface. These are the only apparent
differences between those two SoCs.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/arm/apple.yaml | 55 ++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple.yaml b/Documentation/devicetree/bindings/arm/apple.yaml
index 5c2629ec3d4cbcee49d3ff6a4db1cc8298e2a2e1..acfe9824921280458d0911ae9cbf609101f37380 100644
--- a/Documentation/devicetree/bindings/arm/apple.yaml
+++ b/Documentation/devicetree/bindings/arm/apple.yaml
@@ -96,6 +96,13 @@ description: |
   - MacBook Pro (13-inch, M2, 2022)
   - Mac mini (M2, 2023)
 
+  Devices based on the "M3" SoC:
+
+  - MacBook Air (13-inch, M3, 2024)
+  - MacBook Air (15-inch, M3, 2024)
+  - MacBook Pro (14-inch, M3, 2023)
+  - iMac (24-inch, M3, 2023)
+
   Devices based on the "M1 Pro", "M1 Max" and "M1 Ultra" SoCs:
 
   - MacBook Pro (14-inch, M1 Pro, 2021)
@@ -116,6 +123,14 @@ description: |
   - Mac Studio (M2 Ultra, 2023)
   - Mac Pro (M2 Ultra, 2023)
 
+  Devices based on the "M3 Pro", "M3 Max" and "M3 Ultra" SoCs:
+
+  - MacBook Pro (14-inch, M3 Pro, 2023)
+  - MacBook Pro (14-inch, M3 Max, 2023)
+  - MacBook Pro (16-inch, M3 Pro, 2023)
+  - MacBook Pro (16-inch, M3 Max, 2023)
+  - Mac Studio (M3 Ultra, 2025)
+
   The compatible property should follow this format:
 
   compatible = "apple,<targettype>", "apple,<socid>", "apple,arm-platform";
@@ -297,6 +312,17 @@ properties:
           - const: apple,t8112
           - const: apple,arm-platform
 
+      - description: Apple M3 SoC based platforms
+        items:
+          - enum:
+              - apple,j433 # iMac (24-inch, 2x USB-C, M3, 2023)
+              - apple,j434 # iMac (24-inch, 4x USB-C, M3, 2023)
+              - apple,j504 # MacBook Pro (14-inch, M3, 2023)
+              - apple,j613 # MacBook Air (13-inch, M3, 2024)
+              - apple,j615 # MacBook Air (15-inch, M3, 2024)
+          - const: apple,t8122
+          - const: apple,arm-platform
+
       - description: Apple M1 Pro SoC based platforms
         items:
           - enum:
@@ -347,6 +373,35 @@ properties:
           - const: apple,t6022
           - const: apple,arm-platform
 
+      - description: Apple M3 Pro SoC based platforms
+        items:
+          - enum:
+              - apple,j514s # MacBook Pro (14-inch, M3 Pro, 2023)
+              - apple,j516s # MacBook Pro (16-inch, M3 Pro, 2023)
+          - const: apple,t6030
+          - const: apple,arm-platform
+
+      - description: Apple M3 Max SoC based platforms
+        oneOf:
+          - items:
+              - enum:
+                  - apple,j514c # MacBook Pro (14-inch, M3 Max, 16 cores, 2023)
+                  - apple,j516c # MacBook Pro (16-inch, M3 Max, 16 cores, 2023)
+              - const: apple,t6031
+              - const: apple,arm-platform
+          - items:
+              - enum:
+                  - apple,j514m # MacBook Pro (14-inch, M3 Max, 14 cores, 2023)
+                  - apple,j516m # MacBook Pro (16-inch, M3 Max, 14 cores, 2023)
+              - const: apple,t6034
+              - const: apple,arm-platform
+
+      - description: Apple M3 Ultra SoC based platforms
+        items:
+          - const: apple,j575d # Mac Studio (M3 Ultra, 2025)
+          - const: apple,t6032
+          - const: apple,arm-platform
+
 additionalProperties: true
 
 ...

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260313-apple-m3-devices-dt-binding-88cf8a6fd429

Best regards,
-- 
Janne Grunau <j@jannau.net>

