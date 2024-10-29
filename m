Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3540A22094
	for <asahi@lists.linux.dev>; Tue, 29 Oct 2024 01:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730163981; cv=none; b=ndaiG2yHUVKx5YpsVBjwf1fJ+6WwtTbHEahHp2GZIts9yA2Hgji4fY8bVyzmoP1hCKja3eG4OaD1w85Q13tIsZLm51m2lRA/8/pkOoDBOhQ1KpW005l6vbimQwX4ZTw2YJMyD4fMAhXzrRDmFWGdrw78u9wHI7f5KLnvj4gOiuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730163981; c=relaxed/simple;
	bh=5y7ODK2Dk9vouU8KGrTXpnUReHKWZ2Ru6W9u6WOuE3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HBKNyrk9uka3Zt0997VWHk/VWyXkFJP4zSlB3Gh6MrE786YRJrNrelCQvkQiai2bx3Kon/x5RPjmAkHn+cUobNurvabr/vWzrBcpen2FTCJacftdsmEboKpm33Jrf14mx7jbracWQlYHRevnEICU9qMAe4s471x6bcwZY4x+K5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VheSIpqA; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VheSIpqA"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c767a9c50so43210535ad.1
        for <asahi@lists.linux.dev>; Mon, 28 Oct 2024 18:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730163979; x=1730768779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ykES3oDK4GWMgcJf+eyKS9L0HXbi9j2qtJXcGhbmlY=;
        b=VheSIpqAVePSZchhbGSmzWDyyvGkAAVFsOx1QfwjQUIbP13NBdkV0U7EPPnVB5Id/r
         CK3K7010nyuT7xKfW9v8nT6NVDWPwdoht+saKp6O0Bs52qT05tX6QZc6RUXljJoB2pc1
         DRchQ5H4RjDp9nJgHdw+s+sWzAlZMuLb2Je0Fg/b8zyBHo5QDQBinAiyopf3EJ2uhGFB
         Vm7Gz/+LBqCCTkINsV53246DNi4Jg2k1IPz1X/jvVadcsRoxxSCwfOFxaF0h8ytKlABw
         9j8OAXdEb3H8ARvJOPFV14CVHFLYlDcMNBmArtLTnl0q0gx88I26lMC+9KtdP/brqCPy
         5B1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730163979; x=1730768779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ykES3oDK4GWMgcJf+eyKS9L0HXbi9j2qtJXcGhbmlY=;
        b=ScVrkRrqp5HL75k/ED+uvtkSW/0u14DR3UQJOcgYMJjXvnp4wru0CWDSBYr+1WOK6q
         kZqo5m8I9pBPgSkcE515c8YmlIxBEQd4JgDZvDFKjwOLIty/tJBl2iwV2DjSoGnSK23J
         9nv4KpbknrdsJwMnqWQ1en53p2L0TwQV4ScNG9i5zdkIa+PC9no3zlltu+e4ziy/Mm2G
         wOirZO55GiUNgdGB2u8bCuEvahEdeuFbYMGwIghIOLWxMp9w3LqKS1FmVFDmytyy2XgL
         mVVgg2XzVa4fBfHyYTzAQ3ZklLH0upaBJiDejr8niP+Cp/FffRV7ks2V7MeBz8eBKpoO
         SJTg==
X-Forwarded-Encrypted: i=1; AJvYcCVXMHhzSo5P+jW9DbsAQuTFwhnTo9xAum8z9o78xEt4LKE1fBA78wUhKv/i/O7qpvk8YPWgnA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxdBEXjMHbiNRYmhW/LHTTyaljFawchd7WONHTN0k2bbl2Mr845
	hYp8w90FE80QTiCl3aZ87PRl/ZBRgCbwl9wWv4vTT1NItiHgWxSO
X-Google-Smtp-Source: AGHT+IFeHXHCcPoPLxySF2I8zRYb1t19CJOoicaN/3KR7j3X8ouOCXsEGoLKx9fWFvaUXkzRPg/WQw==
X-Received: by 2002:a17:903:41cf:b0:20b:51b0:4b22 with SMTP id d9443c01a7336-210c6c8f84fmr120951455ad.47.1730163979437;
        Mon, 28 Oct 2024 18:06:19 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-210bc02efb1sm56306225ad.221.2024.10.28.18.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:06:18 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH asahi-soc/dt 01/10] dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
Date: Tue, 29 Oct 2024 09:03:59 +0800
Message-ID: <20241029010526.42052-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241029010526.42052-1-towinchenmi@gmail.com>
References: <20241029010526.42052-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
index 673277a7a224..5001f4d5a0dc 100644
--- a/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
+++ b/Documentation/devicetree/bindings/arm/apple/apple,pmgr.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr
+          - apple,t7000-pmgr
+          - apple,s8000-pmgr
+          - apple,t8010-pmgr
+          - apple,t8015-pmgr
           - apple,t8103-pmgr
           - apple,t8112-pmgr
           - apple,t6000-pmgr
-- 
2.47.0

