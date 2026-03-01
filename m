Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798A525DB1C;
	Sun,  1 Mar 2026 01:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327978; cv=none; b=giPlxoM81gRb6OTPvBIk9Wabm6uAXIMfVqXpL1kFeZwMgnKBXPSJCvS0CuFypk495S5YRzLfDjSLmKTVcNZlsprjNnEAFEa3nTFCQtFRJh1rsLcs3TugfGsCuSHbWD0BdFUdsc9kH6kYibXO7LEYGgznOUV3hQsGsddXGutfktw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327978; c=relaxed/simple;
	bh=vEG88Hyk00Tafp4vt7H+O1aYyWOVvOlo+WTwnXnHFrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jBapP16kwiDuFVo4TruBqibbn6AhHFSCBvyB9VyKCMWT6lvwiT3WPbchfrnpVT5LRg8n50NFaRLXnPQkAiYJ/JA8qxCm9/OqkIeyFV0SgdQRq9m9pA47MReVNrLDCmbDiFjp6phdCgQT5H2xigsO1PpOsGvdBbkXOpcZXLTq4h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFJUEOOT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFJUEOOT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5B29C2BC86;
	Sun,  1 Mar 2026 01:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327978;
	bh=vEG88Hyk00Tafp4vt7H+O1aYyWOVvOlo+WTwnXnHFrc=;
	h=From:To:Cc:Subject:Date:From;
	b=BFJUEOOTZKKH6agKey1YkwxxawmhTlHLzgRuRffnWcnAH2YSAZKvA39s0vVP1TVV5
	 GY8CFYRwW/y1bL4axXJbM+giBPhYh7zGlVl/R9jIHVjtbA3993qTSbPjgdsqhYFC/a
	 bxAndcPzVL4f/JaSx1XHVdSYWaSw2F8eoRb0DV7c3KiRmO4vYDsfzSfv7hrC/7FX9J
	 CD2VjoC4qtOU/pLOsDOjRUUrBVyDHCV/9GKNe5gXG0L/Hnh2r8E7puMgX3jRG88irE
	 BN15LkUTf8RWCzTqW7iV+xKMrIrJb1iXiy8oKA977HUdp0bgU7qHH39tGNSgxrxS+i
	 MJL9zQSW7WMsA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	j@jannau.net
Cc: Sven Peter <sven@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: FAILED: Patch "arm64: dts: apple: t8112-j473: Keep the HDMI port powered on" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:19:36 -0500
Message-ID: <20260301011936.1674726-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 3e4e729325131fe6f7473a0673f7d8cdde53f5a0 Mon Sep 17 00:00:00 2001
From: Janne Grunau <j@jannau.net>
Date: Thu, 8 Jan 2026 22:04:01 +0100
Subject: [PATCH] arm64: dts: apple: t8112-j473: Keep the HDMI port powered on

Add the display controller and DPTX phy power-domains to the framebuffer
node to keep the framebuffer and display out working after device probing
finished.
The OS has more control about the display pipeline used for the HDMI
output on M2 based devices. The HDMI output is driven by an integrated
DisplayPort to HDMI converter (Parade PS190). The DPTX phy is now
controlled by the OS and no longer by firmware running on the display
co-processor. This allows using the second display controller on the
second USB type-c port or tunneling 2 DisplayPort connections over
USB4/Thunderbolt.
The m1n1 bootloader uses the second display controller to drive the HDMI
output. Adjust for this difference compared to the notebooks as well.

Fixes: 2d5ce3fbef32 ("arm64: dts: apple: t8112: Initial t8112 (M2) device trees")
Cc: stable@vger.kernel.org
Signed-off-by: Janne Grunau <j@jannau.net>
Link: https://patch.msgid.link/20260108-apple-dt-pmgr-fixes-v1-1-cfdce629c0a8@jannau.net
Signed-off-by: Sven Peter <sven@kernel.org>
---
 arch/arm64/boot/dts/apple/t8112-j473.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112-j473.dts b/arch/arm64/boot/dts/apple/t8112-j473.dts
index a05951e91a022..bfa959023a0db 100644
--- a/arch/arm64/boot/dts/apple/t8112-j473.dts
+++ b/arch/arm64/boot/dts/apple/t8112-j473.dts
@@ -22,6 +22,25 @@ aliases {
 	};
 };
 
+/*
+ * Keep the power-domains used for the HDMI port on.
+ */
+&framebuffer0 {
+	power-domains = <&ps_dispext_cpu0>, <&ps_dptx_ext_phy>;
+};
+
+/*
+ * The M2 Mac mini uses dispext for the HDMI output so it's not necessary to
+ * keep disp0 power-domains always-on.
+ */
+&ps_disp0_sys {
+	/delete-property/ apple,always-on;
+};
+
+&ps_disp0_fe {
+	/delete-property/ apple,always-on;
+};
+
 /*
  * Force the bus number assignments so that we can declare some of the
  * on-board devices and properties that are populated by the bootloader
-- 
2.51.0




