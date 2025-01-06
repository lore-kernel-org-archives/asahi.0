Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BA41DE2A4
	for <asahi@lists.linux.dev>; Mon,  6 Jan 2025 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736166511; cv=none; b=S62gQ7tjOm8Okt1gDMDJF84RPJQNAjJ7mHSTnhYzpMdlE4AJhFOBt0jqe7DYL1M5cKVWmiOhAounlgkccLpqf9G98IIz+eFYowLj03oq0VAHSK90mDfNhxnCoyo77QTP1mbFOR1enJLV86YOKKBmVtdDo+E2Qkp7zd3sQfhz+wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736166511; c=relaxed/simple;
	bh=6pZiuvJaNtb/CqZdgPcO1kRdrv9vQuk8hv7BwCYOsp0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HsySyH+eHFLEQ09BSU/rxiofTBvCu9eI7Lklj8UQmcnB5RWwkbmlWmUIp/MrI5ugakv38Uns1xU2toDLaFBbHHc7okTrny0qSmrVlH/hs0ZRt6JOY0JqkfR/5hiwsqE4SsQKZAhs97E6BxdPNc8DZVvLcazcIXgoMDuWVnwjoxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLu6/pon; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLu6/pon"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216281bc30fso236165425ad.0
        for <asahi@lists.linux.dev>; Mon, 06 Jan 2025 04:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736166509; x=1736771309; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=;
        b=bLu6/ponpVL6tnjVWgQaVZJ/AMEKly5BjAoc1jfaQksVMBt64kKfc2rDveCFBrqiHh
         g1p2Vmd2QrtcYj+83NeGgdrwXN0nBx+g4hT2p3Ck1XiqgmmS1/KqwlrpvbFRIdv7nGxe
         xndUWBVzvwlL1XpEq+FQNL3NDy9C7U3cxiuOEEg4RLDmV80TiGQSl5+Is2f2hLP7a3hF
         0F4L8RtsbDYVJKD69aRMligXHlBCYYe4k3FIhcvFwL6AFIjtNA9aMfqFMZANNHq7l5Uc
         3QvdqRlbKIdvMdCZss5uRVy0z3HEN8tTB7Xsw6gNfkU9J1Vga1BVyEw3F5l1hvFnzIEO
         126Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736166509; x=1736771309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hebD8ipCbzY7nEzua8g0Qgmxl+l/xC/PNKeirRiQP54=;
        b=MmdZu4F86+BFgTPPfglMpUbjNtbZ3x0Vc4+vR8pXBYFiOmDdjm8EzXWjOp+d939D17
         rOueGJ/V8K4SZMhbS+x+FFNEQ6W9j1Tek3S04SbNWZvyJobkg5J0FEPpxNvTQw/q6QrW
         ix7N67yMifH/u5+sjH+NFnBfBnNhiB6uWtw5CoqSQFjqikwRkJfvAVW0Y+30EQRMMaRM
         tpDZ4BmRdCY1p8WrD8bfZxOnlmGx69hQlaWJbSO9qJJw0oYNGQdspawErrf+GnW64Rdw
         Kf+PrEGomd/WSW7WsbIAfG52g+K7paFcBcqS/ud4chBiNmP7CY9P00+zSTdKBaOEksgZ
         72bw==
X-Forwarded-Encrypted: i=1; AJvYcCUOVse+ZTsrElubBFpV/pucy3tz400UX9s7eeqbKLbrGEh0x3ekdCKRlgDSBHDs5syMfXSpOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGsNZGRhaYVA5rwRbUqu9RWflq5tE+4B9Uxr36DKrb/ujtCbOS
	a3OGf4jReIE1Q6zSmqYTYcvRLPdDTiAtbW6Gc/uZOT9e+pMUd84Bltay7gi270M=
X-Gm-Gg: ASbGncvEYUWx+sFGHiGC2L7rG/XyT/W0VvbYS4v/0+JNsFJOCg+8xIiLNpMfIWNXjzz
	j5viowPdC3+aeKJo4CvLabkSSfZpCB9iTdps4WpsG8Bjy0wRk2qLMcFOIAFaA3fIqz1s7c9qXre
	58ZBFe7e0a2rcjrrAEmVkEdMzO9TFSOazlPFPil7jfECARVxoWtAs6+k04K1ml4zpbhZq9BADxO
	jdEQKr9kXai9oZfOe8IgyUrPlmyofxh9SHX6gX4MozAmVbDCzTZ6PWIJg==
X-Google-Smtp-Source: AGHT+IGK/a2otNoJBSUFPmEsal05bTWWTM0YgOYKrBNNi4sCLMU+2e6MoH9+e2N2Iz9mR02EfXWhYw==
X-Received: by 2002:a17:902:da8e:b0:215:b058:28a5 with SMTP id d9443c01a7336-219e6ea2855mr779330195ad.18.1736166508697;
        Mon, 06 Jan 2025 04:28:28 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-219dc9650bcsm292678655ad.39.2025.01.06.04.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 04:28:28 -0800 (PST)
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
Cc: Nick Chan <towinchenmi@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>
Subject: [PATCH v7 02/11] dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11, T2 compatibles
Date: Mon,  6 Jan 2025 20:26:19 +0800
Message-ID: <20250106122805.31688-3-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106122805.31688-1-towinchenmi@gmail.com>
References: <20250106122805.31688-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatible.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Hector Martin <marcan@marcan.st>
Acked-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/power/apple,pmgr-pwrstate.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
index 59a6af735a21..6e9a670eaf56 100644
--- a/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
+++ b/Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml
@@ -31,6 +31,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pmgr-pwrstate
+          - apple,t7000-pmgr-pwrstate
+          - apple,s8000-pmgr-pwrstate
+          - apple,t8010-pmgr-pwrstate
+          - apple,t8015-pmgr-pwrstate
           - apple,t8103-pmgr-pwrstate
           - apple,t8112-pmgr-pwrstate
           - apple,t6000-pmgr-pwrstate
-- 
2.47.1

