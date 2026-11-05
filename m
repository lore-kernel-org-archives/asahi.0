Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878581;
	b=YzaLbEQOUnWhobEtc8YVQ3++VN/xiCFsmXDeKlKi+TueMPJ2Bkl6hl4+qnOmRbajWU9u
	 8wPgfL0RXqSIwu0kzA+TJh4cCCZzenngMcaeAU6DZt66vMLbggzFRefGc3og9YLyzlx63
	 zuXV8CQ4MASXdEczMpo66tVaNMkUGOXQjSAoUnbbScutgHT8wXvHq5m7Ch7+38wPZw3fP
	 +6MBbPQaHenxh6S4r0LXUUOSQQmEccoJHSD7tXEC3ZxhvppP4d56LNgfMNHI2zxY+DZVO
	 Lpv81fMIoNxPAiBGfZfj7iT0dihJM4wb0hmGtpas/VhP0TzS4l30svpX/9uK3zarqfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878581;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=woCjHpIzbFmhHn2FzYvCeJCH86EIjicWwYTiJAIuiP0=;
	b=h2p9bl4dOBL1K/YixXWH0N8m8hM7Le4Io/EVOXQuXk/PV032dU6SUeUVYsnF9JeUKQQV
	 mKDb3KsfrOZiujZBUbg4nTGnZP56B61ov9+5HKDbm7L71dLfO/EXKWALq41gLfDjTyT2B
	 7buBsdphTbGrmzwvj2S1vkuZHCAd+WpQYzohxmUclooCsZGcNQrjz5ug4/auXSNLS828g
	 HalqEU4KrQuBufGICatRcZ0QgZx/01qkP7bid2in5OE++AbOUQQ6CAWlLmB9Vr0W5CPIa
	 9xXIhNdeJRBT9nezYGEMlt5zwhd37Olp7dKZXTGSKLlwn/+R1x7czhTt6I9HfXr02eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=a7hDHAvp;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=k0xJz9F6;
	arc=none smtp.remote-ip=202.12.124.148
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED6E606A336
	for <asahi@lists.linux.dev>; Thu,  5 Nov 2026 11:36:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED6E606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=a7hDHAvp;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=k0xJz9F6
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 28F571D0016E
	for <asahi@lists.linux.dev>; Thu,  5 Nov 2026 06:36:20 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 05 Nov 2026 06:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793878577;
	 x=1793964977; bh=woCjHpIzbFmhHn2FzYvCeJCH86EIjicWwYTiJAIuiP0=; b=
	a7hDHAvp6iGQl/VgWJxoPh0gFBRnnmenV+cS26b/0Ma4p+uLjZu8gXdUWAaOBUAe
	C6BcgM5N+W7lngeN+YUYBDmUbuYNGIi6bUL/OqeEByc3RLyT/TCMFpxZDHn1idFu
	cBx+yy8BjDIgUMsoFbHISIROD/spoaoEsHqhh6WH1GnFlHh/WTb2e6fbz/3Yufsx
	CMJS0H6SX2o8uqasyQqCpwWcmwE78icwe43ombtUfwU9QKm9hvYDwFPjheAPwi9n
	b5S2q3EpoqO7Y/e5qD5wwS9efooK5rrUz5FW8OlC5UK2c9jIArMaLEOixM4Mn5LQ
	WEIyE5q9ipgz18Bva0MaoA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793878577; x=
	1793964977; bh=woCjHpIzbFmhHn2FzYvCeJCH86EIjicWwYTiJAIuiP0=; b=k
	0xJz9F6EhElOEFYFigQ8Mdq5OVyDn9nDK9j/yttJrKsgSUdIrD0V+W0Qj/G0n3gS
	rJXxIPxlwdBvfZVq6ROzDMBAEZ7MHEGCZAN+2T3ay8+DHQGWdhPwCmVMomDcMMaW
	vjXhZNKUpA8pOahsiQQTBROKV+nU6HJ7sY+T3EsgwsnFDbvgCTstaFRnsaTxK4Oj
	p/bZO9jLZFWL/KztD+0VAao9tAcbOTPL4L7j791EH8cpfdzZn6IAjD1nC9XNkixZ
	enxD5yUlQTevZV4QEsc7/BJwvMZRkQzl4WHvPCM0yipBT+BdLspg3YAYuEpuhLRH
	T9QZSnjgOmSS8NInCNLFA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793878577; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PGFzYWhpQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm1:rsa-sha256:LNxbZVw8q7du73tPVyMM/6a26tybhmeIFx1tPHUhZumeghK
	nsC7mdfhA2cVoSVMt6HayCeac3wT1emJDhyJs3DDOsDFAuLPdyrA2Jd19sH45JOs
	zeoBySAdYWcX4LcYQ4C09l+xmVj1vNMeW8EmUb0iHp9BAl7xmNYs26o1QfcMU4WR
	T62bsBiW5/Rk4IkOySAHtCI09mdYf8qSrHK3MuS1s9ehhfX0jMEFRFb7wTQb7ozD
	nRtPdKZ6cuyQ9D5aoebZZWt5Dcsh97dcAcEb2cIA6uKuvmWwAeCHLy82qe5T/uFd
	glnF11UFAb/u+2YPsiR7S1jTvj5J12f/5b8CoRQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:cClI5K0OhrlsXlcTkzwItiqWTa9zdVFH/mNK0aype/w=:4YuJB7yJn3hvOe+uv0QUJ7U19Zk9FgiQxUYecbj5q5o=;
