Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878609;
	b=bOJLx/eyrLYEQtF7mQ2skJoLXxnKWHuMVL2qJR+Uir0NJ0IcUJcZQti49RQVFdFDS25p
	 eVSbYmHwzDJGxj5IzTgsm7+x1XEBXvKPUVNlJNRVaIBX+/GqzFusnWC4ik8IhGx6f5mEx
	 oU7VQc00u6dhBLrD6bpiae7uSD66R6mOJ22+JocvPGEhcY1nI+hDLujdOc0gQPfOkr29C
	 Nqto1p05oxliHPEiz8RW8xh6219nL1k2huFFWySthaFytuT1XKUN+oxrMgMFZyE59wULh
	 9zpabF5iA0jrOJ7IS3YOvpKU6rzMk4bVIwJZi+vv8OTmziUTm5lY10Sk9p1GikitlMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878609;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=XSVyiFNYfW4Nl2FRS/OfflMk2nhb+NruofA5umsuAro=;
	b=DmWIwcTgo6JY4NasPVrmddQzHrQH3axnrPUg4hWHj6ERfm6X2IDFN5lHXbxzymgweLip
	 quRpPlKqcNF6K6WiaI/TM49UbE6N7X1D7Qc2urpEAaKENRw95H7eU3GcFaJ2svILsSESL
	 6K91o1mVgfzVZy9oSMPtx2yrUs+Wj0acMBE/MvUj5Q6cI3So024viR02rzypi03E5StVa
	 KUPQHqcP0M57bLqC0K9yVDpsmYyB9xs9Z1g4uAShpGM0ANZO0ReGZvdYwbTWhXl90aqzs
	 x1BKWd5pJHdbFa2VJBB2XF0BOg8ci5vEjHfiVQsViVzU2qPOMFO+Mhd5GEoydUu4J/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b="dh/oXJNr";
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Cs3KuY0G;
	arc=none smtp.remote-ip=202.12.124.148
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B733E606D814
	for <asahi@lists.linux.dev>; Thu,  5 Nov 2026 11:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B733E606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=dh/oXJNr;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Cs3KuY0G
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 432A31D0015C
	for <asahi@lists.linux.dev>; Thu,  5 Nov 2026 06:36:48 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 05 Nov 2026 06:36:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793878605;
	 x=1793965005; bh=XSVyiFNYfW4Nl2FRS/OfflMk2nhb+NruofA5umsuAro=; b=
	dh/oXJNrMQ4QHPKSA2At6GLG5sLPFxNacET7lbATMxmwGPBpCNqm3sUCN9eEeLJg
	z7S1d5xHfIC0iHC2dt3W/2VBLgCixFORkc/wj1bVOQW6KzxOoXz/QjBb5v5oau3U
	l3Tt6WT5bWE83Hj7uE/PxsN2ncZTr6GAXh8AlKJ6uJlQRsbb8fEODLPfNKhb16Lz
	WA25victdm40cA6Jv9FK3qqrWSQoU03NjcTfbOJBtW4QOvhJoKCkmZ9C5zYgxyCt
	NiKV3nHIKyQvbudbZtkALqrlWd8iT+4JAwTSOfbyNJSP+2F74Rwh5ShLYnuvXD23
	WgbT9ck6XpiIKtTwvlVM7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793878605; x=
	1793965005; bh=XSVyiFNYfW4Nl2FRS/OfflMk2nhb+NruofA5umsuAro=; b=C
	s3KuY0GaEPsIOzxBW/FWhk/El/EPehtKxaq6hNyqZvW/xri4n7ixLqMqWWHgUMQv
	vNUt/7ZjLMbGzwXdHFeSc+MAA+K1VJV/9PLOqANuDDjH9kSjSAiBFLlqD/VxWA8S
	CQ5UrKuf5gGkau9DrMmDbWpmOHFrAKb9EVU5ozAGzIN3aWXEC7UmHIfysixm3OUo
	kUtYVw2D7q2YwWZdHKeDtMxVCmFHREmLgeiJm6ArLK21pgdLyf8bV1adEsKXdeV2
	1djv+KBg1lVaGKbquguVHoEno3QLm1nUs6BN3qCc/2lEvbPPf0O8u5q+q3PXGpdw
	/4P+IneD4pMx5Wv12CcwQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793878605; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=; rt=PGFzYWhpQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm1:rsa-sha256:ehnOceueNaOHct7idJw+/Qlv/6fdZkc8p4v5okusHBulZ5Z
	aDMUGtkOyBHDqg5h069kRGRAsZrPBzlKdkgi7+uycSohEGrBiEch/JGyiKdta90G
	0Ev2HHQeqI3RUAw66kJQSfvzGOEn7xLVa9CBZ+G5GeUWmvRAFcv+Rj8lKp1ZazN5
	NlD0UxZlpBTK8/R33yyOAweU9vVryezhVU3R8WZdc5mtN+yKPoW8+tEN+mPOc08H
	owxs47nXBKeC/fUfJ9qQFzxyrWs50RkRItUTioud/Fk1olc1ky+f078m93MkYhKt
	orKSe/0S1YbtnErQo4I+f1tO0Ft+/VLsXjwMxJg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:DIBoRpfwqRRRshR4iYw1v5Xig0iN2s5xbz1SxXao2l0=:5Ax+Tnl941iU4lcsG1LAxygu5i9bnuL5n1jpXo8dSZ8=;
