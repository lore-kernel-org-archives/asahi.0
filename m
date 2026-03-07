Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591CD3793BE
	for <asahi@lists.linux.dev>; Sat,  7 Mar 2026 22:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772922581; cv=none; b=J/MTcQLxqay+wn85Ck49PYdqknFRRUNlXXXhaTw35b6noLdMci9s2PV0IYHZsdxToJlLjhJgrjx1NM4JN8c9xeqcGZNmOZojY3tXZBk5Qemue3j5tB8vkn7BD7846PMsejvlgcEo/iwfK8J+DCwqfgsfp3HCWDxCZhY3N1DJ28Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772922581; c=relaxed/simple;
	bh=ww15vaTJjdZ7MrV/BXZpR/uprbDnj+9QEvykXyyCvbo=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=izMBD5Z6L8AHGmiKXv4f/cryGSfNNnKbwIXACMuiieB3Fss16PKBnpKx20lV9N17o9mxgweOcq4WXjqhQU/h5pvPCj0lKKldkjlNDmdms/xrIwkjf7Z1h2Ki7+2bCS/GsxxExnznPbjaag1Ehv37lMLfLYmyh5mLIIK/krMgb4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flordal.net; spf=pass smtp.mailfrom=flordal.net; dkim=pass (2048-bit key) header.d=flordal.net header.i=@flordal.net header.b=wQKDI2aL; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flordal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flordal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flordal.net header.i=@flordal.net header.b="wQKDI2aL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flordal.net;
	s=protonmail; t=1772922562; x=1773181762;
	bh=ww15vaTJjdZ7MrV/BXZpR/uprbDnj+9QEvykXyyCvbo=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=wQKDI2aLIaPjAENuzYajsCNO+yQsG0RO9Jv0tNEXkcUldxfkYXaPTowrzziI8z+C8
	 JGPoSynx1T/tfCxMLmb+RHiKBYakgLvBf4/A+QFqMzCZyRDnFCQM1i43FGDNtEKJfX
	 v09yqnphxPan7UCn56A4kPeJeTiiuRxq/R3jQCtbC1OZy3q+fN7FuFDMPqN18a0Iv+
	 pyXsD2wKss7nyoH/k2/P2v93I0erGYoJAAACfxY6kRLiLHEBqIQ5twYXceCysPOBOR
	 8ncvifYcva65FuV0zJ/58w8O5SErSqOowoL+2/GNbwzfPxHR18dMe5f8dHnzuhMlPh
	 zTB3OhpeOYrkw==
Date: Sat, 07 Mar 2026 22:29:17 +0000
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
From: Axel Flordal <axel@flordal.net>
Subject: [PATCH] arm64: dts: apple: fix spelling error
Message-ID: <2838895.vuYhMxLoTh@fedora>
Feedback-ID: 166586150:user:proton
X-Pm-Message-ID: 9ac85a73064bd3323c4451d6f38cf526ec28ef2f
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Change "configiguration" to "configuration".

Signed-off-by: Axel Flordal <axel@flordal.net>
---
 arch/arm64/boot/dts/apple/spi1-nvram.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi b/arch/arm64/boot/dt=
s/apple/spi1-nvram.dtsi
index 9740fbf200f0..d2720b307774 100644
--- a/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
+++ b/arch/arm64/boot/dts/apple/spi1-nvram.dtsi
@@ -2,7 +2,7 @@
 //
 // Devicetree include for common spi-nor nvram flash.
 //
-// Apple uses a consistent configiguration for the nvram on all known M1* =
and
+// Apple uses a consistent configuration for the nvram on all known M1* an=
d
 // M2* devices.
 //
 // Copyright The Asahi Linux Contributors
--=20
2.53.0




