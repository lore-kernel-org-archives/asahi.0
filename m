Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9161F2D4B6D
	for <asahi@lists.linux.dev>; Mon, 25 Aug 2025 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113388; cv=none; b=tO4BeVvCViIFNRqLW+MKX+Exh5YrWv8zZfdNcTw9Wkxo4L695RY8OBuWxXAaW9u+89zJh722dTPxPFfAepR+Zw5evQBxGKaxBLaXilgX8eC8ik0PY8A44HRIHlQ1LUAQomTVR5eUAI75IEKT+5Q6x0yjynQi6Be4iTwnDdz85kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113388; c=relaxed/simple;
	bh=n0GU3aHOIbzcpxdfkfvKoQ2JdbUFCoeF/xHA7QnVC2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gJiD5IkNdn5PatZ/Cl2OLSLgDzP0uVl0zii0ijLKQVaqUP3xRK8BWHWAESV3+Kbofr4hlHCJaA0mFensLwrELksalEpDiEpkHxhdLmMPHNlOQxgNM8/0dq7RC821gugpvgKgJrmHYfX/0iyRaYXRI41JqxaG3SCro7z0LXcjJuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=avXPC+wC; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="avXPC+wC"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-24639fbdd87so19711595ad.1
        for <asahi@lists.linux.dev>; Mon, 25 Aug 2025 02:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756113386; x=1756718186; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLgKkUt/EORHceeO89abTN08otZovq/goeI6WeVPzj4=;
        b=avXPC+wCfcxbtW91gEEejD0IdeHjwnNjcrIwekqtwsHmLaHi6UDZC8PciOS8R/MdFJ
         J50aYswJiAhS39m5E/yDiSTXd9BZGDCmmoGNGa26jcK2DWO/r5ZoloBtHyWfUfCilkKM
         IoGp/RFUqtUB/aVFAQsHl5wPEJ5jwSQO9MNpgObNzc+uKK1q610ZWHEprqEetZSt1fpY
         VgSIUtuDrLLiLP7wNXGAS9X9l3Yn98TU20qIa20Fn1aWEoNa2UWRrnBo59APzSheiB+r
         UzXjs/yG9BcrEZcmjr/piBUIotiixuCnPWHZDOMYpiP1ulQ6BkVGbPBtRmSEWIizuMWV
         kRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113386; x=1756718186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CLgKkUt/EORHceeO89abTN08otZovq/goeI6WeVPzj4=;
        b=kmIBoW6L6Q+xLjav8ODtQNyw3993iOUppGBqD1Tyqk51jUbf0HZJ6DYViahLGHTCMD
         NON65x6RlYZmvRY2ycd+PAYBGC2S5OBTXs5kNMxQQJft3Vr2MY8JPY9dQ1QH/dm1BBo9
         7n2hGNFnCs2U0WKAZN7wcHde+aEYEyFHt4wDLQJG/elXre6cxWbXhtPZsoleA2WS5akU
         gUiGKKVxe8f3N47pr2XxCOQcV+7+EWFbC83M8UGsySpvWvQjseJbSI5au6V9idb+c30y
         SefKsmmnYHvYeyBc3KHuIF9MmpsibXui+1HG2g/e3S5rM8HopTxl1IXvI6lzlnwZ/fPF
         fCSg==
X-Gm-Message-State: AOJu0YxKBStofMuz5y2yuGjoZnSTih/THcm03aVfRkU6TKmo+dD530qH
	iBomfBoad0hZLJAC6jIey72hkQ8EOIT3tyQyYH5wxrvxkphql6kYw/w0
X-Gm-Gg: ASbGnctAZ4eYgb7HNjy+j7Ag/zOXPD7ckZUkQf8fOOGFKWU927w7N5kCp0kuQWR3pwd
	aoCnRFPMgKu1ib7/8c01t5lU8aS/cqqohknLBHBWaZl/eZXmDs/OQ0Kan3tnNT2ATKp9C0po2FH
	LkF9UUelXAzlMQlE+LiXSQSLs3KaZOw7FClxuAEQEFwsqGNxfk3nDb98tIEeh2vDhYXjPRSuIuJ
	xJQNeAaVn2PGacoqCXpUvP3gVmcpmPnjHma4ObbZ4C6PudLOuLraabRhyGnARduitJOe18mJrb2
	SeoFjjLA5xEcKQ6nj8bPgGwoFF+gk+9pYEOzhXyz/TkKOJf3Q/4uagcJmnSS6cdwxH/V7sewJct
	v9gqXLnoq1GqY89mHW1+W0Vkin6E=
X-Google-Smtp-Source: AGHT+IHgizChUVDS7mx0qvkliQW47KxLTLpcVKppDYz0nFP6cUthwlUhWYvTA6G9L8vEDxCRdxjvFQ==
X-Received: by 2002:a17:902:e888:b0:240:4d19:8774 with SMTP id d9443c01a7336-24633d6a31amr135180055ad.24.1756113385707;
        Mon, 25 Aug 2025 02:16:25 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2466887fc8dsm62873875ad.122.2025.08.25.02.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:16:25 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 25 Aug 2025 17:15:07 +0800
Subject: [PATCH v4 4/4] arm64: dts: apple: t8015: Add NVMe nodes
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-t8015-nvme-v4-4-6ffc8f891b6e@gmail.com>
References: <20250825-t8015-nvme-v4-0-6ffc8f891b6e@gmail.com>
In-Reply-To: <20250825-t8015-nvme-v4-0-6ffc8f891b6e@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBorCnSx5G1CCbpODc4cRGWNpyxqthUZtzEbbGT/
 r5lqX9uaO2JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaKwp0gAKCRABygi3psUI
 JD3zEAC08M/q+crYeSCt61tg18W8wh96uLThiPK1oIN8cT6sza82FbzzE5tZz/JAkuOxmeDT1Jr
 /TniRuMWHcR1ABZzQxNSzoTEO4kDKwoVl01F7A9eG3xSG1hMcoBpFOefCD5ZJwKsBJPSkJazMy3
 Uq0MfkxY4vsMHJVTCxXczUZySYl1MGa81GLOqKcR6LsfzsGWbolmfH4Bvlrv63vGBd6i2uKMNSy
 fdK46uREg0LZfa4l+E2LsjiNk1Lvk/Ovb1qje+vjYfqB16/DJDGiUk1IJC1q1J8iLBJouyfYiyI
 upg9pcjsYb3xsOMcPmXcyI7W33LjCjhHYkXcBBaugqQ+7HoAL0CjS4Cuw879KYuOvHDYAnOofXX
 zgHTKr4XwyWQVB2Hd/pHthOiIc0D7OkpdL3314KaflUBRiL4obg5fFz0/bSdKCIiaUM6pLMrvi6
 QI4FyM/whrJYY1u8pstsdOD4XjPronxD/nneGpr2t/2PPPe9M+Mysse3MPo8XTSvv2x+fujb0Pt
 XXqVoAUsgTBLN+3i8QipITSrYbBSLnf71cWLXHNaq7ybKg8dwvWq/861T9M74mlfROH3n1XyuuW
 0+ijxGn5++G6PNnwvO6tlJDjihhJtLhSTijTfaQiQ4gNYR6XRlruP1e+rSTQUO+CCN9dSvktcMM
 QAlh8/SxgKhfv6Q==
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

