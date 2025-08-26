Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B82D03375AF
	for <asahi@lists.linux.dev>; Tue, 26 Aug 2025 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756210201; cv=none; b=RuX+scBKJ7RemmQQXyXPUaI7wfk4V1j9fquqhGRsbpaM316K8RH7jK4bv9ksm/QXOVQ9ix7q1y+BEsxxbTuej+vEHs6/E1Ofx+R/YI/UHXDA0KFfqexwLatydjd1L2v72nWgwB9qJg5NlXtkCg20m5kdB8O+sQUEJkVfJDUtVHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756210201; c=relaxed/simple;
	bh=CYNjF9OQgn4g6Ftiuun6/MohBcP92VmI1C5IHAHtgWs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mjT8+o04xWvgBK7WE1xu4bpX+sV17ET+giuh+TosutXIFlW687FoMs8A7TrVHDUqZhfcVGZ6k8Mc97J1wA+7db/emL6r8YNKdONhN4rha3Xk9VTj6jSHvKsbcHPOlakQTBeL596MyG3NVITCFDRntgfcwm+vIbJYvZJbByytmMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brHhtyU4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brHhtyU4"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2445826fd9dso69077665ad.3
        for <asahi@lists.linux.dev>; Tue, 26 Aug 2025 05:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756210199; x=1756814999; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Te1xVrQgzDBuz4rdm+oAY4F74VBZ8yuKiz2U07Pbv64=;
        b=brHhtyU4OKJO7QmxccsLKb/KjTMpOniDILFvsXYxr3I12Dn9xrotMU0Rgj88DFHDzE
         7wnojFCHXPXHDTfx/SgUr2Ng5Y6NJGx/pWhN8wl+tH62pq/bydKE5PP+cXlw6AhV2RE1
         hLxd9UgaUjF79zxSriX/J2I+lH2mJKjJNV4fAGbEz6hJ4BmMRQcQXY3tpJ8HO+QIyvVp
         pQVYed26QbFy3oIYex5BIcmv3Zp/sj/xIQDQv1cXu0dx7W5ybCL9hpGLjWvw1xoEEPJg
         I8EGwSKSaM46BbpzvR2GVkjUezViDrXbSguAwYg4ztITZZGFThqeqgQTmfqUsynyyEok
         kiAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756210199; x=1756814999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Te1xVrQgzDBuz4rdm+oAY4F74VBZ8yuKiz2U07Pbv64=;
        b=V+9B9ecUIAWMGwAYdHdwfn0tuLCBJ6nK11FaiRpfgn/hBZPrJytCGvORsG3KF4hZrp
         J2vRi2dd8pNPBbMHk9CN5RV4cZdcayaq0aECjYkMdTOLZrzXO82K4uVZM9g5UMABplVr
         kXKevmfdAoTUvkytDpZ/54i/KAPHnqZ9qtPCmUVghMGMO8k2ko3PF59jwt0HRiveBl0A
         HCtdK6URg+nJIlD/X7mLKb+eeo2/rlQIThndqYX7QN8Gg/lWC8/Nsm+xxFfLRtgeEEzV
         eSRuc8lE/BYfuEpcl90te84349sLMxpScmFvwwN9EHmtnT7uSFQEf5baJ5LpoCcMRHaw
         TiUw==
X-Gm-Message-State: AOJu0YwwhsaQjyraaivh7mPDPIMfl00Qb4LbJ3jEw5l6sABbIdXRdBjI
	krv7B8VJc+IS7vCacJTv3H97d9VQy8nPk3kkkDHoPbjAjzNMs73mNzgk
X-Gm-Gg: ASbGncs5NYCuyFi4rgYJFhnC+TfStxaQ//JdSMaSHBM8q4drnCCzxwoK5lvEmWfjZST
	iXqTcLC69jiJtMJVZJlCfOaOYqH64l6FuvnEUuEvhMnggJf2D5z/kYCslo0k+TqDTpxzzqimaAF
	NhmAcOYkKtfWjggsjx6cxPXHXERPG9WOYzkibRXSsn14QLXEtCAb5DdrTg9/r1OTFvySdbGGK/k
	8riqgjZI+WSI3PA0eLvWPEtrKIQMxz3a+x8a3GVyNFh0Y+bNwpmEzJYFjag+zr+C2+E0iXb+XWz
	xw2ZmDfuOHdHnLRyEoXFyGABmKi9oAhIbGiVp9W9nDQWOm6rHCx6BqqEQDdRUBcMHOwMN4WeR/b
	gA+KIwL73cfTnv4w+W4BpcU0wZmzrsdoD0iunkA==