X-ME-Sender: <xms:TWrsagHne1mwFQfErcgrJM5jrmwaMwhuNVoRdKkncYFSUtNy0GcMwg>
    <xme:TWrsaqvYUqAFHUvCSQYppozMdN2WPs3CYXypAZ3hfYTF_zdVI4e9bFO5Ys14vPswd
    EbnCICXz0gWbAefqZK6a01ervDmqWOO3B9InrowdTkf_UTCvr11CP-X>
X-ME-Received: <xmr:TWrsajaiSlXpEU92FeOTqlIix4pRZD572e44jqrVP5nCsi7KAPaG09yH6uELFM6B07X5447zpcR-ZzpdPci_8zsG5R1gQ_cP7dY>
X-ME-Proxy-Cause: dmFkZTFxL6fPj/83KjW+fPrzD7XIhU0ugn9J7NLmcT7qkhSOHV6Af82MPa5XBOzqpSBIeN
    Pp7p8OyM+TI/GES+hrNz1pWoLtoPr0PQyTaY9NPuTzBRGPiAAcJ3TBtaGIGFJ6EIOXXhvi
    OmWkGixLiwFSU5Ji8fLekxxR6EJsv6volK4Aa+XkeiLpTkZTvhHs0PqHDFrfqL/zb/0ZP3
    9znFWT6W8alLK2f1H3T6MWoAM3iYPGn74enSenY1WYKm4dI7WWKEv57BXjNOh+/gVX8bJw
    C1jhLxJz5rZaO//peRzsXKtK782l6mQSftbsv/PkoCji5Zyj+60teGD5l3K8E1b3VAFAjI
    sepznW++v/oO8DQNDri5/2KZRaYnF4UXUN2PgpunE0prH7Q+qtl8QGYkTkwDXchUeh3pTe
    PXX8W1I00vXFDogD3e/Bko60udJtrKCJMYFPHxm1qXvep9kTJ1BNx28YkqzyTCDIZjsv+q
    FzLDCV0/utyRnSGUWuDtxC2oBO7EtMxUk0Uo2DpaZxOzmJ/ZJO+8ERU4QrKw1ZCV689JKS
    oeIsZIenpmL6SmNQ6gGh3/2pJGA5gGYR8Zk28W608WtSXSyKHCn7QxwQE7yGljMtWTpOwj
    NJRmMYiTkbHdsKuXsKW1QwFVtQoB7TSo0y8CvdufhFgaIzezPPBT06EzgCVQ
X-ME-Proxy: <xmx:TWrsaqVLQsB0tIQg3zU0dVM3f7q2GTUs2PIso7JwpkIOZ2dPtkTHuw>
    <xmx:TWrsatJ88lONKSGcmNmwlYMb3g71e-ToVH2uZ0UudqdKlWrixYyVFQ>
    <xmx:TWrsagEv39xFJweqIlWFgl_tebdrMpFFQsW8VJAQB6_LYfruE8XxIA>
    <xmx:TWrsaqw7HXTwz0af7U7EruXkFIyLRDtgKrZpSqxSZChxOL-N80PnGA>
    <xmx:TWrsakFJbMP7m8cSCSgmB3G2wSBQw7Ar33lLeUI3gOqJf3FuhmUBJTzu>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 06:36:45 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Thu, 05 Nov 2026 12:36:04 +0100
