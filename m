Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ADA256E
	for <asahi@lists.linux.dev>; Thu,  2 Jun 2022 17:42:32 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 5CE35320031A;
	Thu,  2 Jun 2022 13:42:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 02 Jun 2022 13:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1654191750; x=1654278150; bh=cvL9SEcO4X
	rzAEItTo8sQ83qSs8Uxjzv9TSBOoGmt2Y=; b=TeBIU2qeqDd6nKie+jZUnSL5WL
	tY4qti2AEn6kObPMQ/CwkYX7YFk4jH7XhN30sLh7qjSpylWKuuBWm6uXyk5N578H
	5l+g2cx8VydpHv7jw8r9o0q/SmVbiQFOeEmfQe8TO0gd3U0K86Za2JRo/TL4v8oU
	BYRHnqVjLNP6dQzy9e3xTnRcq9pREw6jzl4lIyTtWlR9+5nHT0dJFIGU8ToyIyBg
	6lbxr0yLAULc3Mc+uwa793q8bisYt/KICIXz44qkZm2RNo2HOyXfhw+2MyhdZLYX
	p+V78OLxJGx1FjRD/A9i3Q9ZnU39h8VMgSzJnsLEPY9wwvuorkQc5IKgWwpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1654191750; x=1654278150; bh=cvL9SEcO4XrzAEItTo8sQ83qSs8Uxjzv9TS
	BOoGmt2Y=; b=JaBT4j6ftjbjOF/niwspOQRpMEmQBCp1AWBeKKsMQA8OfCWPwxa
	7TvhXYe3NVkI3JFtxI6rOhu+LTjNlAMl+Mxy1oXaBIp5xME3vNkXztGSfgEa0KQN
	rekwC/Ry2/ZmKL5ouMlRf2aXb1rQx/fh14aIYj9ax7L3DBrNa9tKnUdLt+f+Trri
	UUhWW2sxpr3HLQjUde70d4uMQbcXV7DTyWU3ENBafhGUBI3MVnyNLaKb8kkjCbkB
	ice715C7p4utN/MqDn9CfsqTQqV6vi/8TejmOT/D9833vH95HolHBY1XQAirPP2U
	826ez8HF9hD9ik3fptTxxTkg+cgpP6oX7fQ==
X-ME-Sender: <xms:hvaYYpntM9XYHxGXfXzJlxHZqTmWtZNYPneuDai2F8dAxzsTDoSyaw>
    <xme:hvaYYk28lW2tdFtwCCF4BXjO4Y4MbzD_hs78_CGxfREgBLgodPpeKOxvBWwYLZl9X
    HhnTpZaSsDpGTegmsw>
X-ME-Received: <xmr:hvaYYvqySoTHWqBpI7UinuvaBmgGVxVlpG5Cusj8ZtaodeIvUIuznyEvRmWSu1Sqa6JW37vr0OsitAXBzjTf3hcXTW_BcH6ZdBjDWnI2kx2xFzAcqLPxWsxR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleefgddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuvhgvnhcurfgv
    thgvrhcuoehsvhgvnhesshhvvghnphgvthgvrhdruggvvheqnecuggftrfgrthhtvghrnh
    epleduffeiheeuvedtffevtdeuleeljeduudfgtedtvefhfeffvdfghfejhefgleelnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhvvghnse
    hsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:hvaYYpk89n-hD7EV2AvtufZm9Y8lvfim5spwB_bxnANLTA6l-OSNsw>
    <xmx:hvaYYn0HmX21zGsakGWTVBy3v3IAILxOBdJy3dEo1YtPvmGOXkVmxQ>
    <xmx:hvaYYosaBcXkUUJGK0UvK0MAz-xtGM-cJP-xGkLge6obrZEz2JT2FQ>
    <xmx:hvaYYsnzyiOAWMvQkwZPlEvJUpDa2dvinDDuBrGPzOojgsIo_FNp_A>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jun 2022 13:42:29 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: apple: Re-parent ANS2 power domains
Date: Thu,  2 Jun 2022 19:42:12 +0200
Message-Id: <20220602174213.2737-1-sven@svenpeter.dev>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hector Martin <marcan@marcan.st>

Turns out that the APCIE_ST*_SYS domains do hard-depend on ANS2, so
without this they refuse to power up.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Sven Peter <sven@svenpeter.dev>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 arch/arm64/boot/dts/apple/t8103-pmgr.dtsi | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
index fc51bc872468..a6dbb1f485d8 100644
--- a/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103-pmgr.dtsi
@@ -725,11 +725,6 @@ ps_ans2: power-controller@3f0 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = "ans2";
-		/*
-		 * The ADT makes ps_apcie_st depend on ps_ans2 instead, but this
-		 * doesn't make much sense since ANS2 uses APCIE_ST.
-		 */
-		power-domains = <&ps_apcie_st>;
 	};
 
 	ps_gfx: power-controller@3f8 {
@@ -836,7 +831,7 @@ ps_apcie_st: power-controller@418 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = "apcie_st";
-		power-domains = <&ps_apcie>;
+		power-domains = <&ps_apcie>, <&ps_ans2>;
 	};
 
 	ps_ane_sys: power-controller@470 {
-- 
2.25.1