X-Google-Smtp-Source: AGHT+IHtj4KgXbSqTdwrJl0C85JLO/ylMqNOyyNdi7uTUtfGcZME4gs+kyz2KM5t0aJF8T2+RPr03g==
X-Received: by 2002:a17:902:f543:b0:246:7a11:3775 with SMTP id d9443c01a7336-2467a113b1amr133955215ad.48.1756210198844;
        Tue, 26 Aug 2025 05:09:58 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-327565d3924sm619966a91.13.2025.08.26.05.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 05:09:58 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 26 Aug 2025 20:09:14 +0800
Subject: [PATCH v5 3/4] arm64: dts: apple: t8015: Fix PCIE power domains
 dependencies
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-t8015-nvme-v5-3-caee6ab00144@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=798; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=CYNjF9OQgn4g6Ftiuun6/MohBcP92VmI1C5IHAHtgWs=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoraQDxO7Qv1fzxL96zHeJ8UWQtZ+jverp0LMZr
 KDDOuHgJf6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaK2kAwAKCRABygi3psUI
 JEkwD/0QJJHfCREZw30/LgHOOZhIwxNN9/ncVeXksoFKhfe1XdfT0CTUV/5MqsZPYXRLEi5D90X
 c4b5Tg14SjloONpUPd4fFzx2pi6atWQ2KVETMATFdRbeA9D3hdnkAk5wo7K1NP8cKUHkreo+aH6
 OH/UZFBjr8Fi4ZQ55UHa8Y8nX/PHoXPpZd/0+g98pkIVrMdzcWRYnci9x5aKBF4dfryLJLytW9Z
 pLn2C/VEsZJAxWe4QZZ4KTcGAZAsVkf4ytvpi5S8NG3PNT5GiTemz5rc0oPz/otK6DS2NY6s3C0
 G3rGendudRTzg0AJRAoJmPNXqt5cN6Kt/7S+lGpRJV3avH2gDq2UPyxkHwK1cnrliUmec4WxOyx
 stFLRy1di10g8esevDN97RpmiC3NNSn5yJ1Xc7wsBl73EafjB3fytXW2HgkcypoZ090NlcgNRY/
 8N5bZaPuoLkWJkkfiqViehHAI6Si6k3w21NldiUzoaqegH+3OJS/LlMMPAEd5OUQNxpc06nRGR9
 nvWM2W+V8zZjQ8lyDpsj7V+wU0snKxVysRfkmkEUfhLCP5yEl2NQVKu5OMj+5tsA/cenjWLGst+
 rF59G0fy6vX+I/1vNQDwenNZMiHDFp6vX/1q6G65UQxxovLzQ6zqFmlwSQbPsofCaShSfAZXOsN
 7HK+Nk3zVoCnoPQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Fix the dependency topology of PCIE power domain nodes, as required by ANS2
NVME controller.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8015-pmgr.dtsi b/arch/arm64/boot/dts/apple/t8015-pmgr.dtsi
index e238c2d2732f7944dc1f984a4eb647ba212b9ea5..1d8da9c7863e5b7a732888342de9d481f309edd8 100644
--- a/arch/arm64/boot/dts/apple/t8015-pmgr.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015-pmgr.dtsi
@@ -658,6 +658,7 @@ ps_pcie: power-controller@80318 {
 		#power-domain-cells = <0>;
 		#reset-cells = <0>;
 		label = "pcie";
+		power-domains = <&ps_pcie_aux>, <&ps_pcie_direct>, <&ps_pcie_ref>;
 	};
 
 	ps_pcie_aux: power-controller@80320 {

-- 
2.51.0

