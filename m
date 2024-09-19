Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DAB11CA1
	for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726762555; cv=none; b=seGUQsB0BmW+5fINtl43swzePc5Ni/xzp/F4bLcCx6BeC+j3TKf0uvDFjwcUArcAOL6cUpIgdrHTrkoAXeT5UXgNVl0sW2+h4oEa4vvdsr46++xcqd780YCna/Obd/M0y5c6cMhVcF6zhjlFl0Vj2mMAOevp+amkXi3ceqh6+Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726762555; c=relaxed/simple;
	bh=2Mi+LQsk6H7sTtNS7ssIED2QfrpMgi0n72ImYqupLZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=smidmfpVd8g1OwZ7Ll5JgUBUNr+wmEtVZ2ZBRSc/DLvCAVaMMdgFLj+9cbzvTdFz8GzZrNq7Wb535AR6yqmac9qKUQgS9QtC14AtHVIYshVbbQhKaBSkhrp3/V4upw2cqYa8f3iQy5FL06Pbo19oDMwvQSEEt/i6OngVwEgcsHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHemS364; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHemS364"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7db299608e7so761481a12.1
        for <asahi@lists.linux.dev>; Thu, 19 Sep 2024 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726762554; x=1727367354; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMRF9THVps1AR5ry5FdaXMrI1EoOSY731ai3zz91BDE=;
        b=HHemS3647SUlD3PIMSaX4lwFnAMui4i8NwaPB8mQUp/uGq09gnKE5KGViNVQzEvMkR
         gvB+EtEEVVGIxQ6qz9++IpsTZnn0jqstZ1XCUHJ3bsVAKW9G7vbGF+VxCfKwpjE3hsVi
         lyfk2TWd9iyBR+BN12Fk05zlK99hZc3e9K7qapCcQzWn/TbTwYt62wXW41P2+Wj9BodY
         QPtyDajgN38skWT4jSlQ7SLxInUQ2wTBvAeZ01eoA2d0cdkve16v5AxwHEA4Nsu5cYtS
         WZfj4eiYmyRUJ0tyuutXD4L2BRcOtafzIo2RkrpAulKje7DRXWoxg2Ji61YJG1GeDnz8
         kKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726762554; x=1727367354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMRF9THVps1AR5ry5FdaXMrI1EoOSY731ai3zz91BDE=;
        b=uEZSfJ1/136gUgonQPJvoeQwVw8FjiXCRWxyxbP98KJx4B86Yb/3KngCgS1Kd+clIK
         XSACP5eqO/l70A4daISnKiPX20OfTrKEfHri05/rK4aMG3vV24vYLAnjJATLrXzhzlzP
         mO2sMrbAFRGS5mxsDQxEAHaI64SaEVy/51gip9WnJot5utwYmcbG2EsrW9SgT0drwJHz
         Ati/xAaG7MdaKfSv9DvOG3Q5E1+djI4bC76v+BJHDad7yKgXk3XbIyc6JTpmzORbT0Qd
         Egb7+Y4PSZT35jmFZT964GaoNA790dWROZZsepY6gZMDqJwvq9sLlIqXUz8VbTABeTuQ
         mmeA==
X-Forwarded-Encrypted: i=1; AJvYcCUo8iY4xxdFEUCbhC3+0xcxDlXvnN5AGxXhYHnfBw+IkPzWDh8X5M9CmO5piy4x7Hf6dESLyg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHauZ6T94o64ZzkLbivkSTx3r4s3mPOuaZv3OtJgL7Clcfibqb
	VhoDSA2KfznPEwxmKGt/w8eCkz/l9qGdSHq+vCjufKMRAC3p1D4W
X-Google-Smtp-Source: AGHT+IF0XHT66Vo7/4btQeV8A++naOulHbnvfn96p7hTaP6pPukyueHMCyiuas7nD6oscxYX3DwmGg==
X-Received: by 2002:a17:90a:740a:b0:2c9:649c:5e08 with SMTP id 98e67ed59e1d1-2dd57f8163bmr9034958a91.15.1726762553766;
        Thu, 19 Sep 2024 09:15:53 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-2dd6eed1865sm2084674a91.34.2024.09.19.09.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 09:15:53 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Cc: konradybcio@kernel.org,
	ivo.ivanov.ivanov1@gmail.com,
	towinchenmi@gmail.com
Subject: [PATCH v4 03/20] dt-bindings: pinctrl: apple,pinctrl: Add A7-A11 compatibles
Date: Fri, 20 Sep 2024 00:05:52 +0800
Message-ID: <20240919161443.10340-4-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240919161443.10340-1-towinchenmi@gmail.com>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: asahi@lists.linux.dev
List-Id: <asahi.lists.linux.dev>
List-Subscribe: <mailto:asahi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:asahi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The blocks found on Apple's A7-A11 SoCs are compatible with the existing
driver so add their per-SoC compatibles.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
index 9c07935919ea..63737d858944 100644
--- a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
@@ -18,6 +18,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-pinctrl
+          - apple,t7000-pinctrl
+          - apple,s8000-pinctrl
+          - apple,t8010-pinctrl
+          - apple,t8015-pinctrl
           - apple,t8103-pinctrl
           - apple,t8112-pinctrl
           - apple,t6000-pinctrl
-- 
2.46.0

