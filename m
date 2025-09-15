Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E9E21D3D9
	for <asahi@lists.linux.dev>; Mon, 15 Sep 2025 01:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757901177; cv=none; b=RL9tTh3xi7BFeDT0lO4wgy3iICXwm7OVVQQDBu/+gDxzEDbn8DhSWldd7sQ4plvE62KAxV9csI/UfcjyiEpa3c6Tehgfp2Q/i3pdUIcHhwQZhpjQLbapXywOFW5HxWRcGKAoDVHdEJH0iF3zg7M03uygtIRCKGA9HavruYHNTLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757901177; c=relaxed/simple;
	bh=hIWxj9zV2KpfWd9HN2GYWeuxu7uVsrIcQRAZP2bkNnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dJPPrI6ni7GIjMv6zcmIOnGLbLB0p7DtUz5CvUD1DCclmGksh5ivCmn/LTrcSnIpE5ZOqrx69vHcbVuUYk2esckZjbMdwfnD0YAmR3wbJ2IVPmXxNLbJKxvywnDxXBp+Aix3lEClwbucvmshnshvSWbv4Y+XiwV3u732qP3h5fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d92ZoDbI; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d92ZoDbI"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-26058a9e3b5so10490495ad.2
        for <asahi@lists.linux.dev>; Sun, 14 Sep 2025 18:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757901175; x=1758505975; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lKauwi606JW76n+c/E/TFgwwggsMIGS0qNvVRFiPKQ=;
        b=d92ZoDbIND7+eMHdbxJUZOir7A4oeeH5QeYf1cgnLQg9wG4TbGyarA/qsDX4+eQ4bc
         4f15MlRnA7b1/Didp45RxA/V736gaz9gkesZAfXcyEUi3TVeqXIpprFqiya/WDGiE/8Z
         rstJ/JUvz8Y7haheKmc+jGc4TZqoLD7iTDpi85NDERllrZU/PeSVPD48R4EHrsB+jq/D
         YRXLWScyhI/kKZjootNvv2WV+DYl/ctKjdeCYjZBas5rK9cAz7FSMjA+XFvJVUMEb8+3
         sCxkcJAyi6d7DmekkIbbWOLhrluSha1hEeI8YhUpfsH8VgtnCg+DVIAbQgkw2rtKUeeE
         jIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757901175; x=1758505975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4lKauwi606JW76n+c/E/TFgwwggsMIGS0qNvVRFiPKQ=;
        b=KwU+mMCytpWh/Rqir9X6lkuqtfi9Jt1DpI+QESV+6SCawV40iHY09HpIRr8MMDt5dg
         7pUCQm8Rox6u8fGZfAmgzZKYvTl35H0ewAke6cSVl6t49lELWQOQEYM1PcxYufi8u3Ju
         XQtW71QV/17U6Wn1RkH7vgW86qCKeHfj/0rdLk8HXhPsMquvNqrs0cQS+KNHs0GuMLmx
         /NUvZWgB2WDYlquth3dp5Ng/WsqAEnZHC5KHWcCd0/fcN8HWdJw9Nge+RMkPiRVR/Ihu
         pfZ08uKE/nKSU4SxcYhzUc3Xk4IErzchCvkmmwB3z8XbI+MWcvTk2495qVt62veNdff7
         hRwA==
X-Gm-Message-State: AOJu0YzIYW9v5TCJXxap9jUlMiaeWE2kfPujXzlNltSTaEiZbjoJyLRA
	Sk68uImUzBYiIf28Z/R6J9dz4wFvTwqWjbBevyLCFjuMksfQghnmC8bB
