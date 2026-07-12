Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8E739A7F2
	for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783849483; cv=none; b=YgcMk7m6xrJCjFefjIv8tNiBzuwTfSMxr2y6pmXFkDFPibpoD97uuWRUEyAE4rBcn/ToG1/MoyQb3pI2t0pRaW8fTToJu1NEVybocNQw3nBwocloouiOXYhfEqG67TPk2Q19lbPY8GeAwnusVkEH0Z9hJW+qNn7eqRxt69lq9zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783849483; c=relaxed/simple;
	bh=uEOX/VWb2IzaqOqmoZJ5LrpiOfc1OnKwSpPs8c3o0oI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SaKl5a1C1SOaF6Ek7gCcoAljPfsgPbIdiUnIDRuwQQ2JlZUgTXxJiylBwiFFY17nyVaKCmfpWVWqKr7Pjfw1NmlRAL+C/TpGXhR6n2PC6Haxwz0VOhHLNRWATzkVuCg382589hfFj8nxnffr7PeXovtajVHknF5RJQ56Ell4bMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=io09uPA3; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="io09uPA3"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38dcbade417so659637a91.1
        for <asahi@lists.linux.dev>; Sun, 12 Jul 2026 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783849481; x=1784454281; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52kZejFtRxHWJh8aWpxhVLVG7ppdIETUdLQgRUaIxpA=;
        b=io09uPA35wP2J413h2/pAZTN/TZHZ6A4aKLUjxyGsRGbZxJ/CMcclQuKikXFCZUo/m
         Y8YPMUcIyqYD4/XYf/4kobqSngqyNU9SbkBzvef7t9fDF5yZ/oPLEEAHrb4odcKwImqN
         Wvuq8rnqXk5YkWKxpL1HLxwecCpKmD67RpJ8UZnKxlVS6vnk1SC6iLn6TzTmFHP8jLDU
         d6dqZEIv7lKWqmYURr3TIGRDa7teKYHV9eEJaOABPY9KK0zbwNlz5I/jHdZQMKIUV84N
         0F5IoPxJZx82XG6cKb63VqrwGOvhLRv9zdqLeQYcZZ3fz9stwlSlKUaQyovIG9TTLwF+
         7oHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783849481; x=1784454281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52kZejFtRxHWJh8aWpxhVLVG7ppdIETUdLQgRUaIxpA=;
        b=c4urCeHKyhaGg+odMu8d5tl7EU56jq7NmKCiTPcGkAUXH8puQA+uOk8Xl8kvxNaAmL
         Ph+C6kcbGXeYQa6VQRAEfnEzYp9FUlt/qDJWe/vcblCcehuc4q1FI+eHa4tXaLKnPSiR
         +b559kt7fdiMWOpFQFK9Cs8dskbccaHjYQP1CbyKGjZoSz+YeXgNTGORQllKudxcsWlC
         KXbOu3jyEFDLICAPiPNTQtzEuhVAszMn/OpQUp++iLEBzTUFpdq3JMQkr5QA7rnDSC4R
         aw1ygz/L66KHx5Y9x84WUHOjh9ShHu86nzHXbI6SqCSHKryDigqMJ0rAfmeaUp9a+CLp
         CGuw==
X-Gm-Message-State: AOJu0Yx4wG6hIke9wS9gfOCC2gA7QJObVrkEdDyup5fehQNk5oKIVZ8z
	/JDiZl7SGEDSyI0txfByzVNZgXWnM5kYG2FemE/lzpsuUVlKtJOnP+Q6
X-Gm-Gg: AfdE7cmm4vOUcNwhizhwaTCryNOuLEdgUOzw1T9iqf8Uyqu+ynrJy2VaGVPZy94tTBB
	GFRFuXPWi4ne24VdFy2DK2dhCEl37m9x/ji42z4uRqeijjnaAaHQKdq4Pr5a38HQg4aHrSokjyB
	mbe2blTst3J26h0Tnb2omkqCnD9iXSU+fBAZpHEDG1SwLkz/jDddLfgMoYhAx0QXsiySe9UFgTB
	nP6fGkt5WXLESdKubZM3T4MSjbbhF6gqx2NRLcY2I/LpjNudqMMOCam5/obRolKOAMjiswCH31U
	0EDljAKSv1p5XohMbHYci+p8XV4W0huQl2EbacO7muKhtL0FyFnS3/NPbdK2dpyBwY+aB564s+N
	hn9AmTmWgte4hCrqU761Zz7Ck6awasbDkz9oLv7RSYUqTyxg52MBG5lk6lSQihuw850kltP1Lr4
	LJDhRJa3cnsvqdAADbSEPf2t0S2taTPAZxx9trJjzw/pAesnX3vE59F85+md9TEj+l5nR8oW9Is
	W1WfYWzhjLFZXQe6Hw1U/1G9nh3Mmkthzzf4XQtqQjCGTw1tLt7CfKPJCkVhnwi1GI7GI6JslU=
X-Received: by 2002:a17:90b:4c49:b0:36a:fcf5:64d2 with SMTP id 98e67ed59e1d1-38dc7746cc8mr4828993a91.16.1783849481403;
        Sun, 12 Jul 2026 02:44:41 -0700 (PDT)
Received: from [10.160.6.73] ([119.17.57.186])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm15268919eec.29.2026.07.12.02.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 02:44:40 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 12 Jul 2026 19:43:26 +1000
Subject: [PATCH 07/12] arm64: dts: apple: t8112: Add common SMC hwmon
 sensors
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260712-smc-subdev-dt-v1-7-7763006d57c7@gmail.com>
References: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
In-Reply-To: <20260712-smc-subdev-dt-v1-0-7763006d57c7@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=535;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=uEOX/VWb2IzaqOqmoZJ5LrpiOfc1OnKwSpPs8c3o0oI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnBiU83XUyxXtrjffrOH4blFz3+dJ5itpSIbfHf774jK
 N62Ib++YyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNUN2YwM16bLi4su1ty1Ni9+9pLDthrMhvNd9qctL29X2lXz6ofZNYb/odfNpv9
 gnC2TskDzzcKgr5c1p+3ddSrM4g8r84KUne9vcwAA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon sensors common to all SoCs

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 arch/arm64/boot/dts/apple/t8112.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index a3241c816c26..ec248ca052cb 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -1289,3 +1289,4 @@ port03: pci@3,0 {
 };
 
 #include "t8112-pmgr.dtsi"
+#include "hwmon-common.dtsi"

-- 
2.55.0

