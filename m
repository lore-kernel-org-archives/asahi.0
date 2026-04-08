Received: from mail-4318.protonmail.ch (mail-4318.protonmail.ch [185.70.43.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9847356A37
	for <asahi@lists.linux.dev>; Wed,  8 Apr 2026 07:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775632894; cv=none; b=rEGBmNwhH5fZah2grZEngKll129lulhLHn3BVkDv9t1N7PF7FPcwBpa7DxRo7bQhnIF9fivKWcxZBcnHVETGEG1+Hroxyf7PKFZavM+eWbDeTXSrkqN2NhVzZ8cF5dimBH485vCQ16Cw3/9PBES7WG9yvA5CHJFSH2DMUijC43s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775632894; c=relaxed/simple;
	bh=MbOGGRZRGKUC9wg/u4bagIerJWK0O28aWsRrCdAdIQM=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A0XPvJqCAcd85ojbdE8IAnzVopDXiA25MWYkdbYpvB0VK7r/PXIlJYwJnMeGRdDwB/nZfLoXnKTSbBqFxbxdPcx9l0u8vWydj8GKL85u4js7Hlz3JE1Jw4IGKXxPzHth8+ebUat8Od+4WcNF0aWYkHjD/0LT6hkwDyLPaArb7CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flordal.net; spf=pass smtp.mailfrom=flordal.net; dkim=pass (2048-bit key) header.d=flordal.net header.i=@flordal.net header.b=lQGO3y3Y; arc=none smtp.client-ip=185.70.43.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flordal.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flordal.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flordal.net header.i=@flordal.net header.b="lQGO3y3Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flordal.net;
	s=protonmail; t=1775632888; x=1775892088;
	bh=MbOGGRZRGKUC9wg/u4bagIerJWK0O28aWsRrCdAdIQM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lQGO3y3YMaCA8kDO8TvKmTevFk/tJrkj/WdjGhLen9DlP89s0Y99bZnZy8tvJ1jSw
	 rN2cl0J9WKuaOI5u2qLMOWqPNmkMIT4eRaC+jSmcVFbxwT5kko1EuoBZrVM15QVYlI
	 IA+TuIW0v+51qKLl4ZlozYBkbaK+z25l+yrTUu0CnJ+y6P6r9JvhvwBUNipBbqMbyd
	 5w7aDY4hATuRHvlBv9aDplAppb7JzGrjspnHj1bGBen3Fo1JMVs3bnhF3sGA+o5b8Z
	 sJTcm637R5yS8dbupZaTloI4oi1p01mjELU2d/7cjeeBdyHvf8+TfdGVy2kyBC8Scs
	 ORDCnAc4Pn/fA==
Date: Wed, 08 Apr 2026 07:21:23 +0000
To: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
From: Axel Flordal <axel@flordal.net>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH RESEND] arm64: dts: apple: fix spelling error
Message-ID: <2338500.vFx2qVVIhK@fedora>
Feedback-ID: 166586150:user:proton
X-Pm-Message-ID: c48aabe3f901b14e1434363741495137f986d95f
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Change "configiguration" to "configuration".

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Axel Flordal <axel@flordal.net>
---
Original patch: https://lore.kernel.org/asahi/CAEg-Je-KwNNGoi3mpPeNq3Jmtzj_=
5seuj1Qeh2_1dt994iCJSA@mail.gmail.com/T/#t
If this is unwanted I of course won't send again.
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





