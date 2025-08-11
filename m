Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9461946DF
	for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 13:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754920454; cv=none; b=KS0vPIHfSC8rsk9qRxKu6L/l2FtIwKyVfNU2IL8P0pgpfZPJYVcuMk8kq0MECj6iwfLHKVhmO20pqIotcGN4afs5iMfVW9n0ZKatBSdVtvf4D0+T9elria6RevuD0pB2xQOm4zSjZwHUg1i8eP4gmLayRwlWA0QVOZIlasXNfIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754920454; c=relaxed/simple;
	bh=9HAo2qif7NcILZ/7noC4GfpbcMRkxTO9P77K8AEkp7A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o43qwOdphwMMf8V9cr9KDR0emrFO3OXkXJPjF3u6HvK6lYMQWVi5nws2Y+bs4NWrNt311p20nd1bfrHykFjulb8HuROZSMC+UWaoZe6kPRVw0YwrSOahcOal8aOMxJ6fVOHoXu47HBf6wzAfpe6KGN0jVGe7SfRcXLZSerXqsLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/Mz91yC; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/Mz91yC"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23fd91f2f8bso31337695ad.3
        for <asahi@lists.linux.dev>; Mon, 11 Aug 2025 06:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920452; x=1755525252; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGKMtQ+STHWX745bXtM33YEEtXLhlCq2s0TbaL9pJps=;
        b=N/Mz91yCy+LtqWJsi6eHXJ0jzcKm5OfDPU5TVmzP//hTUtrfjT+M0RvIhail2+I3cJ
         58a82m5zGUv4eaFmnw2bFi4Ws4IG/9JTE2jZ/SUzSwtlj4h0IzGpHp7DPcaDwrqqKDzA
         UUgFZqq10Riyyr0OhwbZBPcCHRvfqXFPxOrdUY5f8GewusK/qTP0hGel8C+tNsHV85N9
         lxHCEmCp4En2gjYZ8zl8zJaDyJ4tx8P0w2nJX8Du7x4z9yaL/Yf4/0MtRLNACpqunY/t
         wfrNzVMa70cZhrLFvEzfSjgScUBXFitVxHirKxj9Q8N7ATiBDhpfs1h4mXMsaaEIHxng
         sbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920452; x=1755525252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YGKMtQ+STHWX745bXtM33YEEtXLhlCq2s0TbaL9pJps=;
        b=vUG9RSElr/wrN56Rh4lNVjcgLT1E3Kpq35X1VPNCwuW7YzcQDQP8AzI5XosmEdT4Bb
         YsdNSP7sVymNMxskECu+agnFdDWwObOc5+tfshqA/iSH2Fr8FsHsjiKLRfuAjaBCZowv
         HKhvcek8bG9Bn0V4o7Ynd16jiNZMGOps+7NDQhkZz+HJfromZoYCJ9/d2El+EaKtu6yO
         CIdp4oNmBWq8TOyI1Ktb76y4+YOFojzerLCvNPUVVfLhd9mPSadj46hKz1XtfnD60F6x
         UFC+CkBSmDay18umijCYqrpeDsLvRXuSQpwL3HPzUHeqgX9zUe3BnaKLivAjRMVd+xqV
         sHlQ==
X-Gm-Message-State: AOJu0YwQFvUDAGo7LY3qvIq8Af6lwmLTMzxtsK8g+fp1HJw+18vbcZXX
	Qz0efNkNkkQtOkhuOKzvl588ni340H3c0ICzXetEmk2dng+9VOTyRd9R
X-Gm-Gg: ASbGncsSpzl0ZzJNUfhYprl8yxXkkMdniloTLwTe1akUOEk69NZLkUBxlmXfSv9jG3Q
	DKaCDLbNROW8WVSQZTxTs8MDUo3cDkS78UCKgM7Y9DK11y0WC1KEDGnRLKh1z6ZMYbZtgN7jFm3
	LpGajAS/82Z2agobZ6qOM7EVHb8xP5z+lgULTpC1zXpQ8Wzt4ONXnseFfVxPPVS3h9RVWylO8Kb
	+Q+QESBXQZSoASxTvt+qma23moGzodQLjH0+7xhfLRaA6QEo6SYj1Pd/gzrQeR+FN+w2xKe+kGd
	s30G7KnuocZC6Ak885bTyutaRlOCcJ4wiwW+XZWK4UZlPtThoIAULvffN1muVvfhRSkJo1KNt0m
	3f3Nzv6NDM8o5ZVdB2/5mIPG1Yg3/YModwRr9NvE3vKcmRho=
X-Google-Smtp-Source: AGHT+IEIZ1XBxPcTymwBYPPzyBCGW0yUeeVKd+RPAU+9jNiS+qis3B21Ff4YXGCY5xSPEvrFPxt0qQ==
X-Received: by 2002:a17:903:1987:b0:242:abc2:7f32 with SMTP id d9443c01a7336-242c1fdc798mr171527345ad.3.1754920452155;
        Mon, 11 Aug 2025 06:54:12 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-241e899d272sm272976285ad.135.2025.08.11.06.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:54:11 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 11 Aug 2025 21:53:55 +0800
Subject: [PATCH v2 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-t8015-spmi-v2-1-a291acf0d469@gmail.com>
References: <20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com>
In-Reply-To: <20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=952; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=9HAo2qif7NcILZ/7noC4GfpbcMRkxTO9P77K8AEkp7A=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfX7zpLvmxW6s7UUY89esgb/8NQNOYxgktyEQ
 CIi3YkAfR6JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn1+wAKCRABygi3psUI
 JHyLEACfcKHMzV7MaDy5yhlGO0zb7Qmbh/EE9jV7lEBsA6WUdpVKEYudEZKG7frX7YqluWR2rrl
 JKJAOu9bbzMV0r+8x4fDc/pOSP4i9rL+ZPXcA0r/0MHCPIxSBbiAYWdu8N67QxNyGQb8ksvzgxy
 3VCVf25yoMTJ4NYKyPm/mLsna3A0XrYdPkPD5nwlof6Hk670AivzxmagJUFeZVXls7NK+nDg5g6
 9Y1Pem/ZRkF4//k+SfxXf8iG3WgboJt6B9UcitWYXqDi1D4of2RzBtfUAUlPDLSoIY2vcjHjWAG
 utKhXlWsHYGFoXsmoevSOtpEEGPuuKlFbEYCsoVDSwCLoFSoo5VThZIU814WiuBrLCOcEHEI1cI
 JDEXRGKaDMDDHxJrLZzHz2TX1RLpHz2xpppGBV9ytOt6Og04Pci+WnYR8K7d2CHv9OIMBq1Cftf
 C/KOa8z7oa+jVMfaGpv0f9NihDGP+LW/cg798sLv13g/d5Fdmb445S7XPcFKWQ1wAPfbyHUo6lE
 L3SpaiILTtDs76SU9RQY3V0pxiU1x9aZZ4VVPk4dDFgK9GwB62ttCk8D4/BGSBYg43El06fla5P
 ijtMF6YpEycsEBGi42THgas0zGp9ahkZKtDHkAg8bhQAFEqufiTEkITpjJm40DQF2Rl3UG2vLE7
 B1HP2s+pMXkRhaw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
existing driver so add their compatibles.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Sven Peter <sven@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index 16bd7eb2b7af2c0b176f0e5b1970f4670af691da..e3aa248c0326c36bb0307e8aad4025b1bc05540a 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -18,6 +18,8 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,t8012-spmi
+          - apple,t8015-spmi
           - apple,t8103-spmi
           - apple,t6000-spmi
           - apple,t8112-spmi

-- 
2.50.1