X-ME-Sender: <xms:MWrsaiD-FkQr3vvIVxwnzOquTpvelrtwGb0IpQ56dw05ShOs377WvA>
    <xme:MWrsat6KtQ3_6kB0RwzBNpBsXtz3KyR-u-Ke5EruTdxkGqodywOrVtkBdqcCs3mGx
    PbtbIGecLqgmby7S-BFO0mO-Ns2wx23v1CChIRiBggYHjBgtxVWOnLp>
X-ME-Received: <xmr:MWrsau1TbhUFJQcOiP1bt5IejgRx2gQbEf5ApejG1JQoekddmRmMzfT3eqdb0vNUVKsC4U08VezPBinNbxNAfVykxbtc-Sl3vo0>
X-ME-Proxy-Cause: dmFkZTG2SUO3JG85xCfjmNnh4lRW2W10GxrhMDsYtjMEXNviJUCuz1KkOTClIZmZNlc4qF
    sBzABO3Hu9mM/E6Wo7sUNWSAhxQM/sNz3mTs2mHCzcd/mtE2TcaBT51oE220dDOc38ULk2
    P2jSElP2khLz9YVxz9Uisd1BVbNhQ7QxZrO21vDvwE3DJ2OLliM/K4W4p4t06Gx2ct1KfW
    D40Nbem3eEsLUZEEaYf0FX86ht4Csqqww6G0XPE84wg5LO5Z5UnDRA+06s3TE5V0KZDQFz
    Y3dXAZB/w9jEq241SmtR8vWmC1ny1SvPeU/lUeRWjuya6hYM92ViDOFx+ei6QOJboktXkR
    UsIIAV7usvfOlJS7stIuevwpV+XjgbxlJBilNG/j0R4pfhzTR7gsLHLzconhcT2H1U2cbn
    oQT4TZk6JS53Hkv0jgz6Q7GNNdHYn0cbroGUPMXG6eJJnSO9TnN/n6rXO65hXeehBGyiMM
    GEcIbY3YvyWTmT/+XQY/lMApdlbyQM0ncwaWK6tMN4iQkwMKhqrJX5af3RU2FxuYYPMNYJ
    mQIVtSFD6AyAhix/TbCyWfu1QPW8Iw0WwyhBjNhRpVDhTOoYprE+WxAsIXEvAYgmlqKMtY
    7/1j1shXNhyXAnCaSkF+U94Gg1exFSHfEgGxPbJIi0HKb4JS4g2+N+kLkZfw
X-ME-Proxy: <xmx:MWrsapBg0yd2G7Fh4Tn74g3ER6b-brWrGYj7jYI_gjDXrguON_LOEQ>
    <xmx:MWrsauGGJ9jWwhBczf8J1xs_n3K0lJ33p6VN6_-XaAWw0xbrETBo6A>
    <xmx:MWrsamTxURatf9Gb0V2i-nZt16-6ZV398cVTv2YK749Ic3vdF01uxA>
    <xmx:MWrsatPx4hE1KkCQ4o1yTJ2RKfVucohUUPVAgqNl8bjXWiTd4-CxGg>
    <xmx:MWrsapDWmkP7b4M9mzB3-Pu3972rlvt275lqxTnqDgtaJfL51gmVvRxB>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 06:36:16 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Thu, 05 Nov 2026 12:35:58 +0100
Subject: [PATCH 1/7] arm64: dts: apple: t8122: Keep ps_apcie_phy_sw
 always-on
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Post: <mailto:asahi@lists.linux.dev>
List-Help: <mailto:asahi+help@lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:asahi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-apple-m3-pcie-v1-1-e00a72a604f8@jannau.net>
References: <20261105-apple-m3-pcie-v1-0-e00a72a604f8@jannau.net>
In-Reply-To: <20261105-apple-m3-pcie-v1-0-e00a72a604f8@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Joshua Peisach <jpeisach@ubuntu.com>, 
 Michael Reeves <michael.reeves077@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1044; i=j@jannau.net;
 h=from:subject:message-id; bh=4YuJB7yJn3hvOe+uv0QUJ7U19Zk9FgiQxUYecbj5q5o=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqw3WepiK+12yauLnju570ZAQNFek8lmP82WpHfwPPkwS
 frv4fK1HRNZGMS4GCzFFFmStF92MKyuUYypfRAGM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRffsnwT/sKI/OUN6ta+04ZX/wXUJW/pl75qfGJm9xb52W+mXn57wyGv3I/3k/
 hLvm4RzNhqYHfkz0tx9N9j/3UyNk/f+py3pwmHy4A
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The APCIE_PHY_SW power state is in Apple's device tree a child of the
virtual storage and general purpose PCIe power-states. MacOS however
keeps it always powered on. Mirror this behaviour like the M2 Pro/Max
device trees already do in t602x-pgmr.dtsi.

Fixes: c65ab4905e58 ("arm64: dts: apple: Initial t8122 (M3) device trees")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122-pmgr.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
index 3f8be74b5ea8..3206787dd208 100644
--- a/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122-pmgr.dtsi
@@ -899,7 +899,7 @@ ps_apcie_phy_sw: power-controller@4a0 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = "apcie_phy_sw";
-		power-domains = <&ps_apcie_st>, <&ps_apcie_gp>;
+		apple,always-on; /* macOS does not turn this off */
 	};
 
 	ps_atc0_cio_pcie: power-controller@4a8 {

-- 
2.56.0

