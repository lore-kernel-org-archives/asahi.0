Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D38C2D3A69
	for <asahi@lists.linux.dev>; Mon, 25 Aug 2025 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113373; cv=none; b=CwVWLI0eTeqe4Ieb+7QD7ICEDcTVBBFeCe2M+g4ragQsGO0GXNppuT6AQm/TvCL/CFqywCn6Y0/1adc4rHwhPOa1hm95YpIx7NIByMemiPXfRHB2Vel1DGHcLQTZK5IGoR9pJKZaBTQbQG/Ew565Pf/8VZ77HvauOCYWPJNcjfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113373; c=relaxed/simple;
	bh=bGe3lHrFEExwJaoIxfgSlWjKRZ1MiKpscWSHgaSU79Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pRKk6dAFuIGgkg20SxYf7E9ZqUOaA3UJVUnudALwAGGwvRtClmcSxNYqhBAVYuyyDa/OtReBO9vSNRLvP7JwOGuzbO3wZiRtztW/r6XhGS29/i9G6J6NKumtbZGWS1tGsoquWeOwB9e76jVQR/oO8gEcNzI3HyeLrjoGqbCpPEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nhummVtx; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nhummVtx"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2449978aceaso28647305ad.2
        for <asahi@lists.linux.dev>; Mon, 25 Aug 2025 02:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756113372; x=1756718172; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtjFp+37deP+qcyMingdWbOCwQKbGl67hntF9ZyCbl8=;
        b=nhummVtxszcr8oDm3cl5y1L9c/fLQNF5sCJZNZKobZCQPjA9GGHJ8WL4I3CQcX/j23
         o6axSCgUKLsWG3g1usw6HBI4CsKUWJ4JE/k/i/6SdqWZpEwZtFzevj6gn6b1Aq1GPoJG
         iMNLcaa3UDcBS+eyZXXd2ofUv4aGBoJwhQWjzAl8qQT4mu1wluHLlDqz6dfXXo5lMFWB
         jC+oVsMfAzldsvpl49B3ZIo3OhuyOCwMSfk5Sz5eL+Rg48JX6NcrhXhRApecyVTsNW9S
         kLviUv4zJcCDPFsKJvIOjnxtULraMPCsBfJwRa9IDSygEH/SaFAL+f4mz9bwFIcfYILC
         /EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113372; x=1756718172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KtjFp+37deP+qcyMingdWbOCwQKbGl67hntF9ZyCbl8=;
        b=DWPJ/+sKHIm9BH5Z40PCErE43a+FLZ0sT/+cd2ul9PLQIkaWZzYQKg9XYiY4f4Ndzr
         sZlCL6mPN8J4ZQsm2sIYO1dFO55FrJ2da5A6pCLIXknIbphNYAy/iq2MqKPnne6eCP8e
         H4n0EF4pjT3EcroBLC9iEgN0lb6ahUjj3XkaOZHU/spbgOopFHPm95av1Lzy2pMvrM6Y
         w23Yca4Wbd2wMBLCEWIL5ZnmoSWFJ4Hyb4L1DuEjbNysJEDktDSoBot4sUd/AN6oTP5S
         LdIarWkx+HoOkU9lBhQMjauYsnbJAqfuAOunpN+folpG2oWfk1Rj+4Urt6m7wspjllPo
         eAEA==
X-Gm-Message-State: AOJu0YwVlT2kszYXVSwvdaUPb00zzn9afPcLskaOsLqgNGUlCm8wc3Z5
	IOfiWredJQ87132iBbZD9KjT5JB4euaCRjTjEEeMgo/O7x+3Sf5u5kXR
X-Gm-Gg: ASbGnctVdyUVKjToIU6fejbfi0R1H5uj+TmORz2rSAHnPw2irjSggNr/IjTBbprVr8k
	JVvnD9vgy3c0cuA04Nk0uZyeJROqd15BP/XrI1/P2qj9pa209o53hc2wA+VBHcSo3yOc0lSxxcs
	DiTTOZAXQWvlKacXohC/96PNUm53L0edWwYRzpdg94XlhT7fH0vrijA/sedG/p3TN5n3m1J+7Mc
	e7B92QN6moKAHyBGU6HmhnAqwYgW+gPEz+mCJOnXLB4E0Ez8nK1F8OZQjOsDVejiX27ZW4XbTdz
	8iEPx9arvYSYAbJF9sEh3bslQLON7Fxr1aWaWNh4UPu//BsZmnClwGJOikVkb0VQnTQSW0I63dR
	/F7qzN5sBPCyZ3WUjHT4kCvOOyFiG3AgQE4EQzw==
