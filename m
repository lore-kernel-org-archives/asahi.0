Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC77C29AB11
	for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 13:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749563160; cv=none; b=HflNQQhUHFQieQaUO5fd9BxrXN6t6dHrUIkrTR8ONOkQDevjPu89raoeeOVCNtbIjwuv2aspfYPdK7dMvfUAkKdM2bngUDAaRQGMUnQr2hqLmWJ73HA/xXd3voq4I3aBAUkZdxOmaGhvMyUlClVUxuxyJwOdYuHGQAOk631XcW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749563160; c=relaxed/simple;
	bh=/Aqo6eZT8yO3l/bSFL2DWbLRnUJ/G9BOeA6amkvZLD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p46csxwuG2qREx1Cc1MxhAOm7IBAgf+3QW4DDoSrE7fwDi2Lq4UteA75MIaY+u1JB3zpu91KQko6oCEK9z3cK5arw+j/b6UoKU2ymFmyW7fvWWIx2zNFYrlnGuWezZNiMYJ8d4/7ElqFKtFPn4o+4Hb6stqkP55dskQo2fT+c6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKvAAZSS; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKvAAZSS"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b2fa3957661so1941926a12.2
        for <asahi@lists.linux.dev>; Tue, 10 Jun 2025 06:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563158; x=1750167958; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiSre9WglDpmIK4O0YsNl0nRwFB834XrXov3VRpC0FA=;
        b=NKvAAZSSQEYU6/VjYCs434UDCNwOoZ9qBz+P4kpkJ5T+1mO2x0KgmHM3nozP6BxM/C
         oPD7FFsJ3B8SOrHV/7Jbe95stKcG7EgC2TJGXaTEGmZmJh65Jo5NTtRnAHw2cK7yoENq
         UYCSs6fizJmka9b9OvrVR6mrmKKYF2JA/qTs6JzxV+zKVkWQcFSXTIevaL3RPbFh6l2b
         X2szCFCbxPrwYZOFBW5C/3OVYboGGK2OsHA6HHkTa4Z7dwaLo6Ej5HmvD+c+Ed68N5V3
         Tzx9JnbhduTRf/NjSHRsrM36m9G9+xtIw6azUaZkivm2xbvODht3n/OLrv5FY7pihSkn
         Gk7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563158; x=1750167958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiSre9WglDpmIK4O0YsNl0nRwFB834XrXov3VRpC0FA=;
        b=EkLR1HARPgH4Pnl0Y2O2X0MIUDafT2z39YoutRxY8pi9cTWw5ittbkMWQL1vkjM/L4
         p81XFRDFR3DzQ4z3VBIamKeIKRRQGWvvdlxDdXRI8o2rnyu5TzjX6JVyy/fDCRYLRoha
         ralUo1WO74Wq02hLQwqtzdRUHiWqHimbe9Kvb3Dmv8Xy3YlMesKsFYrKJC8pXMOI73Uo
         tpUTtOrxzSqPyfuN5rXotxk1tkbDG0XzAAVWi2wv2pNbl5LN2zZhCWTj71EnBkupeMPA
         2+QgHAc8ShQkAfgdP7VtsI+kKh07z81JxMprgs3UfeG55mjOmVdrn4sh7Cj2o35Tn0vZ
         ze5g==
X-Gm-Message-State: AOJu0YzPKTKdPusPuzUtiBlE8+BXN9oW0BPvP1B1X8CAu5kj4HfnCMi2
	PjKLJLlaPL7K7coBMIZlB1j1vsVb7uwKVbHFZPP9tmzB3Fos4WPnzWLMP7dbHg==
X-Gm-Gg: ASbGncspTfMiBqFzm3Rh/EaBPNW9JQk0qao7eeAPrQi6RqoUZdpmVqyKmA3h4GCZfOW
	2+mR+H4M67Z6/U9omfMDydGJcbVoT+OMblRjLcj5NfAxTCQpIHhdEPizIjq70lwbeH6fTfPVioN
	v/kdbTvehnanGTmfiq29PLuiBpvwRM5E0IkF9xw2anXCzjHEcC5FheWQJhDxPd2ap2CGOZdANce
	/TASs7JzS+abH22jnWPRTvx38oum7spMekKE0cxelH6nWD+QCG9DXigLNuOY6HhK4BeNEkDswEs
	OXQAdQLoolsmqf3jZQd+9mSsqAE5MNEROgIiKQhIhSvzg+Nyybi5CE2xYcq7Z4mB
X-Google-Smtp-Source: AGHT+IEPves9Z9ZVq/mhz6mgJlmIUE39OoniHpiNwnWv3yeacikEIo4HPGvzJFKEY0HfioUekMexVA==
X-Received: by 2002:a17:90b:1dc1:b0:312:e9bd:5d37 with SMTP id 98e67ed59e1d1-313472b5a14mr24196363a91.6.1749563157475;
        Tue, 10 Jun 2025 06:45:57 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:57 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:20 +0800
Subject: [PATCH v2 1/9] dt-bindings: i2c: apple,i2c: Document Apple A7-A11,
 T2 compatibles
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
In-Reply-To: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=959; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=/Aqo6eZT8yO3l/bSFL2DWbLRnUJ/G9BOeA6amkvZLD0=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcLMj5ZKRfP6FDNrg/uoHt0VE03NHDCCsm/L
 tjy7gyFgTGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3CwAKCRABygi3psUI
 JON+D/9mWe1wzDkLw5zxCc17gmi0oLsWgTp/gp4uIg7bRtRXS2I8RHG3l15Ne96FHKoIVpycAsS
 Pm6XUB3Q4j7RgkL1X7IDSkzaJNK/nV67mFAuF7LtR6DQ/dqhniNCCzQt/3osg9oMYBPwBl400A9
 hdYDWAneazlwNY0LU6UQYdE1y2a0wv5V8QEpib6iW8V5C1CpmCE/BC9X9o63x78K38UAnLIr2qR
 8NygF5muZixISiWMFY73C3UpfxH/4paxsnqGJ0SiexIucrhKfGV7oEvHPYL+UlBYKeRsHrxNJ7B
 ooCaaDzNhzbKCcmTd6pMNrunOvoz+0OnA2OHT8F6im5h6Bz5hForG2hwBdi5jY29KE2wkBMJArX
 gJDJ2Mr95ON9GJuRra5EwENT/zJVTHsyPzDr/fe1GLgyDHhGXv1j937k4lNKJXsWlWtQOigxNzR
 c/Jjl5mgiUQA/x3nRh/jN8PGl47MAQvOvp3IVmgmSOl7yOO0K+6KSzIQny5dzs7HcNTik28NfwZ
 hNLHp8fNGqEuXlGN5K2qds1wvnubCOM3tvrjFS02nbDJbc06ybYjXSHx4Ud0PUuYrMmdXPem8Fa
 H7CDbAdAyxBaV4n4oHyWBTxIvfB2Nilu5711+drKFj8tUFhLkQ/HoqH3JtvuHZl3F1fdX8XpxB+
 Fn+WFJk5dw9uSkQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

The I2C controllers found on Apple A7-A11, T2 SoCs are compatible with
the existing driver so add their per-SoC compatibles.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index 077d2a539c832ea8dbf28d2f9b436cbee6fb5d8c..fed3e1b8c43f67b8f5a19e5c1e046b0e17ab8017 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-i2c
+          - apple,t7000-i2c
+          - apple,s8000-i2c
+          - apple,t8010-i2c
+          - apple,t8015-i2c
           - apple,t8103-i2c
           - apple,t8112-i2c
           - apple,t6000-i2c

-- 
2.49.0

