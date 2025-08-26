Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911DC33CE97
	for <asahi@lists.linux.dev>; Tue, 26 Aug 2025 12:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756210206; cv=none; b=ls120xZZvd9QxpEhiv6m6e1Ct41ccqUzi3wHSzRkYTIkthHTYkNiF9gq55asmulj7EoKawXU0pxfJKX4dwZ22/C2csUpJoS8mf2/FQREH73UIoqNrBBRVAeQAHVBduDoEWqk/L6g7T1Otr45h/aCASd1TZE9vIAgxBRRO2EsueA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756210206; c=relaxed/simple;
	bh=n0GU3aHOIbzcpxdfkfvKoQ2JdbUFCoeF/xHA7QnVC2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OW46dJVECc6e6Xn+QMxOcg2xRM9w7yMSHEkNNiy+tDb2TLnD0bWoPIBGQ+t/J95wMwRunOGqPHezYeLX2I+ExTb8tnKiXg9eGGz5SaZK9IypnezvrCH+n5TiT1sZj/m6i/EIlWlh5GvtOyExeMYRy5y4L/lzPs6e5vYYhKtL8Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUB+ATJl; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUB+ATJl"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-324fb2bb099so4098828a91.3
        for <asahi@lists.linux.dev>; Tue, 26 Aug 2025 05:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756210204; x=1756815004; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLgKkUt/EORHceeO89abTN08otZovq/goeI6WeVPzj4=;
        b=jUB+ATJl2HTcEwQcyPy4rzId61KXJHORK8AyncbVu1V0jKtGAZKvUIPmYY0FvB+J7N
         F3yqva0Pi7Kf9EgtTfOe2vj3JAlIr5Hw+VHaajBwk882pQ4mtgiyiLYFKW6Nc0AEcT/6
         pAMm/+Nkvwkn9uaprdn7TmZD0/dw5czR6LxbpEGYvzu1TurfYMVS12QIDhNO547BU2MJ
         gaDA01TI9qusysu0VQnPj4WlKgE+i/E4ldnz/0CC+rga4jioNzPue0Ood7ZgnMWeIFGb
         VAGp986x5+pwMBfRHWqYt2vXoHltOYBso+Ay63DEHZv08MGK8Rr24U+fwLTE/lTah2Ax
         eMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756210204; x=1756815004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLgKkUt/EORHceeO89abTN08otZovq/goeI6WeVPzj4=;
        b=T74pmbnJa9Z2V/96vNdX6z2Arx3ylNnAUOxjCleWTNyuHSJo7kpYPhNuFsNc4X5OHZ
         YnfO4uMpBuQo5b8pFWVPVw+NXymASyzcDn2ejJjM11TEdgL5pr/8Z9KfpWSabhIoVE2n
         6RzqUuaQR71uxDvM4ZamACtq89JQVTDbNBlQowUnTI61MDV0uRa5UnsH44JD+AYt2iBU
         aY9vWCquTvS0/aYNDN+x7FYLfPXMMdOMoMZviHJwqQYHbgbCXKS5P4t45KYgZCj4IbK3
         zIu67cYfQynTS0JQ/qUplelq4WM6GjW05SQaYJn891N467B1AS3M5ba6R8yralDVrY7j
         pzMw==
X-Gm-Message-State: AOJu0YxxwU9yb7y3bd6gocvYh3/x4+lirJeUSIGyHG2g8XrMHmowPvQq
	Ti/fUM23uE+LTd0MaMJht1xn7bW4Rv7zBXVV6CwGw7Ur4/t7Kj+hxD2p
X-Gm-Gg: ASbGnctcPMa7FSw1a3bGCF8G8OdKBWIQLAHL105VKEaH3xVIzpZNKOrbF6JY3rPnNv/
	82kc6XxhUGD2ci/+fFuZ9fZfEDQZtAohbMBL1cOOLjK0veP43uGXy8QjseBgJPIOtu/390gQ2jy
	gi0Egu/Qw4L25T0nsSiRGw0BCh0z/6zxb2y/MzbxdyB1qYdcdrw5+u9/rG4WubAEWgWO7C1eo68
	tnf0T8113ijnGN2sJkKr+r/QM+bwDc0SHhZ4MhD2fgP1zlJartiuG0VoOV+VQukR2IjSSsN1qRP
	DUPCl9w/BV/ST8+7jSvdGMGNYEU6dpvZUX67eJ2zZQO7+gWuUrTKpsfMNWGpexKw+fNY7e8fLu1
	g5PnycIeFJyXfS0rrpimVhissB/c=