X-Google-Smtp-Source: AGHT+IF4/e+c9KPSdTDMcNdsLzyEg0pIQO80fJt35j/c/EQiaTLu5Fs4DEVRakhW7pq5lO2LcmBS0A==
X-Received: by 2002:a17:903:40d1:b0:246:d00b:4ae3 with SMTP id d9443c01a7336-246d00b549dmr33462425ad.61.1756113371622;
        Mon, 25 Aug 2025 02:16:11 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2466887fc8dsm62873875ad.122.2025.08.25.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 02:16:11 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 25 Aug 2025 17:15:04 +0800
Subject: [PATCH v4 1/4] dt-bindings: nvme: apple,nvme-ans: Add Apple A11
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-t8015-nvme-v4-1-6ffc8f891b6e@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=bGe3lHrFEExwJaoIxfgSlWjKRZ1MiKpscWSHgaSU79Y=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBorCnRRlvaE1w45hp8w+1EdsAIb8vul/MWpn6CY
 /kNXwesAeKJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaKwp0QAKCRABygi3psUI
 JEzuEAC2TMVz3DGV6ukw1ucnN5hJu5mTHBu4Ncp+n7bj2ByuWZ6dFArojJXcFBs60ihtFtLLbG6
 800iDleo3mVFngAS4fGuPMBfjKZdMAZE67+ErnTamwUipTCW7igb8A9yuPQeFFjJDE8fUd7SA/1
 Jc0/yiyLm4MNnUPuXuHyvnOTbRWZMuableg/SlSbqYZnaWwPyQAI/v9k9M1LC68wp6Pz0nJ7lag
 9JkM4gbvt0Nc//Rov2phSzZnYUE9BLaaogCo7m1QEtLlf8TISP35plxevBeK/Zlowc4p/AdLWAq
 qadzU4c5PYHedjIfIbuk3SvazoC9nJK3ZOGBvRBD7k6kENFnqRGwDpjRFQu5Az3RzL6qq0svpKg
 F89UjE4RdSndyy0itOO3pI9oKyOEWI3LdK9l9fSDT6VeEuDM76DLcuTMdFqfYTXikM9py5/v20Y
 OXY301j4fuCN3PEaAVV25pIHHSqG8z3532ce5Ijmi72J5V75d1tUBXGCS3cql4vf5IjGhmNx7Fm
 Kk0UKy2GhWLbgJ8mt92b/giaq/kxeI/c7OQLJNizjXDqedaaWV+pbkbsaj6HxYc0V7m7+mLl/dG
 LYqg0ANnheFUTn+ML/uVpcebFDszlNtMUP1YotMT94RkGsOhwQulR/T9u4isP3rydo6yBH7hPTD
 SniWNkdxz8exiAg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

Add ANS2 NVMe bindings for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../devicetree/bindings/nvme/apple,nvme-ans.yaml          | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
index fc6555724e1858e8a16f6750302ff0ad9c4e5b88..4127d7b0a0f066fd0e144b32d1b676e3406b9d5a 100644
--- a/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
+++ b/Documentation/devicetree/bindings/nvme/apple,nvme-ans.yaml
@@ -11,12 +11,14 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - apple,t8103-nvme-ans2
-          - apple,t8112-nvme-ans2
-          - apple,t6000-nvme-ans2
-      - const: apple,nvme-ans2
+    oneOf:
+      - const: apple,t8015-nvme-ans2
+      - items:
+          - enum:
+              - apple,t8103-nvme-ans2
+              - apple,t8112-nvme-ans2
+              - apple,t6000-nvme-ans2
+          - const: apple,nvme-ans2
 
   reg:
     items:
@@ -67,6 +69,7 @@ if:
     compatible:
       contains:
         enum:
+          - apple,t8015-nvme-ans2
           - apple,t8103-nvme-ans2
           - apple,t8112-nvme-ans2
 then:

-- 
2.51.0

