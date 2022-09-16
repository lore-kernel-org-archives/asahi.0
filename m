Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C7253B6
	for <asahi@lists.linux.dev>; Fri, 16 Sep 2022 14:25:55 +0000 (UTC)
Received: from robin.home.jannau.net (unknown [91.200.110.112])
	by soltyk.jannau.net (Postfix) with ESMTPSA id 9E86326F07C;
	Fri, 16 Sep 2022 16:25:53 +0200 (CEST)
From: Janne Grunau <j@jannau.net>
To: asahi@lists.linux.dev
Cc: Mark Kettenis <kettenis@openbsd.org>,
	Hector Martin <marcan@marcan.st>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 04/10] arm64: dts: apple: Fix j45x model years
Date: Fri, 16 Sep 2022 16:25:44 +0200
Message-Id: <20220916142550.269905-5-j@jannau.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220916142550.269905-1-j@jannau.net>
References: <20220916142550.269905-1-j@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hector Martin <marcan@marcan.st>

The Apple silicon iMac models were released in April 2021.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Janne Grunau <j@jannau.net>
---

 arch/arm64/boot/dts/apple/t8103-j456.dts | 2 +-
 arch/arm64/boot/dts/apple/t8103-j457.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8103-j456.dts b/arch/arm64/boot/dts/apple/t8103-j456.dts
index 884fddf7d363..c49c048ac2a1 100644
--- a/arch/arm64/boot/dts/apple/t8103-j456.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j456.dts
@@ -14,7 +14,7 @@
 
 / {
 	compatible = "apple,j456", "apple,t8103", "apple,arm-platform";
-	model = "Apple iMac (24-inch, 4x USB-C, M1, 2020)";
+	model = "Apple iMac (24-inch, 4x USB-C, M1, 2021)";
 
 	aliases {
 		ethernet0 = &ethernet0;
diff --git a/arch/arm64/boot/dts/apple/t8103-j457.dts b/arch/arm64/boot/dts/apple/t8103-j457.dts
index d7c622931627..f7c7c850ad81 100644
--- a/arch/arm64/boot/dts/apple/t8103-j457.dts
+++ b/arch/arm64/boot/dts/apple/t8103-j457.dts
@@ -14,7 +14,7 @@
 
 / {
 	compatible = "apple,j457", "apple,t8103", "apple,arm-platform";
-	model = "Apple iMac (24-inch, 2x USB-C, M1, 2020)";
+	model = "Apple iMac (24-inch, 2x USB-C, M1, 2021)";
 
 	aliases {
 		ethernet0 = &ethernet0;
-- 
2.35.1

