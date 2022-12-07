Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C57376
	for <asahi@lists.linux.dev>; Wed,  7 Dec 2022 01:43:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: linasend@asahilina.net)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 06BBC41F72;
	Wed,  7 Dec 2022 01:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
	s=default; t=1670377398;
	bh=OUQL2BwK22yCDGZU4/AGkA3BQUFil4yDcuraBSM6/Q0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=omNlpXQOoXIYIMWHUVP5k6HNLV5ZfkxIQeyWH0hWwT3WVQ/aHTnTsJ2jrQhRM6XX5
	 7TxmHeuifS2uLsnfLZcBlZzXm9WZiWwrRTikjrEFRJTKa0IpttgslzBOuEVWaNa33M
	 +3iLj3V5ThLV1IZ1eI3Pux1c3L+riMOGNUFXXhFQ4JSRgezCxSmZBwcTnBUCbJTFlc
	 nSxjFHGE/nOlz7GGkQ1kLnL7NW/V38AdqFdsSMScdSJ26p+wcpJhFiX1LeSpZIdXGl
	 HMMftdvUdT7DvvkRVXRc+s38FBwOQ8+rTXXBTyWnbvE4XipzU9amWRMYhaqF+xmSxh
	 efghuORndh2Rg==
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
Subject: [PATCH] arm64 dts: apple: t600x-pmgr: Fix search & replace typo
Date: Wed,  7 Dec 2022 10:43:05 +0900
Message-Id: <20221207014305.21018-2-lina@asahilina.net>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207014305.21018-1-lina@asahilina.net>
References: <20221207014305.21018-1-lina@asahilina.net>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It looks like the search-and-replace that happened to add die IDs to
the t600x PMGR tree was a little bit too eager on a comment, and nobody
noticed! Let's fix that.

Fixes: fa86294eb355 ("arm64: dts: apple: Add initial t6000/t6001/t6002 DTs")
Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 arch/arm64/boot/dts/apple/t600x-pmgr.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t600x-pmgr.dtsi b/arch/arm64/boot/dts/apple/t600x-pmgr.dtsi
index b8daeb0368d5..0bd44753b76a 100644
--- a/arch/arm64/boot/dts/apple/t600x-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-pmgr.dtsi
@@ -225,7 +225,7 @@ DIE_NODE(ps_afr): power-controller@1e8 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = DIE_LABEL(afr);
-		/* Apple Fabric, media DIE_NODE(stuff): this can power down */
+		/* Apple Fabric, media stuff: this can power down */
 	};
 
 	DIE_NODE(ps_afnc1_ioa): power-controller@1f0 {
-- 
2.35.1