Subject: [PATCH 7/7] arm64: dts: apple: t6032-j575d: Add PCIe device nodes
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
Message-Id: <20261105-apple-m3-pcie-v1-7-e00a72a604f8@jannau.net>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2348; i=j@jannau.net;
 h=from:subject:message-id; bh=5Ax+Tnl941iU4lcsG1LAxygu5i9bnuL5n1jpXo8dSZ8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqw3WZpzHHXSnps/rf+7TKpM+tbxf95ZR43F5euUvJb7i
 ZaseGnfMZGFQYyLwVJMkSVJ+2UHw+oaxZjaB2Ewc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6xjhEDF6cATLX6b4b/fncrU9+zsgRWRVkHy00ue7zsrezrzZ86GZYnnQ8Rj2MzZ/ifzNSpaaR
 z+99qr/UTowzX8Mp/yWzx7TXvm79V7MMbTgYWAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Add WiFi, Bluetooth, SD-Card reader, ethernet NIC and USB xHCI device
nodes for M3 Ultra Mac Studio.
The bootloader will fill MAC addresses for the network devices, add
Wifi and Bluetooth calibration data and set "apple,antenna-sku".

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6032-j575d.dts | 72 +++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t6032-j575d.dts b/arch/arm64/boot/dts/apple/t6032-j575d.dts
index 12991546d4bb..f99fd47dfc8d 100644
--- a/arch/arm64/boot/dts/apple/t6032-j575d.dts
+++ b/arch/arm64/boot/dts/apple/t6032-j575d.dts
@@ -16,7 +16,10 @@ / {
 	model = "Apple Mac Studio (M3 Ultra, 2025)";
 
 	aliases {
+		bluetooth0 = &bluetooth0;
+		ethernet0 = &ethernet0;
 		serial0 = &serial0;
+		wifi0 = &wifi0;
 	};
 
 	chosen {
@@ -46,3 +49,72 @@ memory@10000000000 {
 &serial0 {
 	status = "okay";
 };
+
+/* PCIe devices */
+
+/*
+ * Force the bus number assignments so that we can declare some of the
+ * on-board devices and properties that are populated by the bootloader
+ * (such as MAC addresses).
+ */
+&port00 {
+	/* WLAN */
+	bus-range = <1 1>;
+
+	wifi0: wifi@0,0 {
+		compatible = "pci14e4,4433";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		/* To be filled by the loader */
+		local-mac-address = [00 10 18 00 00 10];
+		apple,antenna-sku = "XX";
+		brcm,board-type = "apple,aruba";
+	};
+
+	bluetooth0: bluetooth@0,1 {
+		compatible = "pci14e4,5f71";
+		reg = <0x10100 0x0 0x0 0x0 0x0>;
+		/* To be filled by the loader */
+		local-bd-address = [00 00 00 00 00 00];
+		brcm,board-type = "apple,aruba";
+	};
+};
+
+&port01 {
+	/* SD card reader */
+	bus-range = <2 2>;
+
+	mmc@0,0 {
+		compatible = "pci17a0,9755";
+		reg = <0x20000 0x0 0x0 0x0 0x0>;
+		cd-inverted;
+		wp-inverted;
+	};
+};
+
+&port02 {
+	/* AQC113 10 Gbit Ethernet */
+	bus-range = <3 3>;
+	status = "okay";
+
+	ethernet0: ethernet@0,0 {
+		compatible = "pci1d6a,04c0";
+		reg = <0x30000 0x0 0x0 0x0 0x0>;
+		/* To be filled by the loader */
+		local-mac-address = [00 10 18 00 00 00];
+	};
+};
+
+&port03 {
+	/* USB xHCI */
+	bus-range = <4 4>;
+	status = "okay";
+};
+
+
+&pcie0_dart_2 {
+	status = "okay";
+};
+
+&pcie0_dart_3 {
+	status = "okay";
+};

-- 
2.56.0

