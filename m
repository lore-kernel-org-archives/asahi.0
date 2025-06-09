Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93952153D8
	for <asahi@lists.linux.dev>; Mon,  9 Jun 2025 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481204; cv=none; b=eLYY10kYPc/JLwTeMGlYI55mTg4uhIT50ARU1b4zxE7DdNpX0fCYvynrUPmwA9Z72mBfFbirsqkj2rGl3EpK0C5bm6zVvLd1J5qjnehqC0Oa+xpclYu0aP+24u+t9FNNsDZ3GmqXx4iMQTokDH/E/yhUf/QkAyU/qUCkX4f22dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481204; c=relaxed/simple;
	bh=PV7pE5dMBWkFx+09DLMIQbO1nXOreHSRyJXi4QVzwpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OI+uKaV6yYB54Or6GevRzCsJ+4UtIIoN3kO6wG9w6S76T9CrM1wRwmKTm198le5Nvj966edtgqwxP8LZNQ2/bEFwCcmIUNtXyxdLtPAy8Ng1vUwIurpLBawDevgBhMHch2ligcm8eWTeOcw64LVAZO4upT0j83CbUw/hCgTdFIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5NWkNBT; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5NWkNBT"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso3495635b3a.2
        for <asahi@lists.linux.dev>; Mon, 09 Jun 2025 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481202; x=1750086002; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=We79xSATZryd3PrxaJd1l/KZAbqX/U4R8F+x+ZK497k=;
        b=P5NWkNBTghlzf+6HlvZCyC+1vxsMDtgz9GZpeZz9wFUVGANyjGkz5yVd54Uv6WSJMq
         iC97TNrtJxANtpCSzGYyk9Y6vVhRYYK0DKaX7rBm29Hd/mt6vsTlLKC2eRJneTUJmyfd
         6eRVKdRUMvQrzEIh+kJH4+RBzPaUULwhR+EW/ogsFsOXc1DHCY319XJgzfCmZsr5bUj+
         SnLUtTr+eR9AIxxwL9qmi8FuFljraUKe+pWG6f2WzoYuslTyWlmvqdftFAc4X57I3ksf
         My2vyF8LLNN4kkkXO3CoTjQNDumHvKVxRc4Z3U4diPuHN+2gfvsuJoPvIEyi+sgBJ3YE
         s9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481202; x=1750086002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=We79xSATZryd3PrxaJd1l/KZAbqX/U4R8F+x+ZK497k=;
        b=XOuh8TAtUReeyohyb7w29EHVjfIAJRFo2BOhxTRWr2VogdiwC9M4rJWolxMVUOrcMs
         lELZy4HzacRqNFrpTcDR+7vyq7tsozTjw7i+Coo1nrcz+hbrn2NhD3NptvkG9xedRDlZ
         /y7P53kdhxOhysOEhGlp9c4kmmF2JGCWo15JEBmc57InxERjqxc0ZN/ViEYC1KGRI4l/
         1GG0TAXLVmo59L/znBKXM+mwo5wBES2hu3v0kdWQ9dMhIDtBItGO7iC4bSpyHTrkgx6C
         +XjoeOzcKhSJjglA8PhxhLeWkMCvl3APThmLo2tp0WHhHmrKLxclmWto+h/X30QOyMR9
         5JYw==
X-Gm-Message-State: AOJu0YwaoVE1Z+EKRKVUq+jNDTEGeBW6XpG5Elbvm5pqo12KuMOJj+iC
	DbjmsPA+vNmNNwsg6g4bzdwJ2NjPVW0wBujsu8+GRkNgo61QB55Vl2wu
X-Gm-Gg: ASbGnct5PH7Bc/pjaFXSPXkT9dt+w61PKtQ7DGkjgC1UIDMZyp8Uh71SGKRqMS840nO
	HB3DfSspMVvP1hkWludlmvUGnDQDkr87L9bl6I1UqYeXnWuT7cVMfkABmN0HYmku2Ka1eeN0vJ3
	41fIGdzAi9AbcwJFWaJMcjomlHFOdh+w0Bp/nJwFUFtV6/Rm0n7sPWO3RNZzQHw5CcWFmrNnRvZ
	MryXaHVcZOFtLu5/oXo2FthuByGpFEurWcIuvC8fqzSyjbft/lyjbBPQBjWgkg9YwWIvgmcHNIz
	8MUv/De1D/4pWK9yVxK6PZdMecIkGoOp/sMNMnUdIEh+B0uorthIhGunyHy3pjH7
X-Google-Smtp-Source: AGHT+IGV2BGzzy6R/WMt4MsmQhW4tg+O2U+Kfqh52ETZGaR5pStKS0SKC3g3z0CgKS7hq4xQjozMAg==
X-Received: by 2002:a05:6a00:4605:b0:748:3a1a:ba86 with SMTP id d2e1a72fcca58-7483a1ad217mr10125395b3a.11.1749481202023;
        Mon, 09 Jun 2025 08:00:02 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7482b0ec4aasm5988402b3a.171.2025.06.09.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:00:01 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Mon, 09 Jun 2025 22:59:40 +0800
Subject: [PATCH 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250609-t8015-spmi-v1-1-b3c55ad01491@gmail.com>
References: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
In-Reply-To: <20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=862; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=PV7pE5dMBWkFx+09DLMIQbO1nXOreHSRyJXi4QVzwpg=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoRvbrSXzpPSc4U1Y/S7t3cPsOVs/amNx26hwSC
 75fHAZry1mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEb26wAKCRABygi3psUI
 JIDMEACtoNdBzyO/GML08ZRArDDdSgEyneMLwlJDBB8tfUOL8HgSVn0uDhK8i2+T3FtlNaKLCr+
 98Yevr4qNVc1xGwqjlbu08du5erfEiO8hPxiYob9zpbWr0RBekkKyGTj9ZHL1sd33xZKqEXGIJm
 oaV4B8L94MTsr2LHCqiY1yzY7EFjlLbgkfS9I3apVSst/9xdg9Y4+myUMPD00tO7Ca8NiM1XZ7W
 t35Z1vGSM2BsAlh/p6UJ3fQMqlE0+OnAEC1c4EGqo7oKYeQQDGqT7P8R65nQsVK5rt3yZJYnrmf
 6SodzMx0yiTPYx6ag3Xzo6kEsS211aDSZbeUp5Xo3KBjKogz3jngtz9hs6ZJGcF+KHUscdvpwPJ
 tEPklT4+Xl6sfDE/VZMSnkGXjGzNmTp76NIBgcPmsUrI4P6u5XkgvtTe5RL3QwqgeFTkkS3VLVp
 pB6Ua5eDtEGc1V3Syj9w1F0qeIXg6sEEcVK6lEp1wlkIemlHE92zJAmcZwDLaytBAxxa/fe0O0B
 chCB+X9P9u9dCnXXH6wkVX8k2zDVOxbOuVZxZf79fdlBzWdGrnVgu6dsQFaPBqj/5ZY2pcQVrTX
 KbpL1Hzadb5WV7oNSt5O7z2NOvrHCCFDPEem5oIhDBOspPXvHitN6Cxmh0HB8+SPaWd1c8kAUh+
 7QPNvOF3YH1z2cw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824

The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
existing driver so add their compatibles.

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
2.49.0

