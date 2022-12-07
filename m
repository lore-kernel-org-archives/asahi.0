Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE18376
	for <asahi@lists.linux.dev>; Wed,  7 Dec 2022 01:43:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: linasend@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 26E8341F98;
	Wed,  7 Dec 2022 01:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1670377391;
	bh=oQYgSBif56vxQdHFPOTELw3/FtXZ0hY2uV7LPeyLQYs=;
	h=From:To:Cc:Subject:Date;
	b=HCE3UUQovp4m++sguRpMIpV5m8Chben63rZo237wf3Dc1927wq3OLdQWw1t266w9S
	 NZ1VVhw5roYnij+8QGPc/Zg4cGDTbG6LEkKL7EnfrGzbPXpbmhatlVLxGyZMOGbPSL
	 alW5AJBl+84fd9M5I/rwPnew4tfZ0q7zFiZjZLgx/gYIl5AX8WVQTvj1b2CAoIQNyQ
	 lUSkZnDaMK1ttxuYjm+/XAofHFL/oUmyXDuv7txjWlcyJU8I+UxWpmEFkY2DPe3AW5
	 TfIq9xaA7U3uU53NIz6BWwFN34rPGFK2F3a1hY35rWDal0jzXgzv59F4txcujdbjld
	 7h5egZNVWrrtw==
From: Asahi Lina <lina@asahilina.net>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Janne Grunau <j@jannau.net>
Cc: Marc Zyngier <maz@kernel.org>,
	asahi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Asahi Lina <lina@asahilina.net>
Subject: [PATCH] arm64: dts: apple: t6002: Fix GPU power domains
Date: Wed,  7 Dec 2022 10:43:04 +0900
Message-Id: <20221207014305.21018-1-lina@asahilina.net>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On t6002 (M1 Ultra), each die contains a self-contained GPU block.
However, only the coprocessor and global management circuitry of the
first die are used. This is what is represented by the "gpu" PS (the
one in die1 is disabled). Nonetheless, this shared component drives the
processing blocks in both dies, and therefore depends on the AFR fabric
being powered up on both dies.

Add an explicit dependency from the GPU block on die0 to AFR on die1,
next to the existing die0 AFR dependency.

Fixes: fa86294eb355 ("arm64: dts: apple: Add initial t6000/t6001/t6002 DTs")
Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 arch/arm64/boot/dts/apple/t6002.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6002.dtsi b/arch/arm64/boot/dts/apple/t6002.dtsi
index 1376103b49c6..8fa2d8dd72ff 100644
--- a/arch/arm64/boot/dts/apple/t6002.dtsi
+++ b/arch/arm64/boot/dts/apple/t6002.dtsi
@@ -296,3 +296,8 @@ &cpu_p20 &cpu_p21 &cpu_p22 &cpu_p23
 		};
 	};
 };
+
+&ps_gfx {
+	// On t6002, the die0 GPU power domain needs both AFR power domains
+	power-domains = <&ps_afr>, <&ps_afr_die1>;
+};
-- 
2.35.1

