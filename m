Received: from soltyk.jannau.net (soltyk.jannau.net [144.76.91.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7421853B5
	for <asahi@lists.linux.dev>; Fri, 16 Sep 2022 14:25:58 +0000 (UTC)
Received: from robin.home.jannau.net (unknown [91.200.110.112])
	by soltyk.jannau.net (Postfix) with ESMTPSA id B46CA26F080;
	Fri, 16 Sep 2022 16:25:55 +0200 (CEST)
From: Janne Grunau <j@jannau.net>
To: asahi@lists.linux.dev
Cc: Mark Kettenis <kettenis@openbsd.org>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Hector Martin <marcan@marcan.st>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sven Peter <sven@svenpeter.dev>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 08/10] arm64: dts: apple: t8103: Add AUDIO_P parent to the SIO_ADMA power domain
Date: Fri, 16 Sep 2022 16:25:48 +0200
Message-Id: <20220916142550.269905-9-j@jannau.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220916142550.269905-1-j@jannau.net>
References: <20220916142550.269905-1-j@jannau.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Martin Povišer <povik+lin@cutebit.org>

The SIO_ADMA is a power domain of the Audio DMA Controller. In addition
to it, the AUDIO_P domain must be on for the controller's MMIO registers
to be accessible.

On t600x and t8112, AUDIO_P is a parent of SIO_ADMA. On t8103, it isn't
so, at least as far as Apple's firmware goes. To make our life easier,
add the parent-child relationship on t8103 also.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: Janne Grunau <j@jannau.net>
---

 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
index a6dbb1f485d8..9645861a858c 100644
--- a/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
@@ -339,7 +339,7 @@ ps_sio_adma: power-controller@230 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = "sio_adma";
-		power-domains = <&ps_sio>, <&ps_pms>;
+		power-domains = <&ps_sio>, <&ps_pms>, <&ps_audio_p>;
 	};
 
 	ps_aes: power-controller@238 {
-- 
2.35.1