X-Gm-Gg: ASbGncsU/VV/qNlRg8ntCEFFzZlmhLmiJGmoi7To+Vckon5rXc6dD3UBhYAtcpTs0ZO
	2WJdjppXyTzFYO24aGzbCFPyLx5WYwNo2i7yN77OfCZC670Cv7Vrf4h/mRiRuTdJ0Ma/oyyhGtx
	Vd9lHC9TP+A6EGSZeHXRiZs919AEpY8nXNZ6L1Gxsokjnb1WKP8ksdusTJ3QsDAMb/KOY6Yl/sK
	c8NOkk6p+5D7Z/FAIrpnFviEPy8v2/nI2XlaBxnfBWJlg/4bFV4R5c5mAGR8dR5pf2HGLkKZeft
	xky7NOEGZ6/Z7JRfagxGvNHL1dVj0D/mXzNhYf2jyMQ0LQhuDM6eW1B6EsnluEnudsaS5AGCXQk
	oSGqQHcShRtL3n7Hs6eaXZt/dfW0jy97Z6sY=
X-Google-Smtp-Source: AGHT+IHWuYTbEVpZyLJS7fo2wvFisOiIUIQdPnNoSbXPJNsFdx7r09O0spNATU/bO9TcPnESAwBMXA==
X-Received: by 2002:a17:903:19cc:b0:24c:cb22:8221 with SMTP id d9443c01a7336-25d243efcacmr120111695ad.3.1757901175108;
        Sun, 14 Sep 2025 18:52:55 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-262df893ec5sm41565255ad.46.2025.09.14.18.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 18:52:54 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 15 Sep 2025 09:52:24 +0800
Subject: [PATCH v4 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-t8015-spmi-v4-1-758620b5f2ae@gmail.com>
References: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
In-Reply-To: <20250915-t8015-spmi-v4-0-758620b5f2ae@gmail.com>
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=982; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=hIWxj9zV2KpfWd9HN2GYWeuxu7uVsrIcQRAZP2bkNnA=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBox3Fw0lI+FDkxbVsnvMxk4d6qhiOLERJV93n27
 tRJib2kXUCJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaMdxcAAKCRABygi3psUI
 JJvvEACoCQwgoPlFXhCu6aP1Yzfukrb4xs2OuMeTleGduVEcbjvhnY7+8noTnDVwUxB9QjHDQJ8
 cXdwqikO3XMly1/8zAbFzYc/UlWhNitGrKvG7HVP8Hp1xZmdPzl0hYKzrNq1/pk2fwIYNaTF1Ng
 9I4sj7rSjOxUT77j0KDQO35Lw8c1IiZX7rDN5gGrDAHhOwUZa3GvSMRStssqPMeOeIhXMJssO6N
 XuRglKBrjfXCq/YnM6OeJkAiJ0iAl5Tn1cUvkpI4VB1Aavoy0KPIdc1dF/ad3Gn4LoI2WGcXd05
 /fkRoAihhT+BUuoWw1ljYwCB4/tsScaBLTT4R10+iArSkGo4ZO+pohJ4rDpEfEkhoggMbvAmnU4
 6TcKbaGKCgeZmAIVxvbENvknuebGJgYEKO3zQVEpqPVUkwRue9PFdP8q+VDH/wXT54hEhxNEWFO
 2RQ0g4pu+17+L9iGf/mhqdjze3xjHY3IMAPrgxlr8t5P9UD35TDTx/iX3RPZ95AkUlLyC43SrkV
 ipe5Nm0TP9qGqsGEY3/N/oM+0w0R14mTV+J8L6118du7GWmbQdHtk0mLx1EHHoKrZP/tylT1V6X
 ucju8hHM5S4Rv78omdfawQeCBwiyaSOhJaM84vjHkiY4paUHrGpIAfSDrvD/BtVr532U2Cys4IQ
 q/8pFvmjRLnyvcA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
existing driver for t8103's spmi so add their compatibles.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
index dbf09ad0ecdecab82074344aa6a840a820bc448a..ba524f1eb7049dc5ba7c5f83f734d3f2f7e905b3 100644
--- a/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
+++ b/Documentation/devicetree/bindings/spmi/apple,spmi.yaml
@@ -18,7 +18,10 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: apple,t6020-spmi
+          - enum:
+              - apple,t6020-spmi
+              - apple,t8012-spmi
+              - apple,t8015-spmi
           - const: apple,t8103-spmi
       - items:
           - enum:

-- 
2.51.0