X-Google-Smtp-Source: AGHT+IGWgie8ZS02lLq0YJgxOyT9OhF17cJYHT5FMDsYYjsiJPCGQK8BxGNo1tID5Q6Dk0AkG/0Bgw==
X-Received: by 2002:a17:90b:514f:b0:324:e6ea:f959 with SMTP id 98e67ed59e1d1-32515ed12b6mr20451822a91.14.1756210203424;
        Tue, 26 Aug 2025 05:10:03 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-327565d3924sm619966a91.13.2025.08.26.05.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 05:10:03 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 26 Aug 2025 20:09:15 +0800
Subject: [PATCH v5 4/4] arm64: dts: apple: t8015: Add NVMe nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-t8015-nvme-v5-4-caee6ab00144@gmail.com>
References: <20250826-t8015-nvme-v5-0-caee6ab00144@gmail.com>
In-Reply-To: <20250826-t8015-nvme-v5-0-caee6ab00144@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Keith Busch <kbusch@kernel.org>, 
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-nvme@lists.infradead.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1720; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=n0GU3aHOIbzcpxdfkfvKoQ2JdbUFCoeF/xHA7QnVC2k=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoraQDdi3xvWrgtoq+xYU0KaEpYAJiSJed9pe6Y
 /L5WzRkEjeJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaK2kAwAKCRABygi3psUI
 JB1eD/9FRaF5x0qOcvMaYKSiP6C7NrIQ2IRtHgqkthJk9bKAJo/6jVT9USMx+2fBKj3XVOlHGd4
 B7k3kwLSivIH7/Jxmhmu8nBktrbBnan5KWHiM24HnMrNompcQOIVKpCrJFlCWdma8sysAdG1w/P
 wCI4oZr+FlHtyx4aIF2e/mqOUe2xB5YuKlcAkZJ3s6x7NdzlY7vPTFatiPFGQxnWt5D2oFgextM
 cpPFRw80SmudDzweipUKE3+XyWBq6x9Q5VHE8xz8B1vbvDYh7rdFy6zrW+Tk2Wq2UdnsC+G+B6N
 lAEUDJscdVObCSnCinkxUnqYBb7322jSRX7ew/QrgJRrZkMMgoPeiXqvyVaYRJvVgvJO8avtqKR
 8z9KTqP805PtPTpUXsKmjUOQ+xv1bX5dKlhm9+COAwZQNU2D/5JdPqaf71T722PZNsqD5rsIvW6
 Jj7h2LBjsMq21c4EnpSN4Si+iXHUYKo4pkrS+WzIlE1KH7oeQymatyKCowleF4N2IaD/JoJ3B6u
 tTFEdXikWWk9WGngv5wQTUgYKVPuGE5YoGLRW5ZMzsjpWxwbRMgIn/gbrmzt/i8FtQQf57t7RLy
 PZuGQjW2ja7ri7RIjWULGqlcUBwH0Re7h5kta5xXw7DlnwsF1tLY3DQIx3shq7tmy23tw5oPOZr
 uKVWm1K9alCgZKA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add nodes for NVMe and associated mailbox and sart for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 12acf8fc8bc6bcde6b11773cadd97e9ee115f510..84acf2839fb6279dcc956e1f4cee1afa909d2f27 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -402,6 +402,40 @@ pinctrl_smc: pinctrl@236024000 {
 			 */
 			status = "disabled";
 		};
+
+		ans_mbox: mbox@257008000 {
+			compatible = "apple,t8015-asc-mailbox";
+			reg = <0x2 0x57008000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 265 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 266 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 267 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+				"recv-empty", "recv-not-empty";
+			#mbox-cells = <0>;
+			power-domains = <&ps_ans2>;
+		};
+
+		sart: iommu@259c50000 {
+			compatible = "apple,t8015-sart";
+			reg = <0x2 0x59c50000 0x0 0x10000>;
+			power-domains = <&ps_ans2>;
+		};
+
+		nvme@259cc0000 {
+			compatible = "apple,t8015-nvme-ans2";
+			reg = <0x2 0x59cc0000 0x0 0x40000>,
+				<0x2 0x59d20000 0x0 0x2000>;
+			reg-names = "nvme", "ans";
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 270 IRQ_TYPE_LEVEL_HIGH>;
+			mboxes = <&ans_mbox>;
+			apple,sart = <&sart>;
+			power-domains = <&ps_ans2>, <&ps_pcie>;
+			power-domain-names = "ans", "apcie0";
+			resets = <&ps_ans2>;
+		};
 	};
 
 	timer {

-- 
2.51.0

