Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2950379C47;
	Fri, 21 Aug 2026 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787327147; cv=none; b=OZdCRJ7GfTvwz5K8HKiUbmHx7pHVgeG86tILrXW7OOVqmjpbK60CA91ncB/lBgKJH7bRmTKSGmYUVanielxyYTyHAPNbx/Qt9KbPADtoYz5zvgcOz8TLbHFbUGUqzbrOaJ/REGHMFYAR6Y7CnEGVfAryF2y5svqrxbkMcFpbDTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787327147; c=relaxed/simple;
	bh=10ZqKWSpLGh0HzriAEqbDWXJva1apqllME3fu+dUFeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WRXXr/XPdIS+VwmheXbqoUpMmGi5s1gNPjTrUbtNP5dK4szP/l4+l0t+QHl3cf99DXnhmKfHJcK2zoRu6OuKqo+X0+xX8BHfyqzp0wnFItjBBmk0vT0h8WKgm8Xt8fGs5Y/qr30hjjrDtBIk2gjSKLxnw1Il+Dx5n4VLOUuEP8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8Eo4jBm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8Eo4jBm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFF70C2BCFC;
	Fri, 21 Aug 2026 15:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787327146;
	bh=10ZqKWSpLGh0HzriAEqbDWXJva1apqllME3fu+dUFeM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a8Eo4jBm9qZkL2TSL/UxakR59bPpx2zvATIpYgQO6ijwHd0kTkAI2LSd3xLyOyVn8
	 JJGcMAIymE5IRwnIvfpPNPj0proUKyTST0g5Cl4lFfMdhrcOufGpVe+EZP5olBJ2aW
	 uZinZnbRrsrgrDr6SN5FOZeXranY5pj2zKPRZjmFYZhX1N3AN+M1+8c12ZgA2e6GGv
	 6Qa+HLTTg1+zRhk6LbAo0uT51JXzXV26lLjD9u2fCdnByWxTGqt0HEbECSDkRVcZch
	 RLBNFEBJZFPwGQhm5Z+1yIe3SL3rjwORPzesW6eNNFUpQuf/LIS1bX7fnjGdk4OsFN
	 kObyDr7o6EV/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AC6C5DF94;
	Fri, 21 Aug 2026 15:45:46 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Fri, 21 Aug 2026 17:44:56 +0200
Subject: [PATCH v2 3/3] arm64: dts: apple: Add CIO reset controllers
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-b4-cio-reset-v2-3-2d045f80a424@kernel.org>
References: <20260821-b4-cio-reset-v2-0-2d045f80a424@kernel.org>
In-Reply-To: <20260821-b4-cio-reset-v2-0-2d045f80a424@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3435; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=10ZqKWSpLGh0HzriAEqbDWXJva1apqllME3fu+dUFeM=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1ZH0YqvZ5x3yM7nvbH9yAOjhxUmXx3nrCkSyPyzYo3nQ
 Y4UBXb1jlIWBjEuBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEChcw/HfIC13CpbHhUOoH
 l4nunX8anJJTBS3C13ts7Sk5uFHzbBjDXwmeyyJyv7SMv9hWz4stP3CrOYGnYnGV86F/NxZ2fzl
 yiwEA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

Add the reset controllers used to start the CIO (USB4/Thunderbolt)
blocks on t8103 and t600x. On t8103 each port comes with a dedicated
register page represented as a standalone node. On t600x a single
register shared by all ports of a die is located in the middle of the
PMGR MMIO region and represented as a sub-node of its syscon.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi | 8 +++++++-
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi | 8 +++++++-
 arch/arm64/boot/dts/apple/t8103.dtsi      | 6 ++++++
 arch/arm64/boot/dts/apple/t8112.dtsi      | 6 ++++++
 4 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t600x-dieX.dtsi b/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
index 9676d5127039..5e163d756a7f 100644
--- a/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-dieX.dtsi
@@ -28,7 +28,13 @@ DIE_NODE(pmgr): power-management@28e080000 {
 		compatible = "apple,t6000-pmgr", "apple,pmgr", "syscon", "simple-mfd";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		reg = <0x2 0x8e080000 0 0x4000>;
+		reg = <0x2 0x8e080000 0 0x1c000>;
+
+		DIE_NODE(cio_reset): reset-controller@1a034 {
+			compatible = "apple,t6000-cio-reset";
+			reg = <0x1a034 0x4>;
+			#reset-cells = <1>;
+		};
 	};
 
 	DIE_NODE(pmgr_east): power-management@28e580000 {
diff --git a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
index ae3d535c5acb..fd4d572a04e7 100644
--- a/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
+++ b/arch/arm64/boot/dts/apple/t602x-dieX.dtsi
@@ -27,7 +27,13 @@ DIE_NODE(pmgr): power-management@28e080000 {
 		compatible = "apple,t6020-pmgr", "apple,t8103-pmgr", "syscon", "simple-mfd";
 		#address-cells = <1>;
 		#size-cells = <1>;
-		reg = <0x2 0x8e080000 0 0x8000>;
+		reg = <0x2 0x8e080000 0 0xc000>;
+
+		DIE_NODE(cio_reset): reset-controller@a02c {
+			compatible = "apple,t6020-cio-reset", "apple,t6000-cio-reset";
+			reg = <0xa02c 0x4>;
+			#reset-cells = <1>;
+		};
 	};
 
 	DIE_NODE(pmgr_south): power-management@28e680000 {
diff --git a/arch/arm64/boot/dts/apple/t8103.dtsi b/arch/arm64/boot/dts/apple/t8103.dtsi
index da774096b667..83f6f1003424 100644
--- a/arch/arm64/boot/dts/apple/t8103.dtsi
+++ b/arch/arm64/boot/dts/apple/t8103.dtsi
@@ -730,6 +730,12 @@ pmgr: power-management@23b700000 {
 			reg = <0x2 0x3b700000 0 0x14000>;
 		};
 
+		cio_reset: reset-controller@23b784000 {
+			compatible = "apple,t8103-cio-reset";
+			reg = <0x2 0x3b784000 0x0 0x8000>;
+			#reset-cells = <1>;
+		};
+
 		pinctrl_ap: pinctrl@23c100000 {
 			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3c100000 0x0 0x100000>;
diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index 85c47422d4e8..963030373a23 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -737,6 +737,12 @@ pmgr: power-management@23b700000 {
 			/* child nodes are added in t8103-pmgr.dtsi */
 		};
 
+		cio_reset: reset-controller@23b790000 {
+			compatible = "apple,t8112-cio-reset", "apple,t8103-cio-reset";
+			reg = <0x2 0x3b790000 0x0 0x8000>;
+			#reset-cells = <1>;
+		};
+
 		pinctrl_ap: pinctrl@23c100000 {
 			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3c100000 0x0 0x100000>;

-- 
2.55.0


